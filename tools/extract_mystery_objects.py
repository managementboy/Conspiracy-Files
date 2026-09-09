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
  firearm    it takes ammunition; marked so a rule can refuse it as loot
  countable  duplicates are identical, so the only variable is how many there
             are - one bottle of bleach is nothing, a cupboard of it is a
             question

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
MODULE = re.compile(r"^\s*module\s+(\S+)")


def parse(path):
    """Yield (name, fields) for every item block in one script file.

    The files open with `module Base {`, so an item block is never at brace
    depth zero. Depth is therefore counted from the item line, not from the
    top of the file - the first version of this counted from the file and
    matched nothing at all.
    """
    module = "Base"
    name, fields, depth, started = None, {}, 0, False
    for line in open(path, encoding="utf-8", errors="ignore"):
        if name is None:
            m = MODULE.match(line)
            if m:
                module = m.group(1)
            m = ITEM.match(line)
            m = ITEM.match(line)
            if m:
                name, fields, depth, started = m.group(1), {}, 0, False
            continue
        depth += line.count("{")
        if line.count("{"):
            started = True
        depth -= line.count("}")
        if started and depth <= 0:
            fields["__module"] = module
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
    # A firearm is marked so selection rules can refuse it. Evidence must never
    # be better loot than the loot; a working gun in a drawer pays the player
    # for reading the notebook.
    if fields.get("AmmoType") or fields.get("MagazineType"):
        out.append("firearm")
    # Countable: no condition track, so two of them are indistinguishable and
    # the only thing that can vary is how many there are. One bottle of bleach
    # is a bottle of bleach; forty is a question. Weight is required because a
    # countable thing has to be a thing the player can pick up and pile.
    if "condition" not in out and "keyed" not in out and fields.get("Weight"):
        out.append("countable")
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--all", action="store_true", help="every item with a usable property")
    ap.add_argument("--property", help="only items with this property")
    ap.add_argument("--category", help="only this DisplayCategory")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--lua", metavar="PATH",
                    help="write the catalogue as a Lua module instead of a table")
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
            try:
                weight = float(fields.get("Weight", "0") or 0)
            except ValueError:
                weight = 0.0
            try:
                calories = float(fields.get("Calories", "0") or 0)
            except ValueError:
                calories = 0.0
            rows.append((name, source, category, ",".join(props),
                         fields.get("__module", "Base"), weight, calories))

    rows.sort(key=lambda r: (r[0],))
    if args.limit:
        rows = rows[:args.limit]

    if args.lua:
        write_lua(args.lua, rows)
        print(f"wrote {len(rows)} items to {args.lua}")
        return

    print("| Item | Script | Category | Usable properties |")
    print("|---|---|---|---|")
    for name, source, category, props, _module, _weight, _calories in rows:
        print(f"| {name} | {source} | {category} | {props} |")

    counts = {}
    for _, _, _, props, _module, _weight, _calories in rows:
        for p in props.split(","):
            counts[p] = counts.get(p, 0) + 1
    print(f"\n{len(rows)} candidates: " + ", ".join(f"{k}={v}" for k, v in sorted(counts.items())))
    print("name and ModData persistence proven (T7). condition is a core saved field. "
          "blood on a weapon is NOT verified to persist - test before relying on it.")


LUA_HEADER = """-- DERIVED FILE - do not edit by hand.
--
--     python3 tools/extract_mystery_objects.py --lua \\
--         mod/common/media/lua/shared/ConspiracyFiles/Generated/ObjectCatalogue.lua
--
-- Every row was parsed out of the installed game's own item scripts
-- (media/scripts/generated/items/*.txt), so each item name and each property
-- claimed for it is true by construction. A catalogue written from memory
-- looks exactly as authoritative and cannot be checked by reading it.
--
-- Properties, and what each is good for:
--   name       the engine stamps an owner's name on it (Tags = base:applyownername)
--   condition  it has a condition track, so it can be found nearly broken
--   blood      it is a weapon, so setBloodLevel applies (persistence UNVERIFIED)
--   keyed      it is a key, testable against a real door
--   firearm    it takes ammunition; marked so a rule can refuse it as loot
--   countable  duplicates are identical, so quantity is the only variable -
--              one bottle of bleach is nothing, a cupboard of it is a question
--
-- This file is data only. ObjectRules.lua decides which of these an
-- investigation may use, and never picks an item by name.
local M={}
M.REVISION="%s"
-- {id, fullType, category, script, weight, calories, properties}
--
-- `calories` is carried so a rule can bound what a pile is WORTH rather than
-- banning whole categories from being piled. A hundred eggs is a mystery in
-- prose and a week of food in practice; the budget is what keeps evidence from
-- being better loot than the loot.
M.items={
"""


def write_lua(path, rows):
    import hashlib
    digest = hashlib.sha256(
        "\n".join("|".join(r[:4]) for r in rows).encode("utf-8")).hexdigest()[:12]
    with open(path, "w", encoding="utf-8") as out:
        out.write(LUA_HEADER % ("objects-" + digest))
        for name, source, category, props, module, weight, calories in rows:
            plist = ",".join('"%s"' % p for p in props.split(","))
            out.write(' {id="%s",fullType="%s.%s",category="%s",script="%s",weight=%.3f,calories=%.1f,properties={%s}},\n'
                      % (name, module, name, category, source, weight, calories, plist))
        out.write("""}
local byId={}
for _,item in ipairs(M.items) do byId[item.id]=item end
function M.count() return #M.items end
function M.get(id)
    local item=type(id)=="string" and byId[id]
    if not item then return nil,"unknown catalogue object" end
    return {id=item.id,fullType=item.fullType,category=item.category,
            script=item.script,weight=item.weight,calories=item.calories,
            properties=item.properties}
end
function M.has(item,property)
    for _,p in ipairs(item.properties) do if p==property then return true end end
    return false
end
return M
""")


if __name__ == "__main__":
    main()
