local Core = require("ConspiracyFiles/init")

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.Runtime = ConspiracyFiles.Runtime or {}
local Runtime = ConspiracyFiles.Runtime

local STATE_TAG = "ConspiracyFiles.DeadAir"
local PLACEMENT_TAG = "ConspiracyFiles.DeadAir.Placement"
local PREFIX = "[CF-DEAD-AIR]"
local SAMPLE_TICKS = 15
local LOCATION_ORDER = { Core.Content.ids.relay, Core.Content.ids.police, Core.Content.ids.motel }
local LOCATIONS = {
    [Core.Content.ids.relay] = { id = Core.Content.ids.relay, label = "electronics-store-relay", x1 = 10580, y1 = 9583, x2 = 10620, y2 = 9622 },
    [Core.Content.ids.police] = { id = Core.Content.ids.police, label = "muldraugh-police", x1 = 10625, y1 = 10395, x2 = 10650, y2 = 10425 },
    [Core.Content.ids.motel] = { id = Core.Content.ids.motel, label = "rourke-motel", x1 = 10642, y1 = 9820, x2 = 10656, y2 = 9834 },
}

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\n", " ")
end

local function log(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    for index = 1, #(fields or {}) do parts[#parts + 1] = fields[index] end
    print(table.concat(parts, "|"))
end

local function copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[key] = copy(child) end
    return result
end

local function replaceModData(tag, staged)
    local structureOk, structureError = Core.Validator.validateStructure(staged)
    if not structureOk then error("unsafe ModData for " .. tag .. ":" .. safe(structureError)) end
    if Core.Validator.estimateEncodedBytes(staged) > Core.Validator.MAX_ENCODED_BYTES then error("ModData size limit exceeded for " .. tag) end
    local stored = ModData.getOrCreate(tag)
    for key in pairs(stored) do stored[key] = nil end
    for key, value in pairs(staged) do stored[key] = copy(value) end
    return stored
end

local function saveState()
    if Runtime.state then
        local snapshot = Runtime.state.snapshot()
        local total = Core.Validator.estimateEncodedBytes(snapshot)
        if Runtime.placementPlan then total = total + Core.Validator.estimateEncodedBytes(Runtime.placementPlan) end
        if total > Core.Validator.MAX_ENCODED_BYTES then error("combined canonical ModData size limit exceeded") end
        Runtime.root = replaceModData(STATE_TAG, snapshot)
    end
end

local function savePlacements()
    local ok, message = Core.Placement.validate(Runtime.placementPlan)
    if not ok then error("placement-plan:" .. safe(message)) end
    local total = Core.Validator.estimateEncodedBytes(Runtime.placementPlan)
    if Runtime.state then total = total + Core.Validator.estimateEncodedBytes(Runtime.state.snapshot()) end
    if total > Core.Validator.MAX_ENCODED_BYTES then error("combined canonical ModData size limit exceeded") end
    Runtime.placementRoot = replaceModData(PLACEMENT_TAG, Runtime.placementPlan)
end

Runtime.persist = saveState

local function locationAt(player)
    if not player or math.floor(player:getZ()) ~= 0 then return nil end
    local x, y = player:getX(), player:getY()
    for _, locationId in ipairs(LOCATION_ORDER) do
        local location = LOCATIONS[locationId]
        if x >= location.x1 and x <= location.x2 and y >= location.y1 and y <= location.y2 then return location end
    end
    return nil
end

local function showLocationText(player, label)
    local message = "DEAD AIR: CORRECT LOCATION — " .. label
    local shown = false
    if HaloTextHelper and HaloTextHelper.addGoodText then shown = pcall(HaloTextHelper.addGoodText, player, message) end
    log("LOCATION_OVERLAY", { "shown=" .. tostring(shown), "text=" .. message })
end

local function permitsContainer(candidate, container)
    local containerType = container and container.getType and tostring(container:getType()) or ""
    for _, allowedType in ipairs(candidate.allowedContainerTypes or {}) do
        if containerType == allowedType then return true end
    end
    return false
end

local function containerEntries(candidate)
    local entries = {}
    for radius = 0, candidate.radius do
        for dx = -radius, radius do
            for dy = -radius, radius do
                if math.max(math.abs(dx), math.abs(dy)) == radius then
                    local x, y = candidate.x + dx, candidate.y + dy
                    local square = getCell():getGridSquare(x, y, candidate.z)
                    local objects = square and square:getObjects() or nil
                    if objects then
                        for objectIndex = 0, objects:size() - 1 do
                            local object = objects:get(objectIndex)
                            if object and object.getContainerCount then
                                for containerIndex = 0, object:getContainerCount() - 1 do
                                    local container = object:getContainerByIndex(containerIndex)
                                    if container and permitsContainer(candidate, container) then
                                        entries[#entries + 1] = { container = container, x = x, y = y,
                                            objectIndex = objectIndex, containerIndex = containerIndex }
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return entries
end

local function resolveContainer(assignment)
    local candidate = Core.Placement.resolveCandidate(assignment)
    if not candidate then return nil end
    local entries = containerEntries(candidate)
    return entries[candidate.containerOrdinal]
end

local function tokenCount(container, token)
    local count = 0
    local items = container and container.getItems and container:getItems() or nil
    if not items then return count end
    for index = 0, items:size() - 1 do
        local item = items:get(index)
        local md = item and item.getModData and item:getModData() or nil
        if md and md.cfPhysicalToken == token then count = count + 1 end
    end
    return count
end

local function createStampedItem(assignment)
    local asset = Core.Content.assets[assignment.assetId]
    local itemType = assignment.assetId == Core.Content.ids.key and "Base.KeyRing" or "Base.Note"
    local item = instanceItem(itemType)
    if not item then error(itemType .. " creation returned nil") end
    local md = item:getModData()
    md.cfAssetId = assignment.assetId
    md.cfAssetKind = asset.assetKind
    md.cfSchema = 1
    md.cfPhysicalToken = assignment.physicalToken
    md.cfResolvedTitle = asset.displayName
    md.cfFoundLocationId = assignment.locationId
    if asset.bodyText then md.cfResolvedBody = asset.bodyText end
    item:setName(asset.displayName)
    item:setCustomName(true)
    return item
end

local function commitPlaced(assignment, entry, reconciled)
    assignment.status = "placed"
    local ok, _, changed = Runtime.state.materialise(assignment.assetId)
    if not ok then error("domain materialisation failed for " .. assignment.assetId) end
    savePlacements()
    if changed then saveState() end
    log("PHYSICAL_PLACED", { "asset=" .. assignment.assetId, "candidate=" .. assignment.candidateId,
        "x=" .. tostring(entry.x), "y=" .. tostring(entry.y), "container=" .. safe(entry.container:getType()),
        "reconciled=" .. tostring(reconciled) })
end

local function attemptAssignment(assignment)
    if assignment.status ~= "pending" then return true end
    local entry = resolveContainer(assignment)
    if not entry then return false end
    local matches = tokenCount(entry.container, assignment.physicalToken)
    if matches > 1 then
        assignment.status = "conflict"
        savePlacements()
        log("PHYSICAL_CONFLICT", { "asset=" .. assignment.assetId, "candidate=" .. assignment.candidateId, "matches=" .. tostring(matches) })
        return true
    end
    if matches == 1 then commitPlaced(assignment, entry, true); return true end
    local item = createStampedItem(assignment)
    local added = entry.container:AddItem(item)
    if not added then error("target-container-add-returned-nil for " .. assignment.assetId) end
    if entry.container.setDrawDirty then entry.container:setDrawDirty(true) end
    commitPlaced(assignment, entry, false)
    return true
end

local function processLocation(locationId)
    local complete = true
    for _, assetId in ipairs(Core.Placement.assetsAt(locationId)) do
        local assignment = Runtime.placementPlan.assignments[assetId]
        if assignment.status == "pending" and not attemptAssignment(assignment) then complete = false end
    end
    Runtime.pendingLocations[locationId] = not complete
end

local function seedForNewSave(saveName)
    if isDebugEnabled and isDebugEnabled() then return Core.Placement.DEBUG_SEED end
    if ZombRand then
        local ok, value = pcall(ZombRand, 2147483646)
        if ok and type(value) == "number" then return value + 1 end
    end
    return Core.Placement.seedFromString(saveName)
end

local function initializePlacement(saveName)
    local stored = ModData.getOrCreate(PLACEMENT_TAG)
    if next(stored) ~= nil then
        local restored, message = Core.Placement.restore(stored)
        if not restored then error("stored placement plan invalid:" .. safe(message)) end
        Runtime.placementPlan = restored
    else
        Runtime.placementPlan = Core.Placement.newPlan(seedForNewSave(saveName))
        savePlacements()
    end
    -- LoadGridsquare and the player's current location enqueue only bounded,
    -- relevant work. Keeping unloaded locations out prevents one unavailable
    -- region from starving a location the player actually visits first.
    Runtime.pendingLocations = {}
end

local function reconcileDomainMaterialisation()
    local changed = false
    for assetId, assignment in pairs(Runtime.placementPlan.assignments) do
        if assignment.status == "placed" then
            local ok, _, assetChanged = Runtime.state.materialise(assetId)
            if not ok then error("domain materialisation recovery failed for " .. assetId) end
            changed = changed or assetChanged
        end
    end
    if changed then saveState() end
end

function Runtime.placementSummary()
    if not Runtime.placementPlan then return nil end
    return copy(Runtime.placementPlan)
end

function Runtime.allPlacementsSettled()
    if not Runtime.placementPlan then return false end
    for _, assignment in pairs(Runtime.placementPlan.assignments) do
        if assignment.status ~= "placed" then return false end
    end
    return true
end

function Runtime.requestAllPlacements()
    if not Runtime.pendingLocations then return end
    for _, locationId in ipairs(LOCATION_ORDER) do Runtime.pendingLocations[locationId] = true end
end

local function initialize()
    local save = getCurrentSaveName and getCurrentSaveName() or "<unknown>"
    if isClient and isClient() then log("DISABLED", { "reason=multiplayer", "save=" .. safe(save) }); return false end
    local stored = ModData.getOrCreate(STATE_TAG)
    local state, err = Core.ThreadState.new(stored.schemaVersion and stored or nil)
    if not state then error("state-init:" .. safe(err)) end
    Runtime.state, Runtime.root, Runtime.ticks, Runtime.lastLocation = state, stored, 0, nil
    initializePlacement(save)
    reconcileDomainMaterialisation()
    log("START", { "save=" .. safe(save), "gameVersion=" .. safe(getGameVersion()), "build=42.20.4",
        "placementSeed=" .. tostring(Runtime.placementPlan.seed) })
    log("READY", { "contentRevision=" .. safe(Core.Content.thread.contentRevision),
        "stateEvidence=" .. tostring(#state.snapshot().evidence), "placements=7" })
    return true
end

local function onGameStart()
    local ok, err = pcall(initialize)
    if not ok then log("ERROR", { "boundary=init", "error=" .. safe(err) }); Runtime.disabled = true end
end

local function onLoadGridSquare(square)
    if Runtime.disabled or not Runtime.pendingLocations or not square then return end
    local x, y, z = square:getX(), square:getY(), square:getZ()
    if z ~= 0 then return end
    for _, locationId in ipairs(LOCATION_ORDER) do
        local location = LOCATIONS[locationId]
        if x >= location.x1 and x <= location.x2 and y >= location.y1 and y <= location.y2 then
            Runtime.pendingLocations[locationId] = true
        end
    end
end

local function onTick()
    if Runtime.disabled or not Runtime.state then return end
    Runtime.ticks = Runtime.ticks + 1
    if Runtime.ticks % SAMPLE_TICKS ~= 0 then return end
    local ok, err = pcall(function()
        local player = getPlayer()
        local location = locationAt(player)
        if location then
            if location.id ~= Runtime.lastLocation then
                Runtime.lastLocation = location.id
                showLocationText(player, location.label)
                local success, _, changed = Runtime.state.confirmLocation(location.id)
                if success and changed then
                    saveState()
                    log("LOCATION_CONFIRMED", { "location=" .. location.label, "x=" .. tostring(math.floor(player:getX())),
                        "y=" .. tostring(math.floor(player:getY())) })
                end
            end
            Runtime.pendingLocations[location.id] = true
        else
            Runtime.lastLocation = nil
        end
        for _, locationId in ipairs(LOCATION_ORDER) do
            if Runtime.pendingLocations[locationId] then processLocation(locationId); break end
        end
    end)
    if not ok then log("ERROR", { "boundary=tick", "error=" .. safe(err) }); Runtime.disabled = true end
end

Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onTick)
Events.LoadGridsquare.Add(onLoadGridSquare)
log("SCRIPT_LOADED", { "module=runtime" })

return Runtime
