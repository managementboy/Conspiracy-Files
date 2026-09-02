local ItemProjection = require("ConspiracyFiles/ItemProjection")

local PZ = {}

local function report(message) print(message) end

local function runtimeVersion()
    local core = getCore and getCore() or nil
    local raw = core and core.getVersion and tostring(core:getVersion()) or ""
    local major, minor, patch = string.match(raw, "^(%d+)%.(%d+)%.?(%d*)")
    if not major or not minor then error("Build 42 version is unavailable") end
    return { major = tonumber(major), minor = tonumber(minor), patch = patch ~= "" and tonumber(patch) or nil, raw = raw }
end

local function spriteName(object)
    local sprite = object and object:getSprite() or nil
    return sprite and tostring(sprite:getName()) or nil
end

local function roomName(square)
    local room = square and square:getRoom() or nil
    local definition = room and room:getRoomDef() or nil
    return definition and tostring(definition:getName()) or nil
end

local function buildingDefinition(square)
    local building = square and square:getBuilding() or nil
    return building and building:getDef() or nil
end

local function listItems(container)
    local result = {}
    local items = container and container:getItems() or nil
    if items then for index = 0, items:size() - 1 do result[#result + 1] = items:get(index) end end
    return result
end

local function resolvePlacement(binding)
    local cell = getCell()
    local square = cell and cell:getGridSquare(binding.x, binding.y, binding.z) or nil
    if not square then return { status = "unloaded" } end
    if roomName(square) ~= binding.room then return { status = "binding-drift", reason = "room signature changed" } end
    local objects = square:getObjects()
    if not objects or binding.objectIndex < 0 or binding.objectIndex >= objects:size() then
        return { status = "binding-drift", reason = "object index missing" }
    end
    local object = objects:get(binding.objectIndex)
    if spriteName(object) ~= binding.sprite then return { status = "binding-drift", reason = "object sprite changed" } end
    if binding.containerIndex < 0 or binding.containerIndex >= object:getContainerCount() then
        return { status = "binding-drift", reason = "container index missing" }
    end
    local container = object:getContainerByIndex(binding.containerIndex)
    if not container or tostring(container:getType()) ~= binding.containerType then
        return { status = "binding-drift", reason = "container type changed" }
    end
    return {
        status = "available", target = container,
        location = { kind = "placement-container", x = binding.x, y = binding.y, z = binding.z, containerType = binding.containerType }
    }
end

local function addItemObservation(result, collisions, seen, item, assetId, token, location)
    if seen[item] then return end
    local classification, identity, reason = ItemProjection.classifyIdentity(item, assetId, token)
    if classification == "match" then
        seen[item] = true
        result[#result + 1] = { item = item, identity = identity, location = location }
    elseif classification == "collision" then
        seen[item] = true
        collisions[#collisions + 1] = { item = item, identity = identity, reason = reason, location = location }
    end
end

local function addContainerMatches(result, collisions, seen, container, assetId, token, location)
    for _, item in ipairs(listItems(container)) do
        addItemObservation(result, collisions, seen, item, assetId, token, location)
    end
end

local function addVehicleMatches(result, collisions, seen, vehicle, assetId, token)
    if not vehicle then return end
    for index = 0, vehicle:getPartCount() - 1 do
        local part = vehicle:getPartByIndex(index)
        local container = part and part:getItemContainer() or nil
        if container then
            addContainerMatches(result, collisions, seen, container, assetId, token, {
                kind = "vehicle", vehicleId = tostring(vehicle:getId()), vehiclePartId = tostring(part:getId())
            })
        end
    end
end

local function scanPhysical(token, context)
    local assetId = context and context.assetId or nil
    if type(assetId) ~= "string" or assetId == "" then error("physical scan requires an Asset ID") end
    local matches, collisions, seen = {}, {}, {}
    local player = getPlayer and getPlayer() or nil
    if player then addContainerMatches(matches, collisions, seen, player:getInventory(), assetId, token, { kind = "player-inventory" }) end
    if context and context.binding then
        local resolution = resolvePlacement(context.binding)
        if resolution.status == "available" then
            addContainerMatches(matches, collisions, seen, resolution.target, assetId, token, resolution.location)
        end
    end
    local playerSquare = player and player:getSquare() or nil
    if playerSquare then
        local px, py, pz = playerSquare:getX(), playerSquare:getY(), playerSquare:getZ()
        for x = px - 1, px + 1 do
            for y = py - 1, py + 1 do
                local square = getCell():getGridSquare(x, y, pz)
                if square then
                    local objects = square:getObjects()
                    if objects then
                        for index = 0, objects:size() - 1 do
                            local object = objects:get(index)
                            local ok, containerCount = pcall(function() return object:getContainerCount() end)
                            if ok then
                                for containerIndex = 0, containerCount - 1 do
                                    local container = object:getContainerByIndex(containerIndex)
                                    if container then
                                        addContainerMatches(matches, collisions, seen, container, assetId, token, {
                                            kind = "world-container", x = x, y = y, z = pz, containerType = tostring(container:getType())
                                        })
                                    end
                                end
                            end
                        end
                    end
                    local worldObjects = square:getWorldObjects()
                    if worldObjects then
                        for index = 0, worldObjects:size() - 1 do
                            local worldObject = worldObjects:get(index)
                            local ok, item = pcall(function() return worldObject:getItem() end)
                            if ok and item then
                                addItemObservation(matches, collisions, seen, item, assetId, token,
                                    { kind = "floor", x = x, y = y, z = pz })
                            end
                        end
                    end
                    local moving = square:getStaticMovingObjects()
                    if moving then
                        for index = 0, moving:size() - 1 do
                            local object = moving:get(index)
                            local ok, container = pcall(function() return object:getContainer() end)
                            if ok and container then
                                addContainerMatches(matches, collisions, seen, container, assetId, token,
                                    { kind = "corpse", x = x, y = y, z = pz })
                            end
                        end
                    end
                end
            end
        end
        addVehicleMatches(matches, collisions, seen, player:getVehicle(), assetId, token)
        local vehiclesOk, vehicles = pcall(function() return getCell():getVehicles() end)
        if vehiclesOk and vehicles then
            local limit = math.min(vehicles:size(), 16)
            for index = 0, limit - 1 do
                local vehicle = vehicles:get(index)
                local dx, dy = vehicle:getX() - px, vehicle:getY() - py
                if (dx * dx) + (dy * dy) <= 16 then
                    addVehicleMatches(matches, collisions, seen, vehicle, assetId, token)
                end
            end
        end
        local last = context and context.lastKnownPhysicalLocation or nil
        if last and last.kind == "vehicle" and last.vehicleId and type(getVehicleById) == "function" then
            local ok, vehicle = pcall(getVehicleById, tonumber(last.vehicleId))
            if ok then addVehicleMatches(matches, collisions, seen, vehicle, assetId, token) end
        end
    end
    return { matches = matches, collisions = collisions, coverage = "incomplete" }
end

local function buildingMatches(definition, arrival)
    if not definition then return false end
    local bounds = arrival.bounds
    if definition:getX() ~= bounds.minX or definition:getY() ~= bounds.minY
        or definition:getX2() ~= bounds.maxX or definition:getY2() ~= bounds.maxY then return false end
    local rooms = definition:getRooms()
    return rooms and rooms:size() == arrival.expectedRoomCount
end

local function matchesArrival(arrival, square)
    local x, y, z = square:getX(), square:getY(), square:getZ()
    local bounds = arrival.bounds
    if x < bounds.minX or x >= bounds.maxX or y < bounds.minY or y >= bounds.maxY
        or z < bounds.minZ or z > bounds.maxZ then return false end
    local reference = getCell():getGridSquare(arrival.referenceSquare.x, arrival.referenceSquare.y, arrival.referenceSquare.z)
    if not reference then return false, "unloaded" end
    if roomName(reference) ~= arrival.expectedRoom then return false, "binding-drift" end
    if not buildingMatches(buildingDefinition(reference), arrival) then return false, "binding-drift" end
    if not buildingMatches(buildingDefinition(square), arrival) then return false end
    return true
end

function PZ.environment()
    local itemPort = {
        modData = function(item) return item:getModData() end,
        setName = function(item, name) item:setName(name) end,
        setCustomName = function(item, value) item:setCustomName(value) end
    }
    local world = {
        saveIdentity = function()
            if type(getCurrentSaveName) ~= "function" then error("getCurrentSaveName is unavailable") end
            local value = tostring(getCurrentSaveName() or "")
            if value == "" then error("current save identity is unavailable") end
            return value
        end,
        squareCoordinates = function(square) return square:getX(), square:getY(), square:getZ() end,
        resolvePlacement = resolvePlacement,
        items = listItems,
        createItem = function(itemType) return instanceItem(itemType) end,
        addItem = function(container, item)
            local added = container:AddItem(item)
            container:setDrawDirty(true)
            return added
        end,
        scanPhysical = scanPhysical,
        playerSquare = function()
            local player = getPlayer and getPlayer() or nil
            return player and player:getSquare() or nil
        end,
        squareKey = function(square) return tostring(square:getX()) .. ":" .. tostring(square:getY()) .. ":" .. tostring(square:getZ()) end,
        matchesArrival = matchesArrival
    }
    return {
        runtimeVersion = runtimeVersion,
        isMultiplayer = function()
            if type(isMultiplayer) ~= "function" then error("isMultiplayer is unavailable") end
            return isMultiplayer()
        end,
        clock = function()
            if type(getTimeInMillis) ~= "function" then error("getTimeInMillis is unavailable") end
            return getTimeInMillis()
        end,
        storage = {
            get = function(tag) return ModData.get(tag) end,
            replace = function(tag, root) ModData.add(tag, root) end
        },
        addEvent = function(eventName, callback)
            local event = Events[eventName]
            if not event or type(event.Add) ~= "function" then error("PZ event unavailable: " .. eventName) end
            event.Add(callback)
        end,
        itemPort = itemPort,
        world = world,
        report = report
    }
end

return PZ
