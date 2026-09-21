-- A LONG-RUNNING JOB MUST NEVER TOUCH THE EVENT LIST FROM INSIDE THE EVENT.
--
-- What this is for, in one paragraph. A case's nearby scan finished, called
-- cancel() from inside step(), which runs inside tick(), which runs inside
-- OnTick's own dispatch - and removing a handler mid-dispatch leaves
-- Events.OnTick unable to accept new handlers for the rest of the session. A
-- probe added afterwards recorded 0 ticks over 30 seconds while the game clock
-- advanced normally. The next case's scan then sat at building 0 of 9,978 with
-- ticks=0 forever: no error, no refusal, and the generator honestly reporting
-- itself busy. A campaign produced two cases and then stopped for good
-- (20260921T074140-campaign: nineteen failures, one cause).
--
-- The mock in every other test accepts Add and Remove at any time, so no
-- offline test could see this. The one here does not: it models the engine.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

-- ---------------------------------------------------------------- the engine
-- Add and Remove are legal. Doing either DURING a dispatch poisons Add for the
-- rest of the session, which is what the real Events.OnTick does.
local E={list={},dispatching=false,poisoned=false,mutatedInDispatch=nil}
local function note(what)
    if E.dispatching then
        E.poisoned=true
        E.mutatedInDispatch=E.mutatedInDispatch or what
    end
