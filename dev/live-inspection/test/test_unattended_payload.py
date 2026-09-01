from __future__ import annotations

import json
import os
import subprocess
import sys
import tempfile
import time
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
from live_inspection.unattended import StartupGateController


GATE_NAMES = (
    "menu", "world-loading", "click-to-start", "player-ready-modal-check",
    "chunk-streaming", "scan-completion", "run-completion", "normal-exit",
)


def profile_text(root: Path, *, criteria: str = 'criteria=["CF-V01-E02"]', scope: str = 'interaction_scope=["startup-gate"]') -> str:
    gates = []
    for name in GATE_NAMES:
        action = "startup-gate" if name == "click-to-start" else "wait"
        pattern = "game loading took" if name == "click-to-start" else "READY"
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

    def test_production_payload_requires_exact_identity_and_checksum(self):
        with tempfile.TemporaryDirectory() as temp:
            text = profile_text(Path(temp)) + "\n[payload]\nmode=\"production\"\nsource=\"candidate\"\n"
            with self.assertRaisesRegex(HarnessError, "expected_sha256"):
                self.load(text)

    def test_checked_in_production_profile_is_pinned_to_current_payload(self):
        profile = load_profile(ROOT / "profiles/dead-air-production-unattended.toml")
        self.assertEqual(profile.payload.expected_sha256, tree_checksum(profile.payload.source))
        self.assertEqual(profile.payload.expected_mod_id, "ConspiracyFiles")
        self.assertIsNone(unattended_refusal_reason(profile))


class StartupGateControllerTests(unittest.TestCase):
    def policy(self) -> UnattendedStartup:
        return UnattendedStartup(True, "left-click", None, 1, 10, r"(?i)project zomboid")

    def test_one_shot_bound_and_structured_evidence(self):
        controller = StartupGateController(self.policy())
        with mock.patch.dict(os.environ, {"DISPLAY": ":0"}), mock.patch.object(controller, "_activate_x11", return_value=(222, 333, "Project Zomboid")):
            evidence = controller.activate(launcher_pid=111, signature="game loading took", signature_seen_at=time.monotonic())
            self.assertEqual((evidence.action, evidence.action_count, evidence.window_pid), ("left-click", 1, 222))
            with self.assertRaisesRegex(HarnessError, "already been used"):
                controller.activate(launcher_pid=111, signature="game loading took", signature_seen_at=time.monotonic())

    def test_stale_signature_fails_before_x11(self):
        controller = StartupGateController(self.policy())
        with self.assertRaisesRegex(HarnessError, "stale"):
            controller.activate(launcher_pid=111, signature="game loading took", signature_seen_at=time.monotonic() - 11)

    def test_window_ownership_filters_non_group_pids(self):
        class Prop:
            def __init__(self, value): self.value = value
        class Attrs:
            map_state = 2
        class Window:
            def __init__(self, window_id, pid): self.id, self.pid = window_id, pid
            def get_attributes(self): return Attrs()
            def get_full_property(self, atom, _type):
                return Prop([self.pid]) if atom == "pid" else Prop(b"Project Zomboid")
            def get_wm_name(self): return "Project Zomboid"
        class Root:
            def get_full_property(self, _atom, _type): return Prop([1, 2])
        class Screen:
            root = Root()
        class Connection:
            def screen(self): return Screen()
            def intern_atom(self, name): return {"_NET_CLIENT_LIST": "clients", "_NET_WM_PID": "pid", "_NET_WM_NAME": "name", "UTF8_STRING": "utf8"}[name]
            def create_resource_object(self, _kind, window_id): return Window(window_id, 100 + window_id)
        with mock.patch("live_inspection.unattended.os.getpgid", side_effect=lambda pid: 50 if pid == 101 else 99):
            windows = StartupGateController._owned_windows(Connection(), 50)
        self.assertEqual([(item[0].id, item[1]) for item in windows], [(1, 101)])


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
