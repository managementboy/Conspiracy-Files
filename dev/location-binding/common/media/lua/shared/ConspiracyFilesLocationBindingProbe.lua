-- Conspiracy-Files Dead Air exact-location binding probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.LocationBindingProbe = ConspiracyFiles.LocationBindingProbe or {}

local Probe = ConspiracyFiles.LocationBindingProbe
local PREFIX = "[CF-LOC]"
local MOD_ID = "ConspiracyFiles_LocationBinding_Probe"
local SAVE_NAME = "CF_location_binding"

local active = false
local initialized = false
local completed = false
local tick = 0
local quitTicks = 0
local siteIndex = 0
local siteTick = 0
local currentSite = nil
local autoContinuePending = false
local autoContinueTicks = 0
local failures = 0

local siteSpecs = {
    {
        id = "P2",
        role = "police-property",
        x = 13206, y = 3073, x2 = 13238, y2 = 3101,
        preferredRooms = { "policeoffice", "policegunstorage", "policelocker" },
    },
    {
        id = "R2",
        role = "relay-office",
        x = 13549, y = 1572, x2 = 13581, y2 = 1604,
        preferredRooms = { "communications", "newsroom", "office", "garage" },
    },
}

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", "\\r"):gsub("\n", "\\n")
end

local function bool(value)
    return value and "true" or "false"
end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    if fields then
        for i = 1, #fields do parts[#parts + 1] = fields[i] end
    end
    print(table.concat(parts, "|"))
end

local function fail(code, fields)
    failures = failures + 1
    local values = { "code=" .. safe(code) }
    if fields then
        for i = 1, #fields do values[#values + 1] = fields[i] end
    end
    logEvent("ASSERT_FAIL", values)
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

local function gameVersion()
    local ok, value = pcall(getGameVersion)
    return ok and safe(value) or "unavailable"
end

local function findBuilding(spec)
    local buildings = getWorld():getMetaGrid():getBuildings()
    for i = 0, buildings:size() - 1 do
        local building = buildings:get(i)
        if building:getX() == spec.x and building:getY() == spec.y and
           building:getX2() == spec.x2 and building:getY2() == spec.y2 then
            return building
        end
    end
    return nil
end

local function rectText(room)
    local values = {}
    local rects = room:getRects()
    for i = 0, rects:size() - 1 do
        local rect = rects:get(i)
        values[#values + 1] = tostring(rect:getX()) .. "," .. tostring(rect:getY()) .. "," ..
            tostring(rect:getW()) .. "," .. tostring(rect:getH())
    end
    return table.concat(values, ";")
end

local function roomPoint(room)
    local rects = room:getRects()
    if rects == nil or rects:size() == 0 then return nil end
    local rect = rects:get(0)
    return {
        x = rect:getX() + math.floor(rect:getW() / 2),
        y = rect:getY() + math.floor(rect:getH() / 2),
        z = room:getZ(),
        roomId = tostring(room:getID()),
        roomName = safe(room:getName()),
    }
end

local function selectRepresentativeRoom(spec, building)
    local rooms = building:getRooms()
    for p = 1, #spec.preferredRooms do
        for i = 0, rooms:size() - 1 do
            local room = rooms:get(i)
            if room:getName() == spec.preferredRooms[p] and room:getZ() == 0 then
                local point = roomPoint(room)
                if point then return room, point end
            end
        end
    end
    for i = 0, rooms:size() - 1 do
        local room = rooms:get(i)
        if room:getZ() == 0 then
            local point = roomPoint(room)
            if point then return room, point end
        end
    end
    return nil, nil
end

local function applyControlledTeleport(point)
    local player = getPlayer()
    local px, py = point.x + 0.5, point.y + 0.5
    if math.abs(player:getX() - px) <= 1.5 and math.abs(player:getY() - py) <= 1.5 and
       math.floor(player:getZ()) == point.z then
        return false
    end
    player:teleportTo(px, py, point.z)
    player:setX(px)
    player:setY(py)
    player:setZ(point.z)
    player:setForceX(px)
    player:setForceY(py)
    local square = getCell():getGridSquare(point.x, point.y, point.z)
    if square then player:setCurrent(square) end
    pcall(function() player:setGodMod(true) end)
    pcall(function() player:setInvisible(true) end)
    pcall(function() player:setGhostMode(true) end)
    return true
end

local function spriteName(object)
    local okDirect, direct = pcall(function() return object:getSpriteName() end)
    if okDirect and direct then return safe(direct) end
    local ok, sprite = pcall(function() return object:getSprite() end)
    if ok and sprite then
        local nameOk, name = pcall(function() return sprite:getName() end)
        if nameOk then return safe(name) end
    end
    return "<nil>"
end

local function objectName(object)
    local ok, value = pcall(function() return object:getObjectName() end)
    return ok and safe(value) or "<error>"
end

local function roomFields(square)
    local room = square and square:getRoom() or nil
    local roomDef = room and room:getRoomDef() or nil
    return roomDef and safe(roomDef:getName()) or "<none>", roomDef and safe(roomDef:getID()) or "<none>"
end

local function exteriorAdjacent(square)
    local x, y, z = square:getX(), square:getY(), square:getZ()
    local offsets = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} }
    for i = 1, #offsets do
        local other = getCell():getGridSquare(x + offsets[i][1], y + offsets[i][2], z)
        if other and (other:isOutside() or other:getBuilding() == nil) then return true end
    end
    return false
