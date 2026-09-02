-- Disposable Project Zomboid Build 42 inspection probe. Not production mod code.
-- The Python runner generates CFInspectionProfile.lua in the temporary mod copy.

local Profile = require "CFInspectionProfile"
ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.LiveInspection = ConspiracyFiles.LiveInspection or {}

local PREFIX = "[CF-INSPECT]"
local active, completed, initialized = false, false, false
local tick, exitTicks, siteIndex = 0, 0, 0
local current, scan, failures = nil, nil, 0
local autoContinue, menuTicks = false, 0
local eventSequence = 0

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", "\\r"):gsub("\n", "\\n")
end

local function event(kind, fields)
    eventSequence = eventSequence + 1
    local emittedAtMs = getTimestampMs and getTimestampMs() or 0
    local parts = {
        PREFIX,
        "EVENT",
        "kind=" .. safe(kind),
        "run=" .. safe(Profile.runId),
        "observer=" .. safe(Profile.observerId),
        "session=" .. safe(Profile.sessionId),
        "sequence=" .. eventSequence,
        "emittedAtMs=" .. safe(emittedAtMs),
    }
    if fields then for i = 1, #fields do parts[#parts + 1] = fields[i] end end
    print(table.concat(parts, "|"))
end

local function fail(code, detail)
    failures = failures + 1
    event("ASSERT_FAIL", { "code=" .. safe(code), "detail=" .. safe(detail) })
end

local function saveName()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(currentSave):match("([^\\/]+)$") or ""
end

local function onlyExpectedModsActive()
    local ok, mods = pcall(getActivatedMods)
    if not ok or not mods then return false, -1 end
    local countOk, count = pcall(function() return mods:size() end)
    if not countOk or count ~= #Profile.activeModIds then return false, countOk and count or -1 end
    for i = 1, #Profile.activeModIds do
        local memberOk, member = pcall(function() return mods:contains(Profile.activeModIds[i]) end)
        if not memberOk or member ~= true then return false, count end
    end
    return true, count
end

local function spriteName(object)
    local ok, value = pcall(function() return object:getSpriteName() end)
    if ok and value then return safe(value) end
    ok, value = pcall(function() return object:getSprite() and object:getSprite():getName() end)
    return ok and safe(value) or "<nil>"
end

local function objectName(object)
    local ok, value = pcall(function() return object:getObjectName() end)
    return ok and safe(value) or "<error>"
end

local function roomName(square)
    local room = square and square:getRoom()
    local definition = room and room:getRoomDef()
    return definition and safe(definition:getName()) or "<none>", definition and safe(definition:getID()) or "<none>"
end

local function exteriorAdjacent(square)
    local offsets = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} }
    for i = 1, #offsets do
        local other = getCell():getGridSquare(square:getX() + offsets[i][1], square:getY() + offsets[i][2], square:getZ())
        if other and (other:isOutside() or other:getBuilding() == nil) then return true end
    end
    return false
end

local function isAccessObject(object, sprite)
    local name = objectName(object):lower()
    local signature = tostring(sprite):lower()
    if name:find("door", 1, true) or name:find("window", 1, true) or name:find("stairs", 1, true) or signature:find("stairs", 1, true) then return true end
    local ok, value = pcall(function() return instanceof(object, "IsoDoor") end)
    if ok and value then return true end
    ok, value = pcall(function() return object:isWindow() end)
    return ok and value == true
end

local function teleport(site)
    local player = getPlayer()
    local point = site.entry
    player:teleportTo(point.x, point.y, point.z)
    player:setX(point.x); player:setY(point.y); player:setZ(point.z)
    player:setForceX(point.x); player:setForceY(point.y)
    pcall(function() player:setGodMod(true) end)
    pcall(function() player:setInvisible(true) end)
    pcall(function() player:setGhostMode(true) end)
    event("SITE_START", { "site=" .. site.id, "role=" .. safe(site.role), "entry=" .. point.x .. "," .. point.y .. "," .. point.z })
end

local function findBuilding(site)
    local buildings = getWorld():getMetaGrid():getBuildings()
    for i = 0, buildings:size() - 1 do
        local building = buildings:get(i)
        if building:getX() == site.x and building:getY() == site.y and building:getX2() == site.x2 and building:getY2() == site.y2 then return building end
    end
    return nil
end

