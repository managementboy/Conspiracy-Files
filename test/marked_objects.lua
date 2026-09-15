-- A single object belongs to somebody.
--
-- Owner, 2026-09-11, on a worn fancy pen filed with a case: "why is this
-- evidence relevant? the text gives no interesting mystery", then "if we linked
-- it to a person, then it would be perfect. a pen could be marked with the
-- name."
--
-- A random object beside paperwork is the least surprising thing there is, and
-- the old text had to insist it mattered. Marked with the case person's name -
-- the same person given a body and an ID card near the first clue - it is a
-- thread the player can pull.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Kinds = require("ConspiracyFiles/Generated/EvidenceKinds")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

local marked, unmarkedSingles = 0, 0
for seed = 1, 500 do
    local case = G.generate(catalog, seed, opts)
    if case then
        assert(G.validate(case), "seed " .. seed .. " must survive a reload")
        local person = case.identities[1].name
        for _, doc in ipairs(case.documents) do
            local carrier = assert(Kinds.get(doc.kind))
            local single = carrier.capacity == "object" and not doc.quantity
            local named = doc.body:find("carrying a name", 1, true)
            if single and not named then
                -- The worn thing and the out-of-place thing must now carry the
                -- case person's name, both on the item and in the notebook.
                if doc.title:find(", marked ", 1, true) then
                    marked = marked + 1
                    assert(doc.title:find(person, 1, true),
                        "an object is marked with somebody other than the case person: " .. doc.title)
                    assert(doc.body:find(person, 1, true), "the notebook must say whose name is on it")
                    -- The mark is the one thing asserted. Not ownership, not
                    -- presence - a name is on the object.
                    for _, claim in ipairs({ "belonged to", "was theirs", "left it", "owned by" }) do
                        assert(not doc.body:lower():find(claim, 1, true),
                            "the object claims more than its mark: " .. doc.body)
                    end
                    -- No leading article on an item name in an inventory list.
                    assert(not doc.title:find("^A ") and not doc.title:find("^An "), doc.title)
                else
                    unmarkedSingles = unmarkedSingles + 1
                end
            end
        end
    end
end
assert(marked > 50, "only " .. marked .. " marked objects across 500 cases")
assert(unmarkedSingles == 0, unmarkedSingles .. " single objects still carry no name; they are noise again")
print(string.format("PASS marked objects: %d single objects across 500 cases, every one marked "
    .. "with the case person's name and none claiming more than the mark", marked))