end

local function isAccessObject(object, sprite)
    local name = objectName(object):lower()
    local lowerSprite = tostring(sprite):lower()
    if name:find("door", 1, true) or name:find("window", 1, true) or
       name:find("stairs", 1, true) or lowerSprite:find("stairs", 1, true) then
        return true
    end
    local okDoor, door = pcall(function() return instanceof(object, "IsoDoor") end)
    if okDoor and door then return true end
    local okWindow, window = pcall(function() return object:isWindow() end)
    return okWindow and window == true
end

local function logRooms(spec, building)
    local rooms = building:getRooms()
    for i = 0, rooms:size() - 1 do
        local room = rooms:get(i)
        logEvent("ROOM", {
            "site=" .. spec.id,
            "roomId=" .. safe(room:getID()),
            "name=" .. safe(room:getName()),
            "z=" .. tostring(room:getZ()),
            "area=" .. tostring(room:getArea()),
            "rects=" .. safe(rectText(room)),
        })
    end
end

local function scanSite(site)
    local spec, building = site.spec, site.building
    local loadedSquares, definedRoomSquares = 0, 0
    local buildingSquares, containers, accessObjects = 0, 0, 0
    local roomsSeen = {}
    for z = building:getMinLevel(), building:getMaxLevel() do
        for x = spec.x - 1, spec.x2 + 1 do
            for y = spec.y - 1, spec.y2 + 1 do
                local square = getCell():getGridSquare(x, y, z)
                if square then
                    loadedSquares = loadedSquares + 1
                    local roomName, roomId = roomFields(square)
                    if roomId ~= "<none>" then
                        definedRoomSquares = definedRoomSquares + 1
                        roomsSeen[roomId] = true
                    end
                    local squareBuilding = square:getBuilding()
                    local squareBuildingDef = squareBuilding and squareBuilding:getDef() or nil
                    if squareBuildingDef and tostring(squareBuildingDef:getID()) == tostring(building:getID()) then
                        buildingSquares = buildingSquares + 1
                    end
                    local objects = square:getObjects()
                    for objectIndex = 0, objects:size() - 1 do
                        local object = objects:get(objectIndex)
                        local sprite = spriteName(object)
                        local countOk, containerCount = pcall(function() return object:getContainerCount() end)
                        if countOk and containerCount and containerCount > 0 then
                            for containerIndex = 0, containerCount - 1 do
                                local containerOk, container = pcall(function() return object:getContainerByIndex(containerIndex) end)
                                if containerOk and container then
                                    containers = containers + 1
                                    local typeOk, containerType = pcall(function() return container:getType() end)
                                    local capOk, capacity = pcall(function() return container:getCapacity() end)
                                    local itemOk, items = pcall(function() return container:getItems() end)
                                    logEvent("CONTAINER", {
                                        "site=" .. spec.id,
                                        "x=" .. tostring(x), "y=" .. tostring(y), "z=" .. tostring(z),
                                        "room=" .. roomName, "roomId=" .. roomId,
                                        "objectIndex=" .. tostring(objectIndex),
                                        "containerIndex=" .. tostring(containerIndex),
                                        "containerType=" .. (typeOk and safe(containerType) or "<error>"),
                                        "capacity=" .. (capOk and tostring(capacity) or "<error>"),
                                        "itemCount=" .. (itemOk and tostring(items:size()) or "<error>"),
                                        "objectName=" .. objectName(object),
                                        "sprite=" .. sprite,
                                    })
                                end
                            end
                        end
                        if isAccessObject(object, sprite) then
                            accessObjects = accessObjects + 1
                            logEvent("ACCESS_OBJECT", {
                                "site=" .. spec.id,
                                "x=" .. tostring(x), "y=" .. tostring(y), "z=" .. tostring(z),
                                "room=" .. roomName, "roomId=" .. roomId,
                                "objectIndex=" .. tostring(objectIndex),
                                "objectName=" .. objectName(object),
                                "sprite=" .. sprite,
                                "exteriorAdjacent=" .. bool(exteriorAdjacent(square)),
                            })
                        end
                    end
                end
            end
        end
    end
    local distinctRooms = 0
    for _ in pairs(roomsSeen) do distinctRooms = distinctRooms + 1 end
    logEvent("SITE_SCAN_RESULT", {
        "site=" .. spec.id,
        "buildingId=" .. safe(building:getID()),
        "bounds=" .. spec.x .. "," .. spec.y .. "," .. spec.x2 .. "," .. spec.y2,
        "levels=" .. tostring(building:getMinLevel()) .. "," .. tostring(building:getMaxLevel()),
        "loadedSquares=" .. tostring(loadedSquares),
        "definedRoomSquares=" .. tostring(definedRoomSquares),
        "buildingSquares=" .. tostring(buildingSquares),
        "distinctRoomsSeen=" .. tostring(distinctRooms),
        "expectedRooms=" .. tostring(building:getRooms():size()),
        "containers=" .. tostring(containers),
        "accessObjects=" .. tostring(accessObjects),
    })
    if distinctRooms < building:getRooms():size() then
        fail("incomplete-room-coverage", {
            "site=" .. spec.id,
            "seen=" .. tostring(distinctRooms),
            "expected=" .. tostring(building:getRooms():size()),
        })
    end
    if containers == 0 then fail("no-containers", { "site=" .. spec.id }) end
    if accessObjects == 0 then fail("no-access-objects", { "site=" .. spec.id }) end
