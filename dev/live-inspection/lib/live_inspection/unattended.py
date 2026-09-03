from __future__ import annotations

import base64
import hashlib
import os
import re
import time
from dataclasses import asdict, dataclass, replace
from pathlib import Path
from typing import Callable

from .model import HarnessError, UnattendedStartup
from .state import GateResult, LogCursor, extract_gate_evidence


SOURCE_CLOCK_FUTURE_TOLERANCE_MS = 1_000


@dataclass(frozen=True)
class ProcessIdentity:
    pid: int
    process_group_id: int
    start_time_ticks: int


@dataclass(frozen=True)
class ReadinessIdentity:
    run_id: str
    save_name: str
    observer_id: str
    session_id: str
    payload_mode: str
    payload_id: str
    payload_checksum: str
    active_mod_ids: tuple[str, ...]
    expected_game_version: str = ""
    installed_game_version: str = ""


@dataclass(frozen=True)
class InputEvidence:
    display: str
    launcher_pid: int
    launcher_start_time_ticks: int
    window_pid: int
    window_start_time_ticks: int
    window_id: int
    window_title: str
    action: str
    action_count: int
    command_status: str
    delivery_status: str
    signature: str
    signature_age_seconds: float
    post_signature_settle_seconds: int
    action_completed_monotonic: float
    window_x: int
    window_y: int
    window_width: int
    window_height: int
    action_x: int
    action_y: int
    root_x: int
    root_y: int
    active_window_id: int
    focus_window_id: int
    pointer_window_id: int
    ready_screenshot: dict[str, object]
    post_action_screenshot: dict[str, object] | None = None
    button_press_monotonic: float | None = None
    button_press_wall_time_ns: int | None = None
    button_release_monotonic: float | None = None
    button_release_wall_time_ns: int | None = None
    button_hold_seconds: float | None = None
    action_completed_wall_time_ns: int | None = None
    pre_action_cursor: LogCursor | None = None
    readiness_identity: ReadinessIdentity | None = None
    signature_seen_monotonic: float | None = None
    signature_seen_wall_time_ns: int | None = None
    ready_screenshot_captured_wall_time_ns: int | None = None
    transition: str | None = None
    transition_latency_seconds: float | None = None
    transition_observation: dict[str, object] | None = None
    confirmation_identity: dict[str, object] | None = None
    rejected_transition: str | None = None
    rejected_transition_observation: dict[str, object] | None = None
    failure_reason: str | None = None
    readiness_evidence_journal: tuple[dict[str, object], ...] = ()


@dataclass(frozen=True)
class WindowSnapshot:
    window: object
    process: ProcessIdentity
    window_id: int
    title: str
    x: int
    y: int
    width: int
    height: int


@dataclass(frozen=True)
class X11Action:
    launcher: ProcessIdentity
    window: WindowSnapshot
    action_x: int
    action_y: int
    root_x: int
    root_y: int
    active_window_id: int
    focus_window_id: int
    pointer_window_id: int
    ready_screenshot: dict[str, object]
    post_action_screenshot: dict[str, object] | None
    button_press_monotonic: float | None
    button_press_wall_time_ns: int | None
    button_release_monotonic: float | None
    button_release_wall_time_ns: int | None
    button_hold_seconds: float | None
    pre_action_cursor: LogCursor
    action_completed_wall_time_ns: int


