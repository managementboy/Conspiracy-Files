local failures = 0

local function check(name, condition)
    if condition then
        print("PASS " .. name)
    else
        failures = failures + 1
        print("FAIL " .. name)
    end
end

function require() end

local function event()
    local callbacks = {}
    return {
        callbacks = callbacks,
        Add = function(callback) callbacks[#callbacks + 1] = callback end,
        Remove = function(callback)
            for index = #callbacks, 1, -1 do
                if callbacks[index] == callback then table.remove(callbacks, index) end
            end
        end,
    }
end

Events = {
    OnFillInventoryObjectContextMenu = event(),
    OnFillWorldObjectContextMenu = event(),
    OnGameStart = event(),
    OnTick = event(),
}

ISInventoryPaneContextMenu = {
    addToolTip = function() return {} end,
}

ISWorldObjectContextMenu = {
    Test = false,
    setTest = function() ISWorldObjectContextMenu.Test = true end,
}

ISInventoryPane = {}
Keyboard = { KEY_F6 = 64, KEY_F7 = 65, KEY_F8 = 66 }

local inventory = {}
local player = { getInventory = function() return inventory end }

function getSpecificPlayer() return player end
function getGameVersion() return "42.20.4" end
function instanceof(value, className) return type(value) == "table" and value.__class == className end

local function item(id, owned, revealed, valid, fault)
    local modData
    if valid == false then
        modData = { cfT10Schema = "bad", cfAssetId = 42, cfRevealed = true }
    else
        modData = {
            cfT10Schema = 1,
            cfAssetId = "dead-air:asset:" .. id,
            cfPhysicalToken = "token:" .. id,
            cfRevealed = revealed ~= false,
            cfResolvedTitle = "Title " .. id,
            cfResolvedBody = "Body " .. id,
            cfT10InjectFault = fault == true,
        }
    end
    return {
        __class = "InventoryItem",
        getModData = function() return modData end,
        getDisplayName = function() return "Display " .. id end,
        getOutermostContainer = function() return owned and inventory or {} end,
    }
end

local function worldObject(value)
    return { __class = "IsoWorldInventoryObject", getItem = function() return value end }
end

local function context()
    local value = { options = {} }
    function value:addOption(name, target, callback, param1, param2)
        local option = {
            name = name,
            target = target,
            onSelect = callback,
            param1 = param1,
            param2 = param2,
        }
        self.options[#self.options + 1] = option
        return option
    end
    return value
end

local function countKey(value, key)
    local count = 0
    for index = 1, #value.options do
        if value.options[index].cfT10ActionKey == key then count = count + 1 end
    end
    return count
end

dofile("dev/t10-cooperative-inspect/common/media/lua/client/ConspiracyFilesT10Probe.lua")

local probe = ConspiracyFiles.T10Probe
local test = probe.staticTest
test.setActive(true)

local revealed = item("revealed", true, true, true, false)
local key = item("key", true, true, true, false)
local hidden = item("hidden", true, false, true, false)
local invalid = item("invalid", true, true, false, false)
local unowned = item("unowned", false, true, true, false)
local fault = item("fault", true, true, true, true)

local normalized = probe.normalizeInventorySubjects({
    revealed,
    { items = { revealed, revealed, key } },
})
check("normalization skips dummy and deduplicates", #normalized == 2 and normalized[1] == revealed and normalized[2] == key)

local validSubject = probe.validateSubject(revealed)
check("revealed T7-shaped ModData validates", validSubject and validSubject.assetId == "dead-air:asset:revealed")
check("hidden subject is rejected", select(2, probe.validateSubject(hidden)) == "hidden")
check("invalid subject is rejected", select(2, probe.validateSubject(invalid)) == "schema")
invalid:getModData().cfT10CaseId = "invalid"
check("fixture identity rediscovery is independent of malformed subject fields",
    test.isFixtureCase(invalid, "invalid") and not test.isFixtureCase(invalid, "other"))

local single = context()
test.companionHandler(0, single, { revealed })
test.inventoryHandler(0, single, { revealed })
test.inventoryHandler(0, single, { revealed })
check("cooperative listener survives and private keys suppress duplicates",
    countKey(single, test.companionKey) == 1 and countKey(single, test.inspectKey) == 1 and countKey(single, test.markKey) == 1)

local sameLabel = context()
local foreignInspect = sameLabel:addOption("Inspect", nil, function() end)
test.inventoryHandler(0, sameLabel, { revealed })
check("a foreign same-label action is preserved because ownership is key-based",
    sameLabel.options[1] == foreignInspect and #sameLabel.options == 3 and countKey(sameLabel, test.inspectKey) == 1)

local mixed = context()
test.inventoryHandler(0, mixed, { revealed, invalid })
check("mixed valid and invalid selection exposes only valid subject actions",
    countKey(mixed, test.inspectKey) == 1 and countKey(mixed, test.markKey) == 1)

local ambiguous = context()
test.inventoryHandler(0, ambiguous, { revealed, key })
local ambiguousInspect = test.optionByKey(ambiguous, test.inspectKey)
check("ambiguous multi-selection adds one disabled inspect hint",
    countKey(ambiguous, test.inspectKey) == 1 and countKey(ambiguous, test.markKey) == 0 and ambiguousInspect.notAvailable == true)

local omitted = context()
test.inventoryHandler(0, omitted, { hidden, invalid })
check("hidden and invalid selections leak no actions", #omitted.options == 0)

local unownedContext = context()
test.inventoryHandler(0, unownedContext, { unowned })
local unownedInspect = test.optionByKey(unownedContext, test.inspectKey)
local unownedMark = test.optionByKey(unownedContext, test.markKey)
check("unowned item remains inspectable but cannot be marked",
    unownedInspect and unownedInspect.onSelect and unownedMark and unownedMark.notAvailable and unownedMark.onSelect == nil)

local markContext = context()
test.inventoryHandler(0, markContext, { key })
local firstMark = test.optionByKey(markContext, test.markKey)
firstMark.onSelect(firstMark.target, firstMark.param1, firstMark.param2)
local markedContext = context()
test.inventoryHandler(0, markedContext, { key })
local marked = test.optionByKey(markedContext, test.markKey)
check("mark intent creates once and disables later menu activation",
    test.domain.markCalls == 1 and key:getModData().cfT10Marked == true and marked.notAvailable and marked.onSelect == nil)

local faultContext = context()
test.inventoryHandler(0, faultContext, { fault })
local faultInspect = test.optionByKey(faultContext, test.inspectKey)
faultInspect.onSelect(faultInspect.target, faultInspect.param1, faultInspect.param2)
check("callback fault is contained at the adapter boundary", test.domain.inspectCalls == 0 and test.domain.faultLogs == 1)

local world = worldObject(unowned)
local worldContext = context()
test.worldHandler(0, worldContext, { world }, false)
check("world inventory object resolves to the same action contract",
    countKey(worldContext, test.inspectKey) == 1 and countKey(worldContext, test.markKey) == 1)

ISWorldObjectContextMenu.Test = false
test.worldHandler(0, context(), { world }, true)
check("controller preflight calls vanilla setTest only for a valid subject", ISWorldObjectContextMenu.Test == true)

ISWorldObjectContextMenu.Test = false
test.worldHandler(0, context(), { worldObject(hidden) }, true)
check("controller preflight stays silent for a hidden subject", ISWorldObjectContextMenu.Test == false)

probe.registerHandlers()
probe.registerHandlers()
check("listener registration is idempotent and additive",
    #Events.OnFillInventoryObjectContextMenu.callbacks == 2 and #Events.OnFillWorldObjectContextMenu.callbacks == 1)

if failures > 0 then
    error(tostring(failures) .. " static T10 probe checks failed")
end

print("PASS summary: 17 static T10 probe checks")
