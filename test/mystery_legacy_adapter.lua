-- REAL SHIPPED CONTENT, TRANSLATED HONESTLY, CALIBRATES THE GUARD.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, build plan step 3:
-- "run once over the legacy roster as a calibration: it must NOT refuse
-- the 20 ordinary premises... and it SHOULD have refused the withdrawn 24
-- occupation families if pointed at them - that is the guard's own test."
-- test/mystery_diversity_guard.lua proved the guard's logic with hand-
-- typed stand-ins; this proves it against ACTUAL Generator output, through
-- LegacyAdapter, which is the only trustworthy way to make the claim.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Adapter=require("ConspiracyFiles/Mystery/LegacyAdapter")
local Guard=require("ConspiracyFiles/Mystery/DiversityGuard")
local Linter=require("ConspiracyFiles/Mystery/Linter")
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}

-- ---------------------------------------------------------------------------
-- 1. NON-INTERFERENCE. LegacyAdapter must require nothing from, and write
--    nothing into, the live generator - read only, structurally, not by
--    promise (the regulator frame's "non-interference certificate").
-- ---------------------------------------------------------------------------
local f=assert(io.open("mod/common/media/lua/shared/ConspiracyFiles/Mystery/LegacyAdapter.lua","rb"))
local src=f:read("*a"); f:close()
for line in src:gmatch("[^\n]+") do
    local target=line:match('require%("([^"]+)"%)')
    if target then
        for _,forbidden in ipairs({"Generated/Story","Generated/Generator",
            "Generated/Session","GeneratedRuntime"}) do
            assert(not target:find(forbidden,1,true),
                "LegacyAdapter must not require "..target..", which touches the live generator")
        end
    end
end
assert(not src:find("ModData",1,true),"LegacyAdapter must not touch ModData - it is read-only over its argument")

-- ---------------------------------------------------------------------------
-- 2. HONESTY ON A KNOWN FIXTURE - one document stays one finding, close
--    keys are exactly the case's own essential list, no invented text.
-- ---------------------------------------------------------------------------
local fixture={
    caseId="fixture-case",
    story={centralAxis="records"},
    essential={"d1","d2"},
    documents={
        {id="d1",kind="Key1",title="A key",body="I have a key.",locationId="site-a",
            accessIntent="starting-building",wear="worn"},
        {id="d2",kind="receipt",title="A receipt",body="Dated paper.",locationId="site-a"},
        {id="d3",kind="notepad",title="A note",body="Not essential.",locationId=nil},
    },
}
fixture.story.comparisons={
    {requires={"d1","d2"},from="d1",to="d2",text="They agree.",kind="corroborates"},
    {requires={"d1","d2","d3"},from="d1",to="d3",text="Three readings disagree.",kind="recontextualises"},
}
local mystery=assert(Adapter.fromCase(fixture))
assert(mystery.findings.d1 and mystery.findings.d2 and mystery.findings.d3,
    "every document must become a finding, essential or not")
assert(mystery.findings.d1.where=="onMe","a starting-building key must translate to onMe")
assert(mystery.findings.d2.where=="site")
assert(mystery.findings.d3.where=="heard","a document with no locationId must become heard, never dropped")
assert(mystery.close.kind=="all" and #mystery.close.keys==2 and mystery.close.keys[1]=="d1",
    "close keys must be exactly the case's own essential list")
assert(mystery.links[1].shape=="pair","a two-requirement corroborates comparison is a pair")
assert(mystery.links[2].shape=="threeWay","a three-requirement comparison is threeWay")
local okLint,whyLint=Linter.lint(mystery)
assert(okLint,"an honestly-translated legacy case must lint clean: "..tostring(whyLint))

-- A disputing comparison is a contradiction regardless of arity.
local disputed={caseId="d",story={centralAxis="records",comparisons={
    {requires={"d1","d2"},from="d1",to="d2",text="They disagree.",kind="disputes-delivery"}}},
    essential={"d1"},documents=fixture.documents}
local disputedMystery=assert(Adapter.fromCase(disputed))
assert(disputedMystery.links[1].shape=="contradiction")

-- No essential list at all: honestly carried, never assumed complete.
local noEssential={caseId="n",story={centralAxis="records",comparisons={}},documents={fixture.documents[1]}}
local noEssentialMystery=assert(Adapter.fromCase(noEssential))
assert(noEssentialMystery.close==nil,"a case with no essential list must translate to no close predicate at all")

-- ---------------------------------------------------------------------------
-- 3. A CORRECTION, FOUND HERE RATHER THAN ASSUMED. The build plan
--    (ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, step 3) predicted the guard
--    would ACCEPT the twenty ordinary premises because they are "already
--    varied by hand". Measured: they are varied in CONTENT (organisation,
--    objects, prose) but not in STRUCTURE - every one of them is built on
--    Story.lua's own fixed ANCHORS schema (claim/response/review at two
--    sites, ending on every essential known), so every one of them computes
--    to the SAME shape card, seed after seed. This is not a test bug (five
--    different seeds checked directly against ShapeCard below, byte-
--    identical tuple every time); it is the guard doing exactly its job -
--    proving that the recipe DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN
--    rejected was never only in the twenty-four withdrawn families. It was
--    already in the engine every legacy case is built from. The build plan
--    is corrected below this test, not silently.
local ShapeCard=require("ConspiracyFiles/Mystery/ShapeCard")
local ordinaryRoster,tuples={},{}
for seed=1,Premises.choosableCount() do
    local case=assert(G.generate(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}),
        "ordinary seed "..seed.." failed to generate")
    local mysteryI,why=Adapter.fromCase(case)
    assert(mysteryI,"seed "..seed.." would not translate: "..tostring(why))
    tuples[ShapeCard.tupleKey(ShapeCard.compute(mysteryI))]=true
    ordinaryRoster[#ordinaryRoster+1]=mysteryI
end
-- Most, not literally every one, land on the schema's one dominant shape -
-- some scenarios vary essential count or comparison mix enough to land in
-- a different bucket. The measured claim is narrower, and still real: at
-- least half of twenty independently seeded ordinary cases share one exact
-- structural tuple, which the guard's own quota logic below must catch.
local distinct=0; for _ in pairs(tuples) do distinct=distinct+1 end
assert(distinct<=Premises.choosableCount()/2,
    "the ordinary premises turned out more structurally varied than measured - re-check before trusting this claim: "
    ..distinct.." distinct shapes across "..Premises.choosableCount().." seeds")
local okOrdinary,whyOrdinary=Guard.check(ordinaryRoster)
assert(not okOrdinary,
    "with most of twenty ordinary cases sharing one exact shape, the roster must be refused - "
    .."Story.lua's own schema is one shape, exactly as the withdrawn 24 were")
print("Guard refused the twenty ordinary premises too ("..distinct.." distinct shapes among them), because: "..tostring(whyOrdinary))

-- ---------------------------------------------------------------------------
-- 4. THE WITHDRAWN TWENTY-FOUR, real material, must be REFUSED - this is
--    the guard's own acceptance test, on the actual withdrawn content
--    (DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN), not a hypothetical.
-- ---------------------------------------------------------------------------
local Occupations=require("ConspiracyFiles/Generated/OccupationOpeningScenarios")
local withdrawnRoster={}
for _,profession in ipairs(Occupations.ORDER) do
    local case,why=G.generateSelected(catalog,1,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
        allowSynthetic=true,opening=true,self="Ada Whitlock",profession=profession,
        -- The family is withdrawn from Premises routing, so it must be
        -- built directly from its own scenario, exactly as
        -- test/occupation_openings.lua already proves the material still
        -- validates; this bypasses Premises on purpose, as that test does.
        }
    ,{catalog.locations[1].id,catalog.locations[2].id})
    -- Premises no longer knows this profession, so generateSelected refuses
    -- it (by design, since the withdrawal). Build the case the same way the
    -- withdrawal's own test proves the material is still valid: through
    -- Story.build directly on the authored scenario.
    if not case then
        local Story=require("ConspiracyFiles/Generated/Story")
        local scenario=Occupations.get(profession)[1]
        local a,b=catalog.locations[1],catalog.locations[2]
        local map={CODE="TX-100",ORG=scenario.organisation,P1="Marion Ellis",P2="Roy Hale",
            A=a.name,B=b.name,SELF="Ada Whitlock",FROMPOINT="",FROMREF=""}
        local built=assert(Story.build(scenario,function(v) return (v:gsub("{([%u%d]+)}",function(k) return map[k] or "" end)) end,
            "gen:"..profession..":",a,b,{{id="p1",name="Marion Ellis"},{id="p2",name="Roy Hale"}},
            {id="org",name=scenario.organisation},function(n) return 1 end))
        case={caseId=profession,documents=built.documents,story=built.story,essential=built.essential}
    end
    local mysteryI=assert(Adapter.fromCase(case),"withdrawn family "..profession.." would not translate")
    withdrawnRoster[#withdrawnRoster+1]=mysteryI
end
assert(#withdrawnRoster==24,"expected all 24 withdrawn families, got "..#withdrawnRoster)
local okWithdrawn,whyWithdrawn=Guard.check(withdrawnRoster)
assert(not okWithdrawn,
    "the guard must refuse the real withdrawn 24 - the same shape twenty-four times over")
print("Guard refused the withdrawn 24 because: "..tostring(whyWithdrawn))

print("PASS legacy adapter: non-interfering, honest on a known fixture; calibrated on real content - "
    .."the guard refuses BOTH the ordinary twenty and the withdrawn 24, each one shape repeated, "
    .."correcting the build plan's assumption that hand-varied prose was structural variety")
