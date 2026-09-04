-- Conspiracy-Files Spike T10: cooperative Inspect / Mark Interesting integration.
-- Disposable development code. This is NOT production Conspiracy-Files code.

require "ISUI/ISInventoryPane"
require "ISUI/ISInventoryPaneContextMenu"
require "ISUI/ISWorldObjectContextMenu"

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T10Probe = ConspiracyFiles.T10Probe or {}

local T10 = ConspiracyFiles.T10Probe
local PREFIX = "[CF-T10]"
local MOD_ID = "ConspiracyFiles_T10_Probe"
local INSPECT_KEY = "conspiracy-files:inspect"
local MARK_KEY = "conspiracy-files:mark-interesting"
local COMPANION_KEY = "t10-companion:additive"
local active = false
local scheduled = nil
local tickCount = 0
local cases = {}
local domain = { inspectCalls = 0, markCalls = 0, faultLogs = 0 }
local ownerReadiness = false

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", "\\r"):gsub("\n", "\\n")
end

local function bool(value) return value and "true" or "false" end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    if fields then for i=1,#fields do parts[#parts+1] = fields[i] end end
    print(table.concat(parts, "|"))
end

local function saveFolder()
    local current = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(current):match("([^\\/]+)$") or ""
end

local function isProbeSave() return saveFolder():match("^T10_cooperative_inspect") ~= nil or saveFolder():match("^CF_INSPECT_cf%-v01%-e08%-owner%-attended") ~= nil end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains(MOD_ID) end)
    return countOk and count or -1, containsOk and contains == true
end

local function classIs(value, className)
    if value == nil then return false end
    local ok, result = pcall(instanceof, value, className)
    return ok and result == true
end

