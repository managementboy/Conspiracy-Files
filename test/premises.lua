-- Metadata pool reachability, seeded variants and reference independence.
-- Local conclusions are required; the event contract gates them by sources.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Premises = require("ConspiracyFiles/Generated/Premises")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

-- TWENTY IS THE ORDINARY POOL, not the file's length. The personal opening
-- openings carry the survivor's own name and belong to the first case of a
-- save only. What this test has always cared about is how many stories an
-- ordinary case can tell, so it asserts that directly now - and asserts the
-- total separately, so openings cannot quietly widen the ordinary pool either.
assert(Premises.choosableCount() == 20,
    "expected twenty premises an ordinary case can draw, got " .. Premises.choosableCount())
-- Twenty ordinary, plus four that are selected outside the ordinary draw:
-- three personal openings and their connected follow-up. All are excluded
-- from `choose`, so the ordinary pool above is what an ordinary case can tell.
assert(Premises.count() == 24 and Premises.openingCount()==3,
    "expected twenty-four in total - twenty ordinary, three openings and the follow-up, got " .. Premises.count())

-- The case reference must not give the premise away. The links between
-- documents already carry the connection and the record sorts on them, so a
-- reference that encoded the story would only tell the player which case they
-- had drawn before they had read a word of it.
local perPremise, perPrefix = {}, {}
for seed = 1, 600 do
    local case = G.generate(catalog, seed, opts)
    if case then
        local prefix = string.match(case.documents[1].body, "Record: ([A-Z]+)%-") or
                       string.match(case.documents[1].title, "/ ([A-Z]+)%-")
        assert(prefix, "a case must carry a reference: " .. case.documents[1].title)
        perPremise[case.premiseId] = perPremise[case.premiseId] or {}
        perPremise[case.premiseId][prefix] = true
        perPrefix[prefix] = perPrefix[prefix] or {}
        perPrefix[prefix][case.premiseId] = true
    end
end
for id, prefixes in pairs(perPremise) do
    local n = 0
    for _ in pairs(prefixes) do n = n + 1 end
    assert(n > 1, "premise " .. id .. " always uses the same reference prefix; the reference gives the story away")
end
local shared = 0
for _, ids in pairs(perPrefix) do
    local n = 0
    for _ in pairs(ids) do n = n + 1 end
    if n > 1 then shared = shared + 1 end
end
assert(shared > 0, "no reference prefix is ever shared between premises; the reference still identifies the story")

local seen, outlines, kinds = {}, {}, {}
local cases = 0
for seed = 1, 600 do
    local case = G.generate(catalog, seed, opts)
    if case then
        cases = cases + 1
        assert(case.premiseId, "a case must record which premise it tells")
        assert(Premises.get(case.premiseId), "case names an unknown premise: " .. case.premiseId)
        seen[case.premiseId] = (seen[case.premiseId] or 0) + 1
        outlines[case.premiseId] = outlines[case.premiseId] or {}
        outlines[case.premiseId][case.outline] = true
        -- Reload survival. G.validate rebuilds the case from its seed and
        -- compares every field, so a premise chosen from anything but the
        -- seeded PRNG would fail here rather than in play.
        local ok, why = G.validate(case)
        assert(ok, "seed " .. seed .. " (" .. case.premiseId .. ") does not survive validation: " .. tostring(why))
        for _, doc in ipairs(case.documents) do
            kinds[doc.kind] = (kinds[doc.kind] or 0) + 1
            -- A placeholder that reached a player would be a bug they could
            -- read. There is no legitimate '{' in any document.
            assert(not string.find(doc.body, "{", 1, true),
                "unsubstituted placeholder in " .. case.premiseId .. ": " .. doc.title)
            assert(not string.find(doc.title, "{", 1, true),
                "unsubstituted placeholder in a title: " .. doc.title)
        end
    end
end

-- REACHABILITY IS PER KIND. An ordinary premise must be reachable from ordinary
-- seeds; the personal opening must NOT be - it is asked for by name, once, for
-- the first case of a save, and a seed that could draw it would put the
-- survivor's own name into an arbitrary later case. Both are checked, in the
-- way each is meant to be reached.
for _, id in ipairs(Premises.list()) do
    local kind = Premises.get(id)
    if kind.opening or kind.followUp then
        assert((seen[id] or 0) == 0,
            "premise " .. id .. " is asked for by name and must be unreachable from ordinary seeds, but a seed drew it")
    else
    assert((seen[id] or 0) > 0, "premise " .. id .. " is unreachable from any of 600 seeds")
    -- Both authored events must occur. Legacy outline names remain stored
    -- identifiers; they no longer prescribe agreement or an unresolved ending.
    assert(outlines[id]["corroboration"], "premise " .. id .. " never corroborates")
    assert(outlines[id]["conflicting-account"], "premise " .. id .. " never conflicts")
    end
end

-- The three anchor carriers must all stay reachable: premises choose their own
-- kinds, and a set that happened to pick only one would quietly narrow the mod.
for _, kind in ipairs({ "dispatch", "letter", "receipt", "notepad" }) do
    assert((kinds[kind] or 0) > 0, "anchor carrier " .. kind .. " became unreachable")
end

-- The same seed must tell the same story twice running, or a reload changes
-- what the player already read.
for _, seed in ipairs({ 3, 91, 5000, 123456 }) do
    local first = G.generate(catalog, seed, opts)
    local again = G.generate(catalog, seed, opts)
    assert(first.premiseId == again.premiseId, "seed " .. seed .. " chose two different premises")
    assert(first.documents[1].body == again.documents[1].body, "seed " .. seed .. " wrote two different documents")
end

print(string.format("PASS premises: %d metadata families, ordinary pool and both authored variants reached across %d cases",Premises.count(),cases))
