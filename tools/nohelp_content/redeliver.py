#!/usr/bin/env python3
"""Rewrite clues IN PLACE: python3 tools/nohelp_content/redeliver.py edits.json

edits.json: {"t0010-02": {"title": "...", "body": "...", "rival_reading": "...",
"gloss": "..."}, ...}  (any of those four fields; everything else is kept).
Extra key "lean": "containment"|"agricultural" sets every where[*].lean to it and
where[*].rival to the other side. Axioms are grouped per side with no primary,
so they are left as they are.
For each affected ticket it writes content/nohelp/incoming/<ticket>.json holding
the ticket's accepted rows (game fields + sidecar fields) with the edits applied,
ready for `convert.lua --check` and `convert.lua`. Prints ids only."""
import json, sys, os
root = "content/nohelp"
OTHER = {"containment": "agricultural", "agricultural": "containment"}
edits = json.load(open(sys.argv[1]))
tickets = {}
for cid in edits:
    tickets.setdefault(cid.split("-")[0].upper(), []).append(cid)
for t, ids in sorted(tickets.items()):
    rows = json.load(open(f"{root}/accepted/{t}.json"))
    side = json.load(open(f"{root}/accepted/sidecar/{t}.json"))
    out = []
    for r in rows:
        r = dict(r); r.update(side.get(r["id"], {}))
        if r["id"] in edits:
            for k, v in edits[r["id"]].items():
                assert k in ("title", "body", "rival_reading", "gloss", "lean"), k
                if k == "lean":
                    assert v in OTHER, v
                    r["where"] = [dict(w, lean=v, rival=OTHER[v]) for w in r["where"]]
                else:
                    r[k] = v
        out.append(r)
    json.dump(out, open(f"{root}/incoming/{t}.json", "w"), indent=1, ensure_ascii=False)
    print(t, ids)
