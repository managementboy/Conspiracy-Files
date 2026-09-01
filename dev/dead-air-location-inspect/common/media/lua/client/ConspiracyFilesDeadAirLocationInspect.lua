-- Conspiracy-Files Dead Air location inspection aid.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.DeadAirLocationInspect = ConspiracyFiles.DeadAirLocationInspect or {}

local Inspect = ConspiracyFiles.DeadAirLocationInspect
local PREFIX = "[CF-DA-LOC]"
local MOD_ID = "ConspiracyFiles_DeadAir_Location_Inspect"
local SAVE_PREFIX = "CF_dead_air_location_live"
local active = false
local scan = nil
local tickCount = 0

local candidates = {
    relay = {
        label = "R2",
        x = 13549, y = 1572, x2 = 13581, y2 = 1604,
        staging = { x = 13546.5, y = 1569.5, z = 0 },
    },
    police = {
        label = "P2",
        x = 13206, y = 3073, x2 = 13238, y2 = 3101,
        staging = { x = 13203.5, y = 3070.5, z = 0 },
    },
}

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", "\\r"):gsub("\n", "\\n")
end

local function bool(value) return value and "true" or "false" end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    if fields then
        for i = 1, #fields do parts[#parts + 1] = safe(fields[i]) end
    end
    print(table.concat(parts, "|"))
end

local function saveFolder()
    local current = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(current):match("([^\\/]+)$") or ""
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains(MOD_ID) end)
    return countOk and count or -1, containsOk and contains == true
end

local function spriteName(object)
    local sprite = object and object:getSprite() or nil
    return sprite and safe(sprite:getName()) or "<nil>"
end

