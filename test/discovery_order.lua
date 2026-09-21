-- A case must read correctly whatever order its records are found in.
--
-- The handoff of 2026-09-20 asks for exactly this under "Knowledge and source
-- voice": test different discovery orders, including the destination first,
-- and confirm comparisons appear only once their sources are known. It was
-- listed as unrun. Nothing in the suite covered it: generator_spec projects
-- with everything discovered at once, which is the one order a player never
-- experiences.
--
-- The failure this guards against is a case that only makes sense read
-- front-to-back. A player finds the review copy in a mailbox before they ever
-- see the claim it closes, and the organiser must not show them a comparison
-- that refers to a document they have never read - nor lose that comparison
-- once the second source turns up.
-- PROVEN TO FAIL, 2026-09-21. Against a copy of the tree with the knowledge
-- gate removed from Story.project - every comparison shown regardless of what
-- has been found - this fails with "after finding 2 of 4 records, the organiser
-- showed a comparison with one still undiscovered".
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local G = require("ConspiracyFiles/Generated/Generator")
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local opts = { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }

-- Every ordering of n items, so "destination first" is covered along with the
-- other five-sixths of the orders nobody thinks to try.
local function permutations(n)
    local out = {}
    local function recurse(prefix, rest)
        if #rest == 0 then out[#out + 1] = prefix; return end
        for i = 1, #rest do
            local nextPrefix, nextRest = {}, {}
            for _, v in ipairs(prefix) do nextPrefix[#nextPrefix + 1] = v end
            nextPrefix[#nextPrefix + 1] = rest[i]
            for j, v in ipairs(rest) do if j ~= i then nextRest[#nextRest + 1] = v end end
            recurse(nextPrefix, nextRest)
        end
    end
    local all = {}
    for i = 1, n do all[i] = i end
    recurse({}, all)
    return out
end

local cases, orders, comparisons, checked = 0, 0, 0, 0
local seenKinds = {}
for seed = 1, 120 do
    local case = G.generate(catalog, seed, opts)
    if case and #case.documents >= 3 and #case.documents <= 5 then
        cases = cases + 1
        local ids = {}
        for _, d in ipairs(case.documents) do ids[#ids + 1] = d.id end

        -- 1. Whatever the order, every record that HAS been found is rendered,
        --    and none that has not.
        for _, perm in ipairs(permutations(#ids)) do
            orders = orders + 1
            local order = {}
            for _, index in ipairs(perm) do order[#order + 1] = ids[index] end
            local rows = assert(G.project(case, order), "a valid discovery order must project")
            assert(#rows == #order, "every discovered record must appear exactly once")

            -- A connection may point at any record in the list, including one
            -- displayed further down: the list is everything the player HAS
            -- found, and the order is only the order they found it in.
            local inList = {}
            for _, row in ipairs(rows) do inList[row.id] = true end
            for _, row in ipairs(rows) do
                for _, link in ipairs(row.connections or {}) do
                    assert(link.target, "a connection must name the record it relates to")
                    assert(inList[link.target],
                        "a comparison pointed outside the discovered set (seed " .. seed .. ")")
                end
            end
        end

        -- 2. THE GATING CLAIM the handoff asks for, which needs a PARTIAL
        --    reading to test: project only the first k records of an order and
        --    nothing may refer to the ones still out there in the world.
        --
        --    My first attempt asserted this against a full projection and
        --    failed, which was my mistake rather than the mod's: G.project is
        --    handed everything the player has found, so a comparison on row 1
        --    pointing at row 3 is correct - they are holding row 3 already.
        for _, perm in ipairs(permutations(#ids)) do
            local order = {}
            for _, index in ipairs(perm) do order[#order + 1] = ids[index] end
            for k = 1, #order do
                local prefix = {}
                for i = 1, k do prefix[i] = order[i] end
                local partial = assert(G.project(case, prefix),
                    "a partly-read case must still project")
                local held = {}
                for _, id in ipairs(prefix) do held[id] = true end
                for _, row in ipairs(partial) do
                    for _, link in ipairs(row.connections or {}) do
                        comparisons = comparisons + 1
                        seenKinds[link.kind] = true
                        assert(held[link.target],
                            "after finding " .. k .. " of " .. #order .. " records, the organiser "
                            .. "showed a comparison with one still undiscovered (seed " .. seed .. ")")
                    end
                end
            end
        end

        -- 3. Order changes WHEN a comparison appears, never WHETHER it does.
        --    Read to the end, every order must arrive at the same set.
        local complete
        for _, perm in ipairs(permutations(#ids)) do
            local order = {}
            for _, index in ipairs(perm) do order[#order + 1] = ids[index] end
            local rows = assert(G.project(case, order))
            local found = {}
            for _, row in ipairs(rows) do
                for _, link in ipairs(row.connections or {}) do
                    found[row.id .. "->" .. link.target .. ":" .. link.kind] = true
                end
            end
            if not complete then
                complete = found
            else
                for key in pairs(found) do
                    assert(complete[key],
                        "one discovery order produced a comparison another did not: " .. key)
                end
                for key in pairs(complete) do
                    assert(found[key],
                        "a comparison was lost by reading the records in a different order: " .. key)
                end
            end
            checked = checked + 1
        end

        -- 4. A partial reading is still a valid reading: the first record
        --    alone must render, and must carry no comparison at all, because
        --    a comparison needs two sources by definition.
        local firstOnly = assert(G.project(case, { ids[1] }), "one record alone must still project")
        assert(#firstOnly == 1)
        assert(#(firstOnly[1].connections or {}) == 0,
            "a single record cannot compare itself to anything")
    end
end

assert(cases > 0, "no case was exercised")
assert(comparisons > 0, "no comparison was ever rendered; this test proved nothing")
local kinds = 0
for _ in pairs(seenKinds) do kinds = kinds + 1 end
assert(kinds >= 2, "only " .. kinds .. " relationship kind appeared across every order")

print(string.format("PASS discovery order: %d cases read in %d different orders; %d comparisons, "
    .. "%d kinds, none shown before its sources were known and none lost to the order",
    cases, orders, comparisons, kinds))
