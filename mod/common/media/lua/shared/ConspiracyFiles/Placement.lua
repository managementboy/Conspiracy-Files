local Content = require("ConspiracyFiles/Content")

local Placement = {}

Placement.SCHEMA_VERSION = 1
Placement.DEBUG_SEED = 3700714

local POOLS = {
    [Content.ids.relay] = {
        { candidateId = "relay-shelves-a", x = 10614, y = 9604, z = 0, radius = 2, containerOrdinal = 1, allowedContainerTypes = { "shelves" } },
        { candidateId = "relay-shelves-b", x = 10614, y = 9604, z = 0, radius = 2, containerOrdinal = 2, allowedContainerTypes = { "shelves" } },
        { candidateId = "relay-shelves-c", x = 10614, y = 9604, z = 0, radius = 2, containerOrdinal = 3, allowedContainerTypes = { "shelves" } },
    },
    [Content.ids.police] = {
        { candidateId = "police-property-a", x = 10637, y = 10410, z = 0, radius = 2, containerOrdinal = 1, allowedContainerTypes = { "counter", "desk", "filingcabinet", "locker" } },
        { candidateId = "police-property-b", x = 10637, y = 10410, z = 0, radius = 2, containerOrdinal = 2, allowedContainerTypes = { "counter", "desk", "filingcabinet", "locker" } },
        { candidateId = "police-property-c", x = 10637, y = 10410, z = 0, radius = 2, containerOrdinal = 3, allowedContainerTypes = { "counter", "desk", "filingcabinet", "locker" } },
        { candidateId = "police-property-d", x = 10637, y = 10410, z = 0, radius = 2, containerOrdinal = 4, allowedContainerTypes = { "counter", "desk", "filingcabinet", "locker" } },
    },
    [Content.ids.motel] = {
        { candidateId = "rourke-dresser-a", x = 10648, y = 9826, z = 0, radius = 1, containerOrdinal = 1, allowedContainerTypes = { "dresser", "sidetable" } },
        { candidateId = "rourke-dresser-b", x = 10648, y = 9826, z = 0, radius = 1, containerOrdinal = 2, allowedContainerTypes = { "dresser", "sidetable" } },
    },
}

local ASSETS_BY_LOCATION = {
    [Content.ids.relay] = { Content.ids.d1, Content.ids.d3 },
    [Content.ids.police] = { Content.ids.d2, Content.ids.d5, Content.ids.d6, Content.ids.key },
    [Content.ids.motel] = { Content.ids.d4 },
}

local function copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[key] = copy(child) end
    return result
end

local function normaliseSeed(seed)
    seed = math.floor(tonumber(seed) or 1) % 2147483647
    if seed <= 0 then seed = seed + 2147483646 end
    return seed
end

local function nextRandom(state)
    return (state * 48271) % 2147483647
end

function Placement.seedFromString(value)
    local seed = 5381
    value = tostring(value or "")
    for index = 1, string.len(value) do
        seed = (seed * 33 + string.byte(value, index)) % 2147483647
    end
    return normaliseSeed(seed)
end

local function candidateFor(locationId, candidateId)
    for _, candidate in ipairs(POOLS[locationId] or {}) do
        if candidate.candidateId == candidateId then return candidate end
    end
    return nil
end

function Placement.newPlan(seed)
    local plan = { schemaVersion = Placement.SCHEMA_VERSION, seed = normaliseSeed(seed), assignments = {} }
    local state = plan.seed
    for _, locationId in ipairs({ Content.ids.relay, Content.ids.police, Content.ids.motel }) do
        local pool = POOLS[locationId]
        local assets = ASSETS_BY_LOCATION[locationId]
        state = nextRandom(state)
        local start = (state % #pool) + 1
        for offset, assetId in ipairs(assets) do
            local candidate = pool[((start + offset - 2) % #pool) + 1]
            plan.assignments[assetId] = {
                assetId = assetId,
                locationId = locationId,
                candidateId = candidate.candidateId,
                physicalToken = "cf-dead-air-" .. string.match(assetId, "dead%-air:asset:(.+)$"),
                status = "pending",
            }
        end
    end
    return plan
end

function Placement.validate(plan)
    if type(plan) ~= "table" or plan.schemaVersion ~= Placement.SCHEMA_VERSION then return false, "placement schemaVersion must be 1" end
    if type(plan.seed) ~= "number" or plan.seed < 1 or plan.seed >= 2147483647 or plan.seed ~= math.floor(plan.seed) then
        return false, "placement seed must be a positive Park-Miller seed"
    end
    if type(plan.assignments) ~= "table" then return false, "placement assignments must be a table" end
    local expected = 0
    for locationId, assetIds in pairs(ASSETS_BY_LOCATION) do
        for _, assetId in ipairs(assetIds) do
            expected = expected + 1
            local assignment = plan.assignments[assetId]
            if type(assignment) ~= "table" or assignment.assetId ~= assetId or assignment.locationId ~= locationId then
                return false, "missing or mismatched placement assignment for " .. assetId
            end
            if not candidateFor(locationId, assignment.candidateId) then return false, "unknown candidate for " .. assetId end
            if assignment.physicalToken ~= "cf-dead-air-" .. string.match(assetId, "dead%-air:asset:(.+)$") then
                return false, "invalid physical token for " .. assetId
            end
            if assignment.status ~= "pending" and assignment.status ~= "placed" and assignment.status ~= "conflict" then
                return false, "invalid placement status for " .. assetId
            end
        end
    end
    local actual = 0
    for assetId, _ in pairs(plan.assignments) do
        actual = actual + 1
        if not Content.assets[assetId] then return false, "unknown placement asset " .. tostring(assetId) end
    end
    if actual ~= expected then return false, "placement assignment count mismatch" end
    return true
end

function Placement.resolveCandidate(assignment)
    local candidate = assignment and candidateFor(assignment.locationId, assignment.candidateId)
    return candidate and copy(candidate) or nil
end

function Placement.restore(plan)
    local ok, message = Placement.validate(plan)
    if not ok then return nil, message end
    return copy(plan)
end

function Placement.pools()
    return copy(POOLS)
end

function Placement.assetsAt(locationId)
    return copy(ASSETS_BY_LOCATION[locationId] or {})
end

return Placement
