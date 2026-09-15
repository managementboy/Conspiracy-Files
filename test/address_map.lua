getPlayer=function() return nil end
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Core=require("ConspiracyFiles/Generated/AddressIndex")
local roads={{street="Test St",block=1,segments={{10900,9700,11050,9700,0}}}}
local buildings={{id="b",x=10940,y=9710,x2=10946,y2=9718},{id="a",x=10920,y=9680,x2=10926,y2=9688}}
local function build(items)
 local out; local step=Core.build(items,roads,function(r) out=r end)
 while not step() do end
 table.sort(out,function(a,b) return a.id<b.id end);return out
end
local r=build(buildings)
assert(r[1].label=='101 Test St' and r[2].label=='102 Test St')
local reversed=build({buildings[2],buildings[1]});assert(reversed[1].label==r[1].label)
-- Distant roads must not turn a town scan into buildings x all-world segments.
local many={roads[1]}
for i=1,1000 do many[#many+1]={street="Far "..i,block=1,segments={{20000+i,20000,20000+i,20010,0}}} end
local fast,steps=nil,0
local advance=Core.build(buildings,many,function(v) fast=v end)
repeat steps=steps+1 until advance()
assert(steps<20 and #fast==2,'distant roads skipped by spatial lookup')
-- Lookup must retain a road just across a bucket boundary within 50 tiles.
local edge
advance=Core.build({{id='edge',x=127,y=100,x2=129,y2=102}},
 {{street='Boundary St',block=1,segments={{80,90,80,120,0}}}},function(v) edge=v end)
while not advance() do end
assert(#edge==1,'expanded buckets preserve nearby boundary segments')
-- Reproduce the live dispatch house exactly halfway between 3rd and 4th.
local liveRoads=assert(loadfile('mod/common/media/lua/shared/ConspiracyFiles/Generated/AddressRoads.lua'))()
local dispatch={id='dispatch',x=10964,x2=10968,y=9696,y2=9709}
local tie
advance=Core.build({dispatch},liveRoads,function(v) tie=v end)
while not advance() do end
assert(#tie==1 and tie[1].label=='101 3rd St','equal-distance house now gets deterministic street')
local pinned={{id='old',x=10940,y=9696,x2=10944,y2=9709,label='101 3rd St'}}
local filled
advance=Core.build({dispatch},liveRoads,function(v) filled=v end,nil,pinned)
while not advance() do end
assert(#filled==2 and filled[1].label=='101 3rd St' and filled[2].label=='103 3rd St','fill uses free parity slot; old label preserved')
assert(#pinned==1 and pinned[1].label=='101 3rd St','input save remains untouched')
local repeatFill
advance=Core.build({dispatch},liveRoads,function(v) repeatFill=v end,nil,filled)
while not advance() do end
assert(#repeatFill==2 and repeatFill[2].label=='103 3rd St','repeat fill is idempotent')
local callbacks={}
Events={OnTick={Add=function(f) callbacks.tick=f end,Remove=function(f) if callbacks.tick==f then callbacks.tick=nil end end},OnGameStart={Add=function(f) callbacks.start=f end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
getGameVersion=function() return '42.20' end
getTimeInMillis=function() return 0 end
local saves={};ModData={get=function(k) return saves[k] end,getOrCreate=function(k) saves[k]=saves[k] or {};return saves[k] end}
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local objects={}
for _,b in ipairs(buildings) do
 objects[#objects+1]={getIDString=function() return b.id end,getX=function() return b.x end,getY=function() return b.y end,
 getX2=function() return b.x2 end,getY2=function() return b.y2 end,isBasement=function() return false end,
 getRooms=function() return list{{getName=function() return 'bedroom' end}} end}
end
getWorld=function() return {getMap=function() return 'Muldraugh, KY' end,getMetaGrid=function() return {getBuildings=function() return list(objects) end} end} end
local drawn,original,known=0,0,false
ISWorldMap={render=function() original=original+1 end}
package.preload['ISUI/Maps/ISWorldMap']=function() return {} end
package.preload['ConspiracyFiles/Generated/AddressRoads']=function() return roads end
local M=require('ConspiracyFiles/AddressMap');assert(M.start())
for i=1,100 do if callbacks.tick then callbacks.tick() end end
assert(saves['ConspiracyFiles.AddressBook.Muldraugh'].canonical)
UIFont={Small=1};getTextManager=function() return {MeasureStringX=function(_,_,t) return #t*6 end,getFontHeight=function() return 12 end} end
WorldMapVisited={getInstance=function() return {isKnown=function() return known end} end}
local ui={width=1000,height=1000,drawRect=function() error('number labels must not draw a background') end,drawText=function(_,text) assert(text:match('^%d+$'),'map label is number only');drawn=drawn+1 end,mapAPI={getZoomF=function() return 18 end,
 uiToWorldX=function(_,x,y) return 10900+x/10 end,uiToWorldY=function(_,x,y) return 9650+y/10 end,
 worldToUIX=function(_,x,y) return (x-10900)*10 end,worldToUIY=function(_,x,y) return (y-9650)*10 end}}
ISWorldMap.render(ui);assert(drawn==0 and original==1,'unknown houses hidden, original renderer preserved')
known=true;ISWorldMap.render(ui);assert(drawn==2,'known houses labelled')
local clock=0
getTimeInMillis=function() clock=clock+10;return clock end
for i=1,5 do drawn=0;ISWorldMap.render(ui);assert(drawn==2,'all labels remain visible despite variable frame time') end
known=false;drawn=0;ISWorldMap.render(ui);assert(drawn==0,'forget immediately hides overlay')
local persisted=saves['ConspiracyFiles.AddressBook.Muldraugh'].canonical
assert(M.start());assert(saves['ConspiracyFiles.AddressBook.Muldraugh'].canonical==persisted,'no renumber on resume')
local c={locations={{id='t3:a',mapId='Muldraugh, KY',name='Building at 10920, 9680',bounds={x1=10920,y1=9680,x2=10926,y2=9688}}}}
assert(M.describe('Go to Building at 10920, 9680',c)=='Go to 101 Test St')
assert(c.locations[1].name=='Building at 10920, 9680')
-- Existing revision-one books are extended once, then restored without rewriting.
getTimeInMillis=function() return 0 end
persisted.coverage=nil
local before=persisted.records[1].label
assert(M.start())
for i=1,100 do if callbacks.tick then callbacks.tick() end end
local upgraded=saves['ConspiracyFiles.AddressBook.Muldraugh'].canonical
assert(upgraded~=persisted and upgraded.coverage==3 and upgraded.records[1].label==before)
assert(persisted.coverage==nil,'previous root is not mutated')
assert(M.start() and saves['ConspiracyFiles.AddressBook.Muldraugh'].canonical==upgraded)
print('PASS address index: parity/order, full-map scan, persisted labels, known/forgotten map mask, cooperative rendering, coordinate-free text')

ISWorldMap.render(ui)
for n=1,61 do
 local x=10900+n
 objects[#objects+1]={getIDString=function() return 'audit-'..n end,getX=function() return x end,getY=function() return 9660 end,
  getX2=function() return x+1 end,getY2=function() return 9661 end,isBasement=function() return false end,
  getRooms=function() return list{{getName=function() return 'audit-room' end}} end}
end
local auditLog,oldPrint={},print;print=function(s) auditLog[#auditLog+1]=s end
assert(M.audit())
local prior=0
for i=1,200 do if callbacks.tick then callbacks.tick() end
 local details=0;for _,s in ipairs(auditLog) do if s:find('Audit ',1,true) then details=details+1 end end
 assert(details-prior<=1,'audit emits at most one detail per tick');prior=details
end
print=oldPrint
local detailCount,lastFound=0,false
for _,s in ipairs(auditLog) do
 if s:find(' reason=',1,true) then detailCount=detailCount+1 end
 if s:find('id=audit-61 ',1,true) then lastFound=true end
end
assert(detailCount==63 and lastFound,'audit must include every detail beyond the old 60-entry cap')
assert(#auditLog>=63 and auditLog[#auditLog]:find('63 other footprints',1,true),'all >60 viewport footprints are detailed and counted')
assert(not callbacks.tick and saves["ConspiracyFiles.AddressBook.Muldraugh"].canonical==upgraded,"audit finishes without save writes")

-- Live audit setback fixtures now associate with S Main St.
local setbacks
advance=Core.build({{id='house',x=10783,y=9629,x2=10793,y2=9640},
 {id='bar',x=10774,y=9609,x2=10781,y2=9613}},liveRoads,function(v) setbacks=v end)
while not advance() do end
assert(#setbacks==2)
for _,v in ipairs(setbacks) do assert(v.label:match(' S Main St$')) end
local function diagonal(segment)
 local result
 local step=Core.build({{id='diagonal',x=110,y=130,x2=112,y2=132}},
 {{street='Curve',block=1,segments={segment}}},function(v) result=v end)
 while not step() do end
 return result[1].label
end
assert(diagonal({100,100,140,120})==diagonal({140,120,100,100}),'reversed endpoints preserve diagonal parity')
local distant
advance=Core.build({{id='distant',x=150,y=161,x2=152,y2=163}},
 {{street='Limit',block=1,segments={{100,100,200,100}}}},function(v) distant=v end)
while not advance() do end
assert(#distant==0,'beyond 60 tiles remains unresolved')
print('PASS setback fixtures, curve direction invariance, distance cap')
