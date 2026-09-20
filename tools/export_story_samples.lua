-- Offline Markdown preview for editorial review; run from the repository root.
-- Usage: lua5.1 tools/export_story_samples.lua > story-samples.md
-- Claude executes this only at the full implementation handoff.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Story=require("ConspiracyFiles/Generated/Story")
local values={CODE="PS-229",P1="Ines Kubiak",P2="Ellis Hale",
 A="201 N Carl St",B="113 Walker Road",DATE0="July 5, 1993",DATE1="July 6, 1993",
 DATE2="July 7, 1993",DATE3="July 8, 1993",DATE1CAPS="JULY 6, 1993",DATE2CAPS="JULY 7, 1993",
 SELF="Buddy Schuster",FROMREF="OLD-104",FROMPOINT="213 Harris St",
 DAYS12="one day",PRIORMONTH="June",SINCE11="August 1992"}
local function get(id,variant) return Personal.get(id,variant) or Ordinary.get(id,variant) end
local function fill(s)
 return (s:gsub("{([%u%d]+)}",function(k) return assert(values[k],"unbound preview slot "..k) end))
end
local function source(key,d)
 print("\n### "..key..": "..fill(d.title))
 print("\n_Observed:_ "..fill(d.observation))
 print("\n```text\n"..fill(d.source).."\n```")
 print("\n_Survivor note:_ "..fill(d.note))
end
print("# Authored story samples\n\n> Mod-authored fiction, not vanilla canon. Fixed names and addresses are preview bindings, not verified business locations. This preview covers generated and map story drafts. Rendering a map story does not verify its destination, placement, discovery or in-game presentation.")
local covered,missing=0,{}
for _,id in ipairs(Premises.list()) do
 local first,second=get(id,1),get(id,2)
 if not first and not second then missing[#missing+1]=id
 else
  assert(first and second,"partial variant coverage: "..id)
  covered=covered+1
  for variant,s in ipairs({first,second}) do
   assert(Story.validate(s))
   values.ORG=assert(s.organisation,"missing grounded organisation: "..id)
   print("\n## "..id.." / variant "..variant)
   print("\nBusiness: "..s.organisation.."; grounding record: `"..tostring(s.grounding).."`.")
   print("\n**Question:** "..fill(s.question).."\n\n**Underlying event:** "..fill(s.event))
   print("\n**Local answer:** "..fill(s.outcome))
   if s.unresolved then print("\n\n**Still open:** "..fill(s.unresolved))
   else print("\n\n**Local question:** answered by this evidence.") end
   print("\nClosing interpretations:")
   for _,reading in ipairs(s.readings) do print("- "..fill(reading)) end
   for _,key in ipairs({"claim","response","review"}) do source(key,s.anchors[key]) end
   for _,d in ipairs(s.optional or {}) do source("optional / "..d.key.." / "..d.role,d) end
   print("\n### Findings and the sources they require")
   for _,f in ipairs(s.comparisons) do
    print("\n- ["..table.concat(f.requires,", ").."] "..fill(f.text))
   end
  end
 end
end
print("\n## Coverage\n\n"..covered.." of "..#Premises.list().." generated families have both variants.")
print("\n### Explicitly uncovered")
if #missing==0 then print("\nNone in the generated-family pool; this does not certify map or other writing coverage.")
else for _,id in ipairs(missing) do print("- "..id) end end

-- Map family samples and the real catalogue's seeded selection are separate:
-- exercising all authored families does not claim every map reaches a building.
local MapContent=require("ConspiracyFiles/MapMediaContent")
local MapCatalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
print("\n# Map story samples\n\n> One authored event per family at this checkpoint. Dates, names and quantities vary coherently; travel coverage still needs implementation and native verification.")
for _,family in ipairs(MapContent.families) do
 local binding=family.id=="gallery" and MapCatalogue.get("LouisvilleStashMap15")
     or {id="preview-"..family.id,label="113 Walker Road",storyFamilies={family.id}}
 local seed=1803
 local first=MapContent.render(binding,seed,1)
 print("\n## Map / "..family.id)
 print("\nBusiness: "..family.organisation.."; grounding record: `"..family.grounding.."`.")
 print("\n**Question:** "..first.question.."\n\n**Underlying event:** "..first.event.."\n\n**Local answer:** "..first.outcome)
 for part=1,4 do
  local doc=MapContent.render(binding,seed,part)
  print("\n### Source "..part..": "..doc.title)
  print("\n```text\n"..Pages.text(doc.body).."\n```")
  print("\nJournal version:\n\n```text\n"..doc.body.."\n```")
  local findings=MapContent.findings(binding,seed,part,{[1]=true,[2]=true,[3]=true,[4]=true})
  for _,finding in ipairs(findings) do print("\n_Supported comparison:_ "..finding) end
 end
 local observed=MapContent.render(binding,seed,family.observationPart,family.skill)
 print("\n### Specialist reading / "..family.skill.."\n\n```text\n"..observed.body.."\n```")
end
print("\n## Real catalogue selection at preview seed 1803\n\n| Map | Authored family | Destination label |\n|---|---|---|")
for _,id in ipairs(MapCatalogue.list) do
 local binding=MapCatalogue.get(id)
 print("| "..id.." | "..MapContent.scenario(binding,1803).id.." | "..binding.label.." |")
end
print("\n"..#MapCatalogue.list.." catalogue records selected; "..#MapContent.families.." authored map families previewed. This is content coverage, not placement acceptance.")
