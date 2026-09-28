-- Pick saves its own totals (C2): the case record keeps areasDecided, clues per lean,
-- short, and bySource (no cap hits: see AreaCase.computeTotals); they must equal a recount and are validated on load.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local AreaCase=require("NHShared/Generated/AreaCase")
local Inventory=require("nohelp_inventory")
local clues=Inventory.clues

local function site(i)
    return {id="t3:b"..i,bounds={x1=i*100,y1=0,x2=i*100+10,y2=10,z=0},containerTypes={"shelves"}}
end
local function deepcopy(v)
    if type(v)~="table" then return v end
    local o={}
    for k,x in pairs(v) do o[k]=deepcopy(x) end
    return o
end

-- Test 1: totals after several addArea calls equal the recount.
local world=AreaCase.new(12345)
assert(AreaCase.validate(world),"empty world is valid")
assert(world.totals~=nil,"new world has totals table")
assert(world.totals.areasDecided==0,"new world: 0 areas decided")

local w=world
for i=1,10 do
    local place=Inventory.places[((i-1)%#Inventory.places)+1]
    local next=AreaCase.decide{case=w,site=site(i),place=place,clues=clues,version="v1",hours=i}
    assert(next,"area "..i.." decided")
    w=next
end

-- After 10 areas, check totals.
assert(w.totals.areasDecided==10,"10 areas decided (scenes excluded)")
local Manifest=require("NHShared/Mystery/Manifest")
local expectedClueCounts={}
for _,lean in ipairs(Manifest.LEANS) do expectedClueCounts[lean]=0 end
for _,d in ipairs(w.documents) do
    expectedClueCounts[d.lean]=(expectedClueCounts[d.lean] or 0)+1
end
for lean,expected in pairs(expectedClueCounts) do
    assert(w.totals.clues[lean]==expected,
        lean.." clues match: "..tostring(w.totals.clues[lean]).." vs "..tostring(expected))
end

-- bySource should list nearby and any other sources.
assert(w.totals.bySource["nearby"]~=nil,"has bySource entry for nearby")
-- short is a number (count of areas that stopped below their number)
assert(w.totals.capHits==nil,"no cap hits are saved")
assert(type(w.totals.short)=="number","short is a number")

-- Validate passes.
assert(AreaCase.validate(w),"10-area world validates")

print("nohelp pick totals 1/3: totals match recount after "..#w.areas.." areas")

-- Test 2: tampered totals table is refused by validate.
local t=deepcopy(w)
t.totals.clues.containment=(t.totals.clues.containment or 0)+1
assert(not AreaCase.validate(t),"tampered containment count is refused")

t=deepcopy(w)
t.totals.areasDecided=t.totals.areasDecided+1
assert(not AreaCase.validate(t),"tampered areasDecided is refused")

t=deepcopy(w)
t.totals.bySource["fake"]=(t.totals.bySource["fake"] or 0)+1
assert(not AreaCase.validate(t),"tampered bySource is refused")

print("nohelp pick totals 2/3: tampered totals are refused")

-- Test 3: old record without totals loads, first write adds correct totals.
local old=AreaCase.new(54321)
assert(old.totals~=nil,"new record has totals")
-- Simulate old record by removing totals.
old.totals=nil

-- Old record with no totals still validates (migration path).
assert(AreaCase.validate(old),"old record without totals validates (migration)")

-- Add an area to the old record.
local oldWithArea,ids=AreaCase.decide{case=old,site=site(100),place="farm",clues=clues,version="v1",hours=0}
assert(oldWithArea~=nil,"old record can accept an area decision")
assert(oldWithArea.totals~=nil,"first write computes totals on old record")
assert(oldWithArea.totals.areasDecided==1,"old record's first write: 1 area decided")

-- Second write on the same world.
local oldWithTwoAreas=AreaCase.decide{case=oldWithArea,site=site(101),place="police",clues=clues,version="v1",hours=1}
assert(oldWithTwoAreas~=nil,"old record can accept another area")
assert(oldWithTwoAreas.totals.areasDecided==2,"second write: 2 areas decided")
assert(AreaCase.validate(oldWithTwoAreas),"two-area old record validates")

print("nohelp pick totals 3/3: old record without totals loads and builds them")

print("nohelp pick totals: passed")
