-- The moment the player looks into a container, remember it.
--
-- ISInventoryPage:selectContainer is where the loot panel switches to showing
-- one container's contents - from a click on its icon or on the object in the
-- world (ISObjectClickHandler routes there too). After the original has run,
-- the container's parent object is marked (SearchedContainers.mark), and from
-- then on no clue may be written into it. See shared/ConspiracyFiles/
-- SearchedContainers.lua for why isExplored could not carry this.
local Searched=require("ConspiracyFiles/SearchedContainers")
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local W=ConspiracyFiles.SearchedContainerWatch or {}
ConspiracyFiles.SearchedContainerWatch=W

-- `page` is the class table (ISInventoryPage); a test hands in its own.
function W.install(page)
    page=page or ISInventoryPage
    if type(page)~="table" or type(page.selectContainer)~="function" then return false,"no loot page to watch" end
    if page.cfSearchedWatch then return true,"already installed" end
    local original=page.selectContainer
    page.selectContainer=function(self,button,...)
        local a,b,c=original(self,button,...)
        -- After the original: the contents are on screen now. A failure to
        -- mark must never reach the player's click.
        pcall(function() Searched.mark(button and button.inventory) end)
        return a,b,c
    end
    page.cfSearchedWatch=true
    return true,"installed"
end

local ok,why=W.install()
if not ok and Events and Events.OnGameStart then
    -- The loot page class may not exist yet when this file loads.
    Events.OnGameStart.Add(function()
        local ok2,why2=W.install()
        if not ok2 then CFLog.message("searched","note","searched-container watch not installed: "..tostring(why2)) end
    end)
end
return W
