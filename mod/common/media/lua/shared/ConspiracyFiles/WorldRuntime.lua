local ArrivalAdapter = require("ConspiracyFiles/ArrivalAdapter")
local Content = require("ConspiracyFiles/Content")
local PlacementAdapter = require("ConspiracyFiles/PlacementAdapter")

local WorldRuntime = {}

function WorldRuntime.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "persistence adapter is required")
    local scheduler = assert(options.scheduler, "scheduler is required")
    local world = assert(options.world, "world port is required")
    local itemPort = assert(options.itemPort, "item port is required")
    local placement = PlacementAdapter.new({ persistence = persistence, world = world, itemPort = itemPort })
    local arrival = ArrivalAdapter.new({ persistence = persistence, world = world, stableSamples = 2 })
    local tickCount = 0
    local identityIndex = 0
    local api = {}
    local worldAssetIds = {}
    for _, assetId in ipairs(Content.thread.documentAssetIds) do worldAssetIds[#worldAssetIds + 1] = assetId end
    for _, assetId in ipairs(Content.thread.optionalAssetIds) do worldAssetIds[#worldAssetIds + 1] = assetId end

    local function enqueuePlacement(assetId)
        return scheduler.enqueue("placement:" .. assetId, "placement", function()
            placement.reconcile(assetId)
        end)
    end

    function api.start()
        if not persistence.isLoaded() then error("canonical state was not initialized") end
        placement.initialize(world.saveIdentity())
        for _, assetId in ipairs(worldAssetIds) do enqueuePlacement(assetId) end
    end

    function api.onLoadGridSquare(square)
        local x, y, z = world.squareCoordinates(square)
        for _, assetId in ipairs(worldAssetIds) do
            local binding = placement.bindingFor(assetId)
            if binding.x == x and binding.y == y and binding.z == z then enqueuePlacement(assetId) end
        end
    end

    function api.onTick()
        tickCount = tickCount + 1
        if tickCount % 15 ~= 0 then return end
        scheduler.enqueue("arrival:poll", "arrival", function() arrival.poll() end)
        identityIndex = (identityIndex % #worldAssetIds) + 1
        local assetId = worldAssetIds[identityIndex]
        scheduler.enqueue("identity:" .. assetId, "physical-identity", function()
            placement.reconcileIdentity(assetId)
        end)
    end

    function api.placement()
        return placement
    end

    function api.arrival()
        return arrival
    end

    return api
end

return WorldRuntime
