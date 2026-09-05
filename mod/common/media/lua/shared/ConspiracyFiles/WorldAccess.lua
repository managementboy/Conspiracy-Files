-- PZ-facing incremental readers. Never writes canonical state or world items.
local World = {}
local function spriteName(object)
    local sprite=object and object:getSprite()
    return sprite and sprite:getName() or nil
end
function World.resolve(target)
    local square=getCell():getGridSquare(target.x,target.y,target.z)
    if not square then return nil,"unloaded" end
    local objects=square:getObjects()
    local object=target.objectIndex<objects:size() and objects:get(target.objectIndex)
    if not object or spriteName(object)~=target.sprite then return nil,"target-changed" end
    if target.containerIndex>=object:getContainerCount() then return nil,"target-changed" end
    local container=object:getContainerByIndex(target.containerIndex)
    if not container or container:getType()~=target.containerType then return nil,"target-changed" end
    return container
end
function World.candidateScan(candidate,done)
    local dx,dy=-candidate.radius,-candidate.radius
    local objects,objectIndex,containerIndex=nil,0,0
    local targets,missing={},false
    return function()
        if dx>candidate.radius then done(targets,not missing); return true end
        local x,y=candidate.x+dx,candidate.y+dy
        if not objects then
            local square=getCell():getGridSquare(x,y,candidate.z)
            if not square then missing=true; objects=false else objects=square:getObjects() end
            objectIndex,containerIndex=0,0
        end
        if objects and objectIndex<objects:size() then
            local object=objects:get(objectIndex)
            if object and object.getContainerCount and containerIndex<object:getContainerCount() then
                local container=object:getContainerByIndex(containerIndex)
                local sprite=spriteName(object)
                for _,kind in ipairs(candidate.allowedContainerTypes) do
                    if #targets<candidate.containerOrdinal and container and sprite and container:getType()==kind then
                        targets[#targets+1]={x=x,y=y,z=candidate.z,objectIndex=objectIndex,containerIndex=containerIndex,containerType=kind,sprite=sprite}
                    end
                end
                containerIndex=containerIndex+1
            else objectIndex=objectIndex+1; containerIndex=0 end
            return false
        end
        objects=nil; dy=dy+1
        if dy>candidate.radius then dy=-candidate.radius; dx=dx+1 end
        return false
    end
end
function World.count(container,token,done)
    local items=container:getItems()
    local originalSize=items:size()
    local index,count,seen=0,0,{}
    return function()
        if items:size()~=originalSize then done(nil,"inventory-changed"); return true end
        if count>=2 then done(2); return true end
        if index>=originalSize then done(count); return true end
        local item=items:get(index); index=index+1
        local md=item and item:getModData()
        if md and md.cfPhysicalToken==token and not seen[item] then seen[item]=true; count=count+1 end
        return false
    end
end
-- Searches player inventory (including bags), nearby floor/corpse/container
-- contents and the currently occupied vehicle. Coverage is explicitly partial:
-- zero observations NEVER proves destruction or triggers fallback.
function World.identityScan(player,assignments,done)
    local tokens,found,seenItems={},{},{}
    for id,a in pairs(assignments) do tokens[a.physicalToken]=id; found[id]={} end
    local tasks,seenContainers={},{}
    local function enqueue(container)
        if container and not seenContainers[container] and #tasks<256 then
            seenContainers[container]=true; tasks[#tasks+1]={kind="container",container=container,index=0}
        end
    end
    local function observe(item)
        if not item then return end
        local md=item:getModData(); local id=md and tokens[md.cfPhysicalToken]
        if id and not seenItems[item] and #found[id]<2 then
            seenItems[item]=true
            if #found[id]<2 then found[id][#found[id]+1]=item end
        end
        if instanceof(item,"InventoryContainer") then enqueue(item:getInventory()) end
    end
    if player then
        enqueue(player:getInventory())
        local x,y,z=math.floor(player:getX()),math.floor(player:getY()),math.floor(player:getZ())
        for dx=-2,2 do for dy=-2,2 do tasks[#tasks+1]={kind="square",x=x+dx,y=y+dy,z=z,phase=1,index=0} end end
        local vehicle=player:getVehicle()
        if vehicle then tasks[#tasks+1]={kind="vehicle",vehicle=vehicle,index=0} end
    end
    for _,a in pairs(assignments) do if a.target then enqueue(World.resolve(a.target)) end end
    local cursor=1
    return function()
        local task=tasks[cursor]
        if not task then done(found); return true end
        if task.kind=="container" then
            local items=task.container:getItems()
            if task.index<items:size() then observe(items:get(task.index)); task.index=task.index+1
            else cursor=cursor+1 end
        elseif task.kind=="vehicle" then
            if task.index<task.vehicle:getPartCount() then
                local part=task.vehicle:getPartByIndex(task.index); enqueue(part and part:getItemContainer()); task.index=task.index+1
            else cursor=cursor+1 end
        else
            local square=getCell():getGridSquare(task.x,task.y,task.z)
            if not square then cursor=cursor+1; return false end
            local list=task.phase==1 and square:getWorldObjects() or task.phase==2 and square:getStaticMovingObjects() or square:getObjects()
            if task.index>=list:size() then
                task.phase=task.phase+1; task.index=0
                if task.phase>3 then cursor=cursor+1 end
            else
                local object=list:get(task.index)
                task.index=task.index+1
                if task.phase==1 then observe(object:getItem())
                elseif task.phase==2 then if instanceof(object,"IsoDeadBody") then enqueue(object:getContainer()) end
                elseif object and object.getContainerCount then
                    -- Only enqueue readers here; each item's inspection is a later step.
                    for i=0,math.min(object:getContainerCount(),8)-1 do enqueue(object:getContainerByIndex(i)) end
                end
            end
        end
        return false
    end
end
return World
