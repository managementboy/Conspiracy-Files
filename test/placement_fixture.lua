-- THE PLACEMENT CHECK'S OWN SELECTION AND CLASSIFICATION, held without a game.
--
-- A diagnostic that captures the wrong thing, or labels it wrongly, is worse
-- than no diagnostic: it produces a confident dump about something that was
-- never wrong. The single-evaluation capture in placement.lua keeps the dump
-- honest about WHEN it looked; it cannot make the selection correct. That is
-- what this file is for.
--
-- Three faults in the first version of that check, all found by review:
--   1. it read the WRONG STORE LEVEL. Campaign cases live under
--      `store.campaign`, and Cases.current is what unwraps them; passing the
--      raw store to Cases.sessions returns nothing, so the check would have
--      inspected no cases at all and reported "no discrepancy" from an empty
--      world - the most dangerous possible outcome for a diagnostic;
--   2. it verified EVERY placed clue after the shell had loaded ONE clue's
--      square, so every other clue - in an unloaded cell by definition -
--      resolved to nothing and would have been reported as the fault;
--   3. its reload verdict treated everything except "the container holds it" as
--      "still absent", including a retired case, a clue in the survivor's bag
--      and an unloaded square.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

-- placement.lua is harness Lua and expects the game's globals. Only the parts
-- under test are loaded, with the world stubbed out.
getCell=nil
ModData={get=function() return nil end}
getPlayer=function() return nil end
dofile("tools/autotest/checks/placement.lua")
assert(type(CFPlace)=="table","the check's Lua loads outside the game")
assert(type(CFPlace.storeRoots)=="function","store reading is exposed for testing")
assert(type(CFPlace.classify)=="function","classification is exposed for testing")
assert(type(CFPlace.targetLoaded)=="function","the loaded-square test is exposed for testing")

-- ---------------------------------------------------------------------------
-- 1. IT READS THE STORE AT THE RIGHT LEVEL --------------------------------
-- ---------------------------------------------------------------------------
local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local c=G.generate(catalog(),s,OPTS); if c then return c end end
    error("no generated case near seed "..seed)
end
local function rootFor(case)
    local targets={}
    for _,site in ipairs(case.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
    end
    return assert(S.create(case,targets))
end

local case=makeCase(4200)
local root=rootFor(case)
local wrapper={canonical=root,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"the fixture wrapper is valid")

-- A real save's store: the wrapper sits UNDER `campaign`.
local store={campaign=wrapper}
local found=CFPlace.storeRoots(store)
assert(#found==1,"the check finds the live case through the store's campaign field: got "..#found)
assert(found[1].case and found[1].case.caseId==case.caseId,"and it is the right case")

-- The raw wrapper handed in directly still works (a single-case store), so the
-- fix did not trade one level for another.
assert(#CFPlace.storeRoots({canonical=root})==1,"a canonical-only store is read too")

-- THE FAULT: handed the wrapper where a store belongs, or an empty store, it
-- must return nothing - and the check must never mistake that for a clean world.
assert(#CFPlace.storeRoots({})==0,"an empty store yields no cases")
assert(#CFPlace.storeRoots(nil)==0,"no store yields no cases")

-- A retired case is not live and is never inspected for placement.
local whole=(function()
    local api=assert(S.open(rootFor(makeCase(4201)),function() end))
    for _,d in ipairs(api.snapshot().case.documents) do
        assert(api.status(d.id,"placed",0)); assert(api.inspect(d.id))
    end
    return api.snapshot()
end)()
local retired=assert(Retired.retire(whole,nil,720))
assert(#CFPlace.storeRoots({campaign={canonical=retired,schedule={schema=1,createdHours={1}}}})==0,
    "a retired case holds no placement to verify")
print("PASS placement fixture: the check reads live cases through the store's campaign level")

-- ---------------------------------------------------------------------------
-- 2. CLASSIFICATION DOES NOT OVERCLAIM ------------------------------------
-- ---------------------------------------------------------------------------
-- droppedFrom names the PATH, not proof of prior placement (P4-R141), and a
-- record with no history must stay unknown rather than being rounded down.
assert(CFPlace.classify({status="placed"})=="placed")
assert(CFPlace.classify({status="deferred"})=="never-placed","a waiting clue was never in the world")
assert(CFPlace.classify({status="dropped",droppedFrom="deferred"})=="never-placed",
    "dropped after waiting: never in the world")
assert(CFPlace.classify({status="dropped",droppedFrom="carrier"})=="carrier-path",
    "dropped by the carrier path - NOT a claim that it was ever placed")
assert(CFPlace.classify({status="dropped"})=="unknown-history",
    "no history recorded stays UNKNOWN, never 'never placed'")
assert(CFPlace.classify({status="dropped",droppedFrom="unrecorded"})=="unknown-history",
    "and an explicitly unrecorded history likewise")
assert(CFPlace.classify(nil)=="no-assignment")
-- A carrier clue with a running missing timer is its own case: out there, and
-- its container cannot be found.
assert(CFPlace.classify({status="placed",missingHours=10,
    target={carrierMark="m",x=0,y=0,z=0}})=="carrier-missing")
print("PASS placement fixture: a drop path is not proof of placement, and no history stays unknown")

-- ---------------------------------------------------------------------------
-- 3. AN UNLOADED TARGET YIELDS NO VERDICT ---------------------------------
-- ---------------------------------------------------------------------------
-- With no cell at all, nothing is loaded: the check must say so rather than
-- conclude the container does not hold the clue.
getCell=nil
assert(CFPlace.targetLoaded({x=1,y=2,z=0})==false,"no cell means not loaded")
assert(CFPlace.targetLoaded(nil)==false,"no target means not loaded")

-- A cell that knows one square: that square is loaded, its neighbour is not.
getCell=function() return {getGridSquare=function(_,x,y,z)
    if x==10 and y==20 and z==0 then return {} end
    return nil
end} end
assert(CFPlace.targetLoaded({x=10,y=20,z=0})==true,"the loaded square is loaded")
assert(CFPlace.targetLoaded({x=11,y=20,z=0})==false,"its neighbour is not")
assert(CFPlace.targetLoaded({x=10,y=20,z=1})==false,"nor the floor above")

-- And through verify(): a placed clue whose square is not loaded must come back
-- "unloaded", never "DISCREPANCY". This is fault 2 - the one that would have
-- dumped confidently about a clue nobody had gone to look at.
ModData={get=function() return store end}
local id=case.documents[1].id
local api=assert(S.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,1,staged)) end))
assert(api.status(id,"placed",0))
store.campaign=wrapper
local target=api.assignment(id).target
getCell=function() return {getGridSquare=function() return nil end} end
local verdict=CFPlace.verify(id)
assert(verdict:find("^unloaded"),"an unloaded target gives no verdict: got "..tostring(verdict))
assert(not verdict:find("DISCREPANCY",1,true),"and is never reported as the fault")

-- An id that no live case knows must say so rather than reading as clean.
assert(CFPlace.verify("no-such-clue"):find("^no%-assignment"),"an unknown id is named, not ignored")
assert(CFPlace.verify(nil)=="no-id","and a missing id is refused outright")

-- A clue that is not `placed` is skipped and labelled, never verified.
local other=case.documents[2] and case.documents[2].id
if other then
    local skipped=CFPlace.verify(other)
    assert(skipped:find("^skipped") or skipped:find("^unloaded"),
        "a clue that is not placed is skipped or unloaded, not a discrepancy: "..skipped)
end
print("PASS placement fixture: an unloaded target and an unknown id both give no verdict")
