-- The Fitness Instructor is the first profession-specific opening family.
-- It has ten authored starts, all reachable, saved explicitly and rebuildable.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Story=require("ConspiracyFiles/Generated/Story")

local premise=assert(Premises.forProfession("fitnessinstructor"))
assert(premise.id=="fitness-instructor-start" and premise.opening and premise.profession=="fitnessinstructor")
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
local sites={catalog.locations[1].id,catalog.locations[2].id}
local seen={}
for seed=1,10 do
 local case,why=G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
  allowSynthetic=true,opening=true,self="Ada Whitlock",profession="fitnessinstructor"},sites)
 assert(case,"fitness opening seed "..seed.." failed: "..tostring(why))
 assert(case.premiseId==premise.id and case.opening.profession=="fitnessinstructor")
 assert(case.opening.variant==seed,"seed "..seed.." did not select its distinct start")
 assert(G.validate(case),"fitness opening "..seed.." does not rebuild")
 seen[case.opening.variant]=true
 local named=false
 for _,document in ipairs(case.documents) do
  if document.body:find("Ada Whitlock",1,true) then named=true end
 end
 assert(named,"fitness start "..seed.." does not name the survivor")
end
for variant=1,10 do assert(seen[variant],"fitness start is unreachable: "..variant) end

assert(G.generateSelected(catalog,1,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
 allowSynthetic=true,opening=true,self="Ada Whitlock",profession="carpenter"},sites)==nil,
 "unknown profession routing is refused instead of silently selecting a wrong family")
print("PASS fitness instructor: ten distinct, reachable, survivor-named starts rebuild exactly")
