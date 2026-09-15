#!/usr/bin/env python3
"""Cross-reference a hand-made landmark list against the game's own zone labels.

    python3 tools/crossref_landmarks.py mylist.txt        rows of  num|name|x|y

For each row it reports what the name implies the place should be, the nearest
zone the game gives that label, and how far away it is - plus the nearest
tagged zone of any kind, so a row can be judged even when no label matches.

READ THE RESULT CAREFULLY. A match confirms a row. A non-match does NOT refute
one. `ZombiesType` is a zombie-population tagging layer applied selectively,
not an index of every building: Muldraugh has no Police zone at all, and it
plainly has a police station. Absence of a label is absence of evidence.

Checked against a 200-row list on 2026-09-09: of 125 rows with a checkable
expectation, 58 were confirmed within 250 tiles, several within single digits -
Rosewood Fire Station 3, Rosewood Police 5, Prison Armory 7, Court House 17.
"""
import math
import os
import re
import subprocess
import sys

KEYWORDS = [
    (("police", "police department", "police headquarters"), {"Police"}),
    (("fire station", "fire dept"), {"FireDept"}),
    (("prison", "penitentiary", "corrections", "armory"), {"Prison", "Army"}),
    (("military", "army", "checkpoint", "secret"), {"Army", "SecretBase"}),
    (("hospital", "medical", "clinic", "doctor", "sanatorium"), {"Doctor"}),
    (("pharmacy", "pharma"), {"Pharmacist"}),
    (("bank", "vault"), {"Bank"}),
    (("school", "dorms"), {"School"}),
    (("university", "science lab"), {"University"}),
    (("church", "chapel", "cemetery", "funeral"), {"Church", "church"}),
    (("gigamart", "megamart", "supermarket", "food market", "market"),
     {"Gigamart", "VariousFoodMarket"}),
    (("gas", "fossoil"), {"Fossoil", "Gas2Go", "ThunderGas"}),
    (("bar", "grill", "club", "nightclub"), {"Bar", "Nightclub", "Stripclub"}),
    (("diner", "restaurant", "spiffo", "cafe", "pizza"),
     {"Dinner", "Restaurant", "Spiffo", "PizzaWhirled", "CoffeeShop", "Cafe"}),
    (("factory", "warehouse", "sawmill", "logging", "mccoy", "genfac", "brewery"),
     {"Factory", "McCoys", "MassGenFac"}),
    (("construction", "quarry", "gravel"), {"ConstructionSite"}),
    (("car repair", "auto", "junkyard", "salvage", "dealership", "wrecking"), {"CarRepair"}),
    (("trailer park",), {"TrailerPark"}),
    (("country club", "golf"), {"CountryClub"}),
    (("motel", "hotel", "suites", "penthouse"), {"FancyHotel", "HotelRich"}),
    (("farm", "ranch", "pasture", "farmland", "farmstead"),
     {"Farm", "Ranch", "Farmer", "FarmingStore"}),
    (("baseball", "athletic", "arena", "sports"),
     {"Baseball", "BaseballFan", "Athletic", "StreetSports"}),
    (("bowling",), {"Bowling"}),
    (("cinema", "theater", "theatre"), {"Theatre"}),
    (("survivalist", "cache"), {"Survivalist"}),
    (("nursing", "shelter", "refugee"), {"NursingHome", "Shelter"}),
    (("office", "city hall", "court", "library", "museum", "gallery"), {"Offices", "Office"}),
]

ROW = re.compile(
    r'\{ name = "([^"]*)", type = "([^"]*)", x = (\d+), y = (\d+), z = (\d+), '
    r'width = (\d+), height = (\d+)')


def map_dir():
    pz = os.environ.get("PZ_HOME")
    if not pz:
        env = os.path.join(os.path.dirname(__file__), "env.sh")
        pz = subprocess.run(["bash", "-c", f". {env} && printf %s \"$PZ_HOME\""],
                            capture_output=True, text=True).stdout.strip()
    if not pz:
        sys.exit("PZ_HOME not set; source tools/env.sh")
    return os.path.join(pz, "media", "maps", "Muldraugh, KY")


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    d = map_dir()
    text = open(os.path.join(d, "objects.lua"), encoding="utf-8", errors="ignore").read()
    zones = [(n.strip(), int(x) + int(w) // 2, int(y) + int(h) // 2)
             for n, t, x, y, z, w, h in ROW.findall(text)
             if n.strip() and t in ("ZombiesType", "ZoneStory")]

    def nearest(x, y, labels=None):
        best = None
        for n, zx, zy in zones:
            if labels and n not in labels:
                continue
            dist = math.hypot(zx - x, zy - y)
            if best is None or dist < best[0]:
                best = (dist, n)
        return best

    hit = miss = unmapped = 0
    print(f"{'#':>4} {'row':36s} {'expects':20s} {'nearest of that kind':22s} {'dist':>6}  nearest anything")
    print("-" * 128)
    for line in open(sys.argv[1]):
        line = line.strip()
        if not line or line.count("|") < 3:
            continue
        num, name, sx, sy = line.split("|")[:4]
        x, y = int(sx), int(sy)
        want = set()
        low = name.lower()
        for kws, labels in KEYWORDS:
            if any(k in low for k in kws):
                want |= labels
        anyz = nearest(x, y)
        if not want:
            unmapped += 1
            got, dist = "(no keyword)", "-"
        else:
            b = nearest(x, y, want)
            if b is None:
                miss += 1
                got, dist = "label absent everywhere", "-"
            else:
                got, dist = b[1], f"{b[0]:.0f}"
                hit += 1 if b[0] <= 250 else 0
                miss += 0 if b[0] <= 250 else 1
        print(f"{num:>4} {name[:36]:36s} {'/'.join(sorted(want))[:20]:20s} "
              f"{got[:22]:22s} {dist:>6}  {anyz[1][:16]:16s} {anyz[0]:.0f}")

    print()
    print(f"checkable rows: {hit + miss}   confirmed within 250 tiles: {hit}   "
          f"not confirmed: {miss}   no keyword mapping: {unmapped}")
    print("Not confirmed does not mean wrong: the label layer is sparse.")


if __name__ == "__main__":
    main()
