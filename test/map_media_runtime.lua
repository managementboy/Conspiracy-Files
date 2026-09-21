-- Authored for Claude to run: exercise the production placement adapter using
-- receiver-demanding doubles. This cannot establish native engine ordering.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local C=require("ConspiracyFiles/MapMediaCatalogue")
local id="MulStashMap11"; local point=C.get(id).targets[1]
local function list(items)
    return {size=function(self) assert(self); return #items end,
        get=function(self,i) assert(self); return items[i+1] end}
end
local db,contents={},{}
local TAG="ConspiracyFiles.MapMedia"
ModData={get=function(tag)return db[tag]end,getOrCreate=function(tag)db[tag]=db[tag] or {};return db[tag]end}
local def={getX=function()return point.x-1 end,getY=function()return point.y-1 end,
    getX2=function()return point.x+2 end,getY2=function()return point.y+2 end,getIDString=function()return "native-building" end}
local building={getDef=function(self)assert(self);return def end}
local square,object,container,player
local sprite={getName=function(self)assert(self);return "furniture_office_01_1" end}
local insertMode="ok"
local containerKind="desk"
container={getType=function(self)assert(self);return containerKind end,isExplored=function(self)assert(self);return true end,
    getParent=function(self)assert(self);return object end,getItems=function(self)assert(self);return list(contents) end,
    AddItem=function(self,item)
        assert(self==container)
        if insertMode=="refuse" then return nil end
        contents[#contents+1]=item
        if insertMode=="throw-after" then error("engine threw after insertion") end
        return item
    end}
object={getSquare=function(self)assert(self);return square end,getSprite=function(self)assert(self);return sprite end,
    getContainerCount=function(self)assert(self);return 1 end,
    getContainerByIndex=function(self,i)assert(self);assert(i==0);return container end}
square={getBuilding=function(self)assert(self);return building end,
    getX=function()return point.x end,getY=function()return point.y end,getZ=function()return 0 end,
    getObjects=function(self)assert(self);return list({object})end,
    getRoom=function()return {getName=function()return "office"end}end}
local inventory={}; local playerData={}
player={getSquare=function()return square end,getX=function()return point.x end,getY=function()return point.y end,
    getZ=function()return 0 end,getInventory=function()return inventory end,getModData=function()return playerData end,
    getDescriptor=function()return {getCharacterProfession=function()return nil end}end,getPerkLevel=function()return 0 end}
getPlayer=function()return player end
getCell=function()return {getGridSquare=function(_,x,y)if x==point.x and y==point.y then return square end end}end
getWorld=function()return {getMetaGrid=function()return {getBuildings=function()return list({def})end}end}end
getGameTime=function()return {getWorldAgeHours=function()return 100 end}end
local ms=0;getTimestampMs=function()ms=ms+1;return ms end
getDebug=function()return true end;isClient=function()return false end;isServer=function()return false end
ZombRand=function()return 42 end;instanceof=function()return false end;Perks={};Events=nil
instanceItem=function(kind)
    local md={};return {getModData=function(self)assert(self);return md end,
        getOutermostContainer=function()return container end,setName=function()end,
        setCustomName=function()end,setDisplayCategory=function()end,kind=kind}
end
package.loaded["ConspiracyFiles/MapMediaRead"]={start=function()return true end}
package.loaded["ConspiracyFiles/GeneratedMenu"]={}
package.loaded["ConspiracyFiles/ClueSearch"]={}
local permitDiscovery=false
package.loaded["ConspiracyFiles/DiscoveryLog"]={record=function(_,_,replacement)
    if not permitDiscovery then return false end
    db[TAG].canonical=replacement;return true
end}
local R=require("ConspiracyFiles/MapMediaRuntime")
local function advanceUntil(predicate)
    for _=1,30000 do
        R.tick()
        if predicate() then return end
    end
    error("map adapter did not reach the required state within bounded scheduler work")
end
local function payoff(design)
    local root=db[TAG] and db[TAG].canonical
    return root and root.trails[design] and root.trails[design].payoff
end

assert(R.start());assert(R.read(id));local seed=db[TAG].canonical.trails[id].seed
assert(R.read(id));assert(db[TAG].canonical.trails[id].seed==seed)
assert(R.injectFault("afterInsert",id,4))
assert(R.offerContainer(container,true))
assert(#contents==0,"offering a candidate must not bypass diverse selection")
advanceUntil(function() return R.status().pendingFault==nil end)
assert(#contents==1 and db[TAG].canonical.trails[id].payoff.state=="intent")
assert(R.start(),"simulate reload after world insertion but before canonical commit")
advanceUntil(function() return payoff(id) and payoff(id).state=="placed" end)
assert(#contents==1 and db[TAG].canonical.trails[id].payoff.state=="placed","reconcile the actual token without inserting twice")
assert(not R.offerContainer(container,true));assert(#contents==1)
local item=contents[1]
assert(#R.clueTargets()==1 and not R.clueTargets()[1].recognised,"the placed payoff can be searched")
assert(R.recognise(item,"look"))
assert(#R.clueTargets()==1 and R.clueTargets()[1].recognised,"recognition keeps the payoff searchable")
local before=db[TAG].canonical
assert(not R.inspect(item,true));assert(db[TAG].canonical==before,"failed discovery must not advance map state")
permitDiscovery=true;assert(R.inspect(item,true))
assert(db[TAG].canonical.trails[id].payoff.noted)
assert(#R.clueTargets()==0,"noting the payoff clears its search target")
contents={};assert(R.start());assert(not R.offerContainer(container,true));assert(#contents==0,"destroyed noted payoff must not respawn")
-- A nil insertion return is not success. It leaves a refusal with no clue.
db={};contents={};insertMode="refuse"
assert(R.start());assert(R.read(id));assert(R.offerContainer(container,true))
advanceUntil(function() return payoff(id) and payoff(id).state=="refused" end)
assert(#contents==0 and payoff(id).state=="refused")
-- An engine exception after insertion can still be proven by the physical token.
db={};contents={};insertMode="throw-after"
assert(R.start());assert(R.read(id));assert(R.offerContainer(container,true))
advanceUntil(function() return payoff(id) and payoff(id).state=="placed" end)
assert(#contents==1 and payoff(id).state=="placed")
-- An unreviewed building-bound design outside the mock world has no
-- destination. Reviewed outdoor areas are handled independently below.
db={};contents={};insertMode="ok"
assert(R.start())
for _=1,200 do R.tick(); if R.indexed then break end end
assert(R.indexed,"indexing must finish before absence means anything")
local nowhere
for _,other in ipairs(C.list) do
    local t=C.get(other).targets[1]
    if not C.get(other).areas and t and not (t.x>=def:getX() and t.x<def:getX2() and t.y>=def:getY() and t.y<def:getY2()) then
        nowhere=other; break
    end
end
assert(nowhere,"the fixture needs a design outside the mock building")
assert(not R.read(nowhere),"a design with no destination must refuse the read")
assert(db[TAG]==nil or db[TAG].canonical==nil or db[TAG].canonical.trails[nowhere]==nil,
    "and must leave no trail behind")
-- The design that DOES have a destination still reads, so the gate refuses the
-- unreachable rather than everything.
assert(R.read(id),"a design with a real destination must still start its trail")

-- Before indexing finishes, absence is unknown, not empty: the gate must not
-- refuse simply because the search has not run yet.
db={};contents={};R.invalidate()
assert(R.start())
assert(not R.indexed,"a fresh start has not indexed yet")
assert(R.read(nowhere),"an unindexed world must not be treated as having no destinations")

-- The shipped pair follows two real restaurant marks to the same Spiffo's.
-- This is the production catalogue pair, not a synthetic giant building.
db={};contents={};insertMode="ok";R.invalidate()
local second="MulStashMap16"
local p2=C.get(second).targets[1]
assert(C.get(id).sharedPeer==second and p2.x==point.x and p2.y==point.y)
assert(R.start())
advanceUntil(function() return R.indexed end)
assert(R.read(id) and R.read(second))
assert(R.injectFault("afterInsert",second,4))
assert(R.offerContainer(container,true))
advanceUntil(function() return R.status().lastFault~=nil end)
local receipt=R.status().lastFault
assert(receipt.id==second and receipt.part==4 and receipt.recorded=="intent")
assert(payoff(id).state=="placed","the first design must not consume another design's interruption")
assert(#contents==2 and payoff(second).state=="intent")
advanceUntil(function() return payoff(second).state=="placed" end)
assert(not R.offerContainer(container,true) and #contents==2)
assert(contents[1]:getModData().cfMapDesign~=contents[2]:getModData().cfMapDesign)

-- OnFill permission cannot migrate to replacement furniture at the same
-- coordinates, object index, kind and sprite. The replacement is unexplored.
db={};contents={};R.invalidate();assert(R.start());assert(R.read(id))
local filledContainer=container
assert(R.offerContainer(filledContainer,true))
local replacement={}
for k,v in pairs(filledContainer) do replacement[k]=v end
replacement.isExplored=function(self) assert(self);return false end
container=replacement
for _=1,6000 do R.tick() end
assert(#contents==0 and not payoff(id),"stale fill callback must not authorise replacement furniture")
assert(R.offerContainer(container,true),"the replacement's own real fill completion can authorise it")
advanceUntil(function() return payoff(id) and payoff(id).state=="placed" end)
assert(#contents==1)
container.isExplored=function(self) assert(self);return true end

-- An actual marked outdoor destination can use fixed furniture without a
-- building. Floors remain excluded; an ordinary drawer is eligible.
db={};contents={};R.invalidate();containerKind="floor"
local outside="WorldStashMap3"
point=C.get(outside).targets[1]
square.getBuilding=function() return nil end
getWorld=function() return {getMetaGrid=function() return {getBuildings=function() return list({}) end} end} end
assert(R.start());advanceUntil(function() return R.indexed end)
assert(R.coverage(outside).buildings==0 and R.coverage(outside).areas>0)
assert(R.read(outside),"a reviewed marked area is a destination without a building")
assert(not R.offerContainer(container,true),"ground is not furniture")
containerKind="wardrobe"
assert(R.offerContainer(container,true))
advanceUntil(function() return payoff(outside) and payoff(outside).state=="placed" end)
assert(#contents==1 and payoff(outside).target.containerType=="wardrobe")
assert(db[TAG].canonical.entries[outside]~=nil,"entering the real marked area is recorded")
print("PASS production adapter: scoped interruption, token recovery, exact shared map pair, outdoor furniture and floor exclusion")
