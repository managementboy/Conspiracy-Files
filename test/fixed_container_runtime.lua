package.path="mod/common/media/lua/shared/?.lua;"..package.path

local function jlist(values)
    return {
        size=function(self) assert(self);return #values end,
        get=function(self,index) assert(self);return values[index+1] end,
    }
end

local searched=false
local opened={}
local container
container={
    getType=function(self) assert(self==container);return "counter" end,
    isExplored=function(self) assert(self==container);return searched end,
}
local decoy
decoy={
    getSprite=function(self) assert(self==decoy);return {getName=function(self) assert(self);return "wrong_sprite" end} end,
    getContainerCount=function(self) assert(self==decoy);return 0 end,
}
local object
object={
    getSprite=function(self) assert(self==object);return {getName=function(self) assert(self);return "fixtures_counters_01_16" end} end,
    getContainerCount=function(self) assert(self==object);return 1 end,
    getContainerByIndex=function(self,index) assert(self==object and index==0);return container end,
}
local liveId="building-A"
local square
square={
    getObjects=function(self) assert(self==square);return jlist({decoy,object}) end,
    getBuilding=function(self)
        assert(self==square)
        return {getDef=function(self)
            assert(self)
            return {getIDString=function(self) assert(self);return liveId end}
        end}
    end,
}
local loaded=true
getCell=function()
    return {getGridSquare=function(self,x,y,z)
        assert(self and x==100 and y==200 and z==0)
        return loaded and square or nil
    end}
end
getPlayerLoot=function(index) assert(index==0);return {backpacks=opened} end

local Runtime=require("ConspiracyFiles/Generated/FixedContainerRuntime")
local signature={buildingId="building-A",x=100,y=200,z=0,sprite="fixtures_counters_01_16",
    containerType="counter",room="kitchen",indexed=true}

loaded=false
local target,live,why=Runtime.resolve(signature)
assert(target==nil and live==nil and why=="unloaded","an unloaded indexed square waits")
loaded=true
target,live,why=Runtime.resolve(signature)
assert(live==container and why==nil,"the live container resolves: "..tostring(why))
assert(target.objectIndex==1 and target.containerIndex==0 and target.indexed==nil,
    "volatile object/container indexes are discovered only in the loaded square")
local throughWorld,worldWhy=require("ConspiracyFiles/WorldAccess").resolve(signature)
assert(throughWorld==container and worldWhy==nil,
    "the generic preparation guard must safely resolve an indexed signature")

searched=true
target,live,why=Runtime.resolve(signature)
assert(target==nil and live==container and why=="already-searched",
    "an indexed container searched before materialisation is refused")
searched=false
opened={{inventory=container}}
target,live,why=Runtime.resolve(signature)
assert(target==nil and live==container and why=="loot-window-open",
    "an indexed container open in the loot UI is refused")
opened={}
liveId="different-building"
target,live,why=Runtime.resolve(signature)
assert(target==nil and why=="building-changed","the live BuildingDef must still match the index")

print("PASS fixed container runtime: loaded-square indices, building identity, searched and open-loot guards")
