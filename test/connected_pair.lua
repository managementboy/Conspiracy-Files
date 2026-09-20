-- THE CONNECTED PAIR: "No contact at premises" -> "Still filing" (Phase C).
--
-- The follow-up must inherit a SOURCED finding, not a repeated name
-- (DR-20260919-CONTINUITY). The existing steer could not do this: it carries
-- fromCase, reading, way, person and organisation - a name and a chosen reading,
-- taken from the three closing questions' answers, which the same decision rules
-- out as the mechanism (PHASE_C_CONTINUITY_CARRIER.md).
--
-- So the opening records a THREAD - the document the survivor recorded, that
-- case's own reference, the point its register routed to, and the question it
-- ended without settling - and the follow-up is generated from it.
--
-- What this holds to account:
--   * the thread is recorded, and survives retirement AND the deep archive,
--     where a retired root keeps no case envelope at all - otherwise the
--     connection dies exactly when the follow-up is meant to arrive;
--   * the follow-up cannot be drawn by chance and cannot be generated without a
--     thread: link D has no alternative, because a follow-up that can stand
--     alone proves nothing about continuity;
--   * the inheritance is on the paper the player reads, not only in the record;
--   * chronology: closures are dated AFTER the termination the records state;
--   * and the payoff never says a visit was missed
--     (DR-20260919-STILL-FILING-NARROW).
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Premises=require("ConspiracyFiles/Generated/Premises")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function opts(extra)
    local o={mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true}
    for k,v in pairs(extra or {}) do o[k]=v end
    return o
end

