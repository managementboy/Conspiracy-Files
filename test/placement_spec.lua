local CF = require("ConspiracyFiles")
local Content = CF.Content
local Placement = CF.Placement

local function assignmentSignature(plan)
    local parts = {}
    for _, assetId in ipairs({ Content.ids.d1, Content.ids.d2, Content.ids.d3, Content.ids.d4,
        Content.ids.d5, Content.ids.d6, Content.ids.key }) do
        parts[#parts + 1] = assetId .. "=" .. plan.assignments[assetId].candidateId
    end
    return table.concat(parts, "|")
end

test("placement pools are explicit, bounded and cover every physical asset", function()
    local pools = Placement.pools()
    assertEqual(3, #pools[Content.ids.relay])
    assertEqual(4, #pools[Content.ids.police])
    assertEqual(2, #pools[Content.ids.motel])
    for _, pool in pairs(pools) do
        for _, candidate in ipairs(pool) do
            assertTrue(candidate.radius <= 2)
            assertEqual(0, candidate.z)
            assertTrue(type(candidate.candidateId) == "string")
            assertTrue(#candidate.allowedContainerTypes >= 1)
        end
    end
    local plan = Placement.newPlan(Placement.DEBUG_SEED)
    local count, tokens = 0, {}
    for assetId, assignment in pairs(plan.assignments) do
        count = count + 1
        assertTrue(Content.assets[assetId] ~= nil)
        assertFalse(tokens[assignment.physicalToken])
        tokens[assignment.physicalToken] = true
        assertTrue(Placement.resolveCandidate(assignment) ~= nil)
    end
    assertEqual(7, count)
    assertTrue(Placement.validate(plan))
end)

test("placement selection is deterministic by seed and varies across new-save seeds", function()
    local first = Placement.newPlan(Placement.DEBUG_SEED)
    assertDeepEqual(first, Placement.newPlan(Placement.DEBUG_SEED))
    local firstSignature = assignmentSignature(first)
    local varied = false
    for seed = Placement.DEBUG_SEED + 1, Placement.DEBUG_SEED + 20 do
        if assignmentSignature(Placement.newPlan(seed)) ~= firstSignature then varied = true; break end
    end
    assertTrue(varied, "nearby new-save seeds should produce at least one different placement")
    assertEqual(Placement.seedFromString("save-a"), Placement.seedFromString("save-a"))
    assertTrue(Placement.seedFromString("save-a") ~= Placement.seedFromString("save-b"))
end)

test("persisted placement plans restore without rerolling and without aliasing", function()
    local original = Placement.newPlan(9127)
    original.assignments[Content.ids.d1].status = "placed"
    local restored, message = Placement.restore(original)
    assertTrue(restored ~= nil, message)
    assertDeepEqual(original, restored)
    restored.assignments[Content.ids.d1].candidateId = "tampered"
    assertTrue(original.assignments[Content.ids.d1].candidateId ~= "tampered")
    assertFalse(Placement.validate(restored))
end)

test("physical eligibility is independent of evidence discovery order", function()
    local plan = Placement.newPlan(Placement.DEBUG_SEED)
    local state = assert(CF.ThreadState.new())
    local reverse = { Content.ids.d6, Content.ids.d5, Content.ids.d4, Content.ids.d3, Content.ids.d2, Content.ids.d1 }
    for _, assetId in ipairs(reverse) do
        local assignment = plan.assignments[assetId]
        assertEqual("pending", assignment.status)
        local ok = state.discover(assetId, "reverse-order inspection", Content.assets[assetId].placementLocationId)
        assertTrue(ok)
        assertEqual("pending", assignment.status)
    end
    assertEqual(6, #state.snapshot().evidence)
    assertEqual("pending", plan.assignments[Content.ids.key].status)
end)
