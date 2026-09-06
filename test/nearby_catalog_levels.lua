-- A building's minimum level must not decide where its clues go.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local N=require("ConspiracyFiles/Generated/NearbyCatalog")

local function result(minLevel)
    return {version="T3-nearby-2",map="SYNTHETIC",gameVersion="42.20.4",buildings=1,rows={
        {kind="building",id="b1",x=10,y=20,x2=18,y2=28,minLevel=minLevel,maxLevel=1}}}
end

-- Build 42 attaches basements at runtime, so getMinLevel() reports -1 for an
-- ordinary house. Session.target pins every clue in a site to bounds.z, so a
-- raw minimum buried the whole case in an unverified basement room.
local basemented=assert(N.fromResult(result(-1)))
assert(basemented.locations[1].bounds.z==0,"a basemented building still places at ground level")

local ordinary=assert(N.fromResult(result(0)))
assert(ordinary.locations[1].bounds.z==0,"a building without a basement is unchanged")

-- Bounds are otherwise untouched.
local b=basemented.locations[1].bounds
assert(b.x1==10 and b.y1==20 and b.x2==18 and b.y2==28,"footprint preserved")

print('PASS nearby catalog levels: a basement never captures the whole site')
