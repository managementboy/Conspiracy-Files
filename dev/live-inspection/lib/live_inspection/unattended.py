from __future__ import annotations

import os
import re
import time
from dataclasses import asdict, dataclass

from .model import HarnessError, UnattendedStartup


@dataclass(frozen=True)
class InputEvidence:
    display: str
    launcher_pid: int
    window_pid: int
    window_id: int
    window_title: str
    action: str
    action_count: int
    signature: str
    signature_age_seconds: float
    window_width: int
    window_height: int
    action_x: int | None
    action_y: int | None
    root_x: int | None
    root_y: int | None
    active_window_id: int
    pointer_window_id: int | None


@dataclass(frozen=True)
class X11Action:
    window_pid: int
    window_id: int
    window_title: str
    window_width: int
    window_height: int
    action_x: int | None
    action_y: int | None
    root_x: int | None
    root_y: int | None
    active_window_id: int
    pointer_window_id: int | None


class StartupGateController:
    """A fail-closed, one-use XTEST boundary for the ordinary startup gate."""

    def __init__(self, policy: UnattendedStartup):
        self.policy = policy
        self.used = False

    def activate(self, *, launcher_pid: int, signature: str, signature_seen_at: float) -> InputEvidence:
        if self.used:
            raise HarnessError("unattended startup input has already been used")
        if not self.policy.enabled or self.policy.max_actions != 1:
            raise HarnessError("unattended startup input is not authorized")
        age = time.monotonic() - signature_seen_at
        if age < 0 or age > self.policy.signature_max_age_seconds:
            raise HarnessError(f"startup gate signature is stale ({age:.3f}s)")
        display_name = os.environ.get("DISPLAY", "")
        if not display_name:
            raise HarnessError("DISPLAY is unset at unattended startup gate")
        self.used = True
        action = self._activate_x11(display_name, launcher_pid)
        return InputEvidence(display_name, launcher_pid, action.window_pid, action.window_id, action.window_title,
                             self.policy.action, 1, signature, age, action.window_width, action.window_height,
                             action.action_x, action.action_y, action.root_x, action.root_y,
                             action.active_window_id, action.pointer_window_id)

    def _activate_x11(self, display_name: str, launcher_pid: int) -> X11Action:
        try:
            from Xlib import X, XK, display
            from Xlib.ext import xtest
            from Xlib.protocol import event
        except ImportError as exc:
            raise HarnessError("python-xlib with XTEST is unavailable; unattended startup remains disabled") from exc
        connection = display.Display(display_name)
        try:
            if not connection.has_extension("XTEST"):
                raise HarnessError(f"XTEST is unavailable on DISPLAY={display_name}; unattended startup remains disabled")
            windows = self._owned_windows(connection, launcher_pid)
            if len(windows) != 1:
                raise HarnessError(f"expected exactly one harness-owned visible PZ window, found {len(windows)}")
            window, window_pid, title = windows[0]
            if not re.search(self.policy.window_title_pattern, title):
                raise HarnessError(f"owned window title does not match bounded startup policy: {title!r}")
            root = connection.screen().root
            active_atom = connection.intern_atom("_NET_ACTIVE_WINDOW")
            root.send_event(
                event.ClientMessage(
                    window=window,
                    client_type=active_atom,
                    data=(32, [2, X.CurrentTime, 0, 0, 0]),
                ),
                event_mask=X.SubstructureRedirectMask | X.SubstructureNotifyMask,
            )
            connection.flush()
            deadline = time.monotonic() + 2
            active_window_id = 0
            while time.monotonic() < deadline:
                active = root.get_full_property(active_atom, X.AnyPropertyType)
                if active and len(active.value) == 1:
                    active_window_id = int(active.value[0])
                    if active_window_id == window.id:
                        break
                time.sleep(0.05)
            else:
                raise HarnessError("owned PZ window did not become the active top-level window")
            window.set_input_focus(X.RevertToParent, X.CurrentTime)
            connection.sync()
            focus = connection.get_input_focus().focus
            if not self._belongs_to_window(window, self._resource_id(focus)):
                raise HarnessError("owned PZ window did not receive X11 input focus")
            geometry = window.get_geometry()
            if geometry.width <= 0 or geometry.height <= 0:
                raise HarnessError("owned PZ window has invalid geometry")
            action_x = action_y = root_x = root_y = pointer_window_id = None
            if self.policy.action == "left-click":
                action_x, action_y = geometry.width // 2, geometry.height // 2
                translated = root.translate_coords(window, action_x, action_y)
                root_x, root_y = int(translated.x), int(translated.y)
                window.warp_pointer(action_x, action_y)
                connection.sync()
                pointer = root.query_pointer()
                pointer_window_id = self._resource_id(pointer.child)
                if (int(pointer.root_x), int(pointer.root_y)) != (root_x, root_y):
                    raise HarnessError("X11 pointer did not reach the owned PZ window target point")
                if not self._belongs_to_window(window, pointer_window_id):
                    raise HarnessError("owned PZ window is obscured at the startup click point")
                xtest.fake_input(connection, X.ButtonPress, 1)
                xtest.fake_input(connection, X.ButtonRelease, 1)
            elif self.policy.action == "keypress":
                keysym = XK.string_to_keysym(self.policy.key or "")
                keycode = connection.keysym_to_keycode(keysym)
                if not keysym or not keycode:
                    raise HarnessError("authorized startup key could not be resolved")
                xtest.fake_input(connection, X.KeyPress, keycode)
                xtest.fake_input(connection, X.KeyRelease, keycode)
            else:
                raise HarnessError("unsupported unattended startup action")
            connection.sync()
            return X11Action(window_pid, window.id, title, int(geometry.width), int(geometry.height),
                             action_x, action_y, root_x, root_y, active_window_id, pointer_window_id)
        finally:
            connection.close()

    @staticmethod
    def _resource_id(resource) -> int | None:
        value = getattr(resource, "id", resource)
        return int(value) if isinstance(value, int) and value != 0 else None

    @classmethod
    def _belongs_to_window(cls, window, candidate_id: int | None) -> bool:
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

    @staticmethod
    def _owned_windows(connection, launcher_pid: int):
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
                if os.getpgid(pid) != launcher_pid:
                    continue
            except (ProcessLookupError, PermissionError):
                continue
            title_prop = window.get_full_property(name_atom, utf8_atom)
            title = bytes(title_prop.value).decode("utf-8", "replace") if title_prop else (window.get_wm_name() or "")
            results.append((window, pid, str(title)))
        return results


def evidence_dict(value: InputEvidence) -> dict:
    return asdict(value)
