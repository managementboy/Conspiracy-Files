package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local objects,containers={},{}
for x=0,19 do
 local c={getType=function() return x%2==0 and 'desk' or 'counter' end};containers[x]=c
 objects[x]={getContainerCount=function() return 1 end,getContainerByIndex=function() return c end,getSprite=function() return {getName=function() return 'furniture' end} end}
end
local resolves=0
package.preload['ConspiracyFiles/WorldAccess']=function() return {resolve=function(t) resolves=resolves+1;if t.x~=4 then return containers[t.x] end end} end
getCell=function() return {getGridSquare=function(_,x,y,z) if x==5 then return nil end;return {getObjects=function() return list{objects[x]} end} end} end
local result={version='T3-nearby-2',buildings=1,map='mock',gameVersion='42.20',rows={
 {kind='building',id='home',x=0,y=0,x2=20,y2=2,minLevel=0},
 {kind='rect',building='home',x=0,y=0,z=0,w=3,h=1},
 {kind='rect',building='home',x=0,y=0,z=0,w=3,h=1},
 {kind='rect',building='home',x=3,y=0,z=-1,w=3,h=1},
 {kind='rect',building='home',x=3,y=0,z=0,w=15,h=1}}}
local catalog,first,candidates
local step=assert(require('ConspiracyFiles/Generated/Storage').scan(result,function(a,b,c) catalog,first,candidates=a,b,c end))
for n=1,1000 do local before=resolves;local done=step();assert(resolves-before<=1,'bounded native validation per step');if done then break end end
assert(candidates and #candidates['t3:home']==8)
assert(first['t3:home']==candidates['t3:home'][1] and first['t3:home'].x==0)
local seen={};for _,t in ipairs(candidates['t3:home']) do assert(t.z==0 and not seen[t.x] and t.x~=4 and t.x~=5);seen[t.x]=true end
assert(catalog.locations[1].paperStorage=='observed' and #catalog.locations[1].containerTypes==2)
-- Domain commits independent target snapshots and refuses a cupboard pile.
local G=require('ConspiracyFiles/Generated/Generator');local S=require('ConspiracyFiles/Generated/Session')
-- Seed pinned to a case that places at least two documents at the first site,
-- because the duplicate-target and shortage checks below have nothing to bite
-- on otherwise. Seed 17 did that until premises changed which documents a seed
-- draws (2026-09-09); seed 1 does it now. This test is about target
-- allocation, not about which seed produces the shape.
local case=assert(G.generate(dofile('test/fixtures/synthetic_locations.lua'),1,{mapId='SYNTHETIC-MAP',buildLine='TEST-ONLY',allowSynthetic=true}))
local atFirst=0
for _,d in ipairs(case.documents) do if d.locationId==case.locations[1].id then atFirst=atFirst+1 end end
assert(atFirst>=2,'fixture assumption changed: the first site must hold two or more documents')
local choices={};for _,site in ipairs(case.locations) do
 choices[site.id]={};for i=1,7 do choices[site.id][i]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=i-1,containerIndex=0,containerType=site.containerTypes[1],sprite='s'} end
end
local root=assert(S.createDistributed(case,choices));local assigned={}
for _,a in pairs(root.assignments) do local t=a.target;local key=t.x..':'..t.y..':'..t.objectIndex;assert(not assigned[key]);assigned[key]=true end
local site=case.locations[1].id;local previous=choices[site][2];choices[site][2]=choices[site][1];assert(not S.createDistributed(case,choices))
choices[site][2]=previous;local required=assert(G.requiredContainers(case))[site];choices[site][required]=nil;assert(not S.createDistributed(case,choices));assert(S.validate(root))
print('PASS storage candidates: separate targets, rectangle dedup, floor/cap8, unloaded/mismatch rejection, bounded reads, immutable distributed plan, shortage refusal')
