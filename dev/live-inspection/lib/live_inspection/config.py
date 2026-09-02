from __future__ import annotations

import os
import re
import tomllib
from pathlib import Path

from .model import Gate, HarnessError, Payload, Profile, Site, UnattendedStartup

ID_RE = re.compile(r"^[A-Za-z][A-Za-z0-9_-]{1,63}$")
CONTROL_ALLOWLIST = {"latestSave.ini", "mods/default.txt", "options.ini", "debuglog.ini"}
GATE_ACTIONS = {"wait", "manual", "screenshot", "startup-gate"}
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
FORBIDDEN_UNATTENDED_CRITERIA = {"T10", "E08", "CF-V01-E08"}
FORBIDDEN_INTERACTION_WORDS = ("inventory", "context", "menu", "right-click", "gameplay", "accept")
WINDOW_TITLE_PATTERNS = {r"(?i)project zomboid", r"(?i)^project zomboid(?:\s.*)?$"}
REQUIRED_GATE_ORDER = (
    "menu", "world-loading", "click-to-start", "player-ready-modal-check",
    "chunk-streaming", "scan-completion", "run-completion", "normal-exit",
)


def _path(value: str, base: Path) -> Path:
    expanded = Path(os.path.expandvars(os.path.expanduser(value)))
    return (base / expanded).resolve() if not expanded.is_absolute() else expanded.resolve()


def _positive_int(value: object, label: str, *, minimum: int = 1) -> int:
    if not isinstance(value, int) or isinstance(value, bool) or value < minimum:
        raise HarnessError(f"{label} must be an integer >= {minimum}")
    return value


