-- A building's minimum level decides a catalog entry's advisory bounds.z,
-- but no longer decides where clues actually go by itself.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local N=require("ConspiracyFiles/Generated/NearbyCatalog")

local function result(minLevel)
    return {version="T3-nearby-2",map="SYNTHETIC",gameVersion="42.20.4",buildings=1,rows={
        {kind="building",id="b1",x=10,y=20,x2=18,y2=28,minLevel=minLevel,maxLevel=1}}}
end

-- DELIBERATE CHANGE (see docs/research/B42_RUNTIME_PASSABILITY.md and the
-- commit that introduced this test): a Session-wide ground-level clamp here
-- was a stopgap after a live case placed three of four clues in an
-- unreachable basement office. The clamp fixed that by disabling basement
-- placement outright -- a content regression, since Build 42 basements are
-- real, walkable rooms most of the time.
--
-- The real fix lives in Generated/Storage.scan: a candidate below ground is
-- only ever accepted as a site's target once ConspiracyFiles/Connectivity,
-- fed by ReachabilityAdapter, proves the exact square reachable from the
-- player's anchor. That gate runs downstream of this catalog step and does
-- not exist in this plain-Lua fixture (no PZ engine, no squares to prove
-- anything about), so NearbyCatalog itself must report the raw minimum
-- again -- clamping it here would just reintroduce the regression one layer
-- up, silently, for every caller of Storage.scan.
local basemented=assert(N.fromResult(result(-1)))
assert(basemented.locations[1].bounds.z==-1,"a basemented building reports its real minimum level; Storage.scan is the reachability gate, not this catalog step")

local ordinary=assert(N.fromResult(result(0)))
assert(ordinary.locations[1].bounds.z==0,"a building without a basement is unchanged")

-- Bounds are otherwise untouched.
local b=basemented.locations[1].bounds
assert(b.x1==10 and b.y1==20 and b.x2==18 and b.y2==28,"footprint preserved")

print('PASS nearby catalog levels: a basement level is reported as-is; Storage.scan (not this catalog step) proves reachability before ever using it')
