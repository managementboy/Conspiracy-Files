-- A locally resolved investigation has a bounded answer without inventing a
-- final explanation for Knox. Optional survivor readings may remain after it.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Story=require("ConspiracyFiles/Generated/Story")
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function source(title) return {kind="dispatch",title=title,observation="A dated transfer entry.",source="The entry identifies the duplicate and its correction.",note="It fixes the local sequence."} end
local closed={
    question="Why was the transfer reversed?", event="The depot corrected a duplicated transfer.",
    outcome="The duplicate was removed before the outage.",
    readings={"The correction was routine.","The correction settles the transfer without explaining the later outage."},
    anchors={claim=source("Transfer request"),response=source("Correction notice"),review=source("Stock review")},
    essential={"claim","response"},
    comparisons={{requires={"claim","response"},text="The correction answers the duplicate transfer.",from="claim",to="response",kind="corroborates"}},
}
assert(Story.validate(closed),"a closed local story validates")
local built=assert(Story.build(closed,function(v) return v end,"closed:",{id="a"},{id="b"},
    {{id="person-a"},{id="person-b"}},{id="org"},function() return 1 end))
assert(built.story.unresolved==nil and built.story.outcome==closed.outcome,"build preserves a closed local answer")
for _,bad in ipairs({"",{},"   "}) do
    local tampered=copy(closed); tampered.unresolved=bad
    assert(not Story.validate(tampered),"an explicitly supplied unresolved question must be meaningful text")
end

local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function completed(seed)
    local case
    for candidate=seed,seed+200 do
        local generated=G.generate(catalog(),candidate,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})
        if generated and generated.story and generated.story.unresolved==nil then case=generated; break end
    end
    assert(case,"fixture must generate a closed authored case")
    local root=assert(Session.createDistributed(case,{},nil,nil,0))
    local api=assert(Session.open(root,function(next) root=next end))
    for i,doc in ipairs(case.documents) do
        local site
        for _,candidate in ipairs(case.locations) do if candidate.id==doc.locationId then site=candidate end end
        local target={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=i,
            containerIndex=0,containerType=site.containerTypes[1],sprite="closed-story"}
        assert(api.assign(doc.id,target,0)); assert(api.status(doc.id,"placed",0)); assert(api.inspect(doc.id))
    end
    return case,assert(Retired.retire(api.snapshot(),nil,1))
end
local case,retired=completed(901)
assert(retired.offered,"fixture must carry closing choices")
assert(retired.offered.question==nil and retired.offered.readings[1]==case.story.readings[1]
    and retired.offered.readings[2]==case.story.readings[2],"retirement retains the closed story's readings")
assert(Retired.validate(retired),"two offered readings remain valid when the local question is answered")
retired.offered.question=""
assert(not Retired.validate(retired),"an empty supplied retirement question is refused")
retired.offered.question={}
assert(not Retired.validate(retired),"a malformed supplied retirement question is refused")
print("PASS closed stories keep a local answer and optional survivor questions")