end
E.OnTick={
    Add=function(f)
        note("Add")
        if E.poisoned then return end          -- inert, silently, like the game
        E.list[#E.list+1]=f
    end,
    Remove=function(f)
        note("Remove")
        for i,c in ipairs(E.list) do if c==f then table.remove(E.list,i); break end end
    end,
}
function E.dispatch()
    E.dispatching=true
    for _,f in ipairs({unpack(E.list)}) do f() end
    E.dispatching=false
end
Events=E

-- ------------------------------------------------------------------ the world
local clock=0
getTimeInMillis=function() return clock end
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getGameVersion=function() return "42.20.4-test" end
local engineCalls=0
local function rooms(n)
    local r={}
    for i=1,n do r[i]={getName=function() return "kitchen" end,getX=function() return 0 end,
        getY=function() return 0 end,getX2=function() return 2 end,getY2=function() return 2 end,
        getZ=function() return 0 end,getArea=function() return 4 end,
        getRects=function() return {size=function() return 0 end} end} end
    return {size=function() return n end,get=function(_,i) return r[i+1] end}
end
local BUILDINGS=40
local function building(i)
    return {
        getX=function() return i*10 end, getY=function() return 0 end,
        getX2=function() return i*10+4 end, getY2=function() return 4 end,
        getRooms=function() engineCalls=engineCalls+1; return rooms(1) end,
        getIDString=function() return "b"..i end,
        getMinLevel=function() return 0 end, getMaxLevel=function() return 1 end,
        isShop=function() return false end, isResidential=function() return true end,
    }
end
local buildings={size=function() return BUILDINGS end,get=function(_,i) return building(i) end}
getWorld=function() return {getMetaGrid=function() return {getBuildings=function() return buildings end} end,
    getMap=function() return "TESTMAP" end} end
getPlayer=function() return {getX=function() return 0 end,getY=function() return 0 end,
    getZ=function() return 0 end,getHoursSurvived=function() return 10 end} end

-- The scan narrates itself at info level; this test is about lifecycle, not
-- wording, so the lines are captured rather than printed.
local logged={}
local realPrint=print
print=function(s) logged[#logged+1]=tostring(s) end

local T=dofile("mod/common/media/lua/client/ConspiracyFiles/T3Nearby.lua")
assert(#E.list==1,"the scan dispatcher is registered once, at load")
local dispatcher=E.list[1]

-- ------------------------------------------------- the idle dispatcher is free
local idleCalls=engineCalls
for _=1,50 do E.dispatch() end
assert(engineCalls==idleCalls,
    "an idle dispatcher must do no work: it returned early "..(50).." times and "
    .."still made "..(engineCalls-idleCalls).." engine calls")
assert(not T.progress(),"there is no job, so there is no progress to report")
local _,why=T.progress()
assert(why=="no scan has run","an absent job must say why: got "..tostring(why))

-- ----------------------------------------------------- 1. the first scan runs
assert(T.start(500,1),"the first scan starts")
assert(T.progress().phase=="scan","the job reports its phase")
local guard=0
while T.progress() do
    E.dispatch(); clock=clock+1; guard=guard+1
    -- Ask every frame, not only at the end: a handler removed mid-scan takes
    -- the dispatcher with it and the loop would otherwise just spin to its
    -- guard and report the wrong thing.
    assert(not E.poisoned,
        "the scan mutated the event list from inside OnTick's dispatch ("
        ..tostring(E.mutatedInDispatch).."), at frame "..guard)
    assert(#E.list>=1,"the scan removed its own dispatcher at frame "..guard)
    assert(guard<20000,"the first scan must terminate")
end
assert(T.result,"the first scan completed and left a terminal result")
assert(not T.error,"the first scan reported no error: "..tostring(T.error))
assert(select(2,T.progress())=="complete","a finished job reports completion")

-- THE ASSERTION THE WHOLE FILE IS FOR. cancel() ran from inside the dispatch.
assert(not E.poisoned,
    "the finished scan mutated the event list from inside OnTick's dispatch ("
    ..tostring(E.mutatedInDispatch)..") - Events.OnTick is now inert and every "
    .."later handler, including the next case's scan, will never receive a tick")
assert(#E.list==1,"the dispatcher is still registered after a scan finishes")

-- -------------------------- 2. a second scan, started from inside a dispatch
-- This is the real shape of the bug: nextCase runs inside the scheduler, which
-- runs inside an OnTick handler, so the second scan is ASKED FOR from inside
-- the very dispatch the first one finished in.
local started,startError=false,nil
E.list[#E.list+1]=function()
    if started then return end
    started=true
    local ok,err=T.start(500,2)
    startError=ok and nil or err
end
E.dispatch(); clock=clock+1
assert(started,"the scheduled work ran")
assert(not startError,"the second scan was refused from inside scheduled work: "..tostring(startError))
local second=T.progress()
assert(second,"a second job exists")

-- 3. ...and it must actually RECEIVE TICKS AND ADVANCE. This is what failed:
-- the job existed, reported itself busy, and its ticks stayed at 0 forever.
local before=second.ticks
for _=1,5 do E.dispatch(); clock=clock+1 end
local after=T.progress()
assert(after,"the second scan is still running after five frames")
assert(after.ticks>before,
    "the second scan received no ticks at all (ticks "..before.." -> "..after.ticks
    ..") - it is registered but the event list is not delivering to it")
assert(after.scanned>0 or after.index>0,
    "the second scan received ticks but advanced nothing (index "..tostring(after.index)
    ..", scanned "..tostring(after.scanned)..")")
guard=0
while T.progress() do
    E.dispatch(); clock=clock+1; guard=guard+1
    assert(guard<20000,"the second scan must terminate")
end
assert(T.result and not T.error,"the second scan completed")
assert(not E.poisoned,"no dispatch-time mutation across two whole scans")

-- ------------------------------------------- 4. cancellation, from inside too
assert(T.start(500,3))
local cancelled=false
E.list[#E.list+1]=function() if not cancelled then cancelled=true; T.cancel() end end
E.dispatch()
assert(cancelled and not T.progress(),"cancel from inside a dispatch stops the job")
assert(not E.poisoned,
    "cancel mutated the event list during dispatch ("..tostring(E.mutatedInDispatch)..")")
assert(#E.list>=1,"the dispatcher survives a cancellation")

-- ------------------------------------ 5. a wedged job must say so, not wait
-- A job given frames that advances nothing is broken, and used to be
-- indistinguishable from a slow one: it sat there while the generator honestly
-- reported "busy", with no error, no refusal and no way to ask. The bound is in
-- FRAMES, not seconds, because every step here is paced per frame - so a
-- machine at 7 fps and one at 60 are judged by the same thing.
assert(T.STALL_FRAMES and T.STALL_FRAMES>0,"the stall bound is a frame count")
-- A building with more rooms than the job can walk in STALL_FRAMES frames
-- freezes phase, cursor and scanned count while steps and ticks keep rising -
-- which is exactly the shape of a starved job.
local HUGE=(T.STALL_FRAMES+50)*24
buildings={size=function() return 1 end,get=function()
    local b=building(1); b.getRooms=function() return rooms(HUGE) end; return b end}
assert(T.start(500,4),"the wedged scan starts")
local frozen=T.progress()
local ranFor=0
while T.progress() and ranFor<T.STALL_FRAMES+40 do
    E.dispatch(); clock=clock+1; ranFor=ranFor+1
end
assert(not T.progress(),
    "a job that made no progress for "..ranFor.." frames is still running; it "
    .."must exit with a diagnostic rather than stay busy forever")
assert(T.error and T.error:find("no progress",1,true),
    "the wedged job must say WHY it stopped, in the numbers that prove it: got "
    ..tostring(T.error))
assert(T.error:find("frames",1,true) and T.error:find("steps=",1,true),
    "the diagnostic must quote the frames without progress and the steps run: "..T.error)
assert(ranFor>=T.STALL_FRAMES,
    "the job gave up after "..ranFor.." frames, before its own bound of "
    ..T.STALL_FRAMES.."; a slow machine would be failed for being slow")
assert(frozen.stallAfterFrames==T.STALL_FRAMES,
    "a running job must publish the frame bound it will be judged against")
T.error=nil

-- --------------------------------- 6. the other two shipped tick users, same
-- Both are debug-gated, and both used to remove their handler from inside their
-- own run. They ship, and a debug session that ran one would poison every later
-- tick handler in the session exactly as above.
for _,path in ipairs({"IdentityProbe","GeneratedDiagnostic"}) do
    local src=io.open("mod/common/media/lua/client/ConspiracyFiles/"..path..".lua","rb")
    local body=src:read("*a"); src:close()
    for line in body:gmatch("[^\n]+") do
        if not line:match("^%s*%-%-") then
            assert(not line:find("Events.OnTick.Remove",1,true)
                or line:find("ConspiracyFiles.",1,true),
                path..": the only permitted OnTick.Remove is the previous "
                .."module's handler at load time, which is outside any "
                .."dispatch. This line is not that: "..line)
        end
    end
    assert(body:find("Events.OnTick.Add",1,true),path.." must register a dispatcher")
end

-- ------------ 7. and the copy of the diagnostic that used to shadow the module
local t3=io.open("mod/common/media/lua/client/ConspiracyFiles/T3Nearby.lua","rb")
local t3src=t3:read("*a"); t3:close()
for line in t3src:gmatch("[^\n]+") do
    if not line:match("^%s*%-%-") then
        assert(not line:find("ConspiracyFiles.GeneratedDiagnostic=",1,true),
            "T3Nearby must not assign ConspiracyFiles.GeneratedDiagnostic: client "
            .."Lua loads in name order, so a copy here loads AFTER "
            .."GeneratedDiagnostic.lua and replaces the real module - which is "
            .."how D.access came to be nil in the game while its offline test passed")
    end
end

print=realPrint
print("PASS tick dispatch lifecycle: one permanent dispatcher, free when idle; two "
    .."scans complete; the second starts from inside scheduled work, receives ticks "
    .."and advances; cancellation never mutates the listener list during dispatch; "
    .."a wedged job is bounded in frames; no shipped module removes its own handler")
