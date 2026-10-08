#!/usr/bin/env python3
"""Generate mod-ofinterest/.../OIShared/Generated/Buildings.lua: every building that has an AddressBook
area, with its footprint, area index, town index and a numeric category code. NUMBERS AND IDS ONLY.
Inputs: dev/addresses/world1.tsv (building id, bounds, room names) and the shipped AddressBook.lua.
Category code = index in the dependency's KNOWN_CATEGORIES (1 Hospital .. 13 Restaurant), 0 = ordinary,
derived from the building's room names with the dependency's own rule: lowercase substring, first match in
this order (LocationCategory.ROOM_NAME_CATEGORIES). Room names are read here and never written out.
Row: "id|x|y|x2|y2|area|cat". towns[area index] = town index: a named area is its own town; an unnamed
(rural) area belongs to the town it is near (the AddressBook's `near`).
Usage: python3 tools/ofinterest/gen_buildings.py [--check]"""
import os, re, sys
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
TSV = os.path.join(REPO, "dev/addresses/world1.tsv")
BOOK = os.path.join(REPO, "mod-ofinterest/common/media/lua/shared/OIShared/Generated/AddressBook.lua")
OUT = os.path.join(REPO, "mod-ofinterest/common/media/lua/shared/OIShared/Generated/Buildings.lua")
# the dependency's order (LocationCategory.lua); code = KNOWN_CATEGORIES index
ORDER = [("hospital", 1), ("police", 2), ("prison", 3), ("army", 4), ("farm", 5), ("church", 6), ("school", 7),
         ("factory", 8), ("gas", 9), ("fossoil", 9), ("lab", 10), ("library", 11), ("warehouse", 12),
         ("diner", 13), ("restaurant", 13)]

def category(room):
    low = room.lower()
    for sub, code in ORDER:
        if sub in low: return code
    return 0

def main():
    book = open(BOOK, encoding="utf-8").read()
    areas_txt = re.search(r"B\.areas=\{(.*?)\n\}\n", book, re.S).group(1)
    areas = []
    for line in areas_txt.strip().splitlines():
        m = re.match(r'\{name="([^"]*)",town=(\d+)(?:,near="([^"]*)")?', line.strip())
        areas.append((m.group(1), m.group(3) or ""))
    first = {}
    for i, (name, _) in enumerate(areas, 1):
        if name and name not in first: first[name] = i
    towns = []
    for i, (name, near) in enumerate(areas, 1):
        towns.append(first[name] if name else first.get(near, 1000 + i))
    rooms = {}
    for line in open(TSV, encoding="utf-8"):
        if line.startswith("#"): continue
        f = line.rstrip("\n").split("\t")
        rooms[f[0]] = f[7].split(",") if len(f) > 7 else []
    rows, per = [], {}
    for m in re.finditer(r'"(\d+)\|(-?\d+)\|(-?\d+)\|(-?\d+)\|(-?\d+)\|(\d+)\|\d+\|\d+"', book):
        bid, x, y, x2, y2, area = m.groups()
        cats = [category(r) for r in rooms.get(bid, [])]
        found = [c for c in cats if c]
        cat = min(found) if found else 0   # a building with several tagged rooms: the first in the dependency's order
        rows.append('"%s|%s|%s|%s|%s|%s|%d"' % (bid, x, y, x2, y2, area, cat))
        per[cat] = per.get(cat, 0) + 1
    assert len(rows) == 6796, len(rows)
    text = ("-- DERIVED FILE - do not edit by hand. python3 tools/ofinterest/gen_buildings.py\n"
            "-- Buildings that have an AddressBook area. Row \"id|x|y|x2|y2|area|cat\": cat is the dependency's place\n"
            "-- code (index in KNOWN_CATEGORIES, 1..13) of the building's rooms, 0 = ordinary. towns[area] = town index.\n"
            "-- Numbers and ids only.\nlocal B={}\nB.towns={%s}\nB.rows={\n%s,\n}\nreturn B\n") % (",".join(map(str, towns)), ",\n".join(rows))
    if "--check" in sys.argv:
        sys.exit(0 if open(OUT).read() == text else 1)
    open(OUT, "w").write(text)
    print("wrote %d buildings; categories %s; %d areas, %d towns" % (len(rows), sorted(per.items()), len(areas), len(set(towns))))
main()
