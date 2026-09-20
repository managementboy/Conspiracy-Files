-- Authored for Claude to run: exercise the production placement adapter using
-- receiver-demanding doubles. This cannot establish native engine ordering.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local C=require("ConspiracyFiles/MapMediaCatalogue")
local id=C.list[1]; local point=C.get(id).targets[1]
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
container={getType=function(self)assert(self);return "desk" end,isExplored=function(self)assert(self);return true end,
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
assert(R.start());assert(R.read(id));local seed=db[TAG].canonical.trails[id].seed
assert(R.read(id));assert(db[TAG].canonical.trails[id].seed==seed)
assert(R.injectFault("afterInsert"))
assert(not pcall(R.offerContainer,container,true))
assert(#contents==1 and db[TAG].canonical.trails[id].payoff.state=="intent")
assert(R.start(),"simulate reload after world insertion but before canonical commit")
for _=1,40 do R.tick() end
assert(#contents==1 and db[TAG].canonical.trails[id].payoff.state=="placed","reconcile the actual token without inserting twice")
assert(not R.offerContainer(container,true));assert(#contents==1)
local item=contents[1]
assert(R.recognise(item,"look"))
local before=db[TAG].canonical
assert(not R.inspect(item,true));assert(db[TAG].canonical==before,"failed discovery must not advance map state")
permitDiscovery=true;assert(R.inspect(item,true))
assert(db[TAG].canonical.trails[id].payoff.noted)
contents={};assert(R.start());assert(not R.offerContainer(container,true));assert(#contents==0,"destroyed noted payoff must not respawn")
-- A nil insertion return is not success. It leaves a refusal with no clue.
db={};contents={};insertMode="refuse"
assert(R.start());assert(R.read(id));assert(not R.offerContainer(container,true))
assert(#contents==0 and db[TAG].canonical.trails[id].payoff.state=="refused")
-- An engine exception after insertion can still be proven by the physical token.
db={};contents={};insertMode="throw-after"
assert(R.start());assert(R.read(id));assert(R.offerContainer(container,true))
assert(#contents==1 and db[TAG].canonical.trails[id].payoff.state=="placed")
-- A design with no destination building must not start a trail at all. Eleven
-- of the 125 resolve to nothing in a real game (coverage check, 2026-09-20),
-- and reading one used to invite the survivor to travel somewhere no evidence
-- could ever be waiting. The mock world holds exactly one building, so any
-- design whose target lies outside it has no destination.
db={};contents={};insertMode="ok"
assert(R.start())
for _=1,200 do R.tick(); if R.indexed then break end end
assert(R.indexed,"indexing must finish before absence means anything")
local nowhere
for _,other in ipairs(C.list) do
    local t=C.get(other).targets[1]
    if t and not (t.x>=def:getX() and t.x<def:getX2() and t.y>=def:getY() and t.y<def:getY2()) then
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

print("PASS production adapter: duplicate reads, interrupted insertion, refusal, token recovery, discovery refusal and no respawn")
print("PASS map media: no trail is started toward a design with no destination building, and unknown is not treated as none")
