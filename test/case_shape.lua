-- Every generated case keeps the authored three-source event spine. Optional
-- evidence may extend it, but no family metadata reconstructs story prose.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
assert(G.REVISION=="g17-diegetic-immediate-opening" and G.MIN_EVIDENCE==3,
    "the dual-world-evidence revision retains the ordinary three-anchor minimum")
local seen,cases={},0
for seed=1,600 do
    local case=G.generate(catalog,seed,opts)
    if case then
        assert(G.validate(case),"every generated shape must survive validation")
        assert(type(case.story)=="table" and type(case.story.question)=="string" and case.story.question~=""
            and type(case.story.outcome)=="string" and case.story.outcome~=""
            and type(case.story.readings)=="table" and #case.story.readings==2,
            "every case carries its authored local question, outcome and readings")
        assert(case.story.unresolved==nil or (type(case.story.unresolved)=="string" and case.story.unresolved~=""),
            "a remaining question is optional but meaningful when authored")
        local variant=case.outline=="corroboration" and 1 or 2
        local authored=assert(Personal.get(case.premiseId,variant) or Ordinary.get(case.premiseId,variant))
        assert(case.organisation.name==authored.organisation and case.facts.organisation==authored.organisation,
            "the authored organisation is not a random letterhead substitution")
        assert(case.facts.subject==case.story.question and case.facts.unknown==case.story.unresolved,
            "case facts retain the rendered local question and only an authored remaining question")
        assert(case.conspiracyPair and #case.conspiracyPair.theories==2 and case.conspiracyPair.correct==nil,
            "every case belongs to the same unresolved two-theory campaign")
        local ids={};for _,doc in ipairs(case.documents) do ids[doc.id]=true end
        assert(#case.essential==3,"the claim, response and review are all essential")
        local essential={}
        for _,id in ipairs(case.essential) do
            assert(ids[id] and not essential[id],"essential anchors are distinct generated documents")
            essential[id]=true
        end
        assert(#case.documents>=3 and #case.documents<=G.MAX_EVIDENCE,
            "only compatible optional evidence may extend the three anchors")
        seen[case.premiseId]=true;cases=cases+1
    end
end
local familyCount=0;for _ in pairs(seen) do familyCount=familyCount+1 end
assert(cases>0 and familyCount==Premises.choosableCount(),"seed coverage reaches every ordinary metadata family")
print(string.format("PASS case shape: %d generated cases retain three essential authored anchors across %d families",cases,familyCount))
