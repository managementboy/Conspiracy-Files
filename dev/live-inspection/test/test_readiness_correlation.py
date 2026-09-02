from __future__ import annotations

import os
import sys
import tempfile
import types
import unittest
from dataclasses import replace
from pathlib import Path
from unittest import mock

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "lib"))

from live_inspection.cli import startup_gate_visual_evidence
from live_inspection.model import Gate, HarnessError, UnattendedStartup
from live_inspection.state import GateResult, LogCursor, LogFollower, wait_for_gate
from live_inspection.unattended import (
    InputEvidence,
    ProcessIdentity,
    ReadinessIdentity,
    StartupGateController,
    WindowSnapshot,
    confirm_delivery,
    fail_delivery,
)


def identity() -> ReadinessIdentity:
    return ReadinessIdentity(
        "RUN-1", "SAVE-1", "OBSERVER-1", "SESSION-1", "production",
        "CandidateMod", "a" * 64, ("CandidateMod", "OBSERVER-1"),
    )


def cursor(*, offset: int = 100, sequence: int = 3, partial: bool = False) -> LogCursor:
    return LogCursor(
        offset, 10.0, 10_000_000_000, 9_000_000_000, 8, 9, partial, sequence
    )


def evidence(*, selected_cursor: LogCursor | None = None) -> InputEvidence:
    return InputEvidence(
        display=":0", launcher_pid=111, launcher_start_time_ticks=1000,
        window_pid=222, window_start_time_ticks=2000, window_id=333,
        window_title="Project Zomboid", action="left-click", action_count=1,
        command_status="XTEST_EMITTED", delivery_status="PENDING_TRANSITION",
        signature="game loading took", signature_age_seconds=1.1,
        post_signature_settle_seconds=1, action_completed_monotonic=11.0,
        window_x=480, window_y=32, window_width=960, window_height=1008,
        action_x=480, action_y=960, root_x=960, root_y=992,
        active_window_id=333, focus_window_id=333, pointer_window_id=444,
        ready_screenshot={"status": "FRESH", "width": 960, "height": 1040},
        action_completed_wall_time_ns=11_000_000_000,
        pre_action_cursor=selected_cursor or cursor(), readiness_identity=identity(),
    )


def ready_line(**updates: str) -> str:
    fields = {
        "kind": "PLAYER_READY", "run": "RUN-1", "observer": "OBSERVER-1",
        "session": "SESSION-1", "sequence": "4", "emittedAtMs": "12000",
        "save": "SAVE-1", "activeModCount": "2",
        "activeMods": "CandidateMod,OBSERVER-1", "payloadMode": "production",
        "payloadId": "CandidateMod", "payloadChecksum": "a" * 64,
        "gameVersion": "42.20.4",
    }
    fields.update(updates)
    return "LOG  : Lua f:0> [CF-INSPECT]|EVENT|" + "|".join(
        f"{key}={value}" for key, value in fields.items()
    )


def observed(line: str | None = None, *, selected_cursor: LogCursor | None = None) -> GateResult:
    selected_cursor = selected_cursor or cursor()
    line = line or ready_line()
    return GateResult(
        "player-ready-modal-check", 1, 0.1, line, 12.1,
        12_100_000_000, selected_cursor.offset,
        selected_cursor.offset + len(line.encode("utf-8")) + 1,
        12_000_000_000, selected_cursor.log_device, selected_cursor.log_inode,
    )


