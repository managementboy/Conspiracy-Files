-- WHAT A CASE'S COMPLETION ACTUALLY IS (DR-20260919-SOLVABLE-WITHDRAWN, and
-- the faults found in review at `383c252`).
--
-- RED BY DESIGN until the fix lands.
--
-- Two separate faults made the first attempt at gap reporting unsound:
--
--   * Session.gaps returns empty for a RETIRED case, because retirement keeps
--     only {schema, caseId, rows, known, offered, answers, completedHours} and
--     drops assignments and the case envelope entirely. Every finished case -
--     which is precisely where completion happened - therefore reported no
--     gaps.
--   * It also returns empty for an unfinished case that simply has no drops
--     yet, which is a different situation again.
--
-- The harness then rendered both as "none (every clue of every case accounted
-- for and found)". That is an absence of evidence printed as a positive
-- finding, which is the one thing this project keeps deciding it will not do.
--
-- So completion is not a boolean and not a count. It is FOUR states, and
-- "unknown" is a real answer that must be said out loud rather than rounded
-- down to "fine".
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")

assert(type(S.completion)=="function","Session can say which completion state a case is in")

local UNFINISHED,COMPLETE,WITH_GAPS,UNKNOWN="unfinished","complete","complete-with-gaps","unknown"

local function live(statuses,known,recognised)
    local docs,assign={},{}
    for _,id in ipairs({"d1","d2","d3"}) do
        docs[#docs+1]={id=id}
        assign[id]={status=statuses[id]}
    end
    return {case={caseId="c1",documents=docs},assignments=assign,
            known=known or {},recognised=recognised}
end

-- ---------------------------------------------------------------------------
-- 1. Unfinished: a clue is still waiting for somewhere to go ---------------
-- ---------------------------------------------------------------------------
local waiting=live({d1="placed",d2="placed",d3="deferred"},{"d1","d2"})
local state,gaps=S.completion(waiting)
assert(state==UNFINISHED,"a clue still waiting means the case is not finished: got "..tostring(state))
assert(#gaps==0,"and a waiting clue is not a gap - it may still arrive")
assert(not S.accounted(waiting),"which agrees with the existing gate")

-- A clue merely unfound, with everything placed, is also unfinished.
local unfound=live({d1="placed",d2="placed",d3="placed"},{"d1"})
assert(S.completion(unfound)==UNFINISHED,"clues left to find is the ordinary unfinished state")

-- ---------------------------------------------------------------------------
-- 2. Complete, no gaps: every clue was placed and found -------------------
-- ---------------------------------------------------------------------------
local whole=live({d1="placed",d2="placed",d3="placed"},{"d1","d2","d3"})
state,gaps=S.completion(whole)
assert(state==COMPLETE,"everything found is a clean completion: got "..tostring(state))
assert(#gaps==0,"with nothing missing")

-- ---------------------------------------------------------------------------
-- 3. Complete WITH gaps: the case ended without a clue it never had -------
-- ---------------------------------------------------------------------------
local short=live({d1="placed",d2="placed",d3="dropped"},{"d1","d2"})
short.assignments.d3.droppedFrom="deferred"
state,gaps=S.completion(short)
assert(state==WITH_GAPS,"a dropped clue makes this a completion with a gap: got "..tostring(state))
assert(#gaps==1 and gaps[1]=="d3","and names it")
assert(S.accounted(short),"the case may still close (P4-R133) - it just may not pretend")

-- ---------------------------------------------------------------------------
-- 4. UNKNOWN: a record that cannot answer the question --------------------
-- ---------------------------------------------------------------------------
-- A retired case. This is the shape retirement actually leaves: no assignments,
-- no case envelope. It must NOT read as a clean completion.
local retired={schema=2,caseId="c1",rows={{id="d1"}},known={"d1"}}
state,gaps=S.completion(retired)
assert(state==UNKNOWN,"a retired case cannot be asked and must say so: got "..tostring(state))
assert(#gaps==0,"with no gaps claimed either way")
assert(state~=COMPLETE,"the whole fault was this reading as a clean completion")

-- A deep-archived stub, which keeps even less.
assert(S.completion({schema=3,caseId="c1",known={}})==UNKNOWN,"a stub cannot be asked either")

-- A dropped clue in a save written before droppedFrom existed is still a gap -
-- the state is known even though the HISTORY is not. The two must not be
-- confused: "unknown state" and "unrecorded history" are different answers.
local older=live({d1="placed",d2="placed",d3="dropped"},{"d1","d2"})
state,gaps=S.completion(older)
assert(state==WITH_GAPS,"an older save still knows the case ended with a gap")
local _,history=S.gaps(older)
assert(history.d3=="unrecorded","only the history is unrecorded, and it says so")

-- Nothing odd on the edges: junk is unknown, never complete.
assert(S.completion(nil)==UNKNOWN,"nil is unknown")
assert(S.completion({})==UNKNOWN,"an empty table is unknown")
assert(S.completion({case="not a table"})==UNKNOWN,"a malformed root is unknown")

print("PASS completion state: unfinished, complete, complete-with-gaps and unknown are four different answers")

-- ---------------------------------------------------------------------------
-- 5. Gap history must survive retirement ----------------------------------
-- ---------------------------------------------------------------------------
-- The reason a retired case reads "unknown" today is that retirement throws the
-- answer away. A finished case knew whether it delivered its clues, and that is
-- exactly the kind of sourced fact retirement is supposed to keep
-- (DR-20260919-Q18). One short field, not the assignments.
assert(type(S.retiredGapFields)=="function",
    "Session names what a retiring case must carry forward about its gaps")
local carry=S.retiredGapFields(short)
assert(type(carry)=="table","the fields are a table")
assert(carry.completion==WITH_GAPS,"a retiring case records the state it finished in")
assert(type(carry.gaps)=="table" and #carry.gaps==1 and carry.gaps[1]=="d3",
    "and which clues it never had")
local clean=S.retiredGapFields(whole)
assert(clean.completion==COMPLETE and #clean.gaps==0,"a clean completion records that it was clean")
-- Carried forward, the retired record can answer the question after all.
local kept={schema=2,caseId="c1",rows={},known={"d1"},
            completion=carry.completion,gaps=carry.gaps}
assert(S.completion(kept)==WITH_GAPS,
    "a retired case that carried its state forward is no longer unknown")
print("PASS completion state: a retiring case carries its completion forward, so history is not destroyed")
