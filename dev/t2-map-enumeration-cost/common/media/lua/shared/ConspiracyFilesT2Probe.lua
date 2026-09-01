-- Conspiracy-Files Spike T2: Build 42 map/meta-grid enumeration probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T2Probe = ConspiracyFiles.T2Probe or {}

local T2 = ConspiracyFiles.T2Probe
local PREFIX = "[CF-T2]"
local HASH_MOD = 2147483647
local SYNC_PASSES = 5
local BATCH_BUDGETS = { 100, 500, 1000 }

local active = false
local completed = false
local failed = false
local quitTicks = 0
local autoContinuePending = true
local autoContinueTicks = 0
local phase = "idle"
local phaseDelay = 0
local lastTickStartMs = nil
local baseline = { count = 0, sumGapMs = 0, minGapMs = nil, maxGapMs = 0 }
local syncPass = 0
local syncPeakMs = 0
local syncPendingReturnMs = nil
local syncNextTickPeakMs = 0
local expectedCounts = nil
local retainedIndex = nil
local batchIndex = 0
local batchState = nil

local function nowMs()
    return getTimeInMillis and getTimeInMillis() or 0
end

local function safeString(value)
    if value == nil then
        return "<nil>"
    end
    return tostring(value):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function boolText(value)
    return value and "true" or "false"
end

local function formatNumber(value)
    return string.format("%.3f", tonumber(value) or -1)
end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safeString(kind) }
    if fields then
        for i = 1, #fields do
            parts[#parts + 1] = fields[i]
        end
    end
    print(table.concat(parts, "|"))
end

local function currentSaveFolder()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(currentSave):match("([^\\/]+)$") or ""
end

local function isT2Save()
    return currentSaveFolder():match("^T2_") ~= nil
end

local function gameVersion()
    if not getGameVersion then
        return "unavailable"
    end
    local ok, value = pcall(getGameVersion)
    return ok and safeString(value) or "error"
end

local function className(value)
    if value == nil or not getClassSimpleName then
        return "unavailable"
    end
    local ok, valueName = pcall(getClassSimpleName, value)
    return ok and safeString(valueName) or "error"
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then
        return -1, false
    end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains("ConspiracyFiles_T2_Probe") end)
    return countOk and count or -1, containsOk and contains == true
end

local function heapKB()
    collectgarbage("collect")
    return collectgarbage("count")
end

local function mix(checksum, value)
    local numeric = tonumber(value) or 0
    numeric = math.floor(numeric)
    return (checksum * 65599 + (numeric % HASH_MOD)) % HASH_MOD
end

