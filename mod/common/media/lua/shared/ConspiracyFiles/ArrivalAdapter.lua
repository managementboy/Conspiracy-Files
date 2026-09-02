local Content = require("ConspiracyFiles/Content")
local LocationBindings = require("ConspiracyFiles/LocationBindings")

local ArrivalAdapter = {}

function ArrivalAdapter.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "persistence adapter is required")
    local world = assert(options.world, "world port is required")
    local stableSamples = options.stableSamples or 2
    local candidates = {}
    local api = {}

    local function confirmedSet(snapshot)
        local result = {}
        for _, locationId in ipairs(snapshot.confirmedLocationIds) do result[locationId] = true end
        return result
    end

    function api.poll()
        if not persistence.isLoaded() then return 0 end
        local square = world.playerSquare()
        if square == nil then return 0 end
        local squareKey = world.squareKey(square)
        local leads = persistence.domain().leads()
        local confirmed = confirmedSet(persistence.snapshot())
        local confirmations = 0
        local armed = {}
        for _, lead in ipairs(leads) do armed[lead.locationId] = true end
        for locationId, _ in pairs(candidates) do if not armed[locationId] then candidates[locationId] = nil end end
        for _, locationId in ipairs(Content.thread.locationIds) do
            if armed[locationId] and not confirmed[locationId] then
                local binding = LocationBindings.locations[locationId]
                local matched, reason = world.matchesArrival(binding.arrival, square)
                if reason == "binding-drift" then error("arrival binding drift for " .. locationId) end
                if matched then
                    local candidate = candidates[locationId]
                    if candidate and candidate.squareKey == squareKey then
                        candidate.samples = candidate.samples + 1
                    else
                        candidate = { squareKey = squareKey, samples = 1 }
                        candidates[locationId] = candidate
                    end
                    if candidate.samples >= stableSamples then
                        local ok, result, changed = persistence.transaction(function(state)
                            return state.confirmLocation(locationId)
                        end)
                        if not ok then error(result) end
                        if changed then confirmations = confirmations + 1 end
                        candidates[locationId] = nil
                    end
                else
                    candidates[locationId] = nil
                end
            else
                candidates[locationId] = nil
            end
        end
        return confirmations
    end

    return api
end

return ArrivalAdapter
