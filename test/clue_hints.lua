package.path="mod/common/media/lua/shared/?.lua;"..package.path
-- Isolated adapter fixtures omit generator metadata; full validation is covered by successive_cases/g2_smoke.
require("ConspiracyFiles/Generated/SuccessiveCases").current=function(store) return store end

local callback,clock,count,says=nil,0,1,{}
local x,y,z=0,0,0
local target={x=1,y=1,z=0,objectIndex=0,containerIndex=0}
local root={case={documents={{id="d"}}},assignments={d={status="placed",target=target,physicalToken="token"}},known={}}
ModData={get=function() return {canonical=root} end}
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return clock end
getPlayer=function() return {getX=function() return x end,getY=function() return y end,getZ=function() return z end,Say=function(_,s) says[#says+1]=s end} end
Events={OnTick={Add=function(f) assert(not callback); callback=f end,Remove=function(f) if callback==f then callback=nil end end}}
local container={}
package.preload["ConspiracyFiles/WorldAccess"]=function() return {
    resolve=function() return container end,
    count=function(_,_,done) return function() done(count); return true end end
} end
local function tick() clock=clock+500; callback() end
local H=dofile('mod/common/media/lua/client/ConspiracyFiles/ClueHints.lua')
z=1; tick(); tick(); assert(#says==0,'wrong floor')
z=0; count=0; tick(); tick(); assert(#says==0,'absent clue')
count=2; tick(); tick(); assert(#says==0,'duplicate clue')
count=1; tick(); tick(); assert(#says==1,'one-tile diagonal clue')
for i=1,130 do tick() end; assert(#says==1,'no stationary chatter')
x=20; tick(); x=0; tick(); tick(); assert(#says==2 and says[1]~=says[2],'re-entry varies phrase')
x=20; tick(); x=0; tick(); tick(); assert(#says==2,'global cooldown')
x=20; clock=clock+61000; tick(); root.known={'d'}; x=0; tick(); tick(); assert(#says==2,'known clue silent')
root.known={}; tick(); x=20; tick(); assert(#says==2,'moved away during count')
H.stop(); assert(not callback)
print('PASS proximity hints: floor, distance, actual token count, duplicates, cooldown, re-entry, phrase variation, discovery and stale-position guards')
