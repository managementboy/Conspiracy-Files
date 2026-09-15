-- The survivor's answers about a finished case steer the next one ("What do I
-- make of it?", P4-R113; P4-R119, P4-R121). Pure save logic:
--   - a finished case records when it finished;
--   - answers are set, changed and cleared copy-on-write;
--   - the most recently changed unused answers become the next case's steer,
--     and "I can't tell" / "nobody, really" steer nothing;
--   - the case built from them marks them used in the same swap, after which
--     they never steer again and can no longer be changed.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
local function opts(steer) return {mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,steer=steer} end
local function makeCase(seed,steer)
    for s=seed,seed+50 do local case=G.generate(catalog,s,opts(steer)); if case then return case end end
    error("no generated case near seed "..seed)
end
local function rootOf(case)
    local targets={}
    for _,site in ipairs(case.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
    end
    return assert(Session.create(case,targets))
end
local function discover(wrapper,index)
    local root=Cases.sessions(wrapper)[index]
    local api=assert(Session.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,index,staged)) end))
    for _,doc in ipairs(root.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(root.case.documents) do assert(api.inspect(doc.id)) end
    return wrapper
end

-- 1. A finished case records when it finished.
local w={canonical=rootOf(makeCase(601)),schedule={schema=1,createdHours={0}}}
w=discover(w,1)
w=assert(Cases.retire(w,1,nil,30.5))
local first=Cases.sessions(w)[1]
assert(first.completedHours==30.5,"the completion hour is kept")
assert(Retired.validate(first))
local bad={} for k,v in pairs(first) do bad[k]=v end; bad.completedHours=-1
assert(not Retired.validate(bad),"a negative completion hour is refused")
print("PASS a finished case records when it finished")

-- 2. Answers are set, changed and cleared copy-on-write.
assert(Cases.pendingSteer(w)==nil,"nothing answered, nothing steers")
local w2=assert(Cases.setAnswers(w,1,{reading="one",matters="person1",way="records"},31))
local a=Cases.sessions(w2)[1].answers
assert(a.reading=="one" and a.matters=="person1" and a.way=="records" and a.changedHours==31)
assert(Cases.sessions(w)[1].answers==nil,"the old wrapper is untouched")
assert(Cases.setAnswers(w,1,{way="cold"},31)==nil,"'leave it cold' is refused (P4-R119)")
assert(Cases.setAnswers(w,1,{},31) and Cases.sessions(Cases.setAnswers(w2,1,{},32))[1].answers==nil,"an empty answer set clears them")
local unsure=assert(Cases.setAnswers(w,1,{reading="unsure",matters="nobody"},31))
assert(Cases.pendingSteer(unsure)==nil,"'I can't tell' and 'nobody, really' steer nothing")
print("PASS answers are set, changed and cleared copy-on-write")

-- 3. The answers become the next case's steer.
local steer,index=Cases.pendingSteer(w2)
assert(index==1 and steer.fromCase==first.caseId,"the steer names the case it came from")
assert(steer.person==first.offered.people[1] and steer.reading=="one" and steer.way=="records")
local org=assert(Cases.setAnswers(w,1,{matters="organisation"},31))
assert(select(1,Cases.pendingSteer(org)).organisation==first.offered.organisation,"the organisation returns when chosen")

-- 4. Building the next case marks the answers used, in the same swap.
local nextCase=makeCase(701,steer)
assert(nextCase.identities[1].name==first.offered.people[1] and nextCase.identities[1].met==true)
local staged=assert(Cases.stage(w2,rootOf(nextCase),40,index))
assert(Cases.sessions(staged)[1].answers.usedBy==nextCase.caseId,"the answers are marked used by the case they shaped")
assert(Cases.sessions(w2)[1].answers.usedBy==nil,"the old wrapper is untouched")
assert(Cases.pendingSteer(staged)==nil,"used answers never steer again")
assert(Cases.setAnswers(staged,1,{way="person"},41)==nil,"used answers are locked")
assert(Cases.stage(w2,rootOf(makeCase(801)),40,1)==nil,"a case that was not built from the answers cannot use them")
print("PASS the next case is built from the answers and marks them used in one swap")

-- 5. Two finished cases: the most recently changed answers steer.
local two=assert(Cases.stage(w,rootOf(makeCase(901)),10))
two=discover(two,2)
two=assert(Cases.retire(two,2,nil,20))
two=assert(Cases.setAnswers(two,1,{way="person"},50))
two=assert(Cases.setAnswers(two,2,{way="listen"},45))
local _,pick=Cases.pendingSteer(two)
assert(pick==1,"the most recently changed answers win")
two=assert(Cases.setAnswers(two,2,{way="records"},55))
_,pick=Cases.pendingSteer(two)
assert(pick==2,"changing the other case's answers makes it the most recent")
print("PASS with two finished cases the most recently changed answers steer")
