#!/usr/bin/env python3
"""Which of the map-derived data files the mod SHIPS refer to buildings the real map changes?

  impact.py REFERENCE.tsv WORLD_A.tsv WORLD_B.tsv
REFERENCE is the export the shipped data was built from. A and B are fresh exports of two separate new worlds on the
installed game. Two different effects are told apart:
  updated   the building is the same in A and B but differs from the reference  (the game update changed it)
  varies    the building differs between A and B                                 (the game builds it differently per world)
Each shipped Generated/*.lua is read for 15-17 digit building ids. Exit: 0 nothing shipped is affected | 1 something is.
"""
import re, sys

GEN = "mod-nohelp/common/media/lua/shared/NHShared/Generated/"
FILES = ["AddressBook.lua", "MapSites.lua", "FixedContainerIndexData.lua", "VanillaScenes.lua"]


def load(p):
    d = {}
    for ln in open(p, encoding="utf-8"):
        if ln.startswith("#") or not ln.strip(): continue
        f = ln.rstrip("\n").split("\t"); d[f[0]] = tuple(f[1:8])
    return d


def main(ref_path, a_path, b_path):
    ref, a, b = load(ref_path), load(a_path), load(b_path)
    every = set(ref) | set(a) | set(b)
    varies = {i for i in every if a.get(i) != b.get(i)}
    updated = {i for i in every if a.get(i) == b.get(i) and a.get(i) != ref.get(i)}
    print(f"buildings the game update changed (same in both new worlds): {len(updated)}")
    print(f"buildings that differ from one new world to the next:        {len(varies)} ({100 * len(varies) / max(len(a), 1):.1f}% of the map)")
    worst = 0
    for f in FILES:
        ids = set(re.findall(r"\b(\d{15,17})\b", open(GEN + f, encoding="utf-8", errors="replace").read()))
        u, v = len(ids & updated), len(ids & varies)
        flag = "  <-- may be stale" if u or v else ""
        print(f"  {f:30} refers to {len(ids):5} buildings: {u:4} updated, {v:4} vary by world{flag}")
        worst = worst or (1 if (u or v) else 0)
    return worst


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:4]))