-- Mirrors Build 42.20.4 ISInventoryPane.getActualItems: grouped rows keep a
-- dummy duplicate at index 1, so real subjects start at index 2.
local function normalizeInventorySubjects(items)
    local result, seen = {}, {}
    for _, value in ipairs(items or {}) do
        if classIs(value, "InventoryItem") then
            if not seen[value] then result[#result+1], seen[value] = value, true end
        elseif type(value) == "table" and type(value.items) == "table" then
            for index=2,#value.items do
                local item = value.items[index]
                if classIs(item, "InventoryItem") and not seen[item] then
                    result[#result+1], seen[item] = item, true
                end
            end
        end
    end
    return result
end

local function normalizeWorldSubjects(worldobjects)
    local result, seen = {}, {}
    for _, value in ipairs(worldobjects or {}) do
        local item = nil
        if classIs(value, "IsoWorldInventoryObject") then
            local ok, resolved = pcall(function() return value:getItem() end)
            if ok then item = resolved end
        elseif classIs(value, "InventoryItem") then
            item = value
        end
        if item and not seen[item] then result[#result+1], seen[item] = item, true end
    end
    return result
end

local function validateSubject(item)
    if not classIs(item, "InventoryItem") then return nil, "not-inventory-item" end
    local ok, md = pcall(function() return item:getModData() end)
    if not ok or type(md) ~= "table" then return nil, "missing-moddata" end
    if md.cfT10Schema ~= 1 then return nil, "schema" end
    if type(md.cfAssetId) ~= "string" or md.cfAssetId == "" or #md.cfAssetId > 160 then return nil, "asset-id" end
    if md.cfRevealed ~= true then return nil, "hidden" end
    if type(md.cfResolvedTitle) ~= "string" or md.cfResolvedTitle == "" or #md.cfResolvedTitle > 240 then return nil, "title" end
    if type(md.cfResolvedBody) ~= "string" or md.cfResolvedBody == "" or #md.cfResolvedBody > 12000 then return nil, "body" end
    local displayOk, displayName = pcall(function() return item:getDisplayName() end)
    if not displayOk or type(displayName) ~= "string" then return nil, "display-name" end
    return {
        item = item,
        assetId = md.cfAssetId,
        token = type(md.cfPhysicalToken) == "string" and md.cfPhysicalToken or nil,
        title = md.cfResolvedTitle,
        body = md.cfResolvedBody,
        displayName = displayName,
        injectFault = md.cfT10InjectFault == true,
    }
end

local function isOwnedByPlayer(subject, playerNum)
    local player = getSpecificPlayer(playerNum)
    if not player or not subject or not subject.item then return false end
    local ok, outer = pcall(function() return subject.item:getOutermostContainer() end)
    return ok and outer ~= nil and outer == player:getInventory()
end

local function optionByKey(context, key)
    if not context or type(context.options) ~= "table" then return nil end
    for i=1,#context.options do
        local option = context.options[i]
        if option and option.cfT10ActionKey == key then return option end
    end
    return nil
end

local function tooltip(text)
    local ok, value = pcall(ISInventoryPaneContextMenu.addToolTip)
    if not ok or not value then return nil end
    value.description = text
    return value
end

local function safely(kind, fn)
    local ok, result = pcall(fn)
    if not ok then
        domain.faultLogs = domain.faultLogs + 1
        logEvent("BOUNDARY_ERROR", {"boundary="..kind, "error="..safe(result), "faultLogs="..tostring(domain.faultLogs)})
        return false, nil
    end
    return true, result
end

local function domainInspect(playerNum, subject)
    if subject.injectFault then error("injected-inspect-fault") end
    domain.inspectCalls = domain.inspectCalls + 1
    logEvent("DOMAIN_INSPECT", {
        "player="..tostring(playerNum), "asset="..safe(subject.assetId),
        "title="..safe(subject.title), "body="..safe(subject.body),
        "calls="..tostring(domain.inspectCalls),
    })
end

local function domainMarkInteresting(playerNum, subject)
    if subject.injectFault then error("injected-mark-fault") end
    domain.markCalls = domain.markCalls + 1
    local md = subject.item:getModData()
    local created = md.cfT10Marked ~= true
    if created then md.cfT10Marked = true end
    logEvent("DOMAIN_MARK", {
        "player="..tostring(playerNum), "asset="..safe(subject.assetId),
        "intentCalls="..tostring(domain.markCalls), "evidenceCreated="..bool(created),
    })
end

local function resolveAtActivation(playerNum, item)
    local subject, reason = validateSubject(item)
    if not subject then return nil, reason end
    return subject, nil
end

local function onInspect(_, playerNum, item)
    local subject, reason = resolveAtActivation(playerNum, item)
    if not subject then logEvent("ACTIVATION_REJECTED", {"action=inspect", "reason="..safe(reason)}); return end
    safely("inspect", function() domainInspect(playerNum, subject) end)
end

local function onMarkInteresting(_, playerNum, item)
    local subject, reason = resolveAtActivation(playerNum, item)
    if not subject then logEvent("ACTIVATION_REJECTED", {"action=mark", "reason="..safe(reason)}); return end
    if not isOwnedByPlayer(subject, playerNum) then
        logEvent("ACTIVATION_REJECTED", {"action=mark", "reason=unowned"})
        return
    end
    safely("mark-interesting", function() domainMarkInteresting(playerNum, subject) end)
end

local function addKeyedOption(context, key, label, handler, playerNum, item)
    local existing = optionByKey(context, key)
    if existing then return existing, false end
    local option = context:addOption(label, nil, handler, playerNum, item)
    if option then option.cfT10ActionKey = key end
    return option, option ~= nil
end

local function optionCount(context)
    return context and type(context.options) == "table" and #context.options or -1
end

local function preExistingNames(context)
    local names = {}
    if context and type(context.options) == "table" then
        for i=1,#context.options do names[#names+1] = safe(context.options[i] and context.options[i].name) end
    end
    return table.concat(names, ";")
end

local function addSubjectActions(playerNum, context, subjects, source, test)
    local beforeCount = optionCount(context)
    local beforeNames = preExistingNames(context)
    local valid = {}
    local invalidReasons = {}
    for i=1,#subjects do
        local subject, reason = validateSubject(subjects[i])
        if subject then valid[#valid+1] = subject else invalidReasons[#invalidReasons+1] = reason end
    end
    if #valid == 0 then
        logEvent("MENU_OMIT", {
            "source="..source, "subjects="..tostring(#subjects),
            "invalid="..tostring(#invalidReasons), "preExisting="..tostring(beforeCount),
            "preExistingNames="..beforeNames,
        })
        return false
    end
    if test then
        if ISWorldObjectContextMenu and ISWorldObjectContextMenu.setTest then ISWorldObjectContextMenu.setTest() end
        return true
    end
    if #valid > 1 then
        local option, added = addKeyedOption(context, INSPECT_KEY, "Inspect Conspiracy-Files item", nil, playerNum, nil)
        if option then
            option.notAvailable = true
            option.toolTip = tooltip("Select one Conspiracy-Files item at a time.")
        end
        logEvent("MENU_AMBIGUOUS", {"source="..source, "valid="..tostring(#valid), "added="..bool(added)})
        return added
    end
    local subject = valid[1]
    local inspect, inspectAdded = addKeyedOption(context, INSPECT_KEY, "Inspect", onInspect, playerNum, subject.item)
    local mark, markAdded = addKeyedOption(context, MARK_KEY, "Mark Interesting", onMarkInteresting, playerNum, subject.item)
    local owned = isOwnedByPlayer(subject, playerNum)
    local marked = subject.item:getModData().cfT10Marked == true
    if mark and (not owned or marked) then
        mark.notAvailable = true
        mark.toolTip = tooltip(not owned and "Take this item before marking it interesting." or "Already marked interesting.")
        mark.onSelect = nil
    end
    if inspect then inspect.cfT10SubjectAssetId = subject.assetId end
    if mark then mark.cfT10SubjectAssetId = subject.assetId end
    logEvent("MENU_ADD", {
        "source="..source, "asset="..safe(subject.assetId), "owned="..bool(owned),
        "marked="..bool(marked), "inspectAdded="..bool(inspectAdded), "markAdded="..bool(markAdded),
        "invalidAlsoSelected="..tostring(#invalidReasons), "preExisting="..tostring(beforeCount),
        "postOptions="..tostring(optionCount(context)), "preExistingNames="..beforeNames,
    })
    return inspectAdded or markAdded
end

local function inventoryHandler(playerNum, context, items)
    if not active then return end
    safely("inventory-menu", function()
        addSubjectActions(playerNum, context, normalizeInventorySubjects(items), "inventory", false)
    end)
end

local function worldHandler(playerNum, context, worldobjects, test)
    if not active then return end
    safely("world-menu", function()
        addSubjectActions(playerNum, context, normalizeWorldSubjects(worldobjects), "world", test == true)
    end)
end

local function companionHandler(_, context, items)
    if not active or #normalizeInventorySubjects(items) == 0 then return end
    if not optionByKey(context, COMPANION_KEY) then
        local option = context:addOption("T10 Companion Action", nil, function() logEvent("COMPANION_ACTIVATED") end)
        if option then option.cfT10ActionKey = COMPANION_KEY end
    end
end

local function registerHandlers()
    if T10.inventoryHandler then Events.OnFillInventoryObjectContextMenu.Remove(T10.inventoryHandler) end
    if T10.worldHandler then Events.OnFillWorldObjectContextMenu.Remove(T10.worldHandler) end
    if T10.companionHandler then Events.OnFillInventoryObjectContextMenu.Remove(T10.companionHandler) end
    T10.companionHandler = companionHandler
    T10.inventoryHandler = inventoryHandler
    T10.worldHandler = worldHandler
    Events.OnFillInventoryObjectContextMenu.Add(T10.companionHandler)
    Events.OnFillInventoryObjectContextMenu.Add(T10.inventoryHandler)
    Events.OnFillWorldObjectContextMenu.Add(T10.worldHandler)
    logEvent("REGISTER", {"mode=remove-previous-then-add", "global=ConspiracyFiles-only"})
end

local function stamp(item, id, revealed, valid, fault)
    local md = item:getModData()
    -- Probe-fixture identity is separate from the intentionally malformed
    -- production-shaped fields so every case can be rediscovered after reload.
    md.cfT10CaseId = id
    if valid then
        md.cfT10Schema = 1
        md.cfAssetId = "dead-air:asset:" .. id
        md.cfPhysicalToken = "cf-t10-token:" .. id
        md.cfRevealed = revealed == true
        md.cfResolvedTitle = "T10 " .. id
        md.cfResolvedBody = "Validated T7 body for " .. id .. " / B-37 / 93-0714."
        md.cfT10InjectFault = fault == true
    else
        md.cfT10Schema = "invalid"
        md.cfAssetId = 42
        md.cfRevealed = true
        md.cfResolvedTitle = {}
    end
    item:setName("T10 " .. id)
    item:setCustomName(true)
    return item
end

local function isFixtureCase(item, id)
    local ok, md = pcall(function() return item and item:getModData() end)
    if ok and type(md) == "table" and md.cfT10CaseId == id then return true end
    local nameOk, name = pcall(function() return item and item:getName() end)
    return nameOk and name == "T10 " .. id
end

local function findInventoryCase(id)
    local items = getPlayer():getInventory():getItems()
    for i=0,items:size()-1 do
        local item = items:get(i)
        if isFixtureCase(item, id) then return item end
    end
    return nil
end

local function inventoryCaseCount(id)
    local items = getPlayer():getInventory():getItems()
    local count = 0
    for i=0,items:size()-1 do if isFixtureCase(items:get(i), id) then count = count + 1 end end
    return count
end

local function ownerSetupContract(manifest, safe, handlersRegistered)
    if safe ~= true or handlersRegistered ~= true or type(manifest) ~= "table" then return false end
    for _, id in ipairs({"revealed-note", "revealed-note-2", "key-b37", "hidden-note", "invalid", "fault"}) do
        if manifest[id] ~= 1 then return false end
    end
    return manifest["unowned-photo"] == 1
end

local function ownerPhaseSafety()
    local player = getSpecificPlayer and getSpecificPlayer(0) or (getPlayer and getPlayer())
    local square = player and player.getCurrentSquare and player:getCurrentSquare()
    if not square or not square.getMovingObjects then return false end
    local ok, moving = pcall(function() return square:getMovingObjects() end)
    if not ok or not moving then return false end
    for i=0,moving:size()-1 do if classIs(moving:get(i), "IsoZombie") then return false end end
    return true
end

local function findWorldCase(id)
    local square = getPlayer():getCurrentSquare()
    local objectsOk, objects = pcall(function() return square and square:getWorldObjects() end)
    if not objectsOk or not objects then return nil, nil end
    for i=0,objects:size()-1 do
        local object = objects:get(i)
        if classIs(object, "IsoWorldInventoryObject") then
            local ok, item = pcall(function() return object:getItem() end)
            if ok and isFixtureCase(item, id) then
                return object, item
            end
        end
    end
    return nil, nil
end

local function worldCaseCount(id)
    local square = getPlayer():getCurrentSquare()
    local ok, objects = pcall(function() return square and square:getWorldObjects() end)
    if not ok or not objects then return 0 end
    local count = 0
    for i=0,objects:size()-1 do
        local object = objects:get(i)
        if classIs(object, "IsoWorldInventoryObject") then
            local itemOk, item = pcall(function() return object:getItem() end)
            if itemOk and isFixtureCase(item, id) then count = count + 1 end
        end
    end
    return count
end

local function inventoryCase(itemType, id, revealed, valid, fault)
    local item = findInventoryCase(id)
    if item then return item end
    item = stamp(instanceItem(itemType), id, revealed, valid, fault)
    getPlayer():getInventory():AddItem(item)
    return item
end

local function createCases()
    cases.revealed = inventoryCase("Base.Note", "revealed-note", true, true, false)
    cases.revealed2 = inventoryCase("Base.Note", "revealed-note-2", true, true, false)
    cases.key = inventoryCase("Base.Key1", "key-b37", true, true, false)
    cases.hidden = inventoryCase("Base.Note", "hidden-note", false, true, false)
    cases.invalid = inventoryCase("Base.Paperclip", "invalid", true, false, false)
    cases.fault = inventoryCase("Base.LetterHandwritten", "fault", true, true, true)
    cases.unownedWorld, cases.unowned = findWorldCase("unowned-photo")
    if not cases.unowned then
        cases.unowned = stamp(instanceItem("Base.Photo"), "unowned-photo", true, true, false)
        cases.unownedWorld = getPlayer():getCurrentSquare():AddWorldInventoryItem(cases.unowned, 0.5, 0.5, 0)
    end
    logEvent("CASES_READY", {"inventory=6", "world=1", "markedPersisted="..bool(cases.key:getModData().cfT10Marked == true)})
end

local function newMockContext()
    local context = { options = {}, numOptions = 1 }
    function context:addOption(name, target, onSelect, param1, param2)
        local option = { id=#self.options+1, name=name, target=target, onSelect=onSelect, param1=param1, param2=param2 }
        self.options[#self.options+1] = option
        self.numOptions = self.numOptions + 1
        return option
    end
    return context
end

local function countKey(context, key)
    local count = 0
    for i=1,#context.options do if context.options[i].cfT10ActionKey == key then count = count + 1 end end
    return count
end

local function describe(context)
    local values = {}
    for i=1,#context.options do
        local option = context.options[i]
        values[#values+1] = safe(option.name)..":"..safe(option.cfT10ActionKey)..":disabled="..bool(option.notAvailable)
    end
    return table.concat(values, ";")
end

local function runCase(name, items, expectedInspect, expectedMark)
    local context = newMockContext()
    companionHandler(0, context, items)
    inventoryHandler(0, context, items)
    inventoryHandler(0, context, items)
    local inspectCount, markCount = countKey(context, INSPECT_KEY), countKey(context, MARK_KEY)
    local pass = inspectCount == expectedInspect and markCount == expectedMark and countKey(context, COMPANION_KEY) == 1
    logEvent("MATRIX_CASE", {"case="..name, "pass="..bool(pass), "inspect="..inspectCount, "mark="..markCount, "options="..describe(context)})
    return pass
end

local function runMatrix()
    local player = getSpecificPlayer and getSpecificPlayer(0) or (getPlayer and getPlayer())
    local square = player and player.getCurrentSquare and player:getCurrentSquare()
    if not square then logEvent("PROBE_ERROR", {"phase=owner-setup", "reason=player-square-unavailable"}); return end
    local movingOk, moving = pcall(function() return square:getMovingObjects() end)
    if not movingOk or not moving then logEvent("PROBE_ERROR", {"phase=owner-setup", "reason=safety-observation-unavailable"}); return end
    for i=0,moving:size()-1 do if classIs(moving:get(i), "IsoZombie") then logEvent("PROBE_ERROR", {"phase=owner-setup", "reason=nearby-zombie"}); return end end
    createCases()
    if not (cases.revealed and cases.revealed2 and cases.key and cases.hidden and cases.invalid and cases.fault and cases.unowned and cases.unownedWorld) then
        logEvent("PROBE_ERROR", {"phase=owner-setup", "reason=fixture-manifest-incomplete"}); return
    end
    local manifest = {}
    for _, id in ipairs({"revealed-note", "revealed-note-2", "key-b37", "hidden-note", "invalid", "fault"}) do manifest[id] = inventoryCaseCount(id) end
    manifest["unowned-photo"] = worldCaseCount("unowned-photo")
    if not ownerSetupContract(manifest, true, T10.inventoryHandler and T10.worldHandler and T10.companionHandler) then
        logEvent("PROBE_ERROR", {"phase=owner-setup", "reason=handlers-not-registered"}); return
    end
    registerHandlers()
    registerHandlers() -- explicit duplicate-registration/reload simulation
    local pass = true
    pass = runCase("raw-single-revealed", {cases.revealed}, 1, 1) and pass
    pass = runCase("group-wrapper-single", {{items={cases.revealed,cases.revealed}}}, 1, 1, nil) and pass
    pass = runCase("group-wrapper-stack", {{items={cases.revealed,cases.revealed,cases.key}}}, 1, 0, nil) and pass
    pass = runCase("mixed-valid-invalid", {cases.revealed,cases.invalid}, 1, 1, nil) and pass
    pass = runCase("hidden", {cases.hidden}, 0, 0, nil) and pass
    pass = runCase("invalid", {cases.invalid}, 0, 0, nil) and pass
    pass = runCase("unowned", {cases.unowned}, 1, 1, nil) and pass
    pass = runCase("mark-candidate", {cases.key}, 1, 1) and pass
    local worldContext = newMockContext()
    worldHandler(0, worldContext, {cases.unownedWorld}, false)
    local worldPass = countKey(worldContext, INSPECT_KEY) == 1 and countKey(worldContext, MARK_KEY) == 1
    logEvent("MATRIX_CASE", {"case=world-inventory-object", "pass="..bool(worldPass), "options="..describe(worldContext)})
    pass = worldPass and pass
    local preflightBefore = ISWorldObjectContextMenu.Test
    ISWorldObjectContextMenu.Test = false
    worldHandler(0, newMockContext(), {cases.unownedWorld}, true)
    local preflightPass = ISWorldObjectContextMenu.Test == true
    logEvent("MATRIX_CASE", {"case=world-controller-preflight", "pass="..bool(preflightPass), "setTest="..bool(ISWorldObjectContextMenu.Test)})
    ISWorldObjectContextMenu.Test = preflightBefore
    pass = preflightPass and pass
    logEvent("MATRIX_SUMMARY", {
        "status="..(pass and "PASS" or "FAIL"),
        "constructionOnly=true", "manualActivationsRequired=true",
    })
    local inventory = getPlayerInventory(0)
    if inventory then inventory:setVisible(true); inventory:setPinned() end
    ownerReadiness = pass
    if ownerReadiness then logEvent("OWNER_FIXTURES_READY", {"status=PASS", "inventory=6", "ground=1", "safe=verified", "instruction=use-only-real-context-menu-clicks"}) end
    logEvent("READY_FOR_MANUAL_UI", {"instruction=use-only-real-context-menu-clicks;cases=revealed-note,hidden-note,invalid-paperclip,key-b37,fault-letter,unowned-photo-ground"})
end

local function onGameStart()
    if not isProbeSave() then logEvent("SKIPPED", {"reason=current-save-is-not-T10"}); return end
    local modCount, probeActive = activeModStatus()
    if (modCount ~= 1 and modCount ~= 2) or not probeActive then
        logEvent("PROBE_ERROR", {"reason=probe-must-be-only-active-mod", "count="..tostring(modCount)})
        return
    end
    active = true
    logEvent("ENVIRONMENT", {"gameVersion="..safe(getGameVersion()), "save="..saveFolder(), "activeModCount="..tostring(modCount)})
    scheduled = runMatrix
end

local function onTick()
    if not active then return end
    tickCount = tickCount + 1
    if scheduled and tickCount >= 180 then
        local fn = scheduled
        scheduled = nil
        local ok, err = pcall(fn)
        if not ok then logEvent("PROBE_ERROR", {"phase=matrix", "error="..safe(err)}) end
    end
end

T10.normalizeInventorySubjects = normalizeInventorySubjects
T10.normalizeWorldSubjects = normalizeWorldSubjects
T10.validateSubject = validateSubject
T10.registerHandlers = registerHandlers
T10.staticTest = {
    setActive = function(value) active = value == true end,
    inventoryHandler = inventoryHandler,
    worldHandler = worldHandler,
    companionHandler = companionHandler,
    optionByKey = optionByKey,
    inspectKey = INSPECT_KEY,
    markKey = MARK_KEY,
    companionKey = COMPANION_KEY,
    domain = domain,
    isFixtureCase = isFixtureCase,
}
T10.ownerPhaseReadiness = function() return ownerReadiness end
T10.ownerSetupContract = ownerSetupContract
T10.ownerPhaseSafety = ownerPhaseSafety
registerHandlers()
Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onTick)
logEvent("SCRIPT_LOADED", {"gameVersion="..safe(getGameVersion())})
