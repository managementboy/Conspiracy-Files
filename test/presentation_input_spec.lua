local CF = require("ConspiracyFiles")
local ids = CF.Content.ids

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
    assertTrue(CF.ItemPresentation.stamp(item, assetId, options))
    return item
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
    local runtime = CF.PresentationRuntime.new({
        port = port,
        persistenceProvider = function() return persistence end,
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
    local key = stamp(ids.key, false, { physicalToken = "cf:save:key:1" })
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
        local ok, result, changed = domain.discover(ids.d2, "Inspected after opening the notebook.", ids.police)
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
    for _, resolution in ipairs({ {800, 600}, {1280, 720}, {1920, 1080}, {2560, 1440}, {3840, 2160} }) do
        for _, kind in ipairs({ "reader", "notebook" }) do
            local value = CF.WindowGeometry.centered(resolution[1], resolution[2], kind)
            assertTrue(value.width >= 460)
            assertTrue(value.height >= 380)
            assertTrue(value.x >= 0 and value.y >= 0)
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
