#!/usr/bin/env python3
"""Derive landmark candidates from the installed map, instead of transcribing them.

    python3 tools/extract_landmarks.py                 investigation-relevant zones
    python3 tools/extract_landmarks.py --all           every named zone
    python3 tools/extract_landmarks.py --kind Police   one label
    python3 tools/extract_landmarks.py --min-area 400  only substantial places

Why derive rather than transcribe: a landmark list written by hand or by a model
looks authoritative whether or not it is true, and there is no way to tell good
rows from bad by reading them. Every row this emits carries coordinates taken
from the game's own files, so it is true by construction.

The source is `media/maps/Muldraugh, KY/objects.lua` - about 4 MB of plain Lua
listing every zone in Knox with a type, an origin and an extent. 1,467 of those
zones carry a `ZombiesType` name, which is the game's own label for what a place
is: Offices, Police, Doctor, Prison, Bank, University, Mob, Cultists, SecretBase.
No game needs to run, and the result is diffable and reviewable.

WHAT THIS DOES NOT DO. It reports where the game says a kind of place is. It
does not know whether a building is interesting, whether a story could live
there, or whether the label is accurate for the whole footprint - T3 found
building-wide categorisation stays context-sensitive. Curation is a person's
job; this exists so that person spends their time judging rather than typing
coordinates.
"""
import argparse
import os
import re
import subprocess
import sys

# Zone labels a records-and-people investigation can actually use. Everything
# else in the 78-label vocabulary is real, just not obviously useful to us:
# Swimmer, Tennis, cornmaze. Pass --all to see them.
RELEVANT = {
    # places that hold records about people
    "Offices", "Office", "Police", "Bank", "University", "School", "Doctor",
    "Pharmacist", "NursingHome", "FireDept",
    # institutions with a reason to be secretive
    "Prison", "Army", "SecretBase", "Shelter",
    # places people were employed or gathered
    "Factory", "ConstructionSite", "CarRepair", "McCoys", "MassGenFac",
    "FarmingStore", "Farm", "Church",
    # narratively loaded already
    "Mob", "Cultists", "Survivalist",
}


def map_dir():
    pz = os.environ.get("PZ_HOME")
    if not pz:
        env = os.path.join(os.path.dirname(__file__), "env.sh")
        out = subprocess.run(["bash", "-c", f". {env} && printf %s \"$PZ_HOME\""],
                             capture_output=True, text=True)
        pz = out.stdout.strip()
    if not pz:
        sys.exit("PZ_HOME is not set and could not be resolved; source tools/env.sh")
    d = os.path.join(pz, "media", "maps", "Muldraugh, KY")
    if not os.path.isdir(d):
        sys.exit(f"map folder not found: {d}")
    return d


def cell_size(d):
    """From map.info, never from memory. It is 256, and assuming 300 once
    produced nine confident false alarms about coordinates being off-map."""
    info = open(os.path.join(d, "map.info"), encoding="utf-8", errors="ignore").read()
    m = re.search(r"Cell size is (\d+)", info)
    if not m:
        sys.exit("could not read cell size from map.info")
    return int(m.group(1))


ROW = re.compile(
    r'\{ name = "([^"]*)", type = "([^"]*)", x = (\d+), y = (\d+), z = (\d+), '
    r'width = (\d+), height = (\d+)')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--all", action="store_true", help="every named zone, not just relevant ones")
    ap.add_argument("--kind", help="only this zone label")
    ap.add_argument("--min-area", type=int, default=0, help="skip zones smaller than this many tiles")
    ap.add_argument("--limit", type=int, default=0, help="stop after this many rows")
    args = ap.parse_args()

    d = map_dir()
    size = cell_size(d)
    text = open(os.path.join(d, "objects.lua"), encoding="utf-8", errors="ignore").read()

    rows = []
    for name, kind, x, y, z, w, h in ROW.findall(text):
        name = name.strip()
        if not name or kind != "ZombiesType":
            continue
        if args.kind and name != args.kind:
            continue
        if not args.all and not args.kind and name not in RELEVANT:
            continue
        x, y, z, w, h = int(x), int(y), int(z), int(w), int(h)
        if w * h < args.min_area:
            continue
        # A cell must exist, or nothing can ever be placed there.
        cx, cy = x // size, y // size
        present = os.path.isfile(os.path.join(d, f"{cx}_{cy}.lotheader"))
        rows.append((name, x + w // 2, y + h // 2, z, w, h, w * h, f"{cx}_{cy}", present))

    rows.sort(key=lambda r: (r[0], -r[6]))
    if args.limit:
        rows = rows[:args.limit]

    print(f"| # | Label | Centre [X, Y] | Floor | Size | Area | Cell | On map |")
    print(f"|---|---|---|---|---|---|---|---|")
    for i, (name, x, y, z, w, h, area, cell, present) in enumerate(rows, 1):
        mark = "yes" if present else "**NO**"
        print(f"| {i} | {name} | [{x}, {y}] | {z} | {w}x{h} | {area} | {cell} | {mark} |")

    missing = sum(1 for r in rows if not r[8])
    print(f"\n{len(rows)} zones; cell size {size} from map.info; "
          f"{missing} on a cell that does not exist.")


if __name__ == "__main__":
    main()