local function rectsString(roomDef)
    if roomDef == nil then return "<nil>" end
    local rects = roomDef:getRects()
    local out = {}
    if rects then
        for i = 0, rects:size() - 1 do
            local rect = rects:get(i)
            out[#out + 1] = table.concat({ rect:getX(), rect:getY(), rect:getW(), rect:getH() }, ",")
        end
    end
    return table.concat(out, ";")
end

local function buildingFacts(buildingDef)
    if buildingDef == nil then return { "building=nil" } end
    return {
        "buildingId=" .. safe(buildingDef:getIDString()),
        "buildingNumericId=" .. safe(buildingDef:getID()),
        "buildingBounds=" .. table.concat({ buildingDef:getX(), buildingDef:getY(), buildingDef:getX2(), buildingDef:getY2() }, ","),
    }
end

local function appendFields(target, fields)
    for i = 1, #fields do target[#target + 1] = fields[i] end
end

local function logSquare(kind)
    local player = getPlayer()
    local square = player and player:getCurrentSquare() or nil
    if square == nil then
        logEvent(kind, { "error=no-current-square" })
        return
    end

    local room = square:getRoom()
    local roomDef = room and room:getRoomDef() or nil
    local building = square:getBuilding()
    local buildingDef = building and building:getDef() or nil
    local zone = square:getZone()
    local fields = {
        "square=" .. table.concat({ square:getX(), square:getY(), square:getZ() }, ","),
        "outside=" .. bool(square:isOutside()),
        "roomId=" .. safe(roomDef and roomDef:getID() or nil),
        "roomName=" .. safe(roomDef and roomDef:getName() or nil),
        "roomZ=" .. safe(roomDef and roomDef:getZ() or nil),
        "roomRects=" .. rectsString(roomDef),
        "zoneName=" .. safe(zone and zone:getName() or nil),
        "zoneType=" .. safe(zone and zone:getType() or nil),
        "zoneBounds=" .. safe(zone and table.concat({ zone:getX(), zone:getY(), zone:getZ(), zone:getWidth(), zone:getHeight() }, ",") or nil),
    }
    appendFields(fields, buildingFacts(buildingDef))
    logEvent(kind, fields)
end

local function logContainersAtSquare(square, source)
    if square == nil then return 0 end
    local objects = square:getObjects()
    local count = 0
    for oi = 0, objects:size() - 1 do
        local object = objects:get(oi)
        for ci = 0, object:getContainerCount() - 1 do
            local container = object:getContainerByIndex(ci)
            if container then
                count = count + 1
                logEvent("CONTAINER", {
                    "source=" .. source,
                    "square=" .. table.concat({ square:getX(), square:getY(), square:getZ() }, ","),
                    "objectIndex=" .. tostring(oi),
                    "sprite=" .. spriteName(object),
                    "containerIndex=" .. tostring(ci),
                    "containerType=" .. safe(container:getType()),
                    "itemCount=" .. safe(container:getItems() and container:getItems():size() or nil),
                })
            end
        end
    end
    return count
end

local function logNearbyContainers()
    logSquare("MANUAL_SNAPSHOT")
    local player = getPlayer()
    local square = player and player:getCurrentSquare() or nil
    if square == nil then return end
    local total = 0
    for x = square:getX() - 6, square:getX() + 6 do
        for y = square:getY() - 6, square:getY() + 6 do
            total = total + logContainersAtSquare(getCell():getGridSquare(x, y, square:getZ()), "nearby")
        end
    end
    logEvent("NEARBY_SCAN_COMPLETE", { "radius=6", "containers=" .. tostring(total) })
    player:Say("Recorded this room and nearby containers")
end

local function findCandidate(candidate)
    local buildings = getWorld():getMetaGrid():getBuildings()
    for i = 0, buildings:size() - 1 do
        local building = buildings:get(i)
        if building:getX() == candidate.x and building:getY() == candidate.y and
           building:getX2() == candidate.x2 and building:getY2() == candidate.y2 then
            return building
        end
    end
    return nil
end

local function logCandidate(candidate)
    local building = findCandidate(candidate)
    if building == nil then
        logEvent("CANDIDATE_MISSING", { "candidate=" .. candidate.label })
        return
    end
    local fields = { "candidate=" .. candidate.label }
    appendFields(fields, buildingFacts(building))
    fields[#fields + 1] = "roomCount=" .. tostring(building:getRooms():size())
    logEvent("CANDIDATE", fields)
    local rooms = building:getRooms()
    for i = 0, rooms:size() - 1 do
        local room = rooms:get(i)
        logEvent("ROOM_DEF", {
            "candidate=" .. candidate.label,
            "roomId=" .. safe(room:getID()),
            "roomName=" .. safe(room:getName()),
            "roomZ=" .. safe(room:getZ()),
            "roomArea=" .. safe(room:getArea()),
            "roomRects=" .. rectsString(room),
        })
    end
end

local function teleportTo(candidate)
    local player = getPlayer()
    if player == nil then return end
    local target = candidate.staging
    logEvent("OWNER_TELEPORT_REQUEST", {
        "candidate=" .. candidate.label,
        "target=" .. table.concat({ target.x, target.y, target.z }, ","),
    })
    player:teleportTo(target.x, target.y, target.z)
    player:Say("Staging near " .. candidate.label .. "; walk in normally")
end

local function enableDisposableSafety(player, quiet)
    player:setGodMod(true)
    player:setInvisible(true)
    player:setZombiesDontAttack(true)
    player:setGhostMode(false)
    player:setHealth(1.0)
    player:getBodyDamage():RestoreToFullHealth()
    if not quiet then
        logEvent("DISPOSABLE_SAFETY", {
            "god=true", "invisible=true", "zombiesDontAttack=true", "ghost=false",
        })
    end
end

local function ensureInspectionTool(player)
    local inventory = player:getInventory()
    local items = inventory:getItems()
    local tool = nil
    for i = 0, items:size() - 1 do
        local item = items:get(i)
        local md = item:getModData()
        if item:getFullType() == "Base.Crowbar" and md and md.cfDeadAirInspectionTool == true then
            tool = item
            break
        end
    end
    if tool == nil then
        tool = inventory:AddItem("Base.Crowbar")
        if tool == nil then error("failed-to-create-disposable-crowbar") end
        tool:getModData().cfDeadAirInspectionTool = true
        logEvent("INSPECTION_TOOL_CREATED", { "type=Base.Crowbar" })
    end
    player:setPrimaryHandItem(tool)
    logEvent("INSPECTION_TOOL_EQUIPPED", { "type=Base.Crowbar" })
end

local function clearNearbyZombies()
    local player = getPlayer()
    local objects = getCell() and getCell():getObjectListForLua() or nil
    if player == nil or objects == nil then return 0 end
    local removed = 0
    for i = objects:size(), 1, -1 do
        local object = objects:get(i - 1)
        if instanceof(object, "IsoZombie") and player:DistTo(object) < 120 then
            object:removeFromWorld()
            object:removeFromSquare()
            removed = removed + 1
        end
    end
    if removed > 0 then logEvent("ZOMBIES_REMOVED", { "count=" .. tostring(removed) }) end
    return removed
end

local function startBuildingScan()
    local player = getPlayer()
    local square = player and player:getCurrentSquare() or nil
    local building = square and square:getBuilding() or nil
    local buildingDef = building and building:getDef() or nil
    if buildingDef == nil then
        logEvent("BUILDING_SCAN_REJECTED", { "reason=player-not-in-building" })
        if player then player:Say("Stand inside the building first") end
        return
    end
    scan = {
        buildingDef = buildingDef,
        x = buildingDef:getX(), y = buildingDef:getY(), z = -1,
        containers = 0, squares = 0,
    }
    logEvent("BUILDING_SCAN_STARTED", buildingFacts(buildingDef))
    player:Say("Recording loaded containers in this building")
end

local function tickBuildingScan()
    if scan == nil then return end
    local started = getTimeInMillis()
    local processed = 0
    while scan and processed < 32 and getTimeInMillis() - started < 1 do
        if scan.z > 7 then
            logEvent("BUILDING_SCAN_COMPLETE", {
                "squares=" .. tostring(scan.squares),
                "containers=" .. tostring(scan.containers),
            })
            local player = getPlayer()
            if player then player:Say("Building container record complete") end
            scan = nil
            return
        end
        local square = getCell():getGridSquare(scan.x, scan.y, scan.z)
        if square then
            local actual = square:getBuilding()
            local actualDef = actual and actual:getDef() or nil
            if actualDef and tostring(actualDef:getID()) == tostring(scan.buildingDef:getID()) then
                scan.squares = scan.squares + 1
                scan.containers = scan.containers + logContainersAtSquare(square, "building")
            end
        end
        processed = processed + 1
        scan.x = scan.x + 1
        if scan.x >= scan.buildingDef:getX2() then
            scan.x = scan.buildingDef:getX()
            scan.y = scan.y + 1
            if scan.y >= scan.buildingDef:getY2() then
                scan.y = scan.buildingDef:getY()
                scan.z = scan.z + 1
            end
        end
    end
end

local function guardedAction(name, action)
    local ok, err = pcall(action)
    if not ok then logEvent("BOUNDARY_ERROR", { "where=" .. name, "error=" .. safe(err) }) end
end

local function onFillInventoryContextMenu(playerNum, context, items)
    if not active or context == nil then return end
    context:addOption("Dead Air: Go to R2", nil, function()
        guardedAction("GoToR2", function() teleportTo(candidates.relay) end)
    end)
    context:addOption("Dead Air: Go to P2", nil, function()
        guardedAction("GoToP2", function() teleportTo(candidates.police) end)
    end)
    context:addOption("Dead Air: Record Room", nil, function()
        guardedAction("RecordRoom", logNearbyContainers)
    end)
    context:addOption("Dead Air: Scan Building", nil, function()
        guardedAction("ScanBuilding", startBuildingScan)
    end)
end

local function onGameStart()
    local count, contains = activeModStatus()
    local save = saveFolder()
    active = contains and count == 1 and save:match("^" .. SAVE_PREFIX) ~= nil
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. safe(getGameVersion()),
        "save=" .. safe(save),
        "activeModCount=" .. tostring(count),
        "active=" .. bool(active),
    })
    if not active then return end
    local ok, err = pcall(function()
        logCandidate(candidates.relay)
        logCandidate(candidates.police)
        logEvent("READY_FOR_OWNER", {
            "controls=inventory-context-menu",
        })
        local player = getPlayer()
        if player then
            enableDisposableSafety(player, false)
            ensureInspectionTool(player)
            clearNearbyZombies()
            player:Say("Dead Air inspection ready")
        end
    end)
    if not ok then logEvent("BOUNDARY_ERROR", { "where=OnGameStart", "error=" .. safe(err) }) end
end

local function onTick()
    if not active then return end
    tickCount = tickCount + 1
    local ok, err = pcall(function()
        if tickCount % 15 == 0 then
            local player = getPlayer()
            if player then enableDisposableSafety(player, true) end
            clearNearbyZombies()
        end
        if scan ~= nil then tickBuildingScan() end
    end)
    if not ok then
        scan = nil
        logEvent("BOUNDARY_ERROR", { "where=OnTick", "error=" .. safe(err) })
    end
end

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onTick)
if Inspect.inventoryHandler then Events.OnFillInventoryObjectContextMenu.Remove(Inspect.inventoryHandler) end
Inspect.inventoryHandler = onFillInventoryContextMenu
Events.OnFillInventoryObjectContextMenu.Add(Inspect.inventoryHandler)

Inspect.logNearbyContainers = logNearbyContainers
Inspect.startBuildingScan = startBuildingScan
