from __future__ import annotations

import json
import os
import re
from pathlib import Path

from .safety import sha256

HOME_PATTERNS = [
    (re.compile(re.escape(str(Path.home()))), "<HOME>"),
    (re.compile(r"(?i)(password|token|secret|api[_-]?key)=([^\s|]+)"), r"\1=<REDACTED>"),
    (re.compile(r"(?i)(authorization:\s*(?:bearer|basic)\s+)\S+"), r"\1<REDACTED>"),
]


def sanitize_line(line: str) -> str:
    for pattern, replacement in HOME_PATTERNS:
        line = pattern.sub(replacement, line)
    return line


def write_sanitized(source: Path, destination: Path, include: str | None = None) -> int:
    matcher = re.compile(include) if include else None
    count = 0
    destination.parent.mkdir(parents=True, exist_ok=True)
    with source.open("r", encoding="utf-8", errors="replace") as incoming, destination.open("w", encoding="utf-8") as outgoing:
        for line in incoming:
            if matcher and not matcher.search(line):
                continue
            outgoing.write(sanitize_line(line))
            count += 1
    return count


def finalize_manifest(bundle: Path, metadata: dict) -> None:
    files = []
    for path in sorted(bundle.rglob("*")):
        if path.is_file() and path.name != "manifest.json":
            files.append({"path": str(path.relative_to(bundle)), "sha256": sha256(path), "bytes": path.stat().st_size})
    metadata = dict(metadata)
    metadata["files"] = files
    metadata["environment"] = {"display": os.environ.get("DISPLAY", "")}
    (bundle / "manifest.json").write_text(json.dumps(metadata, indent=2, sort_keys=True) + "\n", encoding="utf-8")
