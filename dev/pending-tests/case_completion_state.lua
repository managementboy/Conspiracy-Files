-- WHAT A CASE'S COMPLETION ACTUALLY IS (DR-20260919-SOLVABLE-WITHDRAWN, and
-- the faults found in review at `383c252`, `47a74bc` and `d7f06ec`).
--
-- RED BY DESIGN until the fix lands.
--
-- The original faults. Session.gaps returned empty for a RETIRED case, because
-- retirement keeps only {schema,caseId,rows,known,offered,answers,
-- completedHours} and drops the assignments and the case envelope - so every
-- finished case, precisely where completion happened, reported no gaps. It also
-- returned empty for an unfinished case with no drops. The harness rendered
-- both as "every clue accounted for and found": absence of evidence printed as
-- a positive finding.
--
-- THREE FAULTS IN EARLIER DRAFTS OF THIS TEST, each worse than the last:
--   * it hand-built the table it hoped retirement would keep, calling neither
--     retire, shrink nor any validator - and ROOT_FIELDS/STUB_FIELDS are
--     STRICT, so the fields would have been rejected outright;
--   * it then drove a clue to "deferred" with `assert(api.status(...) or true)`,
--     which passes whatever happens. api.status cannot build a valid deferred
--     assignment (a deferred clue has no target and carries deferredHours), so
--     the call failed, the clue never became dropped, every gap check inside
--     the `if ... == "dropped"` blocks was SKIPPED, and the test printed PASS
--     having proven nothing;
--   * and its "reload" called Storage.encode/decode, which do not exist -
--     Storage only scans world containers - so it silently took its own
--     deep-copy fallback and called a copy a persistence test.
--
-- This version starves the containers to get a genuinely deferred clue, asserts
-- that state before using it, runs every check UNCONDITIONALLY, and goes
-- through the real save wrapper.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")

assert(type(S.completion)=="function","Session can say which completion state a case is in")
local UNFINISHED,COMPLETE,WITH_GAPS,UNKNOWN="unfinished","complete","complete-with-gaps","unknown"

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local case=G.generate(catalog(),s,OPTS); if case then return case end end
    error("no generated case near seed "..seed)
end
local function fixedAt(site,index)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=index or 0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end

-- ---------------------------------------------------------------------------
-- 1. A GENUINELY DEFERRED CLUE, by starving the containers -----------------
-- ---------------------------------------------------------------------------
-- One container per site, so every clue after the first at each site waits
-- (P4-R133). This is the same fixture idiom test/clues_on_the_move.lua uses.
local case=makeCase(4001)
local candidates={}
for _,site in ipairs(case.locations) do candidates[site.id]={fixedAt(site,0)} end
local root,waiting=S.createDistributed(case,candidates,nil,nil,100)
assert(root,"the distributed fixture built a root")
assert(type(waiting)=="table" and #waiting>0,
    "the fixture must really leave a clue waiting - without this the whole test is vacuous")
local api=assert(S.open(root,function() end))

local gapId=waiting[1]
local deferred=api.assignment(gapId)
assert(deferred.status=="deferred","the waiting clue really is deferred: got "..tostring(deferred.status))
assert(deferred.target==nil,"a deferred clue has no target")
assert(type(deferred.deferredHours)=="number","and carries the hour its wait began")

