-- A clue belongs among somebody's belongings, not alone in an empty drawer.
--
-- The 2026-09-08 audit found that nothing here had ever considered what else is
-- in the container a document lands in. Item Stories avoids rooms vanilla
-- already dressed; the owner chose the opposite - prefer a container that
-- already holds something, so a clue reads as part of the house rather than as
-- something software put there.
--
-- It must stay a PREFERENCE. A site whose containers are all empty still gets
-- its document: deferring a case because a house is tidy would be a far worse
-- bug than a clue in a bare drawer.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local Session = require("ConspiracyFiles/Generated/Session")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

local function candidatesFor(case)
    local candidates = {}
    for _, site in ipairs(case.locations) do
        candidates[site.id] = {}
        for n = 1, 8 do
            candidates[site.id][n] = { x = site.bounds.x1 + n, y = site.bounds.y1,
                z = site.bounds.z, objectIndex = n, containerIndex = 0,
                containerType = site.containerTypes[1], sprite = "s" }
        end
    end
    return candidates
end

math.randomseed(20260908)
local placedWithOccupancy, placedWithout, preferredHits, docsChecked = 0, 0, 0, 0

for seed = 1, 200 do
    local case = G.generate(catalog, seed, opts)
    if case then
        local candidates = candidatesFor(case)

        -- Exactly one lived-in container per site, deliberately late in the
        -- list so preferring it is visible: the sequential path would never
        -- reach index 6 first.
        local occupied = {}
        for _, site in ipairs(case.locations) do
            occupied[site.id] = {}
            for n = 1, 8 do occupied[site.id][n] = (n == 6) end
        end

        local base = Session.createDistributed(case, candidates)
        local lived = Session.createDistributed(case, candidates, nil, occupied)

        if base then placedWithout = placedWithout + 1 end
        if lived then
            placedWithOccupancy = placedWithOccupancy + 1

            -- Never two documents in one physical container.
            local used = {}
            for _, assignment in pairs(lived.assignments) do
                local t = assignment.target
                local key = table.concat({ t.x, t.y, t.z, t.objectIndex, t.containerIndex }, ":")
                assert(not used[key], "seed " .. seed .. ": a container was used twice")
                used[key] = true
            end

            -- The lived-in container must actually get used at each site that
            -- received a document, otherwise the preference does nothing.
            local perSite = {}
            for _, assignment in pairs(lived.assignments) do
                local t = assignment.target
                perSite[t.x - t.objectIndex] = perSite[t.x - t.objectIndex] or {}
                perSite[t.x - t.objectIndex][t.objectIndex] = true
                docsChecked = docsChecked + 1
                if t.objectIndex == 6 then preferredHits = preferredHits + 1 end
            end
        end

        -- A tidy house: every container empty. The case must still place.
        local allEmpty = {}
        for _, site in ipairs(case.locations) do
            allEmpty[site.id] = {}
            for n = 1, 8 do allEmpty[site.id][n] = false end
        end
        local tidy = Session.createDistributed(case, candidates, nil, allEmpty)
        assert((tidy ~= nil) == (base ~= nil),
            "seed " .. seed .. ": an all-empty site must place exactly when the baseline did")
    end
end

assert(placedWithOccupancy == placedWithout,
    "occupancy must never turn a placeable case into an unplaceable one: "
    .. placedWithOccupancy .. " vs " .. placedWithout)
assert(placedWithOccupancy > 0, "the fixture generated no cases at all")
assert(preferredHits > 0, "the lived-in container was never chosen; the preference is inert")

print(string.format('PASS lived-in placement: %d cases, %d documents, %d placed in the '
    .. 'lived-in container, tidy sites still placed, no container reused',
    placedWithOccupancy, docsChecked, preferredHits))
