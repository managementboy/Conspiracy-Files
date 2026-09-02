local CF = require("ConspiracyFiles")
local ids = CF.Content.ids

local function makeStorage(initial)
    local roots = {}
    if initial then roots[CF.PersistenceAdapter.DEFAULT_TAG] = initial end
    return {
        roots = roots,
        get = function(tag) return roots[tag] end,
        replace = function(tag, root) roots[tag] = root end
    }
end

local itemPort = {
    modData = function(item) return item.modData end,
    setName = function(item, name) item.name = name end,
    setCustomName = function(item, value) item.customName = value end
}

local function makeWorld()
    local world = {
        containers = {}, status = {}, externalMatches = {}, coverage = "incomplete",
        created = 0, addFaultAfterInsert = false, player = nil, arrivalDrift = false
    }
    for _, location in pairs(CF.LocationBindings.locations) do
        for assetId, binding in pairs(location.placements) do
            world.containers[assetId] = { items = {}, binding = binding }
            world.status[assetId] = "available"
        end
    end
    local function assetForBinding(binding)
        for assetId, container in pairs(world.containers) do if container.binding == binding then return assetId end end
    end
    function world.saveIdentity() return "Sandbox/DeadAir-World-A" end
    function world.squareCoordinates(square) return square.x, square.y, square.z end
    function world.resolvePlacement(binding)
        local assetId = assetForBinding(binding)
        local status = world.status[assetId]
        if status == "available" then
            return {
                status = "available", target = world.containers[assetId],
                location = { kind = "placement-container", x = binding.x, y = binding.y, z = binding.z, containerType = binding.containerType }
            }
        end
        if status == "binding-drift" then return { status = status, reason = "fake signature changed" } end
        return { status = status }
    end
    function world.items(container) return container.items end
    function world.createItem(itemType)
        world.created = world.created + 1
        return { itemType = itemType, modData = {}, instance = world.created }
    end
    function world.addItem(container, item)
        container.items[#container.items + 1] = item
        if world.addFaultAfterInsert then
            world.addFaultAfterInsert = false
            error("interrupted after add")
        end
        return item
    end
    function world.scanPhysical(token)
        local matches, seen = {}, {}
        for assetId, container in pairs(world.containers) do
            for _, item in ipairs(container.items) do
                if item.modData[CF.ItemProjection.fields.physicalItemId] == token and not seen[item] then
                    seen[item] = true
                    matches[#matches + 1] = { item = item, location = { kind = "placement-container", containerType = container.binding.containerType } }
                end
            end
        end
        for _, match in ipairs(world.externalMatches) do
            if match.item.modData[CF.ItemProjection.fields.physicalItemId] == token and not seen[match.item] then
                seen[match.item] = true
                matches[#matches + 1] = match
            end
        end
        return { matches = matches, coverage = world.coverage, lossConfirmed = world.lossConfirmed == true }
    end
    function world.playerSquare() return world.player end
    function world.squareKey(square) return square.x .. ":" .. square.y .. ":" .. square.z end
    function world.matchesArrival(arrival, square)
        if world.arrivalDrift then return false, "binding-drift" end
        local locationId
        for candidateId, binding in pairs(CF.LocationBindings.locations) do if binding.arrival == arrival then locationId = candidateId end end
        return square.locationId == locationId and square.z >= arrival.bounds.minZ and square.z <= arrival.bounds.maxZ
    end
    return world
end

local function loadedPlacement(world, initial)
    local storage = makeStorage(initial)
    local persistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(persistence.load(initial == nil))
    local placement = CF.PlacementAdapter.new({ persistence = persistence, world = world, itemPort = itemPort })
    placement.initialize(world.saveIdentity())
    return placement, persistence, storage
end

local function countToken(container, token)
    local count = 0
    for _, item in ipairs(container.items) do
        if item.modData[CF.ItemProjection.fields.physicalItemId] == token then count = count + 1 end
    end
    return count
end

local function discover(persistence, assetId)
    local ok, result = persistence.transaction(function(state)
        return state.discover(assetId, "fake discovery", CF.Content.assets[assetId].placementLocationId)
    end)
    assertTrue(ok, result)
end

test("offline E06 item projection stores exact durable name/title/description/body for D1-D6", function()
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do
        local asset = CF.Content.assets[assetId]
        local item = { modData = {} }
        local token = "cf:test:" .. assetId
        local ok, payload = CF.ItemProjection.apply(item, assetId, token, itemPort)
        assertTrue(ok, payload)
        assertEqual("Base.Note", payload.itemType)
        assertEqual(asset.displayName, item.name)
        assertTrue(item.customName)
        assertEqual(1, item.modData[CF.ItemProjection.fields.schema])
        assertEqual(token, item.modData[CF.ItemProjection.fields.physicalItemId])
        assertEqual(assetId, item.modData[CF.ItemProjection.fields.assetId])
        assertEqual(asset.displayName, item.modData[CF.ItemProjection.fields.title])
        assertEqual(asset.descriptionText, item.modData[CF.ItemProjection.fields.description])
        assertEqual(asset.bodyText, item.modData[CF.ItemProjection.fields.body])
        assertEqual(nil, item.description)
        assertEqual(nil, item.printMedia)
    end
end)

test("integrated E06 world-projected documents satisfy the Inspect presentation contract", function()
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do
        local asset = CF.Content.assets[assetId]
        local item = { modData = {} }
        function item:getModData() return self.modData end
        function item:getDisplayName() return self.name end
        local token = "cf:integrated:" .. assetId
        local ok, detail = CF.ItemProjection.apply(item, assetId, token, itemPort)
        assertTrue(ok, detail)
        local subject, message = CF.ItemPresentation.validate(item, function(candidate) return candidate == item end)
        assertTrue(subject ~= nil, message)
        assertEqual(assetId, subject.assetId)
        assertEqual(asset.displayName, subject.title)
        assertEqual(asset.descriptionText, subject.description)
        assertEqual(asset.bodyText, subject.body)
        assertEqual(token, subject.physicalToken)
    end
end)

test("offline E02 placement repairs an interrupted post-add ledger without duplicating D1", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    world.addFaultAfterInsert = true
    local ok = pcall(function() placement.reconcile(ids.d1) end)
    assertFalse(ok)
    local record = persistence.snapshot().assetMaterialisation[ids.d1]
    assertEqual("placing", record.state)
    assertEqual(1, countToken(world.containers[ids.d1], record.physicalItemId))
    assertEqual("placed", placement.reconcile(ids.d1))
    record = persistence.snapshot().assetMaterialisation[ids.d1]
    assertEqual("placed", record.state)
    assertEqual("available", record.physicalAvailability)
    assertEqual(1, countToken(world.containers[ids.d1], record.physicalItemId))
    assertEqual("placed", placement.reconcile(ids.d1))
    assertEqual(1, countToken(world.containers[ids.d1], record.physicalItemId))
end)

test("offline E02/E04 repeated availability places every document once with exact accepted containers", function()
    local world = makeWorld()
    local placement, persistence, storage = loadedPlacement(world)
    for pass = 1, 4 do
        for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do assertEqual("placed", placement.reconcile(assetId)) end
    end
    assertEqual(6, world.created)
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do
        local record = persistence.snapshot().assetMaterialisation[assetId]
        assertEqual("placed", record.state)
        assertEqual(1, countToken(world.containers[assetId], record.physicalItemId))
        assertEqual(assetId, world.containers[assetId].items[1].modData[CF.ItemProjection.fields.assetId])
    end
    local beforeReload = persistence.snapshot()
    local reloadedPersistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(reloadedPersistence.load(false))
    local reloadedPlacement = CF.PlacementAdapter.new({ persistence = reloadedPersistence, world = world, itemPort = itemPort })
    reloadedPlacement.initialize(world.saveIdentity())
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do assertEqual("placed", reloadedPlacement.reconcile(assetId)) end
    assertEqual(6, world.created)
    assertDeepEqual(beforeReload, reloadedPersistence.snapshot())
end)

test("offline E02 binding unload is pending and binding drift fails closed without world mutation", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    world.status[ids.d1] = "unloaded"
    assertEqual("unloaded", placement.reconcile(ids.d1))
    assertEqual("pending", persistence.snapshot().assetMaterialisation[ids.d1].state)
    assertEqual(0, world.created)
    world.status[ids.d1] = "binding-drift"
    local ok, message = pcall(function() placement.reconcile(ids.d1) end)
    assertFalse(ok)
    assertTrue(string.find(tostring(message), "binding drift", 1, true) ~= nil)
    assertEqual("pending", persistence.snapshot().assetMaterialisation[ids.d1].state)
    assertEqual(0, world.created)
end)

test("offline E03 terminal and conclusive D1 loss activate fallback once without suppressing D3-D6", function()
    local terminalWorld = makeWorld()
    local terminal, terminalPersistence = loadedPlacement(terminalWorld)
    terminalWorld.status[ids.d1] = "terminal-unavailable"
    assertEqual("unavailable", terminal.reconcile(ids.d1))
    assertEqual(nil, terminalPersistence.snapshot().entryOpportunityUsed)
    assertEqual("placed", terminal.reconcile(ids.d2))
    assertEqual("fallback", terminalPersistence.snapshot().entryOpportunityUsed)
    for _, assetId in ipairs({ ids.d3, ids.d4, ids.d5, ids.d6 }) do assertEqual("placed", terminal.reconcile(assetId)) end
    assertEqual("unavailable", terminal.reconcile(ids.d1))
    assertEqual(5, terminalWorld.created)

    local lossWorld = makeWorld()
    local placement, persistence = loadedPlacement(lossWorld)
    placement.reconcile(ids.d1)
    placement.reconcile(ids.d2)
    local d1 = persistence.snapshot().assetMaterialisation[ids.d1]
    lossWorld.containers[ids.d1].items = {}
    lossWorld.coverage = "incomplete"
    assertEqual("unknown", placement.reconcile(ids.d1))
    assertEqual(nil, persistence.snapshot().entryOpportunityUsed)
    lossWorld.coverage = "complete"
    assertEqual("unavailable", placement.reconcile(ids.d1))
    assertEqual("fallback", persistence.snapshot().entryOpportunityUsed)
    assertEqual(0, countToken(lossWorld.containers[ids.d1], d1.physicalItemId))
    assertEqual("unavailable", placement.reconcile(ids.d1))
    assertEqual(2, lossWorld.created)
end)

test("offline E03 D1 discovery fixes anchor and conflict/unknown never select fallback", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    placement.reconcile(ids.d1)
    placement.reconcile(ids.d2)
    discover(persistence, ids.d1)
    local record = persistence.snapshot().assetMaterialisation[ids.d1]
    world.containers[ids.d1].items = {}
    world.coverage = "complete"
    assertEqual("unavailable", placement.reconcile(ids.d1))
    assertEqual("anchor", persistence.snapshot().entryOpportunityUsed)

    local conflictWorld = makeWorld()
    local conflict, conflictPersistence = loadedPlacement(conflictWorld)
    conflict.reconcile(ids.d1)
    conflict.reconcile(ids.d2)
    local original = conflictWorld.containers[ids.d1].items[1]
    local duplicate = { modData = {} }
    for key, value in pairs(original.modData) do duplicate.modData[key] = value end
    conflictWorld.containers[ids.d1].items[#conflictWorld.containers[ids.d1].items + 1] = duplicate
    assertEqual("conflict", conflict.reconcile(ids.d1))
    assertEqual(nil, conflictPersistence.snapshot().entryOpportunityUsed)
    conflictWorld.containers[ids.d1].items = { original }
    assertEqual("conflict", conflict.reconcile(ids.d1))
    assertEqual("conflict", conflictPersistence.snapshot().assetMaterialisation[ids.d1].physicalAvailability)
end)

test("offline E05 identity reconciliation tracks moves conservatively and permits uncompromised reappearance", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    placement.reconcile(ids.d3)
    local item = world.containers[ids.d3].items[1]
    world.containers[ids.d3].items = {}
    world.coverage = "incomplete"
    assertEqual("unknown", placement.reconcileIdentity(ids.d3))
    world.externalMatches = { { item = item, location = { kind = "vehicle", vehicleId = "17", vehiclePartId = "TruckBed" } } }
    assertEqual("available", placement.reconcileIdentity(ids.d3))
    local record = persistence.snapshot().assetMaterialisation[ids.d3]
    assertEqual("vehicle", record.lastKnownPhysicalLocation.kind)
    world.externalMatches = {}
    world.coverage = "complete"
    assertEqual("unavailable", placement.reconcileIdentity(ids.d3))
    world.externalMatches = { { item = item, location = { kind = "player-inventory" } } }
    world.coverage = "incomplete"
    assertEqual("available", placement.reconcileIdentity(ids.d3))
    assertEqual("player-inventory", persistence.snapshot().assetMaterialisation[ids.d3].lastKnownPhysicalLocation.kind)
end)

test("offline E05 no-token tracking is untracked and duplicate-token conflict is sticky", function()
    local storage = makeStorage()
    local persistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(persistence.load(true))
    assertTrue(persistence.transaction(function(state)
        local ok, result = state.ensureMaterialisation(ids.d4, nil)
        if not ok then error(result) end
        return state.completePlacement(ids.d4, { kind = "domain" })
    end))
    local identity = CF.PhysicalIdentity.new({ persistence = persistence })
    assertTrue(identity.observe(ids.d4, { matches = {}, coverage = "complete" }))
    assertEqual("untracked", persistence.snapshot().assetMaterialisation[ids.d4].physicalAvailability)
end)

test("offline E07 arrival arms only known leads and confirms a whole building once after two stable samples", function()
    local world = makeWorld()
    local storage = makeStorage()
    local persistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(persistence.load(true))
    local arrival = CF.ArrivalAdapter.new({ persistence = persistence, world = world })
    world.player = { x = 13570, y = 1580, z = 3, locationId = ids.relay }
    assertEqual(0, arrival.poll())
    assertEqual(0, arrival.poll())
    discover(persistence, ids.d2)
    assertEqual(0, arrival.poll())
    assertEqual(1, arrival.poll())
    assertEqual(ids.relay, persistence.snapshot().confirmedLocationIds[1])
    assertEqual(0, arrival.poll())
    world.player = { x = 1, y = 1, z = 0 }
    arrival.poll()
    world.player = { x = 13570, y = 1580, z = 3, locationId = ids.relay }
    assertEqual(0, arrival.poll())
    assertEqual(0, arrival.poll())
    local count = 0
    for _, entry in ipairs(persistence.snapshot().journal) do if entry.kind == "location-confirmed" then count = count + 1 end end
    assertEqual(1, count)
end)

test("offline E07 wrong level, unstable squares, reload-inside, and drift remain fail-closed/idempotent", function()
    local world = makeWorld()
    local storage = makeStorage()
    local persistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(persistence.load(true))
    discover(persistence, ids.d2)
    local arrival = CF.ArrivalAdapter.new({ persistence = persistence, world = world })
    world.player = { x = 13570, y = 1580, z = 4, locationId = ids.relay }
    arrival.poll(); arrival.poll()
    assertEqual(0, #persistence.snapshot().confirmedLocationIds)
    world.player = { x = 13570, y = 1580, z = 1, locationId = ids.relay }
    arrival.poll()
    world.player = { x = 13571, y = 1580, z = 1, locationId = ids.relay }
    assertEqual(0, arrival.poll())
    assertEqual(1, arrival.poll())
    local reloaded = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(reloaded.load(false))
    local afterReload = CF.ArrivalAdapter.new({ persistence = reloaded, world = world })
    assertEqual(0, afterReload.poll())
    assertEqual(0, afterReload.poll())
    assertEqual(1, #reloaded.snapshot().confirmedLocationIds)

    local driftWorld = makeWorld()
    local driftStorage = makeStorage()
    local driftPersistence = CF.PersistenceAdapter.new({ storage = driftStorage })
    assertTrue(driftPersistence.load(true))
    discover(driftPersistence, ids.d2)
    driftWorld.player = { x = 13570, y = 1580, z = 1, locationId = ids.relay }
    driftWorld.arrivalDrift = true
    local driftArrival = CF.ArrivalAdapter.new({ persistence = driftPersistence, world = driftWorld })
    local ok, message = pcall(function() driftArrival.poll() end)
    assertFalse(ok)
    assertTrue(string.find(tostring(message), "binding drift", 1, true) ~= nil)
    assertEqual(0, #driftPersistence.snapshot().confirmedLocationIds)
end)

test("offline world runtime reuses additive hooks and bounded scheduler for placement, identity, and arrival", function()
    local world = makeWorld()
    local storage = makeStorage()
    local callbacks, reports = {}, {}
    local runtime = CF.IntegrationRuntime.start({
        isMultiplayer = function() return false end,
        report = function(message) reports[#reports + 1] = message end,
        storage = storage,
        world = world,
        itemPort = itemPort,
        clock = function() return 0 end,
        addEvent = function(name, callback) callbacks[name] = callback end
    })
    assertTrue(runtime.enabled)
    local d1Binding = CF.LocationBindings.locations[ids.relay].placements[ids.d1]
    callbacks.LoadGridsquare({ x = d1Binding.x, y = d1Binding.y, z = d1Binding.z })
    assertEqual(1, runtime.scheduler.size())
    callbacks.OnTick()
    assertEqual(1, runtime.scheduler.size(), "pre-start target wake-up must wait for canonical initialization")
    callbacks.OnInitGlobalModData(true)
    callbacks.OnGameStart()
    assertEqual(6, runtime.scheduler.size())
    callbacks.OnTick()
    assertEqual(6, world.created)
    assertEqual(0, runtime.scheduler.size())
    discover(runtime.persistence, ids.d2)
    world.player = { x = 13570, y = 1580, z = 2, locationId = ids.relay }
    for _ = 1, 30 do callbacks.OnTick() end
    assertEqual(ids.relay, runtime.persistence.snapshot().confirmedLocationIds[1])
    assertEqual(0, #reports)
    assertDeepEqual({ maxWorkPerDrain = 24, maxQueued = 256, maxMillis = 1 }, runtime.scheduler.limits())
end)

test("offline physical tokens are deterministic within a save and distinct across saves/assets", function()
    local scopeA = CF.PhysicalToken.scope("Sandbox/DeadAir-A")
    local scopeA2 = CF.PhysicalToken.scope("Sandbox/DeadAir-A")
    local scopeB = CF.PhysicalToken.scope("Sandbox/DeadAir-B")
    assertEqual(scopeA, scopeA2)
    assertFalse(scopeA == scopeB)
    assertFalse(CF.PhysicalToken.forAsset(scopeA, ids.d1) == CF.PhysicalToken.forAsset(scopeA, ids.d2))
    assertFalse(CF.PhysicalToken.forAsset(scopeA, ids.d1) == CF.PhysicalToken.forAsset(scopeB, ids.d1))
end)

test("offline PZ port resolves exact object/building signatures and fails closed on drift", function()
    local old = {
        getCell = rawget(_G, "getCell"), getPlayer = rawget(_G, "getPlayer"),
        getCurrentSaveName = rawget(_G, "getCurrentSaveName"), instanceItem = rawget(_G, "instanceItem")
    }
    local function javaList(values)
        return { size = function() return #values end, get = function(_, index) return values[index + 1] end }
    end
    local items = {}
    local container = {
        getItems = function() return javaList(items) end,
        getType = function() return "metal_shelves" end,
        AddItem = function(_, item) items[#items + 1] = item; return item end,
        setDrawDirty = function() end
    }
    local spriteName = "furniture_shelving_01_26"
    local object = {
        getSprite = function() return { getName = function() return spriteName end } end,
        getContainerCount = function() return 1 end,
        getContainerByIndex = function(_, index) if index == 0 then return container end end
    }
    local filler = {
        getSprite = function() return { getName = function() return "filler" end } end,
        getContainerCount = function() return 0 end
    }
    local relayArrival = CF.LocationBindings.locations[ids.relay].arrival
    local buildingDef = {
        getX = function() return relayArrival.bounds.minX end,
        getY = function() return relayArrival.bounds.minY end,
        getX2 = function() return relayArrival.bounds.maxX end,
        getY2 = function() return relayArrival.bounds.maxY end,
        getRooms = function() return { size = function() return relayArrival.expectedRoomCount end } end
    }
    local function square(x, y, z, room, objects)
        return {
            getX = function() return x end, getY = function() return y end, getZ = function() return z end,
            getRoom = function() return { getRoomDef = function() return { getName = function() return room end } end } end,
            getBuilding = function() return { getDef = function() return buildingDef end } end,
            getObjects = function() return javaList(objects or {}) end,
            getWorldObjects = function() return javaList({}) end,
            getStaticMovingObjects = function() return javaList({}) end
        }
    end
    local binding = CF.LocationBindings.locations[ids.relay].placements[ids.d1]
    local target = square(binding.x, binding.y, binding.z, binding.room, { filler, filler, object })
    local reference = square(relayArrival.referenceSquare.x, relayArrival.referenceSquare.y, relayArrival.referenceSquare.z, relayArrival.expectedRoom, {})
    local playerSquare = square(13570, 1580, 3, "communications", {})
    local squares = {
        [binding.x .. ":" .. binding.y .. ":" .. binding.z] = target,
        [relayArrival.referenceSquare.x .. ":" .. relayArrival.referenceSquare.y .. ":" .. relayArrival.referenceSquare.z] = reference
    }
    local cell = {
        getGridSquare = function(_, x, y, z) return squares[x .. ":" .. y .. ":" .. z] end,
        getVehicles = function() return javaList({}) end
    }
    _G.getCell = function() return cell end
    _G.getPlayer = function() return nil end
    _G.getCurrentSaveName = function() return "Sandbox/PZ-Port-Fake" end
    _G.instanceItem = function(itemType)
        local item = { itemType = itemType, md = {} }
        function item:getModData() return self.md end
        function item:setName(name) self.name = name end
        function item:setCustomName(value) self.customName = value end
        return item
    end
    local ok, message = pcall(function()
        local environment = require("ConspiracyFiles/Adapters/PZ").environment()
        local resolved = environment.world.resolvePlacement(binding)
        assertEqual("available", resolved.status)
        local item = environment.world.createItem("Base.Note")
        assertTrue(CF.ItemProjection.apply(item, ids.d1, "cf:pz-port:d1", environment.itemPort))
        assertEqual(item, environment.world.addItem(resolved.target, item))
        assertEqual(1, #environment.world.items(resolved.target))
        assertTrue(environment.world.matchesArrival(relayArrival, playerSquare))
        spriteName = "changed_sprite"
        assertEqual("binding-drift", environment.world.resolvePlacement(binding).status)
        spriteName = "furniture_shelving_01_26"
        local originalReference = reference
        reference = square(relayArrival.referenceSquare.x, relayArrival.referenceSquare.y, relayArrival.referenceSquare.z, "changed-room", {})
        squares[relayArrival.referenceSquare.x .. ":" .. relayArrival.referenceSquare.y .. ":" .. relayArrival.referenceSquare.z] = reference
        local matched, reason = environment.world.matchesArrival(relayArrival, playerSquare)
        assertFalse(matched)
        assertEqual("binding-drift", reason)
        reference = originalReference
    end)
    _G.getCell = old.getCell
    _G.getPlayer = old.getPlayer
    _G.getCurrentSaveName = old.getCurrentSaveName
    _G.instanceItem = old.instanceItem
    assertTrue(ok, message)
end)
