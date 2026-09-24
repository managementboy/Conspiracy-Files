-- Resolve a compact fixed-container signature against the live world.
-- Nothing here creates items or changes save state.
local Searched=require("ConspiracyFiles/SearchedContainers")
local R={}

local function spriteName(object)
    local sprite=object and object:getSprite()
    return sprite and sprite:getName() or nil
end

-- "Already searched" is the player having looked, not the engine having
-- generated loot: SearchedContainers.lua has the measurement that separated
-- the two. nil (unreadable) stays fail-closed in both callers below.
local function explored(container)
    return Searched.searched(container)
end

local function buildingId(square)
    local value
    local ok=pcall(function()
        local building=square:getBuilding()
        local def=building and building:getDef()
        value=def and tostring(def:getIDString()) or nil
    end)
    if not ok then return nil,false end
    return value,true
end

-- Returns a normal exact placement target plus its live ItemContainer.
-- `unloaded` means wait.  Every other refusal means the indexed building has
-- changed and the caller may use the modified-building fallback scan.
function R.resolve(signature)
    if type(signature)~="table" or signature.indexed~=true then return nil,nil,"invalid signature" end
    local square=getCell():getGridSquare(signature.x,signature.y,signature.z)
    if not square then return nil,nil,"unloaded" end
    local liveBuilding,buildingKnown=buildingId(square)
    -- A mailbox may sit just outside the footprint it belongs to.  Every other
    -- indexed fixed container must still belong to the exact BuildingDef that
    -- produced the row; matching furniture at the same coordinates is not
    -- enough after a map or building edit.
    if signature.containerType~="postbox" then
        if not buildingKnown or liveBuilding~=signature.buildingId then
            return nil,nil,"building-changed"
        end
    elseif liveBuilding~=nil and liveBuilding~=signature.buildingId then
        return nil,nil,"building-changed"
    end
    local objects=square:getObjects()
    for oi=0,objects:size()-1 do
        local object=objects:get(oi)
        if object and spriteName(object)==signature.sprite and object.getContainerCount then
            for ci=0,object:getContainerCount()-1 do
                local container=object:getContainerByIndex(ci)
                if container and container:getType()==signature.containerType then
                    local wasExplored=explored(container)
                    if wasExplored==nil then return nil,container,"search-state-unavailable" end
                    if wasExplored then return nil,container,"already-searched" end
                    local fresh,why=R.fresh(container)
                    if not fresh then return nil,container,why end
                    return {x=signature.x,y=signature.y,z=signature.z,objectIndex=oi,containerIndex=ci,
                        containerType=signature.containerType,sprite=signature.sprite},container
                end
            end
        end
    end
    return nil,nil,"target-changed"
end

-- Final guard immediately before insertion.  A container can be opened after
-- it was selected but before its placement job runs.
function R.fresh(container)
    if not container then return false,"missing container" end
    local wasExplored=explored(container)
    if wasExplored==nil then return false,"search-state-unavailable" end
    if wasExplored then return false,"already-searched" end
    local open=false
    local ok=pcall(function()
        local page=getPlayerLoot and getPlayerLoot(0)
        for _,button in ipairs(page and page.backpacks or {}) do if button.inventory==container then open=true end end
    end)
    if not ok then return false,"loot-state-unavailable" end
    if open then return false,"loot-window-open" end
    return true
end

return R
