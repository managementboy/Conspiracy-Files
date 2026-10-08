-- Which conspiracy each vanilla map's trail leans toward in one world (No Help,
-- DECISIONS.md, DR-20260927-NOHELP-RULE-PLACEMENT: "Map trails lean" and
-- "Unreliable maps: a random share per world").
--
-- Pure: a function of the world seed and the static list of map designs
-- (Generated/MapSites), never of reading, time or the player. Reading a map,
-- or never reading it, gives every world the same answers.
--
--   told(seed, design)         the lean the map's own trail tells.
--   unreliable(seed, design)   whether this world makes that map unreliable:
--                              it points at evidence for the OTHER theory.
--   favour(seed, design)       the lean its marked places favour: told, or
--                              the other one when the map is unreliable.
--
-- RANDOM BY DESIGN (owner, 2026-09-27: "Random. We generate a story for each
-- map that fits either conspiracy"). Each world splits the maps and flyers
-- evenly between the two conspiracies by a hash of world seed and design; the
-- story written for each map and flyer fits either, so whichever side a world
-- gives it, its words hold. Flyers carry a trail like maps (owner: "like map
-- marks"); they are listed as "print:<name>".
local Pick=require("NHShared/Generated/Pick")
local Sites=require("NHShared/Generated/MapSites")
local T={}
-- Every map and flyer that carries a trail, in the static order of MapSites.
T.ALL={}
for _,d in ipairs(Sites.designs) do T.ALL[#T.ALL+1]=d end
for _,p in ipairs(Sites.prints or {}) do T.ALL[#T.ALL+1]="print:"..p end
T.VERSION="nohelp-trails-0"
T.LEANS={"containment","agricultural"}
T.MIN_SHARE,T.MAX_SHARE=1,20

function T.other(lean) return lean=="containment" and "agricultural" or "containment" end

-- Every design ranked by a hash of (seed, design, purpose); 1 is first.
-- Cached per design list, seed and purpose: two small tables per world.
local ranks=setmetatable({},{__mode="k"})
local function rankOf(seed,design,purpose,designs)
    designs=designs or T.ALL
    local byList=ranks[designs]
    if not byList then byList={}; ranks[designs]=byList end
    local cacheKey=Pick.key({seed,purpose})
    local r=byList[cacheKey]
    if not r then
        local order={}
        for i,d in ipairs(designs) do order[i]={d=d,h=Pick.hash(Pick.key({seed,d,T.VERSION,purpose}))} end
        table.sort(order,function(a,b) if a.h~=b.h then return a.h<b.h end return a.d<b.d end)
        r={}; for i,o in ipairs(order) do r[o.d]=i end
        byList[cacheKey]=r
    end
    return r[design]
end

-- PLACEHOLDER lean (see the header): the first half of the designs by rank
-- tell containment, the rest agricultural.
function T.told(seed,design,designs)
    designs=designs or T.ALL
    local rank=rankOf(seed,design,"told",designs)
    if not rank then return nil end
    return rank<=math.floor(#designs/2) and "containment" or "agricultural"
end

-- This world's share of unreliable maps, 1..20 percent (owner: "make it
-- random between 1 and 20").
function T.share(seed)
    return T.MIN_SHARE+Pick.hash(Pick.key({seed,T.VERSION,"unreliable-share"}))%(T.MAX_SHARE-T.MIN_SHARE+1)
end
-- How many of N designs are unreliable: at least one, the share rounded.
function T.unreliableCount(seed,n)
    return math.max(1,math.floor(n*T.share(seed)/100+0.5))
end
-- Exactly unreliableCount designs are unreliable: those ranked first.
function T.unreliable(seed,design,n,designs)
    designs=designs or T.ALL
    n=n or #designs
    local rank=rankOf(seed,design,"unreliable",designs)
    return rank~=nil and rank<=T.unreliableCount(seed,n)
end

function T.favour(seed,design,n,designs)
    local told=T.told(seed,design,designs)
    if not told then return nil end
    if T.unreliable(seed,design,n,designs) then return T.other(told) end
    return told
end

return T
