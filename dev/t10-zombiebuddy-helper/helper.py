"""Offline implementation of the fixed-fixture ZombieBuddy helper boundary.

The capability object is an adapter seam, not a PZ/ZombieBuddy import.  A real
bridge must implement these five named methods and nothing else is callable by
this helper.  The helper never launches a process, sends input, reads a save,
or chooses coordinates; it only authorizes and records one fixed symbolic
action at a time after refreshing the owned identity.
"""

from __future__ import annotations

from dataclasses import replace
from typing import Callable, Protocol

from contract import Action, Request, RuntimeIdentity, validate_request


class FixedFixtureCapabilities(Protocol):
    def open_inventory_context_menu(self, pane: str, fixture_case: str) -> None: ...
    def activate_inspect(self, pane: str, fixture_case: str) -> None: ...
    def activate_mark_interesting(self, pane: str, fixture_case: str) -> None: ...
    def dismiss_inspect_reader(self, pane: str, fixture_case: str) -> None: ...
    def reload_disposable_save(self, pane: str, fixture_case: str) -> None: ...


_METHODS = {
    "open-inventory-context-menu": "open_inventory_context_menu",
    "activate-inspect": "activate_inspect",
    "activate-mark-interesting": "activate_mark_interesting",
    "dismiss-inspect-reader": "dismiss_inspect_reader",
    "reload-disposable-save": "reload_disposable_save",
}


class ZombieBuddyT10E08Helper:
    """Execute only contract-approved symbolic actions; fail closed on drift."""

    def __init__(self, capabilities: FixedFixtureCapabilities) -> None:
        self._capabilities = capabilities
        self._completed_ids: set[str] = set()

    def execute(
        self,
        request: Request,
        identity_supplier: Callable[[], RuntimeIdentity],
    ) -> tuple[str, ...]:
        """Run a prevalidated batch with a fresh identity check before each action.

        Any capability exception or identity drift aborts immediately.  There is
        intentionally no retry or fallback path.
        """
        validate_request(request)
        completed: list[str] = []
        stable_identity = request.identity
        for action in request.actions:
            if action.action_id in self._completed_ids:
                raise RuntimeError("duplicate action requested")
            current = identity_supplier()
            validate_request(replace(request, identity=current), previous_identity=stable_identity)
            method_name = _METHODS[action.verb]
            method = getattr(self._capabilities, method_name, None)
            if not callable(method):
                raise RuntimeError("required fixed-fixture capability is unavailable")
            method(action.pane, action.fixture_case)
            self._completed_ids.add(action.action_id)
            completed.append(action.action_id)
            stable_identity = current
        return tuple(completed)
