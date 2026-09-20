-- Transitional authored-source contract; Claude executes after implementation.
-- This covers seventeen converted families, not the complete writing objective.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Story=require("ConspiracyFiles/Generated/Story")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local expected={"transfer-nobody-arranged","signed-by-someone-absent","two-start-dates",
 "resignation-after-payslip","address-that-only-receives","identical-inventories",
 "room-not-on-the-plan","lease-outlived-tenant","load-that-got-lighter",
 "fuel-for-a-dead-truck","returned-cleaner","two-crates-one-number",
 "paid-before-ordered","overtime-nobody-worked","closure-announced-twice",
 "no-contact-at-premises","still-filing"}
local values={CODE="PS-229",P1="Ines Kubiak",P2="Ellis Hale",
 A="201 N Carl St",B="113 Walker Road",DATE0="July 5, 1993",DATE1="July 6, 1993",
 DATE2="July 7, 1993",DATE3="July 8, 1993",DATE1CAPS="JULY 6, 1993",DATE2CAPS="JULY 7, 1993",
 SELF="Buddy Schuster",FROMREF="OLD-104",FROMPOINT="213 Harris St",
 DAYS12="one day",PRIORMONTH="June",SINCE11="August 1992"}
local function get(id,v) return Personal.get(id,v) or Ordinary.get(id,v) end
local function fill(s)
 return (s:gsub("{([%u%d]+)}",function(k) return assert(values[k],"unbound slot "..k) end))
end
local expectedSet={};for _,id in ipairs(expected) do assert(not expectedSet[id]);expectedSet[id]=true end
local converted,uncovered=0,0
local orders={{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}}
for _,id in ipairs(Premises.list()) do
 local one,two=get(id,1),get(id,2)
 if not expectedSet[id] then
  assert(one==nil and two==nil,"coverage changed; update the explicit expectation: "..id)
  uncovered=uncovered+1
 else
  converted=converted+1
  assert(one and two,"both authored variants required: "..id)
  for variant,authored in ipairs({one,two}) do
   assert(Story.validate(authored));assert(#authored.essential==3)
   values.ORG=assert(authored.organisation)
   -- Maximum optional count, stable optional order, so no declared source is
   -- silently absent from the knowledge-gate checks.
   local built=assert(Story.build(authored,fill,id..":"..variant..":",
    {id="a"},{id="b"},{{id="p1"},{id="p2"}},{id="org"},function(n) return n end))
   assert(#built.documents==3+#authored.optional)
   local sources={authored.anchors.claim,authored.anchors.response,authored.anchors.review}
   for _,d in ipairs(authored.optional) do sources[#sources+1]=d end
   for i,doc in ipairs(built.documents) do
    assert(Pages.text(doc.body)==fill(sources[i].source),"native text must contain precisely the authored source")
    assert(not doc.body:match("{%u[%u%d]*}"),"unknown placeholder")
    local body,links=Story.project(built.story,doc,{[doc.id]=true})
    assert(body==doc.body and #links==0,"one source cannot reveal a comparison")
   end
   local function checkKnown(known)
    for _,doc in ipairs(built.documents) do
     local body=Story.project(built.story,doc,known)
     for _,finding in ipairs(built.story.comparisons) do
      local ready=finding.from==doc.id
      for _,need in ipairs(finding.requires) do if not known[need] then ready=false end end
      assert((body:find(finding.text,1,true)~=nil)==ready,
       "finding leaked or stayed hidden: "..id.." / "..variant.." / "..doc.id)
     end
    end
   end
   -- Every subset includes optional-source combinations, not just anchors.
   for mask=0,2^#built.documents-1 do
    local known={}
    for i,doc in ipairs(built.documents) do
     if math.floor(mask/2^(i-1))%2==1 then known[doc.id]=true end
    end
    checkKnown(known)
   end
   for _,order in ipairs(orders) do
    local known={}
    for _,i in ipairs(order) do known[built.documents[i].id]=true;checkKnown(known) end
    local finding=Story.newFinding(built.story,known,built.documents[order[3]].id)
    assert(finding and #finding.requires==3,"any last essential source must unlock the ending")
   end
   local bad=get(id,variant)
   bad.comparisons[1].requires[1]="not-an-authored-source"
   local valid,why=Story.validate(bad)
   assert(not valid and why=="finding has invalid source","unknown dependency must be rejected specifically")
  end
 end
end
assert(converted==#expected and converted==17 and uncovered==5,
 "transitional coverage must explicitly account for all 22 families")
print("PASS transitional story contract: 17 families, 34 variants; 5 families remain uncovered")
