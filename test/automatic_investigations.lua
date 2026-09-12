package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
next=nil
local ticks,starts={},{}
Events={OnTick={Add=function(f) ticks[#ticks+1]=f end},OnGameStart={Add=function(f) starts[#starts+1]=f end}}
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local function record(t) local o={};for k,v in pairs(t) do local val=v;o[k]=function() return val end end;return o end
local containers={}
local function container()
 local c={items={},getType=function() return 'desk' end}
 c.getItems=function() return list(c.items) end
 c.AddItem=function(_,item) c.items[#c.items+1]=item;item.container=c;return item end
 return c
end
-- Eight containers per house, in a 4x2 block. Four was exactly MAX_EVIDENCE
-- minus the three mandatory roles, which held only while no case could want
-- more than four documents in one building. It is not a safe fit: how a case
-- splits across its two sites varies with its shape, and on 2026-09-10 a case
-- wanted five at one site and the run deferred forever. The harness must never
-- be the constraint under test.
local places={0,20,40,60,80,100}
local offsets={0,0.1,1,1.1,2,2.1,3,3.1}
for _,x in ipairs(places) do for _,offset in ipairs(offsets) do containers[x+offset]=container() end end
local inventory=container();local house=nil;local hours=10;local position=0
local player=record{getZ=0,getY=0,getHoursSurvived=0,getInventory=inventory,getVehicle=nil}
player.getX=function() return position end;player.getModData=function() return {} end
player.getVehicle=function() return nil end
player.getSquare=function() return {getBuilding=function() if house then return {getDef=function() return {getIDString=function() return house end} end} end end} end
getPlayer=function() return player end;getWorld=function() return {} end
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
getGameTime=function() return {getWorldAgeHours=function() return hours end} end
local millis=0;getTimeInMillis=function() millis=millis+0.01;return millis end
local seed=100;ZombRand=function() seed=seed+1;return seed end
getCell=function() return {getGridSquare=function(_,x,y,z)
 if (y~=0 and y~=1) or z~=0 or not containers[x+y/10] then return nil end
 return record{getObjects=list{record{getContainerCount=1,getContainerByIndex=containers[x+y/10],getSprite=record{getName='desk'}}},getWorldObjects=list{},getStaticMovingObjects=list{}}
end} end
instanceof=function() return false end
instanceItem=function(kind)
 local md={};local item={getModData=function() return md end,setName=function() end,setCustomName=function() end}
 item.getOutermostContainer=function() return item.container end;return item
end
local db={};local fail=false
ModData={get=function(tag) return db[tag] end,getOrCreate=function(tag) if fail then error('failed save') end;db[tag]=db[tag] or {};return db[tag] end}
local result={version='T3-nearby-2',buildings=#places,map='mock',gameVersion='42.20',anchor={x=0,y=0},rows={}}
for _,x in ipairs(places) do
 -- Four wide, two deep, matching the eight container keys above (x+dx for
 -- dx in 0..3, y in {0,1}). The building bounds must cover them too: a
 -- candidate outside its site's bounds is refused by Session.target.
 result.rows[#result.rows+1]={kind='building',id=tostring(x),x=x,y=0,x2=x+4,y2=2,minLevel=0}
 result.rows[#result.rows+1]={kind='rect',building=tostring(x),x=x,y=0,z=0,w=4,h=2}
end
local requestedHouse;local probes=0
package.preload['ConspiracyFiles/T3Nearby']=function() return {result=result,start=function(_,_,required) requestedHouse=required;probes=probes+1;return true end} end
for _,name in ipairs({'GeneratedMenu','ClueHints','ClueMarkers','AddressMap'}) do package.preload['ConspiracyFiles/'..name]=function() return {start=function() return true end} end end
local R=require('ConspiracyFiles/GeneratedRuntime')
local A=require('ConspiracyFiles/AutomaticInvestigations')
local C=require('ConspiracyFiles/Generated/SuccessiveCases')
local function tick(n) for i=1,n do for _,f in ipairs(ticks) do f() end end end
local function load() for _,f in ipairs(starts) do f() end end
local function active() local s=db['ConspiracyFiles.Generated.G2'];return s and s.campaign end
-- Automatic start waits outside; no console call to start/nextCase.
load();tick(35);assert(not active() and probes==0)
house='0';tick(1100)
local first=assert(active());assert(C.validate(first) and requestedHouse=='0')
assert(first.canonical.case.documents[1].locationId=='t3:0','opening clue in current house')
assert(first.schedule.createdHours[1]==10 and #R.known()==0)
-- One DOCUMENT per container, not one item: a pile is one document and many
-- identical items (2026-09-10), so a drawer holding six lunchboxes is still
-- one piece of evidence. Counting items here would have called that a
-- violation of the separate-containers rule it is not.
local inHouse=0
for _,offset in ipairs(offsets) do
 local documents={}
 for _,item in ipairs(containers[offset].items) do
  local id=item.getModData and item:getModData().cfGeneratedId
  if id then documents[id]=true end
 end
 local n=0;for _ in pairs(documents) do n=n+1 end
 assert(n<=1,'a container must hold at most one document, however many copies of it')
 inHouse=inHouse+n
end
local required=assert(require('ConspiracyFiles/Generated/Generator').requiredContainers(first.canonical.case))['t3:0']
assert(inHouse==required,'selected opening evidence occupies its required separate containers')
local firstId=first.canonical.case.caseId
hours=33.99;tick(650);assert(#C.sessions(active())==1)
-- Change anchor and allow24 hours; first case has no discoveries/completion.
position=4000;hours=34;tick(1300);assert(#C.sessions(active())==1,'later reach uses current position, not old metadata anchor')
position=40;house='40';hours=34;tick(1300)
assert(#C.sessions(active())==2 and active().schedule.createdHours[2]==34)
assert(active().canonical.case.caseId==firstId and #R.known()==0)
-- Resume does not reset clock or duplicate physical notes.
local before=0;for _,c in pairs(containers) do before=before+#c.items end
load();hours=35;tick(650);assert(#C.sessions(active())==2)
local after=0;for _,c in pairs(containers) do after=after+#c.items end;assert(before==after)
-- Failed write cannot advance the case clock; later polling retries.
hours=58;fail=true;tick(1300);assert(#C.sessions(active())==2 and active().schedule.createdHours[2]==34)
fail=false;tick(1300);assert(#C.sessions(active())==3 and active().schedule.createdHours[3]==58)
hours=200;tick(1300);assert(#C.sessions(active())==3)
-- New empty save must clear prior runtime wrapper; still waits outside.
db={};house=nil;load();tick(35);assert(not active())
-- Moving to a different building during preparation aborts before commit.
house='0';tick(565);house='20';tick(250);assert(not active())
-- Unsupported MP leaves new save empty.
isClient=function() return true end;tick(1300);assert(not active())
print('PASS automatic native adapter: no commands, current-house opening,24h durable gap, current anchor, unfinished cases, reload, failed writes/retry, cap, outside/movement/MP gates')
