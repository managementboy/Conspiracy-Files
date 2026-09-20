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
print("# Authored story samples\n\n> Mod-authored fiction, not vanilla canon. Fixed names and addresses are preview bindings, not verified business locations. This preview covers generated cases only; map families and other writing surfaces have separate coverage.")
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
