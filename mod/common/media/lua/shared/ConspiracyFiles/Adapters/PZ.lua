local PZ = {}
local VEHICLE_SCAN_CAP = 16
local VEHICLE_ENUMERATION_CEILING = 64

local function report(message) print(message) end
local reportedDiagnostics = {}

local function diagnostic(diagnostics, message)
    diagnostics[#diagnostics + 1] = message
    if not reportedDiagnostics[message] then
        reportedDiagnostics[message] = true
        report("Conspiracy-Files: " .. message)
    end
end

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

local function addItemObservation(result, collisions, seen, item, assetId, identityGateway, location, authoredTarget)
    if seen[item] then return end
    local verification = identityGateway.verify(item, assetId, { authoredTarget = authoredTarget == true })
    if verification.status == "verified" then
        seen[item] = true
        result[#result + 1] = { item = item, identity = verification.identity, location = location }
    elseif verification.status == "collision" or verification.status == "rejected" then
        seen[item] = true
        collisions[#collisions + 1] = {
            item = item, identity = verification.identity, reason = verification.reason, location = location
        }
    end
end

local function addContainerMatches(result, collisions, seen, container, assetId, identityGateway, location, authoredTarget)
    for _, item in ipairs(listItems(container)) do
        addItemObservation(result, collisions, seen, item, assetId, identityGateway, location, authoredTarget)
    end
end

local function addVehicleMatches(result, collisions, seen, vehicle, assetId, identityGateway, diagnostics)
    if not vehicle then return end
    local countOk, partCount = pcall(function() return vehicle:getPartCount() end)
    if not countOk or type(partCount) ~= "number" or partCount < 0 then
        diagnostic(diagnostics, "physical scan ignored a vehicle with an unreadable part collection")
        return
    end
    for index = 0, partCount - 1 do
        local partOk, part = pcall(function() return vehicle:getPartByIndex(index) end)
        if not partOk then
            diagnostic(diagnostics, "physical scan ignored an unreadable vehicle part")
            part = nil
        end
        local containerOk, container = pcall(function()
            return part and part:getItemContainer() or nil
        end)
        if not containerOk then
            diagnostic(diagnostics, "physical scan ignored a vehicle part with an unreadable item container")
            container = nil
        end
        if container then
            local idOk, vehicleId = pcall(function() return vehicle:getId() end)
            local partIdOk, partId = pcall(function() return part:getId() end)
            if not idOk or not partIdOk then
                diagnostic(diagnostics, "physical scan ignored a vehicle part with unreadable identity")
            else
            addContainerMatches(result, collisions, seen, container, assetId, identityGateway, {
                kind = "vehicle", vehicleId = tostring(vehicleId), vehiclePartId = tostring(partId)
            })
            end
        end
    end
end

local function collectVehicles(collection, diagnostics)
    if not collection then return nil, "vehicle collection is unavailable" end

    -- Build 42.17+ exposes IsoCell.getVehicles() as a Set.  Its iterator is
    -- the stable common capability for both the Set and older list-shaped
    -- collections; indexed get is retained only for older proxies without it.
    local iteratorOk, iterator = pcall(function() return collection:iterator() end)
    if iteratorOk and iterator then
        local result = {}
        while true do
            local hasNextOk, hasNext = pcall(function() return iterator:hasNext() end)
            if not hasNextOk then return nil, "vehicle collection iterator has no usable hasNext method" end
            if not hasNext then return result end
            local nextOk, vehicle = pcall(function() return iterator:next() end)
            if not nextOk then return nil, "vehicle collection iterator has no usable next method" end
            if vehicle == nil then
                diagnostic(diagnostics, "physical scan ignored a nil vehicle entry")
            else
                if #result >= VEHICLE_ENUMERATION_CEILING then
                    return nil, "physical scan vehicle enumeration exceeded its safety ceiling"
                end
                result[#result + 1] = vehicle
            end
        end
    end

    local sizeOk, size = pcall(function() return collection:size() end)
    if not sizeOk or type(size) ~= "number" or size < 0 then
        return nil, "vehicle collection has neither a usable iterator nor size/get methods"
    end
    if size > VEHICLE_ENUMERATION_CEILING then
        return nil, "physical scan vehicle collection exceeds its safety ceiling"
    end
    local result = {}
    for index = 0, size - 1 do
        local vehicleOk, vehicle = pcall(function() return collection:get(index) end)
        if not vehicleOk then return nil, "vehicle collection has no usable indexed get method" end
        if vehicle == nil then
            diagnostic(diagnostics, "physical scan ignored a nil vehicle entry")
        else
            result[#result + 1] = vehicle
        end
    end
    return result
end

local function selectVehicles(vehicles, px, py, diagnostics)
    local candidates = {}
    for _, vehicle in ipairs(vehicles) do
        local positionOk, x, y = pcall(function() return vehicle:getX(), vehicle:getY() end)
        if not positionOk or type(x) ~= "number" or type(y) ~= "number" then
            diagnostic(diagnostics, "physical scan ignored a vehicle with unreadable coordinates")
        else
            local idOk, id = pcall(function() return vehicle:getId() end)
            candidates[#candidates + 1] = {
                vehicle = vehicle, x = x, y = y, distance = ((x - px) * (x - px)) + ((y - py) * (y - py)),
                id = idOk and id ~= nil and tostring(id) or nil
            }
        end
    end
    table.sort(candidates, function(left, right)
        if left.distance ~= right.distance then return left.distance < right.distance end
        if left.x ~= right.x then return left.x < right.x end
        if left.y ~= right.y then return left.y < right.y end
        if left.id == nil or right.id == nil then return false end
        return left.id < right.id
    end)
    if #candidates > VEHICLE_SCAN_CAP then
        local boundary = candidates[VEHICLE_SCAN_CAP]
        local nextCandidate = candidates[VEHICLE_SCAN_CAP + 1]
        if boundary.distance == nextCandidate.distance and boundary.x == nextCandidate.x
            and boundary.y == nextCandidate.y
            and (boundary.id == nil or nextCandidate.id == nil or boundary.id == nextCandidate.id) then
            return nil, "physical scan vehicle cap boundary has no stable identity ordering"
        end
    end
    local selected = {}
    for index = 1, math.min(#candidates, VEHICLE_SCAN_CAP) do
        selected[index] = candidates[index].vehicle
    end
    return selected
end

local function scanPhysical(context)
    local assetId = context and context.assetId or nil
    if type(assetId) ~= "string" or assetId == "" then error("physical scan requires an Asset ID") end
    local identityGateway = context and context.identityGateway or nil
    if not identityGateway or type(identityGateway.verify) ~= "function" then
        error("physical scan requires the canonical identity gateway")
    end
    local matches, collisions, seen, diagnostics = {}, {}, {}, {}
    local player = getPlayer and getPlayer() or nil
    if player then
        addContainerMatches(matches, collisions, seen, player:getInventory(), assetId, identityGateway,
            { kind = "player-inventory" })
    end
    if context and context.binding then
        local resolution = resolvePlacement(context.binding)
        if resolution.status == "available" then
            addContainerMatches(matches, collisions, seen, resolution.target, assetId, identityGateway,
                resolution.location, true)
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
                                        addContainerMatches(matches, collisions, seen, container, assetId, identityGateway, {
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
                                addItemObservation(matches, collisions, seen, item, assetId, identityGateway,
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
                                addContainerMatches(matches, collisions, seen, container, assetId, identityGateway,
                                    { kind = "corpse", x = x, y = y, z = pz })
                            end
                        end
                    end
                end
            end
        end
        addVehicleMatches(matches, collisions, seen, player:getVehicle(), assetId, identityGateway, diagnostics)
        local vehiclesOk, vehicles = pcall(function() return getCell():getVehicles() end)
        if vehiclesOk and vehicles then
            local vehicleList, vehicleError = collectVehicles(vehicles, diagnostics)
            if not vehicleList then
                diagnostic(diagnostics, vehicleError)
            else
                local selectedVehicles, selectionError = selectVehicles(vehicleList, px, py, diagnostics)
                if not selectedVehicles then
                    diagnostic(diagnostics, selectionError)
                else
                    for _, vehicle in ipairs(selectedVehicles) do
                        local dx, dy = vehicle:getX() - px, vehicle:getY() - py
                        if (dx * dx) + (dy * dy) <= 16 then
                            addVehicleMatches(matches, collisions, seen, vehicle, assetId, identityGateway, diagnostics)
                        end
                    end
                end
            end
        elseif not vehiclesOk or vehicles == nil then
            diagnostic(diagnostics, "physical scan could not read the cell vehicle collection")
        end
        local last = context and context.lastKnownPhysicalLocation or nil
        if last and last.kind == "vehicle" and last.vehicleId and type(getVehicleById) == "function" then
            local ok, vehicle = pcall(getVehicleById, tonumber(last.vehicleId))
            if ok then addVehicleMatches(matches, collisions, seen, vehicle, assetId, identityGateway, diagnostics) end
        end
    end
    return { matches = matches, collisions = collisions, coverage = "incomplete", diagnostics = diagnostics }
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
        setCustomName = function(item, value) item:setCustomName(value) end,
        displayName = function(item) return item:getDisplayName() end,
        itemType = function(item) return item:getFullType() end
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
        removeEvent = function(eventName, callback)
            local event = Events[eventName]
            if not event or type(event.Remove) ~= "function" then error("PZ event removal unavailable: " .. eventName) end
            event.Remove(callback)
        end,
        itemPort = itemPort,
        world = world,
        report = report
    }
end

return PZ
