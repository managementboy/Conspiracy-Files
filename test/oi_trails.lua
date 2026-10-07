-- NH-D6 annotated maps included: each map trail leans toward one conspiracy,
-- and each world makes a random 1-20% of them unreliable (owner, 2026-09-27,
-- DECISIONS.md DR-20260927-NOHELP-RULE-PLACEMENT). Generated/Trails.lua is a
-- pure function of the world seed and the static design list.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local D6="NH-D6"
local Trails=require("OIShared/Generated/Trails")
local Sites=require("OIShared/Generated/MapSites")
local N=#Trails.ALL
assert(N>=120,D6..": the trail rules cover every map design")

local sawShare={}
for seed=1,300 do
    local told,unreliable,favoured={containment=0,agricultural=0},0,{containment=0,agricultural=0}
    local share=Trails.share(seed)
    assert(share>=1 and share<=20 and share==math.floor(share),D6..": the unreliable share is 1..20 percent")
    sawShare[share]=true
    for _,d in ipairs(Trails.ALL) do
        local t=Trails.told(seed,d)
        assert(t=="containment" or t=="agricultural",D6..": every map tells one conspiracy")
        told[t]=told[t]+1
        local u=Trails.unreliable(seed,d,N)
        if u then unreliable=unreliable+1 end
        local f=Trails.favour(seed,d,N)
        assert(f==(u and Trails.other(t) or t),D6..": an unreliable map favours the other conspiracy")
        favoured[f]=favoured[f]+1
    end
    -- Placeholder lean: an even split, by rank.
    assert(told.containment==math.floor(N/2) and told.agricultural==N-math.floor(N/2),
        D6..": the random lean splits the maps and flyers evenly")
    -- Exactly k unreliable: at least one, the share rounded.
    local k=math.max(1,math.floor(N*share/100+0.5))
    assert(unreliable==k and Trails.unreliableCount(seed,N)==k,D6..": exactly "..k.." maps are unreliable in world "..seed)
end
local shares=0; for _ in pairs(sawShare) do shares=shares+1 end
assert(shares==20,D6..": over many worlds every share from 1 to 20 occurs ("..shares..")")

-- The same world answers the same, whatever else has been asked.
local a=Trails.favour(4242,"MulStashMap11")
for _,d in ipairs(Trails.ALL) do Trails.favour(99,d) end
assert(Trails.favour(4242,"MulStashMap11")==a,D6..": a world's answer never changes")
-- Worlds differ: the same map does not lean the same way in every world.
local leans={}
for seed=1,40 do leans[Trails.told(seed,"MulStashMap11")]=true end
assert(leans.containment and leans.agricultural,D6..": which way a map leans varies by world")
-- A design not in the static list has no trail.
assert(Trails.told(1,"NotAMap")==nil and Trails.favour(1,"NotAMap")==nil,D6..": unknown designs have no lean")
-- Flyers carry trails too (owner: "like map marks"), and the random split is
-- the owner's decision, said in the source.
local f=assert(io.open("mod-ofinterest/common/media/lua/shared/OIShared/Generated/Trails.lua","rb"))
local src=f:read("*a"); f:close()
assert(src:find("RANDOM BY DESIGN",1,true),D6..": the random lean is the owner's decision")
assert(#Trails.ALL==#Sites.designs+#(Sites.prints or {}),D6..": every map and every flyer carries a trail")
-- Minimums (owner): a place one map or flyer marks holds at least 3 clues
-- with one of the other side; a place several mark has no extra minimum.
local AreaCase=require("OIShared/Generated/AreaCase")
local _,one=AreaCase.trailFor(99,{Trails.ALL[1]})
assert(one.minCount==3 and one.rivalMin==1,D6..": one map, at least 3 clues, one of the other side")
local _,many=AreaCase.trailFor(99,{Trails.ALL[1],Trails.ALL[2]})
assert(many.minCount==nil and many.rivalMin==nil and many.favour,D6..": several maps, no extra minimum, still a lean")
print("nohelp trails: "..N.." maps and flyers, even random split, 1-20% unreliable per world, exactly k each")
-- A place several maps point to leans at random per world, not by list order.
do
    local AreaCase=require("OIShared/Generated/AreaCase")
    local seen={}
    for seed=1,40 do
        local t=AreaCase.trailFor(seed,{Trails.ALL[1],Trails.ALL[2]},"t3:shared")
        seen[t.favour]=true
    end
    assert(seen.containment and seen.agricultural,"NH-D6: a shared place's lean varies by world")
end
