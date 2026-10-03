-- The No Help world record (phase 5): areas decided once, from the saved
-- ledger and world seed only, and a record that only grows.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local AreaCase=require("NHShared/Generated/AreaCase")
local Pick=require("NHShared/Generated/Pick")
local Inventory=require("nohelp_inventory")
local clues=Inventory.clues

local function site(i)
    return {id="t3:b"..i,bounds={x1=i*100,y1=0,x2=i*100+10,y2=10,z=0},containerTypes={"shelves"}}
end
local function deepcopy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=deepcopy(x) end return o end

local world=AreaCase.new(12345)
assert(AreaCase.validate(world),"an empty world record is valid")

-- Deciding an area.
local next,ids=AreaCase.decide{case=world,site=site(1),place="farm",clues=clues,version="v1",hours=5}
assert(next,"a farm is decided: "..tostring(ids))
assert(AreaCase.validate(next))
assert(#ids>=2,"an area gets at least two clues")
for _,id in ipairs(ids) do assert(id:find("^nh:t3:b1:"),"each clue's id names its area: "..id) end
local leans={}
for _,d in ipairs(next.documents) do leans[d.lean]=true end
assert(leans.containment and leans.agricultural,"NH-D1: both conspiracies in the area")
assert(next.areas[1].version=="v1","the area records the clue-list version it was picked with")

-- NH-D3: the record holds exactly what the picker gives from the saved ledger
-- and world seed; a map having been read is not an input.
local picks=Pick.choose{clues=clues,area={id="t3:b1",place="farm"},ledger=world.ledger,seed=world.seed,version="v1",mapRead=true}
assert(#picks==#ids,"NH-D3: the saved clues are the picker's")
for i,p in ipairs(picks) do
    assert(ids[i]==AreaCase.docId("t3:b1",p.clue,p.copy),"NH-D3: same clue, same order")
end

-- Decided once, never again; empty is not a decision.
assert(select(2,AreaCase.decide{case=next,site=site(1),place="farm",clues=clues,version="v2"})=="decided")
assert(select(2,AreaCase.decide{case=next,site=site(2),place="farm",clues={},version="v1"})=="empty",
    "an area with nothing to give is left undecided")
assert(select(2,AreaCase.decide{case=next,site=site(2),place="home",clues=clues,version="v1"})=="not an interesting place")

-- Many areas.
local w=next
for i=2,30 do
    local place=Inventory.places[((i-1)%#Inventory.places)+1]
    local n=AreaCase.decide{case=w,site=site(i),place=place,clues=clues,version="v1",hours=i}
    assert(n,"area "..i.." decided")
    assert(AreaCase.grows(w,n),"deciding only adds")
    w=n
end
assert(AreaCase.validate(w),"a world of 30 areas is valid")

-- Tampering is refused.
local t=deepcopy(w); t.documents[1].lean=t.documents[1].rival
assert(not AreaCase.validate(t),"a changed lean")
t=deepcopy(w); t.documents[2].id="nh:elsewhere:x:1"
assert(not AreaCase.validate(t),"an id that does not name its area and copy")
t=deepcopy(w); t.ledger.world.containment=(t.ledger.world.containment or 0)+1
assert(not AreaCase.validate(t),"a ledger total that does not match the clues")
t=deepcopy(w); t.areas[2].count=t.areas[2].count+1
assert(not AreaCase.validate(t),"an area claiming a clue that is not its own")
local written; for _,d in ipairs(w.documents) do if not d.members then written=d break end end
t=deepcopy(w)
for _,d in ipairs(t.documents) do if d.id==written.id then d.copy=2; d.id=AreaCase.docId(d.locationId,d.clue,2) end end
t.ledger=AreaCase.recount(t)
assert(not AreaCase.validate(t),"a written clue placed a second time")
t=deepcopy(w); t.areas[#t.areas+1]=deepcopy(t.areas[1])
assert(not AreaCase.validate(t),"an area decided twice")

-- The record only grows.
t=deepcopy(w); table.remove(t.documents)
assert(not AreaCase.grows(w,t),"a clue cannot be removed")
t=deepcopy(w); t.documents[1].spot="ground"
assert(not AreaCase.grows(w,t),"a placed clue cannot change")
t=deepcopy(w); t.seed=t.seed+1
assert(not AreaCase.grows(w,t),"the world seed cannot change")
assert(not AreaCase.grows(w,{kind="other"}),"the world record cannot be replaced by another case")

-- A set of two pieces is valid here (the old 5-24 item rule does not apply).
local sawTwo=false
for _,d in ipairs(w.documents) do
    if d.members then local n=0; for _,m in ipairs(d.members) do n=n+m.quantity end; if n==2 then sawTwo=true end end
end
assert(sawTwo,"a two-piece set is in the world and valid")
print("nohelp area case: "..#w.areas.." areas, "..#w.documents.." clues; decided once, grows only")
