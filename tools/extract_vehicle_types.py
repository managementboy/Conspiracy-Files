#!/usr/bin/env python3
"""Derive the vehicle catalogue from the installed game's own vehicle scripts.

    python3 tools/extract_vehicle_types.py
    python3 tools/extract_vehicle_types.py --lua PATH

Owner, 2026-09-09: "there are also different types of cars. again misplaced
objects are a mystery. what are 50 mannequin doing in a truck."

A vehicle is not just a container that moves; it is a container that says
something about whoever used it. The game states that itself: nearly every
vehicle script carries `zombieType`, naming the kind of person found dead at
the wheel - AmbulanceDriver, Police, Postal, Fireman, PrisonGuard, Farmer,
Ranger. That is the game's own opinion about what a vehicle is for, which makes
"this cargo has nothing to do with this vehicle" a derivable fact rather than
an invented mapping.

Also recorded: whether the vehicle is a trailer (cargo with no driver at all),
and the container parts it declares, since a pickup bed and a glovebox are very
different places to hide something.
"""
import argparse
import os
import re
import subprocess
import sys


def vehicles_dir():
    pz = os.environ.get("PZ_HOME")
    if not pz:
        env = os.path.join(os.path.dirname(__file__), "env.sh")
        out = subprocess.run(["bash", "-c", f". {env} && printf %s \"$PZ_HOME\""],
                             capture_output=True, text=True)
        pz = out.stdout.strip()
    if not pz:
        sys.exit("PZ_HOME is not set and could not be resolved; source tools/env.sh")
    d = os.path.join(pz, "media", "scripts", "generated", "vehicles")
    if not os.path.isdir(d):
        sys.exit(f"vehicle scripts not found: {d}")
    return d


VEHICLE = re.compile(r"^\s*vehicle\s+([A-Za-z0-9_]+)\s*$")
FIELD = re.compile(r"^\s*(\w+)\s*=\s*(.+?),?\s*$")
PART = re.compile(r"^\s*part\s+([A-Za-z0-9_*]+)\s*$")


def parse(path):
    name, fields, parts = None, {}, []
    for line in open(path, encoding="utf-8", errors="ignore"):
        m = VEHICLE.match(line)
        if m:
            if name:
                yield name, fields, parts
            name, fields, parts = m.group(1), {}, []
            continue
        if not name:
            continue
        p = PART.match(line)
        if p:
            parts.append(p.group(1))
            continue
        f = FIELD.match(line)
        if f and f.group(1) not in fields:
            fields[f.group(1)] = f.group(2)
    if name:
        yield name, fields, parts


# Container parts worth recording. Everything else a vehicle declares is engine,
# suspension and glass.
KEEP = {"GloveBox", "TruckBed", "TrunkDoor", "SeatFrontLeft", "SeatFrontRight",
        "SeatRearLeft", "SeatRearRight", "SeatMiddleLeft", "SeatMiddleRight"}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--lua", metavar="PATH", help="write a Lua module instead of a table")
    args = ap.parse_args()

    d = vehicles_dir()
    rows = {}
    for entry in sorted(os.listdir(d)):
        if not entry.endswith(".txt"):
            continue
        for name, fields, parts in parse(os.path.join(d, entry)):
            driver = fields.get("zombieType", "").strip().strip(",")
            # A semicolon list means the game picks among several; the first is
            # enough to say what kind of person this vehicle belonged to.
            drivers = [p for p in driver.split(";") if p] if driver else []
            keep = sorted({p for p in parts if p in KEEP})
            existing = rows.get(name)
            if existing and not drivers and existing["drivers"]:
                continue
            rows[name] = {
                "id": name,
                "script": entry,
                "drivers": drivers,
                "parts": keep,
                "trailer": name.lower().startswith("trailer"),
            }

    ordered = [rows[k] for k in sorted(rows)]
    if args.lua:
        write_lua(args.lua, ordered)
        print(f"wrote {len(ordered)} vehicles to {args.lua}")
        return

    print("| Vehicle | Driver the game names | Containers | Trailer |")
    print("|---|---|---|---|")
    for row in ordered:
        print("| %s | %s | %s | %s |" % (row["id"], ", ".join(row["drivers"]) or "-",
                                         ", ".join(row["parts"]) or "-",
                                         "yes" if row["trailer"] else ""))
    named = sum(1 for r in ordered if r["drivers"])
    print(f"\n{len(ordered)} vehicles; {named} name the kind of person who drove them.")


LUA_HEADER = """-- DERIVED FILE - do not edit by hand.
--
--     python3 tools/extract_vehicle_types.py --lua \\\\
--         mod/common/media/lua/shared/ConspiracyFiles/Generated/VehicleCatalogue.lua
--
-- Parsed from media/scripts/generated/vehicles/*.txt, so every vehicle name,
-- driver and container part here is true by construction.
--
-- `drivers` is the game's own `zombieType` - the kind of person found dead at
-- that wheel. It is the game stating what a vehicle is FOR, which is what makes
-- "this cargo has nothing to do with this vehicle" a derivable fact instead of
-- a mapping somebody invented.
local M={}
M.REVISION="%s"
-- {id, drivers}
--
-- Container parts are deliberately NOT recorded. WorldAccess asks the live
-- vehicle which parts it has, because a car in the world can have a seat or a
-- trunk door missing, and a table written from the scripts would confidently
-- disagree with the car standing in front of the player.
M.vehicles={
"""


def write_lua(path, rows):
    import hashlib
    digest = hashlib.sha256(
        "\n".join(r["id"] + "|" + ",".join(r["drivers"]) for r in rows).encode()).hexdigest()[:12]
    with open(path, "w", encoding="utf-8") as out:
        out.write(LUA_HEADER % ("vehicles-" + digest))
        for row in rows:
            drivers = ",".join('"%s"' % d for d in row["drivers"])
            out.write(' {id="%s",drivers={%s}},\n' % (row["id"], drivers))
        out.write("""}
local byId={}
for _,v in ipairs(M.vehicles) do byId[v.id]=v end
function M.count() return #M.vehicles end
function M.get(id)
    local v=type(id)=="string" and byId[id]
    if not v then return nil,"unknown vehicle" end
    return {id=v.id,drivers=v.drivers}
end
return M
""")


if __name__ == "__main__":
    main()
