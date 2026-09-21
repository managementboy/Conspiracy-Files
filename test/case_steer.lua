package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local listened,preferredChecked,cases=0,0,0
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local FROM="generated:77:case"
local function opts(extra) local o={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true};for k,v in pairs(extra or {})do o[k]=v end;return o end
local function anchors(c) local o={};for _,id in ipairs(c.essential)do for _,d in ipairs(c.documents)do if d.id==id then o[#o+1]=d.body end end end;table.sort(o);return table.concat(o,"\n")end
for seed=1,400 do
 local base=G.generate(catalog,seed,opts())
 if base then
  cases=cases+1
  assert(G.validate(base) and G.validate(assert(G.restore(base))) and #base.essential==3)
  local person=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,person="Una Carver"}}))
  assert(person.identities[1].name=="Una Carver" and person.identities[1].met and person.identities[2].name~="Una Carver" and person.premiseId==base.premiseId and person.outline==base.outline)
  local org=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,organisation=base.facts.organisation}}))
  assert(org.facts.organisation==base.facts.organisation and G.validate(assert(G.restore(org))))
  assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,organisation="Unsupported Office"}})==nil)
  for _,reading in ipairs({"one","two"})do local c=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,reading=reading}}));assert(c.story.event==base.story.event and anchors(c)==anchors(base))end
  local scenario=assert(Ordinary.get(base.premiseId,base.outline=="corroboration" and 1 or 2))
  for _,way in ipairs({"person","records","listen"}) do
   local c=assert(G.generate(catalog,seed,opts{steer={fromCase=FROM,way=way}}))
   assert(G.validate(c) and c.story.event==base.story.event and anchors(c)==anchors(base))
   assert(#c.documents<=3+#scenario.optional,"an approach cannot manufacture extra sources")
   local roles,offered={},false
   for _,d in ipairs(scenario.optional) do
    -- An object's title names the person it is marked with, not the case
    -- code, so binding only {CODE} stopped matching once objects arrived.
    local title=d.title:gsub("{(%u[%u%d]*)}",function(slot)
     if slot=="CODE" then return c.facts.code end
     if slot=="P1" then return c.facts.sender end
     if slot=="P2" then return c.facts.recipient end
     if slot=="ORG" then return c.facts.organisation end
     return "{"..slot.."}"
    end)
    roles[title]=d.role
    if d.role==way then offered=true end
   end
   local selected=false
   for i=4,#c.documents do
    local role=assert(roles[c.documents[i].title],"generated optional must belong to this scenario")
    if role==way then selected=true end
    if way=="listen" and role=="listen" then
     listened=listened+1;assert(c.documents[i].kind=="transcript")
    end
   end
   if offered then preferredChecked=preferredChecked+1;assert(selected,"an offered approach must supply a compatible source") end
  end
 end
end
local c=assert(G.generate(catalog,5,opts{steer={fromCase=FROM,way="records",person="Una Carver"}}));local again=assert(G.generate(catalog,5,opts{steer={fromCase=FROM,way="records",person="Una Carver"}}));assert(c.story.event==again.story.event and anchors(c)==anchors(again))
local bad=assert(G.restore(c));bad.steer.person="Roy Hale";assert(not G.validate(bad))
for _,s in ipairs({{}, {fromCase=FROM},{fromCase=FROM,way="cold"},{fromCase=FROM,reading="unsure"},{fromCase=FROM,person="Una Carver",organisation="U-Store It"}})do assert(G.generate(catalog,5,opts{steer=s})==nil)end
assert(cases>0 and preferredChecked>0 and listened>0,"positive authored approach coverage required")
print("PASS case steer: authored events and optional roles remain bounded")
