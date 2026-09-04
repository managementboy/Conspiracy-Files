ConspiracyFiles = ConspiracyFiles or {}
local Content = require("ConspiracyFiles/Content")
local NotebookUI = require("ConspiracyFiles/Notebook")
local INSPECT_ACTION = "ConspiracyFiles:Inspect"
local MARK_ACTION = "ConspiracyFiles:MarkInteresting"
local NOTEBOOK_ACTION = "ConspiracyFiles:OpenNotebook"

local function runtime()
    return ConspiracyFiles and ConspiracyFiles.Runtime or nil
end

local function inspect(_, playerNum, item)
    local ok, err = pcall(function()
        local Runtime = runtime()
        local md = item and item:getModData() or nil
        if not Runtime or not md or md.cfAssetId == nil then return end
        local discovered, evidenceId, changed = false, nil, false
        if Runtime.state then
            local asset = Content.assets[md.cfAssetId]
            discovered, evidenceId, changed = Runtime.state.discover(
                md.cfAssetId,
                "Inspected " .. tostring(md.cfResolvedTitle or item:getName()),
                md.cfFoundLocationId or (asset and asset.placementLocationId or nil)
            )
            if discovered and changed and Runtime.persist then Runtime.persist() end
        end
        print("[CF-DEAD-AIR]|EVENT|kind=DISCOVER|asset=" .. tostring(md.cfAssetId)
            .. "|created=" .. tostring(changed) .. "|evidence=" .. tostring(evidenceId or "<nil>"))
        print("[CF-DEAD-AIR]|EVENT|kind=INSPECT|asset=" .. tostring(md.cfAssetId) .. "|title=" .. tostring(md.cfResolvedTitle or item:getName()))
        print("[CF-DEAD-AIR]|BODY|asset=" .. tostring(md.cfAssetId) .. "|text=" .. tostring(md.cfResolvedBody or "<missing>"):gsub("|", "/"):gsub("\n", "\\n"))
        NotebookUI.refresh("evidence", evidenceId)
        NotebookUI.openReader(tostring(md.cfResolvedTitle or item:getName()), tostring(md.cfResolvedBody or "Text unavailable."))
    end)
    if not ok then print("[CF-DEAD-AIR]|EVENT|kind=ERROR|boundary=inspect|error=" .. tostring(err)) end
end

local function mark(_, playerNum, item)
    local Runtime = runtime()
    local md = item and item:getModData() or nil
    if not Runtime or not md or not Runtime.state then return end
    local created, evidenceId = Runtime.state.markInteresting("dead-air:mark:" .. tostring(md.cfAssetId), {
        assetId = md.cfAssetId,
        contextText = "Marked " .. tostring(md.cfResolvedTitle or item:getName()) .. " before its significance was clear",
        foundLocationId = md.cfFoundLocationId
    })
    if created and Runtime.persist then Runtime.persist() end
    NotebookUI.refresh("evidence", evidenceId)
    print("[CF-DEAD-AIR]|EVENT|kind=MARK|asset=" .. tostring(md.cfAssetId) .. "|created=" .. tostring(created) .. "|evidence=" .. tostring(evidenceId or "<nil>"))
end

local function isInventoryItem(value)
    if value == nil or not instanceof then return false end
    local ok, result = pcall(instanceof, value, "InventoryItem")
    return ok and result == true
end

local function firstItem(items)
    for _, value in ipairs(items or {}) do
        if isInventoryItem(value) then return value end
        if type(value) == "table" and type(value.items) == "table" then
            -- Build 42 grouped inventory rows contain a dummy at index 1.
            for index = 2, #value.items do
                if isInventoryItem(value.items[index]) then return value.items[index] end
            end
        end
    end
    return nil
end

local function onMenu(playerNum, context, items)
    local Runtime = runtime()
    if not Runtime or Runtime.disabled or not context then return end
    local notebookPresent = false
    for _, existing in ipairs(context.options or {}) do
        if existing.cfDeadAirAction == NOTEBOOK_ACTION then notebookPresent = true; break end
    end
    if not notebookPresent then
        local openOption = context:addOption("Open Survivor Notebook", nil, NotebookUI.open)
        if openOption then openOption.cfDeadAirAction = NOTEBOOK_ACTION end
    end
    local item = firstItem(items)
    if not item or not item.getModData then return end
    local md = item:getModData()
    if not md or md.cfAssetId == nil then return end
    local ordinary = md.cfAssetKind == "ordinary-object"
    local option = context:addOption(ordinary and "Mark Interesting" or "Inspect Dead Air", nil, ordinary and mark or inspect, playerNum, item)
    if option then option.cfDeadAirAction = ordinary and MARK_ACTION or INSPECT_ACTION end
end

Events.OnFillInventoryObjectContextMenu.Add(onMenu)
