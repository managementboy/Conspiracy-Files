-- A new case is about people the player has already met.
--
-- Owner, 2026-09-11: "do we track the names of corpses so we can fill out other
-- evidence with it?" We did - every looted ID is recorded against the body it
-- came off - and every case still drew from eight invented names.
--
-- The names are read at case creation and SAVED IN THE CASE, exactly as the two
-- buildings are, which is what keeps a case rebuildable from its seed: a
-- world-derived fact is an input recorded alongside it, never re-read from the
-- world at load.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Names = require("ConspiracyFiles/PersonNameObservations")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local base = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }
local function opts(names)
    local o = {}
    for k, v in pairs(base) do o[k] = v end
    o.names = names
    return o
end
local met = { "Genevieve Ricks", "Aisha Baskin", "Jerri Knowlton" }

-- With two or more people met, the case is about them and only them.
for seed = 1, 60 do
    local case = G.generate(catalog, seed, opts(met))
    if case then
        assert(G.validate(case), "a cast case must survive a reload")
        for _, person in ipairs(case.identities) do
            local known = false
            for _, n in ipairs(met) do if n == person.name then known = true end end
            assert(known, "seed " .. seed .. " invented " .. person.name .. " while three people were met")
            assert(person.met == true, "a met person must be marked so no second body is named")
        end
    end
end

-- Reload survival is the whole reason the cast is saved. Tampering with it -
-- swapping a name in the saved case - must fail validation, not quietly
-- produce a different story.
local case = assert(G.generate(catalog, 5, opts(met)))
local altered = {}
for k, v in pairs(case) do altered[k] = v end
altered.cast = { "Aisha Baskin", "Somebody Else", "Jerri Knowlton" }
assert(not G.validate(altered), "a changed cast must not validate")

-- The same seed with the same met names tells the same story; with different
-- met names, different people.
local again = assert(G.generate(catalog, 5, opts(met)))
assert(again.identities[1].name == case.identities[1].name)

-- One met name: mixed into the invented list, not the whole cast.
local one = assert(G.generate(catalog, 7, opts({ "Genevieve Ricks" })))
assert(G.validate(one))
-- None: nothing changes, and no cast field is saved at all.
local none = assert(G.generate(catalog, 7, base))
assert(none.cast == nil, "a case with nobody met must not carry an empty cast")

-- Only plausible names reach a case: a single word, a control character or an
-- absurd length is refused rather than written into a letter.
local cleaned = G.castFrom({ "Solo", "Ok Name", "Bad\nName", string.rep("x", 90) .. " y", "Ok Name" })
assert(#cleaned == 1 and cleaned[1] == "Ok Name", table.concat(cleaned or {}, "|"))
assert(G.castFrom({}) == nil)

-- The name store lists what it holds, in a stable order.
local root = Names.empty()
root = select(1, Names.observe(root, "corpse-item:2", "Aisha Baskin"))
root = select(1, Names.observe(root, "corpse-item:1", "Genevieve Ricks"))
local listed = Names.names(root)
assert(#listed == 2 and listed[1] == "Genevieve Ricks" and listed[2] == "Aisha Baskin",
    "names must come back ordered by the body they came off: " .. table.concat(listed, ", "))

-- And a met person is never given a second body.
local runtime = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")):read("*a")
assert(runtime:find("if person and person.met then", 1, true),
    "a person already met must not have a second zombie named after them")
assert(runtime:find("options.names=met", 1, true), "case creation must hand the met names to the generator")
-- The first version called its local `log`, shadowing the runtime's own log
-- function, and case creation crashed on the next log line. Nothing in this
-- file may declare a local by that name again.
assert(not runtime:find("\n%s*local log=ConspiracyFiles"),
    "a local named log shadows the runtime's log function and crashes case creation")
print("PASS case cast: new cases are about people already met, the cast is saved and validated, "
    .. "and nobody is given a second body")
