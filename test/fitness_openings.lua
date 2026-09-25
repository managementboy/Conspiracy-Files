-- The Fitness Instructor is the first profession-specific opening family.
-- It has ten authored starts, all reachable, saved explicitly and rebuildable.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Story=require("ConspiracyFiles/Generated/Story")

local premise=assert(Premises.forProfession("fitnessinstructor"))
assert(premise.id=="fitness-instructor-start" and premise.opening and premise.profession=="fitnessinstructor")
-- Every other occupation keeps the generic opening pool: the families of
-- 2026-09-25 were withdrawn from routing the same day
-- (DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN, test/occupation_openings.lua).
assert(Premises.forProfession("unemployed")==nil,"other professions keep the generic opening pool")
assert(Premises.openingVariants(premise.id)==10,"the fitness opening advertises ten variants")

local questions,titles={},{}
for variant=1,10 do
 local scenario=assert(Personal.get(premise.id,variant),"missing fitness start "..variant)
 local valid,why=Story.validate(scenario)
 assert(valid,"invalid fitness start "..variant..": "..tostring(why))
 assert(not questions[scenario.question],"duplicate fitness question: "..scenario.question)
 assert(not titles[scenario.anchors.claim.title],"duplicate fitness assignment: "..scenario.anchors.claim.title)
 questions[scenario.question]=true; titles[scenario.anchors.claim.title]=true
 assert(scenario.organisation=="Sure Fitness & Boxing Club")
end
assert(Personal.get(premise.id,11)==nil,"an eleventh start is not invented")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
-- The live fixed-container scan labels usable sites `indexed`; this exact
-- state must reach the opening generator rather than being rejected as a
-- missing eligibility fact after the expensive nearby scan completes.
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}
local seen={}
for seed=1,10 do
 local case,why=G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
  allowSynthetic=true,opening=true,self="Ada Whitlock",profession="fitnessinstructor"},sites)
 assert(case,"fitness opening seed "..seed.." failed: "..tostring(why))
 assert(case.premiseId==premise.id and case.opening.profession=="fitnessinstructor")
 assert(case.opening.variant==seed,"seed "..seed.." did not select its distinct start")
 assert(G.validate(case),"fitness opening "..seed.." does not rebuild")
 assert(#case.documents==5,"the opening must build the complete five-finding chain")
 assert(#case.essential==4,"the four authored household findings are required before a random scene is confirmed")
 assert(case.documents[1].kind=="Key1" and case.documents[1].accessIntent=="starting-building",
  "the first clue is a real key for the starting building")
 assert(case.documents[2].kind=="receipt" and case.documents[2].body:find("July 8, 1993",1,true),
  "the appointment is the chain's one dated paper")
 assert(#case.documents[1].leads==0 and case.documents[2].leads[1]==sites[2]
  and case.documents[2].body:find("If client absent: return key and visit sheet to",1,true),
  "the key reveals no hidden destination; the readable appointment carries the second-place lead")
 assert(case.documents[1].body:find("I have a worn brass house key",1,true)
  and case.documents[1].body:find("I do not remember putting it there",1,true)
  and not case.documents[1].body:find("at the start",1,true),
  "the opening is first-person and immediate, not a description of the game's session")
 assert(case.documents[3].kind=="AnimalFeedBag" and case.documents[3].roomIntent=="wrong")
 assert(case.documents[4].members and #case.documents[4].members==3 and case.documents[4].quantity==9,
  "the PPE accumulation is one heterogeneous finding")
 assert(case.documents[5].kind=="Cooler" and case.documents[5].placementIntent=="vehicle"
  and case.documents[5].sceneKind=="ambiguous-transport",
  "the fifth clue waits for a real transport scene")
 assert(case.conspiracyPair and case.conspiracyPair.id=="farm-zero-vs-delivered-agent"
  and #case.conspiracyPair.theories==2 and case.conspiracyPair.correct==nil,
  "the case carries two rival theories and no hidden winner")
 assert(case.story.unresolved==case.conspiracyPair.question,
  "the local opening points at the campaign's missing direction of travel")
 seen[case.opening.variant]=true
 local named=false
 for _,document in ipairs(case.documents) do
  if document.body:find("Ada Whitlock",1,true) then named=true end
 end
 assert(named,"fitness start "..seed.." does not name the survivor")
end
for variant=1,10 do assert(seen[variant],"fitness start is unreachable: "..variant) end

assert(G.generateSelected(catalog,1,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
 allowSynthetic=true,opening=true,self="Ada Whitlock",profession="astronaut"},sites)==nil,
 "unknown profession routing is refused instead of silently selecting a wrong family")
print("PASS fitness instructor: ten residential starts build the five-clue dual-conspiracy opening exactly")
