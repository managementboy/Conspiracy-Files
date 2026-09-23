package.path="mod/common/media/lua/shared/?.lua;"..package.path

local worldReads=0
package.preload["ConspiracyFiles/WorldAccess"]=function()
    return {
        resolve=function() return nil end,
        vehiclesNear=function() return {} end,
    }
end
getCell=function()
    worldReads=worldReads+1
    return {getGridSquare=function() return nil end}
end

local Storage=require("ConspiracyFiles/Generated/Storage")
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local result={version="T3-nearby-2",buildings=1,map="Muldraugh, KY",gameVersion="42.20.4",rows={
    {kind="building",id="building-A",x=100,y=200,x2=110,y2=210,minLevel=0},
    {kind="room",building="building-A",ordinal=1,name="office",x=100,y=200,x2=110,y2=210,z=0,area=100},
    {kind="rect",building="building-A",room=1,x=100,y=200,z=0,w=10,h=10},
}}
local bundle={{schema=1,map="Muldraugh, KY",build="42.20.4",source="fixture",rows={
    {"building-A",103,204,0,"fixtures_counters_01_16","counter","office"},
}}}
local catalog,targets,candidates,rooms
local step=assert(Storage.scan(result,function(a,b,c,d) catalog,targets,candidates,rooms=a,b,c,d end,nil,bundle))
assert(step()==true,"an exact shipped index needs no fixed-furniture walk")
assert(worldReads==0,"indexed fixed selection performs no square reads")
local list=candidates["t3:building-A"]
assert(#list==1 and list[1].indexed and list[1].objectIndex==nil and list[1].containerIndex==nil)
assert(rooms["t3:building-A"][1]=="office")
assert(targets["t3:building-A"]==list[1] and catalog.locations[1].paperStorage=="indexed")
local valid,why=Catalog.validate(catalog)
assert(valid,"the fixed-index catalogue must remain valid: "..tostring(why))
local eligible=assert(Catalog.eligible(catalog,result.map,result.gameVersion,false))
assert(#eligible==1 and eligible[1].id=="t3:building-A",
    "indexed storage is a positive eligibility fact, not missing storage")

-- Real Build 42 reports a semicolon-separated active map stack. The base-map
-- index must activate when its exact map name is one member of that stack.
worldReads=0
local stacked={}
for key,value in pairs(result) do stacked[key]=value end
stacked.map="Brandenburg, KY;Echo Creek, KY;Muldraugh, KY"
local stackDone=false
local stackStep=assert(Storage.scan(stacked,function() stackDone=true end,nil,bundle))
assert(stackStep()==true and stackDone,"the active map stack must use the shipped fixed index")
assert(worldReads==0,"map-stack index activation must not fall back to a furniture walk")

local fallbackReads=0
getCell=function()
    fallbackReads=fallbackReads+1
    return {getGridSquare=function() return nil end}
end
local fallback=assert(Storage.scan(result,function() end,nil,{{schema=1,map="Muldraugh, KY",build="42.21",rows={}}}))
fallback()
assert(fallbackReads>0,"an unsupported build retains the bounded live fixed-container scan")

print("PASS storage fixed index: exact build avoids furniture scan; unsupported build keeps live fallback")
