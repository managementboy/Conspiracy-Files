local Content = require("ConspiracyFiles/Content")
local ItemProjection = require("ConspiracyFiles/ItemProjection")
local LocationBindings = require("ConspiracyFiles/LocationBindings")
local PhysicalIdentity = require("ConspiracyFiles/PhysicalIdentity")
local PhysicalToken = require("ConspiracyFiles/PhysicalToken")

local PlacementAdapter = {}

local function transaction(persistence, mutator)
    local ok, result, changed = persistence.transaction(mutator)
    if not ok then error(result) end
    return result, changed
end

local function bindingFor(assetId)
    local asset = Content.assets[assetId]
    local location = asset and LocationBindings.locations[asset.placementLocationId] or nil
    return location and location.placements[assetId] or nil
end

function PlacementAdapter.new(options)
    options = options or {}
    local persistence = assert(options.persistence, "persistence adapter is required")
    local world = assert(options.world, "world port is required")
    local itemPort = assert(options.itemPort, "item port is required")
    local identity = options.identity or PhysicalIdentity.new({ persistence = persistence })
    local scope = nil
    local api = {}

    local function matchingItems(target, assetId, token)
        local matches = {}
        for _, item in ipairs(world.items(target)) do
            local classification, carrier, reason = ItemProjection.classifyIdentity(item, assetId, token, itemPort)
            if classification == "match" then
                matches[#matches + 1] = item
            elseif classification == "collision" and carrier then
                error("item carrier Asset/token mismatch for " .. assetId .. ": carrier Asset "
                    .. tostring(carrier.assetId) .. ", token " .. tostring(carrier.physicalToken))
            elseif classification == "collision" then
                error("item carrier claiming expected token was rejected: " .. tostring(reason))
            end
        end
        return matches
    end

    local function observeIdentity(assetId, observation)
        local ok, result = identity.observe(assetId, observation)
        if not ok then error("physical identity observation rejected for " .. assetId .. ": " .. tostring(result)) end
        return result
    end

    function api.initialize(saveIdentity)
        scope = PhysicalToken.scope(saveIdentity)
        transaction(persistence, function(state)
            local changed = false
            for _, assetId in ipairs(Content.thread.documentAssetIds) do
                local ok, result, didChange = state.ensureMaterialisation(assetId)
                if not ok then return false, result end
                if didChange then changed = true end
            end
            for _, assetId in ipairs(Content.thread.optionalAssetIds) do
                local ok, result, didChange = state.ensureMaterialisation(assetId)
                if not ok then return false, result end
                if didChange then changed = true end
            end
            return changed, scope
        end)
        return scope
    end

    function api.reconcile(assetId)
        local binding = bindingFor(assetId)
        if not binding then error("missing accepted placement binding for " .. tostring(assetId)) end
        local snapshot = persistence.snapshot()
        local placementState = snapshot and snapshot.assetMaterialisation[assetId] or nil
        if not placementState then error("materialisation is not prepared for " .. assetId) end
        if placementState == "unavailable" or placementState == "conflict" then return placementState end
        if not scope then error("placement adapter was not initialized") end
        local token = PhysicalToken.forAsset(scope, assetId)

        local resolution = world.resolvePlacement(binding)
        if type(resolution) ~= "table" or type(resolution.status) ~= "string" then error("placement resolver returned an invalid result") end
        if resolution.status == "unloaded" then return "unloaded" end
        if resolution.status == "binding-drift" then error("binding drift for " .. assetId .. ": " .. tostring(resolution.reason)) end
        if resolution.status == "terminal-unavailable" then
            if placementState == "pending" or placementState == "placing" then
                transaction(persistence, function(state) return state.markPlacementUnavailable(assetId) end)
                return "unavailable"
            end
            return api.reconcileIdentity(assetId, { matches = {}, lossConfirmed = true, coverage = "complete" })
        end
        if resolution.status ~= "available" or resolution.target == nil then error("unknown placement resolution " .. resolution.status) end

        local matches = matchingItems(resolution.target, assetId, token)
        if #matches > 1 then
            observeIdentity(assetId, { matches = { { item = matches[1] }, { item = matches[2] } }, coverage = "incomplete" })
            return "conflict"
        end
        if #matches == 1 then
            local refreshed, refreshMessage = ItemProjection.refresh(matches[1], itemPort)
            if not refreshed then error("existing item presentation rejected for " .. assetId .. ": " .. tostring(refreshMessage)) end
            transaction(persistence, function(state) return state.completePlacement(assetId, resolution.location) end)
            return "placed"
        end
        if placementState == "placed" then
            local observation = world.scanPhysical(token, {
                assetId = assetId, binding = binding
            })
            observeIdentity(assetId, observation)
            return persistence.snapshot().physicalAvailability[assetId]
        end

        transaction(persistence, function(state) return state.beginPlacement(assetId) end)
        local asset = Content.assets[assetId]
        local item = world.createItem(asset.pzItemType)
        if item == nil then error("item creation returned nil for " .. assetId) end
        local stamped, stampMessage = ItemProjection.apply(item, assetId, token, itemPort)
        if not stamped then error(stampMessage) end
        local added = world.addItem(resolution.target, item)
        if added == nil then error("AddItem returned nil for " .. assetId) end
        matches = matchingItems(resolution.target, assetId, token)
        if #matches == 0 then error("stamped item was absent after add for " .. assetId) end
        if #matches > 1 then
            observeIdentity(assetId, { matches = { { item = matches[1] }, { item = matches[2] } }, coverage = "incomplete" })
            return "conflict"
        end
        transaction(persistence, function(state) return state.completePlacement(assetId, resolution.location) end)
        return "placed"
    end

    function api.reconcileIdentity(assetId, suppliedObservation)
        local snapshot = persistence.snapshot()
        local placementState = snapshot and snapshot.assetMaterialisation[assetId] or nil
        if not placementState then return "unprepared" end
        if placementState ~= "placed" and placementState ~= "conflict" then return placementState end
        if not scope then return "unprepared" end
        local observation = suppliedObservation or world.scanPhysical(PhysicalToken.forAsset(scope, assetId), {
            assetId = assetId, binding = bindingFor(assetId)
        })
        observeIdentity(assetId, observation)
        return persistence.snapshot().physicalAvailability[assetId]
    end

    function api.bindingFor(assetId)
        return bindingFor(assetId)
    end

    function api.tokenFor(assetId)
        if not scope then return nil end
        return PhysicalToken.forAsset(scope, assetId)
    end

    return api
end

return PlacementAdapter
