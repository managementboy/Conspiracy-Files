#!/usr/bin/env python3
"""Derive candidate mystery objects from the installed game's own item scripts.

    python3 tools/extract_mystery_objects.py               the shortlist
    python3 tools/extract_mystery_objects.py --all         every candidate
    python3 tools/extract_mystery_objects.py --property blood
    python3 tools/extract_mystery_objects.py --category Weapon

Why derive rather than write a list: a catalogue of "objects that could be part
of a mystery" written from memory looks authoritative whether or not the items
exist, and there is no way to tell a real row from an invented one by reading
it. Every row this emits was parsed out of
media/scripts/generated/items/*.txt, so the item name and the properties
claimed for it are true by construction. The narrative use is still a person's
judgement; this tool only says what the game actually ships and what state we
can legitimately set on it.

The properties are the point. An object is only evidence if something about it
can be made to mean something:

  name       the engine stamps an owner's name on it (Tags = base:applyownername),
             so it names a person with no prose at all
  condition  it has a condition track, so it can be found damaged or nearly
             broken, and that is a fact about its history
  blood      it is a weapon, so setBloodLevel applies and it can be found bloodied
  keyed      it is a key, and a key can be tested against a real door

WHAT THIS DOES NOT DO. It does not know whether an item is interesting, whether
a story could live in it, or whether the player will ever notice it. It also
does not prove that a property persists across a save - name and ModData are
proven (T7); condition is a core saved field; blood on a weapon is NOT yet
verified and is marked accordingly.
"""
import argparse
import os
import re
import subprocess
import sys

FILES = ["weapon.txt", "normal.txt", "literature.txt", "clothing.txt", "container.txt",
         "key.txt", "map.txt", "radio.txt", "drainable.txt", "moveable.txt", "food.txt"]


def items_dir():
    pz = os.environ.get("PZ_HOME")
    if not pz:
        env = os.path.join(os.path.dirname(__file__), "env.sh")
        out = subprocess.run(["bash", "-c", f". {env} && printf %s \"$PZ_HOME\""],
                             capture_output=True, text=True)
        pz = out.stdout.strip()
    if not pz:
        sys.exit("PZ_HOME is not set and could not be resolved; source tools/env.sh")
    d = os.path.join(pz, "media", "scripts", "generated", "items")
    if not os.path.isdir(d):
        sys.exit(f"item scripts not found: {d}")
    return d


ITEM = re.compile(r"^\s*item\s+(\S+)\s*$")


def parse(path):
    """Yield (name, fields) for every item block in one script file.

    The files open with `module Base {`, so an item block is never at brace
    depth zero. Depth is therefore counted from the item line, not from the
    top of the file - the first version of this counted from the file and
    matched nothing at all.
    """
    name, fields, depth, started = None, {}, 0, False
    for line in open(path, encoding="utf-8", errors="ignore"):
        if name is None:
            m = ITEM.match(line)
            if m:
                name, fields, depth, started = m.group(1), {}, 0, False
            continue
        depth += line.count("{")
        if line.count("{"):
            started = True
        depth -= line.count("}")
        if started and depth <= 0:
            yield name, fields
            name = None
            continue
        if "=" in line:
            k, _, v = line.partition("=")
            fields[k.strip()] = v.strip().rstrip(",")


def properties(fields, source):
    out = []
    tags = fields.get("Tags", "")
    if "applyownername" in tags:
        out.append("name")
    if fields.get("ConditionMax"):
        out.append("condition")
    if fields.get("ItemType", "").endswith("weapon") or source == "weapon.txt":
        out.append("blood")
    if source == "key.txt" or fields.get("ItemType", "").endswith("key"):
        out.append("keyed")
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--all", action="store_true", help="every item with a usable property")
    ap.add_argument("--property", help="only items with this property")
    ap.add_argument("--category", help="only this DisplayCategory")
    ap.add_argument("--limit", type=int, default=0)
    args = ap.parse_args()

    d = items_dir()
    rows = []
    for source in FILES:
        path = os.path.join(d, source)
        if not os.path.isfile(path):
            continue
        for name, fields in parse(path):
            props = properties(fields, source)
            if not props:
                continue
            if args.property and args.property not in props:
                continue
            category = fields.get("DisplayCategory", "-")
            if args.category and category != args.category:
                continue
            rows.append((name, source, category, ",".join(props)))

    rows.sort(key=lambda r: (r[1], r[2], r[0]))
    if args.limit:
        rows = rows[:args.limit]

    print("| Item | Script | Category | Usable properties |")
    print("|---|---|---|---|")
    for name, source, category, props in rows:
        print(f"| {name} | {source} | {category} | {props} |")

    counts = {}
    for _, _, _, props in rows:
        for p in props.split(","):
            counts[p] = counts.get(p, 0) + 1
    print(f"\n{len(rows)} candidates: " + ", ".join(f"{k}={v}" for k, v in sorted(counts.items())))
    print("name and ModData persistence proven (T7). condition is a core saved field. "
          "blood on a weapon is NOT verified to persist - test before relying on it.")


if __name__ == "__main__":
    main()
