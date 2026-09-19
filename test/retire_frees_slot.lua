-- RETIREMENT ACTUALLY FREES THE ACTIVE SLOT.
--
-- The regression that was missing. test/retire_after_final_drop.lua proves the
-- helper exists, declines when it should and never throws; it runs without a
-- campaign, so it could not prove the thing that matters - that a case
-- completed by a drop stops occupying one of the four active slots. Nothing
-- covered that, and the stall is exactly a slot never being freed.
--
-- Two faults had to be fixed before this could pass, and both were found by the
-- owner reviewing rather than by any run:
--
--   1. Session.accounted was consulted in ONE place, the inspection path. Both
--      drop paths dropped a clue and never re-checked, so a case completed by a
--      drop was never offered for retirement at all (P4-R142).
--   2. RetiredCase then REFUSED it. A dropped clue projects no row, and both
--      tiers required at least MIN_EVIDENCE rows, so a case whose clues were
--      mostly dropped failed with "invalid retired rows" and kept its slot
--      anyway. Reproduced against a one-container fixture:
--          known=1 valid=true accounted=true retired=nil
--          reason=invalid retired rows
--      The minimum is now explained rather than dropped: a short case must
--      carry the gaps that account for the shortfall.
--
-- So the fix is only real if BOTH hold, which is what this file asserts.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local c=G.generate(catalog(),s,OPTS); if c then return c end end
    error("no generated case near seed "..seed)
end
local function fixedAt(site)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,containerIndex=0,
            containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end

-- ---------------------------------------------------------------------------
-- 1. A case with almost nothing found can retire at all -------------------
-- ---------------------------------------------------------------------------
-- ONE container in the whole case, so one clue is found and the rest are
-- dropped. This is the owner's reproduction.
local function starvedCase(seed)
    local case=makeCase(seed)
    local cand,first={},true
    for _,site in ipairs(case.locations) do
        if first then cand[site.id]={fixedAt(site)}; first=false else cand[site.id]={} end
    end
    local root,waiting=S.createDistributed(case,cand,nil,nil,0)
    assert(root and #waiting>0,"the starved fixture leaves clues waiting")
    return case,root,waiting
end

local case,root,waiting=starvedCase(4001)
local api=assert(S.open(root,function() end))
local known=0
for _,d in ipairs(case.documents) do
    local a=api.assignment(d.id)
    if a.status~="deferred" then
        assert(api.status(d.id,"placed",0)); assert(api.inspect(d.id)); known=known+1
    end
end
assert(known>=1 and known<G.MIN_EVIDENCE,
    "the point of this fixture is FEWER than MIN_EVIDENCE found clues: known="..known)
for _,id in ipairs(waiting) do assert(api.drop(id)) end
local done=api.snapshot()
assert(S.accounted(done),"the case is accounted for")
assert(S.completion(done)==S.WITH_GAPS,"and ended with gaps")

local retired,why=Retired.retire(done,nil,720)
assert(retired,"a case with fewer than MIN_EVIDENCE rows still retires when gaps explain it: "..tostring(why))
assert(#(retired.rows or {})<G.MIN_EVIDENCE,"it really does have fewer rows than the old minimum")
local state,gaps=S.completion(retired)
assert(state==S.WITH_GAPS and #gaps==#waiting,"and it remembers every gap")
assert(Retired.shrink(retired),"and it can be deep-archived, so it is not stranded one tier down")

-- The minimum is explained, not abandoned: a short case with NO gaps is still
-- refused, so nothing else can sneak through the widened gate.
local liar={schema=Retired.SCHEMA,caseId="liar",rows={retired.rows[1]},known={retired.known[1]}}
assert(not Retired.validate(liar),"a short case with no gaps is still refused")
print("PASS retire frees slot: a case whose clues were mostly dropped can retire and archive")

-- ---------------------------------------------------------------------------
-- 2. AND THE SLOT IS ACTUALLY FREED, in the runtime ------------------------
-- ---------------------------------------------------------------------------
-- The runtime is loaded under mocks and handed a saved campaign, the way a save
-- hands it one, so retirement runs through the real code path and the active
-- count can be read before and after.
local saved={}
local fixture=(function()
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    package.preload["ConspiracyFiles/ClueCue"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    local events={}
    Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end}}
    getGameTime=function() return {getWorldAgeHours=function() return 800 end} end
    getPlayer=function() return nil end
    getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    getTimeInMillis=function() return 0 end
    getCell=function() return {getGridSquare=function() return nil end} end
    instanceof=function() return false end
    ModData={getOrCreate=function() return saved end,get=function() return saved end}
    local R=require("ConspiracyFiles/GeneratedRuntime")
    return {R=R,events=events}
end)()

-- A wrapper holding the completed case. ONE live case, not two: two starved
-- case envelopes together exceed the real 500 kB save budget (measured here at
-- 541,871 bytes and correctly refused by the runtime), and the count going
-- 1 -> 0 proves a freed slot exactly as well as 2 -> 1.
local wrapper={canonical=done,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"the wrapper validates with the completed case as canonical")

local function liveCount(w)
    local n=0
    for _,r in ipairs(Cases.sessions(w)) do if not Retired.isRetired(r) then n=n+1 end end
    return n
end
assert(liveCount(wrapper)==1,"the case is holding a slot before retirement")

saved.campaign=wrapper
fixture.events.start()

-- The runtime now holds the saved campaign. Retire the completed case through
-- the real helper - the one both drop paths call.
local freed=fixture.R.retireIfAccounted(done)
assert(freed==true,"the completed case is retired: "..tostring(freed))

-- Read the count back from the STORE, not from our own variable: retirement
-- writes through swap, and the slot is only really freed if the save says so.
local after=saved.campaign or saved.canonical and saved or nil
assert(after,"the store still holds a campaign")
assert(liveCount(after)==0,
    "the slot is freed: live went from 1 to "..liveCount(after).." (the stall is it staying at 1)")

local stillThere
for _,r in ipairs(Cases.sessions(after)) do
    if Retired.isRetired(r) and r.caseId==done.case.caseId then stillThere=r end
end
assert(stillThere,"the retired case is in the save, not lost")
local rstate,rgaps=S.completion(stillThere)
assert(rstate==S.WITH_GAPS and #rgaps==#waiting,"and it kept what it ended without")

-- Asked again, it must decline rather than retire twice.
assert(fixture.R.retireIfAccounted(done)==false,"already retired: nothing further to do")
assert(liveCount(saved.campaign or after)==0,"and the count does not move again")
print("PASS retire frees slot: a case completed by a drop gives its active slot back")
