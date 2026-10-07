-- The moment the player looks into a container, remember it.
--
-- ISInventoryPage:selectContainer is where the loot panel switches to showing
-- one container's contents - from a click on its icon or on the object in the
-- world (ISObjectClickHandler routes there too). After the original has run,
-- the container's parent object is marked (SearchedContainers.mark), and from
-- then on no clue may be written into it. See shared/OIShared/
-- SearchedContainers.lua for why isExplored could not carry this.
local Searched=require("OIShared/SearchedContainers")
local CFLog=require("OIShared/Log")
OIShared=OIShared or {}
local W=OIShared.SearchedContainerWatch or {}
OIShared.SearchedContainerWatch=W
OIInteract=OIInteract or {};OIInteract.SearchedContainerWatch=W

-- A clue in a container of the car the survivor is SITTING in. Vanilla turns
-- Search Mode off while seated (ISSearchManager:doDisableCheck), so ClueSearch
-- can never spot it. Opening the container (the loot panel shows it) counts as
-- finding it, recorded like a search find (how="search"; no new find method).
-- Only the survivor's own seat's car, and only the container's direct items.
function W.findSeated(character,container)
    local ok,vehicle=pcall(function() return character:getVehicle() end)
    if not ok or not vehicle then return 0 end
    local okP,part=pcall(function() return container:getVehiclePart() end)
    if not okP or not part then return 0 end
    local okV,partCar=pcall(function() return part:getVehicle() end)
    if not okV or partCar~=vehicle then return 0 end
    local R=require("OIShared/EngineAPI").GeneratedRuntime
    local okI,items=pcall(function() return container:getItems() end)
    if not R or not okI or not items then return 0 end
    local n=0
    for i=0,items:size()-1 do
        local item=items:get(i)
        local okM,md=pcall(function() return item:getModData() end)
        if okM and type(md)=="table" and type(md.oiGeneratedId)=="string" then
            local okR,done,fresh=pcall(R.recognise,item,"search")
            if okR and done and fresh then n=n+1 end
        end
    end
    return n
end

-- `page` is the class table (ISInventoryPage); a test hands in its own.
function W.install(page)
    page=page or ISInventoryPage
    if type(page)~="table" or type(page.selectContainer)~="function" then return false,"no loot page to watch" end
    if page.oiSearchedWatch then return true,"already installed" end
    local original=page.selectContainer
    page.selectContainer=function(self,button,...)
        local a,b,c=original(self,button,...)
        -- After the original: the contents are on screen now. A failure to
        -- mark must never reach the player's click.
        pcall(function() Searched.mark(button and button.inventory) end)
        pcall(function()
            if button and button.inventory then W.findSeated(getSpecificPlayer(self.player),button.inventory) end
        end)
        return a,b,c
    end
    page.oiSearchedWatch=true
    return true,"installed"
end

local ok,why=W.install()
if not ok and Events and Events.OnGameStart then
    -- The loot page class may not exist yet when this file loads.
    require("OIShared/Events/InteractionEvents").on("OnGameStart", function()
        local ok2,why2=W.install()
        if not ok2 then CFLog.message("searched","note","searched-container watch not installed: "..tostring(why2)) end
    end)
end
return W
