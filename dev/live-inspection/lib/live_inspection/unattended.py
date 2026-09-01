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
        window_pid, window_id, title = self._activate_x11(display_name, launcher_pid)
        self.used = True
        return InputEvidence(display_name, launcher_pid, window_pid, window_id, title, self.policy.action, 1, signature, age)

    def _activate_x11(self, display_name: str, launcher_pid: int) -> tuple[int, int, str]:
        try:
            from Xlib import X, XK, display
            from Xlib.ext import xtest
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
            window.set_input_focus(X.RevertToParent, X.CurrentTime)
            if self.policy.action == "left-click":
                geometry = window.get_geometry()
                x, y = max(1, geometry.width // 2), max(1, geometry.height // 2)
                window.warp_pointer(x, y)
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
            return window_pid, window.id, title
        finally:
            connection.close()

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
