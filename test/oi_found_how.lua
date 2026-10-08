-- No Help, owner directive 2 (NH-D2): the survivor finds clues through the
-- mod's hint and the game's Search Mode, with "Look it over" as the fallback.
-- So the save keeps HOW each clue was recognised, and a playtest can count
-- clues found by searching against clues looted and looked over, instead of
-- guessing from impressions.
--
-- Uses a real No Help world record: S.createArea, one area added with
-- api.addArea from the offline clue inventory, and every clue PLACED at a
-- spot of its own kind before it is recognised (a waiting clue cannot be).
package.path="mod-ofinterest/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local S=require("OIShared/Generated/Session")
local Inventory=require("oi_inventory")
assert(S.FOUND_HOW.search and S.FOUND_HOW.look,"NH-D2: searching and looking it over are both ways a clue is found")

local site={id="t3:b1",bounds={x1=100,y1=0,x2=110,y2=10,z=0},containerTypes={"shelves","postbox","vehicle"}}
local root=assert(S.createArea(4242),"a new world record")
local saved=root
local api=assert(S.open(root,function(next) saved=next end))
local ok,ids=api.addArea{site=site,place="farm",clues=Inventory.clues,version="v1",hours=10}
assert(ok,"an area is added: "..tostring(ids))
assert(#ids>=2,"the area has at least two clues")

-- Give every clue a distinct spot of its own kind, then place it.
local function targetFor(spot,i)
    local x,y=site.bounds.x1+i,site.bounds.y1+i
    if spot=="furniture" then return {x=x,y=y,z=0,objectIndex=i,containerIndex=0,containerType="shelves",sprite="s"} end
    if spot=="mailbox" then return {x=x,y=y,z=0,objectIndex=i,containerIndex=0,containerType="postbox",sprite="p"} end
    if spot=="ground" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true} end
    if spot=="vehicle" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="car",vehiclePart="GloveBox"..i} end
    if spot=="corpse" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m"..i} end
    error("unknown spot "..tostring(spot))
end
local spotOf={}
for _,d in ipairs(saved.case.documents) do spotOf[d.id]=d.spot end
for i,id in ipairs(ids) do
    assert(not api.recognise(id,"search"),"a clue still waiting for its spot cannot be recognised")
    assert(api.assign(id,targetFor(spotOf[id],i),11),"clue "..id.." takes a "..tostring(spotOf[id]).." spot")
    assert(api.status(id,"placing"))
    assert(api.status(id,"placed",12))
end

assert(api.recognise(ids[1],"search"),"a clue spotted in Search Mode is recognised")
assert(api.recognise(ids[2],"look"),"a clue looked over is recognised")
assert(saved.recognisedHow[ids[1]]=="search","NH-D2: the save remembers it was found by searching")
assert(saved.recognisedHow[ids[2]]=="look","NH-D2: and that the other was looked over")
assert(S.validate(saved),"the save with methods is valid")

-- Recognising again changes nothing: the first way it was found stands.
assert(api.recognise(ids[1],"look"))
assert(saved.recognisedHow[ids[1]]=="search","a clue keeps the way it was first found")

-- The validator refuses a method for a clue never recognised, or an unknown one.
local bad=api.snapshot(); bad.recognisedHow[ids[#ids]]="search"
if #ids>2 then assert(not S.validate(bad),"a method for a clue never recognised is refused") end
bad=api.snapshot(); bad.recognisedHow[ids[1]]="teleport"
assert(not S.validate(bad),"an unknown way of finding is refused")

-- A save from before this existed, with no methods at all, is still valid.
local old=api.snapshot(); old.recognisedHow=nil
assert(S.validate(old),"older saves without methods still load")
print("nohelp found-how: NH-D2 search and look-it-over recorded per clue")
