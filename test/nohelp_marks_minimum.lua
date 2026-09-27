-- No Help, task 3 plan step 4: EACH MARK ITS OWN MINIMUM (owner, 2026-09-27).
-- A big marked area (MapSites kind "area") that one map marks with several of
-- its own marks (not the annotation notes) gives each of those marks at least
-- 3 clues, one of the other side, placed near that mark first. A place a map
-- and a flyer both point to (the speedway) is shared: random side per world,
-- no extra minimum, no own marks.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local AreaCase=require("NHShared/Generated/AreaCase")
local Pick=require("NHShared/Generated/Pick")
local A=require("NHShared/MarkedArea")
local Sites=require("NHShared/Generated/MapSites")
local Inventory=require("nohelp_inventory")
local clues=Inventory.clues

local function entry(id) for _,e in ipairs(Sites.sites) do if e.areaId==id then return e end end end
local two=assert(entry("mark:WorldStashMap6:1"),"the two-mark area")
local speedway=assert(entry("mark:IrvingtonStashMap1:1"),"the speedway")
-- The runtime's rule (GeneratedRuntime ownMarksOf): one map, its `mark`s.
local function ownMarks(e)
    local designs,seen={},{}
    for _,m in ipairs(e.marks) do
        local d=m.design or ("print:"..m.print)
        if not seen[d] then seen[d]=true; designs[#designs+1]=d end
    end
    local out={}
    if #designs==1 then for _,m in ipairs(e.marks) do if m.design and m.mark then out[#out+1]=m.mark end end end
    return designs,out
end
local designs,marks=ownMarks(two)
assert(#designs==1 and #marks==2,"WorldStashMap6's area: one map, two of its own marks")
local sd,sm=ownMarks(speedway)
assert(#sd==2 and #sm==0,"the speedway: a map and a flyer, no own marks")

-- Pick's arguments: 3 per mark, one of the other side per mark.
local trail,lean=AreaCase.trailFor(7,designs,two.areaId,marks)
assert(lean.minCount==6 and lean.rivalMin==2 and trail.marks[1]==1 and trail.marks[2]==2,"3 x m clues, m of the other side")
local t1,l1=AreaCase.trailFor(7,designs,two.areaId,{1})
assert(l1.minCount==3 and l1.rivalMin==1 and t1.marks==nil,"a single-mark place is unchanged")
local t0,l0=AreaCase.trailFor(7,designs,two.areaId)
assert(l0.minCount==3 and l0.rivalMin==1 and t0.marks==nil,"no marks given: unchanged")
local ts,ls=AreaCase.trailFor(7,sd,speedway.areaId,{1,2})
assert(ls.minCount==nil and ls.rivalMin==nil and ts.marks==nil,"a shared place: no extra minimum, whatever marks it has")

local function decide(seed,e,ds,ms)
    local site={id=e.areaId,bounds=e.bounds}
    local case,ids=AreaCase.decide{case=AreaCase.new(seed),site=site,place="mapNamed",clues=clues,version="v1",
        designs=ds,marks=ms}
    assert(case,tostring(ids))
    local ok,why=AreaCase.validate(case); assert(ok,why)
    return case
end
local function perMark(case)
    local fav=case.areas[1].trail.favour
    local held,rival={},{}
    for _,d in ipairs(case.documents) do
        held[d.mark]=(held[d.mark] or 0)+1
        if d.lean~=fav then rival[d.mark]=(rival[d.mark] or 0)+1 end
    end
    return held,rival
end
local sawOrder={}
for seed=1,200 do
    local case=decide(seed,two,designs,marks)
    local held,rival=perMark(case)
    for _,m in ipairs(marks) do
        assert((held[m] or 0)>=3,"seed "..seed..": mark "..m.." holds at least 3 clues")
        assert((rival[m] or 0)>=1,"seed "..seed..": mark "..m.." holds one of the other side")
    end
    -- Deterministic from the world seed alone.
    local again=decide(seed,two,designs,marks)
    for i,d in ipairs(case.documents) do assert(again.documents[i].mark==d.mark,"the same world, the same marks") end
    sawOrder[case.documents[1].mark]=true
end
assert(sawOrder[1] and sawOrder[2],"which clue goes to which mark varies by world")

-- Single-mark and shared places carry no mark.
for seed=1,20 do
    for _,d in ipairs(decide(seed,two,designs,nil).documents) do assert(d.mark==nil,"no marks, no mark field") end
    local shared=decide(seed,speedway,sd,nil)
    assert(shared.areas[1].trail.marks==nil)
    for _,d in ipairs(shared.documents) do assert(d.mark==nil,"a shared place's clues carry no mark") end
end

-- Validation.
local good=decide(3,two,designs,marks)
local function bad(edit,why)
    local function cp(x) if type(x)~="table" then return x end local o={} for k,y in pairs(x) do o[k]=cp(y) end return o end
    local c=cp(good)
    edit(c)
    assert(not AreaCase.validate(c),why)
end
bad(function(c) c.documents[1].mark=0 end,"a mark is an integer >= 1")
bad(function(c) c.documents[1].mark=1.5 end,"a mark is an integer")
bad(function(c) c.documents[1].mark=9 end,"a clue's mark is one of its area's marks")
bad(function(c) c.documents[1].mark=nil end,"every clue of such an area has a mark")
bad(function(c) for _,d in ipairs(c.documents) do d.mark=1 end end,"every mark keeps its minimum")
bad(function(c) c.areas[1].trail.marks={1} end,"own marks are at least two")
bad(function(c) c.areas[1].trail.marks=nil end,"a clue cannot name a mark its area lacks")
local plain=decide(3,two,designs,nil)
local ok=AreaCase.validate(plain); assert(ok,"an area without own marks is still valid")

-- Placement: a clue's windows and ground squares start at its own mark.
local points=A.points(two.marks)
local own={x=two.marks[2].x,y=two.marks[2].y}
local b=two.bounds
local w,h=b.x2-b.x1,b.y2-b.y1
local tiles=math.ceil(w/A.WINDOW)*math.ceil(h/A.WINDOW)
local cycle=1+#points+tiles
for _,attempt in ipairs({0,cycle,2*cycle}) do
    local win,what=A.window(9,two.areaId,"d",attempt,b,points,own)
    assert(what=="mark" and win.x1<=own.x and own.x<win.x2 and win.y1<=own.y and own.y<win.y2,
        "each cycle starts with the window on the clue's own mark")
end
for k=1,cycle-1 do
    local a1=A.window(9,two.areaId,"d",k,b,points,own)
    local a2=A.window(9,two.areaId,"d",k-1,b,points)
    assert(a1.x1==a2.x1 and a1.y1==a2.y1 and a1.x2==a2.x2 and a1.y2==a2.y2,"then the area as before")
end
for try=1,64 do
    local x,y,near=A.groundSquare(9,two.areaId,"d",try,try,b,points,own)
    assert(x>=b.x1 and x<b.x2 and y>=b.y1 and y<b.y2,"inside the area")
    if try<=A.NEAR_TRIES then
        assert(near and A.distance({own},x,y)<=A.RINGS[#A.RINGS],"near tries ring the clue's own mark")
    else
        assert(not near,"the last tries anywhere in the area")
    end
end
-- Without an own mark the squares and windows are what they were.
for try=1,64 do
    local x1,y1=A.groundSquare(9,two.areaId,"d",try,try,b,points)
    local x2,y2=A.groundSquare(9,two.areaId,"d",try,try,b,points,nil)
    assert(x1==x2 and y1==y2)
end

print("nohelp marks minimum: each own mark >= 3 clues incl. one of the other side, seeded, searched near its mark first; shared places unchanged")
