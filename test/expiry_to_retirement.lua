-- THE WHOLE SEQUENCE, END TO END, ON A CONTROLLED CLOCK.
--
-- The integration gap the earlier tests left open. test/retire_frees_slot.lua
-- calls retireIfAccounted directly, so it proves retirement frees a slot but
-- not that anything ever calls it in a running game. This drives the REAL
-- scheduler:
--
--   1. inspect every available clue, leave one deferred;
--   2. advance the clock past its expiry;
--   3. let the actual scheduler job perform the drop;
--   4. verify retirement, slot release, and the gap ids and history kept;
--   5. the same for a carrier that goes missing, across a save and reload.
--
-- Why this needs a controlled clock: DEFER_EXPIRE_HOURS is 72 IN-GAME hours. A
-- real-time run accumulates about eight in an hour and a quarter, which is why
-- the 77-minute campaign run of 2026-09-19 was structurally incapable of
-- reaching this path at all. Here the clock is a variable.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
-- The REAL WorldAccess, kept so the fixture can override one function and leave
-- the rest alone. A hand-built stub is not enough: the identity job calls
-- identityScan on the same tick round as the carrier watch, so a stub missing it
-- throws out of the tick and the watch never runs.
local RealWorld=require("ConspiracyFiles/WorldAccess")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local c=G.generate(catalog(),s,OPTS); if c then return c end end
    error("no generated case near seed "..seed)
end
local function fixedAt(site,index)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=index or 0,containerIndex=0,
            containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end
local function carrierAt(site,mark)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,containerIndex=0,
            containerType=S.CARRIER_CONTAINER,sprite="corpse",carrierKind="corpse",carrierMark=mark}
end
local function liveCount(w)
    local n=0
    for _,r in ipairs(Cases.sessions(w)) do if not Retired.isRetired(r) then n=n+1 end end
    return n
end

