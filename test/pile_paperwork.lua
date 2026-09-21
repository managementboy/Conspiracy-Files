-- Physical and optional evidence must belong to the selected authored event.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local physical={key=true,photograph=true}
local seen,optionalSeen,cases,objects=0,0,0,0
local function expand(value,c)
    local v=G.dateFields(c.facts)
    v.CODE=c.facts.code;v.ORG=c.facts.organisation;v.P1=c.facts.sender;v.P2=c.facts.recipient
    v.A=c.locations[1].name;v.B=c.locations[2].name
    return (value:gsub("{([%u%d]+)}",function(k) return assert(v[k],"unbound scenario slot "..k) end))
end
for seed=1,400 do
    local c=G.generate(catalog,seed,opts)
    if c then
        cases=cases+1
        assert(G.validate(c) and #c.essential==3)
        local scenario=assert(Ordinary.get(c.premiseId,c.outline=="corroboration" and 1 or 2))
        local allowed={}
        for _,extra in ipairs(scenario.optional or {}) do allowed[expand(extra.title,c)]=extra end
        for i,doc in ipairs(c.documents) do
            local carrier=assert(Kinds.get(doc.kind))
            local object=carrier.capacity=="object"
            -- Owner's decision, 2026-09-21: an object belongs to its authored
            -- event, exactly as every other piece of optional evidence does.
            -- So a pile is no longer forbidden outright - it is forbidden
            -- unless THIS event declared it, which the checks below enforce
            -- document by document. `onPaper` stays banned: nothing attaches a
            -- generic written page to a case.
            assert(doc.onPaper==nil,"no unrelated generic page may be attached")
            assert(doc.quantity==nil or object,"only an object is found in a count")
            if i>3 then
                optionalSeen=optionalSeen+1
                local declared=assert(allowed[doc.title],"optional source not declared by this event: "..doc.title)
                assert(doc.kind==declared.kind)
                -- Nothing is written on an object, so its record is the sight
                -- and the reading run together; a document gets the page.
                local expected=object
                    and (expand(declared.observation,c).." "..expand(declared.source,c).." "..expand(declared.note,c))
                    or Story.body(expand(declared.observation,c),expand(declared.source,c),expand(declared.note,c))
                assert(doc.body==expected,
                    "optional observation, source and interpretation must describe this event")
                allowed[doc.title]=nil -- no duplicate contribution
                if object then
                    objects=objects+1
                    assert(doc.wear,"an object must say what state it was found in")
                    assert(doc.quantity==declared.quantity,"a pile must be the count its event declared")
                    assert(doc.roomIntent==declared.roomIntent,"a pile's room intent must be the one its event declared")
                    -- An object carries no case reference: the file number is
                    -- on paper, and a wrench with a case number stamped on it
                    -- would be the mod writing on the evidence.
                    assert(not doc.title:find(c.facts.code,1,true),"an object must not carry a written case reference")
                elseif physical[doc.kind] then
                    seen=seen+1
                    assert(doc.body:find(c.facts.code,1,true),"physical optional evidence identifies its actual file")
                end
            end
        end
    end
end
assert(cases>0 and optionalSeen>0 and seen>0,"must exercise actual generated physical optional sources")
assert(objects>0,"must exercise actual generated objects")
print(string.format("PASS every generated optional source belongs to its authored event, "
    .."including %d physical records and %d objects",seen,objects))
