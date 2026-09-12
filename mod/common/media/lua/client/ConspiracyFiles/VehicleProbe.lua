-- A direct, in-game test of placing things in a vehicle.
--
-- Owner, 2026-09-11, standing beside a Marine Bites step van: "found a car...
-- time to test if we can place things?" A case can only use a vehicle that
-- happens to be within twelve tiles of a building it chose, at the moment it is
-- made - so waiting for a case to do it proves nothing when it does not happen.
--
--     ConspiracyFiles.VehicleProbe.here()
--
-- Takes the nearest vehicle, lists its usable containers with their capacity,
-- puts one marked note in the first container that will take it, leaves the
-- mark on that part, then finds the part again BY THE MARK - the same two-pass
-- lookup a case uses. Every step is logged, so the answer reaches the
-- development machine through the stream. Drive the vehicle somewhere and run
-- ConspiracyFiles.VehicleProbe.find() to prove the note travelled with it.
local CFLog=require("ConspiracyFiles/Log")
local World=require("ConspiracyFiles/WorldAccess")
ConspiracyFiles=ConspiracyFiles or {}
local V=ConspiracyFiles.VehicleProbe or {}
ConspiracyFiles.VehicleProbe=V
V.MARK="cf-probe:vehicle"
local function log(message) CFLog.message("vehicle","vehicle",message) end
local function read(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
    return nil
end

function V.here()
    local player=getPlayer and getPlayer()
    if not player then log("probe: no player"); return "no player" end
    local x,y,z=math.floor(read(player,"getX") or 0),math.floor(read(player,"getY") or 0),math.floor(read(player,"getZ") or 0)
    local near=World.vehiclesNear(x,y,z,12,8)
    if #near==0 then log("probe: no vehicle within 12 tiles of "..x..","..y.." scan="..tostring(World.lastVehicleScan)); return "no vehicle nearby" end
    table.sort(near,function(a,b)
        return math.max(math.abs(a.x-x),math.abs(a.y-y))<math.max(math.abs(b.x-x),math.abs(b.y-y)) end)
    local entry=near[1]
    local script=read(entry.vehicle,"getScriptName") or "?"
    local parts={}
    for _,p in ipairs(entry.parts) do parts[#parts+1]=p.part.."("..tostring(p.capacity)..")" end
    log("probe: scan="..tostring(World.lastVehicleScan).." nearest vehicle "..tostring(script).." at "..entry.x..","..entry.y.."; containers: "..table.concat(parts,", "))
    local chosen
    for _,p in ipairs(entry.parts) do chosen=p; break end
    if not chosen then log("probe: that vehicle offers no container"); return "no container" end
    local note
    pcall(function()
        note=chosen.container:AddItem("Base.Note")
        if note then note:setName("Probe note - vehicle test"); note:setCustomName(true) end
    end)
    if not note then log("probe: could not place a note in "..chosen.part); return "could not place" end
    local marked=World.markVehiclePart(chosen.container,V.MARK)
    log("probe: note placed in "..chosen.part..", part marked="..tostring(marked))
    V.target={x=entry.x,y=entry.y,z=entry.z,vehiclePart=chosen.part,vehicleMark=V.MARK}
    return V.find()
end

-- Find the probed part again by its mark, wherever the vehicle now is.
function V.find()
    if not V.target then log("probe: run here() first"); return "no probe placed" end
    local container=World.resolveVehicle(V.target,V.MARK,200)
    if not container then log("probe: marked part NOT found within 200 tiles"); return "not found" end
    local items=read(container,"getItems")
    local found=false
    if items and items.size then
        for i=0,items:size()-1 do
            local it=items:get(i)
            if read(it,"getDisplayName")=="Probe note - vehicle test" then found=true end
        end
    end
    local vehicle=read(read(container,"getVehiclePart"),"getVehicle")
    local square=vehicle and read(vehicle,"getSquare")
    log("probe: marked "..V.target.vehiclePart.." found at "..tostring(square and read(square,"getX"))..","
        ..tostring(square and read(square,"getY")).."; note inside="..tostring(found))
    return found and "found, with the note inside" or "part found, note missing"
end

return V
