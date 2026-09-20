package.path="mod/common/media/lua/shared/?.lua;"..package.path
local C=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")
local seen={}
assert(#C.list==125 and #C.printList==133)
for _,id in ipairs(C.list) do
    local binding=assert(C.get(id))
    for seed=1,32 do
        for part=1,4 do
            local a=Content.render(binding,seed,part)
            local b=Content.render(binding,seed,part)
            assert(a.title==b.title and a.body==b.body and a.kind==b.kind,"reload changes immutable record")
            assert(not a.body:find("{[%w_]+}"),"unresolved content placeholder")
            assert(not a.body:find("PAYOFF",1,true),"implementation vocabulary reached player text")
            seen[a.premise]=true
        end
    end
    for _,printId in ipairs(binding.printIds) do assert(C.print(printId),"invalid optional print association") end
end
for _,f in ipairs(Content.families) do assert(seen[f.id],"unreachable record family "..f.id) end
local g=assert(C.get("LouisvilleStashMap15"))
local removed=Content.render(g,9,1).body
local present=Content.render(g,9,4).body
assert(removed:find("04:10",1,true) and present:find("05:00",1,true))
assert(removed:find("W-114",1,true) and present:find("W-114",1,true))
assert(not present:find("04:10",1,true),"destination alone leaks unseen fragment")
assert(Content.comparison(g,9):find("04:10",1,true),"known pair must retain its conflict")
assert(Content.observation(g,"policeofficer",{},9,4)=="police")
assert(Content.observation(g,"unemployed",{},9,4)==nil)
assert(Content.observation(g,"policeofficer",{},9,2)==nil,"specialist observation must concern this object")
print("PASS immutable content, all families, knowledge-gated conflict and specialist observations")
