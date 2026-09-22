-- The profession-opening playtest must work for EVERY profession, not the
-- first one.
--
-- Fitness Instructor is the family that exists today. Ten more are expected.
-- A check that names it in its logic would need editing for each, and the one
-- most likely to be forgotten is the one nobody re-reads.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local sh=read("tools/autotest/checks/profession_openings.sh")
local lua=read("tools/autotest/checks/profession_openings.lua")

-- The families come from the mod, not from a list in the check.
assert(lua:find("Premises.list()",1,true) and lua:find("Premises.get(id)",1,true),
    "the families must be enumerated from Premises")
assert(lua:find("e.profession",1,true),
    "a family is a premise that names a profession")
assert(sh:find("for fam in $families",1,true),
    "the driver must loop over whatever families the mod advertises")

-- No profession id may appear in the shell driver's logic at all.
for line in sh:gmatch("[^\n]+") do
    if not line:match("^%s*#") then
        assert(not line:find("fitnessinstructor",1,true),
            "the driver names a profession in its logic; it must be driven by "
            .."Premises so a new family needs no edit here: "..line)
    end
end

-- The engine constant is derived, with one known mapping allowed as a
-- fallback. A table of every profession would be the same maintenance trap.
assert(lua:find("function P.constantFor",1,true),
    "the CharacterProfession constant must be derived from the profession id")
assert(lua:find("return nil",1,true),
    "constantFor must be able to say it does not know, so the caller reports "
    .."NOT EXERCISED rather than testing the wrong character")

-- The three questions the check exists to answer.
assert(sh:find("the case records profession=",1,true),
    "it must assert the runtime routed the profession")
assert(sh:find("the starts are not varying",1,true),
    "it must assert the title varies across fresh saves - the whole point")
assert(sh:find("the opening clue is not on the player",1,true),
    "it must assert the clue is in the inventory")
-- And the inventory answer must come from the inventory.
assert(lua:find("getPlayer():getInventory():getItems()",1,true),
    "whether the clue is on the player must be read from the inventory, not "
    .."from the assignment's status: 'delivered' and 'in the bag' are "
    .."different claims and only the second is what the player sees")

-- Variation needs more than one save to mean anything.
assert(sh:find('[ "$reached" -lt 2 ]',1,true),
    "with fewer than two saves the check must say variation was NOT EXERCISED "
    .."rather than pass on a single sample")

-- A RUN THAT PRODUCED NO CASE IS NOT A PASS. The first run of this check
-- reached zero saves and printed PASS - green by silence, in a third check,
-- after the same bug had been fixed in map_coverage and campaign.
assert(sh:find('[ "$total_reached" -eq 0 ]',1,true),
    "reaching no saves at all must not be a PASS")
assert(sh:find('verdict="COULD NOT RUN"',1,true) and sh:find("*) exit 2",1,true),
    "a run that produced nothing must report COULD NOT RUN and exit non-zero")
-- And the two reasons it reached nothing must stay fixed.
assert(sh:find('"$PZ" fresh',1,true),
    "saves after the first must ask the RUNNING game for a new world; "
    .."start_world refuses while a game is up")
assert(sh:find("automaticStatus().preparing",1,true),
    "the world starts its own first case at spawn; the check must wait for "
    .."that before replacing it, or it is refused as 'preparation already "
    .."running'")

print("PASS profession_openings_contract: families come from Premises, no "
    .."profession id in the driver's logic, and the clue is read from the "
    .."inventory")
