-- The case-preparation flag must never stick (campaign check, 2026-09-15).
--
-- With four unfinished cases - all the save allows (SuccessiveCases.MAX_ACTIVE)
-- - every attempt at a new case ran a nearby scan that could only be refused at
-- the final swap. Three refusals and the scheduler disabled "preparation"; the
-- next R.nextCase set `preparing` to true and queued a job the scheduler
-- refused, without looking at the answer. AutomaticInvestigations never polls
-- while preparing, so no case came again - not even after one finished, because
-- openAll replaced the scheduler (dropping any queued preparation) and left the
-- flag as it was. Only a reload cleared it.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")

local nextCase=assert(runtime:match("function R%.nextCase%(seed%)(.-)\nend\n"),"R.nextCase must exist")
local limit=nextCase:find("Cases.MAX_ACTIVE",1,true)
local probe=nextCase:find("probe.start",1,true)
assert(limit and probe and limit<probe,"R.nextCase must refuse at the active-case limit BEFORE starting a scan")
assert(nextCase:find('scheduler.isDisabled("preparation")',1,true),"R.nextCase must not start while preparation is disabled")
assert(nextCase:find("if not queued then preparing=false",1,true),"a refused preparation job must clear the preparing flag")

-- Reopening the sessions (every finished case does it) keeps a case being
-- prepared: dropping it restarted a nearby scan that takes minutes, and the
-- campaign check saw no new case for five minutes after one finished.
local openAll=assert(runtime:match("local function openAll%(%)(.-)\nend\n"),"openAll must exist")
assert(openAll:find('scheduler.retain(function(job) return job.subsystem=="preparation" end)',1,true),
    "reopening the sessions must keep a case being prepared, not restart its scan")
assert(openAll:find('if not scheduler.has("preparation") then preparing=false end',1,true),
    "the flag is cleared only when no preparation is queued")

-- The scheduler keeps what it is told to keep and forgets failures on request.
local Scheduler=require("ConspiracyFiles/Scheduler")
local sch=Scheduler.new(function() return 0 end,function() end)
assert(sch.enqueue("prep","preparation",function() return false end))
assert(sch.enqueue("look","identity",function() return false end))
sch.retain(function(job) return job.subsystem=="preparation" end)
assert(sch.has("preparation") and not sch.has("identity"),"only the preparation job is kept")
assert(sch.enqueue("look","identity",function() return false end),"a dropped job's key is free again")
for _=1,3 do sch.failed("preparation","boom") end
assert(sch.isDisabled("preparation"),"three failures disable a subsystem")
sch.forgive()
assert(not sch.isDisabled("preparation") and sch.enqueue("prep2","preparation",function() return true end),
    "a forgiven subsystem runs again, as a fresh scheduler did")

local status=assert(runtime:match("function R%.automaticStatus%(%)(.-)\nend\n"),"R.automaticStatus must exist")
assert(status:find("active=",1,true) and status:find("activeLimit=Cases.MAX_ACTIVE",1,true),"the status must say how many cases are unfinished and the limit")

-- And the timer does not even try at the limit.
local built=0
getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
getPlayer=function() return {} end
getGameTime=function() return {getWorldAgeHours=function() return 100 end} end
ZombRand=function() return 1 end
ConspiracyFiles={}
local s={preparing=false,count=6,limit=10,scheduled=true,lastCreatedHours=0,active=4,activeLimit=4}
package.preload["ConspiracyFiles/GeneratedRuntime"]=function() return {automaticStatus=function() return s end,nextCase=function() built=built+1 end} end
package.preload["ConspiracyFiles/Trial"]=function() return {start=function() return true end} end
package.preload["ConspiracyFiles/Log"]=function() return {message=function() end} end
local A=require("ConspiracyFiles/AutomaticInvestigations")
A.onStart(); A.config.minGapHours=0; A.config.afterCompletionHours=0
A.poll(); assert(built==0,"no new case is attempted while four cases are unfinished")
s.active=3; A.poll(); assert(built==1,"a finished case frees a place and the next case is attempted")
print("PASS the preparation flag cannot stick: refused at the limit before scanning, cleared when refused or dropped")
