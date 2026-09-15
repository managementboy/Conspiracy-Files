-- A connection should name a place, not a building id.
--
-- Playtest 2026-09-09, the first connection entry any player has seen:
--   "A key I found among a body's belongings matches the building at
--    11259175162085419."
--
-- No survivor writes a seventeen-digit number in a notebook. Same class as
-- "wore a Generic03" and "generic skirt": an internal identifier reaching
-- player-facing prose.
--
-- The address book is keyed by BuildingDef:getIDString(), which is exactly
-- what observedKeyDoor stores, so the lookup is direct. But the book fills in
-- as the player explores and never names every building, so the absent case
-- matters as much as the present one - and an unnamed building must produce no
-- identifier at all rather than fall back to the number.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/ObservedKeyLead")

local root = M.new and M.new() or nil
local staged = select(1, M.observe(root or M.empty(), {
    id = "door:corpse-item:585873113", sourceToken = "corpse-item:585873113",
    keyId = 98122214, buildingId = "11259175162085419",
}))
assert(staged, "the fixture lead must stage")

local function textOf(labelFor)
    return M.rows(staged, labelFor)[1].detailText
end

-- Known address: the entry names the street and never the id.
local named = textOf(function() return "the house on Franklin St" end)
assert(named:find("the house on Franklin St", 1, true), "a known address must be named")
assert(not named:find("11259175162085419", 1, true),
    "the building id must never appear once an address is known")

-- Unknown address: no identifier at all. This is the case that matters -
-- falling back to the number would be worse than saying nothing.
local unknown = textOf(function() return nil end)
assert(not unknown:find("11259175162085419", 1, true),
    "an unnamed building must not fall back to the raw id")
assert(unknown:find("a building I have been to", 1, true),
    "an unnamed building still gets a readable sentence")

-- No lookup supplied at all: same as unknown, never a crash.
local none = textOf(nil)
assert(not none:find("11259175162085419", 1, true), "no lookup must not leak the id")

-- A lookup that throws must not take the notebook with it.
local threw = textOf(function() error("book not ready") end)
assert(not threw:find("11259175162085419", 1, true), "a throwing lookup must not leak the id")
assert(threw:find("a building I have been to", 1, true), "a throwing lookup degrades quietly")

-- Junk from the lookup is refused rather than printed.
for _, bad in ipairs({ "", ("x"):rep(200), "two\nlines", 42, true }) do
    local text = textOf(function() return bad end)
    assert(text:find("a building I have been to", 1, true),
        "a malformed label must be refused, not rendered")
end

-- The refusal to conclude survives every path; it is the point of the record.
for _, text in ipairs({ named, unknown, none, threw }) do
    assert(text:find("does not establish who the body was", 1, true),
        "the refusal to conclude must never be lost")
end

print('PASS key lead address: a known building is named, an unknown one gets no '
    .. 'identifier, malformed and throwing lookups degrade, refusal always kept')
