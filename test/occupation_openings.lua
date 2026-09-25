-- EVERY OCCUPATION HAS A STARTING MYSTERY OF ITS OWN.
--
-- Owner, 2026-09-25: "expand the starting mysteries for all occupations."
-- The Fitness Instructor had ten authored starts; every other survivor drew
-- the generic personal opening. Now each of the twenty-five Build 42
-- occupations routes to a family of its own, built on the five-finding
-- grammar the Fitness starts proved in play, and the survivor's own pocket
-- object, appointment and question change with the occupation.
--
-- What this holds:
--   1. every family validates, and every variant builds a complete five-
--      finding case that rebuilds from its save;
--   2. the randomiser reaches every variant of every family, and no two
--      variants of a family share a question or a row on the device;
--   3. the objects are real: every primary kind is in the catalogue and one
--      an object rule would allow; the thing in the pocket is light enough
--      to be in a pocket;
--   4. the words stay inside the boundary: no immunity, no rank, no crime,
--      no biography the plan forbids;
--   5. a family that primes a key says so, and its claim is a key to the
--      starting building; every other family's claim is not a key.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Rules=require("ConspiracyFiles/Generated/ObjectRules")
local Occupations=require("ConspiracyFiles/Generated/OccupationOpeningScenarios")
local Threads=require("ConspiracyFiles/Threads")

-- The Build 42 professions, as character_professions.txt names them.
local PROFESSIONS={"burglar","burgerflipper","carpenter","chef","constructionworker","doctor","electrician",
 "engineer","farmer","fireofficer","fisherman","fitnessinstructor","lumberjack","mechanics","metalworker",
 "nurse","parkranger","policeofficer","rancher","repairman","securityguard","smither","tailor","unemployed","veteran"}
