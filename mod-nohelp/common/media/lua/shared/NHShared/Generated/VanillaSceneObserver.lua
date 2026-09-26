-- Conservative, pure domain state for vanilla environmental scenes.  It does
-- not know RandomizedVehicleStory names and never infers intent.  A candidate
-- becomes usable only after two identical observations.
local M={SCHEMA=1,MAX_SCENES=128}
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function text(v,max) return type(v)=="string" and v~="" and #v<=(max or 300) and not v:find("%c") end
local function dense(t,max)
 if type(t)~="table" then return false end local n=0
 for k in pairs(t) do if type(k)~="number" or k<1 or k%1~=0 then return false end n=n+1 end
 if n>(max or 64) then return false end for i=1,n do if t[i]==nil then return false end end return true,n
end
local function sorted(values) local out=copy(values);table.sort(out);return out end

function M.new() return {schema=M.SCHEMA,candidates={},confirmed={}} end

local function meaningful(snapshot)
 if type(snapshot)~="table" or not text(snapshot.key,120) then return false end
 local ok,n=dense(snapshot.vehicles,8);if not ok or n<1 then return false end
 if n>=2 then return true,"vehicle-cluster" end
 local v=snapshot.vehicles[1]
 local script=type(v)=="table" and v.script or ""
 for _,word in ipairs({"Ambulance","Police","Fire","Military","Ranger"}) do
  if script:find(word,1,true) then return true,"emergency-transport" end
 end
 for _,cargo in ipairs(type(v)=="table" and v.cargo or {}) do
  for _,word in ipairs({"Cooler","Animal","Feed","Specimen","Surgical","Mask","Gloves","Disinfectant","Bleach","ProtectiveCase"}) do
   if cargo:find(word,1,true) then return true,"contextual-transport" end
  end
 end
 return false
end

function M.signature(snapshot)
 local useful,kind=meaningful(snapshot);if not useful then return nil,"not a meaningful scene" end
 local vehicleParts={}
 for _,v in ipairs(snapshot.vehicles) do
  if type(v)~="table" or not text(v.script,120) or type(v.x)~="number" or type(v.y)~="number" or type(v.z)~="number" then
   return nil,"invalid vehicle observation"
  end
  local cargo={};for _,name in ipairs(v.cargo or {}) do if not text(name,120) then return nil,"invalid cargo observation" end;cargo[#cargo+1]=name end
  cargo=sorted(cargo)
  vehicleParts[#vehicleParts+1]=table.concat({v.script,math.floor(v.x),math.floor(v.y),math.floor(v.z),table.concat(cargo,",")},"|")
 end
 table.sort(vehicleParts)
 return kind..":"..table.concat(vehicleParts,";")
end

function M.observe(state,snapshot)
 if type(state)~="table" or state.schema~=M.SCHEMA or type(state.candidates)~="table" or type(state.confirmed)~="table" then
  return nil,"invalid observer state"
 end
 local signature,why=M.signature(snapshot);if not signature then return copy(state),why end
 local next=copy(state)
 local current=next.candidates[snapshot.key]
 if current and current.signature==signature then current.count=current.count+1
 else current={signature=signature,count=1,snapshot=copy(snapshot)};next.candidates[snapshot.key]=current end
 if current.count>=2 then
  local total=0;for _ in pairs(next.confirmed) do total=total+1 end
  if next.confirmed[snapshot.key] or total<M.MAX_SCENES then
   next.confirmed[snapshot.key]={signature=signature,kind=signature:match("^([^:]+)"),snapshot=copy(snapshot)}
  end
  next.candidates[snapshot.key]=nil
 end
 return next,current.count>=2 and "confirmed" or "candidate"
end

function M.confirmed(state)
 local out={};if type(state)~="table" or type(state.confirmed)~="table" then return out end
 for key,scene in pairs(state.confirmed) do out[#out+1]={key=key,kind=scene.kind,signature=scene.signature,snapshot=copy(scene.snapshot)} end
 table.sort(out,function(a,b) return a.key<b.key end);return out
end

return M
