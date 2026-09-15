-- Immutable pickup context. It records only an adapter-supplied source event.
local V=require("ConspiracyFiles/Validator")
local E={}
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function fields(t,a) if type(t)~="table" then return false end for k in pairs(t) do if not a[k] then return false end end return true end
local function text(v,n) return type(v)=="string" and v~="" and #v<=n end
function E.validate(context,mapId)
 local safe=V.validateStructure(context); if not safe or not fields(context,{mapId=true,x=true,y=true,z=true,foundHours=true,sourceLabel=true}) then return false,"invalid encounter context" end
 if not text(context.mapId,160) or context.mapId~=mapId or not finite(context.x) or not finite(context.y) or not finite(context.z) or context.x~=math.floor(context.x) or context.y~=math.floor(context.y) or context.z~=math.floor(context.z) or context.x<-1000000 or context.x>1000000 or context.y<-1000000 or context.y>1000000 or context.z<-32 or context.z>32 or not finite(context.foundHours) or context.foundHours<0 or context.foundHours>1000000 then return false,"invalid encounter context" end
 if context.sourceLabel~=nil and not text(context.sourceLabel,300) then return false,"invalid encounter label" end
 return true
end
function E.display(context) if not context then return "Location not recorded" end return context.sourceLabel or "Finding place recorded; label unavailable" end
return E
