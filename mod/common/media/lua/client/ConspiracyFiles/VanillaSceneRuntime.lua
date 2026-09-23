-- Observe completed vanilla vehicle scenes after squares load.  This never
-- intercepts or patches vanilla generation.  It records only visible vehicle
-- identity, position and cargo, and requires the same scene twice.
local Observer=require("ConspiracyFiles/Generated/VanillaSceneObserver")
local World=require("ConspiracyFiles/WorldAccess")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.VanillaSceneRuntime or {}
ConspiracyFiles.VanillaSceneRuntime=R
if R.loaded then return R end

local state=Observer.new()
local queue,queued,ticks={},{},0
local function enabled()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
end
local function keyFor(x,y,z) return math.floor(x/10)..":"..math.floor(y/10)..":"..math.floor(z) end
local function queueSquare(square)
 if not enabled() or not square or not square.getX then return end
 local x,y,z=square:getX(),square:getY(),square:getZ();local key=keyFor(x,y,z)
 if queued[key] or #queue>=128 then return end
 queued[key]=true;queue[#queue+1]={key=key,x=x,y=y,z=z,pass=1,due=ticks+30}
end
local function cargoOf(container)
 local out={};local items=container and container.getItems and container:getItems();local n=items and items.size and items:size() or 0
 for i=0,math.min(n,24)-1 do
  local item=items:get(i);local name=item and item.getFullType and item:getFullType()
  if type(name)=="string" then out[#out+1]=name end
 end
 table.sort(out);return out
end
local function snapshot(entry)
 local vehicles={}
 for _,seen in ipairs(World.vehiclesNear(entry.x,entry.y,entry.z,8,8)) do
  local cargo={}
  for _,part in ipairs(seen.parts) do
   for _,name in ipairs(cargoOf(part.container)) do cargo[#cargo+1]=name end
  end
  vehicles[#vehicles+1]={script=tostring(seen.vehicle.getScriptName and seen.vehicle:getScriptName() or "vehicle"),
   x=seen.x,y=seen.y,z=seen.z,cargo=cargo}
 end
 return {key=entry.key,vehicles=vehicles}
end
local function step()
 if not enabled() then return end;ticks=ticks+1
 local entry=queue[1];if not entry or ticks<entry.due then return end
 table.remove(queue,1)
 local next,status=Observer.observe(state,snapshot(entry));if next then state=next end
 if status=="candidate" and entry.pass==1 then entry.pass=2;entry.due=ticks+60;queue[#queue+1]=entry
 else queued[entry.key]=nil end
end
function R.confirmed() return Observer.confirmed(state) end
function R.matchVehicle(x,y,z,script)
 for _,scene in ipairs(Observer.confirmed(state)) do
  for _,vehicle in ipairs(scene.snapshot.vehicles or {}) do
   if vehicle.x==x and vehicle.y==y and vehicle.z==z and vehicle.script==script then return scene.signature end
  end
 end
 return nil
end
function R.reset() state=Observer.new();queue={};queued={};ticks=0 end
if Events and Events.LoadGridsquare then Events.LoadGridsquare.Add(queueSquare) end
if Events and Events.OnTick then Events.OnTick.Add(step) end
if Events and Events.OnGameStart then Events.OnGameStart.Add(R.reset) end
R.loaded=true
return R
