-- Current development build: automatic single-player trial activation.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local A=ConspiracyFiles.AutomaticInvestigations or {}
ConspiracyFiles.AutomaticInvestigations=A
A.config={minGapHours=24,retryTicks=600}
local ticks,ready=0,false
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
-- Select the generated mode before shared legacy OnGameStart handlers run.
if allowed() then ConspiracyFiles.GeneratedMode=true end
function A.poll()
 if not ready or not allowed() or not getPlayer() then return end
 local runtime=require("ConspiracyFiles/GeneratedRuntime")
 local status=runtime.automaticStatus()
 if status.preparing then return end
 if status.count==0 then
  require("ConspiracyFiles/Trial").start(nil,{firstHouse=true})
  return
 end
 if not A.initialized then
  local ok=require("ConspiracyFiles/Trial").start()
  if not ok then return end
  A.initialized=true
 end
 if status.count>=status.limit or not status.scheduled then return end
 local hours=getGameTime():getWorldAgeHours()
 if type(hours)~="number" or hours~=hours or hours==math.huge or hours<status.lastCreatedHours+A.config.minGapHours then return end
 runtime.nextCase(ZombRand(2147483646)+1)
end
function A.onStart() ticks=0;ready=true;A.initialized=false;A.lastError=nil end
function A.onTick()
 ticks=ticks+1
 if ticks~=30 and ticks%A.config.retryTicks~=0 then return end
 local ok,err=pcall(A.poll)
 if not ok and tostring(err)~=A.lastError then A.lastError=tostring(err);CFLog.message("auto","case","Deferred: "..A.lastError) end
end
if Events and not A.tickHandler then
 A.tickHandler=function() A.onTick() end;Events.OnTick.Add(A.tickHandler)
 A.startHandler=function() A.onStart() end;Events.OnGameStart.Add(A.startHandler)
end
return A
