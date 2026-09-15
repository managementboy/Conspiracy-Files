-- Phase 3: roles are the variety multiplier, and some of them must disagree.
--
-- Before this, every optional document connected to the route lead with
-- "recontextualises" - it added context and nothing more. Only the mandatory
-- receiving copy could ever contradict anything, so a case's optional half was
-- incapable of disagreement however many documents it drew.
--
-- The design doc's argument (USING_GAME_ASSETS.md): adding carriers does not
-- create mysteries, adding roles does. Roles are also free in save terms -
-- MAX_EVIDENCE caps a case at seven documents whatever the pool size - so a
-- wider pool changes what a case can be about at no cost.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Roles = require("ConspiracyFiles/Generated/EvidenceRoles")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

-- The new roles exist and each declares carriers that can hold their text.
for _, id in ipairs({ 'paymentRecord', 'timingDispute', 'presenceNote' }) do
    local kind = Roles.choose(function(n) return 1 end, id)
    assert(kind, id .. ' must resolve to a carrier')
end

local kinds, carriers, sizes = {}, {}, {}
for seed = 1, 400 do
    local case = G.generate(catalog, seed, opts)
    if case then
        sizes[#case.documents] = (sizes[#case.documents] or 0) + 1
        for _, doc in ipairs(case.documents) do
            carriers[doc.kind] = (carriers[doc.kind] or 0) + 1
            for _, link in ipairs(doc.links or {}) do
                kinds[link.kind] = (kinds[link.kind] or 0) + 1
            end
        end
    end
end

-- All three kinds of relationship must actually occur. Disagreement being
-- reachable is the point of the whole change.
for _, kind in ipairs({ 'recontextualises', 'corroborates', 'disputes-delivery' }) do
    assert((kinds[kind] or 0) > 0, 'no case ever produced a ' .. kind .. ' connection')
end

-- The mandatory receiving copy has always been able to dispute, so counting
-- disputes proves nothing on its own. What is new is that MORE THAN ONE
-- document in a case can disagree. Find a case where two do.
local multiDispute = 0
for seed = 1, 400 do
    local case = G.generate(catalog, seed, opts)
    if case then
        local disputing = 0
        for _, doc in ipairs(case.documents) do
            for _, link in ipairs(doc.links or {}) do
                if link.kind == 'disputes-delivery' then disputing = disputing + 1; break end
            end
        end
        if disputing >= 2 then multiDispute = multiDispute + 1 end
    end
end
assert(multiDispute > 0,
    'no case had two documents disagreeing; before Phase 3 only the receiving '
    .. 'copy could dispute, and that is exactly what this must prove has changed')

-- Every carrier stays reachable: a wider role pool must not starve the old ones.
for _, kind in ipairs({ 'dispatch', 'receipt', 'notepad', 'letter', 'diary', 'notebook',
                        'clipping', 'key', 'idcard', 'creditcard', 'businesscard', 'ticket' }) do
    assert((carriers[kind] or 0) > 0, kind .. ' became unreachable')
end

-- And the save budget is untouched: more roles, same cap.
for size in pairs(sizes) do
    assert(size <= G.MAX_EVIDENCE,
        'a case exceeded MAX_EVIDENCE (' .. size .. '); roles must be free in save terms')
end

print(string.format('PASS phase 3 roles: %d disputes, %d corroborations, %d recontextualisations '
    .. 'across 400 cases; all 12 carriers reachable; no case over MAX_EVIDENCE',
    kinds['disputes-delivery'], kinds['corroborates'], kinds['recontextualises']))