end

local function prepareSites()
    local modCount, probeActive = activeModStatus()
    if modCount ~= 1 or not probeActive then
        error("probe-must-be-only-active-mod count=" .. tostring(modCount))
    end
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. gameVersion(),
        "save=" .. saveFolder(),
        "activeModCount=" .. tostring(modCount),
    })
    local resolvedSites = {}
    for i = 1, #siteSpecs do
        local spec = siteSpecs[i]
        local building = findBuilding(spec)
        if not building then error("building-not-found site=" .. spec.id) end
        local room, point = selectRepresentativeRoom(spec, building)
        if not room or not point then error("representative-room-not-found site=" .. spec.id) end
        spec.buildingId = tostring(building:getID())
        spec.point = point
        resolvedSites[i] = { spec = spec, building = building, point = point }
        logEvent("SITE_FIXTURE", {
            "site=" .. spec.id,
            "role=" .. spec.role,
            "buildingId=" .. spec.buildingId,
            "bounds=" .. spec.x .. "," .. spec.y .. "," .. spec.x2 .. "," .. spec.y2,
            "levels=" .. tostring(building:getMinLevel()) .. "," .. tostring(building:getMaxLevel()),
            "rooms=" .. tostring(building:getRooms():size()),
            "representativeRoom=" .. point.roomName .. ":" .. point.roomId,
            "representativePoint=" .. point.x .. "," .. point.y .. "," .. point.z,
        })
        logRooms(spec, building)
    end
    local p2, r2 = resolvedSites[1].point, resolvedSites[2].point
    local dx, dy = r2.x - p2.x, r2.y - p2.y
    logEvent("DISTANCE", {
        "from=P2", "to=R2",
        "dx=" .. tostring(dx), "dy=" .. tostring(dy),
        "straightTiles=" .. string.format("%.3f", math.sqrt(dx * dx + dy * dy)),
    })
    local player = getPlayer()
    local p2Distance = math.abs(player:getX() - (p2.x + 0.5)) + math.abs(player:getY() - (p2.y + 0.5))
    local r2Distance = math.abs(player:getX() - (r2.x + 0.5)) + math.abs(player:getY() - (r2.y + 0.5))
    local selected = p2Distance <= r2Distance and resolvedSites[1] or resolvedSites[2]
    siteSpecs = { selected }
    logEvent("RUN_SCOPE", {
        "site=" .. selected.spec.id,
        "player=" .. string.format("%.1f,%.1f,%.1f", player:getX(), player:getY(), player:getZ()),
        "selection=nearest-prepositioned-site",
    })
    initialized = true
end