local function scanCounts()
    local metaGrid = getWorld():getMetaGrid()
    local buildings = metaGrid:getBuildings()
    local buildingCount = buildings:size()
    local roomCount = 0
    local checksum = 23

    for buildingIndex0 = 0, buildingCount - 1 do
        local building = buildings:get(buildingIndex0)
        checksum = mix(checksum, building:getID())
        checksum = mix(checksum, building:getX())
        checksum = mix(checksum, building:getY())
        checksum = mix(checksum, building:getX2())
        checksum = mix(checksum, building:getY2())
        local rooms = building:getRooms()
        local count = rooms:size()
        roomCount = roomCount + count
        for roomIndex0 = 0, count - 1 do
            local room = rooms:get(roomIndex0)
            checksum = mix(checksum, room:getID())
            checksum = mix(checksum, room:getArea())
            checksum = mix(checksum, room:getZ())
            local name = room:getName()
            checksum = mix(checksum, type(name) == "string" and #name or 0)
        end
    end

    return {
        buildings = buildingCount,
        rooms = roomCount,
        records = buildingCount + roomCount,
        checksum = checksum,
    }
end

local function newIndex()
    return {
        buildings = {},
        rooms = {},
        buildingById = {},
        roomById = {},
        roomsByName = {},
    }
end

local function appendBuilding(index, building)
    local id = building:getIDString()
    local record = {
        id = id,
        x = building:getX(),
        y = building:getY(),
        x2 = building:getX2(),
        y2 = building:getY2(),
        minLevel = building:getMinLevel(),
        maxLevel = building:getMaxLevel(),
        roomFirst = #index.rooms + 1,
        roomCount = building:getRooms():size(),
    }
    index.buildings[#index.buildings + 1] = record
    index.buildingById[id] = record
    return id
end

local function appendRoom(index, room, buildingId)
    local id = room:getIDString()
    local name = room:getName()
    if type(name) ~= "string" or name == "" then
        name = "<unnamed>"
    end
    local record = {
        id = id,
        buildingId = buildingId,
        name = name,
        x = room:getX(),
        y = room:getY(),
        x2 = room:getX2(),
        y2 = room:getY2(),
        z = room:getZ(),
        area = room:getArea(),
    }
    index.rooms[#index.rooms + 1] = record
    index.roomById[id] = record
    local bucket = index.roomsByName[name]
    if bucket == nil then
        bucket = {}
        index.roomsByName[name] = bucket
    end
    bucket[#bucket + 1] = #index.rooms
end

local function indexStats(index)
    local nameCount = 0
    local bucketEntries = 0
    for _, bucket in pairs(index.roomsByName) do
        nameCount = nameCount + 1
        bucketEntries = bucketEntries + #bucket
    end
    return #index.buildings, #index.rooms, nameCount, bucketEntries
end

local function buildIndexSynchronously()
    retainedIndex = nil
    local gcStart = nowMs()
    local beforeKB = heapKB()
    local preGcMs = nowMs() - gcStart
    local index = newIndex()
    local buildings = getWorld():getMetaGrid():getBuildings()
    local started = nowMs()
    for buildingIndex0 = 0, buildings:size() - 1 do
        local building = buildings:get(buildingIndex0)
        local buildingId = appendBuilding(index, building)
        local rooms = building:getRooms()
        for roomIndex0 = 0, rooms:size() - 1 do
            appendRoom(index, rooms:get(roomIndex0), buildingId)
        end
    end
    local elapsedMs = nowMs() - started
    retainedIndex = index
    local postGcStart = nowMs()
    local afterKB = heapKB()
    local postGcMs = nowMs() - postGcStart
    local buildingsCount, roomsCount, nameCount, bucketEntries = indexStats(index)
    logEvent("SYNC_INDEX", {
        "buildings=" .. tostring(buildingsCount),
        "rooms=" .. tostring(roomsCount),
        "records=" .. tostring(buildingsCount + roomsCount),
        "roomNameKeys=" .. tostring(nameCount),
        "roomNameBucketEntries=" .. tostring(bucketEntries),
        "elapsedMs=" .. tostring(elapsedMs),
        "heapBeforeKB=" .. formatNumber(beforeKB),
        "heapAfterKB=" .. formatNumber(afterKB),
        "heapDeltaKB=" .. formatNumber(afterKB - beforeKB),
        "heapDeltaBytes=" .. tostring(math.floor((afterKB - beforeKB) * 1024 + 0.5)),
        "preMeasureGcMs=" .. tostring(preGcMs),
        "postMeasureGcMs=" .. tostring(postGcMs),
        "retainsEngineObjects=false",
        "persisted=false",
    })
end

local function startBatch(budget)
    retainedIndex = nil
    batchState = nil
    local gcStarted = nowMs()
    local beforeKB = heapKB()
    local preGcMs = nowMs() - gcStarted
    batchState = {
        budget = budget,
        buildings = getWorld():getMetaGrid():getBuildings(),
        buildingIndex0 = 0,
        rooms = nil,
        roomIndex0 = 0,
        buildingId = nil,
        index = newIndex(),
        startedMs = nowMs(),
        frames = 0,
        callbackTotalMs = 0,
        callbackPeakMs = 0,
        callbacksOver2Ms = 0,
        recordsProcessed = 0,
        maxTickStartGapMs = 0,
        lastTickStartMs = nil,
        heapBeforeKB = beforeKB,
        preMeasureGcMs = preGcMs,
    }
    logEvent("BATCH_START", {
        "budgetRecordsPerFrame=" .. tostring(budget),
        "heapBeforeKB=" .. formatNumber(beforeKB),
        "preMeasureGcMs=" .. tostring(preGcMs),
    })
end

local function processBatchFrame()
    local state = batchState
    local tickStarted = nowMs()
    if state.lastTickStartMs ~= nil then
        local gap = tickStarted - state.lastTickStartMs
        if gap > state.maxTickStartGapMs then
            state.maxTickStartGapMs = gap
        end
    end
    state.lastTickStartMs = tickStarted
    local processed = 0

    while processed < state.budget do
        if state.rooms ~= nil and state.roomIndex0 < state.rooms:size() then
            appendRoom(state.index, state.rooms:get(state.roomIndex0), state.buildingId)
            state.roomIndex0 = state.roomIndex0 + 1
            processed = processed + 1
        else
            state.rooms = nil
            if state.buildingIndex0 >= state.buildings:size() then
                break
            end
            local building = state.buildings:get(state.buildingIndex0)
            state.buildingIndex0 = state.buildingIndex0 + 1
            state.buildingId = appendBuilding(state.index, building)
            state.rooms = building:getRooms()
            state.roomIndex0 = 0
            processed = processed + 1
        end
    end

    local elapsedMs = nowMs() - tickStarted
    state.frames = state.frames + 1
    state.recordsProcessed = state.recordsProcessed + processed
    state.callbackTotalMs = state.callbackTotalMs + elapsedMs
    if elapsedMs > state.callbackPeakMs then
        state.callbackPeakMs = elapsedMs
    end
    if elapsedMs > 2 then
        state.callbacksOver2Ms = state.callbacksOver2Ms + 1
    end

    local done = state.buildingIndex0 >= state.buildings:size()
        and (state.rooms == nil or state.roomIndex0 >= state.rooms:size())
    if not done then
        return
    end

    local activeWallMs = nowMs() - state.startedMs
    retainedIndex = state.index
    state.index = nil
    state.buildings = nil
    state.rooms = nil
    local postGcStarted = nowMs()
    local afterKB = heapKB()
    local postGcMs = nowMs() - postGcStarted
    local buildingsCount, roomsCount, nameCount, bucketEntries = indexStats(retainedIndex)
    local countsMatch = expectedCounts ~= nil
        and buildingsCount == expectedCounts.buildings
        and roomsCount == expectedCounts.rooms
        and state.recordsProcessed == expectedCounts.records
    logEvent("BATCH_RESULT", {
        "budgetRecordsPerFrame=" .. tostring(state.budget),
        "buildings=" .. tostring(buildingsCount),
        "rooms=" .. tostring(roomsCount),
        "records=" .. tostring(state.recordsProcessed),
        "roomNameKeys=" .. tostring(nameCount),
        "roomNameBucketEntries=" .. tostring(bucketEntries),
        "frames=" .. tostring(state.frames),
        "activeWallMs=" .. tostring(activeWallMs),
        "callbackTotalMs=" .. tostring(state.callbackTotalMs),
        "callbackMeanMs=" .. formatNumber(state.callbackTotalMs / state.frames),
        "callbackPeakMs=" .. tostring(state.callbackPeakMs),
        "callbacksOver2Ms=" .. tostring(state.callbacksOver2Ms),
        "maxTickStartGapMs=" .. tostring(state.maxTickStartGapMs),
        "heapBeforeKB=" .. formatNumber(state.heapBeforeKB),
        "heapAfterKB=" .. formatNumber(afterKB),
        "heapDeltaKB=" .. formatNumber(afterKB - state.heapBeforeKB),
        "heapDeltaBytes=" .. tostring(math.floor((afterKB - state.heapBeforeKB) * 1024 + 0.5)),
        "postMeasureGcMs=" .. tostring(postGcMs),
        "countsMatch=" .. boolText(countsMatch),
        "persisted=false",
    })
    batchState = nil
    phase = "batch-cleanup"
    phaseDelay = 30
end

local function beginLiveProbe()
    if type(collectgarbage) ~= "function" then
        error("collectgarbage is unavailable; useful-index memory cannot be measured")
    end
    local world = getWorld()
    local metaGrid = world and world:getMetaGrid() or nil
    local buildings = metaGrid and metaGrid:getBuildings() or nil
    if world == nil or metaGrid == nil or buildings == nil then
        error("required world/meta-grid/buildings API is unavailable")
    end

    local modCount, probeActive = activeModStatus()
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. gameVersion(),
        "save=" .. currentSaveFolder(),
        "map=" .. safeString(world:getMap()),
        "activeModCount=" .. tostring(modCount),
        "probeActive=" .. boolText(probeActive),
        "worldClass=" .. className(world),
        "metaGridClass=" .. className(metaGrid),
        "buildingsClass=" .. className(buildings),
        "collectgarbageType=" .. type(collectgarbage),
    })
    logEvent("META_GRID", {
        "minX=" .. tostring(metaGrid:getMinX()),
        "minY=" .. tostring(metaGrid:getMinY()),
        "maxX=" .. tostring(metaGrid:getMaxX()),
        "maxY=" .. tostring(metaGrid:getMaxY()),
        "width=" .. tostring(metaGrid:getWidth()),
        "height=" .. tostring(metaGrid:getHeight()),
        "wasLoaded=" .. boolText(metaGrid:wasLoaded()),
    })
    phase = "baseline"
    baseline = { count = 0, sumGapMs = 0, minGapMs = nil, maxGapMs = 0 }
    lastTickStartMs = nil
end

local function advanceProbe()
    local tickStart = nowMs()
    local tickGap = nil
    if lastTickStartMs ~= nil then
        tickGap = tickStart - lastTickStartMs
    end
    lastTickStartMs = tickStart

    if syncPendingReturnMs ~= nil then
        local nextGap = tickStart - syncPendingReturnMs
        if nextGap > syncNextTickPeakMs then
            syncNextTickPeakMs = nextGap
        end
        logEvent("SYNC_NEXT_TICK", {
            "pass=" .. tostring(syncPass),
            "gapSinceReturnMs=" .. tostring(nextGap),
            "tickStartGapMs=" .. tostring(tickGap or -1),
        })
        syncPendingReturnMs = nil
    end

    if phaseDelay > 0 then
        phaseDelay = phaseDelay - 1
        return
    end

    if phase == "baseline" then
        if tickGap ~= nil then
            baseline.count = baseline.count + 1
            baseline.sumGapMs = baseline.sumGapMs + tickGap
            baseline.minGapMs = baseline.minGapMs == nil and tickGap or math.min(baseline.minGapMs, tickGap)
            baseline.maxGapMs = math.max(baseline.maxGapMs, tickGap)
        end
        if baseline.count >= 120 then
            logEvent("BASELINE_TICKS", {
                "samples=" .. tostring(baseline.count),
                "meanTickStartGapMs=" .. formatNumber(baseline.sumGapMs / baseline.count),
                "minTickStartGapMs=" .. tostring(baseline.minGapMs),
                "maxTickStartGapMs=" .. tostring(baseline.maxGapMs),
            })
            phase = "sync"
            phaseDelay = 30
        end
        return
    end

    if phase == "sync" then
        syncPass = syncPass + 1
        local started = nowMs()
        local counts = scanCounts()
        local finished = nowMs()
        local elapsedMs = finished - started
        syncPeakMs = math.max(syncPeakMs, elapsedMs)
        syncPendingReturnMs = finished
        if expectedCounts == nil then
            expectedCounts = counts
        end
        local matches = counts.buildings == expectedCounts.buildings
            and counts.rooms == expectedCounts.rooms
            and counts.records == expectedCounts.records
            and counts.checksum == expectedCounts.checksum
        logEvent("SYNC_SCAN", {
            "pass=" .. tostring(syncPass),
            "buildings=" .. tostring(counts.buildings),
            "rooms=" .. tostring(counts.rooms),
            "records=" .. tostring(counts.records),
            "checksum=" .. tostring(counts.checksum),
            "elapsedMs=" .. tostring(elapsedMs),
            "countsMatch=" .. boolText(matches),
        })
        if syncPass >= SYNC_PASSES then
            phase = "sync-index"
            phaseDelay = 30
        else
            phaseDelay = 15
        end
        return
    end

    if phase == "sync-index" then
        buildIndexSynchronously()
        logEvent("SYNC_SUMMARY", {
            "passes=" .. tostring(SYNC_PASSES),
            "peakScanCallbackMs=" .. tostring(syncPeakMs),
            "peakGapSinceReturnMs=" .. tostring(syncNextTickPeakMs),
        })
        phase = "batch-cleanup"
        phaseDelay = 30
        return
    end

    if phase == "batch-cleanup" then
        retainedIndex = nil
        batchState = nil
        local gcStarted = nowMs()
        collectgarbage("collect")
        logEvent("INDEX_RELEASED", { "gcMs=" .. tostring(nowMs() - gcStarted) })
        batchIndex = batchIndex + 1
        if batchIndex > #BATCH_BUDGETS then
            phase = "complete"
            phaseDelay = 30
        else
            startBatch(BATCH_BUDGETS[batchIndex])
            phase = "batch"
        end
        return
    end

    if phase == "batch" then
        processBatchFrame()
        return
    end

    if phase == "complete" then
        completed = true
        phase = "done"
        logEvent("COMPLETE", {
            "buildings=" .. tostring(expectedCounts and expectedCounts.buildings or -1),
            "rooms=" .. tostring(expectedCounts and expectedCounts.rooms or -1),
            "records=" .. tostring(expectedCounts and expectedCounts.records or -1),
            "syncPeakMs=" .. tostring(syncPeakMs),
            "syncPeakGapSinceReturnMs=" .. tostring(syncNextTickPeakMs),
            "batchCases=" .. tostring(#BATCH_BUDGETS),
            "status=PASS",
        })
    end
end

local function onGameStart()
    if not isT2Save() then
        logEvent("SKIPPED", { "reason=current-save-is-not-T2" })
        return
    end
    active = true
    local ok, err = pcall(beginLiveProbe)
    if not ok then
        failed = true
        logEvent("PROBE_ERROR", { "phase=begin", "error=" .. safeString(err) })
    end
end

local function onAutoContinueTick()
    if not autoContinuePending then
        return
    end
    autoContinueTicks = autoContinueTicks + 1
    if autoContinueTicks < 30 then
        return
    end
    local latest = getLatestSave and getLatestSave() or nil
    local saveName = latest and latest[1] or nil
    local gameMode = latest and latest[2] or nil
    if type(saveName) ~= "string" or not saveName:match("^T2_") then
        autoContinuePending = false
        logEvent("AUTO_CONTINUE_SKIPPED", { "reason=latest-save-is-not-T2" })
        return
    end
    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars
            or not MainScreen.continueLatestSave then
        return
    end
    autoContinuePending = false
    logEvent("AUTO_CONTINUE", { "save=" .. saveName, "gameMode=" .. safeString(gameMode) })
    MainScreen.continueLatestSave(gameMode, saveName)
end

local function onMainMenuEnter()
    autoContinuePending = true
    autoContinueTicks = 0
    logEvent("AUTO_MENU_READY", { "status=waiting-for-main-screen-instance" })
end

local function onTick()
    if not active then
        return
    end
    if not completed and not failed then
        local ok, err = pcall(advanceProbe)
        if not ok then
            failed = true
            retainedIndex = nil
            batchState = nil
            logEvent("PROBE_ERROR", { "phase=" .. safeString(phase), "error=" .. safeString(err) })
        end
        return
    end
    quitTicks = quitTicks + 1
    if quitTicks >= 120 then
        active = false
        logEvent("AUTO_QUIT", { "status=normal-quit-to-desktop-requested", "probeFailed=" .. boolText(failed) })
        getCore():quitToDesktop()
    end
end

T2.scanCounts = scanCounts
T2.buildIndexSynchronously = buildIndexSynchronously

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)

logEvent("SCRIPT_LOADED", { "gameVersion=" .. gameVersion() })
