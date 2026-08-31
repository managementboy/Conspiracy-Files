-- Conspiracy-Files Spike T7: runtime item text and reader behavior probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T7Probe = ConspiracyFiles.T7Probe or {}

local T7 = ConspiracyFiles.T7Probe
local PREFIX = "[CF-T7]"
local CONTROL_TAG = "ConspiracyFiles.T7.Control"
local MOD_ID = "ConspiracyFiles_T7_Probe"
local active = false
local scheduled = nil
local tickCount = 0
local quitTicks = 0
local autoContinuePending = true
local autoContinueTicks = 0
local shouldQuit = false

local PAGE_BODY = "CF-T7 RUNTIME BODY\nLine 2: B-37 / 93-0714 / cafe naive.\nFormatting probes shown literally: <LINE> <RGB:1,0,0> \\n 100%."
local PAGE_TWO = "CF-T7 PAGE TWO\nResolved per-world code: RS31-B37.\nPunctuation: apostrophe ' quote \" slash / backslash \\."
local DYNAMIC_TITLE = "T7 Dynamic Photo RS31-B37"
local DYNAMIC_INFO = "<type:parent, width:640, height:760><type:texture, width:640, height:760, r:0.80, g:0.82, b:0.76>"
local DYNAMIC_BODY = "DYNAMIC WORLD BODY\\nRS31-B37 / runtime-only.\\nFormatting <LINE> <RGB:1,0,0> 100%."

local CASES = {
    { id="notebook-pages", type="Base.Notebook", name="T7 01 Notebook - Rourke Log", mode="pages" },
    { id="note-pages", type="Base.Note", name="T7 02 Note - Service Ticket", mode="pages" },
    { id="letter-pages", type="Base.LetterHandwritten", name="T7 03 Letter - Pike", mode="pages" },
    { id="photo-pages", type="Base.Photo", name="T7 04 Photo - Relay Site", mode="pages" },
    { id="static-print", type="Base.LetterHandwritten", name="T7 05 Static Print Memo", mode="static-print" },
    { id="dynamic-print", type="Base.Photo", name="T7 06 Dynamic Print Photo", mode="dynamic-print" },
    { id="generic", type="Base.Paperclip", name="T7 07 Generic Paperclip", mode="moddata" },
    { id="key", type="Base.Key1", name="T7 08 Key - B-37", mode="moddata" },
    { id="map", type="Base.MuldraughMap", name="T7 09 Map - Relay Route", mode="moddata" },
}

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

local function isProbeSave()
    return saveFolder():match("^T7_runtime_text") ~= nil
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
    end
    return value
end

local function findCaseDefinition(id)
    for i=1,#CASES do if CASES[i].id == id then return CASES[i] end end
    return nil
end

local function eachInventoryItem(fn)
    local items = getPlayer():getInventory():getItems()
    for i=0,items:size()-1 do fn(items:get(i)) end
end

local function findCaseItem(id)
    local found = nil
    eachInventoryItem(function(item)
        local md = item:getModData()
        if md and md.cfT7Case == id then found = item end
    end)
    return found
end