class StartupGateController:
    """A fail-closed, one-use XTEST boundary for the ordinary startup gate."""

    def __init__(
        self,
        policy: UnattendedStartup,
        *,
        clock: Callable[[], float] = time.monotonic,
        sleep: Callable[[float], None] = time.sleep,
        identity_reader: Callable[[int], ProcessIdentity] | None = None,
        wall_clock: Callable[[], int] = time.time_ns,
        click_hold_seconds: float = 0.08,
    ):
        self.policy = policy
        self.used = False
        self._clock = clock
        self._sleep = sleep
        self._identity_reader = identity_reader or self._read_process_identity
        self._wall_clock = wall_clock
        self._click_hold_seconds = click_hold_seconds

    def activate(
        self,
        *,
        launcher_pid: int,
        signature: str,
        signature_seen_at: float,
        signature_seen_wall_time_ns: int | None = None,
        readiness_capture: Callable[[int, int], dict[str, object]],
        post_action_capture: Callable[[int, int], dict[str, object]] | None = None,
        readiness_identity: ReadinessIdentity,
        pre_action_checkpoint: Callable[[], LogCursor],
    ) -> InputEvidence:
        if self.used:
            raise HarnessError("unattended startup input has already been used")
        if not self.policy.enabled or self.policy.max_actions != 1:
            raise HarnessError("unattended startup input is not authorized")
        if self.policy.action != "left-click":
            raise HarnessError("only the evidence-supported left-click startup action is authorized")
        display_name = os.environ.get("DISPLAY", "")
        if not display_name:
            raise HarnessError("DISPLAY is unset at unattended startup gate")

        launcher = self._identity_reader(launcher_pid)
        if launcher.process_group_id != launcher_pid:
            raise HarnessError("launcher is no longer the owned process-group leader")
        self._assert_signature_fresh(signature_seen_at)
        self.used = True
        self._sleep(self.policy.post_signature_settle_seconds)
        self._assert_signature_fresh(signature_seen_at)
        if self._identity_reader(launcher_pid) != launcher:
            raise HarnessError("launcher PID/start-time identity changed before startup action")

        action = self._activate_x11(
            display_name, launcher, readiness_capture, post_action_capture,
            lambda: self._assert_signature_fresh(signature_seen_at),
            pre_action_checkpoint,
        )
        completed_at = self._clock()
        age = completed_at - signature_seen_at
        if age < 0 or age > self.policy.signature_max_age_seconds:
            raise HarnessError(f"startup gate signature became stale before action completion ({age:.3f}s)")
        window = action.window
        return InputEvidence(
            display=display_name,
            launcher_pid=launcher.pid,
            launcher_start_time_ticks=launcher.start_time_ticks,
            window_pid=window.process.pid,
            window_start_time_ticks=window.process.start_time_ticks,
            window_id=window.window_id,
            window_title=window.title,
            action=self.policy.action,
            action_count=1,
            command_status="XTEST_EMITTED",
            delivery_status="PENDING_TRANSITION",
            signature=signature,
            signature_age_seconds=age,
            post_signature_settle_seconds=self.policy.post_signature_settle_seconds,
            action_completed_monotonic=completed_at,
            window_x=window.x,
            window_y=window.y,
            window_width=window.width,
            window_height=window.height,
            action_x=action.action_x,
            action_y=action.action_y,
            root_x=action.root_x,
            root_y=action.root_y,
            active_window_id=action.active_window_id,
            focus_window_id=action.focus_window_id,
            pointer_window_id=action.pointer_window_id,
            ready_screenshot=action.ready_screenshot,
            post_action_screenshot=action.post_action_screenshot,
            button_press_monotonic=action.button_press_monotonic,
            button_press_wall_time_ns=action.button_press_wall_time_ns,
            button_release_monotonic=action.button_release_monotonic,
            button_release_wall_time_ns=action.button_release_wall_time_ns,
            button_hold_seconds=action.button_hold_seconds,
            action_completed_wall_time_ns=action.action_completed_wall_time_ns,
            pre_action_cursor=action.pre_action_cursor,
            readiness_identity=readiness_identity,
            signature_seen_monotonic=signature_seen_at,
            signature_seen_wall_time_ns=signature_seen_wall_time_ns,
            ready_screenshot_captured_wall_time_ns=action.ready_screenshot.get(
                "captured_wall_time_ns"
            ) if isinstance(action.ready_screenshot, dict) else None,
        )

    @staticmethod
    def _best_effort_post_action_capture(
        capture: Callable[[int, int], dict[str, object]],
        width: int,
        height: int,
    ) -> dict[str, object]:
        try:
            return capture(width, height)
        except Exception as exc:
            return {
                "status": "UNAVAILABLE",
                "reason": f"post-action screenshot unavailable: {exc}",
                "path": "screenshots/post-action-startup-gate.png",
            }

    def _complete_click_cycle(
        self,
        connection,
        xtest,
        *,
        current: WindowSnapshot,
        root,
        active_atom,
        launcher: ProcessIdentity,
        ready_screenshot: dict[str, object],
        post_action_capture: Callable[[int, int], dict[str, object]] | None,
        assert_fresh: Callable[[], None],
        pre_action_checkpoint: Callable[[], LogCursor],
        action_x: int,
        action_y: int,
        root_x: int,
        root_y: int,
        active_window_id: int,
        focus_window_id: int,
        pointer_window_id: int,
        button_press,
        button_release,
        any_property_type,
    ) -> X11Action:
        press_emitted = False
        release_emitted = False
        button_press_monotonic = None
        button_press_wall_time_ns = None
        button_release_monotonic = None
        button_release_wall_time_ns = None
        try:
            button_press_monotonic = self._clock()
            button_press_wall_time_ns = self._wall_clock()
            xtest.fake_input(connection, button_press, 1)
            connection.sync()
            press_emitted = True
            self._sleep(self._click_hold_seconds)
            assert_fresh()
            verified_current, active_window_id, focus_window_id = self._revalidate_pre_action(
                connection, launcher, current, root, active_atom, any_property_type
            )
            pointer = root.query_pointer()
            if (int(pointer.root_x), int(pointer.root_y)) != (root_x, root_y):
                raise HarnessError("X11 pointer drifted away from the owned PZ startup-control point while held")
            if not self._belongs_to_window(verified_current.window, pointer_window_id):
                raise HarnessError("owned PZ window lost topmost ownership while the startup click was held")
            pre_action_cursor = pre_action_checkpoint()
            if not isinstance(pre_action_cursor, LogCursor):
                raise HarnessError("pre-action log cursor was not established")
            xtest.fake_input(connection, button_release, 1)
            connection.sync()
            release_emitted = True
            button_release_monotonic = self._clock()
            button_release_wall_time_ns = self._wall_clock()
            post_action_screenshot = (
                self._best_effort_post_action_capture(post_action_capture, verified_current.width, verified_current.height)
                if post_action_capture is not None
                else None
            )
            action_completed_wall_time_ns = button_release_wall_time_ns
            if action_completed_wall_time_ns <= pre_action_cursor.established_wall_time_ns:
                raise HarnessError("wall-clock evidence did not advance across the startup action")
            return X11Action(
                launcher, verified_current, action_x, action_y, root_x, root_y,
                active_window_id, focus_window_id, pointer_window_id, ready_screenshot,
                post_action_screenshot, button_press_monotonic, button_press_wall_time_ns,
                button_release_monotonic, button_release_wall_time_ns, button_release_monotonic - button_press_monotonic,
                pre_action_cursor, action_completed_wall_time_ns,
            )
        except Exception as exc:
            if press_emitted and not release_emitted:
                try:
                    xtest.fake_input(connection, button_release, 1)
                    connection.sync()
                    button_release_monotonic = self._clock()
                    button_release_wall_time_ns = self._wall_clock()
                except Exception as release_exc:
                    raise HarnessError(
                        f"{exc}; additionally failed to release held XTEST button: {release_exc}"
                    ) from exc
            raise

    def _assert_signature_fresh(self, signature_seen_at: float) -> None:
        age = self._clock() - signature_seen_at
        if age < 0 or age > self.policy.signature_max_age_seconds:
            raise HarnessError(f"startup gate signature is stale ({age:.3f}s)")

    def _activate_x11(
        self,
        display_name: str,
        launcher: ProcessIdentity,
        readiness_capture: Callable[[int, int], dict[str, object]],
        post_action_capture: Callable[[int, int], dict[str, object]] | None,
        assert_fresh: Callable[[], None],
        pre_action_checkpoint: Callable[[], LogCursor],
    ) -> X11Action:
        try:
            from Xlib import X, display
            from Xlib.ext import xtest
            from Xlib.protocol import event
        except ImportError as exc:
            raise HarnessError("python-xlib with XTEST is unavailable; unattended startup remains disabled") from exc
        connection = display.Display(display_name)
        try:
            if not connection.has_extension("XTEST"):
                raise HarnessError(f"XTEST is unavailable on DISPLAY={display_name}; unattended startup remains disabled")
            windows = self._owned_windows(connection, launcher)
            if len(windows) != 1:
                raise HarnessError(f"expected exactly one harness-owned visible PZ window, found {len(windows)}")
            expected = windows[0]
            if not re.search(self.policy.window_title_pattern, expected.title):
                raise HarnessError(f"owned window title does not match bounded startup policy: {expected.title!r}")

            root = connection.screen().root
            active_atom = connection.intern_atom("_NET_ACTIVE_WINDOW")
            root.send_event(
                event.ClientMessage(
                    window=expected.window,
                    client_type=active_atom,
                    data=(32, [2, X.CurrentTime, 0, 0, 0]),
                ),
                event_mask=X.SubstructureRedirectMask | X.SubstructureNotifyMask,
            )
            connection.flush()
            deadline = self._clock() + 2
            while self._clock() < deadline:
                if self._active_window_id(root, active_atom, X.AnyPropertyType) == expected.window_id:
                    break
                self._sleep(0.05)
            else:
                raise HarnessError("owned PZ window did not become the active top-level window")
            expected.window.set_input_focus(X.RevertToParent, X.CurrentTime)
            connection.sync()

            ready_screenshot = readiness_capture(expected.width, expected.height)
            self._validate_readiness_screenshot(ready_screenshot, expected, root)

            current, active_window_id, focus_window_id = self._revalidate_pre_action(
                connection, launcher, expected, root, active_atom, X.AnyPropertyType
            )
            self._assert_client_geometry(current, connection.screen())
            action_x, action_y = self._safe_action_point(current.width, current.height)
            translated = root.translate_coords(current.window, action_x, action_y)
            root_x, root_y = int(translated.x), int(translated.y)
            current.window.warp_pointer(action_x, action_y)
            connection.sync()

            # Warping and screenshot capture are race points. Revalidate the full
            # identity/focus/geometry tuple once more immediately before XTEST.
            current, active_window_id, focus_window_id = self._revalidate_pre_action(
                connection, launcher, current, root, active_atom, X.AnyPropertyType
            )
            pointer = root.query_pointer()
            pointer_window_id = self._resource_id(pointer.child)
            if (int(pointer.root_x), int(pointer.root_y)) != (root_x, root_y):
                raise HarnessError("X11 pointer did not reach the owned PZ startup-control point")
            if not self._belongs_to_window(current.window, pointer_window_id):
                raise HarnessError("owned PZ window is obscured at the startup-control point")

            assert_fresh()
            return self._complete_click_cycle(
                connection,
                xtest,
                current=current,
                root=root,
                active_atom=active_atom,
                launcher=launcher,
                ready_screenshot=ready_screenshot,
                post_action_capture=post_action_capture,
                assert_fresh=lambda: self._assert_signature_fresh(signature_seen_at),
                pre_action_checkpoint=pre_action_checkpoint,
                action_x=action_x,
                action_y=action_y,
                root_x=root_x,
                root_y=root_y,
                active_window_id=active_window_id,
                focus_window_id=focus_window_id,
                pointer_window_id=pointer_window_id,
                button_press=X.ButtonPress,
                button_release=X.ButtonRelease,
                any_property_type=X.AnyPropertyType,
            )
        finally:
            connection.close()

    def _revalidate_pre_action(self, connection, launcher, expected, root, active_atom, any_property_type):
        if self._identity_reader(launcher.pid) != launcher:
            raise HarnessError("launcher PID/start-time identity changed at startup action")
        windows = self._owned_windows(connection, launcher)
        if len(windows) != 1:
            raise HarnessError(f"owned PZ window set changed before startup action (found {len(windows)})")
        current = windows[0]
        self._assert_same_window(expected, current)
        active_window_id = self._active_window_id(root, active_atom, any_property_type)
        if active_window_id != expected.window_id:
            raise HarnessError("focus race: owned PZ window is no longer the active top-level window")
        focus_window_id = self._resource_id(connection.get_input_focus().focus)
        if not self._focus_belongs_to_window(connection, expected.window_id, focus_window_id):
            raise HarnessError("focus race: owned PZ window no longer has X11 input focus")
        return current, active_window_id, focus_window_id

    @staticmethod
    def _assert_same_window(expected: WindowSnapshot, current: WindowSnapshot) -> None:
        if current.window_id != expected.window_id:
            raise HarnessError("wrong window replaced the owned PZ window before startup action")
        if current.process != expected.process:
            raise HarnessError("owned PZ window PID/start-time identity changed before startup action")
        if current.title != expected.title:
            raise HarnessError("owned PZ window title changed before startup action")
        if (current.x, current.y, current.width, current.height) != (
            expected.x, expected.y, expected.width, expected.height
        ):
            raise HarnessError("owned PZ client geometry changed before startup action")

    @staticmethod
    def _validate_readiness_screenshot(screenshot: dict[str, object], window: WindowSnapshot, root) -> None:
        if screenshot.get("status") != "FRESH":
            raise HarnessError("startup readiness screenshot is not fresh")
        width, height = screenshot.get("width"), screenshot.get("height")
        # Active-window captures use local image coordinates: the image starts
        # at the client, so desktop-space window.x/window.y do not apply.
        if (
            not isinstance(width, int)
            or not isinstance(height, int)
            or width != window.width
            or height < window.height
            or height > window.height + 64
        ):
            raise HarnessError("startup readiness screenshot dimensions are inconsistent with the owned PZ client")

    @staticmethod
    def _safe_action_point(width: int, height: int) -> tuple[int, int]:
        if width < 320 or height < 200:
            raise HarnessError("owned PZ client geometry is too small for a safe startup point")
        inset = 2
        return width // 2, height // 2 if height // 2 >= inset else inset

    @classmethod
    def _assert_client_geometry(cls, window: WindowSnapshot, screen) -> None:
        screen_width = int(getattr(screen, "width_in_pixels", 0))
        screen_height = int(getattr(screen, "height_in_pixels", 0))
        if window.x < 0 or window.y < 0 or window.width < 320 or window.height < 200:
            raise HarnessError("owned PZ client geometry is zero, tiny, or off-screen")
        if not screen_width or not screen_height or window.x + window.width > screen_width or window.y + window.height > screen_height:
            raise HarnessError("owned PZ client geometry is zero, tiny, or off-screen")
        cls._safe_action_point(window.width, window.height)

    @staticmethod
    def _active_window_id(root, active_atom, any_property_type) -> int:
        active = root.get_full_property(active_atom, any_property_type)
        if active and len(active.value) == 1:
            return int(active.value[0])
        return 0

    @staticmethod
    def _read_process_identity(pid: int) -> ProcessIdentity:
        try:
            text = (Path("/proc") / str(pid) / "stat").read_text(encoding="ascii")
            fields = text[text.rfind(")") + 2:].split()
            return ProcessIdentity(pid, int(fields[2]), int(fields[19]))
        except (OSError, ValueError, IndexError) as exc:
            raise HarnessError(f"cannot verify process identity for PID {pid}") from exc

    @staticmethod
    def _resource_id(resource) -> int | None:
        value = getattr(resource, "id", resource)
        return int(value) if isinstance(value, int) and value != 0 else None

    @classmethod
    def _belongs_to_window(cls, window, candidate_id: int | None) -> bool:
        """Return true when candidate is the client itself or an ancestor WM frame."""
        if candidate_id is None:
            return False
        current = window
        for _ in range(64):
            if cls._resource_id(current) == candidate_id:
                return True
            parent = current.query_tree().parent
            if cls._resource_id(parent) in {None, cls._resource_id(current)}:
                return False
            current = parent
        return False

    @classmethod
    def _focus_belongs_to_window(cls, connection, window_id: int, focus_id: int | None) -> bool:
        """Return true when focus is the exact PZ client or one of its descendants."""
        if focus_id is None:
            return False
        current = connection.create_resource_object("window", focus_id)
        for _ in range(64):
            current_id = cls._resource_id(current)
            if current_id == window_id:
                return True
            parent = current.query_tree().parent
            if cls._resource_id(parent) in {None, current_id}:
                return False
            current = parent
        return False

    def _owned_windows(self, connection, launcher: ProcessIdentity) -> list[WindowSnapshot]:
        root = connection.screen().root
        client_atom = connection.intern_atom("_NET_CLIENT_LIST")
        pid_atom = connection.intern_atom("_NET_WM_PID")
        name_atom = connection.intern_atom("_NET_WM_NAME")
        utf8_atom = connection.intern_atom("UTF8_STRING")
        prop = root.get_full_property(client_atom, 0)
        results = []
        if not prop:
            return results
        for window_id in prop.value:
            window = connection.create_resource_object("window", int(window_id))
            attrs = window.get_attributes()
            if attrs.map_state != 2:
                continue
            pid_prop = window.get_full_property(pid_atom, 0)
            if not pid_prop or len(pid_prop.value) != 1:
                continue
            pid = int(pid_prop.value[0])
            try:
                process = self._identity_reader(pid)
            except HarnessError:
                continue
            if process.process_group_id != launcher.pid:
                continue
            title_prop = window.get_full_property(name_atom, utf8_atom)
            title = bytes(title_prop.value).decode("utf-8", "replace") if title_prop else (window.get_wm_name() or "")
            geometry = window.get_geometry()
            if geometry.width <= 0 or geometry.height <= 0:
                continue
            origin = root.translate_coords(window, 0, 0)
            results.append(WindowSnapshot(
                window, process, int(window.id), str(title), int(origin.x), int(origin.y),
                int(geometry.width), int(geometry.height),
            ))
        return results

    def revalidate_delivery_identity(self, value: InputEvidence) -> dict[str, object]:
        """Re-read the complete session/window/pointer tuple before confirmation."""
        if not self.used:
            raise HarnessError("startup controller did not emit the owned one-shot action")
        if os.environ.get("DISPLAY", "") != value.display:
            raise HarnessError("DISPLAY/session identity changed before delivery confirmation")
        expected_action = self._safe_action_point(value.window_width, value.window_height)
        if (value.action_x, value.action_y) != expected_action:
            raise HarnessError("delivery confirmation action point is not the authorized lower-center target")
        if (value.root_x, value.root_y) != (
            value.window_x + value.action_x,
            value.window_y + value.action_y,
        ):
            raise HarnessError("delivery confirmation action point is incoherent with the owned client geometry")
        launcher = ProcessIdentity(
            value.launcher_pid, value.launcher_pid, value.launcher_start_time_ticks
        )
        if self._identity_reader(value.launcher_pid) != launcher:
            raise HarnessError("launcher PID/start-time identity changed before delivery confirmation")
        try:
            from Xlib import X, display
        except ImportError as exc:
            raise HarnessError("python-xlib is unavailable for delivery identity revalidation") from exc
        connection = display.Display(value.display)
        try:
            windows = self._owned_windows(connection, launcher)
            if len(windows) != 1:
                raise HarnessError(
                    f"owned PZ window set changed before delivery confirmation (found {len(windows)})"
                )
            current = windows[0]
            expected = WindowSnapshot(
                current.window,
                ProcessIdentity(
                    value.window_pid, value.launcher_pid, value.window_start_time_ticks
                ),
                value.window_id,
                value.window_title,
                value.window_x,
                value.window_y,
                value.window_width,
                value.window_height,
            )
            self._assert_same_window(expected, current)
            root = connection.screen().root
            active_atom = connection.intern_atom("_NET_ACTIVE_WINDOW")
            active_window_id = self._active_window_id(root, active_atom, X.AnyPropertyType)
            if active_window_id != value.window_id:
                raise HarnessError("owned PZ window is no longer active at delivery confirmation")
            focus_window_id = self._resource_id(connection.get_input_focus().focus)
            if not self._focus_belongs_to_window(connection, value.window_id, focus_window_id):
                raise HarnessError("owned PZ client no longer has X11 focus at delivery confirmation")
            pointer = root.query_pointer()
            pointer_root_x, pointer_root_y = int(pointer.root_x), int(pointer.root_y)
            pointer_window_id = self._resource_id(pointer.child)
            if (pointer_root_x, pointer_root_y) != (value.root_x, value.root_y):
                raise HarnessError("X11 pointer moved away from the authorized startup-control point")
            if not self._belongs_to_window(current.window, pointer_window_id):
                raise HarnessError(
                    "another topmost window or overlay owns the pointer at delivery confirmation"
                )

            # Close the observation interval around the pointer query: none of
            # the process, client, active-window, or focus identities may drift
            # while the final topmost ownership fact is being collected.
            if self._identity_reader(value.launcher_pid) != launcher:
                raise HarnessError("launcher PID/start-time identity changed during delivery snapshot")
            final_windows = self._owned_windows(connection, launcher)
            if len(final_windows) != 1:
                raise HarnessError(
                    "owned PZ window set changed during delivery snapshot "
                    f"(found {len(final_windows)})"
                )
            self._assert_same_window(current, final_windows[0])
            final_active_window_id = self._active_window_id(
                root, active_atom, X.AnyPropertyType
            )
            final_focus_window_id = self._resource_id(connection.get_input_focus().focus)
            if final_active_window_id != active_window_id:
                raise HarnessError("active PZ window changed during delivery snapshot")
            if final_focus_window_id != focus_window_id or not self._focus_belongs_to_window(
                connection, value.window_id, final_focus_window_id
            ):
                raise HarnessError("PZ input focus changed during delivery snapshot")
            return {
                "status": "STABLE",
                "checked_monotonic": self._clock(),
                "checked_wall_time_ns": self._wall_clock(),
                "launcher_pid": launcher.pid,
                "launcher_start_time_ticks": launcher.start_time_ticks,
                "window_pid": current.process.pid,
                "window_start_time_ticks": current.process.start_time_ticks,
                "window_id": current.window_id,
                "window_title": current.title,
                "window_x": current.x,
                "window_y": current.y,
                "window_width": current.width,
                "window_height": current.height,
                "active_window_id": active_window_id,
                "focus_window_id": focus_window_id,
                "action_x": value.action_x,
                "action_y": value.action_y,
                "pointer_root_x": pointer_root_x,
                "pointer_root_y": pointer_root_y,
                "pointer_window_id": pointer_window_id,
                "pointer_topmost_owned": True,
                "display": value.display,
            }
        finally:
            connection.close()


