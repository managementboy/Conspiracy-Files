from __future__ import annotations

import os
import re
import tomllib
from pathlib import Path

from .model import Gate, HarnessError, Profile, Site

ID_RE = re.compile(r"^[A-Za-z][A-Za-z0-9_-]{1,63}$")
CONTROL_ALLOWLIST = {"latestSave.ini", "mods/default.txt", "options.ini", "debuglog.ini"}
GATE_ACTIONS = {"wait", "manual", "screenshot"}
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
    for manual_name in ("click-to-start", "player-ready-modal-check"):
        if actions[manual_name] != "manual":
            raise HarnessError(f"gate {manual_name} must use action=manual")
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
        allow_multi_site=bool(run.get("allow_multi_site", False)), raw=raw,
    )
