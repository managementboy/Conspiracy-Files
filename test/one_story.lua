-- Each source has an authored role; comparisons use only discovered sources.
-- A family reference by itself is not a story, and unseen titles are knowledge.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local seen,checked={},0
for seed=1,400 do
    local case=assert(G.generate(catalog,seed,opts))
    local variant=case.outline=="corroboration" and 1 or 2
    local authored=assert(Ordinary.get(case.premiseId,variant))
    assert(case.story.question~="" and case.story.event~="" and case.story.outcome~="")
    local sources={authored.anchors.claim,authored.anchors.response,authored.anchors.review}
    for i=1,3 do
        local doc=case.documents[i]
        assert(doc.kind==sources[i].kind,"source identity determines its actual carrier")
        local title=sources[i].title:gsub("{CODE}",case.facts.code)
        assert(doc.title==title,"source title must describe the authored evidence")
        assert(Pages.text(doc.body)~=doc.body,"source-only page excludes observation and interpretation")
        local rows=assert(G.project(case,{doc.id}))
        assert(#rows==1 and rows[1].id==doc.id and rows[1].body==doc.body)
        assert(#rows[1].connections==0 and rows[1].unseen==nil,"one source leaks no unseen title or comparison")
    end
    local known={case.documents[3].id,case.documents[1].id,case.documents[2].id}
    local rows=assert(G.project(case,known))
    local complete
    for _,finding in ipairs(case.story.comparisons) do
        if #finding.requires==3 then complete=finding;break end
    end
    assert(complete,"a three-source local finding is authored")
    local displayed=false
    for i,row in ipairs(rows) do
        assert(row.id==known[i],"projection preserves discovery order")
        if row.id==complete.from then
            assert(row.body:find(complete.text,1,true),"supported local answer must become readable")
            displayed=true
        end
    end
    assert(displayed)
    seen[case.premiseId..":"..variant]=true;checked=checked+1
end
local count=0;for _ in pairs(seen) do count=count+1 end
assert(checked==400 and count==40,"all ordinary variants must be exercised")
print("PASS one story: authored sources, no unseen titles, supported local answer in discovery order")
