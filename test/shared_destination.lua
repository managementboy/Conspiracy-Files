-- Two annotated maps that lead to the same place.
--
-- This is the step the plan calls product-proving: a contradiction needs two
-- sources pointing at one building, and until the writing rebuild no two
-- designs did. The measurement of 2026-09-20 was blunt about it - "123
-- destination buildings are hit, 0 of them by more than one design, the
-- content for the product-proving step does not exist". It exists now, as
-- exactly one pair, and one pair is easy to lose in an edit.
--
-- THE TRAP THIS ALSO GUARDS. There are two sources of truth for a
-- destination and they disagree about this very design.
-- MapMediaCatalogue's raw binding puts MulStashMap16 at 10628,9698;
-- MapMediaDestinations' reviewed geometry overrides it to the shared
-- 10612,9649. Read either file on its own and you get the wrong answer -
-- the catalogue says they do not share, the reviewed file says they do.
-- MapMediaCatalogue runs Destinations.apply over every binding at load, so
-- the reviewed geometry wins. This test reads the catalogue AFTER that, which
-- is the only reading that describes the running game.
-- PROVEN TO FAIL, 2026-09-21. Pointing MulStashMap16 back at its own raw
-- catalogue coordinate (10628,9698) - the exact regression the reviewed
-- geometry exists to prevent - fails with "no two designs share a
-- destination; the product-proving step has no content again".
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local Catalogue = require("ConspiracyFiles/MapMediaCatalogue")

local ids = Catalogue.list
local function binding(id) return Catalogue.get and Catalogue.get(id) or Catalogue.bindings[id] end
assert(type(ids) == "table" and #ids > 100,
    "expected the full design catalogue, got " .. tostring(ids and #ids))

-- Every target point, and who points at it.
local byPoint = {}
for _, id in ipairs(ids) do
    for _, t in ipairs(binding(id).targets or {}) do
        local key = t.x .. "," .. t.y
        byPoint[key] = byPoint[key] or {}
        table.insert(byPoint[key], id)
    end
end

local shared = {}
for key, holders in pairs(byPoint) do
    if #holders > 1 then table.sort(holders); shared[key] = holders end
end

-- At least one place two maps both lead to. Without this the mod cannot show
-- a player two accounts of one location, however good the writing is.
local sharedCount = 0
for _ in pairs(shared) do sharedCount = sharedCount + 1 end
assert(sharedCount >= 1,
    "no two designs share a destination; the product-proving step has no content again")

-- The pair the handoff names, at the Spiffo's in Muldraugh.
local eleven, sixteen = binding("MulStashMap11"), binding("MulStashMap16")
assert(eleven and sixteen, "both Muldraugh Spiffo's designs must exist")
local a, b = eleven.targets[1], sixteen.targets[1]
assert(a.x == b.x and a.y == b.y,
    string.format("MulStashMap11 leads to %d,%d and MulStashMap16 to %d,%d; "
        .. "they are meant to share one restaurant", a.x, a.y, b.x, b.y))

-- Reciprocal, so neither can be re-pointed without the other noticing.
assert(eleven.sharedPeer == "MulStashMap16" and sixteen.sharedPeer == "MulStashMap11",
    "the shared pair must name each other")

-- They must stay SEPARATE FILES about one place, not one file counted twice:
-- different story families is what makes the two accounts able to differ.
local function families(b)
    local out = {}
    for _, f in ipairs(b.storyFamilies or {}) do out[f] = true end
    return out
end
local fa, fb = families(eleven), families(sixteen)
local overlap = false
for f in pairs(fa) do if fb[f] then overlap = true end end
assert(next(fa) and next(fb), "each design must declare what it is about")
assert(not overlap,
    "both maps tell the same kind of story about the same place; two accounts that "
    .. "cannot differ are one account")

print(string.format("PASS shared destination: %d design(s) share a point; MulStashMap11 and "
    .. "MulStashMap16 both lead to %d,%d, name each other, and carry different story families",
    sharedCount, a.x, a.y))
