-- A CASE THAT BECOMES ACCOUNTED FOR BY A DROP MUST STILL RETIRE.
--
-- RED BY DESIGN until the fix lands. Found in review of the baseline run at
-- `6d66f3f`; the mechanism is confirmed in the source, the run is only
-- consistent with it.
--
-- THE GAP. Session.accounted is consulted in exactly ONE place in
-- GeneratedRuntime: line 1045, inside the path that runs when a clue is
-- inspected. Both drop paths - line 1596, a deferred clue that has waited three
-- in-game days, and line 1681, a clue whose carrier is gone - drop the clue and
-- never ask whether the case has just become accounted for.
--
-- So this sequence leaves a case stuck:
--   1. the player finds and inspects every clue that HAS a container;
--   2. the last outstanding clue is still deferred, so the case is not
--      accounted for and does not retire - correct so far (P4-R133);
--   3. three in-game days later that clue expires and is dropped by the
--      watcher;
--   4. the case is NOW accounted for - but nothing will ever check again,
--      because checking only happens on inspection and there is nothing left
--      to inspect.
-- The case keeps its active slot for the rest of the save. With MAX_ACTIVE
-- slots held this way, every later case is refused with `active-limit`, and the
-- ladder has no rung that can free a slot a finished case is still holding.
--
-- What the baseline run showed: `active=4/4 cases=6/16 rung=3/3` with 31
-- refusals across three fresh neighbourhoods. That is CONSISTENT with this and
-- does not prove it - `wait_finished` logs a failure and continues, so the
-- later "after a case was finished" wording is not evidence a case retired.
-- The saved case state has to confirm it, which is what the harness capture
-- below is for.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

-- Dependencies asserted up front, so this file fails with a sentence rather
-- than crashing mid-way on a nil call.
assert(type(S.completion)=="function","Session can say which completion state a case is in")
assert(type(S.gaps)=="function","and which clues a case ended without")

-- ---------------------------------------------------------------------------
-- 1. The pure fact: a drop is what makes this case accounted for -----------
-- ---------------------------------------------------------------------------
-- No runtime needed to show the window exists. Before the drop the case is not
-- accounted for; after it, it is - and the transition happened inside a path
-- that never looks.
local function caseRoot()
    return {case={caseId="c1",documents={{id="d1"},{id="d2"}}},
            assignments={d1={status="placed"},d2={status="deferred"}},
            known={"d1"}}
end
local before=caseRoot()
assert(not S.accounted(before),"with a clue still deferred the case is not accounted for")
local after=caseRoot()
after.assignments.d2.status="dropped"
after.assignments.d2.droppedFrom="deferred"
assert(S.accounted(after),"the DROP is what made it accounted for - no inspection involved")
assert(S.completion(after)=="complete-with-gaps","and it is a completion with a gap")
print("PASS retire after final drop: a drop can be the event that completes a case")

-- ---------------------------------------------------------------------------
-- 2. The runtime must act on it -------------------------------------------
-- ---------------------------------------------------------------------------
-- The fix has to re-check after a drop, from both drop paths. Whatever shape it
-- takes, it must be reachable, because the bug is that nothing is called.
local R=(function()
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    package.preload["ConspiracyFiles/ClueCue"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    Events={OnTick={Add=function() end},OnGameStart={Add=function() end}}
    getGameTime=function() return {getWorldAgeHours=function() return 0 end} end
    getPlayer=function() return nil end
    getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    getTimeInMillis=function() return 0 end
    getCell=function() return {getGridSquare=function() return nil end} end
    instanceof=function() return false end
    ModData={getOrCreate=function() return {} end,get=function() return nil end}
    return require("ConspiracyFiles/GeneratedRuntime")
end)()

assert(type(R.retireIfAccounted)=="function",
    "the runtime can retire a case that has just become accounted for, from any path")

-- Called on a case that is NOT accounted for: it must do nothing and say so.
local notYet=caseRoot()
assert(R.retireIfAccounted(notYet)==false,
    "a case with a clue still deferred is not retired")

-- Called after the drop: it must retire. This is the assertion the bug fails,
-- because today nothing calls anything here at all.
local ready=caseRoot()
ready.assignments.d2.status="dropped"; ready.assignments.d2.droppedFrom="deferred"
assert(R.retireIfAccounted(ready)~=false,
    "a case made accounted for by a drop is retired, so its active slot is freed")

print("PASS retire after final drop: the runtime retires from the drop path, not only on inspection")

-- ---------------------------------------------------------------------------
-- 3. And the retired case still reports its gap ---------------------------
-- ---------------------------------------------------------------------------
-- Retiring from the drop path must not lose what the other path keeps.
local done={case={caseId="c1",documents={{id="d1"},{id="d2"}}},
            assignments={d1={status="placed"},d2={status="dropped",droppedFrom="deferred"}},
            known={"d1"}}
-- A minimal valid root is not what Retired.retire wants, so this asserts the
-- contract rather than driving the generator: whatever retires it, the state
-- and the gap must survive, exactly as dev/pending-tests/case_completion_state
-- proves for the inspection path.
local state,gaps=S.completion(done)
assert(state=="complete-with-gaps" and #gaps==1 and gaps[1]=="d2",
    "the case knows what it ended without, before retirement")
assert(type(S.retiredGapFields)=="function","and can hand that to a retiring case")
local carry=S.retiredGapFields(done)
assert(carry.completion=="complete-with-gaps" and carry.gaps[1]=="d2",
    "so a case retired from the DROP path carries its gap forward too")
print("PASS retire after final drop: a case retired from the drop path keeps its gap")
