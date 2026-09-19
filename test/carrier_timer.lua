-- THE CARRIER TIMER (P4-R134, and the fault found in review at `383c252`).
--
-- RED BY DESIGN until the fix lands.
--
-- The fault: GeneratedRuntime's carrier watcher decided the timer with
--
--     api.missing(d.id, found and nil or hours)
--
-- and in Lua `true and nil` is nil, so `nil or hours` is hours; `false and nil`
-- is false, so `false or hours` is hours. BOTH branches pass hours. The
-- clear-the-timer branch is unreachable, and because api.missing records only
-- the FIRST missing hour, a carrier standing in front of the survivor is marked
-- missing once, never cleared, and its clue is dropped three in-game days later.
--
-- Why no existing test caught it: all four timer behaviours are already proven
-- against Session's own api.missing in test/clues_on_the_move.lua, and all four
-- pass. The API was never wrong. The bug is one expression in the CALLER.
--
-- So this test does two things, and the second is the one that would have caught
-- it. An earlier draft claimed the client file "cannot be loaded outside the
-- game" and checked the source text for the word `missingMark` instead - which
-- proves only that the word appears somewhere. That was wrong on both counts:
-- test/g2_smoke.lua, test/g2_faults.lua and test/clue_recognition.lua all load
-- GeneratedRuntime under mocks, so the real watcher can be exercised, and the
-- arguments actually reaching api.missing can be read.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")

-- ---------------------------------------------------------------------------
-- 1. The decision as a pure function --------------------------------------
-- ---------------------------------------------------------------------------
-- The decision moves into the pure layer so it is testable on its own, not
-- only through a mocked game.
assert(type(S.missingMark)=="function","Session decides the carrier mark")
assert(S.missingMark(true,10)==nil,"a carrier that is there clears the timer")
assert(S.missingMark(true,0)==nil,"even at hour zero")
assert(S.missingMark(false,10)==10,"a carrier that is gone starts the timer")
assert(S.missingMark(false,0)==0,"hour zero is a real hour, not absent")
for _,hour in ipairs({0,1,10,72,1000}) do
    assert(S.missingMark(true,hour)~=S.missingMark(false,hour),
        "found and not-found must differ at hour "..hour.." - the fault was that they did not")
end
print("PASS carrier timer: the mark distinguishes a carrier that is there from one that is gone")

-- ---------------------------------------------------------------------------
-- 2. The four behaviours through Session's own API -------------------------
-- ---------------------------------------------------------------------------
local function snap(missingHours,status,known)
    return {case={caseId="c1",documents={{id="d1"}}},
            assignments={d1={status=status or "placed",missingHours=missingHours}},
            known=known or {}}