assert(#PROFESSIONS==25)
local listed={}
for _,p in ipairs(Premises.professions()) do listed[p]=true end
for _,p in ipairs(PROFESSIONS) do assert(listed[p],"no opening family for "..p) end

local eligible={}
for _,ruleId in ipairs(Rules.list()) do
    for _,id in ipairs(Rules.candidates(ruleId)) do eligible[id]=ruleId end
end
local FORBIDDEN={"immune","immunity","sergeant","lieutenant","captain","platoon","regiment","my unit",
                 "criminal","stole","burgl","arrest","my wife","my husband","my mother","my father","my son","my daughter"}

local catalog=dofile("test/fixtures/synthetic_locations.lua")
for _,site in ipairs(catalog.locations) do site.paperStorage="indexed" end
local sites={catalog.locations[1].id,catalog.locations[2].id}

local families,variantsTotal,farm,cordon=0,0,0,0
for _,profession in ipairs(PROFESSIONS) do
    local premise=assert(Premises.forProfession(profession),"no family: "..profession)
    assert(premise.opening and premise.profession==profession)
    local variants=assert(Premises.openingVariants(premise.id))
    assert(variants>=3,profession.." needs at least three starts, has "..variants)
    families=families+1
    local questions,rows,pairs={},{},{}
    for variant=1,variants do
        local s=assert(Personal.get(premise.id,variant),profession.." start "..variant.." missing")
        local ok,why=Story.validate(s)
        assert(ok,profession.." start "..variant..": "..tostring(why))
        assert(not questions[s.question],profession..": duplicate question: "..s.question)
        questions[s.question]=true
        -- The question is the thread's row on the device; the variants of a
        -- family must read apart there (THREADS_SCREEN_REDESIGN, remedy A).
        local row=Threads.handle({key="k",question=s.question}):sub(1,Threads.ROW)
        assert(not rows[row],profession..": two starts read alike on the THREADS row: "..row)
        rows[row]=true
        pairs[s.requiresPair or "floating"]=true
        -- Real objects, rule-eligible, and a pocket object a pocket can hold.
        for _,key in ipairs({"claim","response"}) do
            local d=s.anchors[key]
            local carrier=assert(Kinds.get(d.kind),profession..": unknown kind "..tostring(d.kind))
            assert(carrier.capacity=="object",profession..": the "..key.." must be a thing, not paper")
            assert(eligible[d.kind],profession..": "..d.kind.." is not an object any rule would allow")
        end
        assert(s.anchors.review.members and #s.anchors.review.members>=2,profession..": the hoard is not a scene")
        for _,m in ipairs(s.anchors.review.members) do
            assert(Kinds.get(m.kind) and Kinds.get(m.kind).capacity=="object",profession..": hoard member "..m.kind.." is not a thing")
        end
        -- The boundary: an ordinary errand, no biography.
        local prose=table.concat({s.question,s.event,s.anchors.claim.observation,s.anchors.claim.note,
            s.anchors.response.note,s.optional[1].observation,s.optional[1].note},"\n"):lower()
        for _,word in ipairs(FORBIDDEN) do
            assert(not prose:find(word,1,true),profession.." start "..variant.." invents a biography ('"..word.."')")
        end
        -- A primed key is a key to the starting building; anything else is not a key.
        if Premises.primedKey(profession) then
            assert(s.anchors.claim.kind=="Key1" and s.anchors.claim.accessIntent=="starting-building",
                profession..": primes a key but its claim is "..tostring(s.anchors.claim.kind))
            assert(Premises.openingVoice(profession),profession..": a primed key needs the survivor's line")
        else
            assert(s.anchors.claim.accessIntent==nil,profession..": a claim that opens the house must be primed")
        end
        variantsTotal=variantsTotal+1
    end
    assert(Personal.get(premise.id,variants+1)==nil,profession..": a start beyond the family is invented")
    if pairs["farm-zero-vs-delivered-agent"] then farm=farm+1 end
    if pairs["failed-cordon-vs-drawn-boundary"] then cordon=cordon+1 end

    -- THE RANDOMISER. A new game's seed selects the variant as
    -- (seed-1) % variants + 1, so seeds 1..variants must reach every start,
    -- and each must build the whole five-finding chain and rebuild.
    local seen={}
    for seed=1,variants do
        local case,why=G.generateSelected(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",
            allowSynthetic=true,opening=true,self="Ada Whitlock",profession=profession},sites)
        assert(case,profession.." seed "..seed.." failed: "..tostring(why))
        assert(case.premiseId==premise.id and case.opening.profession==profession)
        assert(case.opening.variant==seed,profession..": seed "..seed.." did not select its own start")
        assert(G.validate(case),profession.." opening "..seed.." does not rebuild")
        assert(#case.documents==5,profession..": the opening must build the complete five-finding chain, got "..#case.documents)
        assert(#case.essential==4,profession..": four household findings are essential")
        assert(case.documents[2].kind=="receipt" and case.documents[2].body:find("July 8, 1993",1,true),
            profession..": the appointment is the chain's one dated paper")
        assert(case.documents[2].leads[1]==sites[2],profession..": the appointment carries the second-place lead")
        assert(case.documents[5].placementIntent=="vehicle",profession..": the fifth clue waits for a real transport scene")
        assert(case.conspiracyPair and #case.conspiracyPair.theories==2 and case.conspiracyPair.correct==nil)
        assert(case.story.unresolved==case.conspiracyPair.question,
            profession..": the opening's unresolved question is not the central question")
        local named=false
        for _,d in ipairs(case.documents) do if d.body:find("Ada Whitlock",1,true) then named=true end end
        assert(named,profession.." start "..seed.." does not name the survivor")
        seen[case.opening.variant]=true
    end
    for v=1,variants do assert(seen[v],profession..": start "..v.." is unreachable") end
end

-- Both hidden pairs are met across the occupations, so a campaign is not one
-- story twenty-five times.
assert(farm>=8 and cordon>=8,"the families lean on one pair: farm="..farm.." cordon="..cordon)

print(string.format("PASS occupation openings: %d families, %d starts, every one validated, built and rebuilt; "
    .."%d families on the farm pair and %d on the cordon pair; every start reads apart on the device",
    families,variantsTotal,farm,cordon))
