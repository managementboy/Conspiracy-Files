from __future__ import annotations

import base64
import json
import subprocess
import sys
import tempfile
import time
import unittest
from io import BytesIO
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "lib"))

from live_inspection.config import load_profile
from live_inspection.cli import capture_screen, startup_gate_visual_evidence, render_lua_profile
from live_inspection.evidence import sanitize_line
from live_inspection.model import Gate, HarnessError
from live_inspection.safety import ControlTransaction, ExclusiveRunLock, assert_save_safety, parse_renderer, recover_interrupted_runs, sha256
from live_inspection.state import LogFollower, wait_for_gate
from unittest import mock


# Exact 121x21 lossless crops from retained real bright and dim animation
# frames. The dim crop was rejected before input by the fixed threshold.
RETAINED_CLICK_TO_START_CROPS = (
    "iVBORw0KGgoAAAANSUhEUgAAAHkAAAAVCAIAAADtrtY/AAAGM0lEQVR42u1Yb0gTfRz/8dwh22I2PHaHScu6MmvirFnB6hply1UQaRjMSJSgqCiN9cI3YYH1KiyJqLxehH8iWloNy20SbTTFDGfC0qTFjMgcTVsbizbuuufFPYzjbpvbeoLngX3e3fe+38997rfv9/f73ADIIossssgcUCpJeXl5Op2uvLxcLBb7fL5fv36x8Z6eHpIkRSKRw+EAANTW1nZ0dMzNzb1//z4JG6/qjwKGYY1GQxAEiqJzc3MURf13fwocx202G8NBJBJpbm5m7/b19TEM09rayl6ymd3d3ck5eVWLCigqKspMfENDQzAY5Irv7e2FYfj3mTNTCCdnefXqFYIgoVCou7t7YWFBo9Fs3759amoqbv65c+f279+/6FqnDpFIZLVafT7f1q1b060lCIIkSQiCLBbLyMhIcXGxTqfz+/1sa/8Oc8YKk631zZs3EQRxu927d+/+8uULG5TL5d++fYubHw6HBwYGotEoN1hRUbF27dpoNDo8PDw5ORm3UKVSwTAcCAQ+fPjAje/atQvH8VAopFarAQBer3dhYSFGu379+kAg8PTp01iQi8rKSgiCnjx5cuDAgdh+IpFIkjPL5XKdTocgyPz8vMVi4TLjOC6TySYmJgAAer1eoVB0dXVptdpECtOAWq2mKIqiKIIgUtwNeJcEQXi9Xu4IHz58WJh26tQphmF8Ph+O41zylpYWiqK45QaDQUhLUVRLS4tQW2trK8MwL1++FN5KxHzr1i1uMBwO19XVcV+WoiitVjs6OsrupdeuXYvLk3Zfb9y4EYKg2dnZ169fZzBcGIY9evQIQRCn0/n48eOcnJyKigqbzcZLq6ura29vn5+f1+v1vKYeHx83m81VVVUzMzNtbW0AgDdv3shksocPH6IoarFYrFYriqKNjY0XLlyYnZ0lSZJbbrVam5ubt23bZjKZzp8//+7du+TMAAC73b506VK73T49PW0wGI4dO9be3j4wMPD169d/jAQE9fb2SqVSs9n8+fNnp9OpUCiEPGmD7Yvx8fHUTznu5ZkzZxiG8Xg8IpEoUVV1dTVFUcFgMNHoNDU1MQwzNDQUiwhp2cjk5GTs0IvbvzabrbS0NAkzD1Kp1O/3MwyjUqm4soPBILtdpMjDxV9/yMBs3rwZAPDixYufP3/GTSgqKrp79y4AoL6+Pu6kp0hrs9loml6xYoVcLuclX7x4ccuWLffv36dpWqfTuVyu6urqJORSqfTkyZNtbW137tzp6ekRi8XCHLPZPDY2ltmaJFzrjx8/AgBQFBU2ZipgTyGfz5cooaamRiqVQhCU5DxIhTYSidA0DcNwXJ1jY2MGg2HNmjVOpxOCoOvXryd6nQ0bNng8nhs3bjQ0NCxfvlw4JSxmZmYy7r+Ea+1yuWiaxjBs06ZNGfD++PEDAFBYWJgo4dOnT4cOHQqFQqdPn07ebsIO4NLm5+fn5ORQFJVogFh7cOTIkUgkgmFYIklGoxFF0WfPnsnl8srKyoMHD37//v3fnfWEaz0xMeFyuSAIun37NtchiMXivLy8RXlHR0dZb4RhWMxycQs7OztNJpPRaIQgqKOjg2dChL3Mwm6382hramrYzoi5Uhb79u3Lz8+PXa5atQqG4Ugkwl1BLvPKlSsBAENDQ6wBLy8vR1E0rWnL3F9TFHX8+HGHw7Fu3brp6Wmn0xkMBhUKRUlJyd69e4WOgofOzs6zZ88WFha+ffu2v79/yZIlO3bsqK2t5RWSJLlnz56qqqqurq6dO3fyetPtdgMAysrKTCZTIBAYHBzs6+tzOBxarXZkZOT58+cFBQV6vZ6m6cuXL/MEHD16tL+/f2pqyuPxSCQSgiAgCLp37x77kwiZ3W63RqNpbGyUSCQikai+vj4ajcbdspMrfPDgQYZtX1payvtG93q9JSUlqfhrHMftdnus0O/3l5WVCdNkMhnrl69evSoUQJJkjOHEiRNsvslkihkMr9cbdwtqamrifqCHw+ErV65wd2EeM4Zhw8PDsWSj0Xjp0iWhDxH+tSBU+FsQi8VKpVKpVObm5qZbm5ubq1KpCgoKMn46y8B7NCtp0TFHEEStVq9evTpF5mXLlimVykQHY1oKs8giiyyy+L/ib0vqEZEnyaFvAAAAAElFTkSuQmCC",
    "iVBORw0KGgoAAAANSUhEUgAAAHkAAAAVCAIAAADtrtY/AAAG80lEQVR42u2XfUhTbxvHb373b26yyY5nuHzZLG1gjYXWhjlbYcxmLCpNCmvNKGsjoRRmsqXYtIhiYO+C5h8SVFBGtUZiDGe+bJRTe2NmllZjIep8m0PbOvX8cWCMzS1dPTw8sO9fZ/d9XZ9z3deuc53rABBWWGGFFbrgUoyoVGpmZiaHwyESiXa7/devX/j6xYsXq6uriUSi2WwGAOzYsUOtVk9MTHz58iUIzcfrv3s8CNevX8/lclEUHR8fxzDsf5jrf4NvM5nMqqoqPp/vWXG73Tdu3GhsbAQAkEgkKpVKIBDwrdzc3NTUVLFY3NHREYTp4/XbACCEnz9/DuFseXl5SqWSTCZ7VvR6vUKhwDP+J+TQIvw3OOXu3bsIgjidTp1ONzMzk5aWxuVyh4eHF7XXaDRbt27V6XR/qxCIRGJDQ4Pdbj948OByfblcrlqthhB2dXW9efMmKSmJz+dPTU3hif4TcsgRBst1VVUVgiBDQ0MymWx8fBxfjI6Onp2dXdR+fn6+s7PT7XZ7L2ZkZKxatcrtdr969erTp0+LOqakpEAIHQ6H1Wr18WUymU6nk81mAwBsNtvMzIxna/Xq1bOzsx0dHZ5Fb23atAlC2NbWdvLkSU8/iYyMDE6Ojo7OzMxEEGR6erqrq8ubzGQyo6KiBgcHAQACgSAuLu7Jkyc8Hi9QhMvINZvNTk9PxzDs3LlznkQDAKampgK5lJWVCYXChoaGq1ev4pV1/vz5hIQEj4FSqfSv+v3791dUVExOTkokEu/14uJiuVwOAFizZs29e/cAAOXl5U+fPvXBYhhWX19fV1e3aEgIgniuMQybm5sLQq6qqtq3b5/HfmFhoaamRqvVek6XlZVVVFRUVlbG4XDcbndSUlJBQYE/J5RcQwjHxsbevXsXwsNFo9GuXLmCIEhfX19bWxuBQNi4cWN3d7eP2a5du5RK5fT0tFwu9ynqgYGB9vZ2oVBos9lu3boFAHj//n1UVNSlS5dQFO3q6uru7kZRVCqVFhcXj42NNTc3e7t3d3cXFRVt2LChtrb22rVrIyMjwckAgJ6enqioqJ6enpGREbFYvHfvXpVK1dnZ6SkvCOHly5fJZLLBYBgbG+vt7Y2NjfXnLDvX8fHxAIDJycnv37+HkOvt27cjCGK1Wo8dO4YTbt686WOTnZ199uzZhYWFkpKSgYEBn12DwcBgMIRC4fj4+O3bt/FFiUSCoqjVai0pKcGxExMTKpWqsLDw4cOH3mNGb29vfX29XC4XiUQikchkMmk0mg8fPgQiAwBaWlpaWlrwa4vFsm3bNgRB6HS696NMIBAkEonFYsF/rlixwp8T4hwSstatWwcAePnyZaC/auXKlXjTqKio6O3tDRlrNBoxDIuPj8enOm/jurq69vb2w4cPi0QiPp9///59hUKh1+sDwclk8s6dOxMTEykUCoqiJBLJ38ZgMHgSvVz9E2jj27dvAAAURYlEYghc/C1kt9sDGeTk5JDJZAghl8v9E6zL5fr58yeEMCIiwt/eYrGcOnVKLBb39fVBCE+fPh3oOGvXrm1paamsrMzLy4uNjYUQBknLX861xWLBMIxGo3E4nBC48/Pznka0qEZHRxUKhdPpPHDgQHZ29hKx+FG9sTExMQQCAcMwl8sVyMtms6lUKpfLRaPRAoV06NAhFEU7OjoEAoFMJistLXU4HH/3WQ+Y68HBwYGBAQjhmTNnmEym90RJpVJ/y3379i0+G9FoNM+LxdtRq9W2trZqNBoIoVqt9r6F/7eP57qnp8cHm5OTg1eGTwPZsmVLTEyM5yeDwYAQut1ufBTxJzMYDABAf38/3vQ5HA6KoktM4qLdZhn9GsOw6urqpqam5ORknU7X398/NzcXFxfHYrGOHz9uNBqDc7VabWFhYUJCwuPHj58/fx4ZGZmenl5eXu7j2NzcvHnzZqFQeOHChSNHjvg0948fP+ITVW1trcPhMBqNer3ebDbzeLw7d+68ePGCTqcLBAIMw/xfvPn5+UKhcHh4+OvXryQSicvlQggfPXqE/yX+5KGhobS0NKlUGhkZGRERkZub++PHj0CdJEiEra2ty65rfDaSSqUmkwlCyOPxsrKyUlJSRkdHfSpoUTkcjqNHj5rNZgRBdu/eLRKJ8KnG37KystJms6WmppaWlvpsmUymBw8eAABEIlF+fj6CIBiGnThx4tmzZ7GxsXv27BEIBDabTaFQdHZ2+viazWan05mcnJyVlZWRkYFhWFNTU01NTSDy9evXX79+jaKoTCYrKChobGzEx7jg8uf8hW9lFovFYrEoFMpyfSkUSkpKCp1OD/nuOMHn1nhIv33MEQRhs9mJiYlLJNPpdBaL9dtyXkqEYYUVVlhh/b/qP+5DW4tgiMQFAAAAAElFTkSuQmCC",
)

