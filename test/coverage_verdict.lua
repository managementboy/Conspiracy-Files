-- A CHECK THAT MEASURED NOTHING MUST NOT SAY PASS.
--
-- tools/autotest/checks/map_coverage.sh computed its verdict from its failure
-- list alone. On its first run every design refused to be travelled to, so the
-- failure list was empty, so it printed:
--
--   Linux map destination coverage, played: PASS
--   designs reached in this run: 0 (from 1 to 125)
--
-- Green by silence - which is the precise thing that check was written to make
-- impossible for the 125 destinations, reproduced inside the check itself.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local sh=read("tools/autotest/checks/map_coverage.sh")

assert(sh:find('[ "$reached" -eq 0 ] && verdict="COULD NOT RUN"',1,true),
    "reaching no designs at all must not be a PASS")
assert(sh:find('[ "$reached" -lt "$last" ] && verdict=PARTIAL',1,true),
    "reaching fewer designs than asked for must not be a PASS")
-- The order matters: FAIL must be able to override PARTIAL, and the zero case
-- must override the partial case.
local partial=sh:find('verdict=PARTIAL',1,true)
local none=sh:find('verdict="COULD NOT RUN"',1,true)
local fail=sh:find('|| verdict=FAIL',1,true)
assert(partial and none and fail and partial<none and none<fail,
    "the verdict must be computed partial, then none, then fail, so a real "
    .."failure is never masked by a partial run")
-- And neither may exit 0.
assert(sh:find("PASS) exit 0",1,true) and sh:find("exit 1 ;;",1,true)
   and sh:find("*) exit 2",1,true),
    "only PASS may exit 0; a failed or incomplete run must exit 1, and "
    .."PARTIAL or COULD NOT RUN must exit 2")
-- The report must keep saying how many were not exercised, and refuse the
-- claim outright.
assert(sh:find("may not be written until reached ==",1,true),
    "the report must state that the all-125 claim needs every design reached")

-- And the headline must carry the scope. "PASS" on a line by itself, beside a
-- body saying 12 of 125, is the quotation this check exists to prevent.
assert(sh:find('played: $verdict ($reached of $total reached',1,true),
    "the verdict line must state how many designs of the catalogue were reached")

-- THE PATIENCE IS SECONDS, AND MUST NOT SHRINK WHEN THE POLL RATE CHANGES.
--
-- Collapsing two 2 s loops into one 0.5 s loop looked like a granularity win.
-- It cut the wait from ~64 s a design to ~24 s, and the run came back with 62
-- INCONCLUSIVE of 112 where the slow version had 2 of 125: the optimisation
-- destroyed the measurement it was meant to speed up.
local budget=tonumber(sh:match('CF_SETTLE_SECONDS:%-(%d+)'))
assert(budget,"the settle budget must be stated in seconds")
assert(budget>=64,
    "the settle budget is "..budget.." s; the slow version that produced only "
    .."2 INCONCLUSIVE of 125 allowed 64 s per design, and going below that "
    .."trades correctness for speed")
assert(sh:find("polls=$(python3",1,true),
    "the poll COUNT must be derived from the seconds budget, so changing the "
    .."poll interval cannot silently change how long the check waits")
assert(sh:find('[ "$flat" -ge "$polls" ]',1,true),
    "the no-progress bound must be the derived count, not a literal")

-- REACHING A DESIGN IS NOT PASSING IT. The headline counted designs REACHED
-- and printed "PASS (125 of 125 designs)" while two had no payoff at all -
-- which reads as "all 125 destinations pass", the precise claim this check
-- exists to prevent, printed by the check itself for the second time.
assert(sh:find('[ "$placed_ok" -lt "$reached" ]',1,true),
    "a design reached without a payoff must stop the verdict being PASS")
assert(sh:find("verdict=INCOMPLETE",1,true),
    "reached-but-short must have its own verdict, distinct from PASS")
assert(sh:find("FAIL|INCOMPLETE) exit 1",1,true),
    "INCOMPLETE must not exit 0")
assert(sh:find("payoff $placed_ok, non-floor $nonfloor_ok, access $access_ok",1,true),
    "the headline must carry every column, so PASS cannot be quoted without "
    .."the numbers that qualify it")

print("PASS coverage_verdict: a run that reaches nothing reports COULD NOT RUN, "
    .."a partial run reports PARTIAL, and neither exits 0")
