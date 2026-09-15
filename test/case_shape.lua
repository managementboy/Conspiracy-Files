-- A case is no longer built to one fixed shape.
--
-- Owner, 2026-09-10: "are we still building the mysteries with a set amount of
-- clues?" Partly. The COUNT already varied, three to seven and evenly. What
-- never varied was the skeleton: every case ever generated was a claim, a
-- response, and a review of the pair.
--
-- For thirteen of the twenty premises the claim and the response already hold
-- the whole disagreement, and the review - somebody inside the organisation
-- doing less about it than the reader would like - is worth having without
-- being load-bearing. Those cases may now end on the contradiction itself,
-- which reads differently: it stops where the paperwork stops, with nobody
-- having reacted at all.
--
-- The other seven keep their review, because the point of those cases IS what
-- the office did next.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Premises = require("ConspiracyFiles/Generated/Premises")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

assert(G.MIN_EVIDENCE == 2, "a claim and a record contradicting it is a whole case")

local optional, required = 0, 0
for _, id in ipairs(Premises.list()) do
    if Premises.get(id).reviewOptional then optional = optional + 1 else required = required + 1 end
end
assert(optional >= 8 and required >= 4,
    "the split should be a judgement per premise, not all or nothing: " .. optional .. "/" .. required)

local sizes, without, with = {}, 0, 0
local seenWithout = {}
for seed = 1, 600 do
    local case = G.generate(catalog, seed, opts)
    if case then
        assert(G.validate(case), "every shape must survive a reload")
        sizes[#case.documents] = (sizes[#case.documents] or 0) + 1
        local premise = Premises.get(case.premiseId)
        -- The review's own physical description is the only reliable marker:
        -- documents are renumbered as optional ones are appended, so an id
        -- says nothing about which role a document plays.
        local marker = string.sub(premise.review.found, 1, 40)
        local has = false
        for _, doc in ipairs(case.documents) do
            if string.find(doc.body, marker, 1, true) then has = true end
        end
        if has then with = with + 1 else
            without = without + 1
            seenWithout[case.premiseId] = true
            -- A premise that needs its review must never lose it.
            assert(premise.reviewOptional,
                case.premiseId .. " lost a review it needs to make sense")
        end
    end
end

assert(without > 100, "only " .. without .. " cases ended on the contradiction; the shape is barely varying")
assert(with > 100, "only " .. with .. " cases kept a review; the shape swung the other way")
local distinct = 0
for _ in pairs(seenWithout) do distinct = distinct + 1 end
assert(distinct >= 8, "only " .. distinct .. " premises ever drop the review")

-- Two-document cases must actually occur, or MIN_EVIDENCE=2 is decoration.
assert((sizes[2] or 0) > 0, "no case was ever two documents")
for n in pairs(sizes) do
    assert(n >= G.MIN_EVIDENCE and n <= G.MAX_EVIDENCE, "a case of " .. n .. " documents is out of bounds")
end

-- And the count still varies across the whole range, which was already true
-- and must not have been broken by making the skeleton variable.
local shapes = 0
for _ in pairs(sizes) do shapes = shapes + 1 end
assert(shapes >= 5, "case sizes collapsed to " .. shapes .. " values")

print(string.format("PASS case shape: %d cases ended on the contradiction and %d kept a review, "
    .. "across %d premises and %d different sizes", without, with, distinct, shapes))
