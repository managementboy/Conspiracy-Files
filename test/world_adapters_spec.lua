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
    setCustomName = function(item, value) item.customName = value end,
    displayName = function(item) return item.name end,
    itemType = function(item) return item.itemType end
}

local function copyTable(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[copyTable(key)] = copyTable(child) end
    return result
end

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
    function world.scanPhysical(context)
        local assetId = context and context.assetId
        local identityGateway = context and context.identityGateway
        local matches, collisions, seen = {}, {}, {}
        local function observe(item, location, authoredTarget)
            if seen[item] then return end
            local verification = identityGateway.verify(item, assetId, { authoredTarget = authoredTarget == true })
            if verification.status == "verified" then
                seen[item] = true
                matches[#matches + 1] = { item = item, identity = verification.identity, location = location }
            elseif verification.status == "collision" or verification.status == "rejected" then
                seen[item] = true
                collisions[#collisions + 1] = {
                    item = item, identity = verification.identity, reason = verification.reason, location = location
                }
            end
        end
        for containerAssetId, container in pairs(world.containers) do
            for _, item in ipairs(container.items) do
                observe(item, { kind = "placement-container", containerType = container.binding.containerType },
                    containerAssetId == assetId)
            end
        end
        for _, match in ipairs(world.externalMatches) do
            observe(match.item, match.location)
        end
        return {
            matches = matches, collisions = collisions,
            coverage = world.coverage, lossConfirmed = world.lossConfirmed == true
        }
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
        if CF.ItemProjection.token(item, itemPort) == token then count = count + 1 end
    end
    return count
end

local function discover(persistence, assetId)
    local ok, result = persistence.transaction(function(state)
        if assetId == ids.d2 and state.snapshot().entryOpportunityUsed == nil then
            local snapshot = state.snapshot()
            local accepted, detail
            if snapshot.assetMaterialisation[ids.d1] == nil then
                accepted, detail = state.ensureMaterialisation(ids.d1)
                if not accepted then return false, detail end
                snapshot = state.snapshot()
            end
            if snapshot.assetMaterialisation[ids.d2] == nil then
                accepted, detail = state.ensureMaterialisation(ids.d2)
                if not accepted then return false, detail end
                snapshot = state.snapshot()
            end
            if snapshot.assetMaterialisation[ids.d1] == "placed" then
                accepted, detail = state.reconcilePhysical(ids.d1, "unavailable")
            else
                accepted, detail = state.markPlacementUnavailable(ids.d1)
            end
            if not accepted then return false, detail end
            snapshot = state.snapshot()
            if snapshot.assetMaterialisation[ids.d2] ~= "placed" then
                accepted, detail = state.completePlacement(ids.d2)
                if not accepted then return false, detail end
            end
        end
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
        local nested = item.modData[CF.ItemPresentation.MOD_DATA_KEY]
        assertEqual(1, nested.schemaVersion)
        assertEqual(token, nested.physicalToken)
        assertEqual(assetId, nested.assetId)
        assertEqual(asset.displayName, nested.resolvedTitle)
        assertEqual(asset.descriptionText, nested.resolvedDescription)
        assertEqual(asset.bodyText, nested.resolvedBody)
        for _, legacyKey in pairs(CF.ItemProjection.fields) do assertEqual(nil, item.modData[legacyKey]) end
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
    assertEqual("placing", persistence.snapshot().assetMaterialisation[ids.d1])
    local token = placement.tokenFor(ids.d1)
    assertEqual(1, countToken(world.containers[ids.d1], token))
    assertEqual("placed", placement.reconcile(ids.d1))
    assertEqual("placed", persistence.snapshot().assetMaterialisation[ids.d1])
    assertEqual("available", persistence.snapshot().physicalAvailability[ids.d1])
    assertEqual(1, countToken(world.containers[ids.d1], token))
    assertEqual("placed", placement.reconcile(ids.d1))
    assertEqual(1, countToken(world.containers[ids.d1], token))
end)

test("offline E02/E04 repeated availability places every document once with exact accepted containers", function()
    local world = makeWorld()
    local placement, persistence, storage = loadedPlacement(world)
    for pass = 1, 4 do
        for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do assertEqual("placed", placement.reconcile(assetId)) end
    end
    assertEqual(6, world.created)
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do
        assertEqual("placed", persistence.snapshot().assetMaterialisation[assetId])
        assertEqual(1, countToken(world.containers[assetId], placement.tokenFor(assetId)))
        assertEqual(assetId, world.containers[assetId].items[1].modData.ConspiracyFiles.assetId)
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

test("offline E04 existing legacy item refreshes compatible text in place without identity replacement", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    local assetId = ids.d1
    local asset = CF.Content.assets[assetId]
    local token = placement.tokenFor(assetId)
    local fields = CF.ItemProjection.fields
    local old = {
        instance = "existing-old-item",
        name = "Old service ticket title",
        customName = true,
        modData = {
            ConspiracyFiles = {
                schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
                contentRevision = "dead-air-r0-compatible-text",
                assetId = assetId,
                revealed = true,
                resolvedTitle = "Old service ticket title",
                resolvedDescription = "Old description",
                resolvedBody = "Old compatible body",
                physicalToken = token
            }
        }
    }
    old.modData[fields.schema] = CF.ItemPresentation.SCHEMA_VERSION
    old.modData[fields.physicalItemId] = token
    old.modData[fields.assetId] = assetId
    old.modData[fields.title] = "Old service ticket title"
    old.modData[fields.description] = "Old description"
    old.modData[fields.body] = "Old compatible body"
    world.containers[assetId].items = { old }

    assertEqual("placed", placement.reconcile(assetId))
    assertEqual(0, world.created)
    assertEqual(old, world.containers[assetId].items[1])
    assertEqual(token, CF.ItemProjection.token(old, itemPort))
    assertEqual("placed", persistence.snapshot().assetMaterialisation[assetId])
    assertEqual(CF.Content.thread.contentRevision, old.modData.ConspiracyFiles.contentRevision)
    assertEqual(asset.displayName, old.name)
    assertEqual(asset.displayName, old.modData.ConspiracyFiles.resolvedTitle)
    assertEqual(asset.descriptionText, old.modData.ConspiracyFiles.resolvedDescription)
    assertEqual(asset.bodyText, old.modData.ConspiracyFiles.resolvedBody)
    assertEqual(token, old.modData[fields.physicalItemId])
    assertEqual(asset.displayName, old.modData[fields.title])
    assertEqual(asset.bodyText, old.modData[fields.body])
end)

test("offline E04 malformed carrier claiming the target token fails closed without duplication", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    local assetId = ids.d1
    local token = placement.tokenFor(assetId)
    local item = { modData = {} }
    assertTrue(CF.ItemProjection.apply(item, assetId, token, itemPort))
    local fields = CF.ItemProjection.fields
    local nested = item.modData.ConspiracyFiles
    item.modData[fields.schema] = nested.schemaVersion
    item.modData[fields.physicalItemId] = "cf:tampered:different-token"
    item.modData[fields.assetId] = nested.assetId
    item.modData[fields.title] = nested.resolvedTitle
    item.modData[fields.description] = nested.resolvedDescription
    item.modData[fields.body] = nested.resolvedBody
    world.containers[assetId].items = { item }

    local ok, message = pcall(function() placement.reconcile(assetId) end)
    assertFalse(ok)
    assertTrue(string.find(tostring(message), "canonical Asset/token gateway", 1, true) ~= nil)
    assertEqual(0, world.created)
    assertEqual("pending", persistence.snapshot().assetMaterialisation[assetId])
    assertEqual(1, #world.containers[assetId].items)
end)

test("offline E02/E04 every Asset rejects one-sided, flat-only, unknown, incompatible, and conflicting carriers", function()
    local cases = {
        { assetId = ids.d1, shape = "asset-only" },
        { assetId = ids.d2, shape = "token-only" },
        { assetId = ids.d3, shape = "flat-only" },
        { assetId = ids.d4, shape = "unknown-asset" },
        { assetId = ids.d5, shape = "incompatible-schema" },
        { assetId = ids.d6, shape = "invalid-revision" },
        { assetId = ids.key, shape = "conflicting-mirror" }
    }
    for _, candidate in ipairs(cases) do
        local world = makeWorld()
        local placement, persistence = loadedPlacement(world)
        local token = placement.tokenFor(candidate.assetId)
        local item = { modData = {} }
        assertTrue(CF.ItemProjection.apply(item, candidate.assetId, token, itemPort))
        local nested = item.modData.ConspiracyFiles
        local fields = CF.ItemProjection.fields
        if candidate.shape == "asset-only" then
            nested.physicalToken = nil
        elseif candidate.shape == "token-only" then
            nested.assetId = nil
        elseif candidate.shape == "flat-only" then
            item.modData[fields.schema] = nested.schemaVersion
            item.modData[fields.physicalItemId] = nested.physicalToken
            item.modData[fields.assetId] = nested.assetId
            item.modData[fields.title] = nested.resolvedTitle
            item.modData[fields.description] = nested.resolvedDescription
            item.modData[fields.body] = nested.resolvedBody
            item.modData.ConspiracyFiles = nil
        elseif candidate.shape == "unknown-asset" then
            nested.assetId = "dead-air:asset:unknown"
        elseif candidate.shape == "incompatible-schema" then
            nested.schemaVersion = CF.ItemPresentation.SCHEMA_VERSION + 1
        elseif candidate.shape == "invalid-revision" then
            nested.contentRevision = ""
        elseif candidate.shape == "conflicting-mirror" then
            item.modData[fields.schema] = nested.schemaVersion
            item.modData[fields.physicalItemId] = "cf:conflicting-token"
            item.modData[fields.assetId] = nested.assetId
            item.modData[fields.title] = nested.resolvedTitle
            item.modData[fields.description] = nested.resolvedDescription
            item.modData[fields.body] = nested.resolvedBody
        end
        local before = copyTable(item)
        world.containers[candidate.assetId].items = { item }
        local ok, message = pcall(function() placement.reconcile(candidate.assetId) end)
        assertFalse(ok, candidate.shape)
        assertTrue(string.find(tostring(message), "canonical Asset/token gateway", 1, true) ~= nil)
        assertEqual(0, world.created)
        assertEqual(1, #world.containers[candidate.assetId].items)
        assertEqual("pending", persistence.snapshot().assetMaterialisation[candidate.assetId])
        assertDeepEqual(before, item)
    end
end)

test("offline E02/E04 placement rejects current, stale-mirrored, and copied cross-Asset token carriers", function()
    local cases = {
        { expected = ids.d1, carrier = ids.d2, shape = "current" },
        { expected = ids.d2, carrier = ids.d1, shape = "stale-mirrored" },
        { expected = ids.d4, carrier = ids.d3, shape = "copied" }
    }
    for _, candidate in ipairs(cases) do
        local world = makeWorld()
        local placement, persistence = loadedPlacement(world)
        local token = placement.tokenFor(candidate.expected)
        local item = { modData = {} }
        assertTrue(CF.ItemProjection.apply(item, candidate.carrier, token, itemPort))
        if candidate.shape == "stale-mirrored" then
            local nested = item.modData.ConspiracyFiles
            nested.contentRevision = "dead-air-r0-compatible-text"
            nested.resolvedTitle = "Historical title"
            nested.resolvedDescription = "Historical description"
            nested.resolvedBody = "Historical body"
            local fields = CF.ItemProjection.fields
            item.modData[fields.schema] = nested.schemaVersion
            item.modData[fields.physicalItemId] = nested.physicalToken
            item.modData[fields.assetId] = nested.assetId
            item.modData[fields.title] = nested.resolvedTitle
            item.modData[fields.description] = nested.resolvedDescription
            item.modData[fields.body] = nested.resolvedBody
        elseif candidate.shape == "copied" then
            local copied = { modData = copyTable(item.modData), name = item.name, customName = item.customName }
            item = copied
        end
        local before = copyTable(item)
        world.containers[candidate.expected].items = { item }
        local ok, message = pcall(function() placement.reconcile(candidate.expected) end)
        assertFalse(ok)
        assertTrue(string.find(tostring(message), "canonical Asset/token gateway", 1, true) ~= nil)
        assertEqual(0, world.created)
        assertEqual("pending", persistence.snapshot().assetMaterialisation[candidate.expected])
        assertEqual(1, #world.containers[candidate.expected].items)
        assertDeepEqual(before, item)
    end
end)

test("offline E02 binding unload is pending and binding drift fails closed without world mutation", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    world.status[ids.d1] = "unloaded"
    assertEqual("unloaded", placement.reconcile(ids.d1))
    assertEqual("pending", persistence.snapshot().assetMaterialisation[ids.d1])
    assertEqual(0, world.created)
    world.status[ids.d1] = "binding-drift"
    local ok, message = pcall(function() placement.reconcile(ids.d1) end)
    assertFalse(ok)
    assertTrue(string.find(tostring(message), "binding drift", 1, true) ~= nil)
    assertEqual("pending", persistence.snapshot().assetMaterialisation[ids.d1])
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
    local d1Token = placement.tokenFor(ids.d1)
    lossWorld.containers[ids.d1].items = {}
    lossWorld.coverage = "incomplete"
    assertEqual("unknown", placement.reconcile(ids.d1))
    assertEqual(nil, persistence.snapshot().entryOpportunityUsed)
    lossWorld.coverage = "complete"
    assertEqual("unavailable", placement.reconcile(ids.d1))
    assertEqual("fallback", persistence.snapshot().entryOpportunityUsed)
    assertEqual(0, countToken(lossWorld.containers[ids.d1], d1Token))
    assertEqual("unavailable", placement.reconcile(ids.d1))
    assertEqual(2, lossWorld.created)
end)

test("offline E03 D1 discovery fixes anchor and conflict/unknown never select fallback", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    placement.reconcile(ids.d1)
    placement.reconcile(ids.d2)
    discover(persistence, ids.d1)
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
    duplicate.modData = copyTable(original.modData)
    conflictWorld.containers[ids.d1].items[#conflictWorld.containers[ids.d1].items + 1] = duplicate
    assertEqual("conflict", conflict.reconcile(ids.d1))
    assertEqual(nil, conflictPersistence.snapshot().entryOpportunityUsed)
    conflictWorld.containers[ids.d1].items = { original }
    assertEqual("conflict", conflict.reconcile(ids.d1))
    assertEqual("conflict", conflictPersistence.snapshot().physicalAvailability[ids.d1])
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
    assertEqual("available", persistence.snapshot().physicalAvailability[ids.d3])
    world.externalMatches = {}
    world.coverage = "complete"
    assertEqual("unavailable", placement.reconcileIdentity(ids.d3))
    world.externalMatches = { { item = item, location = { kind = "player-inventory" } } }
    world.coverage = "incomplete"
    assertEqual("available", placement.reconcileIdentity(ids.d3))
    assertEqual("available", persistence.snapshot().physicalAvailability[ids.d3])
end)

test("offline E05 physical observations reject cross-Asset, partial, and malformed token carriers without transition", function()
    local cases = {
        { expected = ids.d1, carrier = ids.d2, shape = "current" },
        { expected = ids.d2, carrier = ids.d1, shape = "current" },
        { expected = ids.d4, carrier = ids.d3, shape = "partial" },
        { expected = ids.d3, carrier = ids.d4, shape = "malformed" },
        { expected = ids.d5, carrier = ids.d5, shape = "asset-only" },
        { expected = ids.d6, carrier = ids.d6, shape = "token-only" },
        { expected = ids.key, carrier = ids.key, shape = "flat-only" },
        { expected = ids.d3, carrier = "dead-air:asset:unknown", shape = "unknown" }
    }
    for _, candidate in ipairs(cases) do
        local world = makeWorld()
        local placement, persistence = loadedPlacement(world)
        assertEqual("placed", placement.reconcile(candidate.expected))
        local token = placement.tokenFor(candidate.expected)
        world.containers[candidate.expected].items = {}
        local item
        if candidate.shape == "current" or candidate.shape == "asset-only"
            or candidate.shape == "token-only" or candidate.shape == "flat-only" then
            item = { modData = {} }
            assertTrue(CF.ItemProjection.apply(item, candidate.carrier, token, itemPort))
            if candidate.shape == "asset-only" then
                item.modData.ConspiracyFiles.physicalToken = nil
            elseif candidate.shape == "token-only" then
                item.modData.ConspiracyFiles.assetId = nil
            elseif candidate.shape == "flat-only" then
                local nested = item.modData.ConspiracyFiles
                local fields = CF.ItemProjection.fields
                item.modData[fields.schema] = nested.schemaVersion
                item.modData[fields.physicalItemId] = nested.physicalToken
                item.modData[fields.assetId] = nested.assetId
                item.modData[fields.title] = nested.resolvedTitle
                item.modData[fields.description] = nested.resolvedDescription
                item.modData[fields.body] = nested.resolvedBody
                item.modData.ConspiracyFiles = nil
            end
        elseif candidate.shape == "unknown" then
            item = { modData = { ConspiracyFiles = {
                schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
                contentRevision = CF.Content.thread.contentRevision,
                assetId = candidate.carrier,
                revealed = true,
                resolvedTitle = "Unknown",
                resolvedDescription = "Unknown",
                resolvedBody = "Unknown",
                physicalToken = token
            } } }
        else
            item = { modData = { ConspiracyFiles = {
                schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
                assetId = candidate.carrier,
                physicalToken = token
            } } }
            if candidate.shape == "malformed" then item.modData.ConspiracyFiles.unexpected = "rejected" end
        end
        local before = copyTable(item)
        world.externalMatches = { { item = item, location = { kind = "player-inventory" } } }
        local lastKnownGood = persistence.snapshot()
        local ok, message = pcall(function() placement.reconcileIdentity(candidate.expected) end)
        assertFalse(ok)
        assertTrue(string.find(tostring(message), "Asset/token pair", 1, true) ~= nil)
        assertDeepEqual(lastKnownGood, persistence.snapshot())
        assertDeepEqual(before, item)
        assertEqual(1, #world.externalMatches)
    end

    local validWorld = makeWorld()
    local validPlacement, validPersistence = loadedPlacement(validWorld)
    assertEqual("placed", validPlacement.reconcile(ids.d1))
    local valid = validWorld.containers[ids.d1].items[1]
    validWorld.containers[ids.d1].items = {}
    validWorld.externalMatches = { { item = valid, location = { kind = "player-inventory" } } }
    assertEqual("available", validPlacement.reconcileIdentity(ids.d1))
    assertEqual("available", validPersistence.snapshot().physicalAvailability[ids.d1])
end)

test("offline E05 supplied observations cannot bypass the canonical Asset/token gateway", function()
    local world = makeWorld()
    local placement, persistence = loadedPlacement(world)
    assertEqual("placed", placement.reconcile(ids.d1))
    local valid = world.containers[ids.d1].items[1]
    world.containers[ids.d1].items = {}

    local crossPair = { modData = {} }
    assertTrue(CF.ItemProjection.apply(crossPair, ids.d2, placement.tokenFor(ids.d1), itemPort))
    local lastKnownGood = persistence.snapshot()
    local before = copyTable(crossPair)
    local ok, message = pcall(function()
        placement.reconcileIdentity(ids.d1, {
            matches = { { item = crossPair, location = { kind = "player-inventory" } } },
            coverage = "incomplete"
        })
    end)
    assertFalse(ok)
    assertTrue(string.find(tostring(message), "Asset/token pair", 1, true) ~= nil)
    assertDeepEqual(lastKnownGood, persistence.snapshot())
    assertDeepEqual(before, crossPair)

    assertEqual("available", placement.reconcileIdentity(ids.d1, {
        matches = { { item = valid, location = { kind = "player-inventory" } } },
        coverage = "incomplete"
    }))
end)

test("offline E05 schema-2 derives tokens and keeps adapter observations rebuildable", function()
    local storage = makeStorage()
    local persistence = CF.PersistenceAdapter.new({ storage = storage })
    assertTrue(persistence.load(true))
    assertTrue(persistence.transaction(function(state)
        local ok, result = state.ensureMaterialisation(ids.d4)
        if not ok then error(result) end
        return state.completePlacement(ids.d4)
    end))
    local identity = CF.PhysicalIdentity.new({ persistence = persistence })
    assertTrue(identity.observe(ids.d4, { matches = {}, coverage = "incomplete" }))
    assertEqual("unknown", persistence.snapshot().physicalAvailability[ids.d4])
    assertEqual("placed", persistence.snapshot().assetMaterialisation[ids.d4])
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
        addEvent = function(name, callback) callbacks[name] = callback end,
        removeEvent = function() end
    })
    assertTrue(runtime.enabled)
    local d1Binding = CF.LocationBindings.locations[ids.relay].placements[ids.d1]
    callbacks.LoadGridsquare({ x = d1Binding.x, y = d1Binding.y, z = d1Binding.z })
    assertEqual(0, runtime.scheduler.size())
    callbacks.OnTick()
    assertEqual(0, runtime.scheduler.size(), "pre-start callbacks must be inert until the runtime is running")
    callbacks.OnInitGlobalModData(true)
    callbacks.OnGameStart()
    assertEqual(7, runtime.scheduler.size())
    callbacks.OnTick()
    assertEqual(7, world.created)
    assertEqual(0, runtime.scheduler.size())
    discover(runtime.persistence, ids.d2)
    world.player = { x = 13570, y = 1580, z = 2, locationId = ids.relay }
    for _ = 1, 30 do callbacks.OnTick() end
    assertEqual(ids.relay, runtime.persistence.snapshot().confirmedLocationIds[1])
    assertEqual(1, #reports)
    assertEqual(CF.IntegrationRuntime.READY_DIAGNOSTIC, reports[1])
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
        local identityGateway = CF.ItemIdentityGateway.new({
            itemPort = environment.itemPort,
            tokenFor = function(assetId)
                if assetId == ids.d1 then return "cf:pz-port:d1" end
                return "cf:pz-port:" .. assetId
            end
        })
        local observation = environment.world.scanPhysical({
            assetId = ids.d1, binding = binding, identityGateway = identityGateway
        })
        assertEqual(1, #observation.matches)
        assertEqual(0, #observation.collisions)
        assertEqual(ids.d1, observation.matches[1].identity.assetId)

        local wrongAsset = environment.world.createItem("Base.Note")
        assertTrue(CF.ItemProjection.apply(wrongAsset, ids.d2, "cf:pz-port:d1", environment.itemPort))
        items[1] = wrongAsset
        observation = environment.world.scanPhysical({
            assetId = ids.d1, binding = binding, identityGateway = identityGateway
        })
        assertEqual(0, #observation.matches)
        assertEqual(1, #observation.collisions)
        assertEqual(ids.d2, observation.collisions[1].identity.assetId)

        local partial = environment.world.createItem("Base.Note")
        partial.md.ConspiracyFiles = {
            schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
            assetId = ids.d2,
            physicalToken = "cf:pz-port:d1"
        }
        items[1] = partial
        observation = environment.world.scanPhysical({
            assetId = ids.d1, binding = binding, identityGateway = identityGateway
        })
        assertEqual(0, #observation.matches)
        assertEqual(1, #observation.collisions)

        partial.md.ConspiracyFiles.unexpected = "malformed"
        observation = environment.world.scanPhysical({
            assetId = ids.d1, binding = binding, identityGateway = identityGateway
        })
        assertEqual(0, #observation.matches)
        assertEqual(1, #observation.collisions)
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

test("offline PZ concrete scan classifies every unreadable authored carrier without rewriting it", function()
    local old = {
        getCell = rawget(_G, "getCell"), getPlayer = rawget(_G, "getPlayer")
    }
    local function javaList(values)
        return { size = function() return #values end, get = function(_, index) return values[index + 1] end }
    end
    local allAssets = {}
    for _, assetId in ipairs(CF.Content.thread.documentAssetIds) do allAssets[#allAssets + 1] = assetId end
    for _, assetId in ipairs(CF.Content.thread.optionalAssetIds) do allAssets[#allAssets + 1] = assetId end
    local function bindingFor(assetId)
        local asset = CF.Content.assets[assetId]
        return CF.LocationBindings.locations[asset.placementLocationId].placements[assetId]
    end
    local currentBinding, currentItems
    local container = {
        getItems = function() return javaList(currentItems) end,
        getType = function() return currentBinding.containerType end
    }
    local object = {
        getSprite = function() return { getName = function() return currentBinding.sprite end } end,
        getContainerCount = function() return currentBinding.containerIndex + 1 end,
        getContainerByIndex = function(_, index) if index == currentBinding.containerIndex then return container end end
    }
    local filler = {
        getSprite = function() return { getName = function() return "filler" end } end,
        getContainerCount = function() return 0 end
    }
    local targetSquare = {
        getRoom = function()
            return { getRoomDef = function() return { getName = function() return currentBinding.room end } end }
        end,
        getObjects = function()
            local values = {}
            for index = 0, currentBinding.objectIndex - 1 do values[index + 1] = filler end
            values[currentBinding.objectIndex + 1] = object
            return javaList(values)
        end
    }
    local cell = {
        getGridSquare = function(_, x, y, z)
            if x == currentBinding.x and y == currentBinding.y and z == currentBinding.z then return targetSquare end
        end
    }
    _G.getCell = function() return cell end
    _G.getPlayer = function() return nil end

    local ok, message = pcall(function()
        local environment = require("ConspiracyFiles/Adapters/PZ").environment()
        local function tokenFor(assetId) return "cf:concrete-scan:" .. assetId end
        local gateway = CF.ItemIdentityGateway.new({ itemPort = environment.itemPort, tokenFor = tokenFor })
        local function authoredItem(assetId, state)
            local asset = CF.Content.assets[assetId]
            local value = {
                md = {}, name = asset.displayName, itemType = asset.pzItemType,
                mode = "table", nameWrites = 0, customWrites = 0
            }
            function value:getModData()
                if self.mode == "throwing" then error("injected concrete getModData failure") end
                if self.mode == "nil" then return nil end
                if self.mode == "non-table" then return 37 end
                return self.md
            end
            function value:getDisplayName() return self.name end
            function value:getFullType() return self.itemType end
            function value:setName(name) self.name, self.nameWrites = name, self.nameWrites + 1 end
            function value:setCustomName(flag) self.customName, self.customWrites = flag, self.customWrites + 1 end

            if state == "valid" or state == "malformed" or state == "asset-only"
                or state == "token-only" or state == "conflicting" or state == "unreadable-legacy" then
                assertTrue(CF.ItemProjection.apply(value, assetId, tokenFor(assetId), environment.itemPort))
                value.nameWrites, value.customWrites = 0, 0
            end
            if state == "throwing" or state == "nil" or state == "non-table" then
                value.mode = state
            elseif state == "hostile" then
                value.md = setmetatable({}, {
                    __index = function() error("injected concrete hostile ModData access") end
                })
            elseif state == "partial" then
                value.md.ConspiracyFiles = {
                    schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
                    assetId = assetId,
                    physicalToken = tokenFor(assetId)
                }
            elseif state == "malformed" then
                value.md.ConspiracyFiles.unexpected = true
            elseif state == "asset-only" then
                value.md.ConspiracyFiles.physicalToken = nil
            elseif state == "token-only" then
                value.md.ConspiracyFiles.assetId = nil
            elseif state == "conflicting" then
                value.md.ConspiracyFiles.physicalToken = "cf:concrete-scan:conflicting"
            elseif state == "unreadable-legacy" then
                value.md = setmetatable(value.md, {
                    __index = function() error("injected concrete hostile legacy access") end
                })
            end
            return value
        end

        local states = {
            "valid", "throwing", "nil", "non-table", "hostile", "partial", "malformed",
            "asset-only", "token-only", "conflicting", "unreadable-legacy"
        }
        for _, assetId in ipairs(allAssets) do
            currentBinding = bindingFor(assetId)
            for _, state in ipairs(states) do
                local value = authoredItem(assetId, state)
                local originalModData = value.md
                currentItems = { value }
                local observation = environment.world.scanPhysical({
                    assetId = assetId,
                    binding = currentBinding,
                    identityGateway = gateway
                })
                if state == "valid" then
                    assertEqual(1, #observation.matches, assetId .. "/" .. state)
                    assertEqual(0, #observation.collisions, assetId .. "/" .. state)
                else
                    assertEqual(0, #observation.matches, assetId .. "/" .. state)
                    assertEqual(1, #observation.collisions, assetId .. "/" .. state)
                end
                assertEqual(originalModData, value.md, assetId .. "/" .. state .. " ModData reference")
                assertEqual(0, value.nameWrites, assetId .. "/" .. state .. " display rewrite")
                assertEqual(0, value.customWrites, assetId .. "/" .. state .. " custom-name rewrite")
            end

            local ordinary = authoredItem(assetId, "nil")
            ordinary.name = "Ordinary same-type loot"
            currentItems = { ordinary }
            local observation = environment.world.scanPhysical({
                assetId = assetId, binding = currentBinding, identityGateway = gateway
            })
            assertEqual(0, #observation.matches)
            assertEqual(0, #observation.collisions)

            local wrongType = authoredItem(assetId, "nil")
            wrongType.itemType = "Base.UnrelatedType"
            currentItems = { wrongType }
            observation = environment.world.scanPhysical({
                assetId = assetId, binding = currentBinding, identityGateway = gateway
            })
            assertEqual(0, #observation.matches)
            assertEqual(0, #observation.collisions)
        end
    end)
    _G.getCell = old.getCell
    _G.getPlayer = old.getPlayer
    assertTrue(ok, message)
end)

test("offline PZ scan uses the Build 42 vehicle Set iterator and fails closed on partial vehicle APIs", function()
    local old = { getCell = rawget(_G, "getCell"), getPlayer = rawget(_G, "getPlayer") }
    local assetId = ids.d1
    local binding = CF.LocationBindings.locations[CF.Content.assets[assetId].placementLocationId].placements[assetId]
    local item = { md = {}, itemType = CF.Content.assets[assetId].pzItemType }
    function item:getModData() return self.md end
    function item:getFullType() return self.itemType end
    function item:getDisplayName() return CF.Content.assets[assetId].displayName end
    function item:setName(name) self.name = name end
    function item:setCustomName(value) self.customName = value end
    local environment = require("ConspiracyFiles/Adapters/PZ").environment()
    assertTrue(CF.ItemProjection.apply(item, assetId, "cf:set-iterator:d1", environment.itemPort))

    local container = {
        getItems = function() return { size = function() return 1 end, get = function() return item end } end,
        getType = function() return "TruckBed" end
    }
    local part = {
        getItemContainer = function() return container end,
        getId = function() return 7 end
    }
    local vehicle = {
        getX = function() return 100 end, getY = function() return 100 end,
        getPartCount = function() return 1 end,
        getPartByIndex = function() return part end,
        getId = function() return 42 end
    }
    local vehicles = {}
    for index = 1, 16 do
        vehicles[index] = {
            getX = function() return 200 + index end, getY = function() return 200 end,
            getPartCount = function() return 0 end, getId = function() return 100 + index end
        }
    end
    vehicles[17] = vehicle
    local setOrder = {}
    for index = 1, 17 do setOrder[index] = index end
    local activeSet
    local set = {
        iterator = function()
            local position = 0
            return {
                hasNext = function() return position < #setOrder end,
                next = function() position = position + 1; return activeSet[setOrder[position]] end
            }
        end
    }
    activeSet = vehicles
    local square = {
        getX = function() return 100 end, getY = function() return 100 end, getZ = function() return 0 end,
        getRoom = function() return nil end, getObjects = function() return nil end,
        getWorldObjects = function() return nil end, getStaticMovingObjects = function() return nil end
    }
    local cell = {
        getGridSquare = function() return square end,
        getVehicles = function() return set end
    }
    local player = {
        getInventory = function() return { getItems = function() return { size = function() return 0 end, get = function() end } end } end,
        getSquare = function() return square end, getVehicle = function() return nil end
    }
    _G.getCell, _G.getPlayer = function() return cell end, function() return player end
    local gateway = CF.ItemIdentityGateway.new({
        itemPort = environment.itemPort,
        tokenFor = function() return "cf:set-iterator:d1" end
    })
    local ok, observation = pcall(environment.world.scanPhysical, {
        assetId = assetId, binding = binding, identityGateway = gateway
    })
    assertTrue(ok, observation)
    assertEqual(1, #observation.matches)
    assertEqual(0, #observation.collisions)

    local firstMatch = observation.matches[1].item
    setOrder = { 17 }
    for index = 1, 16 do setOrder[#setOrder + 1] = index end
    ok, observation = pcall(environment.world.scanPhysical, {
        assetId = assetId, binding = binding, identityGateway = gateway
    })
    assertTrue(ok, observation)
    assertEqual(1, #observation.matches)
    assertEqual(firstMatch, observation.matches[1].item)

    local tied = {}
    for index = 1, 17 do
        tied[index] = {
            getX = function() return 150 end, getY = function() return 150 end,
            getPartCount = function() return index == 17 and 1 or 0 end
        }
    end
    tied[17].getPartByIndex = function() return part end
    activeSet, setOrder = tied, {}
    for index = 1, 17 do setOrder[index] = index end
    ok, observation = pcall(environment.world.scanPhysical, {
        assetId = assetId, binding = binding, identityGateway = gateway
    })
    assertTrue(ok, observation)
    assertEqual(0, #observation.matches)
    assertTrue(#observation.diagnostics > 0)

    activeSet, setOrder = vehicles, {}
    for index = 1, 65 do setOrder[index] = ((index - 1) % 17) + 1 end
    ok, observation = pcall(environment.world.scanPhysical, {
        assetId = assetId, binding = binding, identityGateway = gateway
    })
    assertTrue(ok, observation)
    assertEqual(0, #observation.matches)
    assertTrue(#observation.diagnostics > 0)

    local partialCell = {
        getGridSquare = function() return square end,
        getVehicles = function() return { size = function() return 1 end } end
    }
    _G.getCell = function() return partialCell end
    ok, observation = pcall(environment.world.scanPhysical, {
        assetId = assetId, binding = binding, identityGateway = gateway
    })
    _G.getCell, _G.getPlayer = old.getCell, old.getPlayer
    assertTrue(ok, observation)
    assertEqual(0, #observation.matches)
    assertTrue(#observation.diagnostics > 0)
end)
