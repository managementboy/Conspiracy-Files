-- The next case waits a little after a case finishes (P4-R121), so answers the
-- survivor gives right away can steer it. The 24-hour gap still applies, and a
-- save that never recorded a completion keeps the timer alone.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local built=0
local hours=0
getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
getPlayer=function() return {} end
getGameTime=function() return {getWorldAgeHours=function() return hours end} end
ZombRand=function() return 1 end
ConspiracyFiles={}
local status={preparing=false,count=1,limit=10,scheduled=true,lastCreatedHours=0}
package.preload["ConspiracyFiles/GeneratedRuntime"]=function() return {
    automaticStatus=function() return status end,nextCase=function() built=built+1 end} end
package.preload["ConspiracyFiles/Trial"]=function() return {start=function() return true end} end
package.preload["ConspiracyFiles/Log"]=function() return {message=function() end} end
local A=require("ConspiracyFiles/AutomaticInvestigations")
A.onStart()
assert(A.config.afterCompletionHours==1,"the wait after a completion is one in-game hour")

status.lastCompletedHours=30
hours=30.5; A.poll(); assert(built==0,"no new case within the hour after a completion")
hours=31.01; A.poll(); assert(built==1,"the next case comes once the hour has passed")

built=0; status.lastCompletedHours=nil
hours=23; A.poll(); assert(built==0,"the 24-hour gap still applies")
hours=24; A.poll(); assert(built==1,"with no completion recorded the timer alone decides")
-- At the active-case limit the timer does not try at all (test/preparation_flag.lua).
built=0; hours=100; status.active=4; status.activeLimit=4
A.poll(); assert(built==0,"no attempt while the save's four unfinished cases are in play")
status.active=nil; status.activeLimit=nil
print("PASS the next case waits an hour after a completion, on top of the 24-hour gap")
