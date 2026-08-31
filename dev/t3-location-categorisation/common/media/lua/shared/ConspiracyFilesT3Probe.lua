-- Conspiracy-Files Spike T3: Build 42 location categorisation probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T3Probe = ConspiracyFiles.T3Probe or {}

local T3 = ConspiracyFiles.T3Probe
local PREFIX = "[CF-T3]"
local RECORD_CAP = 48
local DEADLINE_MS = 1
local SAMPLE_CAP = { police = 24, bookstore = 24, medical = 30, office = 30, transmission = 24 }

-- Fixed after the exploratory pass, before the measured final pass. Labels are
-- manual building-level ground truth based on complete room compositions.
local GROUND_TRUTH = {
    police = {
        ["6473954529116160"]={true,"small-police-station-2027-5966"}, ["3377918763860009"]={true,"police-station-13206-3073"},
        ["2533502423662731"]={true,"small-police-station-13778-2552"}, ["9007319513825317"]={true,"police-station-7252-8383"},
        ["15199687397081128"]={true,"small-police-station-2483-13935"}, ["1407581041983534"]={true,"large-police-headquarters-12404-1528"},
        ["12666498506031106"]={false,"prison-7512-11701"}, ["11259175162085376"]={false,"coroner-basement-10631-10395"},
        ["2814964515471398"]={false,"police-horse-stable-13029-2813"}, ["7318546962972672"]={false,"laboratory-basement-11799-6800"},
        ["3940855832379392"]={false,"hospital-12353-3603"},
    },
    bookstore = {
        ["1970535290372099"]={true,"bookstore-12554-1927"}, ["1126118950174725"]={true,"bookstore-13178-1250"},
        ["11259175162085422"]={true,"mixed-commercial-bookstore-10603-10344"}, ["9007319513825330"]={true,"bookstore-7250-8419"},
        ["6192483847372834"]={true,"bookstore-2119-5776"}, ["3096443787149335"]={true,"shopping-centre-bookstore-13300-3042"},
        ["12666498506031106"]={false,"prison-library-7512-11701"}, ["3940855832379392"]={false,"hospital-12353-3603"},
        ["2814973105406031"]={false,"school-library-13562-2718"}, ["10133262370340864"]={false,"office-9962-9245"},
        ["1970535290372126"]={false,"broadcast-studio-12630-1883"},
    },
    medical = {
        ["3940855832379392"]={true,"hospital-12353-3603"}, ["1689077493530639"]={true,"clinic-13601-1560"},
        ["6473958824083462"]={true,"clinic-2070-5901"}, ["10414664332607489"]={true,"clinic-pharmacy-5493-9577"},
        ["5629606908395567"]={true,"medical-centre-6645-5241"}, ["13792441362546692"]={true,"clinic-pharmacy-10125-12748"},
        ["2814973105406031"]={false,"school-first-aid-room-13562-2718"}, ["1689077493530635"]={false,"fire-station-medical-storage-13689-1767"},
        ["13510932026097664"]={false,"bunker-medical-room-7967-12333"}, ["2533532488433668"]={false,"police-medical-room-15540-2465"},
        ["9288751540862978"]={false,"ranger-medical-room-4663-8591"},
    },
    office = {
        ["10133262370340864"]={true,"office-9962-9245"}, ["7036908777504772"]={true,"office-2069-6563"},
        ["7036908777504775"]={true,"office-2228-6449"}, ["3377957418565638"]={true,"office-15545-3074"},
        ["2533485243793411"]={true,"office-12799-2377"}, ["1407585336950802"]={true,"mixed-high-rise-offices-12696-1511"},
        ["5629602613428253"]={false,"restaurant-back-office-6396-5295"}, ["5629602613428255"]={false,"retail-back-office-6364-5309"},
        ["5629602613428259"]={false,"grocery-back-offices-6360-5253"}, ["5629602613428268"]={false,"theatre-office-6357-5333"},
        ["12947977777709058"]={false,"residential-house-office-7768-11913"},
    },
    transmission = {
        ["1970535290372126"]={true,"broadcast-studio-12630-1883"}, ["1970530995404862"]={true,"broadcast-studio-12310-2039"},
        ["1689073198563470"]={true,"news-communications-site-13549-1572"}, ["1689056018694155"]={true,"news-communications-site-12462-1742"},
        ["1407589631918090"]={true,"studio-complex-13038-1437"}, ["2815003170177024"]={true,"communications-tower-building-15356-2661"},
        ["3377957418565634"]={false,"factory-communications-rooms-15391-3133"}, ["1407589631918089"]={false,"arena-broadcast-booth-13009-1362"},
        ["1407589631918096"]={false,"stadium-broadcast-booth-12946-1514"}, ["13510889076424704"]={false,"underground-bunker-communications-5522-12407"},
        ["13510889076424705"]={false,"laboratory-communications-5537-12440"},
    },
}

