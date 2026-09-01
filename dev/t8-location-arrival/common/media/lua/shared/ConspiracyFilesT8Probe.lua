-- Conspiracy-Files Spike T8: location-arrival event/state probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T8Probe = ConspiracyFiles.T8Probe or {}

local T8 = ConspiracyFiles.T8Probe
local PREFIX = "[CF-T8]"
local MOD_ID = "ConspiracyFiles_T8_Probe"
local CONTROL_TAG = "ConspiracyFiles.T8.Control"

local active = false
local tick = 0
local initialized = false
local locations = {}
local locationById = {}
local waypoints = {}
local waypointIndex = 0
local waypointTick = 0
local currentWaypoint = nil
local shouldQuit = false
local quitTick = 0
local phase = 0
local falseConfirmations = 0
local newConfirmationsAtWaypoint = 0
local runStartMs = 0
local lastMoveMs = nil
local lastMoveSquareKey = nil
local moveCallbacks = 0
local duplicateSquareCallbacks = 0
local squareTransitions = 0
local callbackTotalMs = 0
local callbackPeakMs = 0
local callbackOver2Ms = 0
local callbackIntervals = 0
local callbackIntervalTotalMs = 0
local callbackIntervalMinMs = nil
local callbackIntervalMaxMs = nil
local probeFailures = 0
local pollCallbacks = 0
local firstMoveCallbackLogged = false
local runMode = "main"

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", "\\r"):gsub("\n", "\\n")
end

local function bool(value) return value and "true" or "false" end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    if fields then
        for i = 1, #fields do parts[#parts + 1] = fields[i] end
    end
    print(table.concat(parts, "|"))
end

local function fail(code, fields)
    probeFailures = probeFailures + 1
    local out = { "code=" .. code }
    if fields then for i = 1, #fields do out[#out + 1] = fields[i] end end
    logEvent("ASSERT_FAIL", out)
end

local function saveFolder()
    local current = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(current):match("([^\\/]+)$") or ""
end

local function isProbeSave()
    return saveFolder():match("^T8_location_arrival") ~= nil
end

local function gameVersion()
    local ok, value = pcall(getGameVersion)
    return ok and safe(value) or "unavailable"
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains(MOD_ID) end)
    return countOk and count or -1, containsOk and contains == true
end

local function control()
    local value = ModData.getOrCreate(CONTROL_TAG)
    if value.schemaVersion == nil then
        value.schemaVersion = 1
        value.phase = 0
        value.confirmed = {}
    end
    return value
end

local function findBuilding(x, y, x2, y2)
    local buildings = getWorld():getMetaGrid():getBuildings()
    for i = 0, buildings:size() - 1 do
        local building = buildings:get(i)
        if building:getX() == x and building:getY() == y and
           building:getX2() == x2 and building:getY2() == y2 then
            return building
        end
    end
    return nil
end

local function findRoom(building, name, level, notId)
    local rooms = building:getRooms()
    for i = 0, rooms:size() - 1 do
        local room = rooms:get(i)
        if room:getName() == name and (level == nil or room:getZ() == level) and
           (notId == nil or tostring(room:getID()) ~= tostring(notId)) then
            return room
        end
    end
    return nil
end

local function findAnyRoom(building, level, notId)
    local rooms = building:getRooms()
    for i = 0, rooms:size() - 1 do
        local room = rooms:get(i)
        if room:getZ() == level and (notId == nil or tostring(room:getID()) ~= tostring(notId)) then
            return room
        end
    end
    return nil
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
        roomName = room:getName(),
    }
end

local function snapshot(player)
    local square = player and player:getCurrentSquare() or nil
    if not square then return nil end
    local room = square:getRoom()
    local roomDef = room and room:getRoomDef() or nil
    local building = square:getBuilding()
    local buildingDef = building and building:getDef() or nil
    local zone = square:getZone()
    return {
        x = square:getX(), y = square:getY(), z = square:getZ(),
        px = player:getX(), py = player:getY(), pz = player:getZ(),
        squareKey = tostring(square:getX()) .. "," .. tostring(square:getY()) .. "," .. tostring(square:getZ()),
        buildingId = buildingDef and tostring(buildingDef:getID()) or nil,
        roomId = roomDef and tostring(roomDef:getID()) or nil,
        roomName = roomDef and roomDef:getName() or nil,
        outside = square:isOutside(),
        zoneName = zone and zone:getName() or nil,
        zoneType = zone and zone:getType() or nil,
    }