end
-- Expiry runs from the hour recorded, and only the first is kept.
assert(#S.missingIds(snap(100),100+S.DEFER_EXPIRE_HOURS-0.1)==0,"not expired a moment early")
assert(#S.missingIds(snap(100),100+S.DEFER_EXPIRE_HOURS)==1,"expired exactly on three in-game days")
assert(#S.missingIds(snap(nil),10000)==0,"a cleared timer never expires, however long we wait")
assert(#S.missingIds(snap(100,"placed",{"d1"}),100+S.DEFER_EXPIRE_HOURS)==0,
    "a clue already in hand is never missing")
print("PASS carrier timer: a cleared timer never expires and a set one expires on the three days")

-- ---------------------------------------------------------------------------
-- 3. THE REAL WATCHER, with carrier resolution mocked ---------------------
-- ---------------------------------------------------------------------------
-- What reaches api.missing is the whole of the fault, so it is what is read.
local CARRIER={x=0,y=0,z=0,objectIndex=0,containerIndex=0,sprite="body",
               carrierKind="corpse",carrierMark="mark-1",containerType=S.CARRIER_CONTAINER}
assert(S.isMobile(CARRIER),"the fixture target really is a carrier")

local resolveFinds=true          -- flipped per case below
local calls                      -- every api.missing call, in order

local function fixture()
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    package.preload["ConspiracyFiles/ClueCue"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    -- Carrier resolution is the one thing under test: it says found or not.
    package.preload["ConspiracyFiles/WorldAccess"]=function()
        return {resolve=function() return resolveFinds and {getItems=function() return {size=function() return 1 end,get=function() return nil end} end} or nil end,
                count=function() end}
    end
    Events={OnTick={Add=function() end},OnGameStart={Add=function() end}}
    local worldAge=0
    getGameTime=function() return {getWorldAgeHours=function() return worldAge end} end
    local player={getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end,
                  getModData=function() return {} end,getVehicle=function() return nil end}
    getPlayer=function() return player end
    getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    getTimeInMillis=function() return 0 end
    getCell=function() return {getGridSquare=function() return nil end} end
    instanceof=function() return false end
    ModData={getOrCreate=function() return {} end,get=function() return nil end}
    local R=require("ConspiracyFiles/GeneratedRuntime")
    return R,function(h) worldAge=h end
end

local R,setHours=fixture()
-- The watcher is a file-local function today. The fix must expose it - a named
-- test access point, or the scheduler - because a source-text check cannot read
-- the arguments, and the arguments ARE the fault.
assert(type(R.carrierWatch)=="function",
    "the watcher has a test access point, so its arguments can be read rather than grepped for")

-- ONE session, reused through the whole sequence. An earlier draft built a
-- fresh fake per scenario and set missingHours by hand, which meant it never
-- proved disappearance -> return -> second disappearance on one continuous
-- state - and the fault is precisely a state that is never cleared.
local state={status="placed",missingHours=nil,target=CARRIER,physicalToken="cf-g2:d1"}
local session={case={caseId="c1",documents={{id="d1"}}},assignments={d1=state},known={}}
local api={
    snapshot=function() return session end,
    assignment=function() return state end,
    -- The real semantics of Session.api.missing, so the sequence behaves as the
    -- game would: nil clears, and only the FIRST missing hour is kept.
    missing=function(id,hours)
        calls[#calls+1]={id=id,hours=hours}
        if hours==nil then state.missingHours=nil
        elseif state.missingHours==nil then state.missingHours=hours end
        return true
    end,
    dropMissing=function(id,hours)
        calls[#calls+1]={dropMissing=true,id=id,hours=hours}
        state.status="dropped"; state.target=nil; state.missingHours=nil
        state.droppedFrom="carrier"
        return true
    end,
}
local watch=R.carrierWatch(api)

-- (a) The carrier disappears: the hour is recorded.
calls={}; resolveFinds=false; setHours(100); watch()
assert(#calls==1,"the watcher asked about the carrier exactly once: "..#calls)
assert(calls[1].hours==100,"a carrier that is gone is marked with the hour: "..tostring(calls[1].hours))
assert(state.missingHours==100,"and the timer is now running from 100")

-- Still gone: only the first hour counts.
calls={}; setHours(140); watch()
assert(state.missingHours==100,"the wait is measured from when it went, not the last look")

-- (b) It RETURNS: the timer must be cleared. This is the assertion the fault
--     fails, because `found and nil or hours` yields the hour on both branches.
calls={}; resolveFinds=true; setHours(150); watch()
assert(#calls==1,"the watcher asked once")
assert(calls[1].hours==nil,
    "a carrier that is THERE must clear the timer, not re-mark it. Got "..tostring(calls[1].hours))
assert(state.missingHours==nil,"the timer is actually cleared on the same state, not a fresh fixture")

-- The clue must not expire now, however long we wait.
assert(#S.missingIds(session,10000)==0,"a carrier that came back never expires")

-- (c) It disappears AGAIN: a fresh timer, from the new hour, on the same state.
-- The clock only ever moves FORWARD from here. An earlier draft ran
-- 100 -> 140 -> 150 -> 200 -> 172 -> 272, stepping time backwards at the
-- expiry check, which no game clock does and which made the survival assertion
-- meaningless. The second disappearance is at 160 so that 100 + three days
-- (172) lands AFTER it and still tests the right thing.
calls={}; resolveFinds=false; setHours(160); watch()
assert(calls[1].hours==160,"gone again starts again from the new hour: "..tostring(calls[1].hours))
assert(state.missingHours==160,"not 100 - the return cancelled the first wait")

-- (d) Expiry runs from the LAST disappearance. At 172 the FIRST disappearance
--     is three days old but the second is not, so the clue must survive. Had
--     (b) failed to clear - the fault - it would be dropped here.
calls={}; resolveFinds=false; setHours(100+S.DEFER_EXPIRE_HOURS); watch()
for _,c in ipairs(calls) do
    assert(not c.dropMissing,
        "the fault would have dropped this clue at the FIRST hour plus three days")
end
assert(state.status=="placed","and it is still placed")

-- On the three days from 160, it goes.
calls={}; setHours(160+S.DEFER_EXPIRE_HOURS); watch()
local dropped=false
for _,c in ipairs(calls) do if c.dropMissing then dropped=true end end
assert(dropped,"three in-game days gone and the clue is dropped")
assert(state.status=="dropped" and state.droppedFrom=="carrier",
    "dropped by the carrier path, recorded as such")

print("PASS carrier timer: one continuous session - gone, returned, gone again, expired from the last disappearance")
