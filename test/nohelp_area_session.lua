-- The No Help world record inside the Session (phase 5): areas are added in
-- one validated write with waiting clues, each clue only ever goes to its own
-- kind of spot in its own area, nothing expires, nothing retires, and the
-- record only grows.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local S=require("NHShared/Generated/Session")
local AreaCase=require("NHShared/Generated/AreaCase")
local V=require("NHShared/Validator")
local Inventory=require("nohelp_inventory")
local clues=Inventory.clues

local function site(i)
    return {id="t3:b"..i,bounds={x1=i*100,y1=0,x2=i*100+10,y2=10,z=0},containerTypes={"shelves","postbox"}}
end

local root=assert(S.createArea(4242),"a new world record")
assert(S.isArea(root))
local saved=root
local api=assert(S.open(root,function(n) saved=n end))

-- Add an area: its clues arrive waiting at their own area.
local ok,ids=api.addArea{site=site(1),place="farm",clues=clues,version="v1",hours=10}
assert(ok,"an area is added: "..tostring(ids))
assert(#ids>=2)
for _,id in ipairs(ids) do
    local a=saved.assignments[id]
    assert(a.status=="deferred" and a.locationId=="t3:b1" and a.physicalToken=="cf-g2:"..id,"a new clue waits at its own area")
end
assert(S.validate(saved),"the world with an area is valid")
local again=select(2,api.addArea{site=site(1),place="farm",clues=clues,version="v2",hours=11})
assert(again=="decided","an area is decided once")

-- Every clue only goes to its own kind of spot.
local b=site(1).bounds
local targets={
    furniture={x=b.x1,y=b.y1,z=0,objectIndex=0,containerIndex=0,containerType="shelves",sprite="s"},
    mailbox={x=b.x1,y=b.y1,z=0,objectIndex=1,containerIndex=0,containerType="postbox",sprite="p"},
    ground={x=b.x1+1,y=b.y1+1,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true},
    corpse={x=b.x1+2,y=b.y1,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m1"},
}
for spot,t in pairs(targets) do
    for other in pairs(targets) do
        local doc={spot=spot}
        assert(S.intentMatches(doc,targets[other])==(spot==other),
            spot.." clue "..(spot==other and "fits" or "does not fit").." a "..other.." spot")
    end
end

-- Assigning: the clue's own kind of spot is accepted, any other refused.
local doc=saved.case.documents[1]
local wrong=doc.spot=="furniture" and targets.ground or targets.furniture
assert(not api.assign(doc.id,wrong,12),"a clue is refused a spot of another kind")
if targets[doc.spot] then
    assert(api.assign(doc.id,targets[doc.spot],12),"a clue takes a spot of its own kind ("..doc.spot..")")
    assert(saved.assignments[doc.id].status=="pending")
end

-- Nothing expires.
assert(#S.expiredIds(saved,100000)==0,"a waiting No Help clue never expires")

-- Relocation stays in the clue's own area.
local api2=assert(S.open(saved,function(n) saved=n end))
assert(api2.addArea{site=site(2),place="police",clues=clues,version="v1",hours=20})
local elsewhere={x=200,y=0,z=0,objectIndex=0,containerIndex=0,containerType="shelves",sprite="s"}
if saved.assignments[doc.id].status=="pending" then
    assert(api2.status(doc.id,"placing"))
    assert(api2.status(doc.id,"placed",30))
    assert(not api2.relocate(doc.id,elsewhere,40),"a clue never moves to another area")
end

-- Recognising a clue changes assignments only; the record itself is untouched.
local before=#saved.case.documents
assert(not api2.recognise(saved.case.documents[2].id,"search"),"a clue still waiting for its spot is not in the world to be found")
if saved.assignments[doc.id].status=="placed" then
    assert(api2.recognise(doc.id,"search"),"a placed clue is recognised")
end
assert(#saved.case.documents==before and S.validate(saved))

-- Size: a world grows with areas, roughly in proportion.
local w=assert(S.createArea(99)); local wApi=assert(S.open(w,function(n) w=n end))
local sizes={}
for i=1,100 do
    local place=Inventory.places[((i-1)%#Inventory.places)+1]
    assert(wApi.addArea{site=site(100+i),place=place,clues=clues,version="v1",hours=i})
    if i==50 or i==100 then sizes[i]=V.estimateEncodedBytes(w) end
end
-- No size ceiling (owner, 2026-09-27): 100 areas are accepted whatever their
-- size, and the size grows in proportion to areas, never faster.
assert(#w.case.areas==100,"every area was accepted")
assert(sizes[100]<sizes[50]*2.3,"size grows in proportion to areas ("..sizes[50].." -> "..sizes[100]..")")
print(("nohelp area session: 100 areas, %d clues, %d bytes"):format(#w.case.documents,sizes[100]))