# Exact crop from the dim legitimate frame:
# conspiracy-files-click-cycle-live-retry/outputs/live-inspection/20260903-132427-239c304f/screenshots/startup-gate-ready.png
RETAINED_DIM_CLICK_TO_START_CROP = "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"


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
[unattended_startup]
supported_game_version="42.20.4"
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

    def test_owner_phase_profile_is_attended_and_finite(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); path = root / "profile.toml"
            path.write_text(profile_text(root) + "\n[owner_phase]\nenabled=true\ntimeout_seconds=7200\n")
            profile = load_profile(path)
            self.assertEqual(profile.owner_phase, {"enabled": True, "timeout_seconds": 7200})

    def test_owner_phase_rejects_excessive_timeout(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); path = root / "profile.toml"
            path.write_text(profile_text(root) + "\n[owner_phase]\nenabled=true\ntimeout_seconds=86401\n")
            with self.assertRaisesRegex(HarnessError, "<= 86400"):
                load_profile(path)

    def test_owner_release_protocol_is_rendered_with_nonce_and_identity_path(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp); path = root / "profile.toml"
            path.write_text(profile_text(root) + "\n[owner_phase]\nenabled=true\ntimeout_seconds=7200\n")
            profile = load_profile(path)
            identity = type("Identity", (), {"active_mod_ids": ("CF_LiveInspection_test",), "run_id": "RUN", "save_name": "SAVE", "observer_id": "OBS", "session_id": "SESSION", "payload_mode": "probe", "payload_id": "OBS", "payload_checksum": "x", "expected_game_version": "42.20"})()
            rendered = render_lua_profile(profile, profile.sites, identity, root / "owner-release", "NONCE")
            self.assertIn("timeoutSeconds = 7200", rendered)
            self.assertIn('nonce = "NONCE"', rendered)
            self.assertIn("owner-release", rendered)

    def test_checked_in_owner_attended_profile_is_manual_only(self):
        profile = load_profile(ROOT / "profiles/cf-v01-e08-owner-attended.toml")
        self.assertTrue(profile.owner_phase["enabled"])
        self.assertEqual(profile.criteria, ("T10", "CF-V01-E08"))
        self.assertFalse(profile.unattended_startup.enabled)


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

    def test_gate_retains_later_lines_from_the_same_read(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"
            path.write_text("FIRST\nSECOND\n")
            follower = LogFollower(path)
            first = wait_for_gate(Gate("first", "FIRST", 1), follower, lambda: True, lambda *_: None, poll_seconds=0.001)
            second = wait_for_gate(Gate("second", "SECOND", 1), follower, lambda: True, lambda *_: None, poll_seconds=0.001)
            self.assertEqual((first.matched_line, second.matched_line), ("FIRST", "SECOND"))

    def test_stale_buffered_log_cannot_satisfy_post_action_gate(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"
            path.write_text("PLAYER_READY stale\n")
            follower = LogFollower(path)
            stale = follower.read_records()
            follower.prepend_records(stale)
            cursor = follower.checkpoint()
            action_completed = time.monotonic()
            with path.open("a", encoding="utf-8") as stream:
                stream.write("PLAYER_READY fresh\n")
            result = wait_for_gate(
                Gate("player-ready", "PLAYER_READY", 1), follower, lambda: True, lambda *_: None,
                poll_seconds=0.001, not_before=action_completed, cursor=cursor,
            )
            self.assertEqual(result.matched_line, "PLAYER_READY fresh")

    def test_required_screenshot_refuses_preexisting_stale_file(self):
        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "ready.png"
            destination.write_bytes(b"old")
            with self.assertRaisesRegex(HarnessError, "stale screenshot"):
                capture_screen(destination, required=True)

    def test_required_screenshot_records_fresh_png_dimensions(self):
        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "ready.png"

            def command(*_args, **_kwargs):
                destination.write_bytes(b"\x89PNG\r\n\x1a\n" + b"\x00\x00\x00\x0dIHDR" + (960).to_bytes(4, "big") + (1040).to_bytes(4, "big") + b"x")
                return subprocess.CompletedProcess([], 0, "", "")

            with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                "live_inspection.cli.run_command", side_effect=command
            ):
                evidence = capture_screen(destination, required=True)
            self.assertEqual((evidence["status"], evidence["width"], evidence["height"]), ("FRESH", 960, 1040))
            self.assertIn("captured_wall_time_ns", evidence)

    def test_optional_post_action_screenshot_records_transition_without_failure(self):
        from PIL import Image

        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "post-action.png"

            def command(*_args, **_kwargs):
                Image.new("RGB", (960, 1040), "black").save(destination)
                return subprocess.CompletedProcess([], 0, "", "")

            with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                "live_inspection.cli.run_command", side_effect=command
            ):
                evidence = capture_screen(
                    destination,
                    startup_client_size=(960, 1008),
                    require_startup_control_visible=False,
                )
            self.assertEqual(evidence["status"], "FRESH")
            self.assertEqual(evidence["startup_gate_visual"]["status"], "NOT_VISIBLE")

    def test_optional_post_action_screenshot_preserves_visible_control_metadata(self):
        from PIL import Image

        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "post-action.png"

            def command(*_args, **_kwargs):
                image = Image.new("RGB", (960, 1040), "black")
                crop = Image.open(BytesIO(base64.b64decode(RETAINED_CLICK_TO_START_CROPS[0]))).convert("RGB")
                image.paste(crop, (420, 982))
                image.save(destination)
                return subprocess.CompletedProcess([], 0, "", "")

            with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                "live_inspection.cli.run_command", side_effect=command
            ):
                evidence = capture_screen(
                    destination,
                    startup_client_size=(960, 1008),
                    require_startup_control_visible=False,
                )
            self.assertEqual(evidence["startup_gate_visual"]["status"], "VISIBLE")

    def test_optional_post_action_screenshot_returns_unavailable_for_stale_destination(self):
        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "post-action.png"
            destination.write_bytes(b"old")
            evidence = capture_screen(
                destination,
                required=False,
                startup_client_size=(960, 1008),
                require_startup_control_visible=False,
            )
            self.assertEqual(evidence["status"], "UNAVAILABLE")

    def test_optional_post_action_screenshot_converts_capture_exception_to_unavailable(self):
        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "post-action.png"

            with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                "live_inspection.cli.run_command", side_effect=RuntimeError("boom")
            ):
                evidence = capture_screen(
                    destination,
                    startup_client_size=(960, 1008),
                    require_startup_control_visible=False,
                )
            self.assertEqual(evidence["status"], "UNAVAILABLE")
            self.assertIn("boom", evidence["reason"])

    def test_black_post_signature_frame_is_not_startup_ready(self):
        from PIL import Image

        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp) / "ready.png"

            def command(*_args, **_kwargs):
                Image.new("RGB", (960, 1040), "black").save(destination)
                return subprocess.CompletedProcess([], 0, "", "")

            with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                "live_inspection.cli.run_command", side_effect=command
            ), self.assertRaisesRegex(HarnessError, "startup readiness screenshot does not show"):
                capture_screen(destination, required=True, startup_client_size=(960, 1008))

    def test_adversarial_control_shapes_are_not_startup_ready(self):
        from PIL import Image, ImageDraw

        source = Image.open(BytesIO(base64.b64decode(RETAINED_DIM_CLICK_TO_START_CROP))).convert("RGB")
        generic = Image.new("RGB", source.size, (100, 100, 100))
        ImageDraw.Draw(generic).rectangle((8, 4, 112, 16), fill=(144, 144, 144))
        cases = {
            "tip-only": source.crop((0, 0, 121, 8)),
            "partial-cropped": source.crop((12, 0, 109, 21)),
            "generic-rectangle": generic,
        }
        for name, crop in cases.items():
            with self.subTest(shape=name), tempfile.TemporaryDirectory() as temp:
                path = Path(temp) / "ready.png"
                frame = Image.new("RGB", (960, 1040), "black")
                frame.paste(crop, (420, 982))
                frame.save(path)
                visual = startup_gate_visual_evidence(
                    path, screenshot_size=(960, 1040), client_size=(960, 1008)
                )
                self.assertEqual(visual["status"], "NOT_VISIBLE")

    def test_shifted_control_is_not_startup_ready(self):
        from PIL import Image

        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "ready.png"
            frame = Image.new("RGB", (960, 1040), "black")
            crop = Image.open(BytesIO(base64.b64decode(RETAINED_DIM_CLICK_TO_START_CROP))).convert("RGB")
            frame.paste(crop, (430, 982))
            frame.save(path)
            visual = startup_gate_visual_evidence(
                path, screenshot_size=(960, 1040), client_size=(960, 1008)
            )
            self.assertEqual(visual["status"], "NOT_VISIBLE")

    def test_wrong_frame_geometry_is_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "ready.png"
            path.write_bytes(b"not-a-frame")
            with self.assertRaisesRegex(HarnessError, "supported only"):
                startup_gate_visual_evidence(path, screenshot_size=(800, 600), client_size=(800, 568))

    def test_visible_lower_center_control_is_startup_ready(self):
        from PIL import Image

        accepted_crops = RETAINED_CLICK_TO_START_CROPS + (RETAINED_DIM_CLICK_TO_START_CROP,)
        for crop_index, encoded in enumerate(accepted_crops, 1):
            with self.subTest(retained_frame=crop_index), tempfile.TemporaryDirectory() as temp:
                destination = Path(temp) / "ready.png"

                def command(*_args, **_kwargs):
                    image = Image.new("RGB", (960, 1040), "black")
                    crop = Image.open(BytesIO(base64.b64decode(encoded))).convert("RGB")
                    image.paste(crop, (420, 982))
                    image.save(destination)
                    return subprocess.CompletedProcess([], 0, "", "")

                with mock.patch("live_inspection.cli.shutil.which", return_value="/usr/bin/gnome-screenshot"), mock.patch(
                    "live_inspection.cli.run_command", side_effect=command
                ):
                    evidence = capture_screen(destination, required=True, startup_client_size=(960, 1008))
                visual = evidence["startup_gate_visual"]
                self.assertEqual(visual["status"], "VISIBLE")
                self.assertGreaterEqual(visual["template_dice"], visual["minimum_template_dice"])
                self.assertIn("captured_wall_time_ns", evidence)

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
        production = "\n".join(path.read_text() for path in (ROOT.parent.parent / "mod").rglob("*.lua"))
        self.assertNotRegex(production, r'require\("ConspiracyFiles\.')
        unattended = (ROOT / "lib/live_inspection/unattended.py").read_text()
        self.assertNotIn("ButtonPress, 3", unattended)
        self.assertNotIn("ButtonRelease, 3", unattended)
        self.assertNotIn("KeyPress", unattended)
        self.assertNotIn("KeyRelease", unattended)
        self.assertEqual(unattended.count("button_press=X.ButtonPress"), 1)
        self.assertEqual(unattended.count("button_release=X.ButtonRelease"), 1)
        self.assertLess(unattended.index("button_press=X.ButtonPress"), unattended.index("button_release=X.ButtonRelease"))


if __name__ == "__main__":
    unittest.main()
