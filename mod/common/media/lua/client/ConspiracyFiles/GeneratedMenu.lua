local R=require("ConspiracyFiles/GeneratedRuntime")
local Menu=require("ConspiracyFiles/ContextMenu")
ConspiracyFiles=ConspiracyFiles or {}
local M=ConspiracyFiles.GeneratedMenu or {}
ConspiracyFiles.GeneratedMenu=M
-- ONE READING SURFACE (P4-R79, P4-R128): the organiser the survivor carries.
-- The hand is the switch (Organiser.handTick): this only asks the survivor to
-- take the machine out, and Knox.OS opens when it reaches their hand. No
-- machine, no reading - a survivor without one has to find one, which is why
-- organisers exist in the world (P4-R80).
function M.open()
    local organiser=ConspiracyFiles.Organiser
    if organiser and organiser.held then
        local ok,item=pcall(organiser.held)
        if ok and item and pcall(organiser.read) then return true end
    end
    local voice=ConspiracyFiles.PlayerVoice
    local player=getPlayer and getPlayer()
    if voice and voice.speak and player then
        pcall(voice.speak,player,"I need something to read this on.","No machine")
    end
    return false
end
function M.fill(playerNum,context,items)
    if not getDebug or not getDebug() or not context or playerNum~=0 then return end
    if (isClient and isClient()) or (isServer and isServer()) then return end
    if not R.metrics() then return end
    local subjects,overflow=Menu.normalize(items)
    if overflow or #subjects~=1 then return end
    local item=subjects[1]
    if not R.subject(item) then
        -- A finished case's own evidence is already in the organiser. Showing
        -- nothing read as "cannot be logged" in play (2026-09-15, P4-R118).
        if R.retiredPaper and R.retiredPaper(item) then
            local done=context:addOption("Already in the organiser",nil,nil)
            if done then done.notAvailable=true end
        end
        return
    end
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
    -- Inspecting records the thing; it does NOT open the machine. Owner,
    -- 2026-09-12: "Inspecting an object does not open it." Reading happens when
    -- the survivor takes the organiser in hand, and not as a side effect of
    -- picking a clue up.
    local carried=expected==getSpecificPlayer(playerNum):getInventory()
    -- With the organiser in hand you can record a document where it lies.
    --
    -- Inspect used to be greyed out unless the clue was in your pockets, so
    -- reading a drawer meant emptying it into them first - "very very
    -- bothersome and makes the game unplayable" (owner, 2026-09-13). The two
    -- paths were never different work: R.inspect(item,true) records exactly
    -- the same thing, and the only distinction was where the item was allowed
    -- to be.
    --
    -- The organiser being OPEN is the condition, because it is the machine
    -- doing the recording and the mod's rule is that it must be in your hand
    -- to do anything. Without it, the old behaviour stands.
    local screen=ConspiracyFiles.OrganiserScreen
    local reading=(screen and screen.window and screen.window.on)==true
    local option=context:addOption("Inspect Investigation Evidence",nil,function()
        if item:getOutermostContainer()~=expected then return end
        pcall(R.inspect,item,not carried)
    end)
    if option then
        option.notAvailable=not (carried or reading)
        option.iconTexture=lookIcon

    end
    -- Note it where it lies. A pile of eleven credit cards is evidence the
    -- player should be able to record without emptying a drawer into their
    -- pockets; so, later, is a body in a boot. The organiser opens either way,
    -- because the point of noting a thing is to read what was noted.
    -- The separate wording is only worth showing when Inspect cannot do it.
    if not carried and not reading then
        local here=context:addOption("Note in the Investigation",nil,function()
            if item:getOutermostContainer()~=expected then return end
            pcall(R.inspect,item,true)
        end)
        if here then here.notAvailable=false; here.iconTexture=noteIcon end
    end
end
if not M.handler then
    M.handler=function(...) return M.fill(...) end
    Events.OnFillInventoryObjectContextMenu.Add(M.handler)
end
return M
