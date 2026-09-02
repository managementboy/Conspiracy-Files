from __future__ import annotations

import json
import os
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "lib"))

from live_inspection.config import load_profile, unattended_refusal_reason
from live_inspection.cli import LiveRun
from live_inspection.model import HarnessError, Payload, UnattendedStartup
from live_inspection.payload import install_production_payload, tree_checksum
from live_inspection.safety import ControlTransaction, recover_interrupted_runs
from live_inspection.state import GateResult
from live_inspection.unattended import (
    InputEvidence,
    ProcessIdentity,
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


class StartupGateControllerTests(unittest.TestCase):
    def policy(self) -> UnattendedStartup:
        return UnattendedStartup(True, "left-click", 1, 10, 1, r"(?i)project zomboid")

    @staticmethod
    def screenshot() -> dict[str, object]:
        return {"status": "FRESH", "path": "screenshots/startup-gate-ready.png", "width": 960, "height": 1040}

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
            action_x=480, action_y=960, root_x=960, root_y=992,
            active_window_id=333, focus_window_id=333, pointer_window_id=44,
            ready_screenshot=StartupGateControllerTests.screenshot(),
        )

    def test_one_shot_bound_and_structured_evidence(self):
        now = [100.0]
        launcher = ProcessIdentity(111, 111, 1000)
        window = WindowSnapshot(object(), ProcessIdentity(222, 111, 2000), 333, "Project Zomboid", 480, 32, 960, 1008)
        action = X11Action(launcher, window, 480, 960, 960, 992, 333, 333, 444, self.screenshot())
        controller = StartupGateController(
            self.policy(), clock=lambda: now[0], sleep=lambda seconds: now.__setitem__(0, now[0] + seconds),
            identity_reader=lambda _pid: launcher,
        )
        with mock.patch.dict(os.environ, {"DISPLAY": ":0"}), mock.patch.object(controller, "_activate_x11", return_value=action):
            evidence = controller.activate(
                launcher_pid=111, signature="game loading took", signature_seen_at=99.0,
                readiness_capture=self.screenshot,
            )
            self.assertEqual((evidence.action, evidence.action_count, evidence.window_pid), ("left-click", 1, 222))
            self.assertEqual((evidence.action_x, evidence.action_y, evidence.window_width, evidence.window_height), (480, 960, 960, 1008))
            self.assertEqual((evidence.command_status, evidence.delivery_status), ("XTEST_EMITTED", "PENDING_TRANSITION"))
            with self.assertRaisesRegex(HarnessError, "already been used"):
                controller.activate(
                    launcher_pid=111, signature="game loading took", signature_seen_at=100.0,
                    readiness_capture=self.screenshot,
                )

        class Window:
            def __init__(self, window_id, parent=None): self.id, self.parent = window_id, parent
            def query_tree(self): return type("Tree", (), {"parent": self.parent})()
        root = Window(1); pz_frame = Window(44, root); pz = Window(333, pz_frame)
        self.assertTrue(controller._belongs_to_window(pz, 44))
        self.assertFalse(controller._belongs_to_window(pz, 55))

    def test_stale_signature_fails_before_x11(self):
        launcher = ProcessIdentity(111, 111, 1000)
        controller = StartupGateController(self.policy(), clock=lambda: 100.0, sleep=lambda _seconds: None, identity_reader=lambda _pid: launcher)
        with mock.patch.dict(os.environ, {"DISPLAY": ":0"}), self.assertRaisesRegex(HarnessError, "stale"):
            controller.activate(
                launcher_pid=111, signature="game loading took", signature_seen_at=89.0,
                readiness_capture=self.screenshot,
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
        transition = "[CF-INSPECT]|EVENT|kind=PLAYER_READY|run=RUN-1"
        confirmed = confirm_delivery(
            self.input_evidence(), transition=transition, transition_seen_at=102.5, expected_run="RUN-1"
        )
        self.assertEqual(confirmed.delivery_status, "CONFIRMED")
        self.assertAlmostEqual(confirmed.transition_latency_seconds or 0, 1.4)

    def test_stale_or_wrong_run_transition_cannot_confirm_delivery(self):
        transition = "[CF-INSPECT]|EVENT|kind=PLAYER_READY|run=RUN-1"
        with self.assertRaisesRegex(HarnessError, "stale"):
            confirm_delivery(self.input_evidence(), transition=transition, transition_seen_at=100.0, expected_run="RUN-1")
        with self.assertRaisesRegex(HarnessError, "run-scoped"):
            confirm_delivery(self.input_evidence(), transition=transition, transition_seen_at=102.0, expected_run="RUN-2")


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
    def emitted() -> InputEvidence:
        return StartupGateControllerTests.input_evidence()

    def test_execute_marks_successful_x11_command_unconfirmed_on_timeout(self):
        with tempfile.TemporaryDirectory() as temp:
            run = self.make_run(Path(temp))
            run.startup_controller.activate = mock.Mock(return_value=self.emitted())

            def gate_result(gate, *_args, **_kwargs):
                if gate.name == "player-ready-modal-check":
                    raise HarnessError("gate timed out")
                return GateResult(gate.name, 1, 0.1, "game loading took", 100.0)

            with mock.patch.object(run, "prepare"), mock.patch("live_inspection.cli.subprocess.Popen", return_value=self.Process()), mock.patch(
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
            run.startup_controller.activate = mock.Mock(return_value=self.emitted())

            def gate_result(gate, *_args, **_kwargs):
                if gate.name == "player-ready-modal-check":
                    line = f"[CF-INSPECT]|EVENT|kind=PLAYER_READY|run={run.save_name}"
                    return GateResult(gate.name, 1, 0.1, line, 102.0)
                return GateResult(gate.name, 1, 0.1, "game loading took", 100.0)

            with mock.patch.object(run, "prepare"), mock.patch("live_inspection.cli.subprocess.Popen", return_value=self.Process()), mock.patch(
                "live_inspection.cli.wait_for_gate", side_effect=gate_result
            ):
                run.execute()
            if run.launcher_stdout: run.launcher_stdout.close()
            if run.launcher_stderr: run.launcher_stderr.close()
            evidence = json.loads((run.bundle / "unattended-startup-input.json").read_text(encoding="utf-8"))
            self.assertEqual(evidence["delivery_status"], "CONFIRMED")
            self.assertEqual(run.status, "PASS")


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
                run.cleanup()
            for name, content in before.items():
                self.assertEqual((pz / name).read_bytes(), content)
            self.assertFalse(run.installed_payload.exists()); self.assertFalse(run.destination_save.exists())
            self.assertTrue((run.bundle / "archive/production-payload").is_dir())


if __name__ == "__main__":
    unittest.main()
