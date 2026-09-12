-- PZ-facing incremental readers. Never writes canonical state or world items.
local World = {}
local function spriteName(object)
    local sprite=object and object:getSprite()
    return sprite and sprite:getName() or nil
end
function World.resolve(target,mark)
    -- A vehicle target is not addressed by a square. See resolveVehicle.
    if type(target)=="table" and type(target.vehiclePart)=="string" then
        return World.resolveVehicle(target,mark)
    end
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
-- VEHICLES AS PLACES (docs/design/VEHICLES_AS_PLACES.md).
--
-- Everything above addresses a container by the grid square it stands on,
-- which is safe because a kitchen cupboard cannot walk away. A car can, so a
-- vehicle container is addressed by a mark we leave on the PART -
-- VehiclePart:getModData() - and found again by looking at the cell's
-- vehicles rather than at a square. The owner has confirmed in play that both
-- a vehicle's identity and the contents of its boot survive a save and
-- reload; the part mark makes us independent of the id regardless.
--
-- Parts worth using, and why they are not all of them. A glovebox is the best
-- container in the game for a document - small, private, and nothing arrives
-- there by accident. A boot is where things go when they are being moved
-- rather than kept. The rest of a car is seats and engine parts, which hold
-- nothing or hold it implausibly.
-- Seats are here for a reason the owner named on 2026-09-09: "bodies can fit
-- in car seats too. murder to keep someone quiet?" They can. A car seat
-- declares MaxCapacity 20 (items/normal.txt, NormalCarSeat1) and
-- Base.CorpseMale weighs exactly 20.
--
-- CAPACITY IS NOT A WEIGHT CEILING, and I said it was. The owner: "weird I can
-- fit a generator on a seat" - and a generator weighs 40. Vanilla's transfer
-- action asks hasRoomFor before moving anything, so the check is real; what it
-- evidently means is "this container is not already full", which lets one
-- oversized item in and then refuses everything after it.
--
-- So the engine would happily put a body in a glovebox. Refusing that is OUR
-- rule, not the engine's, and partsWithRoom below is a plausibility filter -
-- labelled as one so nobody later mistakes it for a constraint the game
-- enforces.
World.VEHICLE_PARTS={"GloveBox","TruckBed","TrunkDoor",
                     "SeatFrontLeft","SeatFrontRight","SeatRearLeft","SeatRearRight"}
-- What a body weighs, from items/normal.txt. Named because two rules and a
-- container check all depend on it, and a silent change would be worse than a
-- loud one.
World.BODY_WEIGHT=20

-- Every usable container in one vehicle, as {part=id,container=container}.
-- Ordered by VEHICLE_PARTS, never by engine iteration order, so selection is
-- reproducible.
function World.vehicleParts(vehicle)
    local out={}
    -- Ask the VEHICLE for each part. getParts() returns VehicleParts, a class
    -- Lua cannot index at all ("attempted index: getPartById of non-table",
    -- 2026-09-11 playtest); BaseVehicle answers getPartById itself, which is
    -- how vanilla does it (Trailer3Scenario_Arrival.lua:87).
    if not vehicle or not vehicle.getPartById then return out end
    for _,id in ipairs(World.VEHICLE_PARTS) do
        local part=vehicle:getPartById(id)
        local container=part and part.getItemContainer and part:getItemContainer()
        if container then
            out[#out+1]={part=id,container=container,
                capacity=part.getContainerCapacity and part:getContainerCapacity() or nil}
        end
    end
    return out
end

