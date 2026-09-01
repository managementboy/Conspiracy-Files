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
    raw: dict[str, Any] = field(default_factory=dict, repr=False)
