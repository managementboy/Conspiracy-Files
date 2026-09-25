-- AFTER A PROFESSION OPENING, THE FOLLOW-UP COMES.
--
-- Live test 2026-09-25 (core loop 20260925T204628, the unemployed opening):
-- every clue found, the case complete, and no second case in 150 s. The log
-- said why: "no case: continuation company mismatch". The continuation
-- scenario writes {ORG} and was handed a placeholder company (McCoy Logging),
-- while the thread it followed carried the opening's own - Knox Bank, Sure
-- Fitness, Al's Auto Shop - so the generator refused it, deferred the refusal
-- as "no-containers", and retried into the same refusal. After a profession
-- opening, no second case ever came. That includes the Fitness opening,
-- which no check had followed past its first case.
--
-- Held: the continuation adopts the company (and its grounding) from the
-- thread it follows, for the Fitness family and for an occupation family;
-- an ordinary opening's follow-up is unchanged; a thread without grounding
-- (saved before today) still builds.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Story=require("ConspiracyFiles/Generated/Story")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}
local function opening(profession,seed)
    return assert(G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
        allowSynthetic=true,opening=true,self="Ada Whitlock",profession=profession},sites))
end
local function followUp(first,seed)
    local follows={}
    for k,v in pairs(first.thread) do follows[k]=v end
    follows.fromCase=first.caseId
    assert(Story.validThread(follows,true),"the opening's thread must be a valid thread to follow")
    return G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,follows=follows},sites)
end

for _,profession in ipairs({"fitnessinstructor","unemployed","electrician","nurse"}) do
    local first=opening(profession,7)
    assert(first.thread and first.thread.organisation==first.organisation.name,profession..": the thread carries its company")
    assert(first.thread.grounding,profession..": the thread carries the company's grounding")
    local second,why=followUp(first,8)
    assert(second,profession..": no follow-up came: "..tostring(why))
    assert(G.validate(second),profession..": the follow-up does not rebuild")
    assert(second.organisation.name==first.organisation.name,
        profession..": the follow-up changed company: "..tostring(second.organisation.name))
    assert(second.story.grounding==first.thread.grounding,profession..": the follow-up lost the company's grounding")
    assert(second.premiseId=="still-filing" and second.follows and second.follows.fromCase==first.caseId)
    local named=false
    for _,d in ipairs(second.documents) do if d.body:find(first.organisation.name,1,true) then named=true end end
    assert(named,profession..": the follow-up's papers never name the company it follows")
end

-- A thread saved before grounding existed still builds its follow-up.
local first=opening("fitnessinstructor",7)
local follows={}
for k,v in pairs(first.thread) do follows[k]=v end
follows.fromCase=first.caseId; follows.grounding=nil
assert(Story.validThread(follows,true),"an older thread without grounding is still valid")
local second=assert(G.generateSelected(catalog,9,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,follows=follows},sites))
assert(second.organisation.name==first.organisation.name,"the company is adopted even without grounding")

-- And the refusal itself is gone from the generator.
local f=assert(io.open("mod/common/media/lua/shared/ConspiracyFiles/Generated/Generator.lua","rb"))
local src=f:read("*a"); f:close()
assert(not src:find('return nil,"continuation company mismatch"',1,true),"the follow-up must adopt the company, not refuse it")
print("PASS follow-up: after a profession opening the continuation keeps the company it follows, for every family tried")
