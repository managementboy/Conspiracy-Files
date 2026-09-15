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

local openAll=assert(runtime:match("local function openAll%(%)(.-)\nend\n"),"openAll must exist")
local replaced=openAll:find("scheduler=Scheduler.new",1,true)
local cleared=openAll:find("preparing=false",1,true)
assert(replaced and cleared and cleared>replaced,"replacing the scheduler drops queued preparation, so openAll must clear the flag")

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
