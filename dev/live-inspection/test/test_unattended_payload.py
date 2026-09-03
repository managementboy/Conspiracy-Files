from __future__ import annotations

import json
import os
import signal
import subprocess
import sys
import tempfile
import unittest
import zipfile
import types
from dataclasses import asdict, replace
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "lib"))

from live_inspection.config import load_profile, unattended_refusal_reason
from live_inspection.cli import LiveRun
from live_inspection.model import HarnessError, Payload, UnattendedStartup
from live_inspection.payload import install_production_payload, tree_checksum
from live_inspection.safety import ControlTransaction, recover_interrupted_runs
from live_inspection.state import GateResult, LogCursor, LogFollower
from live_inspection.unattended import (
    InputEvidence,
    ProcessIdentity,
    ReadinessIdentity,
    StartupGateController,
    WindowSnapshot,
    X11Action,
    confirm_delivery,
    fail_delivery,
)


GATE_NAMES = (
    "menu", "world-loading", "click-to-start", "player-ready-modal-check",
    "chunk-streaming", "scan-completion", "run-completion", "normal-exit",
)


def profile_text(root: Path, *, criteria: str = 'criteria=["CF-V01-E02"]', scope: str = 'interaction_scope=["startup-gate"]') -> str:
    gates = []
    for name in GATE_NAMES:
        action = "startup-gate" if name == "click-to-start" else "wait"
        if name == "click-to-start":
            pattern = "game loading took"
        elif name == "player-ready-modal-check":
            pattern = "\\\\[CF-INSPECT\\\\].*kind=PLAYER_READY"
        else:
            pattern = "READY"
        gates.append(f'''[[gates]]
name="{name}"
pattern="{pattern}"
timeout_seconds=1
action="{action}"''')
    return f'''[run]
profile_id="test-profile"
probe_id="test-probe"
[paths]
source_save="{root}/Saves/Sandbox/source"
pz_user_root="{root}"
launcher="{root}/launcher"
evidence_root="{root}/evidence"
[safety]
controls=["latestSave.ini", "mods/default.txt"]
[acceptance]
{criteria}
{scope}
[unattended_startup]
enabled=true
action="left-click"
max_actions=1
signature_max_age_seconds=10
post_signature_settle_seconds=1
supported_game_version="42.20.4"
[[sites]]
id="S1"
role="office"
bounds=[1,2,3,4]
{chr(10).join(gates)}
'''


