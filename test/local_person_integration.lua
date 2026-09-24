package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;test/?.lua;"..package.path
-- A REAL generated session, validated by the shipped validator. This test used
-- to carry a literal root AND stub out SuccessiveCases so that nothing checked
-- it - which meant the one mock in here was hiding the very integration it
-- existed to prove. See test/fixtures/generated_session.lua.
local Fixture=require("fixtures/generated_session")
local session=Fixture.store()
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
-- The building is the one the generated case actually placed its first
-- document in, not an invented name: P.known derives its buildingId from the
-- document's locationId, and the two have to be the same building or no
-- connection can ever chain.
building={getDef=function() return {getIDString=function() return session.buildingId end,getKeyId=function() return 7 end} end}
square={getBuilding=function() return building end,getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end}
local function reset()
    db={['ConspiracyFiles.Generated.G2']=Fixture.store().store}
    items={};adds=0;known=false;bodyMD={};playerInv.key=nil
end
reset()
-- No SuccessiveCases stub. It used to be replaced with three one-line
-- functions that skipped validation entirely, so the hand-made session in here
-- was never checked and the real refusal ("legacy canonical refused") could
-- never surface. The shipped module reads the fixture now.
ModData={get=function(tag) return db[tag] end,getOrCreate=function(tag) db[tag]=db[tag] or {};return db[tag] end}
getPlayer=function() return player end
getCell=function() return {getGridSquare=function() return square end} end
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
instanceof=function(object,class) return type(object)=="table" and object.class==class end
InventoryItemFactory={CreateItem=function(kind) return item(kind,99,"House key") end}
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end,known=function()
    return known and {{id=session.docId,title="Unsigned office copy"}} or {}
end}}
local P=require('ConspiracyFiles/LocalPersonIntegration')
local J=require('ConspiracyFiles/KeyJournal')
local B=require('ConspiracyFiles/SaveBudget')
-- A DISCOVERY LANDING is what re-derives clue facts, and the production code
-- keys that on DiscoveryLog.highestSeq() advancing: P.tick refuses to rebuild
-- derived facts otherwise, because doing it unconditionally cost two evidence
-- row rebuilds and a fistful of street-address lookups every second of every
-- save (measured in game, 2026-09-12).
--
-- So a test that "makes a clue known" by flipping a boolean on the runtime
-- stub is not simulating a discovery at all - it changes what known() returns
-- while the signal the code watches stays still, and the derivation is
-- correctly skipped. That is why this test could record three of the four
-- facts a connection needs and never the fourth.
--
-- discover() moves both together, the way the game does.
local seq=0
ConspiracyFiles.DiscoveryLog={highestSeq=function() return seq end}
local function tick() for _=1,30 do P.tick() end end
local function discover() known=true; seq=seq+1; tick() end
local function card()
    local value=item('Base.IDcard',1,'ID Card: '..session.personName);value.container=container;return value
end
-- Only the case's own person binds the case (owner, Windows, 2026-09-14). The
-- first named card on ANY body used to take it, so a stranger's corpse became
-- the case's person beside the one the case itself had named, and was given
-- the house key.
assert(type(session.personName)=="string","the fixture case must name its person")
do
    local stranger=item('Base.IDcard',2,'ID Card: Somebody Else');stranger.container=container
    items={stranger}
    P.see(stranger,container);tick()
    assert(adds==0 and db['ConspiracyFiles.LocalPeople']==nil,"a stranger's card must not bind the case to their body")
    reset();P.reset()
end
local id=card();items={id}
assert(adds==0 and #J.rows()==0)
P.see(id,container);tick()
assert(adds==1 and db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='placed')
local key=items[2]
assert(key.keyId==7 and key:getModData().cfLocalPersonToken=='person-key:'..session.caseId)
P.see(key,container);tick()
key.container=playerInv;playerInv.key=key;items={id}
local door={class='IsoDoor',getSquare=function() return square end,getObjectIndex=function() return 0 end,
    getKeyId=function() return 7 end,checkKeyId=function() error('no lock initialization') end}
P.observeDoor({character=player,item=door})
-- The match itself is now visible (owner, Windows playtest 2026-09-24: using a
-- key on the door it fits must be recorded). The knowledge gate is unchanged
-- and is what this step actually guards: the bare observation reports the
-- player's own action and must not name the clue or the person behind it
-- before either has been discovered.
local beforeDiscovery=J.rows()
assert(#beforeDiscovery==1,'the key-door observation must be recorded')
assert(not beforeDiscovery[1].detailText:find(session.personName,1,true),
    'an undiscovered person was named by the bare key-door observation')
assert(beforeDiscovery[1].id:find('keydoor:',1,true),
    'the row before discovery must be the bare observation, not the connection')
discover()
-- Once the clue is discovered the connection forms and replaces the bare
-- observation rather than sitting beside it.
assert(#J.rows()==1 and J.rows()[1].detailText:find(session.personName,1,true))
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
local record=db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId]
record.status='placing';items={id};adds=0
P.reset();P.see(id,container);tick()
assert(adds==0 and record~=db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId])
assert(db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='unknown')
P.see(id,container);tick();assert(adds==0)
-- A visible closed wallet does not expose its identity documents. Every card
-- below carries the case's own person's name (P4-R101), so what each step
-- proves is the wallet or body gate, not the name rule.
reset();P.reset()
local wallet=item('Base.Wallet',44,'Wallet');wallet.container=container
wallet.getInventory=function() error('must not inspect hidden wallet contents') end
items={wallet};P.see(wallet,container);tick()
assert(db['ConspiracyFiles.LocalPeople']==nil and adds==0)
-- The observed wallet retains its source after being moved. Opening it may
-- bind the name, but placement waits for the original corpse to be observed.
wallet.container={}
local walletInventory={getContainingItem=function() return wallet end}
local walletCard=item('Base.IDcard',45,'ID Card: '..session.personName);walletCard.container=walletInventory
P.see(walletCard,walletInventory);tick()
assert(db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='pending' and adds==0)
P.reset()
local shirt=item('Base.Shirt',46,'Shirt');shirt.container=container;items={shirt}
P.see(shirt,container);tick()
assert(adds==1 and db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='placed')
reset();P.reset()
local loose=item('Base.IDcard',55,'ID Card: '..session.personName)
local floor={};loose.container=floor;P.see(loose,floor);tick()
assert(db['ConspiracyFiles.LocalPeople']==nil and adds==0)
-- The transfer hook establishes corpse provenance before the wallet can be
-- opened. The ID is still observed only after the player opens that wallet.
reset();P.reset()
local transferred=item('Base.Wallet',77,'Wallet')
local transferredInventory={getContainingItem=function() return transferred end}
transferred.getInventory=function() return transferredInventory end
transferred.container=playerInv
P.observeTransfer({character=player},transferred,container,playerInv)
assert(transferred:getModData().cfObservedSource=='corpse-wallet:77')
local transferredID=item('Base.IDcard',78,'ID Card: '..session.personName)
transferredID.container=transferredInventory
P.see(transferredID,transferredInventory);tick()
assert(db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='pending' and adds==0)
transferred.container=container
P.observeTransfer({character=player},transferred,playerInv,container)
assert(adds==1 and db['ConspiracyFiles.LocalPeople'].canonical.records[session.caseId].status=='placed')
print('PASS local person integration: real reducers/journal, key placement, reverse discovery, replay, budget, interrupted intent, hidden wallet gate')