def load_profile(path: Path) -> Profile:
    path = path.resolve()
    try:
        raw = tomllib.loads(path.read_text(encoding="utf-8"))
    except (OSError, tomllib.TOMLDecodeError) as exc:
        raise HarnessError(f"cannot load profile {path}: {exc}") from exc
    base = path.parent
    run = raw.get("run", {})
    paths = raw.get("paths", {})
    safety = raw.get("safety", {})
    acceptance = raw.get("acceptance", {})
    unattended_raw = raw.get("unattended_startup", {})
    payload_raw = raw.get("payload", {})
    profile_id = run.get("profile_id", "")
    probe_id = run.get("probe_id", "")
    for label, value in (("profile_id", profile_id), ("probe_id", probe_id)):
        if not isinstance(value, str) or not ID_RE.fullmatch(value):
            raise HarnessError(f"{label} must match {ID_RE.pattern}")
    required_paths = ("source_save", "pz_user_root", "launcher", "evidence_root")
    missing = [key for key in required_paths if not isinstance(paths.get(key), str)]
    if missing:
        raise HarnessError("missing path setting(s): " + ", ".join(missing))
    controls = tuple(safety.get("controls", sorted(CONTROL_ALLOWLIST)))
    if not controls or set(controls) - CONTROL_ALLOWLIST:
        raise HarnessError("controls must be a non-empty subset of the protected allowlist")
    sites: list[Site] = []
    seen: set[str] = set()
    for index, item in enumerate(raw.get("sites", [])):
        site_id = item.get("id", "")
        if not isinstance(site_id, str) or not ID_RE.fullmatch(site_id) or site_id in seen:
            raise HarnessError(f"sites[{index}].id is invalid or duplicated")
        seen.add(site_id)
        bounds = item.get("bounds")
        if not (isinstance(bounds, list) and len(bounds) == 4 and all(isinstance(v, int) for v in bounds)):
            raise HarnessError(f"sites[{index}].bounds must contain four integers")
        if bounds[0] > bounds[2] or bounds[1] > bounds[3]:
            raise HarnessError(f"sites[{index}].bounds are inverted")
        rooms = item.get("preferred_rooms", [])
        levels = item.get("levels", [0])
        if not all(isinstance(v, str) and v for v in rooms):
            raise HarnessError(f"sites[{index}].preferred_rooms must be strings")
        if not levels or not all(isinstance(v, int) for v in levels):
            raise HarnessError(f"sites[{index}].levels must be integers")
        entry = item.get("entry_point")
        if entry is not None and not (isinstance(entry, list) and len(entry) == 3 and all(isinstance(v, (int, float)) for v in entry)):
            raise HarnessError(f"sites[{index}].entry_point must contain three numbers")
        sites.append(Site(site_id, str(item.get("role", "unspecified")), tuple(bounds), tuple(rooms), tuple(levels), tuple(entry) if entry else None))
    if not sites:
        raise HarnessError("profile must define at least one [[sites]] entry")
    gates: list[Gate] = []
    gate_names: set[str] = set()
    for index, item in enumerate(raw.get("gates", [])):
        action = item.get("action", "wait")
        if action not in GATE_ACTIONS:
            raise HarnessError(f"gates[{index}].action must be one of {sorted(GATE_ACTIONS)}")
        pattern = item.get("pattern", "")
        name = str(item.get("name", f"gate-{index}"))
        if name in gate_names:
            raise HarnessError(f"gates[{index}].name is duplicated: {name}")
        gate_names.add(name)
        try:
            re.compile(pattern)
        except (TypeError, re.error) as exc:
            raise HarnessError(f"gates[{index}].pattern is invalid: {exc}") from exc
        gates.append(Gate(
            name, pattern,
            _positive_int(item.get("timeout_seconds", 60), f"gates[{index}].timeout_seconds"),
            _positive_int(item.get("retries", 0), f"gates[{index}].retries", minimum=0), action,
        ))
    names = [gate.name for gate in gates]
    positions = [names.index(name) if name in gate_names else -1 for name in REQUIRED_GATE_ORDER]
    if -1 in positions or positions != sorted(positions):
        raise HarnessError("gates must include the required lifecycle order: " + " -> ".join(REQUIRED_GATE_ORDER))
    actions = {gate.name: gate.action for gate in gates}
    criteria_raw = acceptance.get("criteria", [])
    interaction_raw = acceptance.get("interaction_scope", [])
    if not isinstance(criteria_raw, list) or not isinstance(interaction_raw, list):
        raise HarnessError("acceptance criteria and interaction_scope must be TOML arrays")
    criteria = tuple(criteria_raw)
    interaction_scope = tuple(interaction_raw)
    if not all(isinstance(value, str) and value for value in criteria + interaction_scope):
        raise HarnessError("acceptance criteria and interaction_scope must contain non-empty strings")
    unattended_enabled = unattended_raw.get("enabled", False)
    if not isinstance(unattended_enabled, bool):
        raise HarnessError("unattended_startup.enabled must be boolean")
    if unattended_enabled:
        if actions["click-to-start"] != "startup-gate":
            raise HarnessError("unattended startup requires click-to-start action=startup-gate")
        if actions["player-ready-modal-check"] not in {"wait", "screenshot"}:
            raise HarnessError("unattended startup may only observe or screenshot the player-ready modal check")
        click_gate = next(gate for gate in gates if gate.name == "click-to-start")
        if click_gate.pattern != "game loading took":
            raise HarnessError("unattended click-to-start requires the exact ordinary gate signature 'game loading took'")
        player_ready_gate = next(gate for gate in gates if gate.name == "player-ready-modal-check")
        if player_ready_gate.pattern != r"\[CF-INSPECT\].*kind=PLAYER_READY":
            raise HarnessError("unattended startup delivery requires the exact observer PLAYER_READY gate pattern")
    else:
        for manual_name in ("click-to-start", "player-ready-modal-check"):
            if actions[manual_name] != "manual":
                raise HarnessError(f"gate {manual_name} must use action=manual unless unattended_startup.enabled=true")
    startup_action = str(unattended_raw.get("action", "left-click"))
    if startup_action != "left-click":
        raise HarnessError(
            "unattended_startup.action must be left-click; keypress startup is disabled after live evidence showed no transition"
        )
    if unattended_raw.get("key") is not None:
        raise HarnessError("unattended startup left-click cannot declare a key")
    max_actions = _positive_int(unattended_raw.get("max_actions", 1), "unattended_startup.max_actions")
    if max_actions != 1:
        raise HarnessError("unattended_startup.max_actions must be exactly 1")
    signature_age = _positive_int(unattended_raw.get("signature_max_age_seconds", 15), "unattended_startup.signature_max_age_seconds")
    if signature_age > 30:
        raise HarnessError("unattended_startup.signature_max_age_seconds must be <= 30")
    settle_seconds = _positive_int(
        unattended_raw.get("post_signature_settle_seconds", 1),
        "unattended_startup.post_signature_settle_seconds",
    )
    if settle_seconds >= signature_age:
        raise HarnessError("unattended startup settle time must be shorter than the signature freshness budget")
    window_pattern = str(unattended_raw.get("window_title_pattern", r"(?i)project zomboid"))
    if window_pattern not in WINDOW_TITLE_PATTERNS:
        raise HarnessError("unattended startup window title must use an approved Project Zomboid pattern")
    try:
        re.compile(window_pattern)
    except re.error as exc:
        raise HarnessError(f"unattended_startup.window_title_pattern is invalid: {exc}") from exc
    payload_mode = str(payload_raw.get("mode", "probe"))
    if payload_mode not in {"probe", "production"}:
        raise HarnessError("payload.mode must be probe or production")
    payload_source = payload_raw.get("source")
    expected_sha = payload_raw.get("expected_sha256")
    expected_mod_id = payload_raw.get("expected_mod_id")
    if payload_mode == "production":
        if not isinstance(payload_source, str) or not payload_source:
            raise HarnessError("production payload requires payload.source")
        if not isinstance(expected_sha, str) or not SHA256_RE.fullmatch(expected_sha):
            raise HarnessError("production payload requires lowercase payload.expected_sha256")
        if not isinstance(expected_mod_id, str) or not ID_RE.fullmatch(expected_mod_id):
            raise HarnessError("production payload requires payload.expected_mod_id")
    budgets = raw.get("time_budgets", {})
    for key, value in budgets.items():
        _positive_int(value, f"time_budgets.{key}")
    return Profile(
        path=path,
        profile_id=profile_id,
        probe_id=probe_id,
        source_save=_path(paths["source_save"], base),
        pz_user_root=_path(paths["pz_user_root"], base),
        launcher=_path(paths["launcher"], base),
        evidence_root=_path(paths["evidence_root"], base),
        source_marker=str(safety.get("source_marker", ".cf-live-inspection-source")),
        controls=controls,
        sites=tuple(sites), gates=tuple(gates), time_budgets=dict(budgets),
        allow_multi_site=bool(run.get("allow_multi_site", False)),
        criteria=criteria, interaction_scope=interaction_scope,
        unattended_startup=UnattendedStartup(
            unattended_enabled, startup_action, max_actions, signature_age, settle_seconds, window_pattern
        ),
        payload=Payload(payload_mode, _path(payload_source, base) if payload_source else None, expected_sha, expected_mod_id),
        raw=raw,
    )


def unattended_refusal_reason(profile: Profile) -> str | None:
    if not profile.unattended_startup.enabled:
        return None
    requested = {value.upper() for value in profile.criteria}
    forbidden = sorted(value for value in requested if value in FORBIDDEN_UNATTENDED_CRITERIA or re.search(r"(^|[-_:])(T10|E08)($|[-_:])", value))
    if forbidden:
        return "unattended input is forbidden for manual-only T10/E08 criteria: " + ", ".join(forbidden)
    unsafe_scope = [value for value in profile.interaction_scope if any(word in value.lower() for word in FORBIDDEN_INTERACTION_WORDS)]
    if unsafe_scope:
        return "unattended input is forbidden for inventory/menu/gameplay/acceptance interaction: " + ", ".join(unsafe_scope)
    if profile.interaction_scope != ("startup-gate",):
        return "unattended input interaction_scope must be exactly ['startup-gate']"
    return None