class UnattendedConfigTests(unittest.TestCase):
    def load(self, text: str):
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        path = Path(temporary.name) / "profile.toml"
        path.write_text(text, encoding="utf-8")
        return load_profile(path)

    def test_accepts_exact_startup_only_contract(self):
        with tempfile.TemporaryDirectory() as temp:
            profile = self.load(profile_text(Path(temp)))
            self.assertTrue(profile.unattended_startup.enabled)
            self.assertEqual(profile.interaction_scope, ("startup-gate",))
            self.assertEqual(
                profile.unattended_startup.supported_game_version, "42.20.4"
            )
            run = LiveRun(profile, profile.sites, False, True)
            self.assertEqual(run.readiness_identity.expected_game_version, "42.20")
            self.assertEqual(run.readiness_identity.installed_game_version, "42.20.4")

    def test_missing_wrong_or_malformed_supported_game_version_is_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            base = profile_text(Path(temp))
            cases = {
                "missing": base.replace('supported_game_version="42.20.4"\n', ""),
                "wrong-patch": base.replace(
                    'supported_game_version="42.20.4"',
                    'supported_game_version="42.20.5"',
                ),
                "broad-prefix": base.replace(
                    'supported_game_version="42.20.4"',
                    'supported_game_version="42.20.x"',
                ),
                "malformed": base.replace(
                    'supported_game_version="42.20.4"',
                    'supported_game_version="not-a-version"',
                ),
            }
            for name, text in cases.items():
                with self.subTest(name=name), self.assertRaisesRegex(
                    HarnessError, "exact supported game version"
                ):
                    self.load(text)

    def test_refuses_t10_and_e08_unattended_acceptance(self):
        with tempfile.TemporaryDirectory() as temp:
            for criterion in ("T10", "E08", "CF-V01-E08"):
                with self.subTest(criterion=criterion):
                    profile = self.load(profile_text(Path(temp), criteria=f'criteria=["{criterion}"]'))
                    self.assertRegex(unattended_refusal_reason(profile) or "", "manual-only")

    def test_refused_run_records_t10_e08_not_run_before_mutation(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            profile = self.load(profile_text(root, criteria='criteria=["T10"]'))
            run = LiveRun(profile, profile.sites, False, True)
            with self.assertRaisesRegex(HarnessError, "manual-only"):
                run.prepare()
            disposition = json.loads((run.bundle / "criteria-disposition.json").read_text(encoding="utf-8"))
            self.assertEqual((disposition["T10"], disposition["CF-V01-E08"]), ("NOT RUN", "NOT RUN"))
            self.assertFalse(run.destination_save.exists())
            with mock.patch("live_inspection.cli.matching_pz_processes", return_value=[]):
                run.cleanup()

    def test_refuses_inventory_menu_or_acceptance_scope(self):
        with tempfile.TemporaryDirectory() as temp:
            for scope in ("inventory inspect", "context-menu", "gameplay", "acceptance action", "right-click"):
                with self.subTest(scope=scope):
                    profile = self.load(profile_text(Path(temp), scope=f'interaction_scope=["{scope}"]'))
                    self.assertRegex(unattended_refusal_reason(profile) or "", "forbidden")

    def test_refuses_more_than_one_action_or_broad_signature(self):
        with tempfile.TemporaryDirectory() as temp:
            base = profile_text(Path(temp))
            with self.assertRaisesRegex(HarnessError, "exactly 1"):
                self.load(base.replace("max_actions=1", "max_actions=2"))
            with self.assertRaisesRegex(HarnessError, "exact ordinary gate signature"):
                self.load(base.replace('pattern="game loading took"', 'pattern=".*"'))
            with self.assertRaisesRegex(HarnessError, "exact observer PLAYER_READY"):
                self.load(base.replace('pattern="\\\\[CF-INSPECT\\\\].*kind=PLAYER_READY"', 'pattern="READY"'))

    def test_keypress_strategy_is_explicitly_rejected_after_live_failure(self):
        with tempfile.TemporaryDirectory() as temp:
            base = profile_text(Path(temp))
            with self.assertRaisesRegex(HarnessError, "keypress startup is disabled"):
                self.load(base.replace('action="left-click"', 'action="keypress"\nkey="Return"'))

    def test_production_payload_requires_exact_identity_and_checksum(self):
        with tempfile.TemporaryDirectory() as temp:
            text = profile_text(Path(temp)) + "\n[payload]\nmode=\"production\"\nsource=\"candidate\"\n"
            with self.assertRaisesRegex(HarnessError, "expected_sha256"):
                self.load(text)

    def test_checked_in_production_profile_is_pinned_to_current_payload(self):
        profile = load_profile(ROOT / "profiles/dead-air-production-unattended.toml")
        self.assertEqual(profile.payload.expected_sha256, tree_checksum(profile.payload.source))
        self.assertEqual(profile.payload.expected_mod_id, "ConspiracyFiles")
        self.assertEqual(profile.criteria, ())
        self.assertIsNone(unattended_refusal_reason(profile))

    def test_checked_in_manual_profile_has_the_shared_version_contract(self):
        profile = load_profile(ROOT / "profiles/dead-air-p2-r2.toml")
        self.assertFalse(profile.unattended_startup.enabled)
        self.assertEqual(profile.unattended_startup.supported_game_version, "42.20.4")
        run = LiveRun(profile, profile.sites[:1], False, True)
        self.assertEqual(run.readiness_identity.expected_game_version, "42.20")
        self.assertEqual(run.readiness_identity.installed_game_version, "42.20.4")


class StartupGateControllerTests(unittest.TestCase):
    def policy(self) -> UnattendedStartup:
        return UnattendedStartup(True, "left-click", 1, 10, 1, r"(?i)project zomboid")

    @staticmethod
    def screenshot() -> dict[str, object]:
        return {"status": "FRESH", "path": "screenshots/startup-gate-ready.png", "width": 960, "height": 1040}

    def test_active_window_readiness_capture_uses_local_coordinates(self):
        window = WindowSnapshot(
            object(), ProcessIdentity(222, 111, 2000), 333,
            "Project Zomboid", 480, 32, 960, 1008,
        )
        root = mock.Mock()
        StartupGateController._validate_readiness_screenshot(
            {"status": "FRESH", "width": 960, "height": 1040}, window, root
        )
        for name, screenshot in (
            ("truncated", {"status": "FRESH", "width": 960, "height": 1007}),
            ("wrong-width", {"status": "FRESH", "width": 959, "height": 1040}),
            ("inconsistent-height", {"status": "FRESH", "width": 960, "height": 1073}),
        ):
            with self.subTest(capture=name), self.assertRaisesRegex(HarnessError, "dimensions are inconsistent"):
                StartupGateController._validate_readiness_screenshot(screenshot, window, root)

    def test_startup_action_uses_display_screen_for_window_without_screen_method(self):
        class Window:
            id = 333

            def set_input_focus(self, *_args):
                pass

            def warp_pointer(self, *_args):
                pass

        class Root:
            def send_event(self, *_args, **_kwargs):
                pass

            def get_full_property(self, *_args):
                return types.SimpleNamespace(value=[333])

            def translate_coords(self, *_args):
                return types.SimpleNamespace(x=480, y=536)

            def query_pointer(self):
                return types.SimpleNamespace(root_x=480, root_y=536, child=Window())

        class Screen:
            root = Root()
            width_in_pixels = 1920
            height_in_pixels = 1080

        class Connection:
            def has_extension(self, _name): return True
            def screen(self): return Screen()
            def intern_atom(self, _name): return "active"
            def flush(self): pass
            def sync(self): pass
            def get_input_focus(self): return types.SimpleNamespace(focus=Window())
            def close(self): pass

        class X:
            AnyPropertyType = 0
            CurrentTime = 0
            SubstructureRedirectMask = 1
            SubstructureNotifyMask = 2
            RevertToParent = 3
            ButtonPress = 4
            ButtonRelease = 5

        fake_xlib = types.ModuleType("Xlib")
        fake_xlib.X = X
        fake_xlib.display = types.SimpleNamespace(Display=lambda _name: Connection())
        fake_ext = types.ModuleType("Xlib.ext")
        fake_ext.xtest = types.SimpleNamespace(fake_input=lambda *_args: None)
        fake_protocol = types.ModuleType("Xlib.protocol")
        fake_protocol.event = types.SimpleNamespace(ClientMessage=lambda **_kwargs: object())
        launcher = ProcessIdentity(111, 111, 1000)
        window = WindowSnapshot(Window(), ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)
        controller = StartupGateController(
            self.policy(), clock=lambda: 100.0, identity_reader=lambda _pid: launcher
        )
        def complete(*_args, **kwargs):
            kwargs["assert_fresh"]()
            return "action"

        with mock.patch.dict(sys.modules, {"Xlib": fake_xlib, "Xlib.ext": fake_ext, "Xlib.protocol": fake_protocol}), \
                mock.patch.object(controller, "_owned_windows", return_value=[window]), \
                mock.patch.object(controller, "_revalidate_pre_action", return_value=(window, 333, 333)), \
                mock.patch.object(controller, "_belongs_to_window", return_value=True), \
                mock.patch.object(controller, "_complete_click_cycle", side_effect=complete), \
                mock.patch.dict(os.environ, {"DISPLAY": ":0"}):
            self.assertEqual(
                controller._activate_x11(
                    ":0", launcher, lambda *_size: self.screenshot(), None, 99.0,
                    self.cursor,
                ),
                "action",
            )

    @staticmethod
    def cursor() -> LogCursor:
        return LogCursor(10, 100.0, 100_000_000_000, 99_000_000_000, 8, 9, False, 3)

    @staticmethod
    def identity(run: str = "RUN-1") -> ReadinessIdentity:
        return ReadinessIdentity(
            run, run, "OBSERVER-1", "SESSION-1", "production", "CandidateMod",
            "a" * 64, ("CandidateMod", "OBSERVER-1"), "42.20", "42.20.4",
        )

    @classmethod
    def transition(cls, *, seen_at: float = 102.5, **updates: str) -> GateResult:
        fields = {
            "kind": "PLAYER_READY", "run": "RUN-1", "observer": "OBSERVER-1",
            "session": "SESSION-1", "sequence": "4", "emittedAtMs": "102000",
            "save": "RUN-1", "activeModCount": "2",
            "activeMods": "CandidateMod,OBSERVER-1", "payloadMode": "production",
            "payloadId": "CandidateMod", "payloadChecksum": "a" * 64,
            "gameVersion": "42.20",
        }
        fields.update(updates)
        line = "[CF-INSPECT]|EVENT|" + "|".join(f"{key}={value}" for key, value in fields.items())
        return GateResult("player-ready-modal-check", 1, 0.1, line, seen_at,
                          102_500_000_000, 10, 10 + len(line.encode()) + 1,
                          102_400_000_000, 8, 9)

    @staticmethod
    def input_evidence() -> InputEvidence:
        return InputEvidence(
            display=":0", launcher_pid=111, launcher_start_time_ticks=1000,
            window_pid=222, window_start_time_ticks=2000, window_id=333,
            window_title="Project Zomboid", action="left-click", action_count=1,
            command_status="XTEST_EMITTED", delivery_status="PENDING_TRANSITION",
            signature="game loading took", signature_age_seconds=1.1,
            post_signature_settle_seconds=1, action_completed_monotonic=101.1,
            window_x=480, window_y=32, window_width=960, window_height=1008,
            action_x=480, action_y=504, root_x=960, root_y=536,
            active_window_id=333, focus_window_id=333, pointer_window_id=44,
            ready_screenshot=StartupGateControllerTests.screenshot(),
            action_completed_wall_time_ns=101_100_000_000,
            pre_action_cursor=StartupGateControllerTests.cursor(),
            readiness_identity=StartupGateControllerTests.identity(),
        )

    def test_one_shot_bound_and_structured_evidence(self):
        now = [100.0]
        launcher = ProcessIdentity(111, 111, 1000)
        window = WindowSnapshot(object(), ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)
        action = X11Action(
            launcher, window, 480, 504, 960, 536, 333, 333, 444,
            {**self.screenshot(), "captured_wall_time_ns": 101_050_000_000},
            {"status": "FRESH", "path": "screenshots/post-action-startup-gate.png", "width": 960, "height": 1040},
            101.0, 101_000_000_000, 101.08, 101_080_000_000, 0.08,
            self.cursor(), 101_100_000_000,
        )
        controller = StartupGateController(
            self.policy(), clock=lambda: now[0], sleep=lambda seconds: now.__setitem__(0, now[0] + seconds),
            identity_reader=lambda _pid: launcher,
        )
        with mock.patch.dict(os.environ, {"DISPLAY": ":0"}), mock.patch.object(controller, "_activate_x11", return_value=action):
            evidence = controller.activate(
                launcher_pid=111, signature="game loading took", signature_seen_at=99.0,
                signature_seen_wall_time_ns=101_000_000_000,
                readiness_capture=self.screenshot,
                readiness_identity=self.identity(), pre_action_checkpoint=self.cursor,
            )
            self.assertEqual((evidence.action, evidence.action_count, evidence.window_pid), ("left-click", 1, 222))
            self.assertEqual((evidence.action_x, evidence.action_y, evidence.window_width, evidence.window_height), (480, 504, 960, 1008))
            self.assertEqual((evidence.command_status, evidence.delivery_status), ("XTEST_EMITTED", "PENDING_TRANSITION"))
            self.assertEqual(evidence.signature_seen_monotonic, 99.0)
            self.assertEqual(evidence.signature_seen_wall_time_ns, 101_000_000_000)
            self.assertEqual(evidence.ready_screenshot_captured_wall_time_ns, 101_050_000_000)
            self.assertEqual(evidence.post_action_screenshot and evidence.post_action_screenshot["path"], "screenshots/post-action-startup-gate.png")
            self.assertEqual(evidence.button_press_monotonic, 101.0)
            self.assertEqual(evidence.button_release_monotonic, 101.08)
            self.assertEqual(evidence.button_hold_seconds, 0.08)
            with self.assertRaisesRegex(HarnessError, "already been used"):
                controller.activate(
                    launcher_pid=111, signature="game loading took", signature_seen_at=100.0,
                    readiness_capture=self.screenshot,
                    readiness_identity=self.identity(), pre_action_checkpoint=self.cursor,
                )

        class Window:
            def __init__(self, window_id, parent=None): self.id, self.parent = window_id, parent
            def query_tree(self): return type("Tree", (), {"parent": self.parent})()
        root = Window(1); pz_frame = Window(44, root); pz = Window(333, pz_frame)
        self.assertTrue(controller._belongs_to_window(pz, 44))
        self.assertFalse(controller._belongs_to_window(pz, 55))

    def test_best_effort_post_action_capture_never_raises_on_capture_failure(self):
        controller = StartupGateController(self.policy())
        evidence = controller._best_effort_post_action_capture(
            mock.Mock(side_effect=RuntimeError("capture boom")),
            960,
            1008,
        )
        self.assertEqual(evidence["status"], "UNAVAILABLE")
        self.assertIn("capture boom", evidence["reason"])

    def test_owned_process_group_members_filters_foreign_group_members(self):
        run = object.__new__(LiveRun)
        run.process = None
        run.launcher_identity = None
        launcher = ProcessIdentity(111, 111, 1000)
        foreign = ProcessIdentity(222, 999, 2000)
        with mock.patch("live_inspection.cli.matching_pz_processes", return_value=[(111, "ProjectZomboid"), (222, "ProjectZomboid")]), mock.patch.object(
            StartupGateController, "_read_process_identity", side_effect=[launcher, foreign]
        ):
            members = run._owned_process_group_members(launcher)
        self.assertEqual([(member.pid, member.process_group_id) for member in members], [(111, 111)])

    def test_signal_owned_process_members_refuses_pid_reuse(self):
        run = object.__new__(LiveRun)
        expected = ProcessIdentity(222, 111, 2000)
        reused = ProcessIdentity(222, 111, 9999)
        with mock.patch.object(
            StartupGateController, "_read_process_identity", return_value=reused
        ), mock.patch("live_inspection.cli.os.kill") as kill:
            actions = run._signal_owned_process_members([expected], signal.SIGTERM)
        self.assertEqual(actions[0]["status"], "IDENTITY_CHANGED")
        self.assertEqual(actions[0]["current"], asdict(reused))
        self.assertFalse(kill.called)

    def test_click_cycle_records_single_press_release_and_dwell(self):
        launcher = ProcessIdentity(111, 111, 1000)
        window = WindowSnapshot(object(), ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)
        controller = StartupGateController(
            self.policy(),
            clock=mock.Mock(side_effect=[100.0, 100.08]),
            sleep=mock.Mock(),
            identity_reader=lambda _pid: launcher,
            wall_clock=mock.Mock(side_effect=[101_000_000_000, 101_080_000_000]),
            click_hold_seconds=0.08,
        )
        connection = mock.Mock()
        connection.sync = mock.Mock()
        pointer = type("Pointer", (), {"root_x": 960, "root_y": 992, "child": 44})()
        root = mock.Mock()
        root.query_pointer.return_value = pointer
        current = window
        current_window = current.window
        controller._revalidate_pre_action = mock.Mock(return_value=(current, 333, 333))
        controller._belongs_to_window = mock.Mock(return_value=True)
        controller._best_effort_post_action_capture = mock.Mock(
            return_value={"status": "FRESH", "path": "screenshots/post-action-startup-gate.png", "width": 960, "height": 1008}
        )
        xtest = mock.Mock()
        xtest.fake_input = mock.Mock()
        action = controller._complete_click_cycle(
            connection,
            xtest,
            current=current,
            root=root,
            active_atom="active",
            launcher=launcher,
            ready_screenshot=self.screenshot(),
            post_action_capture=lambda width, height: {"status": "FRESH", "path": "screenshots/post-action-startup-gate.png", "width": width, "height": height},
            assert_fresh=lambda: None,
            pre_action_checkpoint=self.cursor,
            action_x=480,
            action_y=960,
            root_x=960,
            root_y=992,
            active_window_id=333,
            focus_window_id=333,
            pointer_window_id=44,
            button_press="ButtonPress",
            button_release="ButtonRelease",
            any_property_type="any",
        )
        self.assertEqual(
            [call.args[2] for call in xtest.fake_input.call_args_list],
            [1, 1],
        )
        self.assertEqual(
            [call.args[1] for call in xtest.fake_input.call_args_list],
            ["ButtonPress", "ButtonRelease"],
        )
        self.assertEqual(connection.sync.call_count, 2)
        self.assertEqual(controller._sleep.call_args_list, [mock.call(0.08)])
        self.assertAlmostEqual(action.button_hold_seconds or 0, 0.08, places=2)
        self.assertEqual(action.button_press_monotonic, 100.0)
        self.assertEqual(action.button_release_monotonic, 100.08)
        self.assertEqual(action.post_action_screenshot["status"], "FRESH")

    def test_click_cycle_releases_even_when_hold_revalidation_fails(self):
        launcher = ProcessIdentity(111, 111, 1000)
        window = WindowSnapshot(object(), ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)
        controller = StartupGateController(
            self.policy(),
            clock=mock.Mock(side_effect=[100.0]),
            sleep=mock.Mock(),
            identity_reader=lambda _pid: launcher,
            wall_clock=mock.Mock(side_effect=[1_000_000_000, 1_080_000_000]),
            click_hold_seconds=0.08,
        )
        connection = mock.Mock()
        connection.sync = mock.Mock()
        root = mock.Mock()
        root.query_pointer.return_value = type("Pointer", (), {"root_x": 960, "root_y": 992, "child": 44})()
        controller._revalidate_pre_action = mock.Mock(side_effect=HarnessError("identity drift"))
        controller._belongs_to_window = mock.Mock(return_value=True)
        xtest = mock.Mock()
        xtest.fake_input = mock.Mock()
        with self.assertRaisesRegex(HarnessError, "identity drift"):
            controller._complete_click_cycle(
                connection,
                xtest,
                current=window,
                root=root,
                active_atom="active",
                launcher=launcher,
                ready_screenshot=self.screenshot(),
                post_action_capture=None,
                assert_fresh=lambda: None,
                pre_action_checkpoint=self.cursor,
                action_x=480,
                action_y=960,
                root_x=960,
                root_y=992,
                active_window_id=333,
                focus_window_id=333,
                pointer_window_id=44,
                button_press="ButtonPress",
                button_release="ButtonRelease",
                any_property_type="any",
            )
        self.assertEqual(
            [call.args[1] for call in xtest.fake_input.call_args_list],
            ["ButtonPress", "ButtonRelease"],
        )
        self.assertEqual(connection.sync.call_count, 2)

    def test_stale_signature_fails_before_x11(self):
        launcher = ProcessIdentity(111, 111, 1000)
        controller = StartupGateController(self.policy(), clock=lambda: 100.0, sleep=lambda _seconds: None, identity_reader=lambda _pid: launcher)
        with mock.patch.dict(os.environ, {"DISPLAY": ":0"}), self.assertRaisesRegex(HarnessError, "stale"):
            controller.activate(
                launcher_pid=111, signature="game loading took", signature_seen_at=89.0,
                readiness_capture=self.screenshot,
                readiness_identity=self.identity(), pre_action_checkpoint=self.cursor,
            )

    def test_window_ownership_filters_non_group_pids(self):
        class Prop:
            def __init__(self, value): self.value = value
        class Attrs:
            map_state = 2
        class Geometry:
            width, height = 960, 1008
        class Window:
            def __init__(self, window_id, pid): self.id, self.pid = window_id, pid
            def get_attributes(self): return Attrs()
            def get_full_property(self, atom, _type):
                return Prop([self.pid]) if atom == "pid" else Prop(b"Project Zomboid")
            def get_wm_name(self): return "Project Zomboid"
            def get_geometry(self): return Geometry()
        class Root:
            def get_full_property(self, _atom, _type): return Prop([1, 2])
            def translate_coords(self, _window, _x, _y): return type("Point", (), {"x": 480, "y": 32})()
        class Screen:
            root = Root()
        class Connection:
            def screen(self): return Screen()
            def intern_atom(self, name): return {"_NET_CLIENT_LIST": "clients", "_NET_WM_PID": "pid", "_NET_WM_NAME": "name", "UTF8_STRING": "utf8"}[name]
            def create_resource_object(self, _kind, window_id): return Window(window_id, 100 + window_id)
        controller = StartupGateController(
            self.policy(), identity_reader=lambda pid: ProcessIdentity(pid, 50 if pid == 101 else 99, pid * 10)
        )
        windows = controller._owned_windows(Connection(), ProcessIdentity(50, 50, 500))
        self.assertEqual([(item.window_id, item.process.pid) for item in windows], [(1, 101)])

    def test_safe_action_point_uses_1280x720_design_baseline_and_compatibility_sizes(self):
        cases = (
            ((960, 1008), (480, 504)),
            ((1920, 1008), (960, 504)),
            ((1280, 720), (640, 360)),
            ((1920, 1080), (960, 540)),
        )
        for size, expected in cases:
            with self.subTest(size=size):
                self.assertEqual(StartupGateController._safe_action_point(*size), expected)

    def test_unsafe_client_geometry_is_rejected_before_action(self):
        class Root:
            def __init__(self, width=1920, height=1080):
                self._screen = type("Screen", (), {
                    "width_in_pixels": width, "height_in_pixels": height,
                })()

            def screen(self):
                return self._screen

        process = ProcessIdentity(222, 111, 2000)
        cases = (
            ("tiny", WindowSnapshot(object(), process, 1, "Project Zomboid", 10, 10, 319, 200)),
            ("zero", WindowSnapshot(object(), process, 1, "Project Zomboid", 10, 10, 0, 0)),
            ("negative-origin", WindowSnapshot(object(), process, 1, "Project Zomboid", -1, 10, 960, 540)),
            ("off-right", WindowSnapshot(object(), process, 1, "Project Zomboid", 1600, 10, 400, 540)),
            ("off-bottom", WindowSnapshot(object(), process, 1, "Project Zomboid", 10, 700, 960, 500)),
        )
        for name, window in cases:
            with self.subTest(geometry=name), self.assertRaisesRegex(HarnessError, "zero, tiny, or off-screen"):
                StartupGateController._assert_client_geometry(window, Root().screen())

    def test_faithful_x11_revalidation_fails_on_focus_race_and_wrong_window(self):
        class Node:
            def __init__(self, window_id, parent=None): self.id, self.parent = window_id, parent
            def query_tree(self): return type("Tree", (), {"parent": self.parent})()
        root_node = Node(1); window_node = Node(333, root_node)
        launcher = ProcessIdentity(111, 111, 1000)
        expected = WindowSnapshot(window_node, ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)

        class Root:
            active = 333
            def get_full_property(self, _atom, _type): return type("Prop", (), {"value": [self.active]})()
        root = Root()
        class Connection:
            focus = window_node
            def get_input_focus(self): return type("Focus", (), {"focus": self.focus})()
            def create_resource_object(self, _kind, window_id): return window_node if window_id == 333 else Node(window_id, root_node)
        connection = Connection()
        controller = StartupGateController(self.policy(), identity_reader=lambda _pid: launcher)

        with mock.patch.object(controller, "_owned_windows", return_value=[expected]):
            current, active, focus = controller._revalidate_pre_action(connection, launcher, expected, root, "active", 0)
        self.assertEqual((current.window_id, active, focus), (333, 333, 333))

        root.active = 999
        with mock.patch.object(controller, "_owned_windows", return_value=[expected]), self.assertRaisesRegex(HarnessError, "focus race"):
            controller._revalidate_pre_action(connection, launcher, expected, root, "active", 0)

        root.active = 333
        wrong = WindowSnapshot(window_node, expected.process, 444, expected.title, expected.x, expected.y, expected.width, expected.height)
        with mock.patch.object(controller, "_owned_windows", return_value=[wrong]), self.assertRaisesRegex(HarnessError, "wrong window"):
            controller._revalidate_pre_action(connection, launcher, expected, root, "active", 0)

        drifted = WindowSnapshot(window_node, expected.process, 333, expected.title, expected.x, expected.y, 959, expected.height)
        with mock.patch.object(controller, "_owned_windows", return_value=[drifted]), self.assertRaisesRegex(HarnessError, "geometry"):
            controller._revalidate_pre_action(connection, launcher, expected, root, "active", 0)

        reused_pid = WindowSnapshot(
            window_node, ProcessIdentity(222, 111, 2001), 333, expected.title,
            expected.x, expected.y, expected.width, expected.height,
        )
        with mock.patch.object(controller, "_owned_windows", return_value=[reused_pid]), self.assertRaisesRegex(HarnessError, "PID/start-time"):
            controller._revalidate_pre_action(connection, launcher, expected, root, "active", 0)

    def test_command_success_without_state_advance_is_not_delivery(self):
        failed = fail_delivery(self.input_evidence(), reason="PLAYER_READY timeout")
        self.assertEqual(failed.command_status, "XTEST_EMITTED")
        self.assertEqual(failed.delivery_status, "NOT_CONFIRMED")
        self.assertIn("timeout", failed.failure_reason or "")

    def test_fresh_run_scoped_transition_confirms_delivery(self):
        confirmed = confirm_delivery(
            self.input_evidence(), transition=self.transition(),
            identity_revalidator=lambda _value: {"status": "STABLE"},
        )
        self.assertEqual(confirmed.delivery_status, "CONFIRMED")
        self.assertAlmostEqual(confirmed.transition_latency_seconds or 0, 1.4)

    def test_stale_or_wrong_run_transition_cannot_confirm_delivery(self):
        with self.assertRaisesRegex(HarnessError, "stale"):
            confirm_delivery(
                self.input_evidence(), transition=self.transition(seen_at=100.0),
                identity_revalidator=lambda _value: {"status": "STABLE"},
            )
        with self.assertRaisesRegex(HarnessError, "correlation mismatch"):
            confirm_delivery(
                self.input_evidence(), transition=self.transition(run="RUN-2"),
                identity_revalidator=lambda _value: {"status": "STABLE"},
            )


class StartupDeliveryIntegrationTests(unittest.TestCase):
    class Process:
        pid = 111
        def poll(self): return None
        def wait(self, timeout): return 0

    def make_run(self, root: Path) -> LiveRun:
        profile_path = root / "profile.toml"
        profile_path.write_text(profile_text(root), encoding="utf-8")
        profile = load_profile(profile_path)
        run = LiveRun(profile, profile.sites, False, True)
        run.bundle = root / "bundle"
        run.bundle.mkdir()
        (run.bundle / "screenshots").mkdir()
        return run

    @staticmethod
    def emitted(run: LiveRun) -> InputEvidence:
        return replace(
            StartupGateControllerTests.input_evidence(),
            readiness_identity=run.readiness_identity,
        )

    def test_pre_action_cursor_and_sequence_are_persisted_before_input(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_run(Path(temp))
            identity = run.readiness_identity
            console = Path(temp) / "console.txt"
            line = (
                f"LOG > [CF-INSPECT]|EVENT|kind=SCRIPT_LOADED|run={identity.run_id}|"
                f"observer={identity.observer_id}|session={identity.session_id}|"
                "sequence=1|emittedAtMs=1000|profileSites=1\n"
            )
            console.write_text(line, encoding="utf-8")
            selected = run.persist_pre_action_cursor(LogFollower(console))
            persisted = json.loads((run.bundle / "startup-readiness-cursor.json").read_text(encoding="utf-8"))
            self.assertEqual(selected.offset, len(line.encode("utf-8")))
            self.assertEqual(selected.observer_sequence_watermark, 1)
            self.assertEqual(persisted["status"], "PRE_ACTION_CURSOR_ESTABLISHED")
            self.assertEqual(persisted["readiness_identity"]["session_id"], identity.session_id)

    def test_readiness_journal_appends_fsyncs_and_survives_later_confirmation(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            run = object.__new__(LiveRun)
            run.bundle = root
            pending = StartupGateControllerTests.input_evidence()
            wrong = StartupGateControllerTests.transition(run="OTHER")
            with self.assertRaises(HarnessError) as raised:
                confirm_delivery(
                    pending,
                    transition=wrong,
                    identity_revalidator=lambda _value: {"status": "STABLE"},
                )
            run.startup_evidence = fail_delivery(
                pending, reason=raised.exception, transition=wrong
            )
            with mock.patch("live_inspection.cli.os.fsync", wraps=os.fsync) as synced:
                run.write_startup_evidence()
                first_journal = (root / "startup-readiness-evidence.jsonl").read_bytes()
                run.startup_evidence = confirm_delivery(
                    run.startup_evidence,
                    transition=StartupGateControllerTests.transition(sequence="5"),
                    identity_revalidator=lambda _value: {"status": "STABLE"},
                )
                run.write_startup_evidence()
            lines = (root / "startup-readiness-evidence.jsonl").read_bytes().splitlines()
            saved = json.loads((root / "unattended-startup-input.json").read_text())
            self.assertGreaterEqual(synced.call_count, 8)
            self.assertEqual(len(lines), 2)
            self.assertTrue((root / "startup-readiness-evidence.jsonl").read_bytes().startswith(first_journal))
            self.assertEqual(
                [json.loads(line)["classification"] for line in lines],
                ["REJECTED", "ACCEPTED"],
            )
            self.assertEqual(saved["delivery_status"], "CONFIRMED")
            self.assertEqual(len(saved["readiness_evidence_journal"]), 2)

    def test_execute_marks_successful_x11_command_unconfirmed_on_timeout(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_run(Path(temp))
            run.startup_controller.activate = mock.Mock(return_value=self.emitted(run))

            def gate_result(gate, *_args, **_kwargs):
                if gate.name == "player-ready-modal-check":
                    raise HarnessError("gate timed out")
                return GateResult(gate.name, 1, 0.1, "game loading took", 100.0)

            with mock.patch.object(run, "prepare"), mock.patch.object(run, "cleanup"), mock.patch.object(
                run, "_launcher_process_identity", return_value=ProcessIdentity(111, 111, 1000)
            ), mock.patch("live_inspection.cli.subprocess.Popen", return_value=self.Process()), mock.patch(
                "live_inspection.cli.wait_for_gate", side_effect=gate_result
            ), self.assertRaisesRegex(HarnessError, "delivery was not confirmed"):
                run.execute()
            if run.launcher_stdout: run.launcher_stdout.close()
            if run.launcher_stderr: run.launcher_stderr.close()
            evidence = json.loads((run.bundle / "unattended-startup-input.json").read_text(encoding="utf-8"))
            self.assertEqual((evidence["command_status"], evidence["delivery_status"]), ("XTEST_EMITTED", "NOT_CONFIRMED"))

    def test_execute_confirms_only_fresh_run_scoped_player_ready(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_run(Path(temp))
            run.startup_controller.activate = mock.Mock(return_value=self.emitted(run))
            run.startup_controller.revalidate_delivery_identity = mock.Mock(return_value={"status": "STABLE"})

            def gate_result(gate, *_args, **_kwargs):
                if gate.name == "player-ready-modal-check":
                    identity = run.readiness_identity
                    fields = {
                        "kind": "PLAYER_READY", "run": identity.run_id,
                        "observer": identity.observer_id, "session": identity.session_id,
                        "sequence": "4", "emittedAtMs": "102000", "save": identity.save_name,
                        "activeModCount": str(len(identity.active_mod_ids)),
                        "activeMods": ",".join(identity.active_mod_ids),
                        "payloadMode": identity.payload_mode, "payloadId": identity.payload_id,
                        "payloadChecksum": identity.payload_checksum, "gameVersion": "42.20",
                    }
                    line = "[CF-INSPECT]|EVENT|" + "|".join(f"{key}={value}" for key, value in fields.items())
                    return GateResult(gate.name, 1, 0.1, line, 102.0,
                                      102_500_000_000, 10, 10 + len(line.encode()) + 1,
                                      102_400_000_000, 8, 9)
                return GateResult(gate.name, 1, 0.1, "game loading took", 100.0)

            with mock.patch.object(run, "prepare"), mock.patch.object(run, "cleanup"), mock.patch.object(
                run, "_launcher_process_identity", return_value=ProcessIdentity(111, 111, 1000)
            ), mock.patch("live_inspection.cli.subprocess.Popen", return_value=self.Process()), mock.patch(
                "live_inspection.cli.wait_for_gate", side_effect=gate_result
            ):
                run.execute()
            if run.launcher_stdout: run.launcher_stdout.close()
            if run.launcher_stderr: run.launcher_stderr.close()
            evidence = json.loads((run.bundle / "unattended-startup-input.json").read_text(encoding="utf-8"))
            self.assertEqual(evidence["delivery_status"], "CONFIRMED")
            self.assertEqual(run.status, "PASS")

    def test_rejected_correlation_is_atomically_recorded_without_pass(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_run(Path(temp))
            run.startup_controller.activate = mock.Mock(return_value=self.emitted(run))
            run.startup_controller.revalidate_delivery_identity = mock.Mock(return_value={"status": "STABLE"})

            def gate_result(gate, *_args, **_kwargs):
                if gate.name == "player-ready-modal-check":
                    identity = run.readiness_identity
                    line = (
                        f"[CF-INSPECT]|EVENT|kind=PLAYER_READY|run={identity.run_id}|"
                        f"observer={identity.observer_id}|session={identity.session_id}|sequence=4|"
                        f"emittedAtMs=102000|save=WRONG-SAVE|activeModCount={len(identity.active_mod_ids)}|"
                        f"activeMods={','.join(identity.active_mod_ids)}|payloadMode={identity.payload_mode}|"
                        f"payloadId={identity.payload_id}|payloadChecksum={identity.payload_checksum}|"
                        "gameVersion=42.20"
                    )
                    return GateResult(gate.name, 1, 0.1, line, 102.0,
                                      102_500_000_000, 10, 10 + len(line.encode()) + 1,
                                      102_400_000_000, 8, 9)
                return GateResult(gate.name, 1, 0.1, "game loading took", 100.0)

            with mock.patch.object(run, "prepare"), mock.patch.object(run, "cleanup"), mock.patch.object(
                run, "_launcher_process_identity", return_value=ProcessIdentity(111, 111, 1000)
            ), mock.patch(
                "live_inspection.cli.subprocess.Popen", return_value=self.Process()
            ), mock.patch("live_inspection.cli.wait_for_gate", side_effect=gate_result), \
                    self.assertRaisesRegex(HarnessError, "correlation mismatch"):
                run.execute()
            if run.launcher_stdout: run.launcher_stdout.close()
            if run.launcher_stderr: run.launcher_stderr.close()
            saved = json.loads((run.bundle / "unattended-startup-input.json").read_text(encoding="utf-8"))
            self.assertEqual(saved["delivery_status"], "NOT_CONFIRMED")
            self.assertIsNone(saved["transition"])
            self.assertIn("WRONG-SAVE", saved["rejected_transition"])
            self.assertEqual(saved["rejected_transition_observation"]["record_start_offset"], 10)


class ProductionPayloadTests(unittest.TestCase):
    def make_clean_repo(self, root: Path) -> tuple[Path, str]:
        payload = root / "candidate"
        (payload / "42").mkdir(parents=True)
        (payload / "42/mod.info").write_text("name=Candidate\nid=CandidateMod\nversionMin=42.20.0\n", encoding="utf-8")
        (payload / "common").mkdir()
        (payload / "common/data.txt").write_text("exact payload\n", encoding="utf-8")
        subprocess.run(["git", "init", "-q", str(root)], check=True)
        subprocess.run(["git", "-C", str(root), "config", "user.email", "test@example.invalid"], check=True)
        subprocess.run(["git", "-C", str(root), "config", "user.name", "Harness Test"], check=True)
        subprocess.run(["git", "-C", str(root), "add", "candidate"], check=True)
        subprocess.run(["git", "-C", str(root), "commit", "-qm", "candidate"], check=True)
        return payload, tree_checksum(payload)

    def make_live_run(self, root: Path) -> LiveRun:
        pz = root / "pz"
        (pz / "Saves/Sandbox/source").mkdir(parents=True)
        (pz / "launcher").write_text("unused\n", encoding="utf-8")
        (pz / "evidence").mkdir()
        profile_path = root / "profile.toml"
        profile_path.write_text(profile_text(pz), encoding="utf-8")
        profile = load_profile(profile_path)
        run = LiveRun(profile, profile.sites, False, True)
        run.bundle = root / "bundle"
        run.bundle.mkdir()
        run.bundle_created = True
        return run

    def test_validates_installs_and_records_clean_source_commit(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); source, checksum = self.make_clean_repo(root)
            destination = root / "installed"
            evidence = install_production_payload(Payload("production", source, checksum, "CandidateMod"), destination)
            self.assertTrue((destination / "42/mod.info").is_file())
            self.assertRegex(evidence.source_commit or "", r"^[0-9a-f]{40}$")
            self.assertEqual((evidence.checksum, evidence.mod_id), (checksum, "CandidateMod"))

    def test_rejects_dirty_source_and_cleans_staging(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); source, checksum = self.make_clean_repo(root)
            (source / "common/data.txt").write_text("dirty\n", encoding="utf-8")
            destination = root / "installed"
            with self.assertRaisesRegex(HarnessError, "dirty Git worktree"):
                install_production_payload(Payload("production", source, checksum, "CandidateMod"), destination)
            self.assertFalse(destination.exists()); self.assertFalse(destination.with_name("installed.staging").exists())

    def test_rejects_checksum_or_identity_mismatch_without_install(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); source, checksum = self.make_clean_repo(root)
            for bad_checksum, mod_id in (("0" * 64, "CandidateMod"), (checksum, "WrongMod")):
                destination = root / ("installed-" + mod_id)
                with self.subTest(mod_id=mod_id), self.assertRaises(HarnessError):
                    install_production_payload(Payload("production", source, bad_checksum, mod_id), destination)
                self.assertFalse(destination.exists())

    def test_zip_path_escape_fails_closed(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); archive = root / "bad.zip"
            with zipfile.ZipFile(archive, "w") as output:
                output.writestr("../escape", "bad")
            import hashlib
            checksum = hashlib.sha256(archive.read_bytes()).hexdigest()
            with self.assertRaisesRegex(HarnessError, "escapes"):
                install_production_payload(Payload("production", archive, checksum, "CandidateMod"), root / "installed")
            self.assertFalse((root / "escape").exists())

    def test_interrupted_recovery_archives_payload_and_restores_controls(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); (root / "mods").mkdir(); (root / "Saves/Sandbox").mkdir(parents=True)
            control = root / "latestSave.ini"; control.write_bytes(b"before\x00")
            bundle = root / "evidence/run-1"
            transaction = ControlTransaction(root, ("latestSave.ini",), bundle / "control-before")
            transaction.backup_exact(); control.write_text("after", encoding="utf-8")
            save = root / "Saves/Sandbox/CF_INSPECT_test"; save.mkdir()
            probe = root / "mods/CF_LiveInspection_test"; probe.mkdir()
            payload = root / "mods/CF_Payload_test"; payload.mkdir()
            staging = root / "mods/CF_Payload_test.staging"; staging.mkdir()
            (bundle / "run-state.json").write_text(json.dumps({
                "status": "MUTATED", "save_name": save.name, "mod_name": probe.name,
                "payload_name": payload.name, "payload_staging_name": staging.name,
            }), encoding="utf-8")
            recover_interrupted_runs(root, root / "evidence")
            self.assertEqual(control.read_bytes(), b"before\x00")
            self.assertFalse(payload.exists()); self.assertFalse(staging.exists())
            self.assertTrue((bundle / "archive-recovered/production-payload").is_dir())
            self.assertTrue((bundle / "archive-recovered/production-payload-staging").is_dir())

    def test_live_run_prepare_and_cleanup_restore_controls_byte_for_byte(self):
        with tempfile.TemporaryDirectory() as temp:
            base = Path(temp); candidate_root = base / "candidate-repo"; candidate_root.mkdir()
            source, checksum = self.make_clean_repo(candidate_root)
            pz = base / "pz"; save = pz / "Saves/Sandbox/source"; save.mkdir(parents=True)
            (save / ".cf-live-inspection-source").write_text("disposable\n", encoding="utf-8")
            (pz / "mods").mkdir(); (pz / "mods/default.txt").write_bytes(b"old-mods\x00")
            (pz / "latestSave.ini").write_bytes(b"old-save\x00")
            (pz / "options.ini").write_text("showSurvivalGuide=true\nfocusloss=true\n", encoding="utf-8")
            (pz / "launcher").write_text("unused\n", encoding="utf-8")
            profile_path = base / "production.toml"
            configured = profile_text(pz).replace(
                'controls=["latestSave.ini", "mods/default.txt"]',
                'controls=["latestSave.ini", "mods/default.txt", "options.ini"]',
            )
            profile_path.write_text(configured + f'''\n[payload]
mode="production"
source="{source}"
expected_sha256="{checksum}"
expected_mod_id="CandidateMod"
''', encoding="utf-8")
            profile = load_profile(profile_path)
            before = {name: (pz / name).read_bytes() for name in ("latestSave.ini", "mods/default.txt", "options.ini")}
            run = LiveRun(profile, profile.sites, False, True)
            with mock.patch("live_inspection.cli.renderer_diagnostics", return_value=({"renderer": "hardware", "software": False}, "glx\n")), mock.patch("live_inspection.cli.matching_pz_processes", return_value=[]):
                run.prepare()
                self.assertTrue((run.installed_payload / "42/mod.info").is_file())
                self.assertTrue((run.bundle / "production-payload.json").is_file())
                generated = (
                    run.installed_mod / "common/media/lua/client/CFInspectionProfile.lua"
                ).read_text(encoding="utf-8")
                self.assertIn(f'  observerId = "{run.mod_id}",', generated)
                self.assertIn(f'  sessionId = "{run.readiness_identity.session_id}",', generated)
                self.assertIn(f'  payloadId = "{run.readiness_identity.payload_id}",', generated)
                self.assertIn(f'  payloadChecksum = "{checksum}",', generated)
                self.assertIn('  expectedGameVersion = "42.20",', generated)
                run.cleanup()
            for name, content in before.items():
                self.assertEqual((pz / name).read_bytes(), content)
            self.assertFalse(run.installed_payload.exists()); self.assertFalse(run.destination_save.exists())
            self.assertTrue((run.bundle / "archive/production-payload").is_dir())
            shutdown = json.loads((run.bundle / "launcher-shutdown.json").read_text(encoding="utf-8"))
            self.assertEqual(shutdown["status"], "CLEAN")
            self.assertFalse(shutdown["sigterm_sent"])
            self.assertFalse(shutdown["sigkill_sent"])

    def test_cleanup_records_graceful_launcher_termination_without_sigkill(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_live_run(Path(temp))
            launcher_identity = ProcessIdentity(111, 111, 1000)
            run.process = mock.Mock(pid=111, poll=mock.Mock(return_value=None))
            with mock.patch.object(
                run, "_launcher_process_identity", return_value=launcher_identity
            ), mock.patch.object(
                run, "_owned_process_group_members", side_effect=[[launcher_identity], []]
            ), mock.patch.object(
                run, "_signal_owned_process_members", return_value=[{"status": "SENT", "target": asdict(launcher_identity), "signal": "SIGTERM"}]
            ) as signal_members, mock.patch(
                "live_inspection.cli.time.monotonic", side_effect=[0.0, 0.0, 1.0]
            ), mock.patch("live_inspection.cli.time.sleep"), mock.patch(
                "live_inspection.cli.matching_pz_processes", return_value=[]
            ):
                run.cleanup()
            self.assertEqual(signal_members.call_args_list[0].args[1], signal.SIGTERM)
            shutdown = json.loads((run.bundle / "launcher-shutdown.json").read_text(encoding="utf-8"))
            self.assertEqual(shutdown["status"], "CLEAN")
            self.assertTrue(shutdown["sigterm_sent"])
            self.assertFalse(shutdown["sigkill_sent"])
            self.assertEqual(shutdown["launcher_identity"]["pid"], 111)

    def test_cleanup_escalates_only_after_verified_timeout(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_live_run(Path(temp))
            launcher_identity = ProcessIdentity(111, 111, 1000)
            child_identity = ProcessIdentity(222, 111, 2000)
            run.process = mock.Mock(pid=111, poll=mock.Mock(return_value=None))
            with mock.patch.object(
                run, "_launcher_process_identity", return_value=launcher_identity
            ), mock.patch.object(
                run, "_owned_process_group_members", side_effect=[[launcher_identity, child_identity], [child_identity]]
            ), mock.patch.object(
                run, "_signal_owned_process_members",
                side_effect=[
                    [
                        {"status": "SENT", "target": asdict(launcher_identity), "signal": "SIGTERM"},
                        {"status": "SENT", "target": asdict(child_identity), "signal": "SIGTERM"},
                    ],
                    [{"status": "SENT", "target": asdict(child_identity), "signal": "SIGKILL"}],
                ],
            ) as signal_members, mock.patch(
                "live_inspection.cli.time.monotonic", side_effect=[0.0, 21.0]
            ), mock.patch("live_inspection.cli.time.sleep"), mock.patch(
                "live_inspection.cli.matching_pz_processes", return_value=[]
            ):
                run.cleanup()
            self.assertEqual(signal_members.call_count, 2)
            shutdown = json.loads((run.bundle / "launcher-shutdown.json").read_text(encoding="utf-8"))
            self.assertEqual(shutdown["status"], "CLEANUP_FAILED")
            self.assertTrue(shutdown["sigterm_sent"])
            self.assertTrue(shutdown["sigkill_sent"])
            self.assertTrue(
                any("SIGKILL after cleanup timeout" in error for error in shutdown["errors"])
            )

if __name__ == "__main__":
    unittest.main()