def _parse_player_ready(value: str) -> dict[str, str]:
    marker = "[CF-INSPECT]|EVENT|"
    position = value.find(marker)
    if position < 0:
        raise HarnessError("startup transition is not a canonical observer event")
    parts = value[position:].rstrip("\r\n").split("|")
    if parts[:2] != ["[CF-INSPECT]", "EVENT"]:
        raise HarnessError("startup transition is not a canonical observer event")
    fields: dict[str, str] = {}
    for part in parts[2:]:
        if "=" not in part:
            raise HarnessError("startup transition contains a malformed field")
        key, field_value = part.split("=", 1)
        if not key or key in fields:
            raise HarnessError("startup transition contains a duplicate or empty field")
        fields[key] = field_value
    required = {
        "kind", "run", "observer", "session", "sequence", "emittedAtMs",
        "save", "activeModCount", "activeMods", "payloadMode", "payloadId",
        "payloadChecksum", "gameVersion",
    }
    if set(fields) != required:
        missing = sorted(required - set(fields))
        unexpected = sorted(set(fields) - required)
        raise HarnessError(
            "startup transition field contract mismatch: "
            f"missing={missing or '<none>'} unexpected={unexpected or '<none>'}"
        )
    for name in ("sequence", "emittedAtMs", "activeModCount"):
        if not fields[name].isdigit() or str(int(fields[name])) != fields[name]:
            raise HarnessError(f"startup transition field {name} is not a canonical integer")
    if int(fields["sequence"]) < 1 or int(fields["emittedAtMs"]) < 1:
        raise HarnessError("startup transition sequence/timestamp is invalid")
    return fields