-- Find and record every clue that DID get a container.
local found={}
for _,d in ipairs(case.documents) do
    local a=api.assignment(d.id)
    if a.status~="deferred" then
        assert(api.status(d.id,"placed",100))
        assert(api.inspect(d.id))
        found[#found+1]=d.id
    end
end
assert(#found>0,"some clues were placed")
assert(S.completion(api.snapshot())==UNFINISHED,"a clue still waiting means unfinished")
assert(not S.accounted(api.snapshot()),"which agrees with the existing gate")

-- Three in-game days with nowhere to go and it is dropped. Unconditional.
assert(api.drop(gapId),"a deferred clue is dropped after its three days")
local done=api.snapshot()
assert(done.assignments[gapId].status=="dropped","it really is dropped now")
assert(done.assignments[gapId].droppedFrom=="deferred","recorded as never having found a container")

local state,gaps=S.completion(done)
assert(state==WITH_GAPS,"a case that ended without a clue says so: got "..tostring(state))
assert(#gaps==1 and gaps[1]==gapId,"and names the clue it never had")
assert(S.accounted(done),"the case may still close (P4-R133) - it just may not pretend")
print("PASS completion state: a genuinely deferred clue, dropped, makes a complete-with-gaps case")

-- A clean completion for comparison: every site gets enough containers.
local wholeCase=makeCase(4002)
local rich={}
for _,site in ipairs(wholeCase.locations) do
    rich[site.id]={}
    for i=0,#wholeCase.documents do rich[site.id][i+1]=fixedAt(site,i) end
end
local wholeRoot,wholeWaiting=S.createDistributed(wholeCase,rich,nil,nil,100)
assert(wholeRoot and #(wholeWaiting or {})==0,"the rich fixture leaves nothing waiting")
local wholeApi=assert(S.open(wholeRoot,function() end))
for _,d in ipairs(wholeCase.documents) do
    assert(wholeApi.status(d.id,"placed",100)); assert(wholeApi.inspect(d.id))
end
local whole=wholeApi.snapshot()
assert(S.completion(whole)==COMPLETE,"every clue found is a clean completion")

-- ---------------------------------------------------------------------------
-- 2. REAL RETIREMENT, its validator, the deep archive ----------------------
-- ---------------------------------------------------------------------------
local retiredWhole=assert(Retired.retire(whole,nil,720),"a complete case retires")
assert(Retired.validate(retiredWhole),"and passes its own validator with the new fields")
assert(S.completion(retiredWhole)==COMPLETE,"a case that delivered everything is COMPLETE, not unknown")

local retiredShort=assert(Retired.retire(done,nil,720),"a case with a gap retires")
assert(Retired.validate(retiredShort),
    "and passes the retired validator - ROOT_FIELDS is strict, so the fields must be allowed there")
state,gaps=S.completion(retiredShort)
assert(state==WITH_GAPS,"a retired case remembers it ended with a gap: got "..tostring(state))
assert(#gaps==1 and gaps[1]==gapId,"and which clue it was")
local _,history=S.gaps(retiredShort)
assert(history[gapId]=="deferred","and the drop path survives retirement")

local stub=assert(Retired.shrink(retiredShort),"a case with a gap deep-archives")
assert(Retired.validate(stub),"and passes the stub validator - STUB_FIELDS is strict too")
assert(Retired.isStub(stub),"it really is a stub")
state,gaps=S.completion(stub)
assert(state==WITH_GAPS,"a deep-archived case still knows it ended with a gap: got "..tostring(state))
assert(#gaps==1 and gaps[1]==gapId,"and still names it")
local _,stubHistory=S.gaps(stub)
assert(stubHistory[gapId]=="deferred","and the drop path survives the deep archive too")
print("PASS completion state: completion and drop history survive real retirement and the deep archive")

-- ---------------------------------------------------------------------------
-- 3. THROUGH THE REAL SAVE WRAPPER -----------------------------------------
-- ---------------------------------------------------------------------------
-- There is NO serialisation round trip to test: the save holds plain tables in
-- ModData, and Storage has no encode/decode (it scans world containers). So the
-- real persistence path is the case wrapper - its validator and its accessors -
-- and that is what this exercises. Stated plainly rather than dressed up as a
-- round trip, which is what the earlier draft's deep copy silently was.
local wrapper={canonical=whole,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"the wrapper with a live case validates")
wrapper=assert(Cases.stage(wrapper,done,2),"a case with a gap can be staged into the wrapper")
assert(Cases.validate(wrapper),"and the wrapper still validates with it")

-- Retire it through the wrapper, the way the runtime does, then read it back
-- out through the wrapper's own accessor - not from the variable we kept.
local index
for i,r in ipairs(Cases.sessions(wrapper)) do
    if not Retired.isRetired(r) and r.case and r.case.caseId==done.case.caseId then index=i end
end
assert(index,"the staged case is in the wrapper")
wrapper=assert(Cases.retire(wrapper,index,nil,720),"it retires inside the wrapper")
assert(Cases.validate(wrapper),"and the wrapper validates after retirement")

local restored
for _,r in ipairs(Cases.sessions(wrapper)) do
    if Retired.isRetired(r) and r.caseId==done.case.caseId then restored=r end
end
assert(restored,"the retired case is readable back out of the wrapper")
state,gaps=S.completion(restored)
assert(state==WITH_GAPS,"restored from the wrapper, it still knows it ended with a gap")
assert(#gaps==1 and gaps[1]==gapId,"the gap ID survives the wrapper")
local _,restoredHistory=S.gaps(restored)
assert(restoredHistory[gapId]=="deferred","and so does the drop-path history")
print("PASS completion state: gap IDs and drop history survive the real save wrapper and its validator")

-- ---------------------------------------------------------------------------
-- 4. What cannot be answered must say so -----------------------------------
-- ---------------------------------------------------------------------------
local legacy={schema=Retired.SCHEMA,caseId="old",rows={},known={}}
assert(S.completion(legacy)==UNKNOWN,
    "a record predating the fields is UNKNOWN, never COMPLETE - the fault was it read as complete")
assert(S.completion({schema=Retired.STUB_SCHEMA,caseId="old",known={}})==UNKNOWN,
    "and the same for an old stub")

-- Unknown STATE and unrecorded HISTORY are different answers.
local partial=api.snapshot()
partial.assignments[gapId].droppedFrom=nil
assert(S.completion(partial)==WITH_GAPS,"the state is known even when the history is not")
local _,partialHistory=S.gaps(partial)
assert(partialHistory[gapId]=="unrecorded","and the history says so rather than being guessed")

assert(S.completion(nil)==UNKNOWN and S.completion({})==UNKNOWN,"nil and empty are unknown")
assert(S.completion({case="not a table"})==UNKNOWN,"a malformed root is unknown")
print("PASS completion state: unknown is an answer, and differs from an unrecorded history")
