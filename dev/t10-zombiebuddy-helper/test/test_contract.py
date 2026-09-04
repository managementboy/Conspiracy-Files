from __future__ import annotations

import sys
import unittest
from dataclasses import replace
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from contract import (  # noqa: E402
    Action, ContractError, HelperProvenance, Request, RuntimeIdentity,
    evidence_record, sanitize_raw_evidence, validate_request,
)
from helper import ZombieBuddyT10E08Helper  # noqa: E402

SHA = "a" * 64


def valid_request() -> Request:
    identity = RuntimeIdentity(
        run_id="run-20260904-01", process_pid=4242, process_start_ticks=12345,
        process_executable_sha256=SHA, window_id="0x042", window_title="Project Zomboid",
        display=":0", active=True, focused=True, sole_matching_window=True,
        disposable_save_id="T10_cooperative_inspect_20260904", disposable_save_sha256=SHA,
        payload_sha256=SHA, sample_age_seconds=0.25, vanilla_handlers_present=True,
        foreign_handler_present=True, identity_gateway_current=True, cleanup_preflight_passed=True,
    )
    actions = (
        Action("a1", 1, "player-inventory", "open-inventory-context-menu", "t10-revealed-note"),
        Action("a2", 2, "player-inventory", "activate-inspect", "t10-revealed-note"),
        Action("a3", 3, "ground-inventory", "activate-inspect", "t10-unowned-photo"),
    )
    return Request("t10-e08-disposable-fixture-v1", "42.20.4", HelperProvenance("ZombieBuddy", SHA, "pinned-test"), identity, actions)


class ContractTests(unittest.TestCase):
    def test_accepts_exact_bounded_fixture_request(self):
        validate_request(valid_request(), previous_identity=valid_request().identity)

    def test_rejects_identity_version_and_provenance_drift(self):
        request = valid_request()
        for changed in (
            replace(request, supported_game_version="42.20.5"),
            replace(request, provenance=replace(request.provenance, provider="other")),
            replace(request, identity=replace(request.identity, focused=False)),
            replace(request, identity=replace(request.identity, sample_age_seconds=2)),
            replace(request, identity=replace(request.identity, foreign_handler_present=False)),
            replace(request, identity=replace(request.identity, cleanup_preflight_passed=False)),
            replace(request, identity=replace(request.identity, disposable_save_id="player-save")),
        ):
            with self.subTest(changed=changed):
                with self.assertRaises(ContractError):
                    validate_request(changed)
        with self.assertRaises(ContractError):
            validate_request(request, previous_identity=replace(request.identity, window_id="0x999"))

    def test_rejects_direct_world_arbitrary_or_unbounded_actions(self):
        request = valid_request()
        bad_actions = (
            (Action("a1", 1, "direct-world", "activate-inspect", "t10-revealed-note"),),
            (Action("a1", 1, "player-inventory", "keypress", "t10-revealed-note"),),
            (Action("a1", 1, "ground-inventory", "activate-mark-interesting", "t10-unowned-photo"),),
            (Action("a1", 2, "player-inventory", "activate-inspect", "t10-revealed-note"),),
        )
        for actions in bad_actions:
            with self.subTest(actions=actions):
                with self.assertRaises(ContractError):
                    validate_request(replace(request, actions=actions))
        too_many = tuple(Action(str(index), index, "player-inventory", "activate-inspect", "t10-revealed-note") for index in range(1, 98))
        with self.assertRaises(ContractError):
            validate_request(replace(request, actions=too_many))

    def test_records_checksums_and_sanitized_raw_evidence(self):
        record = evidence_record(valid_request(), ["kind=MENU token=private", "body=hidden prose", "kind=PASS"])
        self.assertEqual(record["helper_provenance"]["helper_sha256"], SHA)
        self.assertEqual(len(record["raw_evidence_sha256"]), 64)
        self.assertEqual(record["sanitized_raw_evidence"], ["kind=MENU token=<redacted>", "body=<redacted>", "kind=PASS"])
        self.assertEqual(sanitize_raw_evidence(["secret: abc\n"]), ("secret=<redacted>",))

    def test_helper_invokes_only_named_capabilities_and_rechecks_identity(self):
        request = valid_request()
        calls = []

        class Capabilities:
            def open_inventory_context_menu(self, pane, fixture): calls.append(("open", pane, fixture))
            def activate_inspect(self, pane, fixture): calls.append(("inspect", pane, fixture))
            def activate_mark_interesting(self, pane, fixture): calls.append(("mark", pane, fixture))
            def dismiss_inspect_reader(self, pane, fixture): calls.append(("dismiss", pane, fixture))
            def reload_disposable_save(self, pane, fixture): calls.append(("reload", pane, fixture))

        helper = ZombieBuddyT10E08Helper(Capabilities())
        self.assertEqual(helper.execute(request, lambda: request.identity), ("a1", "a2", "a3"))
        self.assertEqual(calls, [("open", "player-inventory", "t10-revealed-note"), ("inspect", "player-inventory", "t10-revealed-note"), ("inspect", "ground-inventory", "t10-unowned-photo")])
        with self.assertRaises(RuntimeError):
            helper.execute(request, lambda: request.identity)

    def test_helper_aborts_before_capability_on_identity_drift(self):
        request = valid_request()
        calls = []
        class Capabilities:
            def open_inventory_context_menu(self, pane, fixture): calls.append(1)
        helper = ZombieBuddyT10E08Helper(Capabilities())
        drifted = replace(request.identity, window_id="drift")
        with self.assertRaises(ContractError):
            helper.execute(request, lambda: drifted)
        self.assertEqual(calls, [])


if __name__ == "__main__":
    unittest.main()
