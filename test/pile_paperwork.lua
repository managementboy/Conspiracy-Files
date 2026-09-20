-- Physical and optional evidence must belong to the selected authored event.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Story=require("ConspiracyFiles/Generated/Story")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local physical={key=true,photograph=true}
local seen,optionalSeen,cases=0,0,0
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
            assert(Kinds.get(doc.kind))
            assert(doc.quantity==nil and doc.onPaper==nil,"no unrelated generic pile may be attached")
            if i>3 then
                optionalSeen=optionalSeen+1
                local declared=assert(allowed[doc.title],"optional source not declared by this event: "..doc.title)
                assert(doc.kind==declared.kind)
                assert(doc.body==Story.body(expand(declared.observation,c),expand(declared.source,c),expand(declared.note,c)),
                    "optional observation, source and interpretation must describe this event")
                allowed[doc.title]=nil -- no duplicate contribution
                if physical[doc.kind] then
                    seen=seen+1
                    assert(doc.body:find(c.facts.code,1,true),"physical optional evidence identifies its actual file")
                end
            end
        end
    end
end
assert(cases>0 and optionalSeen>0 and seen>0,"must exercise actual generated physical optional sources")
print("PASS every generated optional source belongs to its authored event, including physical evidence")
