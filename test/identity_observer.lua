package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
next=nil
package.preload['ISUI/ISInventoryPane']=function() end
local callbacks={};Events={OnTick={Add=function(f) callbacks.tick=f end},OnGameStart={Add=function(f) callbacks.start=f end}}
local originalCalls=0;ISInventoryPane={render=function() originalCalls=originalCalls+1 end}
local db={};local failWrite=false
ModData={get=function(k) return db[k] end,getOrCreate=function(k) if failWrite then error('write unavailable') end;db[k]=db[k] or {};return db[k] end}
local playerInv={};local player={getInventory=function() return playerInv end,getX=function() return 10 end,getY=function() return 20 end,getZ=function() return 0 end,getModData=function() return {} end}
getPlayer=function() return player end;getSpecificPlayer=function(n) if n==0 then return player end end
getGameTime=function() return {getWorldAgeHours=function() return 1 end} end
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
instanceof=function(o,k) return type(o)=='table' and o.kind==k end
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end},NotebookUI={refresh=function() end}}
local corpse={kind='IsoDeadBody'}
local bag={kind='InventoryItem',getDisplayName=function() return 'Wallet' end,getFullType=function() return 'Base.Wallet' end}
local source={getParent=function() return corpse end,getType=function() return 'inventorymale' end}
local wallet={getContainingItem=function() return bag end,getType=function() return 'wallet' end}
local function card(id,container,name)
 return {kind='InventoryItem',getID=function() return id end,getFullType=function() return 'Base.IDcard' end,
 getDisplayName=function() return name or 'ID Card: Ada Vale' end,getContainer=function() return container end,isHidden=function() return false end}
end
local function pane(container,rows)
 return {mode='details',player=0,inventory=container,items=rows,itemHgt=20,headerHgt=20,
 parent={isReallyVisible=function() return true end},isReallyVisible=function() return true end,
 getYScroll=function() return 0 end,getHeight=function() return 100 end}
end
local I=require('ConspiracyFiles/IdentityObserver');local M=require('ConspiracyFiles/IdentityObservations')
local function run(p) ISInventoryPane.render(p);for i=1,170 do callbacks.tick() end end
local function count() return #I.rows() end
local a=card(1,source);local p=pane(source,{{items={a}}})
p.parent.isCollapsed=true;run(p);assert(count()==0)
p.parent.isCollapsed=false;p.mode='icons';run(p);assert(count()==0);p.mode='details'
p.isReallyVisible=function() return false end;run(p);assert(count()==0);p.isReallyVisible=function() return true end
-- Closed wallet row cannot leak its card; no descendant enumeration exists.
bag.getInventory=function() error('must not inspect closed wallet') end
run(pane(source,{{items={bag}}}));assert(count()==0)
run(p);assert(count()==1);run(p);assert(count()==1)
local b=card(2,wallet);run(pane(wallet,{{items={b}}}));assert(count()==2)
-- Save/reload clears runtime caches and uses durable IDs.
callbacks.start();run(p);assert(count()==2)
run(pane(playerInv,{{items={a}}}));assert(count()==2)
-- Same displayed name, separate physical card.
run(pane(source,{{items={card(3,source)}}}));assert(count()==3)
-- Fully clipped fifth row is not observed; scroll it into view.
local rows={bag,bag,bag,bag,card(4,source)};local clipped=pane(source,rows)
run(clipped);assert(count()==3);clipped.getYScroll=function() return -80 end;run(clipped);assert(count()==4)
run(pane(source,{{items={card(nil,source)}}}));assert(count()==4)
local before=db['ConspiracyFiles.IdentityObservations'].canonical
failWrite=true;run(pane(source,{{items={card(5,source)}}}));assert(db['ConspiracyFiles.IdentityObservations'].canonical==before)
failWrite=false;run(pane(source,{{items={card(5,source)}}}));assert(count()==5)
db['ConspiracyFiles.AddressBook.Muldraugh']={canonical={payload=string.rep('x',500000)}}
run(pane(source,{{items={card(6,source)}}}));assert(count()==5);db['ConspiracyFiles.AddressBook.Muldraugh']=nil
run(pane(source,{{items={card(6,source)}}}));assert(count()==6)
-- Unknown persisted fields fail closed without replacement.
local saved=db['ConspiracyFiles.IdentityObservations'];saved.unexpected=true
run(pane(source,{{items={card(7,source)}}}));assert(db['ConspiracyFiles.IdentityObservations']==saved);saved.unexpected=nil
-- At most16 observations queued even for a tall pane.
local tall={};for i=100,140 do tall[#tall+1]=card(i,source) end
local tp=pane(source,tall);tp.getHeight=function() return 2000 end
run(tp);assert(count()==22)
isClient=function() return true end;run(pane(source,{{items={card(9,source)}}}));assert(count()==22)
assert(originalCalls>0 and M.validate(db['ConspiracyFiles.IdentityObservations'].canonical))
isClient=function() return false end
local forwarded=0
ConspiracyFiles.LocalPersonRuntime={see=function(item,container)
 assert(item:getContainer()==container)
 forwarded=forwarded+1
end}
local visible=pane(source,{card(999,source)})
I.afterRender(visible); assert(forwarded==1)
visible.parent.isCollapsed=true; I.afterRender(visible); assert(forwarded==1)
I.afterRender(pane(playerInv,{card(999,playerInv)})); assert(forwarded==1)
local hidden=card(998,source); hidden.isHidden=function() return true end
I.afterRender(pane(source,{hidden})); assert(forwarded==1)
print('PASS IdentityObserver: native wrapper, visibility, nested wallet gate, reload dedup, IDs, clipping, failed writes/budget, bounded queue, MP refusal')
