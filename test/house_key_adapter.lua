package.path="mod/common/media/lua/client/?.lua;"..package.path
local calls=0;instanceof=function(o,t)return o.class==t end
InventoryItemFactory={CreateItem=function(t)calls=calls+1;local id=-1;return {getFullType=function()return t end,getContainer=function()return nil end,getWorldItem=function()return nil end,setKeyId=function(_,v)id=v end,getKeyId=function()return id end}end}
local A=require("ConspiracyFiles.HouseKeyAdapter");assert(calls==0,"load side effect")
local factory = InventoryItemFactory.CreateItem
local building = {getDef=function() return {getKeyId=function() return 7 end} end}
for _, alter in ipairs({
    function(item) item.getFullType=function() return "Base.Note" end end,
    function(item) item.getContainer=function() return {} end end,
    function(item) item.getWorldItem=function() return {} end end,
    function(item) item.getContainer=nil end,
    function(item) item.getWorldItem=nil end,
    function(item) item.setKeyId=function() end end,
    function(item) item.setKeyId=function() error("native failure") end end,
}) do
    InventoryItemFactory.CreateItem=function(t)
        local item=factory(t)
        alter(item)
        return item
    end
    assert(A.createForBuilding(building)==nil)
end
InventoryItemFactory.CreateItem=factory
assert(A.createForBuilding({})==nil)
assert(A.createForBuilding({getDef=function() return {getKeyId=function() return -1 end} end})==nil)
calls=0
local function context()
    local key={getKeyId=function() return 7 end}
    local def={getKeyId=function() return 7 end, getIDString=function() return "B" end}
    local obj={class="IsoDoor", getKeyId=function() return 7 end,
        getSquare=function() return {getBuilding=function() return {getDef=function() return def end} end} end,
        checkKeyId=function() error("must never initialize locks") end}
    return {interaction="door", interactionToken="click", heldKey=key,
        player={getInventory=function() return {contains=function(_, item) return item==key end} end},
        interactedDoor=obj, buildingId="B", doorId="D", keyToken="physical-1", factId="match"}
end
for _, alter in ipairs({
    function(c) c.player.getInventory=function() return {contains=function() return false end} end end,
    function(c) c.interactedDoor.class="IsoObject" end,
    function(c) c.heldKey.getKeyId=function() return 8 end end,
    function(c) c.heldKey.getKeyId=function() return -1 end end,
    function(c) c.interactedDoor.getKeyId=function() return -1 end end,
    function(c) c.interactedDoor.getSquare=nil end,
    function(c) c.player.getInventory=function() error("native failure") end end,
    function(c) c.interactedDoor.getSquare=function() return {getBuilding=function() return {getDef=function() error("bad def") end} end} end end,
}) do
    local c=context()
    alter(c)
    assert(A.observeInteractedMatch(c)==nil)
end
assert(A.observeInteractedMatch(context()))
local inRing=context()
local inventory={contains=function() return false end}
inRing.player.getInventory=function() return inventory end
inRing.heldKey.getOutermostContainer=function() return inventory end
assert(A.observeInteractedMatch(inRing))
inRing.heldKey.getOutermostContainer=function() return {} end
assert(A.observeInteractedMatch(inRing)==nil)
local b={getDef=function()return {getKeyId=function()return 7 end}end};local k,w=A.createForBuilding(b);assert(w=="created-detached"and k:getKeyId()==7 and calls==1);assert(A.createForBuilding({getDef=function()error("boom")end})==nil)
local held={getKeyId=function()return 7 end};local door={class="IsoDoor",getKeyId=function()return 7 end,checkKeyId=function()error("must not call")end,getSquare=function()return {getBuilding=function()return {getDef=function()return {getKeyId=function()return 7 end,getIDString=function()return "B"end}end}end}end};local p={getInventory=function()return {contains=function(_,x)return x==held end}end}
local f,e=A.observeInteractedMatch({interaction="door",interactionToken="click",player=p,interactedDoor=door,heldKey=held,buildingId="B",doorId="D",keyToken="physical-1",factId="M"});assert(e=="matching-key-observed"and f.keyToken=="physical-1");assert(A.observeInteractedMatch({interaction="door",interactionToken="x",player=p,interactedDoor=door,heldKey=held,buildingId="wrong",doorId="D",keyToken="p",factId="M"})==nil);assert(A.observeInteractedMatch({interaction="door",interactionToken="",player=p,interactedDoor=door,heldKey=held,buildingId="B",doorId="D",keyToken="p",factId="M"})==nil);door.getKeyId=function()error("native")end;assert(A.observeInteractedMatch({interaction="door",interactionToken="x",player=p,interactedDoor=door,heldKey=held,buildingId="B",doorId="D",keyToken="p",factId="M"})==nil);print("house_key_adapter: ok")
