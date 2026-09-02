local CF = require("ConspiracyFiles")
local ids = CF.Content.ids

local function activeToken(assetId)
    return "cf:presentation-active:" .. assetId .. ":1"
end

local function fakeItem(owned)
    local item = { modData = {}, owned = owned == true, name = "Base item", customName = false }
    function item:getModData() return self.modData end
    function item:setName(value) self.name = value end
    function item:setCustomName(value) self.customName = value end
    function item:getDisplayName() return self.name end
    return item
end

local function stamp(assetId, owned, options)
    local item = fakeItem(owned)
    options = options or {}
    if options.revealed == nil then options.revealed = true end
    if options.physicalToken == nil then options.physicalToken = activeToken(assetId) end
    assertTrue(CF.ItemPresentation.stamp(item, assetId, options))
    return item
end

local function copyTable(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[copyTable(key)] = copyTable(child) end
    return result
end

local function context(existing)
    local value = { options = existing or {} }
    return value
end

local function storage()
    local roots = {}
    return {
        get = function(tag) return roots[tag] end,
        replace = function(tag, root) roots[tag] = root end
    }
end

local function harness()
    local persistence = CF.PersistenceAdapter.new({ storage = storage() })
    assertTrue(persistence.load(true))
    local events, removed = {}, {}
    local readers, notebooks, bindings = {}, {}, {}
    local boundaryErrors = {}
    local port = {}
    port.isInventoryItem = function(value) return type(value) == "table" and type(value.getModData) == "function" end
    port.isOwned = function(subject) return subject.item.owned == true end
    port.addOption = function(menu, label, callback, playerNum, item)
        local option = { name = label, target = nil, onSelect = callback, param1 = playerNum, param2 = item }
        menu.options[#menu.options + 1] = option
        return option
    end
    port.tooltip = function(message) return { description = message } end
    port.openReader = function(projection) readers[#readers + 1] = projection end
    port.openNotebook = function(projection) notebooks[#notebooks + 1] = projection end
    port.configuredKey = function() return 49 end
    port.ensureKeyBinding = function(name) bindings[name] = true end
    port.replaceEvent = function(name, callback) events[name] = callback end
    port.removeEvent = function(name, callback)
        if events[name] == callback then events[name] = nil; removed[#removed + 1] = name end
    end
    local identityGateway = CF.ItemIdentityGateway.new({ tokenFor = activeToken })
    local runtime = CF.PresentationRuntime.new({
        port = port,
        persistenceProvider = function() return persistence end,
        identityProvider = function() return identityGateway end,
        callBoundary = function(_, callback)
            local ok, result = pcall(callback)
            if not ok then boundaryErrors[#boundaryErrors + 1] = tostring(result) end
            return ok, result
        end
    })
    return {
        persistence = persistence, port = port, runtime = runtime, events = events,
        readers = readers, notebooks = notebooks, bindings = bindings,
        boundaryErrors = boundaryErrors, removed = removed
    }
end

local function ownedOptions(runtime, menu)
    local result = {}
    for _, option in ipairs(menu.options) do if runtime.optionIsOwned(option) then result[#result + 1] = option end end
    return result
end

local function containsText(value, needle, seen)
    if type(value) == "string" then return string.find(value, needle, 1, true) ~= nil end
    if type(value) ~= "table" then return false end
    seen = seen or {}
    if seen[value] then return false end
    seen[value] = true
    for key, child in pairs(value) do
        if containsText(key, needle, seen) or containsText(child, needle, seen) then return true end
    end
    return false
end

test("presentation item contract stamps names and validates only revealed canonical ModData", function()
    local item = stamp(ids.d1, true, {
        physicalToken = "cf:save:dead-air:d1:1"
    })
    local value = item.modData[CF.ItemPresentation.MOD_DATA_KEY]
    assertEqual(CF.Content.thread.contentRevision, value.contentRevision)
    assertEqual(CF.Content.assets[ids.d1].bodyText, value.resolvedBody)
    assertTrue(item.customName)
    local subject = assert(CF.ItemPresentation.validate(item, function(candidate) return candidate == item end))
    assertEqual(ids.d1, subject.assetId)

    value.resolvedBody = "tampered hidden claim"
    local invalid, reason = CF.ItemPresentation.validate(item, function() return true end)
    assertEqual(nil, invalid)
    assertEqual("body", reason)
    value.resolvedBody = CF.Content.assets[ids.d1].bodyText
    value.hiddenTruth = "must not pass validation"
    invalid, reason = CF.ItemPresentation.validate(item, function() return true end)
    assertEqual(nil, invalid)
    assertEqual("moddata-shape", reason)
    value.hiddenTruth = nil
    value.revealed = false
    invalid, reason = CF.ItemPresentation.validate(item, function() return true end)
    assertEqual(nil, invalid)
    assertEqual("hidden", reason)
end)

test("presentation carrier accepts nested canonical data and rejects flat or disagreeing mirrors", function()
    local token = "cf:save:carrier:d1:1"
    local nested = stamp(ids.d1, true, { physicalToken = token })
    assertTrue(CF.ItemPresentation.validate(nested, function() return true end) ~= nil)
    assertEqual(token, CF.ItemProjection.token(nested))

    local asset = CF.Content.assets[ids.d1]
    local fields = CF.ItemProjection.fields
    local flatOnly = fakeItem(true)
    flatOnly.name = asset.displayName
    flatOnly.modData[fields.schema] = CF.ItemPresentation.SCHEMA_VERSION
    flatOnly.modData[fields.physicalItemId] = token
    flatOnly.modData[fields.assetId] = ids.d1
    flatOnly.modData[fields.title] = asset.displayName
    flatOnly.modData[fields.description] = asset.descriptionText
    flatOnly.modData[fields.body] = asset.bodyText
    local subject, reason = CF.ItemPresentation.validate(flatOnly, function() return true end)
    assertEqual(nil, subject)
    assertEqual("missing-conspiracy-files-data", reason)
    assertEqual(nil, CF.ItemProjection.token(flatOnly))

    local mirrored = stamp(ids.d1, true, { physicalToken = token })
    local value = mirrored.modData.ConspiracyFiles
    mirrored.modData[fields.schema] = value.schemaVersion
    mirrored.modData[fields.physicalItemId] = value.physicalToken
    mirrored.modData[fields.assetId] = value.assetId
    mirrored.modData[fields.title] = value.resolvedTitle
    mirrored.modData[fields.description] = value.resolvedDescription
    mirrored.modData[fields.body] = value.resolvedBody
    assertTrue(CF.ItemPresentation.validate(mirrored, function() return true end) ~= nil)

    mirrored.modData[fields.physicalItemId] = "cf:save:DIFFERENT"
    subject, reason = CF.ItemPresentation.validate(mirrored, function() return true end)
    assertEqual(nil, subject)
    assertEqual("legacy-token-mismatch", reason)
    assertEqual(nil, CF.ItemProjection.token(mirrored))
    mirrored.modData[fields.physicalItemId] = token

    mirrored.modData[fields.body] = "disagreeing presentation"
    subject, reason = CF.ItemPresentation.validate(mirrored, function() return true end)
    assertEqual(nil, subject)
    assertEqual("legacy-body-mismatch", reason)
    assertEqual(nil, CF.ItemProjection.token(mirrored), "physical tracking must reject a disagreeing mirror")
end)

test("presentation physical identity accepts complete pairs and rejects partial or cross-Asset carriers", function()
    local token = "cf:save:pair:d1:1"
    local nested = stamp(ids.d1, true, { physicalToken = token })
    local identity, message = CF.ItemProjection.identity(nested)
    assertTrue(identity ~= nil, message)
    assertEqual(ids.d1, identity.assetId)
    assertEqual(token, identity.physicalToken)

    local fields = CF.ItemProjection.fields
    local value = nested.modData.ConspiracyFiles
    nested.modData[fields.schema] = value.schemaVersion
    nested.modData[fields.physicalItemId] = value.physicalToken
    nested.modData[fields.assetId] = value.assetId
    nested.modData[fields.title] = value.resolvedTitle
    nested.modData[fields.description] = value.resolvedDescription
    nested.modData[fields.body] = value.resolvedBody
    identity, message = CF.ItemProjection.identity(nested)
    assertTrue(identity ~= nil and identity.hasLegacy, message)
    assertEqual(ids.d1, identity.assetId)
    assertEqual(token, identity.physicalToken)

    local partial = fakeItem(true)
    partial.modData.ConspiracyFiles = {
        schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
        assetId = ids.d1,
        physicalToken = token
    }
    identity, message = CF.ItemProjection.identity(partial)
    assertEqual(nil, identity)
    assertEqual("hidden", message)
    local subject, reason = CF.ItemPresentation.validate(partial, function() return true end)
    assertEqual(nil, subject)
    assertEqual("hidden", reason)

    local malformed = fakeItem(true)
    malformed.modData.ConspiracyFiles = {
        schemaVersion = CF.ItemPresentation.SCHEMA_VERSION,
        assetId = ids.d1,
        physicalToken = token,
        unexpected = "rejected"
    }
    identity, message = CF.ItemProjection.identity(malformed)
    assertEqual(nil, identity)
    assertEqual("moddata-shape", message)
    local classification, _, collisionReason = CF.ItemProjection.classifyIdentity(malformed, ids.d1, token)
    assertEqual("collision", classification)
    assertEqual("moddata-shape", collisionReason)

    local wrongAsset = stamp(ids.d2, true, { physicalToken = token })
    classification, identity, collisionReason = CF.ItemProjection.classifyIdentity(wrongAsset, ids.d1, token)
    assertEqual("collision", classification)
    assertEqual(ids.d2, identity.assetId)
    assertEqual("asset-token-mismatch", collisionReason)
end)

test("presentation copied carriers retain content but expose the same physical token for conflict handling", function()
    local token = "cf:save:copy:key:1"
    local original = stamp(ids.key, true, { physicalToken = token })
    local copied = fakeItem(true)
    copied.modData = copyTable(original.modData)
    copied.name = original.name
    copied.customName = original.customName
    assertTrue(CF.ItemPresentation.validate(original, function() return true end) ~= nil)
    assertTrue(CF.ItemPresentation.validate(copied, function() return true end) ~= nil)
    assertEqual(token, CF.ItemProjection.token(original))
    assertEqual(token, CF.ItemProjection.token(copied))
    assertFalse(original == copied)
end)

test("presentation notebook projects only known journal and Evidence in discovery order", function()
    local domain = assert(CF.ThreadState.new())
    assertTrue(domain.discover(ids.d3, "Found the invoice on a shelf.", ids.relay))
    assertTrue(domain.markInteresting("item:key", { assetId = ids.key, contextText = "Red tag in my pocket." }))
    local notebook = CF.Presentation.notebook(domain)
    assertEqual(2, #notebook.journal)
    assertEqual(2, #notebook.evidence)
    assertEqual(CF.Content.assets[ids.d3].displayName, notebook.evidence[1].title)
    assertEqual(CF.Content.assets[ids.key].displayName, notebook.evidence[2].title)
    assertFalse(containsText(notebook, CF.Content.assets[ids.d6].displayName))
    assertFalse(containsText(notebook, CF.Content.assets[ids.d6].bodyText))
    assertTrue(string.find(notebook.help.paragraphs[1], "actually learn", 1, true) ~= nil)
end)

test("presentation inventory menu is additive, privately deduplicated, conservative, and inventory-pane-only", function()
    local h = harness()
    h.runtime.start()
    assertTrue(h.events.OnFillInventoryObjectContextMenu ~= nil)
    assertTrue(h.events.OnKeyPressed ~= nil)
    assertEqual(nil, h.events.OnFillWorldObjectContextMenu)

    local document = stamp(ids.d1, true)
    local foreign = { name = "Inspect", onSelect = function() end }
    local menu = context({ foreign })
    h.runtime.fillInventoryContextMenu(0, menu, { document })
    h.runtime.fillInventoryContextMenu(0, menu, { document })
    local ours = ownedOptions(h.runtime, menu)
    assertEqual(1, #ours)
    assertEqual(foreign, menu.options[1])
    assertEqual("Inspect", ours[1].name)

    local grouped = context()
    h.runtime.fillInventoryContextMenu(0, grouped, { { items = { document, document } } })
    assertEqual(1, #ownedOptions(h.runtime, grouped))
    local duplicatedRaw = context()
    h.runtime.fillInventoryContextMenu(0, duplicatedRaw, { document, document })
    assertEqual(1, #ownedOptions(h.runtime, duplicatedRaw))

    local invalid = fakeItem(true)
    local mixed = context()
    h.runtime.fillInventoryContextMenu(0, mixed, { document, invalid })
    assertEqual(1, #ownedOptions(h.runtime, mixed))

    local second = stamp(ids.d2, true)
    local ambiguous = context()
    h.runtime.fillInventoryContextMenu(0, ambiguous, { document, second })
    local ambiguousOwned = ownedOptions(h.runtime, ambiguous)
    assertEqual(1, #ambiguousOwned)
    assertTrue(ambiguousOwned[1].notAvailable)
    assertEqual(nil, ambiguousOwned[1].onSelect)

    local hidden = stamp(ids.d3, true, { revealed = false })
    local omitted = context()
    h.runtime.fillInventoryContextMenu(0, omitted, { hidden, invalid })
    assertEqual(0, #omitted.options)
end)

test("presentation gateway accepts every exact active pair and refreshes only compatible verified presentation", function()
    local h = harness()
    for _, assetId in ipairs({ ids.d1, ids.d2, ids.d3, ids.d4, ids.d5, ids.d6, ids.key }) do
        local item = stamp(assetId, true)
        local menu = context()
        h.runtime.fillInventoryContextMenu(0, menu, { item })
        local options = ownedOptions(h.runtime, menu)
        assertEqual(assetId == ids.key and 2 or 1, #options)
        assertEqual(0, #h.persistence.snapshot().evidence)
    end

    local stale = stamp(ids.d1, true)
    local nested = stale.modData.ConspiracyFiles
    nested.contentRevision = "dead-air-r0-compatible"
    nested.resolvedTitle = "Historical title"
    nested.resolvedDescription = "Historical description"
    nested.resolvedBody = "Historical body"
    stale.name = "Historical title"
    local menu = context()
    h.runtime.fillInventoryContextMenu(0, menu, { stale })
    assertEqual(1, #ownedOptions(h.runtime, menu))
    assertEqual(activeToken(ids.d1), nested.physicalToken)
    assertEqual(CF.Content.thread.contentRevision, stale.modData.ConspiracyFiles.contentRevision)
    assertEqual(CF.Content.assets[ids.d1].displayName, stale.name)
    assertEqual(CF.Content.assets[ids.d1].bodyText, stale.modData.ConspiracyFiles.resolvedBody)
    assertEqual(0, #h.persistence.snapshot().evidence)
end)

test("presentation gateway rejects cross-pairs and malformed carriers without action, refresh, reader, or ledger mutation", function()
    local h = harness()
    local rejected = {
        stamp(ids.d2, true, { physicalToken = activeToken(ids.d1) }),
        stamp(ids.d1, true, { physicalToken = activeToken(ids.d2) }),
        stamp(ids.d4, true, { physicalToken = activeToken(ids.d3) }),
        stamp(ids.d3, true, { physicalToken = activeToken(ids.d4) })
    }
    local assetOnly = stamp(ids.d1, true)
    assetOnly.modData.ConspiracyFiles.physicalToken = nil
    rejected[#rejected + 1] = assetOnly
    local tokenOnly = stamp(ids.d2, true)
    tokenOnly.modData.ConspiracyFiles.assetId = nil
    rejected[#rejected + 1] = tokenOnly
    local unknown = stamp(ids.d3, true)
    unknown.modData.ConspiracyFiles.assetId = "dead-air:asset:unknown"
    rejected[#rejected + 1] = unknown
    local tampered = stamp(ids.d4, true)
    tampered.modData.ConspiracyFiles.resolvedBody = "tampered"
    rejected[#rejected + 1] = tampered

    local beforeRoot = h.persistence.snapshot()
    for _, item in ipairs(rejected) do
        local beforeItem = copyTable(item)
        local menu = context()
        h.runtime.fillInventoryContextMenu(0, menu, { item })
        assertEqual(0, #ownedOptions(h.runtime, menu))
        assertDeepEqual(beforeItem, item)
        assertDeepEqual(beforeRoot, h.persistence.snapshot())
    end
    assertEqual(0, #h.readers)
    assertEqual(0, #h.boundaryErrors)
end)

test("presentation activation revalidates the active pair before discovery, Mark, or reader mutation", function()
    local inspectHarness = harness()
    local document = stamp(ids.d3, true)
    local inspectMenu = context()
    inspectHarness.runtime.fillInventoryContextMenu(0, inspectMenu, { document })
    local inspect = ownedOptions(inspectHarness.runtime, inspectMenu)[1]
    document.modData.ConspiracyFiles.physicalToken = activeToken(ids.d4)
    local beforeInspect = inspectHarness.persistence.snapshot()
    inspect.onSelect(inspect.target, inspect.param1, inspect.param2)
    assertDeepEqual(beforeInspect, inspectHarness.persistence.snapshot())
    assertEqual(0, #inspectHarness.readers)
    assertEqual(0, #inspectHarness.boundaryErrors)

    local markHarness = harness()
    local key = stamp(ids.key, true)
    local markMenu = context()
    markHarness.runtime.fillInventoryContextMenu(0, markMenu, { key })
    local mark = ownedOptions(markHarness.runtime, markMenu)[2]
    key.modData.ConspiracyFiles.assetId = ids.d1
    local beforeMark = markHarness.persistence.snapshot()
    mark.onSelect(mark.target, mark.param1, mark.param2)
    assertDeepEqual(beforeMark, markHarness.persistence.snapshot())
    assertEqual(0, #markHarness.readers)
    assertEqual(0, #markHarness.boundaryErrors)
end)

test("presentation Inspect revalidates at activation, records discovery once, and opens the full reader repeatedly", function()
    local h = harness()
    local document = stamp(ids.d4, true)
    local menu = context()
    h.runtime.fillInventoryContextMenu(0, menu, { document })
    local inspect = ownedOptions(h.runtime, menu)[1]
    document.modData.ConspiracyFiles.revealed = false
    inspect.onSelect(inspect.target, inspect.param1, inspect.param2)
    assertEqual(0, #h.readers)
    assertEqual(0, #h.persistence.snapshot().evidence)
    assertEqual(0, #h.boundaryErrors)

    document.modData.ConspiracyFiles.revealed = true
    local fresh = context()
    h.runtime.fillInventoryContextMenu(0, fresh, { document })
    inspect = ownedOptions(h.runtime, fresh)[1]
    inspect.onSelect(inspect.target, inspect.param1, inspect.param2)
    inspect.onSelect(inspect.target, inspect.param1, inspect.param2)
    assertEqual(2, #h.readers)
    assertEqual(CF.Content.assets[ids.d4].bodyText, h.readers[1].body)
    assertEqual(1, #h.persistence.snapshot().evidence)
    assertEqual(1, h.persistence.snapshot().evidence[1].discoveryOrdinal)
end)

test("presentation Mark Interesting requires ownership and canonical state disables repeat intent", function()
    local h = harness()
    local key = stamp(ids.key, false)
    local ground = context()
    h.runtime.fillInventoryContextMenu(0, ground, { key })
    local groundOwned = ownedOptions(h.runtime, ground)
    assertEqual(2, #groundOwned)
    assertEqual("Inspect", groundOwned[1].name)
    assertTrue(groundOwned[2].notAvailable)
    assertEqual(nil, groundOwned[2].onSelect)
    groundOwned[1].onSelect(groundOwned[1].target, groundOwned[1].param1, groundOwned[1].param2)
    assertEqual(CF.Content.assets[ids.key].inspectText, h.readers[1].body)
    assertEqual(0, #h.persistence.snapshot().evidence)

    key.owned = true
    local inventory = context()
    h.runtime.fillInventoryContextMenu(0, inventory, { key })
    local options = ownedOptions(h.runtime, inventory)
    assertTrue(options[2].onSelect ~= nil)
    options[2].onSelect(options[2].target, options[2].param1, options[2].param2)
    assertEqual(1, #h.persistence.snapshot().evidence)
    assertTrue(h.persistence.snapshot().evidence[1].playerMarkedInteresting)

    local repeated = context()
    h.runtime.fillInventoryContextMenu(0, repeated, { key })
    local repeatedOptions = ownedOptions(h.runtime, repeated)
    assertTrue(repeatedOptions[2].notAvailable)
    assertEqual(nil, repeatedOptions[2].onSelect)
end)

test("presentation adapter faults stay inside their callback boundary", function()
    local h = harness()
    local document = stamp(ids.d5, true)
    local menu = context()
    h.runtime.fillInventoryContextMenu(0, menu, { document })
    local inspect = ownedOptions(h.runtime, menu)[1]
    h.port.openReader = function() error("fake reader fault") end
    local escaped = pcall(inspect.onSelect, inspect.target, inspect.param1, inspect.param2)
    assertTrue(escaped)
    assertEqual(1, #h.boundaryErrors)
    assertEqual(1, #h.persistence.snapshot().evidence)
    h.runtime.openNotebook()
    assertEqual(1, #h.notebooks)
end)

test("presentation owns exactly one configurable notebook binding and refreshes projections on repeated opens", function()
    local h = harness()
    assertTrue(h.runtime.start())
    assertFalse(h.runtime.start())
    local count = 0
    for _, _ in pairs(h.bindings) do count = count + 1 end
    assertEqual(1, count)
    assertTrue(h.bindings[CF.PresentationRuntime.BINDING_NAME])
    h.runtime.keyPressed(48)
    assertEqual(0, #h.notebooks)
    h.runtime.keyPressed(49)
    assertEqual(1, #h.notebooks)
    assertTrue(h.persistence.transaction(function(domain)
        local ok, result = domain.ensureMaterialisation(ids.d1)
        if not ok then error(result) end
        ok, result = domain.markPlacementUnavailable(ids.d1)
        if not ok then error(result) end
        ok, result = domain.materialise(ids.d2)
        if not ok then error(result) end
        local changed
        ok, result, changed = domain.discover(ids.d2, "Inspected after opening the notebook.", ids.police)
        if not ok then error(result) end
        return changed, result
    end))
    h.runtime.keyPressed(49)
    assertEqual(2, #h.notebooks)
    assertEqual(0, #h.notebooks[1].evidence)
    assertEqual(1, #h.notebooks[2].evidence)
    assertTrue(h.runtime.stop())
    assertEqual(nil, h.events.OnFillInventoryObjectContextMenu)
    assertEqual(nil, h.events.OnKeyPressed)
end)

test("presentation geometry remains centered and usable at common resolutions", function()
    for _, resolution in ipairs({ {800, 600}, {960, 1008}, {1280, 720}, {1920, 1080}, {2560, 1440}, {3840, 2160} }) do
        for _, kind in ipairs({ "reader", "notebook" }) do
            local value = CF.WindowGeometry.centered(resolution[1], resolution[2], kind)
            assertTrue(value.width >= 460)
            assertTrue(value.height >= 380)
            assertTrue(value.x >= 0 and value.y >= 0)
            assertTrue(value.x + value.width <= resolution[1] and value.y + value.height <= resolution[2])
            assertTrue(value.x + value.width <= resolution[1])
            assertTrue(value.y + value.height <= resolution[2])
        end
    end
end)

test("production client presentation files are Lua 5.1 syntax and declare no direct-world action hook", function()
    for _, path in ipairs({
        "mod/common/media/lua/client/ConspiracyFilesClientBootstrap.lua",
        "mod/common/media/lua/client/ConspiracyFiles/PZPresentation.lua",
        "mod/common/media/lua/client/ConspiracyFiles/PZWindows.lua"
    }) do assertTrue(loadfile(path) ~= nil, "cannot parse " .. path) end
    local file = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/PZPresentation.lua", "rb"))
    local source = file:read("*a")
    file:close()
    assertEqual(nil, string.find(source, "OnFillWorldObjectContextMenu", 1, true))
end)

test("production presentation consumes translated notebook chrome with safe fallbacks", function()
    local oldRequire, oldGetText = _G.require, rawget(_G, "getText")
    local capturedWindows, capturedRuntime
    local windowStub = {
        new = function(options)
            capturedWindows = options
            return { openReader = function() end, openNotebook = function() end }
        end
    }
    local runtimeStub = {
        new = function(options)
            capturedRuntime = options
            return { translated = true }
        end
    }
    _G.require = function(moduleId)
        if moduleId == "ISUI/ISInventoryPaneContextMenu" then return true end
        if moduleId == "ConspiracyFiles/PresentationRuntime" then return runtimeStub end
        if moduleId == "ConspiracyFiles/PZWindows" then return windowStub end
        return oldRequire(moduleId)
    end
    _G.getText = function(key)
        if key == "UI_CF_NotebookHelpTab" then return key end
        return "translated:" .. key
    end
    local loaded, result = pcall(function()
        local client = assert(loadfile("mod/common/media/lua/client/ConspiracyFiles/PZPresentation.lua"))()
        return client.new({ namespace = {} })
    end)
    _G.require, _G.getText = oldRequire, oldGetText
    assertTrue(loaded, result)
    assertTrue(result.translated)
    assertEqual("translated:UI_CF_NotebookJournalTab", capturedWindows.labels.journalTab)
    assertEqual("translated:UI_CF_NotebookEmptyJournalBody", capturedWindows.labels.journalEmptyBody)
    assertEqual("translated:UI_CF_NotebookMajorMarker", capturedWindows.labels.majorMarker)
    assertEqual("Help", capturedWindows.labels.helpTab)
    assertEqual("translated:UI_CF_NotebookTitleSuffix", capturedWindows.labels.notebookSuffix)
    assertEqual("translated:UI_CF_Inspect", capturedRuntime.labels.inspect)
end)