-- The parts of one vehicle we are willing to put `weight` into. Capacity is
-- read from the installed part rather than assumed - a glovebox declares 5, a
-- car seat 20, a truck bed 100 - but see the note above: this is the mod's own
-- judgement about what is plausible, not a limit the engine would enforce. A
-- body in a glovebox would be accepted by the game and laughed at by a player.
function World.partsWithRoom(vehicle,weight)
    local out={}
    for _,entry in ipairs(World.vehicleParts(vehicle)) do
        local capacity=entry.capacity
        if type(capacity)=="number" and capacity>=(weight or 0) then out[#out+1]=entry end
    end
    return out
end

-- Vehicles whose current square lies within `radius` tiles of (x,y,z), with
-- their usable containers. Bounded: a cell can hold a great many vehicles and
-- this runs on a budgeted scheduler step like everything else here.
function World.vehiclesNear(x,y,z,radius,limit)
    local cell=getCell()
    local found={}
    if not cell then return found end
    limit=limit or 8
    local seen={}
    local function consider(vehicle)
        if #found>=limit or not vehicle or seen[vehicle] then return end
        seen[vehicle]=true
        local square=vehicle.getSquare and vehicle:getSquare()
        if not square then return end
        local vx,vy,vz=square:getX(),square:getY(),square:getZ()
        if vz==z and math.abs(vx-x)<=radius and math.abs(vy-y)<=radius then
            local parts=World.vehicleParts(vehicle)
            if #parts>0 then found[#found+1]={vehicle=vehicle,x=vx,y=vy,z=vz,parts=parts} end
        end
    end
    -- getVehicles() is a java.util.Set (verified against the jar). A Set has
    -- no get(i), so the size()/get(i-1) loop copied from ISVehicleBloodUI
    -- found nothing: owner, 2026-09-11, standing in front of a van, "said no
    -- vehicles in twelve tiles". toArray() is how vanilla walks a Set
    -- (Vehicles.lua:1039, ipairs over getTags():toArray()). `pairs` on the Set
    -- itself throws - that was the 2026-09-10 crash.
    local vehicles=cell.getVehicles and cell:getVehicles()
    local list=vehicles and vehicles.toArray and vehicles:toArray()
    if type(list)=="table" then
        World.lastVehicleScan="set"
        for _,vehicle in ipairs(list) do consider(vehicle) end
        return found
    end
    -- Fallback: ask each nearby square which vehicle stands on it, which is
    -- how the loot window finds a car's boot (ISInventoryPage.lua:1759).
    -- ponytail: square scan, capped at 20 tiles; the Set path covers wider.
    World.lastVehicleScan="squares"
    local r=math.min(radius,20)
    for dy=-r,r do
        for dx=-r,r do
            local square=cell:getGridSquare(x+dx,y+dy,z)
            local vehicle=square and square.getVehicleContainer and square:getVehicleContainer()
            if vehicle then consider(vehicle) end
        end
    end
    return found
end

-- Find the container we marked. `mark` is the value stamped into the part's
-- ModData at placement; it is our own handle, so nothing here depends on how
-- the engine numbers vehicles or where the car has since been driven.
-- `mark` is the caller's own handle - the assignment's physical token. Two
-- passes, in this order:
--
--   1. The marked part, wherever the car now is. This is the case after
--      placement, and the reason a driven car does not lose its clue.
--   2. An UNMARKED part of the right kind on a vehicle still standing where
--      the candidate was found. This is the case before placement, when
--      nothing has been stamped yet.
--
-- If the car was driven off between the candidate being recorded and the clue
-- being placed, neither pass matches and placement simply waits. Better than
-- placing into whichever car happens to be there now, which would put the
-- evidence somewhere nobody chose.
function World.resolveVehicle(target,mark,radius)
    if type(target)~="table" or type(target.vehiclePart)~="string" then
        return nil,"not a vehicle target"
    end
    mark=mark or target.vehicleMark
    local function partsOf(entry)
        local out={}
        for _,part in ipairs(entry.parts) do
            if part.part==target.vehiclePart then out[#out+1]=part end
        end
        return out
    end
    if type(mark)=="string" then
        local near=World.vehiclesNear(target.x,target.y,target.z,radius or 60,16)
        for _,entry in ipairs(near) do
            for _,part in ipairs(partsOf(entry)) do
                local vehiclePart=part.container.getVehiclePart and part.container:getVehiclePart()
                local md=vehiclePart and vehiclePart.getModData and vehiclePart:getModData()
                if md and md.cfVehicleMark==mark then return part.container end
            end
        end
    end
    for _,entry in ipairs(World.vehiclesNear(target.x,target.y,target.z,0,8)) do
        for _,part in ipairs(partsOf(entry)) do
            local vehiclePart=part.container.getVehiclePart and part.container:getVehiclePart()
            local md=vehiclePart and vehiclePart.getModData and vehiclePart:getModData()
            if md and md.cfVehicleMark==nil then return part.container end
        end
    end
    return nil,"vehicle-not-found"
end

-- Leave our mark on the part a clue was placed into.
function World.markVehiclePart(container,mark)
    if not container or type(mark)~="string" then return false end
    local part=container.getVehiclePart and container:getVehiclePart()
    local md=part and part.getModData and part:getModData()
    if not md then return false end
    md.cfVehicleMark=mark
    return true
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
-- `limit` is how many copies the caller believes belong here; the scan stops
-- as soon as it has seen one more than that, which is all anyone needs to know
-- to say "too many". It defaults to 1 because for most of this mod's life the
-- only question was "is there more than one?".
--
-- That default used to be the only behaviour, and it was wrong the moment a
-- document could legitimately be a pile of six (ObjectRules.accumulation): the
-- scan reported 2, placement saw fewer than it expected, created the pile
-- again, and the document ended in the sticky "conflict" state - dead
-- permanently. Caught by test/g2_smoke.lua's exact item count.
function World.count(container,token,done,limit)
    local items=container:getItems()
    local originalSize=items:size()
    local ceiling=(type(limit)=="number" and limit>=1) and limit or 1
    local index,count,seen=0,0,{}
    return function()
        if items:size()~=originalSize then done(nil,"inventory-changed"); return true end
        if count>ceiling then done(ceiling+1); return true end
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
-- `expected` maps a document id to how many copies belong to it, defaulting to
-- one. It exists because a document can legitimately be a pile of six ordinary
-- things (ObjectRules.accumulation), and this scan used to stop at two per
-- document and let the caller call anything past one a conflict - which is
-- sticky, so a pile would have been declared broken the moment the player
-- pocketed one bottle out of it.
function World.identityScan(player,assignments,done,expected)
    local tokens,found,seenItems,ceiling={},{},{},{}
    for id,a in pairs(assignments) do
        tokens[a.physicalToken]=id; found[id]={}
        local want=(type(expected)=="table" and expected[id]) or 1
        -- One more than expected is enough to know there are too many.
        ceiling[id]=want+1
    end
    local tasks,seenContainers={},{}
    local function enqueue(container)
        if container and not seenContainers[container] and #tasks<256 then
            seenContainers[container]=true; tasks[#tasks+1]={kind="container",container=container,index=0}
        end
    end
    local function observe(item)
        if not item then return end
        local md=item:getModData(); local id=md and tokens[md.cfPhysicalToken]
        if id and not seenItems[item] and #found[id]<ceiling[id] then
            seenItems[item]=true
            found[id][#found[id]+1]=item
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
