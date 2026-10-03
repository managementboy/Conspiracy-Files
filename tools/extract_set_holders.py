#!/usr/bin/env python3
"""Derive the allowed HOLDERS for No Help object sets from the installed game.

    python3 tools/extract_set_holders.py --lua \
        mod-nohelp/common/media/lua/shared/NHShared/Generated/HolderData.lua

A set clue (2-4 vanilla items) is placed inside one carryable vanilla container
(a bag, box or case) so the player finds one thing with the pieces in it. The
list of possible holders is parsed out of the game's own item scripts, never
written from memory: every item in media/scripts/generated/items/container.txt
whose ItemType is base:container, with its Capacity, Weight and MaxItemSize.

Nothing is preselected by us. Only what cannot work physically is left out:
 - a container with an AcceptItemFunction (wallets, key rings, ammo straps,
   holsters): the game refuses ordinary items in them;
 - a container with no Capacity (none exist in 42.21; guarded anyway).
Capacity too small for a given set is handled per set at pick time
(NHShared/SetHolders.lua), not here.
"""
import argparse, os, re, subprocess, sys

def pz_home():
    pz = os.environ.get("PZ_HOME")
    if not pz:
        env = os.path.join(os.path.dirname(__file__), "env.sh")
        out = subprocess.run(["bash", "-c", f". {env} && printf %s \"$PZ_HOME\""], capture_output=True, text=True)
        pz = out.stdout.strip()
    if not pz:
        sys.exit("PZ_HOME is not set; source tools/env.sh")
    return pz

def build_id(pz):
    here = os.path.abspath(pz)
    for _ in range(5):  # steamapps/common/ProjectZomboid[/projectzomboid]
        acf = os.path.join(here, "appmanifest_108600.acf")
        if os.path.exists(acf):
            m = re.search(r'"buildid"\s+"(\d+)"', open(acf).read())
            return m.group(1) if m else "unknown"
        here = os.path.dirname(here)
    return "unknown"

def parse(path):
    """item blocks at brace depth 1 inside the module; nested blocks ignored."""
    items, name, depth, fields = [], None, 0, {}
    for line in open(path, encoding="utf-8", errors="ignore"):
        s = line.strip()
        m = re.match(r"item\s+(\S+)\s*$", s)
        if name is None:
            if m:
                name, depth, fields = m.group(1), 0, {}
            continue
        if s == "{":
            depth += 1; continue
        if s == "}":
            depth -= 1
            if depth == 0:
                items.append((name, fields)); name = None
            continue
        if depth == 1 and "=" in s:
            k, v = s.split("=", 1)
            fields[k.strip()] = v.strip().rstrip(",")
    return items

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lua")
    args = ap.parse_args()
    pz = pz_home()
    path = os.path.join(pz, "media", "scripts", "generated", "items", "container.txt")
    rows, dropped = [], {"accept-function": 0, "no-capacity": 0, "not-container": 0}
    for name, f in parse(path):
        if f.get("ItemType") != "base:container":
            dropped["not-container"] += 1; continue
        if "AcceptItemFunction" in f:
            dropped["accept-function"] += 1; continue
        if "Capacity" not in f:
            dropped["no-capacity"] += 1; continue
        rows.append((name, float(f["Capacity"]), float(f.get("Weight", "1")),
                     float(f["MaxItemSize"]) if "MaxItemSize" in f else None))
    rows.sort()
    out = ["-- DERIVED FILE - do not edit by hand.", "--",
           "--     python3 tools/extract_set_holders.py --lua <this file>", "--",
           "-- Every row was parsed out of the installed game's own container.txt, so",
           "-- each holder id exists in that build. See docs/design/SET_HOLDERS.md.",
           "-- Left out (cannot hold ordinary items): "
           + ", ".join(f"{k}={v}" for k, v in sorted(dropped.items())) + ".",
           "local M={}",
           f'M.BUILD="{build_id(pz)}"', 'M.GAME="Build 42.21"',
           "-- {id, capacity, weight, maxItemSize or false}", "M.holders={"]
    for n, c, w, mx in rows:
        out.append(f' {{id="{n}",fullType="Base.{n}",capacity={c:g},weight={w:g},maxItemSize={("%g" % mx) if mx is not None else "false"}}},')
    out += ["}", "return M", ""]
    text = "\n".join(out)
    if args.lua:
        open(args.lua, "w").write(text)
    else:
        sys.stdout.write(text)
    print(f"{len(rows)} holders; dropped {dropped}", file=sys.stderr)

if __name__ == "__main__":
    main()
