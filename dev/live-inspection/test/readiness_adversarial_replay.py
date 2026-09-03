#!/usr/bin/env python3
"""External recorded-state/adversarial replay for a selected repository tree."""
from __future__ import annotations

import argparse
import sys
import tempfile
from pathlib import Path


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("repository", type=Path)
    parser.add_argument("evidence", type=Path)
    args = parser.parse_args()
    repository = args.repository.resolve()
    sys.path.insert(0, str(repository / "dev/live-inspection/lib"))

    try:
        from PIL import Image, ImageDraw
        from live_inspection.cli import startup_gate_visual_evidence
        from live_inspection.model import Gate, HarnessError
        from live_inspection.state import GateResult, LogCursor, LogFollower, wait_for_gate
        from live_inspection.unattended import (
            InputEvidence, ReadinessIdentity, confirm_delivery,
        )

        checks = 0
        for run in ("20260902-191127-b0b11249", "20260902-191904-f39c5e1c"):
            ready = args.evidence / run / "screenshots/timeout-player-ready-modal-check-1.png"
            black = args.evidence / run / "screenshots/gate-menu.png"
            assert startup_gate_visual_evidence(
                ready, screenshot_size=(960, 1040), client_size=(960, 1008)
            )["status"] == "VISIBLE"
            assert startup_gate_visual_evidence(
                black, screenshot_size=(960, 1040), client_size=(960, 1008)
            )["status"] == "NOT_VISIBLE"
            checks += 2

        with tempfile.TemporaryDirectory() as temp:
            frame = Path(temp) / "generic.png"
            image = Image.new("RGB", (960, 1040), "black")
            ImageDraw.Draw(image).rectangle((430, 985, 530, 997), fill="white")
            image.save(frame)
            assert startup_gate_visual_evidence(
                frame, screenshot_size=(960, 1040), client_size=(960, 1008)
            )["status"] == "NOT_VISIBLE"
            checks += 1

        with tempfile.TemporaryDirectory() as temp:
            console = Path(temp) / "console.txt"
            console.write_text("PLAYER_READY before\n", encoding="utf-8")
            follower = LogFollower(console)
            boundary = follower.checkpoint()
            with console.open("a", encoding="utf-8") as stream:
                stream.write("PLAYER_READY after\n")
            result = wait_for_gate(
                Gate("ready", "PLAYER_READY", 1), follower, lambda: True,
                lambda *_: None, poll_seconds=0.001, cursor=boundary,
            )
            assert result.matched_line == "PLAYER_READY after"
            assert result.matched_start_offset == boundary.offset
            checks += 2

        selected_cursor = LogCursor(
            100, 10.0, 10_000_000_000, 9_000_000_000, 8, 9, False, 3
        )
        expected = ReadinessIdentity(
            "RUN-1", "SAVE-1", "OBSERVER-1", "SESSION-1", "production",
            "CandidateMod", "a" * 64, ("CandidateMod", "OBSERVER-1"),
            "42.20", "42.20.4",
        )
        pending = InputEvidence(
            display=":0", launcher_pid=111, launcher_start_time_ticks=1000,
            window_pid=222, window_start_time_ticks=2000, window_id=333,
            window_title="Project Zomboid", action="left-click", action_count=1,
            command_status="XTEST_EMITTED", delivery_status="PENDING_TRANSITION",
            signature="game loading took", signature_age_seconds=1.0,
            post_signature_settle_seconds=1, action_completed_monotonic=11.0,
            window_x=480, window_y=32, window_width=960, window_height=1008,
        action_x=480, action_y=504, root_x=960, root_y=536,
            active_window_id=333, focus_window_id=333, pointer_window_id=444,
            ready_screenshot={"status": "FRESH", "width": 960, "height": 1040},
            action_completed_wall_time_ns=11_000_000_000,
            pre_action_cursor=selected_cursor, readiness_identity=expected,
        )

        def transition(save: str) -> GateResult:
            fields = (
                "kind=PLAYER_READY|run=RUN-1|observer=OBSERVER-1|session=SESSION-1|"
                "sequence=4|emittedAtMs=12000|save=" + save + "|activeModCount=2|"
                "activeMods=CandidateMod,OBSERVER-1|payloadMode=production|"
                "payloadId=CandidateMod|payloadChecksum=" + "a" * 64 + "|gameVersion=42.20"
            )
            line = "[CF-INSPECT]|EVENT|" + fields
            return GateResult(
                "ready", 1, 0.1, line, 12.0, 12_100_000_000, 100,
                101 + len(line.encode("utf-8")), 12_000_000_000, 8, 9,
            )

        try:
            confirm_delivery(
                pending, transition=transition("WRONG"),
                identity_revalidator=lambda _value: {"status": "STABLE"},
            )
        except HarnessError:
            checks += 1
        else:
            raise AssertionError("wrong save identity was accepted")

        called = []
        confirmed = confirm_delivery(
            pending, transition=transition("SAVE-1"),
            identity_revalidator=lambda _value: called.append(True) or {"status": "STABLE"},
        )
        assert confirmed.delivery_status == "CONFIRMED" and called == [True]
        assert confirmed.transition_observation["record_start_offset"] == 100
        checks += 2
    except Exception as exc:
        print(f"FAIL readiness adversarial replay: {type(exc).__name__}: {exc}")
        return 1

    print(f"PASS readiness adversarial replay: {checks} assertions")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
