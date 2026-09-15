-- Twenty premises, and the properties that keep them honest.
--
-- Until this change the generator told exactly one story - a maintenance
-- company moving a sealed case between two addresses with a missing
-- authorisation. Every earlier improvement (carriers, then roles, then
-- disagreement) gave that story more ways to be told without giving it a
-- second story, so a player who had seen two cases had seen the mod.
--
-- What must be true now, and is checked below:
--   1. all twenty premises are reachable from ordinary seeds;
--   2. a case still rebuilds byte-identically from its seed, or it cannot
--      survive a save and reload (Generator.validate rebuilds and compares);
--   3. the same premise reads two ways - agreeing and disputing - because a
--      premise with one reading is a plot, not an investigation;
--   4. no document asserts a conclusion.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Premises = require("ConspiracyFiles/Generated/Premises")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

assert(Premises.count() == 20, "expected twenty premises, got " .. Premises.count())

-- The case reference must not give the premise away. The links between
-- documents already carry the connection and the notebook sorts on them, so a
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

for _, id in ipairs(Premises.list()) do
    assert((seen[id] or 0) > 0, "premise " .. id .. " is unreachable from any of 600 seeds")
    -- Both readings must occur. This is the whole design rule: the mod lays
    -- out paperwork that may or may not disagree, and never decides for you.
    assert(outlines[id]["corroboration"], "premise " .. id .. " never corroborates")
    assert(outlines[id]["conflicting-account"], "premise " .. id .. " never conflicts")
end

-- The three anchor carriers must all stay reachable: premises choose their own
-- kinds, and a set that happened to pick only one would quietly narrow the mod.
for _, kind in ipairs({ "dispatch", "letter", "receipt", "notepad" }) do
    assert((kinds[kind] or 0) > 0, "anchor carrier " .. kind .. " became unreachable")
end

-- A lead is never proof. These are the phrasings that would break that, and
-- the ones a writer reaches for without noticing.
local FORBIDDEN = {
    "this proves", "proves that", "clearly shows", "there is no doubt",
    "beyond doubt", "obviously", "must have been", "we know that",
    "confirms that the", "the truth is",
}
local checked = 0
for seed = 1, 600 do
    local case = G.generate(catalog, seed, opts)
    if case then
        for _, doc in ipairs(case.documents) do
            local body = string.lower(doc.body)
            for _, phrase in ipairs(FORBIDDEN) do
                assert(not string.find(body, phrase, 1, true),
                    case.premiseId .. " asserts a conclusion (" .. phrase .. ") in " .. doc.title)
            end
            checked = checked + 1
        end
    end
end

-- The same seed must tell the same story twice running, or a reload changes
-- what the player already read.
for _, seed in ipairs({ 3, 91, 5000, 123456 }) do
    local first = G.generate(catalog, seed, opts)
    local again = G.generate(catalog, seed, opts)
    assert(first.premiseId == again.premiseId, "seed " .. seed .. " chose two different premises")
    assert(first.documents[1].body == again.documents[1].body, "seed " .. seed .. " wrote two different documents")
end

print(string.format("PASS premises: %d premises, all reachable and readable both ways across %d cases; "
    .. "%d documents carry no asserted conclusion", Premises.count(), cases, checked))