def _raw_record_details(transition: GateResult) -> dict[str, object]:
    if transition.matched_raw_bytes is None:
        raw = transition.matched_line.encode("utf-8")
        capture = "SYNTHETIC_GATE_RESULT_WITHOUT_TERMINATOR"
    else:
        raw = transition.matched_raw_bytes
        capture = "LOG_FOLLOWER_EXACT"
    if raw.endswith(b"\r\n"):
        terminator = b"\r\n"
    elif raw.endswith(b"\n"):
        terminator = b"\n"
    else:
        terminator = b""
    decode_error = transition.matched_decode_error
    if decode_error is None:
        try:
            raw[:-len(terminator) if terminator else None].decode("utf-8", "strict")
            decode_error = False
        except UnicodeDecodeError:
            decode_error = True
    return {
        "raw_bytes": base64.b64encode(raw).decode("ascii"),
        "raw_bytes_encoding": "base64",
        "raw_bytes_capture": capture,
        "raw_byte_length": len(raw),
        "raw_sha256": hashlib.sha256(raw).hexdigest(),
        "line_terminator": base64.b64encode(terminator).decode("ascii"),
        "line_terminator_encoding": "base64",
        "utf8_decode_status": "INVALID_UTF8_REPLACED" if decode_error else "VALID_UTF8",
    }


