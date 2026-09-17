-- THE LADDER (P4-R133, docs/design/CASE_PACING.md).
--
-- After three refusals of the SAME code the generator lowers its own standard,
-- in a fixed order, one rung at a time:
--   1. a smaller case (fewer clues, down to the generator's minimum);
--   2. one step wider reach;
--   3. release the oldest finished case's sites back into the pool;
--   4. accept a single-site case - NOT BUILT, see the design doc: a case is
--      re-derived from its seed and the schema requires two locations, so a
--      one-location case is a generator revision, which is a fresh game.
--      MAX_RUNG is therefore 3, and this test holds that honest.
--
-- Reachability itself is never traded: an unreachable clue is not a clue. And
-- the player is told nothing at any rung - no voice line, no marker, no hint.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Reach=require("ConspiracyFiles/Reach")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")

-- 1. The thresholds ---------------------------------------------------------
assert(Cases.REFUSALS_PER_RUNG==3,"three refusals of one code buy one rung")
assert(Cases.MAX_RUNG==3,"three rungs are built; the fourth is a generator revision")
local rung=assert(runtime:match("local function rungNow%(%)(.-)\nend\n"),"the rung must be computed somewhere")
assert(rung:find("math.floor(r.count/REFUSALS_PER_RUNG)",1,true),"a rung per three refusals of one code")
assert(rung:find("math.min(R.RUNG_MAX,",1,true),"and never past the last rung built")
assert(rung:find("math.max(rung,",1,true),
    "the rung is the highest any code has earned, so a different refusal in between never lowers it")

-- 2. Rung 1: a smaller case, still a case ------------------------------------
-- The generator's minimum is a claim and a record that contradicts it. Prove
-- that the smallest case it will build still validates and still carries the
-- contradiction, because that is what a lowered standard must not cost.
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local smallest,smallestSeed
for seed=1,400 do
    local case=G.generate(catalog,seed,opts)
    if case and (not smallest or #case.documents<#smallest.documents) then smallest,smallestSeed=case,seed end
end
assert(smallest,"the fixture must generate cases")
assert(#smallest.documents<=G.MIN_EVIDENCE+1,
    "the generator's smallest case must be near its own minimum, got "..#smallest.documents)
assert(G.validate(smallest),"the smallest case must still validate")
local contradiction=false
for _,doc in ipairs(smallest.documents) do
    for _,link in ipairs(doc.links or {}) do
        if link.kind=="disputes-delivery" or link.kind=="recontextualises" then contradiction=true end
    end
end
-- A corroborating outline has no dispute; then the case must at least be the
-- claim and an independent record of the same events, which is what
-- MIN_EVIDENCE means. Either way it is never one lone clue.
assert(contradiction or smallest.outline=="corroboration",
    "a smaller case must still be a case: a claim and a record answering it")
assert(#smallest.documents>=G.MIN_EVIDENCE,"never fewer clues than the generator's own minimum")
-- And the rung is wired to look for one, deterministically and boundedly.
local prepare=assert(runtime:match("local function prepare%(result,seed,later,house%)(.-)\nfunction R%.start"))
assert(prepare:find("if rung>=1 then",1,true),"rung 1 must be taken in prepare")
assert(prepare:find("#try.documents<#best.documents",1,true),"rung 1 keeps the smallest case it found")
assert(prepare:find("#best.documents<=G.MIN_EVIDENCE",1,true),"and stops at the generator's minimum")
assert(prepare:find("(seed*31+step*1013904223)%2147483646+1",1,true),
    "the seeds it tries are derived from the one asked for, so the case is still deterministic")
assert(runtime:find("R.RUNG1_TRIES=3",1,true),"bounded: each try is a full generate-and-validate")

-- 3. Rung 2: one step wider reach, never looser reachability -----------------
assert(Reach.wider(250)==500 and Reach.wider(500)==1000 and Reach.wider(1000)==1500,
    "one step wider is the next rung of the survival reach itself")
assert(Reach.wider(1500)==1500,"at the top there is nothing wider")
assert(not Reach.wider("far"),"and a radius must be a number")
-- The generator accepts a widened reach, only ever wider, and never past the
-- scan's own limit.
local context={hoursSurvived=0,anchor={x=250,y=4}}
local base=Reach.radius(0)
local widened=assert(G.generateNew(catalog,17,opts,{hoursSurvived=0,anchor=context.anchor,radius=Reach.wider(base)}),
    "a widened reach must still generate a case")
assert(G.validate(widened))
assert(not G.generateNew(catalog,17,opts,{hoursSurvived=0,anchor=context.anchor,radius=base-1}),
    "a caller may lower the generator's standard, never its reach")
assert(not G.generateNew(catalog,17,opts,{hoursSurvived=0,anchor=context.anchor,radius=9000}),
    "and never past the scan's own limit")
assert(prepare:find("context.radius=base and Reach.wider(base) or nil",1,true),
    "rung 2 widens the generator's own filter")
local nextCase=assert(runtime:match("function R%.nextCase%(seed%)(.-)\nend\n"))
assert(nextCase:find('radius,radiusSource=wider,"P4-R133-rung2"',1,true),
    "and the scan, under its own label")
local probe=read("mod/common/media/lua/client/ConspiracyFiles/T3Nearby.lua")
assert(probe:find("function T.start(radius,seed,requiredId,radiusSource)",1,true),
    "T3Nearby.start must take a radius source")
assert(probe:find('or (automatic and "P4-R55" or "explicit-debug-override")',1,true),
    "the debug override's label is still there for a console command, and is not reused")
-- Reachability is not part of the trade.
for _,line in ipairs({"reachable","basementSites","Reachability.predicate"}) do
    assert(runtime:find(line,1,true),"the reachability gate must still be in place: "..line)
end
assert(not prepare:find("rung>=1 and reachable",1,true) and not prepare:find("reachable=function",1,true),
    "no rung may loosen reachability")

-- 4. Rung 3: the oldest finished case's sites come back ----------------------
assert(prepare:find("if rung>=3 then",1,true),"rung 3 must be taken in prepare")
assert(prepare:find("Retired.isRetired(root) and root.rows then released=index",1,true),
    "the OLDEST finished case that still excludes its sites is the one released")
assert(prepare:find("if index~=released then",1,true),"and only that one")

-- 5. In order, and nothing is said to the player ----------------------------
local one=assert(prepare:find("if rung>=1 then",1,true))
local two=assert(prepare:find("if rung>=2 then",1,true))
local three=assert(prepare:find("if rung>=3 then",1,true))
assert(three<two and two<one,
    "the rungs are cumulative, and each is taken where it belongs: the used set, then the reach, then the case")
for _,forbidden in ipairs({"PlayerVoice","setHaloNote","ClueHints","onNamedPlace","addHint"}) do
    local at=prepare:find("local rung=later and rungNow()",1,true)
    local tail=prepare:sub(at)
    assert(not tail:find(forbidden,1,true),"the ladder must say nothing to the player: "..forbidden)
end

print(string.format(
    "PASS the ladder: %d refusals a rung, %d rungs built, smallest case %d clues (seed %d) still validates and still answers itself, reach %d -> %d",
    Cases.REFUSALS_PER_RUNG,Cases.MAX_RUNG,#smallest.documents,smallestSeed,base,Reach.wider(base)))
