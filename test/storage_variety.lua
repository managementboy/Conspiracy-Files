-- Fixed furniture is discovered from the loaded world, then retained by kind
-- so an early run of counters cannot hide a bedroom or a gate mailbox.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local containers,objects={},{}
local function put(x,kind,occupied)
    local c={getType=function() return kind end,getItems=function() return list(occupied and {"item"} or {}) end}
    containers[x]=c
    objects[x]={getContainerCount=function() return 1 end,getContainerByIndex=function() return c end,
        getSprite=function() return {getName=function() return "fixture_"..kind end} end}
end
for x=0,9 do put(x,"counter",x%2==0) end
put(10,"dresser",true);put(11,"wardrobe",false);put(12,"unlisted-cabinet",true);put(13,"floor",false)
local resolves=0
package.preload["ConspiracyFiles/WorldAccess"]=function()
    return {resolve=function(t) resolves=resolves+1; return containers[t.x] end,vehiclesNear=function() return {} end}
end
local Storage=require("ConspiracyFiles/Generated/Storage")
local Choices=require("ConspiracyFiles/Generated/StorageChoices")
local Session=require("ConspiracyFiles/Generated/Session")
local mailboxX=14+Session.OUTDOOR_RADIUS-1
put(mailboxX,Storage.MAILBOX,false)
getCell=function() return {getGridSquare=function(_,x,y,z)
    if y~=0 or z~=0 then return nil end
    if objects[x] then return {getObjects=function() return list{objects[x]} end} end
    return {getObjects=function() return list{} end}
end} end
local result={version="T3-nearby-2",buildings=1,map="mock",gameVersion="42.20",rows={
    {kind="building",id="variety",x=0,y=0,x2=14,y2=1,minLevel=0},
    {kind="room",building="variety",ordinal=1,name="kitchen",x=0,y=0,x2=10,y2=1,z=0,area=10},
    {kind="room",building="variety",ordinal=2,name="bedroom",x=10,y=0,x2=14,y2=1,z=0,area=4},
    {kind="rect",building="variety",room=1,x=0,y=0,z=0,w=10,h=1},
    {kind="rect",building="variety",room=1,x=0,y=0,z=0,w=10,h=1},
    {kind="rect",building="variety",room=2,x=10,y=0,z=0,w=4,h=1},
}}
local catalog,first,candidates,rooms,occupied
local step=assert(Storage.scan(result,function(a,b,c,d,e) catalog,first,candidates,rooms,occupied=a,b,c,d,e end))
for _=1,200000 do
    local before=resolves; local done=step()
    assert(resolves-before<=1,"each scan step resolves at most one physical container")
    if done then break end
end
assert(catalog,"the full bounded scan must finish")
local site=catalog.locations[1];local found=candidates[site.id]
assert(found and #found==12,"eight counters plus each later fixed kind and the mailbox are retained")
assert(first[site.id]==found[1],"first target follows the interleaved candidate order")
local kinds,seen={},{}
for i,target in ipairs(found) do
    local key=table.concat({target.x,target.y,target.z,target.objectIndex,target.containerIndex,target.vehiclePart or "-"},":")
    assert(not seen[key],"duplicate rectangles cannot offer one physical target twice"); seen[key]=true
    assert(target.containerType~="floor","floor containers are never candidates")
    kinds[target.containerType]=(kinds[target.containerType] or 0)+1
    local expectedRoom=target.containerType=="counter" and "kitchen" or "bedroom"
    if target.containerType==Storage.MAILBOX then expectedRoom=nil end
    assert(rooms[site.id][i]==expectedRoom,"room metadata stays aligned after interleaving")
    local expectedOccupied=(target.x<=9 and target.x%2==0) or target.x==10 or target.x==12
    assert(occupied[site.id][i]==expectedOccupied,"occupied metadata stays aligned after interleaving")
    assert(Session.target(target,site),"every offered storage target is valid for its site")
end
assert(kinds.counter==8 and kinds.dresser==1 and kinds.wardrobe==1 and kinds["unlisted-cabinet"]==1
    and kinds[Storage.MAILBOX]==1,"full early counters cannot hide later, printable fixed kinds")
assert(Storage.fixedKind("unlisted-cabinet") and not Storage.fixedKind("floor") and not Storage.fixedKind("none")
    and not Storage.fixedKind("vehicle") and not Storage.fixedKind("carrier"),"fixed-kind rules reserve only non-furniture paths")

local function target(x,kind) return {x=x,y=0,z=0,objectIndex=0,containerIndex=0,containerType=kind} end
local function pick(list,used) return Choices.choose(list,"same-seed",function() return true end,nil,used) end
local base={target(1,"counter"),target(2,"dresser")}
local repeated={target(1,"counter"),target(3,"counter"),target(4,"counter"),target(2,"dresser")}
assert(base[pick(base,{counter=1})].containerType=="dresser" and repeated[pick(repeated,{counter=1})].containerType=="dresser",
    "counter multiplicity does not hide a newly available kind")
for seed=1,40 do
    local function selectFrom(candidates)
        local i=Choices.choose(candidates,tostring(seed),function() return true end)
        return candidates[i].containerType
    end
    assert(selectFrom(base)==selectFrom(repeated),"repeating a kind cannot change its weight in equal-preference choices")
end
local cap=Choices.new()
for i=1,Choices.MAX_KINDS do assert(Choices.offer(cap,target(i,"kind"..i))) end
assert(not Choices.offer(cap,target(99,"ninth-kind")),"the fixed-kind pool stays bounded")
local homogeneous=Choices.new()
for i=1,20 do assert(Choices.offer(homogeneous,target(i,"counter"),"store",false)==(i<=Choices.PER_KIND)) end
local only=Choices.finish(homogeneous)
assert(#only==Choices.PER_KIND,"a homogeneous site still retains eight physical targets")
print("PASS storage variety: fixed kinds, late mailbox, aligned metadata, bounded scan and kind-balanced choices")