local function removeOldProbeItems()
    local remove = {}
    eachInventoryItem(function(item)
        local md = item:getModData()
        if md and md.cfT7Case then remove[#remove+1] = item end
    end)
    for i=1,#remove do getPlayer():getInventory():Remove(remove[i]) end
    return #remove
end

local function className(item)
    local ok, value = pcall(function() return item:getFullType() end)
    return ok and safe(value) or "unavailable"
end

local function pageValue(item, page)
    local ok, value = pcall(function() return item:seePage(page) end)
    return ok and value or nil
end

local function pageCount(item)
    local ok, pages = pcall(function() return item:getCustomPages() end)
    if not ok or not pages then return -1 end
    local sizeOk, size = pcall(function() return pages:size() end)
    return sizeOk and size or -1
end

local function stampCommon(item, def)
    local md = item:getModData()
    md.cfT7Case = def.id
    md.cfT7Schema = 1
    md.cfResolvedTitle = def.name
    md.cfResolvedDescription = "T7 description for " .. def.id .. " / B-37"
    md.cfResolvedBody = PAGE_BODY
    item:setName(def.name)
    item:setCustomName(true)
    item:setDescription(md.cfResolvedDescription)
end

local function configure(item, def)
    stampCommon(item, def)
    local md = item:getModData()
    if def.mode == "pages" then
        item:setCanBeWrite(true)
        item:setPageToWrite(2)
        item:addPage(1, PAGE_BODY)
        item:addPage(2, PAGE_TWO)
        item:setLockedBy("ConspiracyFilesT7")
    elseif def.mode == "static-print" then
        md.literatureTitle = "cf-t7-static-print"
        md.printMedia = {
            id = "cf-t7-static-print",
            title = "Print_Media_CF_T7_Static_title",
            info = "Print_Media_CF_T7_Static_info",
            text = "Print_Media_CF_T7_Static_text",
        }
    elseif def.mode == "dynamic-print" then
        md.literatureTitle = "cf-t7-dynamic-print"
        md.printMedia = {
            id = "cf-t7-dynamic-print",
            title = DYNAMIC_TITLE,
            info = DYNAMIC_INFO,
            text = DYNAMIC_BODY,
        }
    end
end

local function emitItem(stage, def, item)
    local md = item and item:getModData() or nil
    local printMedia = md and md.printMedia or nil
    local p1 = item and pageValue(item, 1) or nil
    local namePass = item and item:getName() == def.name
    local modDataPass = md and md.cfResolvedTitle == def.name and md.cfResolvedDescription == "T7 description for " .. def.id .. " / B-37" and md.cfResolvedBody == PAGE_BODY
    local pagePass = def.mode ~= "pages" or (p1 == PAGE_BODY and pageValue(item, 2) == PAGE_TWO)
    logEvent("ITEM", {
        "stage="..stage,
        "case="..def.id,
        "type="..def.type,
        "class="..(item and className(item) or "missing"),
        "present="..bool(item ~= nil),
        "name="..safe(item and item:getName()),
        "displayName="..safe(item and item:getDisplayName()),
        "customName="..bool(item and item:isCustomName()),
        "description="..safe(item and item:getDescription()),
        "isLiterature="..bool(item and item:IsLiterature()),
        "isMap="..bool(item and item:IsMap()),
        "canBeWrite="..bool(item and item:IsLiterature() and item:canBeWrite()),
        "lockedBy="..safe(item and item:IsLiterature() and item:getLockedBy()),
        "pageCount="..tostring(item and item:IsLiterature() and pageCount(item) or -1),
        "page1="..safe(p1),
        "modTitle="..safe(md and md.cfResolvedTitle),
        "modDescription="..safe(md and md.cfResolvedDescription),
        "modBody="..safe(md and md.cfResolvedBody),
        "printTitleKey="..safe(printMedia and printMedia.title),
        "namePass="..bool(namePass),
        "modDataPass="..bool(modDataPass),
        "pagePass="..bool(pagePass),
    })
    return item ~= nil and namePass and modDataPass and pagePass
end

local function createMatrix()
    local removed = removeOldProbeItems()
    logEvent("CLEAN_PROBE_ITEMS", {"removed="..tostring(removed)})
    local allPass = true
    for i=1,#CASES do
        local def = CASES[i]
        local item = instanceItem(def.type)
        if not item then
            logEvent("CREATE_FAIL", {"case="..def.id,"type="..def.type})
            allPass = false
        else
            configure(item, def)
            getPlayer():getInventory():AddItem(item)
            if not emitItem("pre-save", def, item) then allPass = false end
        end
    end
    local _, staticTitle = pcall(getText, "Print_Media_CF_T7_Static_title")
    local _, staticBody = pcall(getText, "Print_Media_CF_T7_Static_text")
    local rawTitleOk, rawTitle = pcall(getText, DYNAMIC_TITLE)
    local rawBodyOk, rawBody = pcall(getText, DYNAMIC_BODY)
    local languageOk, language = pcall(function() return Translator.getLanguage():name() end)
    logEvent("TRANSLATION", {
        "language="..safe(languageOk and language or "unavailable"),
        "staticTitle="..safe(staticTitle),
        "staticBody="..safe(staticBody),
        "rawTitleResult="..safe(rawTitle),
        "rawBodyResult="..safe(rawBody),
        "rawTitleCallOk="..bool(rawTitleOk and rawTitle ~= nil),
        "rawBodyCallOk="..bool(rawBodyOk and rawBody ~= nil),
        "rawTitleExact="..bool(rawTitle == DYNAMIC_TITLE),
        "rawBodyExact="..bool(rawBody == DYNAMIC_BODY),
    })
    local c = control()
    c.phase = 1
    c.createdCount = #CASES
    c.preSavePass = allPass
    local saveStart = getTimeInMillis()
    local ok, err = pcall(saveGame)
    logEvent("SAVE", {"returned="..bool(ok),"error="..safe(err),"durationMs="..tostring(getTimeInMillis()-saveStart)})
    shouldQuit = true
end

local function validateReload()
    local allPass = true
    local descriptionPersistedCount = 0
    for i=1,#CASES do
        local def = CASES[i]
        local item = findCaseItem(def.id)
        if item and item:getDescription() == "T7 description for " .. def.id .. " / B-37" then
            descriptionPersistedCount = descriptionPersistedCount + 1
        end
        if not emitItem("post-load", def, item) then allPass = false end
    end
    local c = control()
    c.phase = 2
    c.postLoadPass = allPass
    c.descriptionPersistedCount = descriptionPersistedCount
    logEvent("RELOAD_SUMMARY", {
        "createdCount="..tostring(c.createdCount or -1),
        "preSavePass="..bool(c.preSavePass == true),
        "postLoadPass="..bool(allPass),
        "descriptionPersistedCount="..tostring(descriptionPersistedCount),
        "descriptionTotal="..tostring(#CASES),
    })
    logEvent("READY_FOR_UI", {"status=waiting","instruction=right-click-stamped-items-and-use-native-read-inspect-check-map"})
    local inventoryPage = getPlayerInventory(0)
    if inventoryPage then
        inventoryPage:setVisible(true)
        inventoryPage:setPinned()
        logEvent("UI_SETUP", {"inventoryVisible=true", "inventoryPinned=true"})
    end
    local staticPrint = findCaseItem("static-print")
    local uiOk, uiErr = pcall(function()
        local reader = ISReadABook:new(getPlayer(), staticPrint, 150)
        reader:displayPrintMedia()
    end)
    logEvent("UI_AUTO_OPEN", {"case=static-print", "action=native-print-media", "ok="..bool(uiOk), "error="..safe(uiErr)})
end

local function beginRun()
    local modCount, probeActive = activeModStatus()
    if modCount ~= 1 or not probeActive then error("probe-must-be-only-active-mod count="..tostring(modCount)) end
    local c = control()
    logEvent("ENVIRONMENT", {
        "gameVersion="..gameVersion(),
        "save="..saveFolder(),
        "phase="..tostring(c.phase or 0),
        "activeModCount="..tostring(modCount),
    })
    if tonumber(c.phase) == 0 then
        scheduled = createMatrix
    else
        scheduled = validateReload
    end
end

local function flattenContextItems(items)
    if ISInventoryPane and ISInventoryPane.getActualItems then
        local ok, value = pcall(ISInventoryPane.getActualItems, items)
        if ok and value then return value end
    end
    return items or {}
end

local function onFillInventoryObjectContextMenu(player, context, items)
    if not active then return end
    local actual = flattenContextItems(items)
    local cases = {}
    for i=1,#actual do
        local item = actual[i]
        local md = item and item:getModData() or nil
        if md and md.cfT7Case then cases[#cases+1] = md.cfT7Case end
    end
    if #cases == 0 then return end
    local optionNames = {}
    if context and context.options then
        for i=1,#context.options do
            local option = context.options[i]
            optionNames[#optionNames+1] = safe(option and option.name) .. ":disabled=" .. bool(option and option.notAvailable)
        end
    end
    logEvent("CONTEXT_MENU", {
        "player="..tostring(player),
        "cases="..table.concat(cases, ","),
        "options="..table.concat(optionNames, ";"),
    })
end

local function onGameStart()
    if not isProbeSave() then logEvent("SKIPPED", {"reason=current-save-is-not-T7"}); return end
    active = true
    local ok, err = pcall(beginRun)
    if not ok then
        logEvent("PROBE_ERROR", {"phase=begin","error="..safe(err)})
        shouldQuit = true
    end
end

local function onTick()
    if not active then return end
    tickCount = tickCount + 1
    if scheduled and tickCount >= 180 then
        local fn = scheduled
        scheduled = nil
        local ok, err = pcall(fn)
        if not ok then
            logEvent("PROBE_ERROR", {"phase=scheduled","error="..safe(err)})
            shouldQuit = true
        end
    end
    if shouldQuit then
        quitTicks = quitTicks + 1
        if quitTicks >= 240 then
            active = false
            logEvent("AUTO_QUIT", {"status=normal-quit-to-desktop-requested"})
            getCore():quitToDesktop()
        end
    end
end

local function onAutoContinueTick()
    if not autoContinuePending then return end
    autoContinueTicks = autoContinueTicks + 1
    if autoContinueTicks < 30 then return end
    local latest = getLatestSave and getLatestSave() or nil
    local saveName = latest and latest[1] or nil
    local gameMode = latest and latest[2] or nil
    if type(saveName) ~= "string" or not saveName:match("^T7_runtime_text") then
        autoContinuePending = false
        logEvent("AUTO_CONTINUE_SKIPPED", {"reason=latest-save-is-not-T7"})
        return
    end
    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars or not MainScreen.continueLatestSave then return end
    autoContinuePending = false
    logEvent("AUTO_CONTINUE", {"save="..saveName,"gameMode="..safe(gameMode)})
    MainScreen.continueLatestSave(gameMode, saveName)
end

local function onMainMenuEnter()
    autoContinuePending = true
    autoContinueTicks = 0
    logEvent("AUTO_MENU_READY", {"status=waiting-for-main-screen-instance"})
end

local function onKeyPressed(key)
    if not active then return end
    local caseId = nil
    local action = nil
    if key == Keyboard.KEY_F6 then caseId = "notebook-pages"; action = "native-journal"
    elseif key == Keyboard.KEY_F7 then caseId = "static-print"; action = "native-print-media"
    elseif key == Keyboard.KEY_F8 then caseId = "dynamic-print"; action = "native-print-media"
    elseif key == Keyboard.KEY_F9 then caseId = "map"; action = "native-map" end
    if not caseId then return end
    local item = findCaseItem(caseId)
    local ok, err = pcall(function()
        if action == "native-journal" then
            ISInventoryPaneContextMenu.onWriteSomething(item, false, 0)
        elseif action == "native-print-media" then
            local reader = ISReadABook:new(getPlayer(), item, 150)
            reader:displayPrintMedia()
        else
            ISInventoryPaneContextMenu.onCheckMap(item, 0)
        end
    end)
    logEvent("UI_ACTION", {"key="..tostring(key), "case="..caseId, "action="..action, "ok="..bool(ok), "error="..safe(err)})
end

T7.findCaseItem = findCaseItem
T7.cases = CASES
Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)
Events.OnFillInventoryObjectContextMenu.Add(onFillInventoryObjectContextMenu)
Events.OnKeyPressed.Add(onKeyPressed)
logEvent("SCRIPT_LOADED", {"gameVersion="..gameVersion()})
