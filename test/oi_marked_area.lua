-- No Help, task 3 plan step 4: A MAP MARKING A LARGE AREA (owner, 2026-09-27,
-- DECISIONS.md "Step 4 review answers": "a map marking a large area may have
-- clues anywhere in that area, preferably near the map's own annotation
-- marks"). Generated/MapSites gives such a place the whole reviewed area as
-- bounds (up to 430 x 630) and keeps the map's annotations as marks;
-- MarkedArea keeps placement there bounded and near the marks first.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
local A=require("OIShared/MarkedArea")
local G=require("OIShared/GroundSpots")
local Sites=require("OIShared/Generated/MapSites")
local D6="NH-D6"   -- annotated maps included

local function entry(id) for _,e in ipairs(Sites.sites) do if e.areaId==id then return e end end end
local speedway=assert(entry("mark:IrvingtonStashMap1:1"),"the speedway area")        -- 430 x 630
local fires=assert(entry("mark:WorldStashMap18:1"),"the fire-and-weapon marks area") -- 38 marks
assert(fires.kind=="area" and #fires.marks>=30,D6..": an area keeps its map's own marks")
assert(speedway.kind=="area" and speedway.bounds.x2-speedway.bounds.x1==430 and speedway.bounds.y2-speedway.bounds.y1==630,
    "the speedway is its whole reviewed area")
local function inside(b,x,y) return x>=b.x1 and x<b.x2 and y>=b.y1 and y<b.y2 end
local function nearest(points,x,y) return A.distance(points,x,y) end

-- OPEN GROUND: near the marks first, in growing rings; the last tries anywhere.
for _,e in ipairs({speedway,fires}) do
    local b,points=e.bounds,A.points(e.marks)
    assert(#points>=3,"an area keeps its marks as points")
    for doc=1,20 do
        local far=0
        for try=1,G.MAX_TRIES do
            local index=(doc-1)*G.MAX_TRIES+try
            local x,y,near=A.groundSquare(7,e.areaId,"d"..doc,index,try,b,points)
            assert(x and inside(b,x,y),"every square lies in the area")
            if try<=A.NEAR_TRIES then
                assert(near,"the first "..A.NEAR_TRIES.." tries are near a mark")
                local band=A.RINGS[math.min(#A.RINGS,1+math.floor((try-1)/math.ceil(A.NEAR_TRIES/#A.RINGS)))]
                assert(nearest(points,x,y)<=band,"try "..try.." lies within "..band.." tiles of a mark")
                if try<=12 then assert(nearest(points,x,y)<=A.RINGS[1],"the first ring is the tightest") end
            else
                assert(not near,"the last tries are anywhere in the area")
                if nearest(points,x,y)>A.RINGS[#A.RINGS] then far=far+1 end
            end
        end
        if e==speedway then assert(far>=1,"the fallback reaches squares far from every mark") end
    end
end
-- Deterministic per world: the same world, area and clue try the same squares.
local function squares(seed,doc,e)
    local out,points={},A.points(e.marks)
    for try=1,G.MAX_TRIES do local x,y=A.groundSquare(seed,e.areaId,doc,try,try,e.bounds,points); out[#out+1]=x..","..y end
    return table.concat(out," ")
end
assert(squares(7,"d1",fires)==squares(7,"d1",fires),"deterministic per world")
assert(squares(7,"d1",fires)~=squares(8,"d1",fires),"another world, other squares")
assert(squares(7,"d1",fires)~=squares(7,"d2",fires),"another clue, other squares")
-- Marks near the area's edge stay inside it.
local edge={x1=0,y1=0,x2=500,y2=500,z=0}
for try=1,A.NEAR_TRIES do
    local x,y=A.groundSquare(3,"edge","d",try,try,edge,{{x=0,y=0},{x=499,y=499}})
    assert(inside(edge,x,y),"clamped into the area at its edges")
end

-- FURNITURE: one window per attempt, at most 44 a side, cycling the marks.
for _,e in ipairs({speedway,fires}) do
    local b,points=e.bounds,A.points(e.marks)
    local w,h=b.x2-b.x1,b.y2-b.y1
    local cols,rows=math.ceil(w/A.WINDOW),math.ceil(h/A.WINDOW)
    local centred,covered={},0
    for attempt=0,#points+cols*rows-1 do
        local win,what=A.window(11,e.areaId,"doc",attempt,b,points)
        assert(win.x2-win.x1<=A.WINDOW and win.y2-win.y1<=A.WINDOW and win.x2>win.x1 and win.y2>win.y1,"a window is at most 44 a side")
        assert(win.x1>=b.x1 and win.y1>=b.y1 and win.x2<=b.x2 and win.y2<=b.y2,"a window lies inside the area")
        if attempt<#points then
            assert(what=="mark","the marks come first")
            local hit
            -- The window centred on a mark, moved only as far as the
            -- area's edge requires.
            local function centredOn(p)
                local sx,sy=math.min(A.WINDOW,w),math.min(A.WINDOW,h)
                local x1=math.max(b.x1,math.min(p.x-math.floor(sx/2),b.x2-sx))
                local y1=math.max(b.y1,math.min(p.y-math.floor(sy/2),b.y2-sy))
                return win.x1==x1 and win.y1==y1 and win.x2==x1+sx and win.y2==y1+sy
            end
            for i,p in ipairs(points) do
                if not centred[i] and centredOn(p) then hit=i; break end
            end
            assert(hit,"attempt "..attempt.." is a window around a mark not yet visited")
            centred[hit]=true
        else
            assert(what=="rest","then the rest of the area")
            covered=covered+(win.x2-win.x1)*(win.y2-win.y1)
        end
    end
    for i=1,#points do assert(centred[i],"every mark gets its window once per cycle") end
    assert(covered==w*h,"the rest of the area is walked whole, once per cycle")
    local first=A.window(11,e.areaId,"doc",0,b,points)
    local again=A.window(11,e.areaId,"doc",#points+cols*rows,b,points)
    assert(first.x1==again.x1 and first.y1==again.y1,"and the cycle starts over")
end
-- The first mark visited is the world's: it varies by world, fixed per world.
local starts={}
local fb,fp=fires.bounds,A.points(fires.marks)
for seed=1,30 do local win=A.window(seed,fires.areaId,"doc",0,fb,fp); starts[win.x1..":"..win.y1]=true end
local n=0; for _ in pairs(starts) do n=n+1 end
assert(n>=5,"which mark comes first varies by world ("..n..")")
assert(A.window(4,fires.areaId,"doc",0,fb,fp).x1==A.window(4,fires.areaId,"doc",0,fb,fp).x1,"and is fixed per world")

-- ARRIVING: measured from the nearest mark, not the area's edge.
assert(A.distance({{x=10,y=10},{x=100,y=100}},95,130)==30,"Chebyshev distance to the nearest mark")

-- THE RUNTIME, with the engine stubbed: the container scan walks one window,
-- the ground scan stays within MAX_TRIES, the ring counts from the marks.
Events=setmetatable({},{__index=function(t,name)
    local ev={Add=function() end,Remove=function() end}
    rawset(t,name,ev); return ev
end})
local store={}
ModData={getOrCreate=function(tag) store[tag]=store[tag] or {}; return store[tag] end,get=function(tag) return store[tag] end}
getDebug=function() return false end
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return 0 end
ZombRand=function() return 1 end
getGameTime=function() return {getWorldAgeHours=function() return 1 end} end
local px,py=0,0
getPlayer=function() return {getX=function() return px end,getY=function() return py end,getZ=function() return 0 end,
    getPlayerNum=function() return 0 end} end
getWorld=function() return nil end
package.loaded["OIShared/InteractionAPI"]={}
package.loaded["OIShared/T3Nearby"]={start=function() return true end}
package.loaded["OIShared/ReachabilityAdapter"]={basementSites=function() return {} end}
local asked,loaded={},nil
local function yard(x,y,z)
    -- FAKE-OF zombie.iso.IsoGridSquare: getZ TreatAsSolidFloor isSolid isSolidTrans isOutside getDoor getObjects
    local s={}
    function s:getZ() return z end
    function s:TreatAsSolidFloor() return true end
    function s:isSolid() return false end
    function s:isSolidTrans() return false end
    function s:isOutside() return true end
    function s:getDoor(edge) return nil end
    function s:getObjects() return {size=function() return 0 end} end
    return s
end
getCell=function()
    return {getGridSquare=function(_,x,y,z) asked[#asked+1]={x=x,y=y}; if loaded and loaded(x,y) then return yard(x,y,z) end return nil end,
        getZombieList=function() return {size=function() return 0 end} end}
end
local R=dofile("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua")
local S=require("OIShared/Generated/Session")
local function row(e) return {id=e.areaId,bounds=e.bounds,paperStorage="unknown",containerTypes={}} end
local site=row(fires)
local fpoints=R.areaPoints(site)
assert(fpoints and #fpoints==#A.points(fires.marks),"the runtime finds an area's marks by its id")
assert(R.areaPoints({id="t3:not-an-area",bounds=fb})==nil,"any other place has none")

-- Containers: each attempt walks one window (plus the outdoor band), never
-- the whole 277 x 171 area; successive attempts visit successive marks.
local windows={}
for attempt=1,3 do
    asked={}
    local scan=R.boundsScan(site,function() end,nil,"doc-c",true)
    local steps=0
    while not scan() do steps=steps+1; assert(steps<100000,"the scan ends") end
    local x1,y1,x2,y2=math.huge,math.huge,-math.huge,-math.huge
    for _,q in ipairs(asked) do x1,y1=math.min(x1,q.x),math.min(y1,q.y); x2,y2=math.max(x2,q.x),math.max(y2,q.y) end
    local side=A.WINDOW+2*S.OUTDOOR_RADIUS
    assert(x2-x1+1<=side and y2-y1+1<=side,"one attempt walks at most one window and its band")
    assert(#asked<=side*side,"one square per step, as anywhere ("..#asked..")")
    local want=A.window(0,site.id,"doc-c",attempt-1,fb,fpoints)
    assert(x1==want.x1-S.OUTDOOR_RADIUS and y1==want.y1-S.OUTDOOR_RADIUS,"attempt "..attempt.." walks the world's window for it")
    windows[x1..":"..y1]=true
end
local distinct=0; for _ in pairs(windows) do distinct=distinct+1 end
assert(distinct>=2,"attempts move on through the marks")

-- Open ground: at most MAX_TRIES squares; an unloaded square is counted and
-- passed over (much of such an area is always unloaded), a loaded one taken.
local function ground(salt)
    local got,why
    local scan=R.groundScan(site,function(t,refused) got,why=t,refused end,nil,salt,{spent={},used={}})
    local steps=0
    while not scan() do steps=steps+1; assert(steps<1000,"the scan ends") end
    return got,why
end
px,py=99999,99999
asked={}
local got,why=ground("doc-g")
assert(got==nil and (why.unloaded or 0)>=1 and #asked<=G.MAX_TRIES,"nothing loaded: bounded, counted, no spot ("..#asked..")")
loaded=function(x,y) return nearest(fpoints,x,y)<=A.RINGS[#A.RINGS] end
got=ground("doc-g2")
assert(got and got.ground and inside(fb,got.x,got.y) and nearest(fpoints,got.x,got.y)<=A.RINGS[#A.RINGS],
    "loaded ground near a mark is taken")
assert(S.target(got,{bounds=fb}),"a target the Session accepts")
loaded=nil

-- The arrival ring: from the nearest mark. Standing inside the area's
-- rectangle but far from every mark is not "arrived".
local track=row(speedway)
local tpoints=R.areaPoints(track)
px,py=speedway.bounds.x1,speedway.bounds.y2-1
local d=R.survivorDistance(track)
assert(d==A.distance(tpoints,px,py) and d>R.ARRIVE_TILES,"inside the rectangle, far from the marks: not arrived ("..d..")")
px,py=tpoints[1].x+R.ARRIVE_TILES,tpoints[1].y
assert(R.survivorDistance(track)<=R.ARRIVE_TILES,"within 40 tiles of a mark: arrived")
local building={id="t3:elsewhere",bounds={x1=100,y1=100,x2=110,y2=110,z=0}}
px,py=150,105
assert(R.survivorDistance(building)==41,"any other place still measures from its bounds")

print("nohelp marked area: ground near marks first and per world, one bounded window per attempt cycling the marks, arrival from the nearest mark")
