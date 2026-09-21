-- WHICH OF THE TWO CONTINUITY MECHANISMS SHAPES THE NEXT CASE.
--
-- The campaign gate failed on 2026-09-21 with eleven failures whose single
-- cause was recorded as "case 1's answers steer case 3 instead of case 2",
-- and that was written up as the release blocker. It is not a defect.
--
-- There are TWO mechanisms, and they are not equals:
--
--   a THREAD  what the survivor FOUND and where (Session.thread)
--   a STEER   what the survivor CONCLUDED, from the three closing questions
--
-- DR-20260919-CONTINUITY settles the order: "continuity carries discovered
-- evidence, not selected opinions... The three closing questions are NOT
-- restored as the steering mechanism; the discarded hunch system stays
-- discarded." GeneratedRuntime follows it: a pending thread wins and "the
-- steer is left alone for the case after".
--
-- So a finished case that leaves BOTH gives the next case its thread and the
-- one after its steer. The gate asserted the older P4-R113 rule, saw exactly
-- that, and blamed the mod.
--
-- This test pins the real contract from both sides, so neither the rule nor
-- the gate's reading of it can drift again.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
local function opts(extra)
    local o={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
    for k,v in pairs(extra or {}) do o[k]=v end
    return o
end
local function makeCase(seed,extra)
    for s=seed,seed+60 do
        local case=G.generate(catalog,s,opts(extra))
        if case then return case end
    end
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
local function playThrough(wrapper,index)
    local root=Cases.sessions(wrapper)[index]
    local api=assert(Session.open(root,function(staged)
        wrapper=assert(Cases.replace(wrapper,index,staged)) end))
    for _,doc in ipairs(root.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(root.case.documents) do assert(api.inspect(doc.id)) end
    return wrapper
end
local ANSWERS={reading="two",matters="person2",way="records"}

-- A finished case with answers and NO thread, which is the clean case.
local function finishedWithAnswers(seed,hours)
    local w={canonical=rootOf(makeCase(seed)),schedule={schema=1,createdHours={0}}}
    w=playThrough(w,1)
    w=assert(Cases.retire(w,1,nil,hours))
    -- Some generated cases record a thread of their own; clear it so this
    -- fixture isolates the steer. The thread half is exercised below.
    local root=Cases.sessions(w)[1]
    if root.thread~=nil then
        local bare={} for k,v in pairs(root) do bare[k]=v end
        bare.thread=nil
        w=assert(Cases.replace(w,1,bare))
    end
    w=assert(Cases.setAnswers(w,1,ANSWERS,hours+1))
    return w
end

-- ---------------------------------------------------------------- 1. no thread
local w=finishedWithAnswers(601,30.5)
local first=Cases.sessions(w)[1]
assert(Retired.isRetired(first),"case 1 must be finished")
assert(first.answers and first.answers.usedBy==nil,"case 1's answers are unused")

-- (a) the answers are AVAILABLE BEFORE case 2 is generated
local steer,index=Cases.pendingSteer(w)
assert(steer,"case 1's answers must be available to steer the next case")
assert(steer.fromCase==first.caseId,"the steer must name case 1")
assert(steer.reading=="two" and steer.way=="records","the steer carries the answers")
assert(index==1,"the steer comes from case 1")
assert(Cases.pendingThread(w)==nil,"this fixture deliberately has no thread")

-- (b) case 2 receives EXACTLY those answers
local second=makeCase(802,{steer=steer})
assert(second.steer and second.steer.fromCase==first.caseId,
    "case 2 must be built from case 1's answers")
assert(second.steer.reading==ANSWERS.reading and second.steer.way==ANSWERS.way,
    "case 2 must receive the answers unchanged, not a remapped subset")

-- (c) staging case 2 marks case 1's answers used, in the same swap
local staged=assert(Cases.stage(w,rootOf(second),40,1),
    "case 2 must stage against the answers it was built from")
assert(Cases.sessions(staged)[1].answers.usedBy==second.caseId,
    "case 1's answers must be marked used by case 2")
assert(Cases.sessions(w)[1].answers.usedBy==nil,"the old wrapper is untouched")

-- (d) case 3 does NOT receive them
assert(Cases.pendingSteer(staged)==nil,
    "used answers must never steer a third case")

-- (e) save and reload preserves all of it
local reloaded=assert(Cases.restore and Cases.restore(staged) or staged)
local rs=Cases.sessions(reloaded)[1]
assert(rs.answers.usedBy==second.caseId,
    "the used mark must survive a reload")
assert(Cases.pendingSteer(reloaded)==nil,
    "after a reload the used answers still steer nothing")
print("PASS steer precedence: with no thread pending, case 1's answers reach "
    .."case 2, are marked used by it, never reach case 3, and survive a reload")

-- ------------------------------------------------------------- 2. no threads
-- The first diagnosis of this failure was that a pending THREAD had taken
-- precedence and deferred the steer, which GeneratedRuntime does do and
-- DR-20260919-CONTINUITY does require. It is not what happened: measured over
-- 200 generated cases on this fixture, NONE carries a case.thread, so
-- pendingThread can never fire for a generated case and the thread branch is
-- dead for them. Kept as an assertion so the day a generator starts emitting
-- threads, the precedence question comes back deliberately rather than by
-- surprise.
local threads=0
for seed=1,200 do
    local c=G.generate(catalog,seed,opts())
    if c and type(c.thread)=="table" then threads=threads+1 end
end
assert(threads==0,
    threads.." of 200 generated cases now carry a thread. The thread branch in "
    .."GeneratedRuntime.prepare is no longer dead code, so a case that leaves "
    .."BOTH a thread and unused answers is now reachable and its precedence "
    .."must be exercised here rather than assumed")
print("PASS steer precedence: no generated case carries a thread, so the thread "
    .."branch cannot be what deferred the answers")

-- The ORDER is the runtime's, so assert it where it is written. A test that
-- only checked the modules would have passed throughout the failure.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","rb"))
local runtime=f:read("*a"); f:close()
local block=runtime:match("local okThread,thread=pcall%(Cases%.pendingThread,wrapper%)(.-)\n        end")
assert(block,"the runtime must choose between a thread and a steer in one place")
assert(block:find("options.follows=thread",1,true),
    "a pending thread must become the next case's follows")
assert(block:find("else",1,true) and block:find("options.steer=steer",1,true),
    "the steer must be read ONLY when no thread is pending")
local threadAt=runtime:find("options.follows=thread",1,true)
local steerAt=runtime:find("options.steer=steer",1,true)
assert(threadAt<steerAt,
    "DR-20260919-CONTINUITY: the thread is tried first and the steer is left "
    .."for the case after; reversing them restores the discarded hunch system")
-- AND IT MUST NEVER FAIL IN SILENCE. Both lookups are wrapped in pcall, and a
-- pcall that swallows its error degrades the feature invisibly: no steer, no
-- follows, no refusal, nothing in the log - which is why the campaign gate's
-- eleven failures came with no evidence of a cause. Same shape as
-- offerContainer swallowing getParent for every container the game filled.
assert(runtime:find('log("continuity: pendingSteer failed',1,true),
    "a pendingSteer that raises must say so; otherwise the survivor's answers "
    .."are dropped with nothing in the log to show it")
assert(runtime:find('log("continuity: pendingThread failed',1,true),
    "a pendingThread that raises must say so")
assert(runtime:find('log("continuity: no unused answers',1,true),
    "an unsteered case must distinguish 'nothing to steer with' from 'the "
    .."lookup broke'; they are different facts and only one is a fault")

print("PASS steer precedence: the runtime tries the thread first and falls back "
    .."to the steer per DR-20260919-CONTINUITY, and neither lookup can fail in "
    .."silence")
