-- Authored for Claude to execute after the complete implementation handoff.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Story=require("ConspiracyFiles/Generated/Story")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local G=require("ConspiracyFiles/Generated/Generator")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local Questions=require("ConspiracyFiles/Generated/Questions")
local values={CODE="PS-229",ORG="McCoy Logging Co.",P1="Ines Kubiak",P2="Ellis Hale",
 A="201 N Carl St",B="113 Walker Road",DATE0="July 5, 1993",DATE1="July 6, 1993",
 DATE2="July 7, 1993",DATE3="July 8, 1993",DATE1CAPS="JULY 6, 1993",DATE2CAPS="JULY 7, 1993",
 SELF="Buddy Schuster",FROMREF="OLD-104",FROMPOINT="213 Harris St"}
local function fill(s)
 return (s:gsub("{([%u%d]+)}",function(k) return assert(values[k],"unknown authoring slot "..k) end))
end
local permutations={{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}}
for _,id in ipairs({"no-contact-at-premises","still-filing"}) do
 for variant=1,2 do
  local authored=assert(Personal.get(id,variant))
  assert(Story.validate(authored))
  local built=assert(Story.build(authored,fill,"example:",{id="a"},{id="b"},
   {{id="person1"},{id="person2"}},{id="org"},function() return 1 end))
  assert(#built.documents==3 and #built.essential==3)
  local ids={}; for i,d in ipairs(built.documents) do ids[i]=d.id end
  -- Native pages contain precisely the source, without the character's note.
  for index,key in ipairs({"claim","response","review"}) do
   local doc=built.documents[index]
   assert(Pages.text(doc.body)==fill(authored.anchors[key].source))
   local body,links=Story.project(built.story,doc,{[doc.id]=true})
   assert(body==doc.body and #links==0,"one source cannot reveal a comparison")
  end
  -- Every proper subset withholds the all-source ending, in every order.
  local ending
  for _,finding in ipairs(built.story.comparisons) do if #finding.requires==3 then ending=finding end end
  assert(ending,"the story must actually supply an ending")
  for _,order in ipairs(permutations) do
   local known={}
   for step,index in ipairs(order) do
    known[ids[index]]=true
    for _,doc in ipairs(built.documents) do
     local body=Story.project(built.story,doc,known)
     local found=body:find(ending.text,1,true)~=nil
     assert(found==(step==3 and doc.id==ending.from),"ending leaked or failed to appear")
    end
    local newFinding=Story.newFinding(built.story,known,ids[index])
    if step==1 then assert(newFinding==nil) end
    if step==3 then assert(newFinding==ending,"finding earlier source last must complete the same event") end
   end
  end
  -- Reject a finding whose author omitted its own linked source dependency.
  local bad=Personal.get(id,variant)
  bad.comparisons[1].requires={"claim","review"}
  assert(not Story.validate(bad))
  -- Retrieval cannot let a consumer edit a later case's source templates.
  authored.anchors.claim.source="changed by a caller"
  assert(Personal.get(id,variant).anchors.claim.source~=authored.anchors.claim.source)
 end
end

local catalogue=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,
 opening=true,self="Buddy Schuster"}
local selected={catalogue.locations[1].id,catalogue.locations[2].id}
local original=assert(G.generateSelected(catalogue,101,opts,selected))
assert(original.story and G.validate(original))
assert(original.organisation.name=="McCoy Logging Co.")
assert(#original.essential==3)
local follows={}
for k,v in pairs(original.thread) do follows[k]=v end
follows.fromCase=original.caseId
opts={mapId=opts.mapId,buildLine=opts.buildLine,allowSynthetic=true,follows=follows}
local continuation=assert(G.generateSelected(catalogue,102,opts,selected))
assert(G.validate(continuation))
assert(continuation.facts.recipient==original.facts.recipient,"continuation redrew its source person")
assert(continuation.organisation.name==original.organisation.name)
assert(continuation.facts.claimDate>=original.facts.reviewDate,"continuation predates source closure")
for _,doc in ipairs(continuation.documents) do assert(not doc.body:match("{%u[%u%d]*}")) end
local tampered=assert(G.restore(original)); tampered.story.comparisons[1].requires={tampered.documents[1].id}
assert(not G.validate(tampered),"saved knowledge gates cannot be rewritten")
local withoutName=G.project(original,{original.documents[3].id})
assert(not withoutName[1].body:find("my passenger run",1,true),"unread name source made the case personal")
local note=Questions.note({reading="one"},{readings=original.story.readings})
assert(note=="My reading: "..original.story.readings[1],"full-sentence readings must not become broken grammar")
print("PASS authored personal stories: sources, discovery orders, native pages, continuation and integrity")
