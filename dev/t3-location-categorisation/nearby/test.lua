package.preload["ConspiracyFiles/Reach"]=function() return dofile("mod/common/media/lua/shared/ConspiracyFiles/Reach.lua") end
package.preload["ConspiracyFiles/T3Selection"]=function() return dofile("dev/t3-location-categorisation/nearby/T3Selection.lua") end
local callback, logs, clock = nil, {}, 0
Events={OnTick={Add=function(f) assert(not callback); callback=f end,Remove=function(f) if callback==f then callback=nil end end}}
getTimeInMillis=function() clock=clock+0.01; return clock end
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getGameVersion=function() return "mock" end
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local function record(t)
    local o={}
    for k,v in pairs(t) do local value=v; o[k]=function() return value end end
    return o
end
local rect=record{getX=0,getY=0,getW=2,getH=3}
local room=record{getName='office "test"',getX=0,getY=0,getX2=2,getY2=3,getZ=-1,getArea=6,getRects=list{rect,rect}}
local buildings={}
for i=20,1,-1 do
    buildings[#buildings+1]=record{getIDString=tostring(i),getX=i*10,getY=0,getX2=i*10+5,getY2=5,
        getRooms=list{room},getMinLevel=-1,getMaxLevel=0,isShop=false,isResidential=true}
end
getPlayer=function() return record{getX=0,getY=0,getZ=0,getHoursSurvived=0} end
getWorld=function() return record{getMetaGrid=record{getBuildings=list(buildings)},getMap="mock-map"} end
local originalPrint=print
print=function(s) logs[#logs+1]=s end
local T=dofile('dev/t3-location-categorisation/nearby/T3Nearby.lua')
assert(not callback, 'must not auto-start')
assert(T.start())
local frames=0
while callback do frames=frames+1; assert(frames<2000); callback() end
assert(frames>1, 'must yield')
assert(T.result.radius==250)
assert(T.result.buildings==12 and T.result.rooms==12 and T.result.rectangles==24)
assert(T.result.rows[1].categoryHint=='other')
assert(T.result.rows[2].z==-1 and T.result.rows[2].name=='office "test"')
assert(T.result.anchor.source=='manual-start-position')
assert(not T.result.rows[1].engine and T.result.rows[1].storage=='unknown')
local first=T.result.rows[1].id
assert(T.start(nil,1,'20'))
while callback do callback() end
local required=false
for _,row in ipairs(T.result.rows) do if row.kind=='building' and row.id=='20' then required=true end end
assert(required and T.result.buildings==12,'required current building included without increasing scan cap')
assert(T.start(5))
while callback do callback() end
assert(T.result.buildings==0)
assert(T.start()); T.cancel(); assert(not callback)
assert(T.start()); dofile('dev/t3-location-categorisation/nearby/T3Nearby.lua'); assert(not callback)
isClient=function() return true end
assert(not T.start())
isClient=function() return false end
getDebug=function() return false end
assert(not T.start())
getDebug=function() return true end
assert(not T.start(0/0))
-- Engine failures stop the queue and do not publish a partial result.
getWorld=function() return record{getMetaGrid=record{getBuildings=list{{getX=function() error('simulated engine fault') end}}},getMap='mock'} end
assert(T.start()); callback(); assert(not callback and T.result==nil)
print=originalPrint
print('PASS: bounded nearest selection, complete rooms/rectangles, scarcity, cancellation/reload, guards, failure cleanup')

local S=require("ConspiracyFiles/T3Selection")
local pool={}
for i=1,40 do S.retain(pool,{id=tostring(i),distance2=i*i,category="home"}) end
S.retain(pool,{id="shop",distance2=90000,category="retail"})
S.retain(pool,{id="attic",distance2=10000,category="attic-home"})
assert(#pool.home==12)
local function ids(rows) local a={} for _,v in ipairs(rows) do a[#a+1]=v.id end return table.concat(a,",") end
local chosen=S.choose(pool,1)
assert(#chosen==12)
local cats={}; for _,v in ipairs(chosen) do cats[v.category]=true end
assert(cats.retail and cats['attic-home'] and cats.home)
assert(ids(chosen)==ids(S.choose(pool,1)))
assert(ids(chosen)~=ids(S.choose(pool,2)))
assert(S.category({livingroom=true,attic=true})=='attic-home')
assert(S.category({mystery=true})=='other')
assert(S.category({office=true,policeoffice=true})=='public-service')
print('PASS: category diversity, bounded pools, repeatability, seed variation and conservative hints')