end

local function addLocation(def)
    def.candidateKey = nil
    def.candidateSamples = 0
    def.confirmed = false
    def.confirmationCount = 0
    def.suppressed = 0
    def.firstMatchMs = nil
    def.confirmMs = nil
    locations[#locations + 1] = def
    locationById[def.id] = def
end

local function matches(location, s)
    if location.kind == "room" then
        return s.buildingId == location.buildingId and s.roomId == location.roomId
    elseif location.kind == "building" then
        return s.buildingId == location.buildingId
    elseif location.kind == "floor" then
        return s.buildingId == location.buildingId and s.z == location.z
    elseif location.kind == "basement" then
        return s.buildingId == location.buildingId and s.roomId == location.roomId and s.z == location.z
    elseif location.kind == "radius" then
        local dx = s.px - location.cx
        local dy = s.py - location.cy
        return s.z == location.z and s.buildingId == nil and s.outside and
               dx * dx + dy * dy <= location.radius * location.radius
    elseif location.kind == "rectangle" then
        return s.z == location.z and s.buildingId == nil and s.outside and
               s.px >= location.x1 and s.px < location.x2 and
               s.py >= location.y1 and s.py < location.y2
    elseif location.kind == "zone" then
        return s.z == location.z and location.zone:contains(s.x, s.y, s.z)
    end
    return false
end

local function evaluate(player, source)
    local s = snapshot(player)
    if not s then return end
    for i = 1, #locations do
        local location = locations[i]
        local hit = location.referenced and matches(location, s)
        if hit then
            if location.candidateKey == s.squareKey then
                location.candidateSamples = location.candidateSamples + 1
            else
                location.candidateKey = s.squareKey
                location.candidateSamples = 1
                location.firstMatchMs = getTimeInMillis()
                logEvent("MATCH_EDGE", {
                    "location=" .. location.id, "kind=" .. location.kind,
                    "source=" .. source, "square=" .. s.squareKey,
                    "room=" .. safe(s.roomName), "outside=" .. bool(s.outside),
                })
            end
            if location.candidateSamples >= 2 then
                if not location.confirmed then
                    location.confirmed = true
                    location.confirmationCount = location.confirmationCount + 1
                    location.confirmMs = getTimeInMillis()
                    newConfirmationsAtWaypoint = newConfirmationsAtWaypoint + 1
                    logEvent("CONFIRM", {
                        "location=" .. location.id, "kind=" .. location.kind,
                        "source=" .. source, "samples=" .. tostring(location.candidateSamples),
                        "square=" .. s.squareKey,
                        "latencyFromFirstMatchMs=" .. tostring(location.confirmMs - location.firstMatchMs),
                        "latencyFromWaypointMs=" .. tostring(currentWaypoint and (location.confirmMs - currentWaypoint.startedMs) or -1),
                    })
                else
                    location.suppressed = location.suppressed + 1
                end
            end
        else
            location.candidateKey = nil
            location.candidateSamples = 0
            location.firstMatchMs = nil
        end
    end
end

local function addWaypoint(id, point, fields)
    local value = {
        id = id, x = point.x + 0.5, y = point.y + 0.5, z = point.z,
        expectNoConfirm = fields and fields.expectNoConfirm or false,
        arm = fields and fields.arm or nil,
        dwell = fields and fields.dwell or 300,
        requireBuildingId = fields and fields.requireBuildingId or nil,
        requireRoomId = fields and fields.requireRoomId or nil,
    }
    waypoints[#waypoints + 1] = value
end

local function choosePoliceZone(meta, point)
    local zones = meta:getZonesAt(point.x, point.y, point.z)
    for i = 0, zones:size() - 1 do
        local zone = zones:get(i)
        if zone:getName() == "Police" and zone:contains(point.x, point.y, point.z) then return zone end
    end
    return nil
end

local function buildMatrix()
    if saveFolder():match("_basement$") then
        runMode = "basement"
    elseif saveFolder():match("_gate$") then
        runMode = "gate"
    else
        runMode = "main"
    end
    local police = findBuilding(7252, 8383, 7267, 8398)
    local coroner = findBuilding(10631, 10395, 10651, 10415)
    if not police then error("fixed police building not found") end
    if not coroner then error("fixed coroner basement not found") end

    local policeOffice0 = findRoom(police, "policeoffice", 0, nil)
    local policeOther0 = findRoom(police, "policegunstorage", 0, nil) or
                         findAnyRoom(police, 0, policeOffice0 and policeOffice0:getID() or nil)
    local policeFloor1 = findAnyRoom(police, 1, nil)
    local morgue = findRoom(coroner, "morgue", -1, nil) or findAnyRoom(coroner, -1, nil)
    if not policeOffice0 or not policeOther0 or not policeFloor1 or not morgue then
        error("fixed room matrix incomplete")
    end

    local officePoint = roomPoint(policeOffice0)
    local otherPoint = roomPoint(policeOther0)
    local floorPoint = roomPoint(policeFloor1)
    local basementPoint = roomPoint(morgue)
    local meta = getWorld():getMetaGrid()
    local policeZone = choosePoliceZone(meta, officePoint)
    if not policeZone then error("fixed Police zone not found at police office") end

    local buildingId = tostring(police:getID())
    local basementBuildingId = tostring(coroner:getID())
    addLocation({ id = "room-specific", kind = "room", referenced = true,
        buildingId = buildingId, roomId = officePoint.roomId })
    addLocation({ id = "whole-building", kind = "building", referenced = true,
        buildingId = buildingId })
    addLocation({ id = "floor-specific", kind = "floor", referenced = true,
        buildingId = buildingId, z = 1 })
    addLocation({ id = "basement-room", kind = "basement", referenced = true,
        buildingId = basementBuildingId, roomId = basementPoint.roomId, z = -1 })
    addLocation({ id = "outdoor-radius", kind = "radius", referenced = false,
        cx = 7248.5, cy = 8390.5, z = 0, radius = 1.25 })
    addLocation({ id = "outdoor-rectangle", kind = "rectangle", referenced = false,
        x1 = 7248.0, y1 = 8384.0, x2 = 7251.0, y2 = 8387.0, z = 0 })
    addLocation({ id = "installed-zone", kind = "zone", referenced = false,
        zone = policeZone, z = policeZone:getZ() })
    addLocation({ id = "delayed-reference", kind = "room", referenced = false,
        buildingId = buildingId, roomId = officePoint.roomId })

    for i = 1, #locations do
        local loc = locations[i]
        loc.required = (runMode == "basement" and loc.id == "basement-room") or
                       (runMode == "gate" and loc.id == "delayed-reference") or
                       (runMode == "main" and loc.id ~= "basement-room")
        if runMode == "basement" or runMode == "gate" then loc.referenced = false end
    end
    if runMode == "basement" then locationById["basement-room"].referenced = true end

    local c = control()
    if phase == 1 then
        for i = 1, #locations do
            local loc = locations[i]
            if c.confirmed and c.confirmed[loc.id] == true then loc.confirmed = true end
        end
    end

    logEvent("FIXTURE", {
        "policeBuildingId=" .. buildingId,
        "policeBounds=7252,8383,7267,8398", "officeRoomId=" .. officePoint.roomId,
        "otherRoom=" .. safe(otherPoint.roomName) .. ":" .. otherPoint.roomId,
        "floorRoom=" .. safe(floorPoint.roomName) .. ":" .. floorPoint.roomId,
        "basementBuildingId=" .. basementBuildingId,
        "basementRoom=" .. safe(basementPoint.roomName) .. ":" .. basementPoint.roomId,
        "zone=" .. safe(policeZone:getName()) .. ":" .. safe(policeZone:getType()),
        "runMode=" .. runMode,
        "zoneBounds=" .. tostring(policeZone:getX()) .. "," .. tostring(policeZone:getY()) .. "," ..
            tostring(policeZone:getWidth()) .. "," .. tostring(policeZone:getHeight()) .. "," .. tostring(policeZone:getZ()),
    })

    if phase == 0 and runMode == "main" then
        addWaypoint("baseline-outside", {x = 7248, y = 8390, z = 0}, {expectNoConfirm = true})
        addWaypoint("building-adjacent-negative", {x = 7251, y = 8390, z = 0}, {expectNoConfirm = true})
        addWaypoint("enter-office", officePoint, {requireBuildingId = buildingId, requireRoomId = officePoint.roomId})
        addWaypoint("room-transition", otherPoint, {requireBuildingId = buildingId, requireRoomId = otherPoint.roomId})
        addWaypoint("floor-change-up", floorPoint, {requireBuildingId = buildingId})
        addWaypoint("floor-change-down", officePoint, {requireBuildingId = buildingId, requireRoomId = officePoint.roomId})
        addWaypoint("leave-building", {x = 7248, y = 8390, z = 0},
            {expectNoConfirm = true, arm = "delayed-reference"})
        addWaypoint("building-reentry", officePoint, {requireBuildingId = buildingId, requireRoomId = officePoint.roomId})
        addWaypoint("radius-adjacent-negative", {x = 7250, y = 8390, z = 0},
            {expectNoConfirm = true, arm = "outdoor-radius"})
        addWaypoint("radius-inside", {x = 7248, y = 8390, z = 0}, nil)
        addWaypoint("radius-boundary-graze", {x = 7250, y = 8391, z = 0}, {expectNoConfirm = true})
        addWaypoint("rectangle-adjacent-negative", {x = 7251, y = 8385, z = 0},
            {expectNoConfirm = true, arm = "outdoor-rectangle"})
        addWaypoint("rectangle-inside", {x = 7249, y = 8385, z = 0}, nil)
        addWaypoint("zone-arm-outside", {x = policeZone:getX() - 2, y = policeZone:getY() - 2, z = policeZone:getZ()},
            {expectNoConfirm = true, arm = "installed-zone"})
        addWaypoint("zone-enter", {x = policeZone:getX(), y = policeZone:getY(), z = policeZone:getZ()}, nil)
        addWaypoint("zone-leave", {x = policeZone:getX() - 2, y = policeZone:getY() - 2, z = policeZone:getZ()}, {expectNoConfirm = true})
        addWaypoint("zone-reentry", {x = policeZone:getX(), y = policeZone:getY(), z = policeZone:getZ()}, nil)
    elseif phase == 0 and runMode == "basement" then
        addWaypoint("basement-wrong-floor", {x = basementPoint.x, y = basementPoint.y, z = 0}, {expectNoConfirm = true})
        addWaypoint("basement-enter", basementPoint,
            {requireBuildingId = basementBuildingId, requireRoomId = basementPoint.roomId, dwell = 900})
    elseif phase == 0 and runMode == "gate" then
        addWaypoint("unreferenced-room-entry", officePoint,
            {expectNoConfirm = true, requireBuildingId = buildingId, requireRoomId = officePoint.roomId})
        addWaypoint("reference-arm-outside", {x = 7248, y = 8390, z = 0},
            {expectNoConfirm = true, arm = "delayed-reference"})
        addWaypoint("referenced-room-entry", officePoint,
            {requireBuildingId = buildingId, requireRoomId = officePoint.roomId, dwell = 600})
    end
end

local function logLocationSummary(stage)
    for i = 1, #locations do
        local loc = locations[i]
        logEvent("LOCATION_RESULT", {
            "stage=" .. stage, "location=" .. loc.id, "kind=" .. loc.kind,
            "confirmed=" .. bool(loc.confirmed), "confirmationCount=" .. tostring(loc.confirmationCount),
            "suppressed=" .. tostring(loc.suppressed),
        })
    end
end

local function persistAndQuit()
    local c = control()
    c.phase = 1
    c.confirmed = c.confirmed or {}
    for i = 1, #locations do c.confirmed[locations[i].id] = locations[i].confirmed == true end
    c.phase0Failures = probeFailures
    c.phase0FalseConfirmations = falseConfirmations
    local saveStart = getTimeInMillis()
    local ok, err = pcall(saveGame)
    logEvent("SAVE", {"ok=" .. bool(ok), "error=" .. safe(err),
        "durationMs=" .. tostring(getTimeInMillis() - saveStart)})
    shouldQuit = true
end

local function finalizePhase0()
    for i = 1, #locations do
        local loc = locations[i]
        if loc.required then
            if not loc.confirmed then fail("location-not-confirmed", {"location=" .. loc.id}) end
            if loc.confirmationCount ~= 1 then fail("confirmation-count", {"location=" .. loc.id, "count=" .. tostring(loc.confirmationCount)}) end
        end
    end
    if falseConfirmations ~= 0 then fail("false-confirmations", {"count=" .. tostring(falseConfirmations)}) end
    logLocationSummary("phase0")
    logEvent("CALLBACK_SUMMARY", {
        "phase=0", "runMode=" .. runMode, "moveCallbacks=" .. tostring(moveCallbacks),
        "pollCallbacks=" .. tostring(pollCallbacks),
        "duplicateSquareCallbacks=" .. tostring(duplicateSquareCallbacks),
        "squareTransitions=" .. tostring(squareTransitions),
        "intervalSamples=" .. tostring(callbackIntervals),
        "intervalMeanMs=" .. tostring(callbackIntervals > 0 and callbackIntervalTotalMs / callbackIntervals or -1),
        "intervalMinMs=" .. tostring(callbackIntervalMinMs or -1),
        "intervalMaxMs=" .. tostring(callbackIntervalMaxMs or -1),
        "callbackTotalMs=" .. tostring(callbackTotalMs), "callbackPeakMs=" .. tostring(callbackPeakMs),
        "callbackOver2Ms=" .. tostring(callbackOver2Ms),
    })
    logEvent("MATRIX_RESULT", {"phase=0", "runMode=" .. runMode, "failures=" .. tostring(probeFailures),
        "falseConfirmations=" .. tostring(falseConfirmations), "status=" .. (probeFailures == 0 and "PASS" or "FAIL")})
    persistAndQuit()
end

local function applyControlledTeleport(waypoint)
    local player = getPlayer()
    player:teleportTo(waypoint.x, waypoint.y, waypoint.z)
    player:setX(waypoint.x)
    player:setY(waypoint.y)
    player:setZ(waypoint.z)
    player:setForceX(waypoint.x)
    player:setForceY(waypoint.y)
    local square = getCell():getGridSquare(math.floor(waypoint.x), math.floor(waypoint.y), waypoint.z)
    if square then player:setCurrent(square) end
end

local function startWaypoint()
    waypointIndex = waypointIndex + 1
    currentWaypoint = waypoints[waypointIndex]
    if not currentWaypoint then finalizePhase0(); return end
    waypointTick = 0
    newConfirmationsAtWaypoint = 0
    if currentWaypoint.arm then
        locationById[currentWaypoint.arm].referenced = true
        logEvent("ARM_LOCATION", {"location=" .. currentWaypoint.arm, "waypoint=" .. currentWaypoint.id})
    end
    currentWaypoint.startedMs = getTimeInMillis()
    currentWaypoint.moveCallbacksAtStart = moveCallbacks
    applyControlledTeleport(currentWaypoint)
    logEvent("WAYPOINT_START", {
        "index=" .. tostring(waypointIndex), "id=" .. currentWaypoint.id,
        "x=" .. tostring(currentWaypoint.x), "y=" .. tostring(currentWaypoint.y), "z=" .. tostring(currentWaypoint.z),
        "expectNoConfirm=" .. bool(currentWaypoint.expectNoConfirm),
    })
end

local function finishWaypoint()
    local s = snapshot(getPlayer())
    if not s then
        fail("waypoint-no-square", {"waypoint=" .. currentWaypoint.id})
    else
        if math.abs(s.px - currentWaypoint.x) > 1.5 or math.abs(s.py - currentWaypoint.y) > 1.5 or
           math.floor(s.pz) ~= currentWaypoint.z then
            fail("waypoint-position", {"waypoint=" .. currentWaypoint.id, "actual=" .. s.squareKey})
        end
        if currentWaypoint.requireBuildingId and s.buildingId ~= currentWaypoint.requireBuildingId then
            fail("waypoint-building", {"waypoint=" .. currentWaypoint.id, "actual=" .. safe(s.buildingId),
                "expected=" .. currentWaypoint.requireBuildingId})
        end
        if currentWaypoint.requireRoomId and s.roomId ~= currentWaypoint.requireRoomId then
            fail("waypoint-room", {"waypoint=" .. currentWaypoint.id, "actual=" .. safe(s.roomId),
                "expected=" .. currentWaypoint.requireRoomId})
        end
        if currentWaypoint.expectNoConfirm and newConfirmationsAtWaypoint > 0 then
            falseConfirmations = falseConfirmations + newConfirmationsAtWaypoint
            fail("negative-waypoint-confirmed", {"waypoint=" .. currentWaypoint.id,
                "confirmations=" .. tostring(newConfirmationsAtWaypoint)})
        end
        logEvent("WAYPOINT_RESULT", {
            "index=" .. tostring(waypointIndex), "id=" .. currentWaypoint.id,
            "square=" .. s.squareKey, "building=" .. safe(s.buildingId),
            "room=" .. safe(s.roomName) .. ":" .. safe(s.roomId), "outside=" .. bool(s.outside),
            "zone=" .. safe(s.zoneName) .. ":" .. safe(s.zoneType),
            "moveCallbacks=" .. tostring(moveCallbacks - currentWaypoint.moveCallbacksAtStart),
            "newConfirmations=" .. tostring(newConfirmationsAtWaypoint),
            "elapsedMs=" .. tostring(getTimeInMillis() - currentWaypoint.startedMs),
        })
    end
    startWaypoint()
end

local function beginRun()
    local modCount, probeActive = activeModStatus()
    if modCount ~= 1 or not probeActive then error("probe-must-be-only-active-mod count=" .. tostring(modCount)) end
    local c = control()
    phase = tonumber(c.phase) or 0
    runStartMs = getTimeInMillis()
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. gameVersion(), "save=" .. saveFolder(), "phase=" .. tostring(phase),
        "activeModCount=" .. tostring(modCount),
    })
    buildMatrix()
    initialized = true
    evaluate(getPlayer(), "OnGameStart")
    if phase == 0 then
        startWaypoint()
    else
        logEvent("RELOAD_INSIDE_START", {"status=prior-confirmations-restored"})
    end
