local EngineAPI=require("NHShared/EngineAPI")
local R=EngineAPI.GeneratedRuntime
local Menu=require("NHShared/ContextMenu")
local Actions=require("NHShared/ClueActions")
NHShared=NHShared or {}
local M=NHShared.GeneratedMenu or {}
NHShared.GeneratedMenu=M
NHInteract=NHInteract or {};NHInteract.GeneratedMenu=M
-- STRADDLE: resolved to module A (docs/design/MODULE_SEPARATION_2026-09-26.md
-- section 2.6) - menu-item construction is an interaction concern, despite
-- the "Generated" name. Its one real reach into module B (picking whichever
-- of GeneratedRuntime/MapMediaRuntime claims a given item) goes through
-- EngineAPI.lua, NHEngine's PublicAPI, not the shared NHShared table.
-- ONE READING SURFACE (P4-R79, P4-R128): the organiser the survivor carries.
-- The hand is the switch (Organiser.handTick): this only asks the survivor to
-- take the machine out, and Knox.OS opens when it reaches their hand. No
-- machine, no reading - a survivor without one has to find one, which is why
-- organisers exist in the world (P4-R80).
function M.open()
    local organiser=NHShared.Organiser
    if organiser and organiser.held then
        local ok,item=pcall(organiser.held)
        if ok and item and pcall(organiser.read) then return true end
    end
    local voice=NHShared.PlayerVoice
    local player=getPlayer and getPlayer()
    if voice and voice.speak and player then
        pcall(voice.speak,player,"I need something to read this on.","No machine")
    end
    return false
end
function M.fill(playerNum,context,items)
    if not context or playerNum~=0 then return end
    if (isClient and isClient()) or (isServer and isServer()) then return end
    local subjects,overflow=Menu.normalize(items)
    if overflow or #subjects~=1 then return end
    local item=subjects[1]
    local maps=EngineAPI.MapMediaRuntime
    local R=(maps and maps.subject(item)) and maps or R
    if R~=maps and not R.metrics() then return end
    if not R.subject(item) then return end
    local expected=item:getOutermostContainer()
    local player=getSpecificPlayer(playerNum)
    local carried=expected==player:getInventory()
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
    -- A clue nobody has recognised is the plain item it looks like: no
    -- Inspect, no Note (P4-R132). Carried, it can be looked over - a short
    -- timed action - so a clue looted without searching is never lost to the
    -- case. Lying in the world, searching is the way.
    if R.isRecognised and not R.isRecognised(item) then
        if carried then
            local look=context:addOption("Look it over",nil,function()
                if item:getOutermostContainer()~=player:getInventory() then return end
                pcall(Actions.lookItOver,player,item)
            end)
            if look then look.iconTexture=lookIcon end
        end
        return
    end
    local noteIcon=icon("Item_Notebook","media/ui/Properties/InventoryProperty_Research.png",
        "media/ui/Search_Icon_On.png")
    -- Inspecting records the thing; it does NOT open the machine. Owner,
    -- 2026-09-12: "Inspecting an object does not open it." Reading happens when
    -- the survivor takes the organiser in hand, and not as a side effect of
    -- picking a clue up.
    -- With the organiser in hand you can record a document where it lies.
    --
    -- ONE OPTION, always available (P4-R138). It was greyed out unless the clue
    -- was in your pockets or the organiser was already open, with a second
    -- entry, "Note in the Investigation", doing the identical work in place -
    -- so the menu offered one act twice, one of them refused. Owner, Windows,
    -- 2026-09-18, on the greyed line: "I cant access the inspect evidence
    -- button... don't remember why?" Nobody should have to. Inspecting a clue
    -- where it lies records exactly what inspecting a carried one does, marks
    -- the map the same way (P4-R137), and the organiser is taken in hand by the
    -- action itself.
    local option=context:addOption("Inspect Investigation Evidence",nil,function()
        if item:getOutermostContainer()~=expected then return end
        -- A timed action with the game's progress bar (P4-R132); the record
        -- is written when the bar completes, and only if the thing is still
        -- where it was.
        pcall(Actions.inspect,player,item,not carried,expected)
    end)
    if option then option.iconTexture=(carried and lookIcon) or noteIcon end
end
if not M.handler then
    M.handler=function(...) return M.fill(...) end
    require("NHShared/Events/InteractionEvents").on("OnFillInventoryObjectContextMenu", M.handler)
end
return M
