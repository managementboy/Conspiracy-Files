from __future__ import annotations

from dataclasses import dataclass, field
from pathlib import Path
from typing import Any


class HarnessError(RuntimeError):
    """An expected, operator-actionable harness failure."""


@dataclass(frozen=True)
class Site:
    site_id: str
    role: str
    bounds: tuple[int, int, int, int]
    preferred_rooms: tuple[str, ...] = ()
    levels: tuple[int, ...] = (0,)
    entry_point: tuple[float, float, float] | None = None


@dataclass(frozen=True)
class Gate:
    name: str
    pattern: str
    timeout_seconds: int
    retries: int = 0
    action: str = "wait"


@dataclass(frozen=True)
class UnattendedStartup:
    enabled: bool = False
    action: str = "left-click"
    max_actions: int = 1
    signature_max_age_seconds: int = 15
    post_signature_settle_seconds: int = 1
    window_title_pattern: str = r"(?i)project zomboid"
    supported_game_version: str = ""


@dataclass(frozen=True)
class Payload:
    mode: str = "probe"
    source: Path | None = None
    expected_sha256: str | None = None
    expected_mod_id: str | None = None


@dataclass(frozen=True)
class Profile:
    path: Path
    profile_id: str
    probe_id: str
    source_save: Path
    pz_user_root: Path
    launcher: Path
    evidence_root: Path
    source_marker: str
    controls: tuple[str, ...]
    sites: tuple[Site, ...]
    gates: tuple[Gate, ...]
    time_budgets: dict[str, int] = field(default_factory=dict)
    allow_multi_site: bool = False
    criteria: tuple[str, ...] = ()
    interaction_scope: tuple[str, ...] = ()
    unattended_startup: UnattendedStartup = field(default_factory=UnattendedStartup)
    payload: Payload = field(default_factory=Payload)
    owner_phase: dict[str, object] = field(default_factory=dict)
    raw: dict[str, Any] = field(default_factory=dict, repr=False)