end

local function onPlayerMove(player)
    if not active or not initialized then return end
    local started = getTimeInMillis()
    moveCallbacks = moveCallbacks + 1
    if not firstMoveCallbackLogged then
        firstMoveCallbackLogged = true
        logEvent("FIRST_MOVE_CALLBACK", {
            "playerPresent=" .. bool(player ~= nil),
            "sameLuaProxy=" .. bool(player == getPlayer()),
        })
    end
    player = player or getPlayer()
    local s = snapshot(player)
    if s then
        if lastMoveSquareKey == s.squareKey then duplicateSquareCallbacks = duplicateSquareCallbacks + 1
        elseif lastMoveSquareKey ~= nil then squareTransitions = squareTransitions + 1 end
        lastMoveSquareKey = s.squareKey
    end
    if lastMoveMs ~= nil then
        local interval = started - lastMoveMs
        callbackIntervals = callbackIntervals + 1
        callbackIntervalTotalMs = callbackIntervalTotalMs + interval
        if callbackIntervalMinMs == nil or interval < callbackIntervalMinMs then callbackIntervalMinMs = interval end
        if callbackIntervalMaxMs == nil or interval > callbackIntervalMaxMs then callbackIntervalMaxMs = interval end
    end
    lastMoveMs = started
    evaluate(player, "OnPlayerMove")
    local elapsed = getTimeInMillis() - started
    callbackTotalMs = callbackTotalMs + elapsed
    if elapsed > callbackPeakMs then callbackPeakMs = elapsed end
    if elapsed > 2 then callbackOver2Ms = callbackOver2Ms + 1 end
