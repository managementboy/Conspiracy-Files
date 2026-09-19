-- THE CARRIER TIMER (P4-R134, and the fault found in review at `383c252`).
--
-- RED BY DESIGN until the fix lands. This test is written first so the fix is
-- reviewable the moment the baseline run finishes.
--
-- The fault: GeneratedRuntime's carrier watcher decided the timer with
--
--     api.missing(d.id, found and nil or hours)
--
-- and in Lua `true and nil` is nil, so `nil or hours` is hours; `false and nil`
-- is false, so `false or hours` is hours. BOTH branches pass hours. The
-- clear-the-timer branch is unreachable, and because api.missing only records
-- the FIRST missing hour, a carrier standing in front of the survivor is marked
-- missing once, never cleared, and its clue is dropped three in-game days later
-- through dropMissing.
--
-- Why no existing test caught it: every one of the four behaviours below is
-- already proven against Session's own api.missing in
-- test/clues_on_the_move.lua, and all four pass. The API was never wrong. The
-- bug is a single expression in client code that plain Lua cannot load - so the
-- decision has to move into the pure layer to be testable at all. That is what
-- S.missingMark is for, and this test is the reason it exists.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/Generated/Session")

-- ---------------------------------------------------------------------------
-- 1. The decision itself, as a pure function ------------------------------
-- ---------------------------------------------------------------------------
assert(type(S.missingMark)=="function",
    "Session decides the carrier mark, so the decision can be tested at all")

-- Found means present means NO mark: this is the branch the broken idiom could
-- never reach.
assert(S.missingMark(true,10)==nil,"a carrier that is there clears the timer")
assert(S.missingMark(true,0)==nil,"even at hour zero")
-- Not found means mark it with the hour we looked.
assert(S.missingMark(false,10)==10,"a carrier that is gone starts the timer")
assert(S.missingMark(false,0)==0,"hour zero is a real hour, not absent")

-- The exact shape of the bug, stated so it can never come back: whatever the
-- inputs, a found carrier and a missing one must not produce the same answer.
for _,hour in ipairs({0,1,10,72,1000}) do
    assert(S.missingMark(true,hour)~=S.missingMark(false,hour),
        "found and not-found must differ at hour "..hour.." - the fault was that they did not")
end

-- ---------------------------------------------------------------------------
-- 2. The four behaviours, driven through the mark ---------------------------
-- ---------------------------------------------------------------------------
-- A minimal mobile assignment. The full world fixture lives in
-- test/clues_on_the_move.lua; here only the timer is under test.
local function root()
    return {case={caseId="c1",documents={{id="d1"}}},
            assignments={d1={status="placed",missingHours=nil}},known={}}
end
-- The watcher, written the way the runtime must write it: the mark decides.
local function watch(r,found,hours)
    local a=r.assignments.d1
    local mark=S.missingMark(found,hours)
    if mark==nil then a.missingHours=nil
    elseif a.missingHours==nil then a.missingHours=mark end
    return a.missingHours
end

-- (a) Disappearance starts the timer.
local r=root()
assert(watch(r,false,100)==100,"gone at hour 100 starts the timer there")
assert(watch(r,false,140)==100,"and only the first hour counts: the wait is from when it went")

-- (b) Return clears it.
assert(watch(r,true,150)==nil,"the carrier turns up again and the timer is gone")
assert(#S.missingIds({case=r.case,assignments=r.assignments,known={}},10000)==0,
    "a carrier that came back never expires, however long we wait")

-- (c) A second disappearance starts a FRESH timer.
assert(watch(r,false,200)==200,"gone again starts again, from the new hour")
assert(r.assignments.d1.missingHours==200,"not the old hour: the first wait was cancelled by its return")

-- (d) Expiry behaves correctly, on the same three in-game days as a clue with
--     nowhere to go.
local snap={case=r.case,assignments=r.assignments,known={}}
assert(#S.missingIds(snap,200+S.DEFER_EXPIRE_HOURS-0.1)==0,"not expired a moment early")
local expired=S.missingIds(snap,200+S.DEFER_EXPIRE_HOURS)
assert(#expired==1 and expired[1]=="d1","expired exactly on the three days")
-- And the clock runs from the SECOND disappearance, not the first. Had the
-- return failed to clear - the fault - this would have expired at 100+72.
assert(#S.missingIds(snap,100+S.DEFER_EXPIRE_HOURS)==0,
    "the fault would have expired this clue at the FIRST hour plus three days")

-- A clue already found is never expiring, whatever the world did to its carrier.
local held={case=r.case,assignments=r.assignments,known={"d1"}}
assert(#S.missingIds(held,200+S.DEFER_EXPIRE_HOURS)==0,"a clue in hand is not missing")

print("PASS carrier timer: present clears, gone starts, gone again restarts, expiry runs from the last disappearance")

-- ---------------------------------------------------------------------------
-- 3. The runtime must USE it, not re-inline the decision -------------------
-- ---------------------------------------------------------------------------
-- The bug was an expression, so the guard is about the expression. A source
-- check is weak evidence in general; here it is the only evidence available,
-- because the file cannot be loaded outside the game.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua"))
local src=f:read("*a"); f:close()
assert(not src:find("found and nil or hours",1,true),
    "the unreachable-branch idiom is gone from the carrier watcher")
assert(not src:find("and nil or hours",1,true),"and no variant of it remains")
assert(src:find("missingMark",1,true),
    "the watcher asks Session for the mark rather than deciding inline")
print("PASS carrier timer: the runtime asks for the mark instead of re-deriving it")
