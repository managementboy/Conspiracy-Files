-- Owner decision 2026-10-02: a clue in a container of the car the survivor is
-- SITTING in counts as found when the loot panel opens that container
-- (vanilla turns Search Mode off while seated). Recorded as how="search".
package.path="mod-ofinterest/common/media/lua/client/?.lua;mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local recognised={}
package.loaded["OIShared/EngineAPI"]={GeneratedRuntime={recognise=function(it,how)
    local id=it.md.oiGeneratedId
    if recognised[id] then return true,false end
    recognised[id]={how=how}; return true,true end}}
local W=require("OIShared/SearchedContainerWatch")

local carA,carB={},{}
local seatedIn
local player={}
function player:getVehicle() assert(self==player); return seatedIn end
getSpecificPlayer=function() return player end
local function box(car,ids)
    local items={}
    for _,id in ipairs(ids) do items[#items+1]={md={oiGeneratedId=id},getModData=function(self) return self.md end} end
    items[#items+1]={md={},getModData=function(self) return self.md end} -- ordinary loot
    local part={getVehicle=function() return car end}
    return {getVehiclePart=function() return part end,
        getItems=function() return {size=function() return #items end,get=function(_,i) return items[i+1] end} end,
        getParent=function() return nil end}
end
local page={player=0,selectContainer=function() end}
assert(W.install(page))
local function open(c) page:selectContainer({inventory=c}) end

seatedIn=nil
open(box(carA,{"c1"}))
assert(not recognised.c1,"not seated: opening a car container finds nothing")

seatedIn=carA
open(box(carB,{"c2"}))
assert(not recognised.c2,"a different car's container finds nothing")

open({getItems=function() error("no") end,getParent=function() return nil end})
assert(next(recognised)==nil,"a container that is no car part finds nothing")

open(box(carA,{"c3"}))
assert(recognised.c3 and recognised.c3.how=="search","seated car's container: found, how=search")
assert(W.findSeated(player,box(carA,{"c3"}))==0,"already found: nothing new")
print("PASS seated car find")