-- A runtime under mocks with a CLOCK WE OWN and a resolver we own.
local function runtime(store,opts)
    opts=opts or {}
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    -- WorldAccess too. package.preload is only consulted for a module that is
    -- NOT already loaded, so without this the second runtime silently keeps the
    -- FIRST one's resolver - and flipping this fixture's carrier to "gone" had
    -- no effect whatsoever, which is a fixture that proves the opposite of what
    -- it claims.
    package.loaded["ConspiracyFiles/WorldAccess"]=nil
    package.preload["ConspiracyFiles/ClueCue"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    -- Carrier resolution: the second scenario flips this to "gone".
    local state={hours=0,found=true}
    package.preload["ConspiracyFiles/WorldAccess"]=function()
        local proxy={}
        for k,v in pairs(RealWorld) do proxy[k]=v end
        -- Only the carrier lookup is faked: present returns a container, gone
        -- returns nil. Everything else is the real module.
        proxy.resolve=function()
            if not state.found then return nil end
            return {getItems=function() return {size=function() return 0 end,get=function() return nil end} end,
                    getType=function() return "carrier" end}
        end
        return proxy
    end
    local events={}
    Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end}}
    getGameTime=function() return {getWorldAgeHours=function() return state.hours end} end
    -- A player standing where the carrier is, so "gone" is only ever concluded
    -- somewhere the survivor could actually have looked (Carriers.FIND_RADIUS).
    local px,py,pz=opts.x or 0,opts.y or 0,opts.z or 0
    -- An EMPTY but real inventory. A nil one is not enough: the identity job
    -- runs on the same tick round as the filler and calls methods on it, so a
    -- nil inventory throws out of the tick and the filler never runs at all -
    -- which is exactly how the first version of this test silently proved
    -- nothing about the scheduler.
    local function javaList(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
    local inventory={getItems=function() return javaList({}) end,
                     getType=function() return "inventory" end,
                     isExplored=function() return true end,
                     AddItem=function(_,item) return item end}
    local player={getX=function() return px end,getY=function() return py end,getZ=function() return pz end,
                  getModData=function() return {} end,getVehicle=function() return nil end,
                  getInventory=function() return inventory end,
                  getHoursSurvived=function() return state.hours end}
    getPlayer=function() return player end
    getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    -- 0.01 per call, as test/g2_faults.lua does. At 1 per call the scheduler's
    -- 1ms budget is spent by its own first clock read and it steps ZERO jobs -
    -- which is why the first version of this test saw no drop and no error.
    local ms=0; getTimeInMillis=function() ms=ms+0.01; return ms end
    getCell=function() return {getGridSquare=function() return nil end} end
    instanceof=function() return false end
    ModData={getOrCreate=function() return store end,get=function() return store end}
    local R=require("ConspiracyFiles/GeneratedRuntime")
    return {R=R,events=events,state=state,
            -- The jobs are enqueued every 120 ticks and stepped after; 600 is
            -- several full rounds, so a job that defers a step still gets there.
            run=function(n) for _=1,(n or 600) do events.tick() end end}
end

-- ---------------------------------------------------------------------------
-- 1. A DEFERRED CLUE EXPIRES, the scheduler drops it, the case retires -----
-- ---------------------------------------------------------------------------
-- One container at the first site only, so clues wait.
local case=makeCase(4001)
local cand,first={},true
for _,site in ipairs(case.locations) do
    if first then cand[site.id]={fixedAt(site,0)}; first=false else cand[site.id]={} end
end
local root,waiting=S.createDistributed(case,cand,nil,nil,0)
assert(root and #waiting>0,"the starved fixture leaves clues waiting")

local wrapper={canonical=root,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"the wrapper validates")
-- Discover THROUGH the wrapper: it keeps a global discovery order and refuses a
-- case whose clues were inspected outside it.
local wrapApi=assert(S.open(Cases.sessions(wrapper)[1],
    function(staged) wrapper=assert(Cases.replace(wrapper,1,staged)) end))
local deferredSet={}
for _,id in ipairs(waiting) do deferredSet[id]=true end
for _,d in ipairs(case.documents) do
    if not deferredSet[d.id] then
        assert(wrapApi.status(d.id,"placed",0)); assert(wrapApi.inspect(d.id))
    end
end
local staged=wrapApi.snapshot()
assert(not S.accounted(staged),"a clue is still waiting, so the case is NOT finished yet")
assert(S.completion(staged)==S.UNFINISHED,"and it reads as unfinished")
assert(liveCount(wrapper)==1,"it holds an active slot")
local deferHour=staged.assignments[waiting[1]].deferredHours
assert(type(deferHour)=="number","the waiting clue carries the hour its wait began")

local store={campaign=wrapper}
local rt=runtime(store)
rt.events.start()

-- Before expiry: the scheduler must NOT drop anything.
rt.state.hours=deferHour+S.DEFER_EXPIRE_HOURS-1
rt.run()
local mid=Cases.sessions(store.campaign or wrapper)[1]
assert(not Retired.isRetired(mid),"a moment before three in-game days, nothing is dropped or retired")
assert(liveCount(store.campaign)==1,"and the slot is still held")

-- Past expiry: the real filler job drops the clue, and the drop completes the
-- case, and the case retires. No direct call to retireIfAccounted anywhere.
rt.state.hours=deferHour+S.DEFER_EXPIRE_HOURS+1
rt.run()

local after=store.campaign
assert(after,"the store still holds a campaign")
assert(liveCount(after)==0,
    "the slot is freed by the SCHEDULER, not by the test: live="..liveCount(after))
local retired
for _,r in ipairs(Cases.sessions(after)) do
    if Retired.isRetired(r) and r.caseId==case.caseId then retired=r end
end
assert(retired,"the case is retired in the save")
local state,gaps=S.completion(retired)
assert(state==S.WITH_GAPS,"it retired knowing it ended with gaps: "..tostring(state))
assert(#gaps==#waiting,"every waiting clue became a gap: "..#gaps.." of "..#waiting)
local _,history=S.gaps(retired)
for _,id in ipairs(waiting) do
    assert(history[id]=="deferred","and each is recorded as never having found a container: "..id)
end
print("PASS expiry to retirement: the scheduler dropped an expired clue, retired the case and freed the slot")

-- ---------------------------------------------------------------------------
-- 2. A CARRIER GOES MISSING, and the same sequence holds across a reload ---
-- ---------------------------------------------------------------------------
local case2=makeCase(4100)
-- Starved the same way, because api.assign only accepts a DEFERRED clue: with
-- everything already placed there is no way to move one onto a carrier, which
-- is how the first version of this section failed. One container per site, then
-- every waiting clue is given a home explicitly - the first a CARRIER, the rest
-- fixed containers with distinct object indices so no two share one container
-- (P4-R67).
local cand2={}
for _,site in ipairs(case2.locations) do cand2[site.id]={fixedAt(site,0)} end
local root2,waiting2=S.createDistributed(case2,cand2,nil,nil,0)
assert(root2 and #waiting2>0,"the starved fixture leaves clues waiting")

local wrapper2={canonical=root2,schedule={schema=1,createdHours={1}}}
local api2=assert(S.open(Cases.sessions(wrapper2)[1],
    function(staged2) wrapper2=assert(Cases.replace(wrapper2,1,staged2)) end))

local siteOf={}
for _,site in ipairs(case2.locations) do siteOf[site.id]=site end
local mobileId
for i,id in ipairs(waiting2) do
    local site=siteOf[api2.assignment(id).locationId]
    if i==1 then
        assert(api2.assign(id,carrierAt(site,"cfc:gone-1"),0),"a waiting clue may arrive on a carrier")
        mobileId=id
    else
        assert(api2.assign(id,fixedAt(site,i+10),0),"and the rest take fixed containers")
    end
end
assert(mobileId,"one clue is on a carrier")
for _,d in ipairs(case2.documents) do
    assert(api2.status(d.id,"placed",0))
    if d.id~=mobileId then assert(api2.inspect(d.id)) end
end
local staged2=api2.snapshot()
assert(not S.accounted(staged2),"the carrier's clue is still out there, so the case is unfinished")
assert(liveCount(wrapper2)==1,"it holds a slot")

local store2={campaign=wrapper2}
local target=staged2.assignments[mobileId].target
local rt2=runtime(store2,{x=target.x,y=target.y,z=target.z})
rt2.events.start()

-- The carrier is there: nothing happens, however long we wait. This is the
-- assertion the carrier-timer fault failed - it marked a present carrier
-- missing and eventually dropped its clue.
rt2.state.found=true
rt2.state.hours=500
rt2.run()
assert(liveCount(store2.campaign)==1,"a carrier that is present never costs the case its clue")
local held=Cases.sessions(store2.campaign)[1]
assert(not Retired.isRetired(held),"and the case is not retired")
assert(held.assignments[mobileId].missingHours==nil,"and no missing timer is running")

-- Now it is gone. The watcher marks the hour, and three in-game days later the
-- clue is dropped, which completes and retires the case.
rt2.state.found=false
rt2.state.hours=600
rt2.run()
local marked=Cases.sessions(store2.campaign)[1]
assert(marked.assignments[mobileId].missingHours==600,
    "the hour it went is recorded: "..tostring(marked.assignments[mobileId].missingHours))
assert(liveCount(store2.campaign)==1,"but nothing is dropped yet")

rt2.state.hours=600+S.DEFER_EXPIRE_HOURS+1
rt2.run()
assert(liveCount(store2.campaign)==0,
    "three in-game days with no carrier and the slot is freed: live="..liveCount(store2.campaign))
local retired2
for _,r in ipairs(Cases.sessions(store2.campaign)) do
    if Retired.isRetired(r) and r.caseId==case2.caseId then retired2=r end
end
assert(retired2,"the case is retired")
local state2,gaps2=S.completion(retired2)
assert(state2==S.WITH_GAPS and #gaps2==1 and gaps2[1]==mobileId,"with the carrier's clue as its gap")
local _,history2=S.gaps(retired2)
assert(history2[mobileId]=="carrier",
    "recorded as a clue that WAS out there and lost its carrier, not one that never arrived: "
    ..tostring(history2[mobileId]))

-- SAVE AND RELOAD: the store is what a save holds, so loading it again is a
-- reload. Everything above must still be true on the other side.
local reloaded=runtime(store2,{x=target.x,y=target.y,z=target.z})
reloaded.state.hours=600+S.DEFER_EXPIRE_HOURS+1
reloaded.events.start()
reloaded.run(240)
assert(liveCount(store2.campaign)==0,"after a reload the slot is still free")
local back
for _,r in ipairs(Cases.sessions(store2.campaign)) do
    if Retired.isRetired(r) and r.caseId==case2.caseId then back=r end
end
assert(back,"and the retired case came back")
local bstate,bgaps=S.completion(back)
assert(bstate==S.WITH_GAPS and #bgaps==1 and bgaps[1]==mobileId,"with its gap id intact")
local _,bhistory=S.gaps(back)
assert(bhistory[mobileId]=="carrier","and its drop-path history intact")
print("PASS expiry to retirement: a lost carrier retires the case, and it survives a reload")
