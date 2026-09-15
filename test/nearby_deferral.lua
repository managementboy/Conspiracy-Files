-- A refused new case waits for the survivor to move on (P4-R125, owner
-- 2026-09-15). When a later case found no unused, loaded buildings with enough
-- containers nearby, the timer asked again every 10-20 seconds and each attempt
-- re-scanned the same neighbourhood: 61 refused scans in about 25 minutes in the
-- campaign check. Now the next attempt waits until the survivor has moved about
-- 50 tiles or half an in-game hour has passed; a case created, or a load,
-- clears the wait.
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")

assert(runtime:find("R.DEFER_TILES=50",1,true) and runtime:find("R.DEFER_HOURS=0.5",1,true),
    "the wait is 50 tiles or half an in-game hour")

local nextCase=assert(runtime:match("function R%.nextCase%(seed%)(.-)\nend\n"),"R.nextCase must exist")
local guard=nextCase:find("if deferredAt then",1,true)
local probe=nextCase:find("probe.start",1,true)
assert(guard and probe and guard<probe,"R.nextCase must wait out a refusal BEFORE scanning again")
assert(nextCase:find("dx*dx+dy*dy<R.DEFER_TILES*R.DEFER_TILES and worldHours()<deferredAt.hours+R.DEFER_HOURS",1,true),
    "moving on OR the time passing ends the wait")

local prepare=assert(runtime:match("local function prepare%(result,seed,later,house%)(.-)\nfunction R%.start"),"prepare must exist")
local _,marks=prepare:gsub("if later then deferredAt={x=p:getX%(%),y=p:getY%(%),hours=worldHours%(%)} end","")
assert(marks==2,"both refusals - no storage nearby, too few containers - start the wait, found "..marks)
assert(prepare:find("deferredAt=nil",1,true),"a case created clears the wait")
assert(runtime:find("sessions,scheduler,preparing,wrapper=nil,nil,false,nil\n    deferredAt=nil",1,true),
    "loading a game clears the wait")
print("PASS a refused new case waits until the survivor moves on or half an hour passes")
