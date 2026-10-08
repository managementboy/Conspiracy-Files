#!/usr/bin/env python3
"""Compare the reference building export (dev/addresses/world1.tsv, made once on the real game) with a fresh one
(tools/realmap/export_server.sh). Any difference means the real map changed (a game update), and the shipped
address book / map sites derived from the old export may be stale.

  compare_export.py REFERENCE.tsv FRESH.tsv
Exit: 0 identical buildings | 1 differences
"""
import sys


def load(path):
    head, rows = {}, {}
    for ln in open(path, encoding="utf-8"):
        ln = ln.rstrip("\n")
        if ln.startswith("#"):
            k, _, v = ln[1:].strip().partition(" "); head[k] = v
        elif ln.strip():
            f = ln.split("\t"); rows[f[0]] = tuple(f[1:8]) + ((f[8],) if len(f) > 8 else ("",))
    return head, rows


def main(a, b):
    ha, ra = load(a); hb, rb = load(b)
    removed = sorted(set(ra) - set(rb)); added = sorted(set(rb) - set(ra))
    changed = sorted(i for i in set(ra) & set(rb) if ra[i] != rb[i])
    print(f"reference: game {ha.get('game')}, {len(ra)} buildings | fresh: game {hb.get('game')}, {len(rb)} buildings")
    for i in removed[:5]: print(f"  GONE    {i} {ra[i][:4]}")
    for i in added[:5]: print(f"  NEW     {i} {rb[i][:4]}")
    for i in changed[:5]: print(f"  CHANGED {i} {ra[i]} -> {rb[i]}")
    print(f"real map vs reference export: {len(removed)} gone, {len(added)} new, {len(changed)} changed")
    return 0 if not (removed or added or changed) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2]))
