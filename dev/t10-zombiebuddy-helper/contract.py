"""Fail-closed, offline contract for the bounded T10/E08 ZombieBuddy helper.

This module deliberately has no ZombieBuddy import, process-launch, window,
input, save, or filesystem-mutation capability.  It validates the immutable
authorization envelope an eventual reviewed adapter must present and produces
sanitized evidence records.  A separately installed helper is never trusted by
name: its exact bytes, owned runtime identities, and every symbolic action are
checked before an adapter may attempt one action.
"""

from __future__ import annotations

from dataclasses import asdict, dataclass
from hashlib import sha256
import json
import re
from typing import Iterable


SCENARIO = "t10-e08-disposable-fixture-v1"
SUPPORTED_GAME_VERSION = "42.20.4"
MAX_ACTIONS = 96
ALLOWED_PANES = frozenset({"player-inventory", "ground-inventory"})
ALLOWED_ACTIONS = frozenset({
    "open-inventory-context-menu",
    "activate-inspect",
    "activate-mark-interesting",
    "dismiss-inspect-reader",
    "reload-disposable-save",
})
ALLOWED_FIXTURES = frozenset({
    "t10-revealed-note", "t10-revealed-key", "t10-hidden-note",
    "t10-invalid-paperclip", "t10-fault-letter", "t10-unowned-photo",
})
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
SAFE_EVIDENCE_RE = re.compile(r"(?i)(physical[_ -]?token|token|secret|password|body|hidden[_ -]?truth)\s*[:=]\s*[^|\n]+")


class ContractError(ValueError):
    """A refused request; callers must perform no action after this error."""


@dataclass(frozen=True)
class RuntimeIdentity:
    """All values are sampled immediately before each helper action."""

    run_id: str
    process_pid: int
    process_start_ticks: int
    process_executable_sha256: str
    window_id: str
    window_title: str
    display: str
    active: bool
    focused: bool
    sole_matching_window: bool
    disposable_save_id: str
    disposable_save_sha256: str
    payload_sha256: str
    sample_age_seconds: float
    vanilla_handlers_present: bool
    foreign_handler_present: bool
    identity_gateway_current: bool
    cleanup_preflight_passed: bool


@dataclass(frozen=True)
class HelperProvenance:
    provider: str
    helper_sha256: str
    helper_version: str


@dataclass(frozen=True)
class Action:
    action_id: str
    ordinal: int
    pane: str
    verb: str
    fixture_case: str


@dataclass(frozen=True)
class Request:
    scenario: str
    supported_game_version: str
    provenance: HelperProvenance
    identity: RuntimeIdentity
    actions: tuple[Action, ...]


def _require_sha(value: str, field: str) -> None:
    if not isinstance(value, str) or not SHA256_RE.fullmatch(value):
        raise ContractError(f"{field} must be a lowercase SHA-256")


def _stable_identity(identity: RuntimeIdentity) -> tuple[object, ...]:
    """Exclude per-sample freshness/proof booleans from drift comparison."""
    return (
        identity.run_id, identity.process_pid, identity.process_start_ticks,
        identity.process_executable_sha256, identity.window_id, identity.window_title,
        identity.display, identity.active, identity.focused, identity.sole_matching_window,
        identity.disposable_save_id, identity.disposable_save_sha256, identity.payload_sha256,
    )


