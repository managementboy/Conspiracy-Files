-- Physical evidence is authored per event. The generator must not attach a
-- generic stores pile or invent an object beside otherwise unrelated papers.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local Inventory=require("ConspiracyFiles/Generated/InventoryScenarios")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local physical={key=true,photograph=true}
local declared={}
for _,variants in pairs(Inventory) do for _,scenario in ipairs(variants) do
    for _,optional in ipairs(scenario.optional or {}) do if physical[optional.kind] then declared[optional.title]=optional end end
end end
local seen=0
for seed=1,400 do
    local case=G.generate(catalog,seed,opts)
    if case then
        assert(G.validate(case) and #case.essential==3)
        for _,doc in ipairs(case.documents) do
            local carrier=assert(Kinds.get(doc.kind))
            assert(doc.quantity==nil and doc.onPaper==nil,"generic pile paperwork must not be generated")
            if physical[doc.kind] then
                seen=seen+1
                assert(doc.body:find(case.facts.code,1,true),"authored physical evidence names its own case reference")
                assert(carrier.capacity=="prose","physical authored carrier is a supported evidence kind")
            end
        end
    end
end
assert(next(declared) and seen>0,"authored physical optional evidence is declared and exercised")
print("PASS authored physical optional evidence replaces generic pile paperwork")
