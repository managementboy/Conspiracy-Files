#!/usr/bin/env python3
"""Create a static, compact manifest for Project Zomboid's map-reading Lua.

This tool only reads the supplied installation.  It deliberately records source
evidence, not runtime behaviour, and makes no claim that any hook is available.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any


SOURCES = (
    (
        "media/lua/client/ISUI/ISInventoryPaneContextMenu.lua",
        (("ISInventoryPaneContextMenu.onCheckMap",
          r"^ISInventoryPaneContextMenu\.onCheckMap\s*=\s*function\b"),),
    ),
    (
        "media/lua/client/ISUI/Maps/ISMap.lua",
        (
            ("ISMapWrapper.setVisible", r"^function ISMapWrapper:setVisible\b"),
            ("ISMapWrapper.close", r"^function ISMapWrapper:close\b"),
            ("ISMapWrapper:instantiate", r"^function ISMapWrapper:instantiate\b"),
            ("ISMap:revealOnWorldMap", r"^function ISMap:revealOnWorldMap\b"),
        ),
    ),
    (
        "media/lua/client/ISUI/ISUIElement.lua",
        (("ISUIElement:addToUIManager", r"^function ISUIElement:addToUIManager\b"),),
    ),
    (
        "media/lua/client/TimedActions/ISReadWorldMap.lua",
        (("ISReadWorldMap:perform", r"^function ISReadWorldMap:perform\b"),),
    ),
)

# These are deliberately observations in the source, rather than proposed hooks.
OBSERVATIONS = {
    "ISInventoryPaneContextMenu.onCheckMap": (
        "action:setOnComplete(ISInventoryPaneContextMenu.onCheckMap, map, player)",
        "local mapUI = ISMap:new(",
        "map:doBuildingStash()",
        "wrap:setVisible(true)",
        "wrap:addToUIManager()",
        "playerObj:addReadMap(map)",
    ),
    "ISReadWorldMap:perform": ("ISWorldMap.ShowWorldMap(",),
    "ISUIElement:addToUIManager": ("self:instantiate()", "UIManager.AddUI(self.javaObject)"),
}


def line_matches(lines: list[str], pattern: str) -> list[dict[str, Any]]:
    matcher = re.compile(pattern)
    return [
        {"line": number, "text": line.rstrip("\r\n")}
        for number, line in enumerate(lines, 1)
        if matcher.search(line)
    ]


def function_body(lines: list[str], definition_pattern: str) -> tuple[list[dict[str, Any]], list[str], int]:
    """Return the definition evidence and the following top-level function span."""
    matcher = re.compile(definition_pattern)
    start = next((index for index, line in enumerate(lines) if matcher.search(line)), None)
    if start is None:
        return [], [], 0
    next_definition = re.compile(r"^(?:function\s+\w|[\w.]+\s*=\s*function\b)")
    end = next(
        (index for index in range(start + 1, len(lines)) if next_definition.search(lines[index])),
        len(lines),
    )
    return ([{"line": start + 1, "text": lines[start].rstrip("\r\n")}], lines[start:end], start)


def read_version_file(path: Path | None) -> dict[str, Any]:
    """Include only explicitly supplied, small UTF-8 version-file evidence."""
    if path is None:
        return {
            "available": False,
            "note": "No --version-file supplied; obtain the engine version separately from getVersionNumber().",
        }
    if not path.is_file():
        raise ValueError("--version-file must be an existing file")
    if path.stat().st_size > 64 * 1024:
        raise ValueError("--version-file must be 64 KiB or smaller")
    raw = path.read_bytes()
    if b"\0" in raw:
        raise ValueError("--version-file must be plain UTF-8 text")
    try:
        text = raw.decode("utf-8")
    except UnicodeDecodeError as error:
        raise ValueError("--version-file must be plain UTF-8 text") from error
    return {"available": True, "source": str(path), "lines": text.splitlines()[:5]}


def source_record(game: Path, relative: str, functions: tuple[tuple[str, str], ...]) -> dict[str, Any]:
    path = game.joinpath(*relative.split("/"))
    record: dict[str, Any] = {"path": relative, "present": path.is_file()}
    if not path.is_file():
        record["sha256"] = None
        record["functions"] = [
            {"name": name, "present": False, "evidence": [], "observations": []}
            for name, _ in functions
        ]
        return record

    raw = path.read_bytes()
    lines = raw.decode("utf-8", errors="replace").splitlines(keepends=True)
    record["sha256"] = hashlib.sha256(raw).hexdigest()
    records = []
    for name, pattern in functions:
        evidence, body, body_start = function_body(lines, pattern)
        observations = []
        for call in OBSERVATIONS.get(name, ()):
            for match in line_matches(body, re.escape(call)):
                match["line"] += body_start
                observations.append(match)
        records.append({
            "name": name,
            "present": bool(evidence),
            "evidence": evidence,
            "observations": observations,
        })
    record["functions"] = records
    return record


def make_manifest(game: Path, version_file: Path | None) -> tuple[dict[str, Any], bool]:
    sources = [source_record(game, relative, functions) for relative, functions in SOURCES]
    complete = all(
        source["present"] and all(function["present"] for function in source["functions"])
        for source in sources
    )
    manifest = {
        "kind": "project-zomboid-map-read-static-source-manifest",
        "scope": "static source inspection only; this is not runtime verification and does not identify a hook",
        "game": str(game),
        "version": read_version_file(version_file),
        "sources": sources,
        "complete_required_sources_and_functions": complete,
    }
    return manifest, complete


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game", required=True, type=Path, help="Project Zomboid installation directory")
    parser.add_argument("--out", type=Path, help="write JSON to this path instead of stdout")
    parser.add_argument("--version-file", type=Path, help="optional small, plain UTF-8 version evidence file")
    args = parser.parse_args()

    game = args.game.expanduser().resolve()
    if not game.is_dir():
        parser.error("--game must be an existing directory")
    version_file = args.version_file.expanduser().resolve() if args.version_file else None
    try:
        manifest, complete = make_manifest(game, version_file)
    except ValueError as error:
        parser.error(str(error))
    encoded = json.dumps(manifest, indent=2, ensure_ascii=False) + "\n"
    if args.out:
        output = args.out.expanduser().resolve()
        try:
            output.relative_to(game)
        except ValueError:
            pass
        else:
            parser.error("--out must not be inside --game; the installation is read-only")
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(encoded, encoding="utf-8")
    else:
        sys.stdout.write(encoded)
    return 0 if complete else 1


if __name__ == "__main__":
    raise SystemExit(main())