def _best_effort_player_ready(value: str) -> dict[str, str]:
    marker = "[CF-INSPECT]|EVENT|"
    position = value.find(marker)
    if position < 0:
        return {}
    fields: dict[str, str] = {}
    for part in value[position:].rstrip("\r\n").split("|")[2:]:
        if "=" not in part:
            continue
        key, field_value = part.split("=", 1)
        if key and key not in fields:
            fields[key] = field_value
    return fields


def _transition_observation(
    transition: GateResult,
    *,
    fields: dict[str, str] | None = None,
) -> dict[str, object]:
    result: dict[str, object] = {
        "observed_monotonic": transition.matched_at,
        "observed_wall_time_ns": transition.matched_wall_time_ns,
        "record_start_offset": transition.matched_start_offset,
        "record_end_offset": transition.matched_end_offset,
        "file_mtime_ns": transition.matched_file_mtime_ns,
        "log_device": transition.log_device,
        "log_inode": transition.log_inode,
        "decoded_text": transition.matched_line,
    }
    result.update(_raw_record_details(transition))
    source_fields = fields if fields is not None else _best_effort_player_ready(
        transition.matched_line
    )
    if source_fields.get("sequence", "").isdigit():
        result["source_sequence"] = int(source_fields["sequence"])
    if source_fields.get("emittedAtMs", "").isdigit():
        result["source_emitted_at_ms"] = int(source_fields["emittedAtMs"])
    if "gameVersion" in source_fields:
        result["source_game_version"] = source_fields["gameVersion"]
    return result