local function logSiteDefinition(site)
    local building = findBuilding(site)
    if not building then error("building not found for site " .. site.id) end
    event("BUILDING", { "site=" .. site.id, "buildingId=" .. safe(building:getID()), "bounds=" .. site.x .. "," .. site.y .. "," .. site.x2 .. "," .. site.y2, "minLevel=" .. building:getMinLevel(), "maxLevel=" .. building:getMaxLevel(), "roomCount=" .. building:getRooms():size() })
    local rooms = building:getRooms()
    for i = 0, rooms:size() - 1 do
        local room, rectangles = rooms:get(i), {}
        local rects = rooms:get(i):getRects()
        for rectangleIndex = 0, rects:size() - 1 do
            local rectangle = rects:get(rectangleIndex)
            rectangles[#rectangles + 1] = rectangle:getX() .. "," .. rectangle:getY() .. "," .. rectangle:getW() .. "," .. rectangle:getH()
        end
        event("ROOM", { "site=" .. site.id, "roomId=" .. safe(room:getID()), "name=" .. safe(room:getName()), "z=" .. safe(room:getZ()), "area=" .. safe(room:getArea()), "rects=" .. safe(table.concat(rectangles, ";")) })
    end
end

local function newScan(site)
    return { site = site, x = site.x - 1, y = site.y - 1, levelIndex = 1, loaded = 0, squares = 0, containers = 0, access = 0, rooms = {}, done = false }
end

local function advance(cursor)
    local site = cursor.site
    cursor.y = cursor.y + 1
    if cursor.y > site.y2 + 1 then cursor.y = site.y - 1; cursor.x = cursor.x + 1 end
    if cursor.x > site.x2 + 1 then cursor.x = site.x - 1; cursor.levelIndex = cursor.levelIndex + 1 end
    if cursor.levelIndex > #site.levels then cursor.done = true end
end

local function scanSquare(cursor)
    local site, z = cursor.site, cursor.site.levels[cursor.levelIndex]
    local square = getCell():getGridSquare(cursor.x, cursor.y, z)
    if not square then advance(cursor); return end
    cursor.loaded = cursor.loaded + 1
    local room, roomId = roomName(square)
    if roomId ~= "<none>" then cursor.rooms[roomId] = true end
    local building = square:getBuilding()
    if building and building:getDef() and building:getDef():getX() == site.x and building:getDef():getY() == site.y and building:getDef():getX2() == site.x2 and building:getDef():getY2() == site.y2 then cursor.squares = cursor.squares + 1 end
    local objects = square:getObjects()
    for objectIndex = 0, objects:size() - 1 do
        local object, sprite = objects:get(objectIndex), spriteName(objects:get(objectIndex))
        local ok, count = pcall(function() return object:getContainerCount() end)
        if ok and count then
            for containerIndex = 0, count - 1 do
                local containerOk, container = pcall(function() return object:getContainerByIndex(containerIndex) end)
                if containerOk and container then
                    cursor.containers = cursor.containers + 1
                    local typeOk, containerType = pcall(function() return container:getType() end)
                    local capOk, capacity = pcall(function() return container:getCapacity() end)
                    event("CONTAINER", { "site=" .. site.id, "x=" .. cursor.x, "y=" .. cursor.y, "z=" .. z, "room=" .. room, "roomId=" .. roomId, "objectIndex=" .. objectIndex, "containerIndex=" .. containerIndex, "containerType=" .. (typeOk and safe(containerType) or "<error>"), "capacity=" .. (capOk and safe(capacity) or "<error>"), "objectName=" .. objectName(object), "sprite=" .. sprite })
                end
            end
        end
        if isAccessObject(object, sprite) then
            cursor.access = cursor.access + 1
            event("ACCESS_OBJECT", { "site=" .. site.id, "x=" .. cursor.x, "y=" .. cursor.y, "z=" .. z, "room=" .. room, "objectIndex=" .. objectIndex, "objectName=" .. objectName(object), "sprite=" .. sprite, "exteriorAdjacent=" .. tostring(exteriorAdjacent(square)) })
        end
    end
    advance(cursor)
end

local function runScanBatch()
    local started = getTimestampMs and getTimestampMs() or 0
    local count = 0
    while not scan.done and count < Profile.limits.maxSquaresPerTick do
        scanSquare(scan); count = count + 1
        if getTimestampMs and getTimestampMs() - started >= Profile.limits.maxTickMillis then break end
    end
    if scan.done then
        local roomCount = 0; for _ in pairs(scan.rooms) do roomCount = roomCount + 1 end
        event("SCAN_COMPLETE", { "site=" .. scan.site.id, "loadedSquares=" .. scan.loaded, "buildingSquares=" .. scan.squares, "rooms=" .. roomCount, "containers=" .. scan.containers, "accessObjects=" .. scan.access })
        if scan.squares == 0 then fail("no-building-squares", scan.site.id) end
        if scan.containers == 0 then fail("no-containers", scan.site.id) end
        if scan.access == 0 then fail("no-access-objects", scan.site.id) end
        siteIndex = siteIndex + 1; current = Profile.sites[siteIndex]; scan = nil; tick = 0
        if current then logSiteDefinition(current); teleport(current) else completed = true; event("RUN_COMPLETE", { "status=" .. (failures == 0 and "PASS" or "FAIL"), "failures=" .. failures }) end
    end
end

local function initialize()
    local valid, count = onlyExpectedModsActive()
    if not valid then error("active mods do not exactly match the profile; count=" .. tostring(count)) end
    local gameVersion = getGameVersion and tostring(getGameVersion()) or "<unavailable>"
    if Profile.expectedGameVersion ~= "" and gameVersion ~= Profile.expectedGameVersion then
        error(
            "game version does not match exact supported run contract; expected=" ..
            safe(Profile.expectedGameVersion) .. " actual=" .. safe(gameVersion)
        )
    end
    if Profile.payloadMode == "production" then
        local runtime = ConspiracyFiles and ConspiracyFiles.runtime
        if type(runtime) ~= "table" or runtime.enabled ~= true then error("production runtime is unavailable") end
        local registered = runtime.registeredEvents
        if type(registered) ~= "table" or #registered ~= 6 then error("production runtime did not register all six event boundaries") end
        local phase = runtime.phase and runtime.phase() or "<unavailable>"
        event("PRODUCTION_READY", { "status=PASS", "phase=" .. safe(phase), "registeredEvents=" .. #registered })
    end
    event("PLAYER_READY", {
        "save=" .. saveName(),
        "activeModCount=" .. count,
        "activeMods=" .. safe(table.concat(Profile.activeModIds, ",")),
        "payloadMode=" .. safe(Profile.payloadMode),
        "payloadId=" .. safe(Profile.payloadId),
        "payloadChecksum=" .. safe(Profile.payloadChecksum),
        "gameVersion=" .. safe(gameVersion),
    })
    siteIndex, current, tick = 1, Profile.sites[1], 0
    logSiteDefinition(current); teleport(current); initialized = true
end

local function onGameStart()
    if saveName() ~= Profile.saveName then event("SKIPPED", { "reason=wrong-save", "actual=" .. saveName() }); return end
    active = true
end

local function onTick()
    if active and not initialized then
        local ok, err = pcall(initialize)
        if not ok then fail("initialize", err); completed = true; initialized = true; event("RUN_COMPLETE", { "status=FAIL", "failures=" .. failures }) end
    elseif active and completed then
        exitTicks = exitTicks + 1
        if exitTicks >= Profile.limits.exitDelayTicks then active = false; event("NORMAL_EXIT_REQUESTED", { "status=" .. (failures == 0 and "PASS" or "FAIL") }); getCore():quitToDesktop() end
    elseif active and current and not scan then
        local player = getPlayer()
        local square = player and getCell():getGridSquare(math.floor(player:getX()), math.floor(player:getY()), math.floor(player:getZ()))
        local pauseOk, paused = pcall(function() return getGameTime():getTrueMultiplier() == 0 end)
        if square and not (pauseOk and paused) then tick = tick + 1 else tick = 0 end
        if tick == Profile.limits.streamStableTicks then event("CHUNK_STABLE", { "site=" .. current.id }); event("SCREENSHOT_READY", { "site=" .. current.id }); scan = newScan(current) end
    elseif active and scan then
        local ok, err = pcall(runScanBatch)
        if not ok then fail("scan", err); completed = true; scan = nil; event("RUN_COMPLETE", { "status=FAIL", "failures=" .. failures }) end
    end
end

local function onMainMenuEnter()
    autoContinue, menuTicks = true, 0
    event("MENU_READY", { "status=waiting-to-auto-continue" })
end

local function onRenderTick()
    if autoContinue then
        menuTicks = menuTicks + 1
        if menuTicks >= 30 then
            local latest = getLatestSave and getLatestSave() or nil
            if latest and latest[1] == Profile.saveName and MainScreen and MainScreen.continueLatestSave then
                autoContinue = false; event("WORLD_LOADING", { "save=" .. latest[1] }); MainScreen.continueLatestSave(latest[2], latest[1])
            end
        end
    end
end

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onRenderTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)
event("SCRIPT_LOADED", { "profileSites=" .. #Profile.sites })
