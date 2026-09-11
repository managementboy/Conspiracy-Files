package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
-- Isolated adapter fixtures omit generator metadata; full validation is covered by successive_cases/g2_smoke.
require("ConspiracyFiles/Generated/SuccessiveCases").current=function(store) return store end

local tick,starts=nil,0
Events={OnTick={Add=function(f) tick=f end,Remove=function(f) if tick==f then tick=nil end end},OnGameStart={Add=function() starts=starts+1 end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
local data,tool,tags={},false,false
local inv={containsTypeRecurse=function(_,s) return tool and s=="Pencil" end,containsTagRecurse=function(_,s) return tags and s=="RedPen" end}
local player={getInventory=function() return inv end,getModData=function() return data end}
getPlayer=function() return player end
ItemTag={get=function(s) return s end};ResourceLocation={of=function(s) return s end}
local root={known={},assignments={a={physicalToken="t:a",status="placed"},b={physicalToken="t:b",status="placed"},old={physicalToken="t:old",status="placed"}},case={documents={{id="a",title="Dispatch"},{id="b",title="Receipt"},{id="old",title="Historical"}}}}
ModData={get=function(k) if k=="ConspiracyFiles.Generated.G2" then return {canonical=root} end end}
getWorld=function() return {getMap=function() return "Muldraugh, KY" end} end
local clock=0;getTimeInMillis=function() return clock end
local square={getX=function() return 120 end,getY=function() return 230 end,getZ=function() return 0 end}
local source={isInCharacterInventory=function() return false end,getSourceGrid=function() return square end}
local dest={isInCharacterInventory=function(_,p) return p==player end}
local function note(id)
 local item={md={cfGeneratedId=id,cfPhysicalToken="t:"..id},outer=source}
 item.getModData=function(self) return self.md end
 item.getWorldItem=function() return nil end
 item.getOutermostContainer=function(self) return self.outer end
 return item
end
local calls=0
ISTransferAction={transferItem=function(_,p,item) calls=calls+1;item.outer=inv;return item end}
ISGrabItemAction={transferItem=function(_,w) w:getItem().outer=inv end}
local renders=0;ISWorldMap={render=function() renders=renders+1 end}
for _,name in ipairs({'TimedActions/ISTransferAction','TimedActions/ISGrabItemAction','ISUI/Maps/ISWorldMap'}) do package.preload[name]=function() return {} end end
local M=require('ConspiracyFiles/ClueMarkers');assert(M.start())
local a=note('a');assert(ISTransferAction:transferItem(player,a,source,dest)==a and calls==1)
local saved=data['ConspiracyFiles.ClueMarkers'];assert(saved.records.a.x==120 and not saved.records.a.written)
M.update();assert(not data['ConspiracyFiles.ClueMarkers'].records.a.written,'pickup alone reveals no inspected evidence')
root.known={'a'};M.update();assert(not data['ConspiracyFiles.ClueMarkers'].records.a.written,'no pen queues marker')
tags=true;assert(M.canWrite(player));M.update();assert(data['ConspiracyFiles.ClueMarkers'].records.a.written,'tagged pen enables catch-up')
tags=false
local b=note('b');local w={getItem=function() return b end,getSquare=function() return square end}
ISGrabItemAction.transferItem({character=player,destContainer=dest},w)
root.known={'a','b'};M.update()
assert(not data['ConspiracyFiles.ClueMarkers'].records.b.written,'losing tool pauses new marking')
tool=true;M.update();assert(data['ConspiracyFiles.ClueMarkers'].records.b.written)
local stable=data['ConspiracyFiles.ClueMarkers'];M.update();assert(data['ConspiracyFiles.ClueMarkers']==stable,'idempotent catch-up')
a.outer=source;tool=false;M.update();assert(data['ConspiracyFiles.ClueMarkers'].records.a.written,'drop item/tool preserves marks')
root.known={'a','b','old'}
local old=note('old');ISTransferAction:transferItem(player,old,source,dest)
assert(not data['ConspiracyFiles.ClueMarkers'].records.old,'historical sources not fabricated by re-looting')
local _,_,missing=M.status();assert(missing==1)
local denied=note('b');denied.md.cfPhysicalToken='wrong';assert(not M.before(player,denied,source,dest))
-- Reload keeps one wrapper and restores per-player records.
package.loaded['ConspiracyFiles/ClueMarkers']=nil
M=require('ConspiracyFiles/ClueMarkers');assert(M.start());assert(starts==1)
assert(data['ConspiracyFiles.ClueMarkers']==stable)
local texts={};UIFont={Small=1};getTextManager=function() return {getFontHeight=function() return 12 end,MeasureStringX=function(_,_,text) return #text end} end
local ui={width=1000,height=800,mapAPI={getZoomF=function() return 18 end,worldToUIX=function(_,x) return x end,worldToUIY=function(_,x,y) return y end},drawText=function(_,text,x,y,r,g,b) texts[#texts+1]={text=text,x=x,y=y,r=r,g=g,b=b} end}
ISWorldMap.render(ui);assert(renders==1 and #texts==3,'one source mark, two individually identified clues, original render retained')
assert(texts[1].text=='?' and texts[2].text=='#1 Dispatch' and texts[3].text=='#2 Receipt')
assert(texts[1].x==116.5 and texts[1].y==222.5,'actual source retained on map')
assert(stable.records.a.ink=='RedPen' and stable.records.b.ink=='Pencil','ink saved when each note is written')
assert(texts[2].r==0.65 and texts[3].r==0.2,'reload/tool loss retains individual colours at shared source')
local textureDraw
getTexture=function(path) assert(path=='media/ui/LootableMaps/map_question.png');return 'question' end
ui.drawTextureScaled=function(_,texture,x,y,w,h,a,r,g,b) textureDraw={texture=texture,x=x,y=y,w=w,r=r} end
M.draw(ui);assert(textureDraw.texture=='question' and textureDraw.r==0.65 and textureDraw.x+textureDraw.w/2==120.5,'native question centred at finding source')
local savedInk=stable.records.a.ink;stable.records.a.ink=nil;texts={};M.draw(ui)
assert(texts[1].r==0.2,'legacy unknown ink falls back to graphite');stable.records.a.ink=savedInk
-- Failed transfer cannot record a location.
root.assignments.c={physicalToken='t:c',status='placed'}
local c=note('c');local pending=M.before(player,c,source,dest);M.after(pending,c)
assert(not data['ConspiracyFiles.ClueMarkers'].records.c)
print('PASS clue markers: source capture, transfer preservation, pickup versus inspection, pen/tag catch-up, pause/resume, drop, historical safety, reload, grouped map rendering, failed transfer')

instanceof=function(item,kind) return kind=='InventoryContainer' and item.bag end
local bag=note('bag');bag.bag=true
bag.getInventory=function() return {getItems=function() return {size=function() return 1 end,get=function() return c end} end} end
pending=M.before(player,bag,source,dest)
c.outer=inv;bag.outer=inv;M.after(pending,bag)
assert(data['ConspiracyFiles.ClueMarkers'].records.c.x==120,'whole-bag pickup captures contained note source')
print('PASS whole-bag source capture')

assert(M.note('a'):find('marked',1,true))
assert(M.note('old'):find('not recorded',1,true))
assert(M.note('unknown')==nil)
root.known[#root.known+1]='c';assert(M.note('c'):find('waits',1,true))
-- Corrupt marker state is refused without interfering with the vanilla move.
local good=data['ConspiracyFiles.ClueMarkers']
data['ConspiracyFiles.ClueMarkers']={schema=1,records={},unexpected=true}
local beforeCalls=calls
local moved=note('a');assert(ISTransferAction:transferItem(player,moved,source,dest)==moved)
assert(calls==beforeCalls+1 and moved.outer==inv)
assert(data['ConspiracyFiles.ClueMarkers'].unexpected==true,'unsafe root not overwritten')
data['ConspiracyFiles.ClueMarkers']=good
-- A storage failure cannot replace the previous marker root or cancel pickup.
root.assignments.d={physicalToken='t:d',status='placed'}
local d=note('d');local proxy=setmetatable({},{__index=data,__newindex=function() error('simulated save failure') end})
player.getModData=function() return proxy end
assert(ISTransferAction:transferItem(player,d,source,dest)==d and d.outer==inv)
assert(data['ConspiracyFiles.ClueMarkers']==good and not good.records.d)
player.getModData=function() return data end
-- A conflict arising during transfer prevents source commitment.
local e=note('e');root.assignments.e={physicalToken='t:e',status='placed'}
local candidate=M.before(player,e,source,dest);e.outer=inv;root.assignments.e.status='conflict';M.after(candidate,e)
assert(not data['ConspiracyFiles.ClueMarkers'].records.e)
-- A clue in a car: a part container has no grid square of its own
-- (getSourceGrid is nil in 42.20.4), so the vehicle's square is where it was found.
instanceof=function(o,class) return type(o)=='table' and o.class==class end
local vsquare={getX=function() return 300 end,getY=function() return 400 end,getZ=function() return 0 end}
local van={class='BaseVehicle',getSquare=function(self) assert(self,'colon call');return vsquare end}
local glovebox={isInCharacterInventory=function() return false end,getSourceGrid=function() return nil end,
 getParent=function(self) assert(self,'colon call');return van end}
root.assignments.v={physicalToken='t:v',status='placed'}
local v=note('v');assert(ISTransferAction:transferItem(player,v,glovebox,dest)==v)
local rv=data['ConspiracyFiles.ClueMarkers'].records.v
assert(rv and rv.x==300 and rv.y==400,'a clue taken from a car is recorded where the car stands')
print('PASS marker status, corrupt-state isolation, failed save preserves root/native transfer, mid-transfer conflict, clues from cars')
