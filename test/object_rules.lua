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
-- bearsName is the deliberate exception to "a rule must reach many objects":
-- the engine stamps an owner's name on exactly sixteen items, and the
-- legibility filter drops three whose ids do not become readable words
-- (Necklace_DogTag_Female and the like). Thirteen is the whole truth here, not
-- a shortfall.
-- medicalHoard is narrow for an honest reason: the game ships very few SPENT
-- medical items, and the rule refuses unused ones because a cupboard of
-- antibiotics is a windfall. Thirty is what actually exists.
local FLOOR = { physicalTrace = 50, bearsName = 13, testableAccess = 4, outOfPlace = 25,
                accumulation = 100, misplacedBulk = 100, medicalHoard = 20 }
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

-- Quantity as evidence (2026-09-09), in the two shapes the owner named: a
-- hundred eggs in the fridge is the right room and an impossible count; fifty
-- bricks in the bedroom is an ordinary count in a room with no use for it. One of something is nothing; a cupboard
-- of it is a question. The count must vary, must stay inside the rule's own
-- range, and must never fall on a category whose worth a budget cannot
-- measure - a cupboard of bandages is loot however few we make it.
--
-- Food is deliberately NOT here. It is the case the budget exists for: eggs
-- are the owner's own example, and the calorie cap is what keeps a hundred of
-- them from being a week of food.
local WINDFALL = { Ammo = true, FirstAid = true, Bandage = true, SkillBook = true, Bag = true }
for _, ruleId in ipairs({ "accumulation", "misplacedBulk", "medicalHoard" }) do
    for _, id in ipairs(Rules.candidates(ruleId)) do
        local item = assert(Catalogue.get(id))
        if ruleId == "medicalHoard" then
            -- Owner: "any place with loads of medical equipment and PPA is
            -- suspicious." True, and it contradicted the blanket ban above.
            -- The game resolves it: everything here is already USED, so the
            -- hoard is the sight the owner means and worth nothing to loot.
            local used = id:find("Dirty", 1, true) or id:find("_Blood", 1, true)
                or id:find("Used", 1, true) or Catalogue.has(item, "condition")
            assert(used, id .. " is unused medical supply; a pile of it is a windfall")
            for _, word in ipairs({ "Bone", "Chainmail", "Cuirass", "Greave" }) do
                assert(not id:find(word, 1, true), id .. " is crafted armour, not protective equipment")
            end
        else
            assert(not WINDFALL[item.category], id .. " would make a pile of it a windfall, not a mystery")
        end
        assert(item.weight > 0 and item.weight <= 2.0, id .. " is too heavy to pile in one container")
        -- The budget is what replaced banning whole categories. A pile must
        -- never be worth enough to be the reason a player opens the drawer.
        local most = Rules.quantity(function(n) return n end, ruleId, item)
        assert(most * item.weight <= Rules.WEIGHT_BUDGET + item.weight,
            id .. " can be piled past the weight budget")
        assert(most * (item.calories or 0) <= Rules.CALORIE_BUDGET + (item.calories or 0),
            id .. " can be piled past the calorie budget")
    end
end
-- Food is allowed now, and that is the point of having a budget at all: a
-- hundred eggs is a mystery in prose and a week of food in practice, so the
-- count is cut rather than the category banned.
local eggs = Rules.quantity(function(n) return n end, "accumulation", assert(Catalogue.get("Egg")))
assert(eggs * 63 <= Rules.CALORIE_BUDGET, "a pile of eggs would feed the player for a week")
local counts = {}
for seed = 1, 200 do
    local n = Rules.quantity(rng(seed), "accumulation")
    assert(n >= 5 and n <= 16, "accumulation produced " .. n .. ", outside its own range")
    counts[n] = true
end
local spread = 0
for _ in pairs(counts) do spread = spread + 1 end
assert(spread >= 5, "the count barely varies (" .. spread .. " values); quantity is the whole evidence here")
-- Everything that is not a pile places exactly one. A second copy of a
-- readable document would be two of the same page, which is a bug, not a clue.
for _, id in ipairs(Rules.list()) do
    if id ~= "accumulation" and id ~= "misplacedBulk" and id ~= "medicalHoard" then
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
                    assert(doc.quantity >= 5 and doc.quantity <= 16, "a placed pile is outside the rule's range")
                    assert(doc.roomIntent == "natural" or doc.roomIntent == "wrong",
                        "a pile must say whether the room is part of the evidence")
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

-- The room is half the evidence for a pile, so it must reach placement.
local RoomAffinity = require("ConspiracyFiles/Generated/RoomAffinity")
assert(RoomAffinity.fits("Egg", "kitchen"), "eggs belong in a kitchen")
assert(not RoomAffinity.fits("Egg", "bedroom"), "eggs do not belong in a bedroom")
assert(RoomAffinity.avoids("ClayBrick", "bedroom"), "bricks have no business in a bedroom")
assert(not RoomAffinity.avoids("ClayBrick", "toolstore"), "bricks are unremarkable in a tool store")
-- avoids is NOT the negation of fits: an item the catalogue has no opinion
-- about is unplaced, not misplaced, and calling it misplaced would scatter
-- unremarkable objects into unremarkable rooms and call the result evidence.
assert(not RoomAffinity.avoids("NoSuchItem", "bedroom"), "an unknown item cannot be in the wrong room")
assert(RoomAffinity.prefers({ kind = "ClayBrick", roomIntent = "wrong" }, "bedroom"),
    "a wrong-room document must prefer a room the item does not belong in")
assert(RoomAffinity.prefers({ kind = "Egg" }, "kitchen"), "an ordinary document keeps the original behaviour")
assert(RoomAffinity.fits("dispatch", "office"), "paperwork affinity must be untouched")

local session = assert(io.open("mod/common/media/lua/shared/ConspiracyFiles/Generated/Session.lua", "r"))
local text = session:read("*a"); session:close()
assert(text:find("RoomAffinity.prefers(doc,", 1, true),
    "placement must ask what the DOCUMENT wants from a room, not only what its kind fits")
print("PASS object rules: right room with an impossible count, and a wrong room whatever the count")
