-- Focused test: the four new EvidenceKinds carriers (ID card, credit card,
-- business card, ticket) reuse fullTypes that IdentityObserver also watches
-- for identity observations. A generated-case item of one of these types
-- must be recorded once, as generated evidence, never a second time as an
-- identity observation. See mod/common/media/lua/shared/ConspiracyFiles/Generated/EvidenceKinds.lua
-- and mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

-- Part 1: the whitelist itself carries verified, distinct fullTypes for the
-- four new carrier kinds, and never asserts identity/ownership in its text.
local K=require("ConspiracyFiles/Generated/EvidenceKinds")
local newKinds={
 idcard="Base.IDcard",
 creditcard="Base.CreditCard",
 businesscard="Base.BusinessCard",
 ticket="Base.ParkingTicket",
}
local seen={}
for kind,fullType in pairs(newKinds) do
 local ok,v=K.validate(kind)
 assert(ok and v.fullType==fullType,"kind "..kind.." must resolve to "..fullType)
 assert(not seen[v.fullType],"fullType "..v.fullType.." reused across kinds")
 seen[v.fullType]=true
 assert(v.short~="" and v.label~="")
 for _,text in ipairs({v.label,v.short}) do
  local lower=text:lower()
  assert(not lower:find("owned by") and not lower:find("belongs to") and not lower:find("is the"),
   "carrier text must not assert identity/ownership: "..text)
 end
end

-- Part 2: IdentityObserver must not double-record a generated-case item that
-- happens to share a fullType with a watched identity document type.
next=nil
package.preload['ISUI/ISInventoryPane']=function() end
local callbacks={}
Events={OnTick={Add=function(f) callbacks.tick=f end},OnGameStart={Add=function(f) callbacks.start=f end}}
ISInventoryPane={render=function() end}
local db={}
ModData={get=function(k) return db[k] end,getOrCreate=function(k) db[k]=db[k] or {};return db[k] end}
local playerInv={}
local player={getInventory=function() return playerInv end,getX=function() return 10 end,getY=function() return 20 end,
 getZ=function() return 0 end,getModData=function() return {} end}
getPlayer=function() return player end;getSpecificPlayer=function(n) if n==0 then return player end end
getGameTime=function() return {getWorldAgeHours=function() return 1 end} end
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
instanceof=function(o,k) return type(o)=='table' and o.kind==k end
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end},NotebookUI={refresh=function() end}}
local corpse={kind='IsoDeadBody'}
local container={getParent=function() return corpse end,getType=function() return 'inventorymale' end}
local function item(id,fullType,modData)
 return {kind='InventoryItem',getID=function() return id end,getFullType=function() return fullType end,
  getDisplayName=function() return "ID Card: Found Person" end,getContainer=function() return container end,
  isHidden=function() return false end,getModData=function() return modData or {} end}
end
local function pane(rows)
 return {mode='details',player=0,inventory=container,items=rows,itemHgt=20,headerHgt=20,
  parent={isReallyVisible=function() return true end},isReallyVisible=function() return true end,
  getYScroll=function() return 0 end,getHeight=function() return 100 end}
end
local I=require('ConspiracyFiles/IdentityObserver')
local function run(p) ISInventoryPane.render(p);for i=1,20 do callbacks.tick() end end
local function count() return #I.rows() end

-- A generated-case evidence item (cfGeneratedId stamped, as GeneratedRuntime
-- does) sharing Base.IDcard must NOT become an identity observation.
local generated=item(1,'Base.IDcard',{cfGeneratedId='generated:1:document-4',cfPhysicalToken='tok-1'})
run(pane({{items={generated}}}))
assert(count()==0,"generated-case evidence must not be recorded as an identity observation")

-- The same fullType, without generated-case ModData, still behaves as a
-- normal identity observation (regression: the guard must be narrow).
local plain=item(2,'Base.IDcard')
run(pane({{items={plain}}}))
assert(count()==1,"a plain (non-generated) ID card must still be observed")

-- Other new collision types (credit card, business card, ticket) are also
-- suppressed when generated, and observed when not.
local otherTypes={'Base.CreditCard','Base.BusinessCard','Base.ParkingTicket'}
local nextId=3
for _,fullType in ipairs(otherTypes) do
 local gen=item(nextId,fullType,{cfGeneratedId='generated:1:document-'..nextId,cfPhysicalToken='tok-'..nextId})
 nextId=nextId+1
 run(pane({{items={gen}}}))
end
assert(count()==1,"no generated collision-type item may be recorded as an identity observation")
for _,fullType in ipairs(otherTypes) do
 local plainOther=item(nextId,fullType)
 nextId=nextId+1
 run(pane({{items={plainOther}}}))
end
assert(count()==4,"plain (non-generated) items of the same collision types are still observed")

print("PASS generated_evidence_identity_collision: new EvidenceKinds carriers verified and IdentityObserver double-record guard holds")
