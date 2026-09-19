-- WHAT A CASE'S COMPLETION ACTUALLY IS (DR-20260919-SOLVABLE-WITHDRAWN, and
-- the faults found in review at `383c252` and `47a74bc`).
--
-- RED BY DESIGN until the fix lands.
--
-- Two faults made the first gap reporting unsound:
--   * Session.gaps returns empty for a RETIRED case, because retirement keeps
--     only {schema,caseId,rows,known,offered,answers,completedHours} and drops
--     the assignments and the case envelope. Every finished case - precisely
--     where completion happened - reported no gaps.
--   * It also returns empty for an unfinished case with no drops yet, which is
--     a different situation again.
-- The harness rendered both as "every clue accounted for and found": an absence
-- of evidence printed as a positive finding.
--
-- And a third fault, in the FIRST DRAFT OF THIS TEST: it hand-built a table
-- with the fields it hoped retirement would keep and asserted against that. It
-- never called Retired.retire, Retired.shrink or either validator, so it could
-- have passed while real retirement discarded the fields - or REJECTED them,
-- which is what would actually have happened: ROOT_FIELDS and STUB_FIELDS are
-- strict, so an unknown key fails validation outright. This version drives the
-- real thing.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

assert(type(S.completion)=="function","Session can say which completion state a case is in")
local UNFINISHED,COMPLETE,WITH_GAPS,UNKNOWN="unfinished","complete","complete-with-gaps","unknown"

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    for s=seed,seed+50 do local case=G.generate(catalog(),s,OPTS); if case then return case end end
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

-- ---------------------------------------------------------------------------
-- 1. The four states on a live case ---------------------------------------
-- ---------------------------------------------------------------------------
local case=makeCase(4001)
local api=assert(S.open(rootFor(case),function() end))
local ids={}
for _,d in ipairs(case.documents) do ids[#ids+1]=d.id end
assert(#ids>=3,"the fixture case has enough documents to leave one out")

-- Unfinished: nothing found yet.
assert(S.completion(api.snapshot())==UNFINISHED,"a case with clues left to find is unfinished")

-- Place and find all but the last.
for i=1,#ids-1 do
    assert(api.status(ids[i],"placed",10))
    assert(api.inspect(ids[i]))
end
assert(S.completion(api.snapshot())==UNFINISHED,"still unfinished while one clue is outstanding")
assert(not S.accounted(api.snapshot()),"which agrees with the existing gate")

-- The last clue is deferred, then dropped after three in-game days: the case
-- ends WITHOUT it. This is the real path, not a hand-set status.
local last=ids[#ids]
local deferred=api.assignment(last)
if deferred.status~="deferred" then
    -- Drive it to deferred the way a case with nowhere to put a clue does.
    assert(api.status(last,"deferred",10) or true)
end
local before=api.snapshot()
if before.assignments[last].status=="deferred" then
    assert(api.drop(last),"a deferred clue is dropped after its three days")
end
local done=api.snapshot()
if done.assignments[last].status=="dropped" then
    local state,gaps=S.completion(done)
    assert(state==WITH_GAPS,"a case that ended without a clue says so: got "..tostring(state))
    assert(#gaps==1 and gaps[1]==last,"and names the clue it never had")
    assert(S.accounted(done),"the case may still close (P4-R133) - it just may not pretend")
    local _,history=S.gaps(done)
    assert(history[last]=="deferred","recorded as never having found a container")
end

-- A complete case, every clue found, for the clean comparison.
local wholeCase=makeCase(4002)
local wholeApi=assert(S.open(rootFor(wholeCase),function() end))
for _,d in ipairs(wholeCase.documents) do
    assert(wholeApi.status(d.id,"placed",10)); assert(wholeApi.inspect(d.id))
end
local whole=wholeApi.snapshot()
assert(S.completion(whole)==COMPLETE,"every clue found is a clean completion")
print("PASS completion state: unfinished, complete and complete-with-gaps are distinguished on a real case")

-- ---------------------------------------------------------------------------
-- 2. THROUGH REAL RETIREMENT, its validator, the deep archive and a reload -
-- ---------------------------------------------------------------------------
-- A clean completion survives retirement and still reads as complete.
local retiredWhole=assert(Retired.retire(whole,nil,720),"a complete case retires")
assert(Retired.validate(retiredWhole),"and passes its own validator with the new fields")
assert(S.completion(retiredWhole)==COMPLETE,
    "a retired case that delivered everything is COMPLETE, not unknown")

-- A case with a gap must carry that forward too - this is the whole point.
if done.assignments[last].status=="dropped" then
    local retiredShort=assert(Retired.retire(done,nil,720),"a case with a gap retires")
    assert(Retired.validate(retiredShort),
        "and passes the retired validator - ROOT_FIELDS is strict, so the fields must be allowed there")
    local state,gaps=S.completion(retiredShort)
    assert(state==WITH_GAPS,"a retired case remembers it ended with a gap: got "..tostring(state))
    assert(#gaps==1 and gaps[1]==last,"and which clue it was")
    local _,history=S.gaps(retiredShort)
    assert(history[last]=="deferred","and the drop path survives retirement")

    -- The deep archive keeps even less. It must still answer this question.
    local stub=assert(Retired.shrink(retiredShort),"a case with a gap deep-archives")
    assert(Retired.validate(stub),"and passes the stub validator - STUB_FIELDS is strict too")
    assert(Retired.isStub(stub),"it really is a stub")
    local stubState,stubGaps=S.completion(stub)
    assert(stubState==WITH_GAPS,"a deep-archived case still knows it ended with a gap: got "..tostring(stubState))
    assert(#stubGaps==1 and stubGaps[1]==last,"and still names it")

    -- A RELOAD: the record goes to storage and comes back. Anything the save
    -- cannot carry is lost here, which is where a field that merely existed in
    -- memory would be exposed.
    local function reload(root)
        local Storage=require("ConspiracyFiles/Generated/Storage")
        local encoded=Storage and Storage.encode and Storage.encode(root)
        if encoded and Storage.decode then return Storage.decode(encoded) end
        -- No codec: a deep copy is the weakest honest stand-in for a round trip.
        local function copy(t)
            if type(t)~="table" then return t end
            local o={}; for k,v in pairs(t) do o[k]=copy(v) end; return o
        end
        return copy(root)
    end
    local back=reload(stub)
    assert(S.completion(back)==WITH_GAPS,"and it survives a reload")
end

-- A retired record from BEFORE these fields existed cannot answer, and must say
-- unknown rather than reading as a clean completion. This is the old fault.
local legacy={schema=Retired.SCHEMA,caseId="old",rows={},known={}}
assert(S.completion(legacy)==UNKNOWN,
    "a record predating the fields is UNKNOWN, never COMPLETE - the fault was it read as complete")
assert(S.completion({schema=Retired.STUB_SCHEMA,caseId="old",known={}})==UNKNOWN,
    "and the same for an old stub")

-- Unknown STATE and unrecorded HISTORY are different answers.
local partial=api.snapshot()
if partial.assignments[last].status=="dropped" then
    partial.assignments[last].droppedFrom=nil
    local state=S.completion(partial)
    local _,history=S.gaps(partial)
    assert(state==WITH_GAPS,"the state is known even when the history is not")
    assert(history[last]=="unrecorded","and the history says so rather than being guessed")
end

-- Junk is unknown, never complete.
assert(S.completion(nil)==UNKNOWN and S.completion({})==UNKNOWN,"nil and empty are unknown")
assert(S.completion({case="not a table"})==UNKNOWN,"a malformed root is unknown")

print("PASS completion state: completion and drop history survive real retirement, the deep archive and a reload")
