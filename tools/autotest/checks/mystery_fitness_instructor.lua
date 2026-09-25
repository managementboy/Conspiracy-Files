-- STAGES FOR checks/mystery_fitness_instructor.sh.
--
-- Proves the Fitness ten's redesign live: the placement channel already
-- proven twice (site findings, a vehicle finding), and a "door" GATE that
-- reads a real IsoDoor's own lock state - the mechanic none of the
-- original ten ever gave the key to do - rather than a threshold.
CFMyst={}
local K=CFMyst

-- The autotest spawn's own nearest real vehicle sits well outside a
-- driveway's radius (found live, 2026-09-26: 40+ tiles, sometimes none
-- within 60 at all - the spawn point is not deterministic run to run).
-- MysteryRuntime.place() only ever looks within Session.VEHICLE_RADIUS
-- (12), the same "driveway, not the next street" rule the legacy engine
-- already holds itself to, so this test spawns its own van in range - the
-- same precedent checks/vehicle_reach.lua already set for exactly this
-- problem, not a scan wide enough to reach whatever the map happens to
-- have.
-- The same open-ground search checks/vehicle_reach.lua already validated:
-- every square of a 7x5 block outdoors and free, not one single square - a
-- van needs its whole footprint clear or its spawn (and so its container
-- part's real position) drifts unpredictably. Found live, 2026-09-26: a
-- single-square check placed the van somewhere that intermittently put its
-- TruckBed part outside the runtime's own 12-tile scan, passing on some
-- fresh worlds and silently failing to place the vehicle finding on others.
-- Capped at 12 (Session.VEHICLE_RADIUS, MysteryRuntime's own scan limit),
-- not vehicle_reach.lua's 40: that check teleports the player to the van
-- afterward, but this one must keep the player where the site findings
-- were placed, so the van has to land within the runtime's real radius or
-- not spawn for this run at all.
local function openGround(cx,cy,z)
    local cell=getCell()
    for radius=2,8,2 do
        for dx=-radius,radius,2 do for dy=-radius,radius,2 do
            local ok=true
            for ax=-3,3 do
                for ay=-2,2 do
                    local sq=cell:getGridSquare(cx+dx+ax,cy+dy+ay,z)
                    if not sq or not sq:isOutside() or not sq:isFree(false) then ok=false; break end
                end
                if not ok then break end
            end
            if ok then return cell:getGridSquare(cx+dx,cy+dy,z) end
        end end
    end
end

function K.spawnVehicle()
    local p=getPlayer()
    local sq=openGround(math.floor(p:getX()),math.floor(p:getY()),0)
    if not sq then return "false", "no open ground within 8 tiles" end
    local v=addVehicleDebug("Base.PickUpVan",IsoDirections.N,nil,sq)
    if not v then return "false","the van did not spawn" end
    pcall(function() v:setLocked(false) end)
    return "true",sq:getX()..","..sq:getY()
end

function K.attach()
    local Content=require("ConspiracyFiles/Mystery/Content/FitnessInstructorWelfareVisit")
    local ok,why=ConspiracyFiles.MysteryRuntime.attach(Content)
    return tostring(ok),tostring(why)
end

function K.place()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local ok,n=ConspiracyFiles.MysteryRuntime.place(ConspiracyFiles.MysteryRuntime.current,x,y,z)
    return tostring(ok),tostring(n)
end

-- Same collect-then-move two-pass pattern as the earlier two checks, swept
-- over both ground containers and any nearby vehicle's own trunk - the
-- `where="vehicle"` finding never sits in a searchable ground container.
function K.collect()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local cell=getCell()
    local marked={}
    local function sweep(container)
        local items=container and container:getItems()
        for j=0,(items and items:size() or 0)-1 do
            local it=items:get(j)
            local md=it and it:getModData()
            if type(md)=="table" and md.cfMysteryId then
                marked[#marked+1]={item=it,container=container}
            end
        end
    end
    for dx=-15,15 do for dy=-15,15 do
        local sq=cell:getGridSquare(x+dx,y+dy,z)
        local objects=sq and sq:getObjects()
        for i=0,(objects and objects:size() or 0)-1 do
            local obj=objects:get(i)
            if obj and obj.getContainerCount and obj:getContainerCount()>0 then
                sweep(obj:getContainerByIndex(0))
            end
        end
        -- sq:getVehicleContainer() is the vehicle itself, not an
        -- ItemContainer - same real API MysteryRuntime.lua's own
        -- vehicleItemContainer now uses.
        local vehicle=sq and sq.getVehicleContainer and sq:getVehicleContainer()
        if vehicle then
            for _,partId in ipairs({"TruckBed","TrunkDoor","GloveBox","Trunk"}) do
                local ok,part=pcall(function() return vehicle:getPartById(partId) end)
                if ok and part then
                    -- NOT `local cok,container = ok and part and pcall(...)`:
                    -- wrapping a pcall in an `and` chain truncates its two
                    -- return values to one, so `container` was always nil -
                    -- found live, 2026-09-26, when the vehicle finding
                    -- placed correctly (confirmed by direct inspection) but
                    -- this sweep never once collected it.
                    local cok,container=pcall(function() return part:getItemContainer() end)
                    if cok and container then sweep(container) end
                end
            end
        end
    end end
    local moved=0
    for _,entry in ipairs(marked) do
        local ok=pcall(function() entry.container:Remove(entry.item); p:getInventory():AddItem(entry.item) end)
        if ok then moved=moved+1 end
    end
    return tostring(moved)
end

-- A real door, tagged by place(), actually unlocked - the physical action
-- the survivor's key stands in for. Not a debug ledger flip: this sets the
-- same real IsoDoor state the mechanic itself reads (MysteryRuntime's own
-- doorUnlocked scans this exact field), the same discipline setPerkLevel
-- already established for the skill GATE.
function K.unlockTaggedDoor(gateProduces)
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local cell=getCell()
    for dx=-6,6 do for dy=-6,6 do
        local sq=cell:getGridSquare(x+dx,y+dy,z)
        local objects=sq and sq:getObjects()
        for i=0,(objects and objects:size() or 0)-1 do
            local obj=objects:get(i)
            local md=obj and obj.getModData and obj:getModData()
            if type(md)=="table" and md.cfMysteryGate==gateProduces then
                local ok=pcall(function() obj:setLocked(false) end)
                return tostring(ok)
            end
        end
    end end
    return "false no-tagged-door-found"
end

function K.poll()
    ConspiracyFiles.MysteryRuntime.pollInventory()
    ConspiracyFiles.MysteryRuntime.pollGates()
    return "polled"
end

function K.status()
    return tostring(ConspiracyFiles.MysteryRuntime.status())
end

function K.record()
    local out={}
    for _,r in ipairs(ConspiracyFiles.MysteryRuntime.record()) do out[#out+1]=r.text end
    return table.concat(out," | ")
end

return "mystery fitness instructor stages loaded"
