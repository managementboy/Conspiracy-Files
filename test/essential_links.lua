-- MISSING ESSENTIAL EVIDENCE IS NOT AN ORDINARY COMPLETION.
--
-- DR-20260919-GAP-NOT-PROGRESSION: honest closing wording fixes misleading
-- REPORTING; it does not deliver a payoff. A case that ended without a clue its
-- conclusion rests on has not solved anything, however ruefully it says so.
--
-- Until now every clue in a case was equal, so "missing an essential link"
-- could not be detected at all - which is why that requirement stayed open
-- after the gap wording landed. The opening pair is the first thing to need it
-- (OPENING_PAIR_COMPLETION.md links A and C).
--
-- The distinction this file defends:
--   complete-with-gaps    finished, and lost a corroborating scrap. The payoff
--                         stands.
--   incomplete-essential  finished, and lost something the CONCLUSION rests on.
--                         No payoff, no closing question.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end

-- ---------------------------------------------------------------------------
-- 1. The premise declares its chain, and the case records the ids ---------
-- ---------------------------------------------------------------------------
local opening=assert(Personal.get("no-contact-at-premises",1))
assert(type(opening.essential)=="table","the opening declares its essential links")
assert(#opening.essential==3,"the authored opening needs all three source records: got "..#opening.essential)
local declared={}
for _,name in ipairs(opening.essential) do declared[name]=true end
assert(declared.claim,"link A, the retained slip, is essential")
assert(declared.response,"link C, the matching record, is essential")
assert(declared.review,"the third record establishes the recorded local result")

local built
for seed=101,180 do
    built=G.generate(catalog(),seed,{mapId=OPTS.mapId,buildLine=OPTS.buildLine,
        allowSynthetic=true,opening=true,self="Ada Whitlock"})
    if built then break end
end
assert(built,"the opening generates")
assert(built.story and type(built.essential)=="table" and #built.essential==3,"the authored opening records three essential document ids")
local byId={}
for _,d in ipairs(built.documents) do byId[d.id]=d end
for _,id in ipairs(built.essential) do assert(byId[id],"each essential id is one of the case's own documents: "..id) end
assert(byId[built.essential[1]].title:lower():find("collection slip",1,true),"the first is the slip")
assert(byId[built.essential[2]],"the intervening action is essential")
assert(byId[built.essential[3]],"the recorded result is essential")
assert(G.validate(built),"and the case validates with the field")

-- A corrupted list is refused rather than half-trusted.
local bad
for seed=101,180 do bad=G.generate(catalog(),seed,{mapId=OPTS.mapId,buildLine=OPTS.buildLine,
    allowSynthetic=true,opening=true,self="Ada Whitlock"}); if bad then break end end
bad.essential={"not-a-document-of-this-case"}
assert(not G.validate(bad),"an essential id the case does not have is refused")

print("PASS essential links: the premise declares its chain and the case records it")

-- ---------------------------------------------------------------------------
-- 2. An essential gap is its own state ------------------------------------
-- ---------------------------------------------------------------------------
local function rootWith(caseTable,dropped,known)
    local assign={}
    for _,d in ipairs(caseTable.documents) do
        assign[d.id]={status="placed"}
    end
    for _,id in ipairs(dropped) do assign[id]={status="dropped",droppedFrom="deferred"} end
    return {case=caseTable,assignments=assign,known=known}
end

local essentialId=built.essential[1]
-- Pure state fixture: the authored opening has three essential sources, so a
-- separate declared optional source demonstrates the corroborating-gap state.
local optionalCase={documents={{id="claim"},{id="response"},{id="review"},{id="optional"}},essential={"claim","response","review"}}
local corroborating="optional"

-- Everything found: a clean completion.
local allFound={}
for _,d in ipairs(built.documents) do allFound[#allFound+1]=d.id end
local whole=rootWith(built,{},allFound)
assert(S.completion(whole)==S.COMPLETE,"every clue found is complete")
assert(#S.essentialGaps(whole)==0,"with no essential gap")

-- A CORROBORATING clue lost: complete-with-gaps. The payoff stands.
local scrapLost=rootWith(optionalCase,{corroborating},{"claim","response","review"})
local state,gaps=S.completion(scrapLost)
assert(state==S.WITH_GAPS,
    "losing a corroborating clue is complete-with-gaps, not incomplete: got "..tostring(state))
assert(#gaps==1,"with one gap")
assert(#S.essentialGaps(scrapLost)==0,"and no ESSENTIAL gap")

-- AN ESSENTIAL clue lost: incomplete. No payoff.
local knownButEssential={}
for _,d in ipairs(built.documents) do if d.id~=essentialId then knownButEssential[#knownButEssential+1]=d.id end end
local payoffLost=rootWith(built,{essentialId},knownButEssential)
state,gaps=S.completion(payoffLost)
assert(state==S.INCOMPLETE,
    "losing an essential clue is INCOMPLETE, not an ordinary gap: got "..tostring(state))
assert(state~=S.WITH_GAPS,"and specifically not complete-with-gaps - that would claim a payoff")
local ess=S.essentialGaps(payoffLost)
assert(#ess==1 and ess[1]==essentialId,"and it names the clue the conclusion rested on")
-- It is still accounted for: the case may close its bookkeeping and free its
-- slot (P4-R142). What it may not do is claim it delivered anything.
assert(S.accounted(payoffLost),"an incomplete case is still accounted for, so it does not hold a slot for ever")

local noEssential={documents={{id="only"}}}
local ordLost=rootWith(noEssential,{"only"},{})
assert(S.completion(ordLost)==S.WITH_GAPS,"a pure no-essential state remains complete-with-gaps")
print("PASS essential links: an essential gap is incomplete, a corroborating one is not")

-- ---------------------------------------------------------------------------
-- 3. The state survives retirement and the archive -----------------------
-- ---------------------------------------------------------------------------
-- A finished case must still be able to say it never delivered. Otherwise the
-- record shows an investigation that looks solved.
local carried=S.retiredGapFields(payoffLost)
assert(carried.completion==S.INCOMPLETE,"a retiring incomplete case carries that state")
assert(#carried.gaps==1 and carried.gaps[1]==essentialId,"and which clue it was")
assert(carried.gapsFrom and carried.gapsFrom[essentialId]=="deferred","and the drop path")

local retiredLike={schema=Retired.SCHEMA,caseId="c1",rows={},known={"x"},
                   completion=carried.completion,gaps=carried.gaps,gapsFrom=carried.gapsFrom}
assert(S.completion(retiredLike)==S.INCOMPLETE,
    "and a retired record still reports INCOMPLETE rather than a clean finish")
print("PASS essential links: an incomplete case still says so after retirement and archiving")

-- ---------------------------------------------------------------------------
-- 4. The closing words and the closing question do not fire --------------
-- ---------------------------------------------------------------------------
-- The runtime chooses the voice from essentialGaps. Asserted here as the
-- contract the runtime relies on, and the voice's own lines are checked for the
-- fates they may not claim (P4-R104).
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua"))
local voice=f:read("*a"); f:close()
assert(voice:find("SET_F_OPEN",1,true),"the voice has lines for a case with a hole in it")
assert(voice:find("function V.onCaseIncomplete",1,true),"and an entry point the runtime can call")
local openSet=voice:match("SET_F_OPEN=%{(.-)%}")
assert(openSet,"the set is readable")
for _,word in ipairs({"lost","taken","destroyed","stolen"}) do
    assert(not openSet:lower():find(word,1,true),
        "an incomplete closing line never claims a document's fate: found \""..word.."\"")
end
-- And it must NOT ask the closing question: onCaseComplete says "What do I make
-- of it?", onCaseIncomplete must not.
local incompleteFn=voice:match("function V%.onCaseIncomplete.-\nend")
assert(incompleteFn,"the function body is readable")
assert(not incompleteFn:find("What do I make of it",1,true),
    "an unfinished investigation is never asked what to make of it")

local rt=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua"))
local runtime=rt:read("*a"); rt:close()
local _,calls=runtime:gsub("Session%.essentialGaps%(done%)","")
assert(calls==2,"both completion paths - inspection and drop - ask about essential gaps: got "..calls)
local _,guards=runtime:gsub("if #essential==0 then","")
assert(guards==2,"and both guard the closing voice on it: got "..guards)
print("PASS essential links: no closing words and no closing question for an unfinished investigation")