class LogCursorBoundaryTests(unittest.TestCase):
    def test_independent_qa_unread_pre_action_transition_rejected(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"
            before = ready_line(sequence="3", emittedAtMs="9000")
            path.write_text(before + "\n", encoding="utf-8")
            follower = LogFollower(path)
            boundary = follower.checkpoint()
            self.assertEqual(boundary.offset, len((before + "\n").encode("utf-8")))
            after = ready_line(sequence="4", emittedAtMs="12000")
            with path.open("a", encoding="utf-8") as stream:
                stream.write(after + "\n")
            result = wait_for_gate(
                Gate("player-ready", r"\[CF-INSPECT\].*kind=PLAYER_READY", 1),
                follower, lambda: True, lambda *_: None, poll_seconds=0.001,
                cursor=boundary,
            )
            self.assertEqual(result.matched_line, after)
            self.assertEqual(result.matched_start_offset, boundary.offset)

    def test_partial_line_crossing_cursor_is_discarded(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"
            crossing = ready_line(sequence="3", emittedAtMs="9000")
            split = len(crossing) // 2
            path.write_text(crossing[:split], encoding="utf-8")
            follower = LogFollower(path)
            boundary = follower.checkpoint()
            self.assertTrue(boundary.partial_record_at_boundary)
            valid = ready_line(sequence="4", emittedAtMs="12000")
            with path.open("a", encoding="utf-8") as stream:
                stream.write(crossing[split:] + "\n" + valid + "\n")
            result = wait_for_gate(
                Gate("player-ready", r"\[CF-INSPECT\].*kind=PLAYER_READY", 1),
                follower, lambda: True, lambda *_: None, poll_seconds=0.001,
                cursor=boundary,
            )
            self.assertEqual(result.matched_line, valid)
            self.assertGreater(result.matched_start_offset or 0, boundary.offset)

    def test_buffered_pre_action_source_timestamp_is_rejected(self):
        line = ready_line(sequence="4", emittedAtMs="10000")
        with self.assertRaisesRegex(HarnessError, "emitted before"):
            confirm_delivery(
                evidence(), transition=observed(line),
                identity_revalidator=lambda _value: {"status": "STABLE"},
            )

    def test_duplicate_or_conflicting_post_cursor_records_fail_closed(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "console.txt"
            path.write_text("before\n", encoding="utf-8")
            follower = LogFollower(path)
            boundary = follower.checkpoint()
            with path.open("a", encoding="utf-8") as stream:
                stream.write(ready_line(sequence="4") + "\n")
                stream.write(ready_line(sequence="5", payloadId="WrongMod") + "\n")
            with self.assertRaisesRegex(HarnessError, "duplicate or conflicting"):
                wait_for_gate(
                    Gate("player-ready", r"\[CF-INSPECT\].*kind=PLAYER_READY", 1),
                    follower, lambda: True, lambda *_: None, poll_seconds=0.001,
                    cursor=boundary,
                )


class ReadinessCorrelationTests(unittest.TestCase):
    def test_complete_identity_confirms_and_preserves_offsets_and_timestamps(self):
        result = confirm_delivery(
            evidence(), transition=observed(),
            identity_revalidator=lambda _value: {
                "status": "STABLE", "window_id": 333, "window_width": 960,
                "window_height": 1008,
            },
        )
        self.assertEqual(result.delivery_status, "CONFIRMED")
        self.assertEqual(result.transition_observation["record_start_offset"], 100)
        self.assertEqual(result.transition_observation["source_sequence"], 4)
        self.assertEqual(result.confirmation_identity["status"], "STABLE")

    def test_wrong_missing_malformed_and_conflicting_fields_are_rejected(self):
        cases = {
            "wrong-run": ready_line(run="OTHER"),
            "wrong-save": ready_line(save="OTHER"),
            "wrong-payload-id": ready_line(payloadId="OtherMod"),
            "wrong-payload-checksum": ready_line(payloadChecksum="b" * 64),
            "wrong-observer": ready_line(observer="OTHER"),
            "wrong-session": ready_line(session="OTHER"),
            "wrong-active-mods": ready_line(activeMods="OBSERVER-1,CandidateMod"),
            "missing-run": ready_line().replace("|run=RUN-1", ""),
            "missing-save": ready_line().replace("|save=SAVE-1", ""),
            "missing-payload": ready_line().replace("|payloadChecksum=" + "a" * 64, ""),
            "missing-observer": ready_line().replace("|observer=OBSERVER-1", ""),
            "missing-session": ready_line().replace("|session=SESSION-1", ""),
            "malformed-sequence": ready_line(sequence="04"),
            "wrong-kind": ready_line(kind="PRODUCTION_READY"),
            "conflicting-run": ready_line() + "|run=OTHER",
        }
        for name, line in cases.items():
            with self.subTest(name=name), self.assertRaises(HarnessError):
                confirm_delivery(
                    evidence(), transition=observed(line),
                    identity_revalidator=lambda _value: {"status": "STABLE"},
                )

    def test_replayed_or_reordered_sequence_and_duplicate_confirmation_are_rejected(self):
        for sequence in ("2", "3"):
            with self.subTest(sequence=sequence), self.assertRaisesRegex(HarnessError, "replayed or reordered"):
                confirm_delivery(
                    evidence(), transition=observed(ready_line(sequence=sequence)),
                    identity_revalidator=lambda _value: {"status": "STABLE"},
                )
        confirmed = confirm_delivery(
            evidence(), transition=observed(),
            identity_revalidator=lambda _value: {"status": "STABLE"},
        )
        with self.assertRaisesRegex(HarnessError, "already been finalized"):
            confirm_delivery(
                confirmed, transition=observed(ready_line(sequence="5")),
                identity_revalidator=lambda _value: {"status": "STABLE"},
            )

    def test_process_or_window_drift_after_ready_never_leaves_a_pass(self):
        pending = evidence()
        for reason in (
            "launcher PID/start-time drift", "window PID/start-time drift", "wrong XID",
            "960x1008 geometry drift", "active window drift", "focus drift",
        ):
            with self.subTest(reason=reason), self.assertRaisesRegex(HarnessError, "drift|wrong XID"):
                confirm_delivery(
                    pending, transition=observed(),
                    identity_revalidator=lambda _value, message=reason: (_ for _ in ()).throw(
                        HarnessError(message)
                    ),
                )
            self.assertEqual(pending.delivery_status, "PENDING_TRANSITION")
            self.assertEqual(fail_delivery(pending, reason=reason).delivery_status, "NOT_CONFIRMED")

    def test_delivery_revalidation_checks_live_process_window_focus_and_geometry(self):
        class Node:
            def __init__(self, window_id: int, parent=None):
                self.id, self.parent = window_id, parent

            def query_tree(self):
                return types.SimpleNamespace(parent=self.parent)

        root_node = Node(1)
        window_node = Node(333, root_node)
        launcher = ProcessIdentity(111, 111, 1000)
        current = WindowSnapshot(
            window_node, ProcessIdentity(222, 111, 2000), 333,
            "Project Zomboid", 480, 32, 960, 1008,
        )

        class Root:
            active = 333

            def get_full_property(self, _atom, _type):
                return types.SimpleNamespace(value=[self.active])

        class Connection:
            def __init__(self):
                self.root = Root()
                self.focus = window_node

            def screen(self):
                return types.SimpleNamespace(root=self.root)

            def intern_atom(self, _name):
                return "active"

            def get_input_focus(self):
                return types.SimpleNamespace(focus=self.focus)

            def create_resource_object(self, _kind, window_id):
                return window_node if window_id == 333 else Node(window_id, root_node)

            def close(self):
                pass

        connection = Connection()
        fake_xlib = types.ModuleType("Xlib")
        fake_xlib.X = types.SimpleNamespace(AnyPropertyType=0)
        fake_xlib.display = types.SimpleNamespace(Display=lambda _name: connection)
        controller = StartupGateController(
            UnattendedStartup(True, "left-click", 1, 10, 1),
            identity_reader=lambda _pid: launcher,
        )
        controller.used = True
        with mock.patch.dict(sys.modules, {"Xlib": fake_xlib}), \
                mock.patch.dict(os.environ, {"DISPLAY": ":0"}), \
                mock.patch.object(controller, "_owned_windows", return_value=[current]):
            stable = controller.revalidate_delivery_identity(evidence())
        self.assertEqual((stable["status"], stable["window_id"]), ("STABLE", 333))

        drifted = replace(current, process=ProcessIdentity(222, 111, 2001))
        with mock.patch.dict(sys.modules, {"Xlib": fake_xlib}), \
                mock.patch.dict(os.environ, {"DISPLAY": ":0"}), \
                mock.patch.object(controller, "_owned_windows", return_value=[drifted]), \
                self.assertRaisesRegex(HarnessError, "PID/start-time"):
            controller.revalidate_delivery_identity(evidence())

        for name, changed, message in (
            ("xid", replace(current, window_id=444), "wrong window"),
            ("geometry", replace(current, width=959), "geometry"),
        ):
            with self.subTest(drift=name), mock.patch.dict(sys.modules, {"Xlib": fake_xlib}), \
                    mock.patch.dict(os.environ, {"DISPLAY": ":0"}), \
                    mock.patch.object(controller, "_owned_windows", return_value=[changed]), \
                    self.assertRaisesRegex(HarnessError, message):
                controller.revalidate_delivery_identity(evidence())

        connection.root.active = 999
        with mock.patch.dict(sys.modules, {"Xlib": fake_xlib}), \
                mock.patch.dict(os.environ, {"DISPLAY": ":0"}), \
                mock.patch.object(controller, "_owned_windows", return_value=[current]), \
                self.assertRaisesRegex(HarnessError, "no longer active"):
            controller.revalidate_delivery_identity(evidence())
        connection.root.active = 333
        connection.focus = Node(999, root_node)
        with mock.patch.dict(sys.modules, {"Xlib": fake_xlib}), \
                mock.patch.dict(os.environ, {"DISPLAY": ":0"}), \
                mock.patch.object(controller, "_owned_windows", return_value=[current]), \
                self.assertRaisesRegex(HarnessError, "no longer has X11 focus"):
            controller.revalidate_delivery_identity(evidence())


class StartupVisualAdversarialTests(unittest.TestCase):
    def classify(self, draw) -> dict[str, object]:
        temporary = tempfile.TemporaryDirectory()
        self.addCleanup(temporary.cleanup)
        path = Path(temporary.name) / "frame.png"
        image = Image.new("RGB", (960, 1040), "black")
        draw(ImageDraw.Draw(image))
        image.save(path)
        return startup_gate_visual_evidence(
            path, screenshot_size=(960, 1040), client_size=(960, 1008)
        )

    def test_independent_qa_generic_white_rectangles_at_varied_positions_and_sizes_fail(self):
        rectangles = (
            (430, 985, 530, 997), (420, 982, 540, 1002),
            (10, 985, 110, 997), (430, 900, 530, 912), (470, 989, 490, 994),
        )
        for rectangle in rectangles:
            with self.subTest(rectangle=rectangle):
                result = self.classify(lambda drawing, box=rectangle: drawing.rectangle(box, fill="white"))
                self.assertEqual(result["status"], "NOT_VISIBLE")

    def test_loading_black_and_stale_position_frames_fail_closed(self):
        frames = (
            lambda _drawing: None,
            lambda drawing: drawing.rectangle((200, 1010, 760, 1016), fill=(190, 190, 190)),
            lambda drawing: drawing.text((430, 930), "Click to Start", fill="white"),
        )
        for index, draw in enumerate(frames):
            with self.subTest(frame=index):
                self.assertEqual(self.classify(draw)["status"], "NOT_VISIBLE")

    def test_wrong_dimension_frames_are_unsupported(self):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "wrong.png"
            Image.new("RGB", (959, 1040), "black").save(path)
            with self.assertRaisesRegex(HarnessError, "supported only"):
                startup_gate_visual_evidence(
                    path, screenshot_size=(959, 1040), client_size=(959, 1008)
                )


if __name__ == "__main__":
    unittest.main()