local active = false
local completed = false
local failed = false
local quitTicks = 0
local autoContinuePending = true
local autoContinueTicks = 0
local phase = "idle"
local state = nil
local outputQueue = {}
local outputIndex = 1

local function nowMs()
    return getTimeInMillis and getTimeInMillis() or 0
end

local function safeString(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function boolText(value)
    return value and "true" or "false"
end

local function eventLine(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safeString(kind) }
    if fields then
        for i = 1, #fields do parts[#parts + 1] = fields[i] end
    end
    return table.concat(parts, "|")
end

local function logEvent(kind, fields)
    print(eventLine(kind, fields))
end

local function queueEvent(kind, fields)
    outputQueue[#outputQueue + 1] = eventLine(kind, fields)
end

local function currentSaveFolder()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(currentSave):match("([^\\/]+)$") or ""
end

local function isT3Save()
    return currentSaveFolder():match("^T3_") ~= nil
end

local function gameVersion()
    if not getGameVersion then return "unavailable" end
    local ok, value = pcall(getGameVersion)
    return ok and safeString(value) or "error"
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains("ConspiracyFiles_T3_Probe") end)
    return countOk and count or -1, containsOk and contains == true
end

local function lower(value)
    return type(value) == "string" and string.lower(value) or ""
end

local function matchesAny(text, patterns)
    for i = 1, #patterns do
        if text:find(patterns[i], 1, true) then return true end
    end
    return false
end

local function roomSignals(name)
    local n = lower(name)
    return {
        police = matchesAny(n, { "police", "detective", "evidence", "jail", "holdingcell" }),
        bookstore = matchesAny(n, { "bookstore", "bookshop" }),
        medical = matchesAny(n, { "hospital", "clinic", "medical", "medclinic" }),
        office = matchesAny(n, { "office", "meetingroom", "reception" }),
        transmission = matchesAny(n, { "transmi", "broadcast", "radiostudio", "tvstudio", "television", "radiostation", "communications" }),
    }
end

local function zoneSignals(name, zoneType, originalName)
    local n = lower(safeString(name) .. " " .. safeString(zoneType) .. " " .. safeString(originalName))
    return {
        police = matchesAny(n, { "police", "sheriff" }),
        bookstore = matchesAny(n, { "bookstore", "bookshop" }),
        medical = matchesAny(n, { "hospital", "clinic", "medical" }),
        office = matchesAny(n, { "office" }),
        transmission = matchesAny(n, { "transmi", "broadcast", "radio", "television", "antenna", "tower", "communications" }),
    }
end

local function addAggregate(bucket, key, area)
    local record = bucket[key]
    if record == nil then
        record = { count = 0, area = 0 }
        bucket[key] = record
    end
    record.count = record.count + 1
    record.area = record.area + (tonumber(area) or 0)
end

local function addSemanticZone(zone)
    local name = lower(zone:getName())
    if lower(zone:getType()) ~= "zombiestype" or (name ~= "police" and name ~= "office" and name ~= "offices") then return end
    local fact = { name=name, x=zone:getX(), y=zone:getY(), z=zone:getZ(), x2=zone:getX()+zone:getWidth(), y2=zone:getY()+zone:getHeight() }
    for cellX = math.floor(fact.x/300), math.floor((fact.x2-1)/300) do
        for cellY = math.floor(fact.y/300), math.floor((fact.y2-1)/300) do
            local key = tostring(cellX)..","..tostring(cellY)
            local bucket = state.semanticZoneBuckets[key]
            if bucket == nil then bucket={}; state.semanticZoneBuckets[key]=bucket end
            bucket[#bucket+1]=fact
        end
    end
end

local function intersectingSemanticZones(building)
    local seen, names = {}, {}
    local counts = { police=0, office=0 }
    for cellX = math.floor(building:getX()/300), math.floor((building:getX2()-1)/300) do
        for cellY = math.floor(building:getY()/300), math.floor((building:getY2()-1)/300) do
            local bucket = state.semanticZoneBuckets[tostring(cellX)..","..tostring(cellY)] or {}
            for i=1,#bucket do
                local zone=bucket[i]
                if not seen[zone] and zone.z>=building:getMinLevel() and zone.z<=building:getMaxLevel()
                        and zone.x<building:getX2() and zone.x2>building:getX() and zone.y<building:getY2() and zone.y2>building:getY() then
                    seen[zone]=true
                    local category = zone.name=="police" and "police" or "office"
                    counts[category]=counts[category]+1
                    names[#names+1]=zone.name.."@"..tostring(zone.x)..","..tostring(zone.y)..","..tostring(zone.z)
                end
            end
        end
    end
    table.sort(names)
    return counts, table.concat(names,",")
end

local function roomCount(acc,name)
    local facts=acc.names[name]
    return facts and facts.count or 0
end

local function roomArea(acc,name)
    local facts=acc.names[name]
    return facts and facts.area or 0
end

local function classify(acc,zoneCounts)
    local officeArea=roomArea(acc,"office")+roomArea(acc,"office_herald")+roomArea(acc,"office_ranger")
    local ratio=officeArea/math.max(1,acc.building:getArea())
    return {
        police=roomCount(acc,"policeoffice")>=1 and (roomCount(acc,"policegunstorage")>=1 or roomCount(acc,"policelocker")>=1) and roomCount(acc,"prisoncells")<=10,
        bookstore=roomCount(acc,"bookstore")>=1,
        medical=roomCount(acc,"hospitalroom")>=1 or roomCount(acc,"hospitalhallway")>=1 or roomCount(acc,"clinic")>=1 or roomCount(acc,"medclinic")>=1
            or (roomCount(acc,"medicaloffice")>=1 and (roomCount(acc,"medical")>=1 or roomCount(acc,"pharmacy")>=1)),
        office=(ratio>=0.40 and not acc.building:isResidential()) or zoneCounts.office>=1,
        transmission=(roomCount(acc,"broadcasting")>=2 and roomCount(acc,"studio")>=1)
            or (roomCount(acc,"communications")>=2 and roomCount(acc,"newsroom")>=1),
    },ratio
end

local function tableSummary(value)
    if value == nil then return "<nil>" end
    local items = {}
    local ok = pcall(function()
        for key, child in pairs(value) do
            items[#items + 1] = safeString(key) .. ":" .. safeString(child)
        end
    end)
    if not ok then return "<error>" end
    table.sort(items)
    return #items == 0 and "<empty>" or table.concat(items, ",")
end

local function zoneSummary(zone)
    if zone == nil then return "<nil>" end
    local geometry = "unknown"
    if zone.isPoint and zone:isPoint() then geometry = "point"
    elseif zone.isPolygon and zone:isPolygon() then geometry = "polygon"
    elseif zone.isPolyline and zone:isPolyline() then geometry = "polyline"
    elseif zone.isRectangle and zone:isRectangle() then geometry = "rectangle" end
    return table.concat({
        "name:" .. safeString(zone:getName()),
        "type:" .. safeString(zone:getType()),
        "originalName:" .. safeString(zone:getOriginalName()),
        "geometry:" .. geometry,
        "bounds:" .. tostring(zone:getX()) .. "," .. tostring(zone:getY()) .. "," .. tostring(zone:getZ()) .. "," .. tostring(zone:getWidth()) .. "," .. tostring(zone:getHeight()),
    }, ",")
end

local function roomComposition(acc)
    local names = {}
    for name, facts in pairs(acc.names) do
        names[#names + 1] = safeString(name) .. ":" .. tostring(facts.count) .. ":" .. tostring(facts.area)
    end
    table.sort(names)
    return table.concat(names, ",")
end

local function candidateSummary(acc, zoneNames)
    local building = acc.building
    return table.concat({
        "buildingId=" .. safeString(building:getIDString()),
        "bounds=" .. tostring(building:getX()) .. "," .. tostring(building:getY()) .. "," .. tostring(building:getX2()) .. "," .. tostring(building:getY2()),
        "levels=" .. tostring(building:getMinLevel()) .. "," .. tostring(building:getMaxLevel()),
        "area=" .. tostring(building:getArea()),
        "rooms=" .. tostring(acc.roomCount),
        "roomComposition=" .. roomComposition(acc),
        "isShop=" .. boolText(building:isShop()),
        "isResidential=" .. boolText(building:isResidential()),
        "isRural=" .. boolText(building:isRural()),
        "isBasement=" .. boolText(building:isBasement()),
        "isUserDefined=" .. boolText(building:isUserDefined()),
        "buildingZone=" .. zoneSummary(building:getZone()),
        "intersectingSemanticZones=" .. (zoneNames == "" and "<none>" or zoneNames),
        "buildingTable=" .. tableSummary(building:getTable()),
    }, "|")
end

local function finishBuilding()
    local acc = state.current
    if acc == nil then return end
    local zoneCounts, zoneNames = intersectingSemanticZones(acc.building)
    local predictions, officeRatio = classify(acc, zoneCounts)
    local summary = candidateSummary(acc, zoneNames)
    for category, signalled in pairs(acc.signals) do
        if signalled then
            state.candidateCounts[category] = state.candidateCounts[category] + 1
            local samples = state.samples[category]
            if #samples < SAMPLE_CAP[category] then samples[#samples + 1] = summary end
        end
    end
    local buildingId = acc.building:getIDString()
    local categories = { "police", "bookstore", "medical", "office", "transmission" }
    for i=1,#categories do
        local category=categories[i]
        local truth=GROUND_TRUTH[category][buildingId]
        if truth~=nil then
            local predicted=predictions[category]
            local outcome=predicted and (truth[1] and "TP" or "FP") or (truth[1] and "FN" or "TN")
            state.confusion[category][outcome]=state.confusion[category][outcome]+1
            state.groundTruthFound=state.groundTruthFound+1
            state.groundTruthLines[#state.groundTruthLines+1]={category=category,label=truth[2],expected=truth[1],predicted=predicted,
                outcome=outcome,officeRatio=officeRatio,policeZones=zoneCounts.police,officeZones=zoneCounts.office,summary=summary}
        end
    end
    state.current = nil
end

local function startNextBuilding()
    if state.buildingIndex0 >= state.buildings:size() then return false end
    local building = state.buildings:get(state.buildingIndex0)
    state.buildingIndex0 = state.buildingIndex0 + 1
    state.buildingCount = state.buildingCount + 1
    state.current = {
        building = building,
        rooms = building:getRooms(),
        roomIndex0 = 0,
        roomCount = 0,
        names = {},
        signals = { police = false, bookstore = false, medical = false, office = false, transmission = false },
    }
    return true
end

local function processBuildingRecord()
    if state.current == nil and not startNextBuilding() then return false end
    local acc = state.current
    if acc.roomIndex0 >= acc.rooms:size() then
        finishBuilding()
        return true
    end
    local room = acc.rooms:get(acc.roomIndex0)
    acc.roomIndex0 = acc.roomIndex0 + 1
    acc.roomCount = acc.roomCount + 1
    state.roomCount = state.roomCount + 1
    local name = room:getName()
    if type(name) ~= "string" or name == "" then name = "<unnamed>" end
    addAggregate(state.roomNames, name, room:getArea())
    addAggregate(acc.names, name, room:getArea())
    local signals = roomSignals(name)
    for category, signalled in pairs(signals) do
        if signalled then acc.signals[category] = true end
    end
    return true
end

local function processZoneRecord()
    if state.zoneIndex0 >= state.zones:size() then return false end
    local zone = state.zones:get(state.zoneIndex0)
    state.zoneIndex0 = state.zoneIndex0 + 1
    state.zoneCount = state.zoneCount + 1
    local name = safeString(zone:getName())
    local zoneType = safeString(zone:getType())
    local originalName = safeString(zone:getOriginalName())
    addAggregate(state.zoneNames, name, 0)
    addAggregate(state.zoneTypes, zoneType, 0)
    addSemanticZone(zone)
    local signals = zoneSignals(name, zoneType, originalName)
    local summary = zoneSummary(zone)
    for category, signalled in pairs(signals) do
        if signalled then
            state.zoneCandidateCounts[category] = state.zoneCandidateCounts[category] + 1
            local samples = state.zoneSamples[category]
            if #samples < SAMPLE_CAP[category] then samples[#samples + 1] = summary end
        end
    end
    return true
end

local function processBounded(work)
    local started = nowMs()
    local processed = 0
    while processed < RECORD_CAP do
        if not work() then break end
        processed = processed + 1
        if nowMs() - started >= DEADLINE_MS then break end
    end
    local elapsed = nowMs() - started
    state.frames = state.frames + 1
    state.records = state.records + processed
    state.callbackTotalMs = state.callbackTotalMs + elapsed
    state.callbackPeakMs = math.max(state.callbackPeakMs, elapsed)
    if elapsed > 2 then state.callbacksOver2Ms = state.callbacksOver2Ms + 1 end
    return processed
end

local function sortedAggregateKeys(bucket)
    local keys = {}
    for key in pairs(bucket) do keys[#keys + 1] = key end
    table.sort(keys)
    return keys
end

local function prepareOutput()
    queueEvent("SCAN_RESULT", {
        "recordCap=" .. tostring(RECORD_CAP), "deadlineMs=" .. tostring(DEADLINE_MS),
        "buildings=" .. tostring(state.buildingCount), "rooms=" .. tostring(state.roomCount),
        "zones=" .. tostring(state.zoneCount), "records=" .. tostring(state.records),
        "frames=" .. tostring(state.frames), "callbackTotalMs=" .. tostring(state.callbackTotalMs),
        "callbackPeakMs=" .. tostring(state.callbackPeakMs), "callbacksOver2Ms=" .. tostring(state.callbacksOver2Ms),
        "retainsEngineObjects=false", "persisted=false",
    })
    local categories = { "police", "bookstore", "medical", "office", "transmission" }
    for i = 1, #categories do
        local category = categories[i]
        queueEvent("CATEGORY_SUMMARY", {
            "category=" .. category,
            "buildingCandidates=" .. tostring(state.candidateCounts[category]),
            "buildingSamplesEmitted=" .. tostring(#state.samples[category]),
            "zoneCandidates=" .. tostring(state.zoneCandidateCounts[category]),
            "zoneSamplesEmitted=" .. tostring(#state.zoneSamples[category]),
        })
        for j = 1, #state.samples[category] do
            queueEvent("BUILDING_CANDIDATE", { "category=" .. category, "sampleIndex=" .. tostring(j), state.samples[category][j] })
        end
        for j = 1, #state.zoneSamples[category] do
            queueEvent("ZONE_CANDIDATE", { "category=" .. category, "sampleIndex=" .. tostring(j), state.zoneSamples[category][j] })
        end
        local matrix=state.confusion[category]
        queueEvent("CONFUSION", { "category="..category, "tp="..tostring(matrix.TP), "tn="..tostring(matrix.TN),
            "fp="..tostring(matrix.FP), "fn="..tostring(matrix.FN) })
    end
    table.sort(state.groundTruthLines,function(a,b) return a.category==b.category and a.label<b.label or a.category<b.category end)
    for i=1,#state.groundTruthLines do
        local row=state.groundTruthLines[i]
        queueEvent("GROUND_TRUTH", { "category="..row.category, "label="..row.label, "expected="..boolText(row.expected),
            "predicted="..boolText(row.predicted), "outcome="..row.outcome, "officeAreaRatio="..string.format("%.3f",row.officeRatio),
            "policeZoneIntersections="..tostring(row.policeZones), "officeZoneIntersections="..tostring(row.officeZones), row.summary })
    end
    local expectedRows=0
    for _,category in ipairs(categories) do for _ in pairs(GROUND_TRUTH[category]) do expectedRows=expectedRows+1 end end
    queueEvent("GROUND_TRUTH_SUMMARY", { "expectedRows="..tostring(expectedRows), "foundRows="..tostring(state.groundTruthFound),
        "allFound="..boolText(expectedRows==state.groundTruthFound) })
    local roomKeys = sortedAggregateKeys(state.roomNames)
    for i = 1, #roomKeys do
        local key = roomKeys[i]
        local facts = state.roomNames[key]
        queueEvent("ROOM_NAME", { "name=" .. safeString(key), "count=" .. tostring(facts.count), "area=" .. tostring(facts.area) })
    end
    local zoneTypeKeys = sortedAggregateKeys(state.zoneTypes)
    for i = 1, #zoneTypeKeys do
        local key = zoneTypeKeys[i]
        queueEvent("ZONE_TYPE", { "type=" .. safeString(key), "count=" .. tostring(state.zoneTypes[key].count) })
    end
    local zoneNameKeys = sortedAggregateKeys(state.zoneNames)
    for i = 1, #zoneNameKeys do
        local key = zoneNameKeys[i]
        queueEvent("ZONE_NAME", { "name=" .. safeString(key), "count=" .. tostring(state.zoneNames[key].count) })
    end
    queueEvent("COMPLETE", { "status=PASS", "queuedEvidenceLines=" .. tostring(#outputQueue + 1) })
    outputIndex = 1
end

local function emitBounded()
    local started = nowMs()
    local emitted = 0
    while outputIndex <= #outputQueue and emitted < 8 do
        print(outputQueue[outputIndex])
        outputIndex = outputIndex + 1
        emitted = emitted + 1
        if nowMs() - started >= DEADLINE_MS then break end
    end
    if outputIndex > #outputQueue then
        outputQueue = {}
        completed = true
        phase = "done"
    end
end

local function beginLiveProbe()
    local world = getWorld()
    local metaGrid = world and world:getMetaGrid() or nil
    local buildings = metaGrid and metaGrid:getBuildings() or nil
    local zones = metaGrid and metaGrid:getZones() or nil
    if world == nil or metaGrid == nil or buildings == nil or zones == nil then
        error("required world/meta-grid/building/zone API is unavailable")
    end
    local modCount, probeActive = activeModStatus()
    if modCount ~= 1 or not probeActive then error("probe must be the only active mod") end
    logEvent("ENVIRONMENT", {
        "gameVersion=" .. gameVersion(), "save=" .. currentSaveFolder(), "map=" .. safeString(world:getMap()),
        "activeModCount=" .. tostring(modCount), "probeActive=" .. boolText(probeActive),
    })
    logEvent("META_GRID", {
        "minX=" .. tostring(metaGrid:getMinX()), "minY=" .. tostring(metaGrid:getMinY()),
        "maxX=" .. tostring(metaGrid:getMaxX()), "maxY=" .. tostring(metaGrid:getMaxY()),
        "width=" .. tostring(metaGrid:getWidth()), "height=" .. tostring(metaGrid:getHeight()),
        "wasLoaded=" .. boolText(metaGrid:wasLoaded()),
    })
    state = {
        buildings = buildings, zones = zones, buildingIndex0 = 0, zoneIndex0 = 0, current = nil,
        buildingCount = 0, roomCount = 0, zoneCount = 0, records = 0, frames = 0,
        callbackTotalMs = 0, callbackPeakMs = 0, callbacksOver2Ms = 0,
        roomNames = {}, zoneNames = {}, zoneTypes = {}, semanticZoneBuckets = {},
        groundTruthLines = {}, groundTruthFound = 0,
        confusion = {
            police={TP=0,TN=0,FP=0,FN=0}, bookstore={TP=0,TN=0,FP=0,FN=0}, medical={TP=0,TN=0,FP=0,FN=0},
            office={TP=0,TN=0,FP=0,FN=0}, transmission={TP=0,TN=0,FP=0,FN=0},
        },
        candidateCounts = { police = 0, bookstore = 0, medical = 0, office = 0, transmission = 0 },
        zoneCandidateCounts = { police = 0, bookstore = 0, medical = 0, office = 0, transmission = 0 },
        samples = { police = {}, bookstore = {}, medical = {}, office = {}, transmission = {} },
        zoneSamples = { police = {}, bookstore = {}, medical = {}, office = {}, transmission = {} },
    }
    phase = "zones"
end

local function advanceProbe()
    if phase == "buildings" then
        processBounded(processBuildingRecord)
        if state.buildingIndex0 >= state.buildings:size() and state.current == nil then
            state.buildings = nil
            prepareOutput()
            phase = "output"
        end
    elseif phase == "zones" then
        processBounded(processZoneRecord)
        if state.zoneIndex0 >= state.zones:size() then
            state.zones = nil
            phase = "buildings"
        end
    elseif phase == "output" then emitBounded() end
end

local function onGameStart()
    if not isT3Save() then logEvent("SKIPPED", { "reason=current-save-is-not-T3" }); return end
    active = true
    local ok, err = pcall(beginLiveProbe)
    if not ok then failed = true; logEvent("PROBE_ERROR", { "phase=begin", "error=" .. safeString(err) }) end
end

local function onAutoContinueTick()
    if not autoContinuePending then return end
    autoContinueTicks = autoContinueTicks + 1
    if autoContinueTicks < 30 then return end
    local latest = getLatestSave and getLatestSave() or nil
    local saveName = latest and latest[1] or nil
    local gameMode = latest and latest[2] or nil
    if type(saveName) ~= "string" or not saveName:match("^T3_") then
        autoContinuePending = false
        logEvent("AUTO_CONTINUE_SKIPPED", { "reason=latest-save-is-not-T3" })
        return
    end
    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars or not MainScreen.continueLatestSave then return end
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
    if not active then return end
    if not completed and not failed then
        local ok, err = pcall(advanceProbe)
        if not ok then failed = true; logEvent("PROBE_ERROR", { "phase=" .. safeString(phase), "error=" .. safeString(err) }) end
        return
    end
    quitTicks = quitTicks + 1
    if quitTicks >= 120 then
        active = false
        logEvent("AUTO_QUIT", { "status=normal-quit-to-desktop-requested", "probeFailed=" .. boolText(failed) })
        getCore():quitToDesktop()
    end
end

T3.roomSignals = roomSignals
T3.zoneSignals = zoneSignals

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)

logEvent("SCRIPT_LOADED", { "gameVersion=" .. gameVersion() })
