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
assert(sh:find("PASS) exit 0",1,true) and sh:find("FAIL) exit 1",1,true)
   and sh:find("*) exit 2",1,true),
    "only PASS may exit 0; PARTIAL and COULD NOT RUN must exit 2")
-- The report must keep saying how many were not exercised, and refuse the
-- claim outright.
assert(sh:find("may not be written until reached ==",1,true),
    "the report must state that the all-125 claim needs every design reached")

-- And the headline must carry the scope. "PASS" on a line by itself, beside a
-- body saying 12 of 125, is the quotation this check exists to prevent.
assert(sh:find('played: $verdict ($reached of $total designs)',1,true),
    "the verdict line must state how many designs of the catalogue were reached")

print("PASS coverage_verdict: a run that reaches nothing reports COULD NOT RUN, "
    .."a partial run reports PARTIAL, and neither exits 0")