def _journal_entry(
    transition: GateResult,
    *,
    classification: str,
    rejection_reason: str | None = None,
    fields: dict[str, str] | None = None,
    index: int,
) -> dict[str, object]:
    parsed_fields = fields
    parse_error = None
    if parsed_fields is None:
        try:
            parsed_fields = _parse_player_ready(transition.matched_line)
        except HarnessError as exc:
            parse_error = str(exc)
    observation = _transition_observation(transition, fields=parsed_fields)
    if observation["utf8_decode_status"] != "VALID_UTF8":
        parse_result = "INVALID_UTF8_REJECTED"
    else:
        parse_result = "PARSED" if parse_error is None else "PARSE_REJECTED"
    return {
        "journal_index": index,
        "classification": classification,
        "parse_result": parse_result,
        "parse_error": parse_error,
        "rejection_reason": rejection_reason,
        "parsed_fields": dict(parsed_fields) if parsed_fields is not None else None,
        **observation,
    }


def confirm_delivery(
    value: InputEvidence,
    *,
    transition: GateResult,
    identity_revalidator: Callable[[InputEvidence], dict[str, object]],
) -> InputEvidence:
    if value.delivery_status not in {"PENDING_TRANSITION", "NOT_CONFIRMED"}:
        raise HarnessError("startup delivery outcome has already been finalized")
    cursor = value.pre_action_cursor
    identity = value.readiness_identity
    if cursor is None or identity is None or value.action_completed_wall_time_ns is None:
        raise HarnessError("startup delivery evidence lacks its pre-action correlation contract")
    if cursor.established_monotonic > value.action_completed_monotonic \
            or cursor.established_wall_time_ns >= value.action_completed_wall_time_ns:
        raise HarnessError("pre-action cursor timestamps do not precede the XTEST action completion")
    if transition.matched_at <= value.action_completed_monotonic:
        raise HarnessError("stale startup transition predates the XTEST action")
    observation_values = (
        transition.matched_wall_time_ns,
        transition.matched_start_offset,
        transition.matched_end_offset,
        transition.matched_file_mtime_ns,
        transition.log_device,
        transition.log_inode,
    )
    if any(item is None for item in observation_values):
        raise HarnessError("startup transition lacks exact log observation evidence")
    if (transition.log_device, transition.log_inode) != (cursor.log_device, cursor.log_inode):
        raise HarnessError("startup transition came from a different log identity")
    if transition.matched_start_offset < cursor.offset:
        raise HarnessError("startup transition crosses or predates the pre-action byte cursor")
    if transition.matched_end_offset <= transition.matched_start_offset:
        raise HarnessError("startup transition has invalid byte offsets")
    if transition.matched_file_mtime_ns < cursor.file_mtime_ns:
        raise HarnessError("startup transition file timestamp predates the pre-action cursor")
    if transition.matched_wall_time_ns <= value.action_completed_wall_time_ns:
        raise HarnessError("startup transition was not observed after the XTEST action")
    if transition.matched_file_mtime_ns > (
        transition.matched_wall_time_ns + SOURCE_CLOCK_FUTURE_TOLERANCE_MS * 1_000_000
    ):
        raise HarnessError("startup transition file timestamp is incoherent with observation time")
    if transition.matched_decode_error:
        raise HarnessError("startup transition record contains invalid UTF-8")
    fields = _parse_player_ready(transition.matched_line)
    if cursor.observer_sequence_watermark is None:
        raise HarnessError("pre-action cursor lacks the observer sequence watermark")
    if int(fields["sequence"]) <= cursor.observer_sequence_watermark:
        raise HarnessError("startup transition is replayed or reordered against the pre-action sequence")
    if fields["gameVersion"] in {"", "false", "<nil>", "<unavailable>"}:
        raise HarnessError("startup transition lacks the observer game-version identity")
    expected = {
        "kind": "PLAYER_READY",
        "run": identity.run_id,
        "observer": identity.observer_id,
        "session": identity.session_id,
        "save": identity.save_name,
        "activeModCount": str(len(identity.active_mod_ids)),
        "activeMods": ",".join(identity.active_mod_ids),
        "payloadMode": identity.payload_mode,
        "payloadId": identity.payload_id,
        "payloadChecksum": identity.payload_checksum,
        "gameVersion": identity.expected_game_version,
    }
    mismatched = sorted(name for name, expected_value in expected.items() if fields[name] != expected_value)
    if mismatched:
        raise HarnessError("startup transition correlation mismatch: " + ", ".join(mismatched))
    source_wall_time_ns = int(fields["emittedAtMs"]) * 1_000_000
    if source_wall_time_ns <= value.action_completed_wall_time_ns:
        raise HarnessError("startup transition was emitted before the XTEST action completed")
    if source_wall_time_ns <= cursor.established_wall_time_ns:
        raise HarnessError("startup transition source time predates the persisted pre-action cursor")
    if source_wall_time_ns > (
        transition.matched_wall_time_ns + SOURCE_CLOCK_FUTURE_TOLERANCE_MS * 1_000_000
    ):
        raise HarnessError(
            "startup transition source time is implausibly in the future "
            f"(tolerance={SOURCE_CLOCK_FUTURE_TOLERANCE_MS}ms)"
        )
    if source_wall_time_ns > (
        transition.matched_file_mtime_ns + SOURCE_CLOCK_FUTURE_TOLERANCE_MS * 1_000_000
    ):
        raise HarnessError(
            "startup transition source time is incoherent with the retained log file timestamp"
        )
    if not re.fullmatch(r"42\.\d+", identity.expected_game_version):
        raise HarnessError("startup readiness identity lacks the runtime version precision")
    if identity.installed_game_version and not re.fullmatch(r"42\.\d+\.\d+", identity.installed_game_version):
        raise HarnessError("startup readiness identity lacks an exact supported installed Build 42 version")
    confirmation_identity = identity_revalidator(value)
    if not isinstance(confirmation_identity, dict) or confirmation_identity.get("status") != "STABLE":
        raise HarnessError("delivery-time process/window identity was not stably revalidated")
    observation = _transition_observation(transition, fields=fields)
    accepted = _journal_entry(
        transition,
        classification="ACCEPTED",
        fields=fields,
        index=len(value.readiness_evidence_journal) + 1,
    )
    return replace(
        value,
        delivery_status="CONFIRMED",
        transition=transition.matched_line,
        transition_latency_seconds=transition.matched_at - value.action_completed_monotonic,
        transition_observation=observation,
        confirmation_identity=confirmation_identity,
        failure_reason=None,
        readiness_evidence_journal=value.readiness_evidence_journal + (accepted,),
    )


def fail_delivery(
    value: InputEvidence,
    *,
    reason: str | BaseException,
    transition: GateResult | None = None,
) -> InputEvidence:
    if value.delivery_status == "CONFIRMED":
        return value
    clean_reason, carried, carried_reasons = extract_gate_evidence(reason)
    transitions = carried or ((transition,) if transition is not None else ())
    transition_reasons = carried_reasons or (None,) * len(transitions)
    journal = value.readiness_evidence_journal
    for rejected, record_reason in zip(transitions, transition_reasons):
        journal = journal + (_journal_entry(
            rejected,
            classification="REJECTED",
            rejection_reason=record_reason or clean_reason,
            index=len(journal) + 1,
        ),)
    last = transitions[-1] if transitions else None
    rejected_observation = _transition_observation(last) if last is not None else None
    return replace(
        value,
        delivery_status="NOT_CONFIRMED",
        rejected_transition=last.matched_line if last is not None else value.rejected_transition,
        rejected_transition_observation=(
            rejected_observation
            if rejected_observation is not None else value.rejected_transition_observation
        ),
        failure_reason=clean_reason,
        readiness_evidence_journal=journal,
    )


def evidence_dict(value: InputEvidence) -> dict:
    return asdict(value)