def validate_request(request: Request, *, previous_identity: RuntimeIdentity | None = None) -> None:
    """Validate one closed-world batch; every defect rejects the whole batch."""
    if request.scenario != SCENARIO:
        raise ContractError("scenario is not the single approved T10/E08 fixture scenario")
    if request.supported_game_version != SUPPORTED_GAME_VERSION:
        raise ContractError("unsupported Project Zomboid version")
    if request.provenance.provider != "ZombieBuddy":
        raise ContractError("helper provider must be exactly ZombieBuddy")
    if not request.provenance.helper_version:
        raise ContractError("helper version is required")
    _require_sha(request.provenance.helper_sha256, "helper provenance")

    identity = request.identity
    if not identity.run_id or not identity.window_id or not identity.window_title or not identity.display:
        raise ContractError("complete owned run/window/display identity is required")
    if identity.process_pid <= 0 or identity.process_start_ticks <= 0:
        raise ContractError("owned process PID and start identity are required")
    if not (identity.active and identity.focused and identity.sole_matching_window):
        raise ContractError("window must be the sole active focused owned target")
    if not isinstance(identity.sample_age_seconds, (int, float)) or not 0 <= identity.sample_age_seconds <= 1:
        raise ContractError("runtime identity is stale")
    if not (identity.vanilla_handlers_present and identity.foreign_handler_present and identity.identity_gateway_current):
        raise ContractError("cooperative handler or active-pair revalidation is missing")
    if not identity.cleanup_preflight_passed:
        raise ContractError("cleanup preflight failed")
    if not identity.disposable_save_id.startswith("T10_cooperative_inspect_"):
        raise ContractError("only the named disposable T10 save is allowed")
    for value, field in (
        (identity.process_executable_sha256, "process executable"),
        (identity.disposable_save_sha256, "disposable save"),
        (identity.payload_sha256, "payload"),
    ):
        _require_sha(value, field)
    if previous_identity is not None and _stable_identity(identity) != _stable_identity(previous_identity):
        raise ContractError("process/window/display/save/payload identity drifted")

    if not request.actions or len(request.actions) > MAX_ACTIONS:
        raise ContractError(f"action count must be between 1 and {MAX_ACTIONS}")
    ids: set[str] = set()
    for expected_ordinal, action in enumerate(request.actions, start=1):
        if not action.action_id or action.action_id in ids:
            raise ContractError("every action needs one unique action ID")
        ids.add(action.action_id)
        if action.ordinal != expected_ordinal:
            raise ContractError("actions must have contiguous bounded ordinals")
        if action.pane not in ALLOWED_PANES:
            raise ContractError("direct-world and non-inventory panes are prohibited")
        if action.verb not in ALLOWED_ACTIONS:
            raise ContractError("arbitrary input or gameplay action is prohibited")
        if action.fixture_case not in ALLOWED_FIXTURES:
            raise ContractError("actions may target only named disposable T10 fixtures")
        if action.pane == "ground-inventory" and action.verb == "activate-mark-interesting":
            raise ContractError("unowned Ground fixture cannot be marked")


def sanitize_raw_evidence(lines: Iterable[str]) -> tuple[str, ...]:
    """Keep raw event shape while redacting secrets, tokens, bodies and hidden truth."""
    sanitized: list[str] = []
    for line in lines:
        if not isinstance(line, str):
            raise ContractError("raw evidence must be text")
        sanitized.append(SAFE_EVIDENCE_RE.sub(lambda match: match.group(1) + "=<redacted>", line.rstrip("\r\n")))
    return tuple(sanitized)


def evidence_record(request: Request, raw_lines: Iterable[str]) -> dict[str, object]:
    """Return the retainable provenance/evidence record after full validation."""
    validate_request(request)
    raw = tuple(raw_lines)
    sanitized = sanitize_raw_evidence(raw)
    encoded_raw = "".join(f"{line}\n" for line in raw).encode("utf-8")
    return {
        "contract": SCENARIO,
        "supported_game_version": SUPPORTED_GAME_VERSION,
        "helper_provenance": asdict(request.provenance),
        "runtime_identity": asdict(request.identity),
        "actions": [asdict(action) for action in request.actions],
        "raw_evidence_sha256": sha256(encoded_raw).hexdigest(),
        "sanitized_raw_evidence": list(sanitized),
    }


def evidence_json(request: Request, raw_lines: Iterable[str]) -> str:
    return json.dumps(evidence_record(request, raw_lines), indent=2, sort_keys=True) + "\n"
