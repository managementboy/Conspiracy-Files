-- Objects as evidence, selected by RULE rather than from a list.
--
-- Owner, 2026-09-09, having been shown a curated fifty: "50 just as 200 was an
-- example not a requirement. selection rules over the derived catalogue."
--
-- The failure this guards against is not a crash. It is the mod quietly
-- shipping with a pool one person typed in an afternoon - which is what the
-- curated fifty was, and what the two-hundred landmark atlas was before it. A
-- rule that resolves to a handful of items has the same defect as a list and
-- none of the honesty, because it LOOKS derived.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local Catalogue = require("ConspiracyFiles/Generated/ObjectCatalogue")
local Rules = require("ConspiracyFiles/Generated/ObjectRules")
local Roles = require("ConspiracyFiles/Generated/EvidenceRoles")
local Kinds = require("ConspiracyFiles/Generated/EvidenceKinds")
local G = require("ConspiracyFiles/Generated/Generator")

-- The catalogue is derived from the installed game. If it ever shrinks to
-- something a person could have typed, it stopped being derived.
assert(Catalogue.count() > 500,
    "the catalogue holds " .. Catalogue.count() .. " items; that is list-sized, not game-sized")

-- Reach. A rule must offer a real range of objects, or it is a list wearing a
-- rule's clothes. bearsName is the deliberate exception: the engine itself
-- stamps exactly sixteen items with an owner's name, and sixteen is the whole
-- truth rather than a shortfall.
local FLOOR = { physicalTrace = 50, bearsName = 16, testableAccess = 4, outOfPlace = 25,
                accumulation = 100 }
for _, id in ipairs(Rules.list()) do
    local rule = assert(Rules.describe(id))
    assert(rule.candidates >= FLOOR[id],
        id .. " reaches only " .. rule.candidates .. " objects; expected at least " .. FLOOR[id])
end

-- Evidence must never be better loot than the loot. A working firearm found in
-- a drawer would pay the player for reading the notebook.
for _, id in ipairs(Rules.candidates("physicalTrace")) do
    local item = assert(Catalogue.get(id))
    assert(not Catalogue.has(item, "firearm"), id .. " is a firearm and must not be placed as evidence")
    assert(not Rules.denialReason(item.category), id .. " comes from a denied category")
end

-- Determinism, the same requirement every other selection in the generator
-- carries: a case must rebuild identically after a reload.
local function rng(seed) return function(n) seed = (seed * 48271) % 2147483647; return seed % n + 1 end end
for _, id in ipairs(Rules.list()) do
    local first = Rules.choose(rng(4242), id)
    local again = Rules.choose(rng(4242), id)
    assert(first.id == again.id, id .. " chose two different objects from one seed")
end

-- An object role selects by rule and must never carry a hand-written carrier
-- list; that would reintroduce exactly what this replaced.
for _, roleId in ipairs({ "physicalTrace", "bearsName", "outOfPlace" }) do
    assert(Roles.ruleOf(roleId), roleId .. " must select by rule")
    assert(Roles.carriersOf(roleId) == nil, roleId .. " must not have a carrier list")
    assert(Roles.capacityOf(roleId) == "object", roleId .. " must carry no readable text")
end

-- Quantity as evidence (2026-09-09). One of something is nothing; a cupboard
-- of it is a question. The count must vary, must stay inside the rule's own
-- range, and must never fall on a category that would make the pile a windfall
-- rather than a mystery - a cupboard of bandages is loot.
local WINDFALL = { Ammo = true, FirstAid = true, Bandage = true, Food = true, SkillBook = true }
for _, id in ipairs(Rules.candidates("accumulation")) do
    local item = assert(Catalogue.get(id))
    assert(not WINDFALL[item.category], id .. " would make a pile of it a windfall, not a mystery")
    assert(item.weight > 0 and item.weight <= 1.5, id .. " is too heavy to pile in one container")
end
local counts = {}
for seed = 1, 200 do
    local n = Rules.quantity(rng(seed), "accumulation")
    assert(n >= 6 and n <= 16, "accumulation produced " .. n .. ", outside its own range")
    counts[n] = true
end
local spread = 0
for _ in pairs(counts) do spread = spread + 1 end
assert(spread >= 5, "the count barely varies (" .. spread .. " values); quantity is the whole evidence here")
for _, id in ipairs(Rules.list()) do
    if id ~= "accumulation" then
        assert(Rules.quantity(rng(1), id) == 1, id .. " must place exactly one")
    end
end

-- And cases actually place them, across many different objects rather than the
-- same one every time.
local placed, withWear, piles = {}, 0, 0
for seed = 1, 400 do
    local case = G.generate(dofile("test/fixtures/synthetic_locations.lua"), seed,
        { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true })
    if case then
        for _, doc in ipairs(case.documents) do
            local carrier = assert(Kinds.get(doc.kind))
            if carrier.capacity == "object" then
                placed[doc.kind] = true
                assert(doc.wear, doc.kind .. " must record the state it was found in")
                -- Nothing is written on an object. A body longer than a
                -- notebook sentence would be the mod explaining the object.
                assert(#doc.body <= Kinds.OBJECT_MAX_CHARS, doc.kind .. " carries too much text for an object")
                -- Nor may the mod claim blood: setBloodLevel exists on the jar
                -- but nothing has proven it survives a save.
                assert(not string.find(string.lower(doc.body), "blood", 1, true),
                    doc.kind .. " claims blood, which is not verified to persist")
                withWear = withWear + 1
                if doc.quantity then
                    assert(doc.quantity >= 6 and doc.quantity <= 16, "a placed pile is outside the rule's range")
                    piles = piles + 1
                end
            end
        end
    end
end
local distinct = 0
for _ in pairs(placed) do distinct = distinct + 1 end
assert(distinct >= 20,
    "only " .. distinct .. " distinct objects were ever placed across 400 cases; the rules are not reaching the catalogue")

print(string.format("PASS object rules: %d catalogue items, %d rules reaching %d/%d/%d/%d objects; "
    .. "%d object placements across 400 cases used %d distinct items, no firearms, no claimed blood",
    Catalogue.count(), #Rules.list(),
    Rules.describe("physicalTrace").candidates, Rules.describe("bearsName").candidates,
    Rules.describe("testableAccess").candidates, Rules.describe("outOfPlace").candidates,
    withWear, distinct) .. string.format("; %d were piles", piles))

-- Placement must create the whole pile and treat the whole pile as placed.
-- Before quantity, the runtime called any second item carrying the token a
-- conflict - which is sticky, and would have killed every accumulation clue
-- permanently the moment it was placed.
local f = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua", "r"))
local runtime = f:read("*a"); f:close()
assert(not runtime:find("if count>1 then", 1, true),
    "placement still calls a second copy a conflict; every pile would die on placement")
assert(runtime:find("if count>expected then", 1, true), "placement must compare against the expected count")
assert(runtime:find("for _=1,expected do", 1, true), "placement must create the whole pile")
assert(runtime:find("expectedCount(api,candidate)==1", 1, true),
    "relocation must skip piles; it is built on there being exactly one item with the token")
print("PASS object rules: placement creates and counts whole piles, and never relocates one")
