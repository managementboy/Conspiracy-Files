#!/usr/bin/env python3
"""Turn Export.java TSV into the compact, lazy-decoded shipped Lua index."""
from __future__ import annotations

import argparse
import csv
import hashlib
from collections import defaultdict
from pathlib import Path


DIGITS = "0123456789abcdefghijklmnopqrstuvwxyz"


def base36(value: int) -> str:
    if value == 0:
        return "0"
    sign = "-" if value < 0 else ""
    value = abs(value)
    out: list[str] = []
    while value:
        value, digit = divmod(value, 36)
        out.append(DIGITS[digit])
    return sign + "".join(reversed(out))


def lua(value: str) -> str:
    return '"' + value.replace("\\", "\\\\").replace('"', '\\"').replace("\n", "\\n").replace("\r", "\\r") + '"'


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    sprites: set[str] = set()
    types: set[str] = set()
    rooms: set[str] = set()
    buildings: dict[str, list[tuple[int, int, int, str, str, str]]] = defaultdict(list)
    header: list[str] | None = None
    footer_count: int | None = None
    footer_hash: str | None = None
    digest = hashlib.sha256()
    with args.input.open("r", encoding="utf-8", newline="") as source:
        for raw in source:
            if raw.startswith("#fixed-container-index-v1\t"):
                header = raw.rstrip("\n").split("\t")
                continue
            if raw.startswith("#rows\t"):
                fields = raw.rstrip("\n").split("\t")
                footer_count = int(fields[1])
                footer_hash = fields[2].removeprefix("sha256=")
                continue
            if raw.startswith("#") or not raw.strip():
                continue
            digest.update(raw.encode("utf-8"))
            fields = next(csv.reader([raw], delimiter="\t"))
            if len(fields) != 7:
                raise ValueError(f"bad row with {len(fields)} fields")
            building, x, y, z, sprite, kind, room = fields
            row = (int(x), int(y), int(z), sprite, kind, room)
            buildings[building].append(row)
            sprites.add(sprite)
            types.add(kind)
            if room:
                rooms.add(room)
    count = sum(map(len, buildings.values()))
    if header is None or footer_count != count or footer_hash != digest.hexdigest():
        raise ValueError("incomplete or corrupted exporter TSV")

    sprite_list, type_list, room_list = sorted(sprites), sorted(types), sorted(rooms)
    sprite_id = {value: index + 1 for index, value in enumerate(sprite_list)}
    type_id = {value: index + 1 for index, value in enumerate(type_list)}
    room_id = {value: index + 1 for index, value in enumerate(room_list)}
    source_text = f"offline POT lot census; rows={count}; sha256={digest.hexdigest()}"
    lines = [
        "-- DERIVED FILE - do not edit by hand. See tools/fixed-containers/README.md.",
        f"local D={{schema=2,map={lua(header[1])},build={lua(header[2])},source={lua(source_text)},count={count}}}",
        "D.sprites={" + ",".join(map(lua, sprite_list)) + "}",
        "D.types={" + ",".join(map(lua, type_list)) + "}",
        "D.rooms={" + ",".join(map(lua, room_list)) + "}",
        "D.buildings={",
    ]
    for building in sorted(buildings, key=lambda value: (len(value), value)):
        rows = sorted(buildings[building])
        base_x = min(row[0] for row in rows)
        base_y = min(row[1] for row in rows)
        packed = ";".join(
            ",".join(
                (
                    base36(x - base_x), base36(y - base_y), base36(z),
                    base36(sprite_id[sprite]), base36(type_id[kind]), base36(room_id.get(room, 0)),
                )
            )
            for x, y, z, sprite, kind, room in rows
        )
        lines.append(f"[{lua(building)}]={{{base_x},{base_y},{lua(packed)}}},")
    lines.extend(("}", "return {D}", ""))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    print(f"wrote {count} rows, {len(buildings)} buildings, {args.output.stat().st_size} bytes")


if __name__ == "__main__":
    main()
