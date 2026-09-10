local R=require("ConspiracyFiles/GeneratedRuntime")
local Menu=require("ConspiracyFiles/ContextMenu")
local UI=require("ConspiracyFiles/Notebook")
ConspiracyFiles=ConspiracyFiles or {}
local M=ConspiracyFiles.GeneratedMenu or {}
ConspiracyFiles.GeneratedMenu=M
function M.open(id)
    if UI.reader then UI.reader:close() end
    UI.open("evidence",type(id)=="string" and id or nil)
end
function M.fill(playerNum,context,items)
    if not getDebug or not getDebug() or not context or playerNum~=0 then return end
    if (isClient and isClient()) or (isServer and isServer()) then return end
    if not R.metrics() then return end
    local subjects,overflow=Menu.normalize(items)
    if overflow or #subjects~=1 then return end
    local item=subjects[1]
    if not R.subject(item) then return end
    local expected=item:getOutermostContainer()
    -- An icon for the ACTION, not for the thing. Owner, 2026-09-10: "I meant
    -- an Icon that represents the action not the content. In the case of
    -- inspect something like magnifying glass?"
    --
    -- Item icons are packed rather than loose files in Build 42, so each of
    -- these is tried in turn and the first that resolves is used. No icon at
    -- all is an acceptable outcome: a missing texture must never cost the
    -- player the menu option.
    local function icon(...)
        if not getTexture then return nil end
        for _,path in ipairs({...}) do
            local ok,texture=pcall(getTexture,path)
            if ok and texture then return texture end
        end
        return nil
    end
    local lookIcon=icon("media/ui/Search_Icon_On.png",
        "media/ui/Properties/InventoryProperty_Research.png")
    local noteIcon=icon("Item_Notebook","media/ui/Properties/InventoryProperty_Research.png",
        "media/ui/Search_Icon_On.png")
    local option=context:addOption("Inspect Investigation Evidence",nil,function()
        if item:getOutermostContainer()~=expected then return end
        local ok,inspected=pcall(R.inspect,item)
        if ok and inspected then M.open(item:getModData().cfGeneratedId) end
    end)
    local carried=expected==getSpecificPlayer(playerNum):getInventory()
    if option then option.notAvailable=not carried; option.iconTexture=lookIcon end
    -- Note it where it lies. A pile of eleven credit cards is evidence the
    -- player should be able to record without emptying a drawer into their
    -- pockets; so, later, is a body in a boot. The notebook opens either way,
    -- because the point of noting a thing is to read what was noted.
    if not carried then
        local here=context:addOption("Note in the Investigation",nil,function()
            if item:getOutermostContainer()~=expected then return end
            local ok,noted=pcall(R.inspect,item,true)
            if ok and noted then M.open(item:getModData().cfGeneratedId) end
        end)
        if here then here.notAvailable=false; here.iconTexture=noteIcon end
    end
end
if not M.handler then
    M.handler=function(...) return M.fill(...) end
    Events.OnFillInventoryObjectContextMenu.Add(M.handler)
end
return M