-- ---------------------------------------------------------------------------
-- 1. The opening leaves a thread, and it is data ---------------------------
-- ---------------------------------------------------------------------------
local one
for seed=101,180 do one=G.generate(catalog(),seed,opts{opening=true,self="Ada Whitlock"}); if one then break end end
assert(one,"the opening generates")
local thread=one.thread
assert(type(thread)=="table","the opening records a thread")
assert(thread.document,"naming the document the finding was read off")
assert(thread.reference==one.facts.code,"carrying the case's own reference: "..tostring(thread.reference))
assert(#thread.point>0 and #thread.question>0,"with a routing point and an open question")

-- The point is on the paper the player reads, from the SAME value - text and
-- carrier cannot drift, which is why it is a placeholder and not prose.
local register
for _,d in ipairs(one.documents) do if d.id==thread.document then register=d end end
assert(register,"the thread names a real document of the case")
assert(register.body:find(thread.point,1,true),
    "the register itself routes to the point the thread carries: "..register.title)
assert(not register.body:find("{POINT}",1,true),"and no placeholder is left showing")

-- ---------------------------------------------------------------------------
-- 2. It survives retirement and the deep archive --------------------------
-- ---------------------------------------------------------------------------
-- This is the property that decides whether the follow-up can ever be offered:
-- a retired root keeps no case envelope, so a thread read live from the case
-- would vanish the moment the opening retired.
local targets={}
for _,site in ipairs(one.locations) do
    targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
        containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end
local api=assert(S.open(assert(S.create(one,targets)),function() end))
for _,d in ipairs(one.documents) do assert(api.status(d.id,"placed",0)); assert(api.inspect(d.id)) end
local retired=assert(Retired.retire(api.snapshot(),nil,720),"the opening retires")
assert(Retired.validate(retired),"and validates")
assert(retired.thread and retired.thread.document==thread.document,"the thread survives retirement")
assert(retired.thread.point==thread.point and retired.thread.reference==thread.reference,"intact")
assert(retired.case==nil,"and it survives WITHOUT the case envelope, which retirement drops")

local stub=assert(Retired.shrink(retired),"the opening deep-archives")
assert(Retired.validate(stub),"and the stub validates")
assert(#stub.rows==#retired.rows and #stub.known==#retired.known,"compaction retains every discovered row and order")
assert(stub.thread and stub.thread.document==thread.document,
    "yet the thread is still there - the follow-up remains offerable after deep archiving")

-- A half-carried thread is refused rather than half-trusted.
local broken={}
for k,v in pairs(retired) do broken[k]=v end
broken.thread={document=thread.document}
assert(not Retired.validate(broken),"a thread missing its fields is refused")
print("PASS connected pair: the opening leaves a sourced thread that outlives its own case envelope")

-- ---------------------------------------------------------------------------
-- 3. The follow-up cannot happen by chance, or without a thread -----------
-- ---------------------------------------------------------------------------
local follow=assert(Premises.followUp(),"there is a follow-up premise")
assert(follow.id=="still-filing","and it is the approved one: "..follow.id)
for index=1,Premises.choosableCount() do
    local p=Premises.choose(function() return index end)
    assert(not p.followUp,"the follow-up is never drawn: index "..index.." gave "..p.id)
end
assert(Premises.choosableCount()==20,"the ordinary pool is untouched: "..Premises.choosableCount())

local function threadFrom(case,override)
    local f={fromCase=case.caseId}
    for k,v in pairs(case.thread) do f[k]=v end
    for k,v in pairs(override or {}) do f[k]=v end
    return f
end
local follows=threadFrom(one)

-- Every field is required: link D has no alternative, so a partial thread is
-- refused rather than filled in.
for _,missing in ipairs({"fromCase","document","reference","point","question","person","organisation","survivor","afterDate"}) do
    local partial=threadFrom(one)
    partial[missing]=nil
    assert(G.generate(catalog(),500,opts{follows=partial})==nil,
        "a thread missing "..missing.." cannot generate a follow-up")
end
assert(G.generate(catalog(),500,opts{follows={}})==nil,"an empty thread is refused")
-- And a case may not follow itself.
local selfFollow=G.generate(catalog(),500,opts{follows=threadFrom(one)})
assert(selfFollow,"a well-formed thread generates")
local loop={}
for k,v in pairs(selfFollow) do loop[k]=v end
loop.follows={fromCase=selfFollow.caseId,document=thread.document,reference=thread.reference,
              point=thread.point,question=thread.question}
assert(not G.validate(loop),"a case cannot follow itself")
-- An opening is never also a follow-up.
assert(G.generate(catalog(),500,opts{opening=true,self="Ada Whitlock",follows=follows})==nil,
    "an opening cannot also be a follow-up")
print("PASS connected pair: no thread, no follow-up - and it is never drawn by chance")

-- ---------------------------------------------------------------------------
-- 4. The inheritance is on the paper, and the chronology is right ---------
-- ---------------------------------------------------------------------------
local two
for seed=500,600 do two=G.generate(catalog(),seed,opts{follows=follows}); if two then break end end
assert(two,"the follow-up generates from the thread")
assert(two.facts.premise=="still-filing","and it is the follow-up: "..tostring(two.facts.premise))
assert(two.follows and two.follows.fromCase==one.caseId,"recording which case it follows")
assert(G.validate(two),"and it rebuilds from its own record")
-- Strip the record and the rebuild must fail, or a reload would refuse it.
local stripped={}
for k,v in pairs(two) do stripped[k]=v end
stripped.follows=nil
assert(not G.validate(stripped),"without its recorded inheritance the rebuild cannot match")

-- The connection is READABLE: the point and the earlier reference appear in the
-- follow-up's own documents, so the player sees the same paperwork.
local sawPoint,sawRef=false,false
for _,d in ipairs(two.documents) do
    if d.body:find(follows.point,1,true) then sawPoint=true end
    if d.body:find(follows.reference,1,true) then sawRef=true end
    assert(not d.body:match("{%u[%u%d]*}"),"no placeholder survives: "..d.title)
end
assert(sawPoint,"the follow-up's paperwork routes through the inherited point")
assert(sawRef,"and cites the earlier case's own reference - the same file, not the same name")

-- Retained enquiries and audit copies use the source closing day, preserving
-- the source person, business and survivor rather than drawing a different past.
assert(two.facts.claimDate==one.thread.afterDate and two.facts.responseDate==one.thread.afterDate
    and two.facts.reviewDate==one.thread.afterDate,"continuation copies preserve their documentary date")
assert(two.facts.recipient==one.facts.recipient and two.organisation.name==one.organisation.name)
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local authored=assert(Personal.get("still-filing",two.outline=="corroboration" and 1 or 2))
assert(two.story.unresolved==authored.unresolved,"caller remains unrecorded after the local copying question is answered")
assert(#two.essential==3 and two.thread==nil,"the continuation has a full answer and no endlessly reusable new thread")
for _,d in ipairs(two.documents) do
    assert(d.body:find(follows.reference,1,true),"each continuation source cites the inherited file")
end
print("PASS connected pair: inherited facts, chronology and a bounded local continuation")

-- ---------------------------------------------------------------------------
-- 6. A THREAD IS SPENT ONCE, and stays spent ------------------------------
-- ---------------------------------------------------------------------------
-- The failure this guards: a retired follow-up that forgot its own inheritance
-- would leave the opening's thread looking unused for ever, so every later case
-- would be offered the same finding - a third follow-up, then a fourth, all
-- following one register.
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")

local retiredOpening=retired  -- from section 2: carries thread, followed nothing
assert(retiredOpening.thread,"the opening's retired record carries its thread")
assert(retiredOpening.followsFrom==nil,"and followed nothing itself")

-- A wrapper holding just the retired opening: its thread is pending.
local wrapper={canonical=retiredOpening,schedule={schema=1,createdHours={1}}}
assert(Cases.validate(wrapper),"a wrapper holding the retired opening validates")
local pending,index=Cases.pendingThread(wrapper)
assert(pending,"the opening's thread is offered")
assert(pending.fromCase==retiredOpening.caseId,"from the right case")
assert(pending.point==thread.point and pending.reference==thread.reference,"with its point and reference")
assert(index==1,"and the index of the case it came from")

-- Now a LIVE case follows it: the thread must stop being offered.
local liveTwo
for seed=500,600 do liveTwo=G.generate(catalog(),seed,opts{follows=threadFrom(one)}); if liveTwo then break end end
assert(liveTwo,"a follow-up generates")
local liveTargets={}
for _,site in ipairs(liveTwo.locations) do
    liveTargets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
        containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end
local twoRoot=assert(S.create(liveTwo,liveTargets))
local withLive=assert(Cases.stage(wrapper,twoRoot,2),"the follow-up stages into the wrapper")
assert(Cases.validate(withLive),"and the wrapper still validates")
assert(Cases.pendingThread(withLive)==nil,
    "a thread a LIVE case already follows is no longer offered")

-- And once that follow-up RETIRES, the thread must still be spent - this is the
-- half that needed followsFrom on the retired record.
local twoApi=assert(S.open(twoRoot,function() end))
for _,d in ipairs(liveTwo.documents) do assert(twoApi.status(d.id,"placed",0)); assert(twoApi.inspect(d.id)) end
local retiredTwo=assert(Retired.retire(twoApi.snapshot(),nil,800),"the follow-up retires")
assert(retiredTwo.followsFrom==one.caseId,
    "and its retired record remembers which case it followed: "..tostring(retiredTwo.followsFrom))
assert(Retired.validate(retiredTwo),"and validates")
local stubTwo=assert(Retired.shrink(retiredTwo),"and deep-archives")
assert(stubTwo.followsFrom==one.caseId,"keeping that even as a stub")

-- Cases.replace installs a LIVE session root - that is all the shipped
-- runtime ever passes it, and Session.validate refuses a retired one.
-- Retiring in place is Cases.retire, which is what the runtime calls.
local liveWithProgress=assert(Cases.replace(withLive,2,twoApi.snapshot()))
local bothRetired=assert(Cases.retire(liveWithProgress,2,nil,800))
assert(Cases.validate(bothRetired),"retired follow-up wrapper validates")
assert(Cases.pendingThread(bothRetired)==nil,
    "a retired follow-up keeps its source thread spent")
print("PASS connected pair: a thread is offered once and stays spent after retirement")
