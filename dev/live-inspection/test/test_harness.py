from __future__ import annotations

import json
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "lib"))

from live_inspection.config import load_profile
from live_inspection.evidence import sanitize_line
from live_inspection.model import Gate, HarnessError
from live_inspection.safety import ControlTransaction, ExclusiveRunLock, assert_save_safety, parse_renderer, recover_interrupted_runs, sha256
from live_inspection.state import LogFollower, wait_for_gate


def profile_text(root: Path) -> str:
    gates = "\n".join(f'''[[gates]]
name="{name}"
pattern="READY"
timeout_seconds=1
action="{'manual' if name in ('click-to-start', 'player-ready-modal-check') else 'wait'}"''' for name in (
        "menu", "world-loading", "click-to-start", "player-ready-modal-check",
        "chunk-streaming", "scan-completion", "run-completion", "normal-exit",
    ))
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
[[sites]]
id="S1"
role="office"
bounds=[1,2,3,4]
entry_point=[1.5,2.5,0]
{gates}
'''


class ConfigTests(unittest.TestCase):
    def test_loads_declarative_profile(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); path = root / "profile.toml"; path.write_text(profile_text(root))
            profile = load_profile(path)
            self.assertEqual(profile.profile_id, "test-profile")
            self.assertEqual(profile.sites[0].entry_point, (1.5, 2.5, 0))

    def test_rejects_inverted_bounds(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); path = root / "profile.toml"
            path.write_text(profile_text(root).replace("bounds=[1,2,3,4]", "bounds=[3,2,1,4]"))
            with self.assertRaisesRegex(HarnessError, "inverted"):
                load_profile(path)


class SafetyTests(unittest.TestCase):
    def test_source_requires_exact_root_and_marker(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); source = root / "Saves/Sandbox/source"; source.mkdir(parents=True)
            path = root / "profile.toml"; path.write_text(profile_text(root)); profile = load_profile(path)
            with self.assertRaisesRegex(HarnessError, "marker"):
                assert_save_safety(profile)
            (source / ".cf-live-inspection-source").write_text("disposable\n")
            assert_save_safety(profile)

    def test_control_round_trip_is_byte_exact_and_removes_new_files(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); (root / "mods").mkdir(); (root / "latestSave.ini").write_bytes(b"old\x00bytes")
            transaction = ControlTransaction(root, ("latestSave.ini", "mods/default.txt"), root / "backup")
            records = transaction.backup_exact(); original = records[0].digest
            (root / "latestSave.ini").write_text("changed")
            (root / "mods/default.txt").write_text("created")
            transaction.restore_exact()
            self.assertEqual(sha256(root / "latestSave.ini"), original)
            self.assertFalse((root / "mods/default.txt").exists())

    def test_lock_is_exclusive(self):
        with tempfile.TemporaryDirectory() as temp:
            lock = Path(temp) / "lock"
            with ExclusiveRunLock(lock):
                with self.assertRaises(HarnessError):
                    with ExclusiveRunLock(lock):
                        pass

    def test_renderer_classification(self):
        hardware = parse_renderer("OpenGL vendor string: Intel\nOpenGL renderer string: Mesa Intel(R) UHD\nOpenGL version string: 4.6\n")
        software = parse_renderer("OpenGL renderer string: llvmpipe (LLVM)\n")
        self.assertFalse(hardware["software"]); self.assertTrue(software["software"])

    def test_interrupted_run_recovery_restores_controls_and_archives(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); (root / "mods").mkdir(); (root / "Saves/Sandbox").mkdir(parents=True)
            control = root / "latestSave.ini"; control.write_text("before\n")
            bundle = root / "evidence/run-1"; transaction = ControlTransaction(root, ("latestSave.ini",), bundle / "control-before"); transaction.backup_exact()
            save = root / "Saves/Sandbox/CF_INSPECT_test"; save.mkdir(); mod = root / "mods/CF_LiveInspection_test"; mod.mkdir()
            control.write_text("after\n")
            (bundle / "run-state.json").write_text(json.dumps({"status": "MUTATED", "save_name": save.name, "mod_name": mod.name}))
            recovered = recover_interrupted_runs(root, root / "evidence")
            self.assertEqual(recovered, [bundle]); self.assertEqual(control.read_text(), "before\n")
            self.assertFalse(save.exists()); self.assertFalse(mod.exists())


class StateTests(unittest.TestCase):
    def test_gate_matches_incremental_log(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"; path.write_text("READY now\n")
            result = wait_for_gate(Gate("ready", "READY", 1), LogFollower(path), lambda: True, lambda *_: None, poll_seconds=0.001)
            self.assertEqual(result.name, "ready")

    def test_gate_reports_process_exit(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"; path.write_text("")
            with self.assertRaisesRegex(HarnessError, "process exited"):
                wait_for_gate(Gate("ready", "READY", 1), LogFollower(path), lambda: False, lambda *_: None)

    def test_log_follower_recovers_from_truncation(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"; path.write_text("old content that is longer\n")
            follower = LogFollower(path, start_at_end=True)
            path.write_text("NEW\n")
            self.assertEqual(follower.read_lines(), ["NEW"])

    def test_sanitization(self):
        line = f"path={Path.home()}/Zomboid token=hunter2"
        sanitized = sanitize_line(line)
        self.assertIn("<HOME>", sanitized); self.assertNotIn("hunter2", sanitized)


class StaticPolicyTests(unittest.TestCase):
    def test_core_has_no_dead_air_coordinates_or_forced_software(self):
        core_files = list((ROOT / "lib").rglob("*.py")) + list((ROOT / "probe").rglob("*.lua"))
        text = "\n".join(path.read_text() for path in core_files)
        self.assertNotIn("13206", text); self.assertNotIn("13549", text)
        self.assertNotIn("LIBGL_ALWAYS_SOFTWARE=1", text)
        self.assertNotIn("Xephyr", text)
        self.assertNotIn("runner.exe", text)


if __name__ == "__main__":
    unittest.main()
