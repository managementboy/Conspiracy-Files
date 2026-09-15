package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
instanceof=function(o,t)return o.class==t end
InventoryItemFactory={CreateItem=function()local id,md;md={};return {getFullType=function()return "Base.Key1"end,getContainer=function()return nil end,getWorldItem=function()return nil end,setKeyId=function(_,v)id=v end,getKeyId=function()return id end,getModData=function()return md end,setName=function()end,setCustomName=function()end}end}
local R=require("ConspiracyFiles/LocalPersonRuntime");local L=require("ConspiracyFiles/LocalPerson")
-- Occupation must be observed, never invented: a hardcoded trade was a
-- fabricated world fact about a body that never showed one.
local s=assert(R.bindVisible(L.empty(),{caseId="c",buildingId="b",sourceToken="corpse:1",name="Dana",keyToken="key:1",keyId=7}));assert(s.records.c.assignedOccupation==R.UNRECORDED_OCCUPATION)
local observed=assert(R.bindVisible(L.empty(),{caseId="c",buildingId="b",sourceToken="corpse:1",name="Dana",occupation="Carpenter",keyToken="key:1",keyId=7}));assert(observed.records.c.assignedOccupation=="Carpenter")
for _,bad in ipairs({"","   ",{},42}) do
 local fallback=assert(R.bindVisible(L.empty(),{caseId="c",buildingId="b",sourceToken="corpse:1",name="Dana",occupation=bad,keyToken="key:1",keyId=7}))
 assert(fallback.records.c.assignedOccupation==R.UNRECORDED_OCCUPATION,"unusable occupation falls back rather than asserting one")
end
assert(R.bindVisible(s,{caseId="c",buildingId="b",sourceToken="corpse:1",name="Other",keyToken="key:1",keyId=7})==nil)
local p=assert(R.intent(s,"c"));local building={getDef=function()return {getKeyId=function()return 7 end}end};local k=assert(R.createKey(building,p.records.c));assert(k:getModData().cfLocalPersonCase=="c")
local u=assert(R.reconcile(p,"c",0));assert(u.records.c.status=="unknown");assert(R.reconcile(u,"c",1,true));assert(R.reconcile(p,"c",2).records.c.status=="conflict")
print("PASS LocalPersonRuntime: visible-only bind, durable intent, detached stamped key and bounded reconciliation")
