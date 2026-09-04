import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class OwnerPhase:
    """Executable offline model of the probe's owner-held transition contract."""
    def __init__(self, identity, nonce, timeout_ticks=3):
        self.identity, self.nonce, self.timeout_ticks = identity, nonce, timeout_ticks
        self.state, self.ticks, self.events = "WAITING", 0, []

    def player_ready(self):
        assert self.state == "WAITING"
        self.events += ["PLAYER_READY", "OWNER_PHASE_READY"]
        self.state = "HOLD"

    def tick(self, release=None):
        if self.state != "HOLD":
            return
        self.ticks += 1
        if release is not None:
            expected = {**self.identity, "nonce": self.nonce, "status": "RELEASED"}
            if release == expected:
                self.state = "RUNNING"
                self.events.append("OWNER_PHASE_RELEASED")
                return
        if self.ticks >= self.timeout_ticks:
            self.state = "FAILED"
            self.events.append("OWNER_PHASE_FAILED")


class OwnerPhaseLifecycleTests(unittest.TestCase):
    identity = {"run_id": "RUN", "observer_id": "OBS", "session_id": "SESSION"}

    def test_ready_enters_hold_once_and_blocks_terminal_events(self):
        phase = OwnerPhase(self.identity, "N1")
        phase.player_ready(); phase.tick(); phase.tick()
        self.assertEqual(phase.state, "HOLD")
        self.assertEqual(phase.events, ["PLAYER_READY", "OWNER_PHASE_READY"])

    def test_exact_release_resumes_once(self):
        phase = OwnerPhase(self.identity, "N1"); phase.player_ready()
        phase.tick({**self.identity, "nonce": "N1", "status": "RELEASED"})
        phase.tick({**self.identity, "nonce": "N1", "status": "RELEASED"})
        self.assertEqual(phase.state, "RUNNING")
        self.assertEqual(phase.events.count("OWNER_PHASE_RELEASED"), 1)

    def test_foreign_stale_and_replayed_shape_releases_fail_closed(self):
        for key, value in (("run_id", "OTHER"), ("observer_id", "OTHER"), ("session_id", "OTHER"), ("nonce", "OLD"), ("status", "BAD")):
            phase = OwnerPhase(self.identity, "N1"); phase.player_ready()
            release = {**self.identity, "nonce": "N1", "status": "RELEASED"}; release[key] = value
            phase.tick(release)
            self.assertEqual(phase.state, "HOLD" if phase.ticks < phase.timeout_ticks else "FAILED")

    def test_timeout_fails_closed(self):
        phase = OwnerPhase(self.identity, "N1", timeout_ticks=2); phase.player_ready(); phase.tick(); phase.tick()
        self.assertEqual(phase.state, "FAILED")
        self.assertNotIn("OWNER_PHASE_RELEASED", phase.events)

    def test_runtime_source_has_hold_guard_and_bound_identity_checks(self):
        source = (ROOT / "probe/common/media/lua/client/ConspiracyFilesLiveInspection.lua").read_text()
        for marker in ("initialized = true", "OWNER_PHASE_READY", "elseif active and ownerHold then", "owner-phase-timeout", "Profile.runId", "Profile.observerId", "Profile.sessionId", "Profile.ownerPhase.nonce"):
            self.assertIn(marker, source)

    def test_lua_probe_parses_offline(self):
        result = subprocess.run(["lua5.1", "-e", 'assert(loadfile("probe/common/media/lua/client/ConspiracyFilesLiveInspection.lua"))'], cwd=ROOT, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_actual_lua_probe_replay_drives_hold_release_and_timeout(self):
        replay = ROOT / "test" / "owner_phase_probe_replay.lua"
        for mode in ("hold", "release", "lease-stale", "timeout", "malformed", "foreign", "stale", "duplicate", "pre-ready", "partial", "restart", "future", "missing-error", "read-error"):
            result = subprocess.run(["lua5.1", str(replay), mode], cwd=ROOT, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, mode + ": " + result.stderr)
            self.assertIn("ASSERT", result.stdout)


if __name__ == "__main__":
    unittest.main()