local function startNextSite()
    siteIndex = siteIndex + 1
    currentSite = siteSpecs[siteIndex]
    siteTick = 0
    if not currentSite then
        logEvent("MATRIX_RESULT", {
            "failures=" .. tostring(failures),
            "status=" .. (failures == 0 and "PASS" or "FAIL"),
        })
        completed = true
        return
    end
    local player = getPlayer()
    local expectedX, expectedY = currentSite.point.x + 0.5, currentSite.point.y + 0.5
    if math.abs(player:getX() - expectedX) > 1.5 or math.abs(player:getY() - expectedY) > 1.5 or
       math.floor(player:getZ()) ~= currentSite.point.z then
        fail("site-not-prepositioned", {
            "site=" .. currentSite.spec.id,
            "actual=" .. string.format("%.1f,%.1f,%.1f", player:getX(), player:getY(), player:getZ()),
            "expected=" .. string.format("%.1f,%.1f,%d", expectedX, expectedY, currentSite.point.z),
        })
        logEvent("MATRIX_RESULT", { "failures=" .. tostring(failures), "status=FAIL" })
        completed = true
        return
    end
    logEvent("SITE_START", {
        "site=" .. currentSite.spec.id,
        "point=" .. currentSite.point.x .. "," .. currentSite.point.y .. "," .. currentSite.point.z,
        "room=" .. currentSite.point.roomName .. ":" .. currentSite.point.roomId,
    })
end

local function onGameStart()
    if saveFolder() ~= SAVE_NAME then
        logEvent("SKIPPED", { "reason=current-save-is-not-location-binding" })
        return
    end
    active = true
    logEvent("ACTIVATED", { "source=OnGameStart" })
end

local function onTick()
    if not active and not completed and getPlayer and getPlayer() and saveFolder() == SAVE_NAME then
        active = true
        logEvent("ACTIVATED", { "source=OnTick-player-ready" })
    end
    if active then
        tick = tick + 1
        if not initialized and tick >= 180 then
            local ok, err = pcall(prepareSites)
            if not ok then
                fail("prepare-sites", { "error=" .. safe(err) })
                logEvent("MATRIX_RESULT", { "failures=" .. tostring(failures), "status=FAIL" })
                completed = true
            else
                startNextSite()
            end
        elseif initialized and not completed and currentSite then
            siteTick = siteTick + 1
            if siteTick <= 240 and siteTick % 60 == 0 then
                logEvent("SITE_STREAM_WAIT", {
                    "site=" .. currentSite.spec.id,
                    "tick=" .. tostring(siteTick),
                })
            end
            if siteTick == 120 then
                logEvent("SCREENSHOT_READY", { "site=" .. currentSite.spec.id })
            elseif siteTick >= 300 then
                local ok, err = pcall(scanSite, currentSite)
                if not ok then fail("scan-site", { "site=" .. currentSite.spec.id, "error=" .. safe(err) }) end
                startNextSite()
            end
        end
        if completed then
            quitTicks = quitTicks + 1
            if quitTicks >= 240 then
                active = false
                logEvent("AUTO_QUIT", { "status=normal-quit-to-desktop-requested" })
                getCore():quitToDesktop()
            end
        end
    end
end

local function onAutoContinueTick()
    if autoContinuePending then
        autoContinueTicks = autoContinueTicks + 1
        if autoContinueTicks >= 30 then
            local latest = getLatestSave and getLatestSave() or nil
            local saveName = latest and latest[1] or nil
            local gameMode = latest and latest[2] or nil
            if saveName ~= SAVE_NAME then
                autoContinuePending = false
                logEvent("AUTO_CONTINUE_SKIPPED", { "reason=latest-save-is-not-location-binding" })
            elseif MainScreen and MainScreen.instance and MainScreen.instance.setDefaultSandboxVars and MainScreen.continueLatestSave then
                autoContinuePending = false
                logEvent("AUTO_CONTINUE", { "save=" .. saveName, "gameMode=" .. safe(gameMode) })
                MainScreen.continueLatestSave(gameMode, saveName)
            end
        end
    end
end

local function onRenderTick()
    if not active and not completed and getPlayer and getPlayer() and saveFolder() == SAVE_NAME then
        active = true
        logEvent("ACTIVATED", { "source=OnRenderTick-player-ready" })
    end
    onAutoContinueTick()
    onTick()
end

local function onMainMenuEnter()
    autoContinuePending = true
    autoContinueTicks = 0
    logEvent("AUTO_MENU_READY", { "status=waiting-for-main-screen-instance" })
end

Probe.findBuilding = findBuilding
Probe.scanSite = scanSite
Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnRenderTick.Add(onRenderTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)
logEvent("SCRIPT_LOADED", { "gameVersion=" .. gameVersion() })
