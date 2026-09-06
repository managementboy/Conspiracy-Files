package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local db,items,adds,known={},{},0,false
local bodyMD={}
local body,container,playerInv,player,building,square
local function item(kind,id,label)
    local md={}
    return {class="InventoryItem",keyId=-1,
        getFullType=function() return kind end,getID=function() return id end,
        getDisplayName=function() return label end,getModData=function() return md end,
        getContainer=function(self) return self.container end,
        getOutermostContainer=function(self) return self.container end,
        getWorldItem=function() return nil end,
        setKeyId=function(self,value) self.keyId=value end,
        getKeyId=function(self) return self.keyId end,
        setName=function(self,value) self.label=value end,setCustomName=function() end}
end
container={getParent=function() return body end,getItems=function()
    return {size=function() return #items end,get=function(_,index) return items[index+1] end}
end,AddItem=function(self,value) adds=adds+1;items[#items+1]=value;value.container=self;return value end}
body={class="IsoDeadBody",getModData=function() return bodyMD end,getContainer=function() return container end,
    getX=function() return 1 end,getY=function() return 1 end,getZ=function() return 0 end}
playerInv={contains=function(self,value) return value.container==self end,
    haveThisKeyId=function(self,id) return self.key and self.key.keyId==id and self.key end}
player={getInventory=function() return playerInv end,getModData=function() return {} end,
    getX=function() return 1 end,getY=function() return 1 end,getZ=function() return 0 end}
building={getDef=function() return {getIDString=function() return "house" end,getKeyId=function() return 7 end} end}
square={getBuilding=function() return building end,getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end}
local root={case={caseId="case",documents={{id="clue",locationId="t3:house"}}},assignments={clue={target={x=0,y=0,z=0}}}}
local function reset()
    db={['ConspiracyFiles.Generated.G2']={campaign={canonical=root}}}
    items={};adds=0;known=false;bodyMD={};playerInv.key=nil
end
reset()
package.loaded['ConspiracyFiles/Generated/SuccessiveCases']={
    current=function(store) return store.campaign end,
    sessions=function(wrapper) return {wrapper.canonical} end}
ModData={get=function(tag) return db[tag] end,getOrCreate=function(tag) db[tag]=db[tag] or {};return db[tag] end}
getPlayer=function() return player end
getCell=function() return {getGridSquare=function() return square end} end
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
instanceof=function(object,class) return type(object)=="table" and object.class==class end
InventoryItemFactory={CreateItem=function(kind) return item(kind,99,"House key") end}
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end,known=function()
    return known and {{id="clue",title="Unsigned office copy"}} or {}
end}}
local P=require('ConspiracyFiles/LocalPersonIntegration')
local J=require('ConspiracyFiles/KeyJournal')
local B=require('ConspiracyFiles/SaveBudget')
local function tick() for _=1,30 do P.tick() end end
local function card()
    local value=item('Base.IDcard',1,'ID Card: Dana Vale');value.container=container;return value
end
local id=card();items={id}
assert(adds==0 and #J.rows()==0)
P.see(id,container);tick()
assert(adds==1 and db['ConspiracyFiles.LocalPeople'].canonical.records.case.status=='placed')
local key=items[2]
assert(key.keyId==7 and key:getModData().cfLocalPersonToken=='person-key:case')
P.see(key,container);tick()
key.container=playerInv;playerInv.key=key;items={id}
local door={class='IsoDoor',getSquare=function() return square end,getObjectIndex=function() return 0 end,
    getKeyId=function() return 7 end,checkKeyId=function() error('no lock initialization') end}
P.observeDoor({character=player,item=door})
assert(#J.rows()==0,'unknown clue stays unknown')
known=true;tick()
assert(#J.rows()==1 and J.rows()[1].detailText:find('Dana Vale',1,true))
local rowId=J.rows()[1].id
P.reset();P.see(id,container);tick();P.observeDoor({character=player,item=door})
assert(adds==1 and #J.rows()==1 and J.rows()[1].id==rowId,'replay cannot respawn or duplicate')
-- A failed budget check prevents binding and world placement.
reset();P.reset();id=card();items={id}
local check=B.check;B.check=function() return false end
P.see(id,container);tick();assert(adds==0 and db['ConspiracyFiles.LocalPeople']==nil)
B.check=check
-- A persisted interrupted intent with no surviving key stays unknown.
P.see(id,container);tick();assert(adds==1)
local record=db['ConspiracyFiles.LocalPeople'].canonical.records.case
record.status='placing';items={id};adds=0
P.reset();P.see(id,container);tick()
assert(adds==0 and record~=db['ConspiracyFiles.LocalPeople'].canonical.records.case)
assert(db['ConspiracyFiles.LocalPeople'].canonical.records.case.status=='unknown')
P.see(id,container);tick();assert(adds==0)
-- A visible closed wallet does not expose its identity documents.
reset();P.reset()
local wallet=item('Base.Wallet',44,'Wallet');wallet.container=container
wallet.getInventory=function() error('must not inspect hidden wallet contents') end
items={wallet};P.see(wallet,container);tick()
assert(db['ConspiracyFiles.LocalPeople']==nil and adds==0)
-- The observed wallet retains its source after being moved. Opening it may
-- bind the name, but placement waits for the original corpse to be observed.
wallet.container={}
local walletInventory={getContainingItem=function() return wallet end}
local walletCard=item('Base.IDcard',45,'ID Card: Wallet Owner');walletCard.container=walletInventory
P.see(walletCard,walletInventory);tick()
assert(db['ConspiracyFiles.LocalPeople'].canonical.records.case.status=='pending' and adds==0)
P.reset()
local shirt=item('Base.Shirt',46,'Shirt');shirt.container=container;items={shirt}
P.see(shirt,container);tick()
assert(adds==1 and db['ConspiracyFiles.LocalPeople'].canonical.records.case.status=='placed')
reset();P.reset()
local loose=item('Base.IDcard',55,'ID Card: Other')
local floor={};loose.container=floor;P.see(loose,floor);tick()
assert(db['ConspiracyFiles.LocalPeople']==nil and adds==0)
print('PASS local person integration: real reducers/journal, key placement, reverse discovery, replay, budget, interrupted intent, hidden wallet gate')