end

local function onGameStart()
    if not isProbeSave() then logEvent("SKIPPED", {"reason=current-save-is-not-T8"}); return end
    active = true
end

local function onTick()
    if not active then return end
    tick = tick + 1
    if initialized and tick % 15 == 0 then
        pollCallbacks = pollCallbacks + 1
        evaluate(getPlayer(), "bounded-poll-15-ticks")
    end
    if not initialized and tick >= 180 then
        local ok, err = pcall(beginRun)
        if not ok then
            fail("begin-run", {"error=" .. safe(err)})
            logEvent("MATRIX_RESULT", {"phase=begin", "failures=" .. tostring(probeFailures), "status=FAIL"})
            shouldQuit = true
        end
    elseif initialized and phase == 0 and currentWaypoint then
        waypointTick = waypointTick + 1
        if waypointTick <= 180 and waypointTick % 30 == 0 then
            local s = snapshot(getPlayer())
            if not s or math.abs(s.px - currentWaypoint.x) > 1.5 or
               math.abs(s.py - currentWaypoint.y) > 1.5 or math.floor(s.pz) ~= currentWaypoint.z then
                applyControlledTeleport(currentWaypoint)
                logEvent("WAYPOINT_RETRY", {"waypoint=" .. currentWaypoint.id, "tick=" .. tostring(waypointTick)})
            end
        end
        if waypointTick >= currentWaypoint.dwell then finishWaypoint() end
    elseif initialized and phase == 1 and tick >= 600 then
        local newConfirmations = 0
        for i = 1, #locations do newConfirmations = newConfirmations + locations[i].confirmationCount end
        if newConfirmations ~= 0 then fail("reload-duplicate-confirmation", {"count=" .. tostring(newConfirmations)}) end
        logLocationSummary("phase1-reload-inside")
        logEvent("CALLBACK_SUMMARY", {
            "phase=1", "runMode=" .. runMode, "moveCallbacks=" .. tostring(moveCallbacks),
            "pollCallbacks=" .. tostring(pollCallbacks),
            "duplicateSquareCallbacks=" .. tostring(duplicateSquareCallbacks),
            "squareTransitions=" .. tostring(squareTransitions),
            "intervalSamples=" .. tostring(callbackIntervals),
            "intervalMeanMs=" .. tostring(callbackIntervals > 0 and callbackIntervalTotalMs / callbackIntervals or -1),
            "intervalMinMs=" .. tostring(callbackIntervalMinMs or -1),
            "intervalMaxMs=" .. tostring(callbackIntervalMaxMs or -1),
            "callbackTotalMs=" .. tostring(callbackTotalMs), "callbackPeakMs=" .. tostring(callbackPeakMs),
            "callbackOver2Ms=" .. tostring(callbackOver2Ms),
        })
        local totalFailures = probeFailures + tonumber(control().phase0Failures or 0)
        logEvent("MATRIX_RESULT", {"phase=1", "runMode=" .. runMode, "failures=" .. tostring(totalFailures),
            "newConfirmations=" .. tostring(newConfirmations),
            "status=" .. (totalFailures == 0 and "PASS" or "FAIL")})
        shouldQuit = true
    end
    if shouldQuit then
        quitTick = quitTick + 1
        if quitTick >= 240 then
            active = false
            logEvent("AUTO_QUIT", {"status=normal-quit-to-desktop-requested"})
            getCore():quitToDesktop()
        end
    end
end

T8.snapshot = snapshot
T8.matches = matches
Events.OnGameStart.Add(onGameStart)
Events.OnPlayerMove.Add(onPlayerMove)
Events.OnTick.Add(onTick)
logEvent("SCRIPT_LOADED", {"gameVersion=" .. gameVersion()})
