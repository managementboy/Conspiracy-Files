-- No Help, moving clues (task 3 plan step 6; owner decisions 2026-09-27):
--   * an unfound clue may move, silently, only within its own area and only
--     to the same kind of spot;
--   * once the Search Mode icon has shown a clue, it never moves again;
--   * a spot that gave up a clue is never reused;
--   * a body that burns or vanishes: a found clue disappears with it, an
--     unfound one is placed again elsewhere at its own area and kind of spot.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local S=require("NHShared/Generated/Session")
local StaleClue=require("NHShared/StaleClue")
local Inventory=require("nohelp_inventory")

local site={id="t3:b1",bounds={x1=100,y1=0,x2=120,y2=20,z=0},containerTypes={"shelves","postbox","vehicle"}}
local root=assert(S.createArea(31)); local saved=root
local api=assert(S.open(root,function(n) saved=n end))
local ok,ids=api.addArea{site=site,place="farm",clues=Inventory.clues,version="v1",hours=1}
assert(ok,tostring(ids))

local spotOf={}
for _,d in ipairs(saved.case.documents) do spotOf[d.id]=d.spot end
local function target(spot,i)
    local x,y=site.bounds.x1+i,site.bounds.y1+i
    if spot=="furniture" then return {x=x,y=y,z=0,objectIndex=i,containerIndex=0,containerType="shelves",sprite="s"} end
    if spot=="mailbox" then return {x=x,y=y,z=0,objectIndex=i,containerIndex=0,containerType="postbox",sprite="p"} end
    if spot=="ground" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true} end
    if spot=="vehicle" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="car",vehiclePart="GloveBox"..i} end
    if spot=="corpse" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m"..i} end
end
local placedAt={}
for i,id in ipairs(ids) do
    placedAt[id]=target(spotOf[id],i)
    assert(api.assign(id,placedAt[id],2)); assert(api.status(id,"placing")); assert(api.status(id,"placed",3))
end

-- Relocation stays in the clue's own area.
local dests=StaleClue.destinations(saved,{},ids[1])
assert(#dests==1 and dests[1].id==site.id,"a clue's only destination is its own area")

-- A move to the same kind of spot within the area is allowed while unshown.
local a,b
for _,id in ipairs(ids) do
    if spotOf[id]=="furniture" or spotOf[id]=="ground" then
        if not a then a=id elseif not b then b=id end
    end
end
assert(a and b,"the fixture gives this area two clues with ordinary spots")
assert(api.relocate(a,target(spotOf[a],15),10),"an unfound, unshown clue may move within its area")
local elsewhere={x=500,y=500,z=0,objectIndex=1,containerIndex=0,containerType="shelves",sprite="s"}
assert(not api.relocate(a,elsewhere,10),"never outside its area")

-- Once Search Mode has shown it, it never moves again, even after a reload.
assert(api.show(b))
local reopened=assert(S.open(saved,function(n) saved=n end))
assert(reopened.isShown(b),"shown is saved")
assert(not reopened.relocate(b,target(spotOf[b],16),11),"a clue Search Mode has shown never moves")

-- A spot that gave up a clue is never reused. A fresh copy of the same
-- world, so the clue moved into the spent spot is neither shown nor moved.
local w2=assert(S.createArea(31)); local saved2=w2
local api2=assert(S.open(w2,function(n) saved2=n end))
assert(api2.addArea{site=site,place="farm",clues=Inventory.clues,version="v1",hours=1})
local first,second
for _,id in ipairs(ids) do
    if spotOf[id]~="corpse" and spotOf[id]~="vehicle" then
        for _,other in ipairs(ids) do
            if other~=id and spotOf[other]==spotOf[id] and not first then first,second=id,other end
        end
    end
end
for i,id in ipairs(ids) do
    assert(api2.assign(id,target(spotOf[id],i),2)); assert(api2.status(id,"placing")); assert(api2.status(id,"placed",3))
end
assert(first,"this area has two clues sharing an ordinary kind of spot, so the spent-spot rule is really tested")
do
    assert(api2.recognise(first,"search"),"a clue is found")
    local spentSpot=target(spotOf[first],0)
    for i,id in ipairs(ids) do if id==first then spentSpot=target(spotOf[first],i) end end
    assert(saved2.spent[S.physicalKey(spentSpot)]==true,"the spot it gave up is saved as spent")
    assert(not api2.relocate(second,spentSpot,12),"a spot that gave up a clue is never moved into")
end

-- A lost body.
local onBody
for _,id in ipairs(ids) do if spotOf[id]=="corpse" then onBody=id break end end
assert(onBody,"this area has a clue on a body, so the lost-body rule is really tested")
do
    local api3=assert(S.open(saved,function(n) saved=n end))
    assert(api3.dropMissing(onBody,40),"an unfound clue on a lost body is taken back")
    assert(saved.assignments[onBody].status=="deferred","it waits to be placed again at its own area")
    assert(saved.assignments[onBody].locationId==site.id)
end
assert(not api2.dropMissing(first,40),"a found clue is never taken back; it is gone with its body")
assert(S.validate(saved),"the world record is valid after all of this")
print("nohelp moves: own area only, shown never moves, spent spots never reused, lost bodies re-placed")
