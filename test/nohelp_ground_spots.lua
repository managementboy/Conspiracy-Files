-- No Help, task 3 plan step 4 part 2: OPEN GROUND IS OFFERED. Until now no
-- scan offered a ground spot, so a ground clue waited forever. GroundSpots
-- holds the rules over plain facts; GeneratedRuntime's groundScan reads the
-- facts from the engine and tries squares in the world's hash order, at most
-- GroundSpots.MAX_TRIES per attempt.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path
local G=require("NHShared/GroundSpots")

-- THE BOX: the site widened by the outdoor band, never more than 44 a side.
local small=G.box({x1=100,y1=100,x2=110,y2=110,z=0},12)
assert(small.x1==88 and small.x2==122 and small.y1==88 and small.y2==122,"a small site is widened by the band")
local big=G.box({x1=0,y1=0,x2=200,y2=30,z=0},12)
assert(big.x2-big.x1==44 and big.y2-big.y1==44,"clamped to 44 x 44")
assert(big.x1==100-22,"around the site's centre")

-- THE ORDER is the world's: same seed, area and clue, same squares.
local box=G.box({x1=100,y1=100,x2=110,y2=110,z=0},12)
local function firstSquares(seed,doc)
    local out={}
    for i=1,10 do local x,y=G.square(seed,"t3:a",doc,i,box); out[#out+1]=x..","..y end
    return table.concat(out," ")
end
assert(firstSquares(7,"d1")==firstSquares(7,"d1"),"deterministic per world")
assert(firstSquares(7,"d1")~=firstSquares(8,"d1"),"another world, another order")
assert(firstSquares(7,"d1")~=firstSquares(7,"d2"),"another clue, another order")
for i=1,200 do
    local x,y=G.square(7,"t3:a","d1",i,box)
    assert(x>=box.x1 and x<box.x2 and y>=box.y1 and y<box.y2,"always inside the box")
end

-- THE RULES, one fact at a time.
local function facts(over)
    local f={key="ground:1:2:0",spent={},used={},exists=true,z=0,wantZ=0,floor=true,solid=false,
        outside=true,windows=0,lights=0,nearSurvivor=false,zombies=0}
    for k,v in pairs(over or {}) do f[k]=v end
    return f
end
assert(G.check(facts()),"a clear yard is a spot")
local function refused(over,why) local ok,got=G.check(facts(over)); assert(not ok and got==why,why.." expected, got "..tostring(got)) end
refused({spent={["ground:1:2:0"]=true}},"spent")
refused({used={["ground:1:2:0"]=true}},"used")
refused({exists=false},"missing")
refused({z=1},"floor-level")
refused({floor=false},"unwalkable")
refused({solid=true},"unwalkable")
refused({outside=false},"dark")
assert(G.check(facts({outside=false,windows=2})),"a room with a window is visible")
assert(G.check(facts({outside=false,lights=1})),"a room with a light is visible")
refused({nearSurvivor=true},"near-survivor")
refused({zombies=G.CROWD_ZOMBIES},"crowded")
assert(G.check(facts({zombies=G.CROWD_ZOMBIES-1})),"fewer than four is not a crowd")
assert(G.zombiesNear({{x=1,y=2},{x=7,y=8},{x=8,y=2}},1,2)==2,"within six tiles only")
assert(G.label({door=true,outside=true})=="doorway" and G.label({outside=true})=="yard"
    and G.label({exists=true,outside=false})=="floor" and G.label({})=="ground","plain spot words")

-- THE RUNTIME SCAN, with the engine stubbed.
local handlers={}
Events=setmetatable({},{__index=function(t,name)
    local ev={Add=function(fn) handlers[name]=handlers[name] or {}; table.insert(handlers[name],fn) end,Remove=function() end}
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
local px,py=5000,5000
getPlayer=function() return {getX=function() return px end,getY=function() return py end,getZ=function() return 0 end} end
getWorld=function() return nil end
package.loaded["NHShared/InteractionAPI"]={}
package.loaded["NHShared/T3Nearby"]={start=function() return true end}
package.loaded["NHShared/ReachabilityAdapter"]={basementSites=function() return {} end}

-- A world of squares: `kind(x,y)` says what each one is.
local asked,kind,zombies=0,nil,{}
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local function square(x,y,z)
    local k=kind(x,y)
    if k=="none" then return nil end
    local s={}
    function s:getZ() return z end
    function s:TreatAsSolidFloor() return k~="hole" end
    function s:isSolid() return k=="wall" end
    function s:isSolidTrans() return false end
    function s:isOutside() return k=="yard" end
    function s:getDoor() return nil end
    function s:getRoom()
        if k=="yard" or k=="wall" or k=="hole" then return nil end
        return {getWindows=function() return list(k=="lit" and {1} or {}) end,
            getLightSwitches=function() return list({}) end}
    end
    return s
end
getCell=function()
    return {getGridSquare=function(_,x,y,z) asked=asked+1; return square(x,y,z) end,
        getZombieList=function() return list(zombies) end}
end
local R=dofile("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
assert(type(R.groundScan)=="function","the runtime has a ground scan")
local site={id="t3:g",bounds={x1=100,y1=100,x2=110,y2=110,z=0}}
local function run(salt,accept,keys,rank)
    local got,n,why
    local scan=R.groundScan(site,function(t,count,refusedBy) got,n,why=t,count,refusedBy end,accept,salt,rank,keys)
    local steps=0
    while not scan() do steps=steps+1; assert(steps<1000,"the scan ends") end
    return got,why,steps
end

-- Every square a yard: a spot, the same one for the same world and clue.
kind=function() return "yard" end
local a=run("doc-1")
assert(a and a.ground==true and a.containerType=="floor" and a.sprite=="yard","a yard spot, labelled")
assert(a.x>=88 and a.x<122 and a.y>=88 and a.y<122 and a.z==0,"inside the site and its band")
local S=require("NHShared/Generated/Session")
assert(S.target(a,{bounds=site.bounds}),"a target the Session accepts")
-- Deterministic per world: a clue's first try is the world's first square
-- for it (this runtime has no world record, so its seed reads as 0).
local box2=G.box(site.bounds,S.OUTDOOR_RADIUS)
local fx,fy=G.square(0,site.id,"doc-1",1,box2)
assert(a.x==fx and a.y==fy,"the first square in the world's order")
-- A clue that tried before carries on from where it stopped.
local b=run("doc-1")
local sx,sy=G.square(0,site.id,"doc-1",2,box2)
assert(b.x==sx and b.y==sy,"the next attempt takes the next square")

-- SPENT and USED spots are never chosen: every square this clue would try
-- but one is spent (or used); the scan takes that one.
local function order(doc,n)
    local out,seen={},{}
    for i=1,n do
        local x,y=G.square(0,site.id,doc,i,box2)
        local key="ground:"..x..":"..y..":0"
        if not seen[key] then seen[key]=true; out[#out+1]=key end
    end
    return out
end
for _,which in ipairs({"spent","used"}) do
    local doc="doc-"..which
    local keys=order(doc,G.MAX_TRIES)
    local free=keys[#keys]
    local blocked={}
    for i=1,#keys-1 do blocked[keys[i]]=true end
    local got=run(doc,nil,{spent=which=="spent" and blocked or {},used=which=="used" and blocked or {}})
    assert(got and S.physicalKey(got)==free,"a "..which.." spot is never chosen; the free one is")
end
-- And none at all when every tried square is spent.
local all={}
for _,k in ipairs(order("doc-all",G.MAX_TRIES)) do all[k]=true end
assert(run("doc-all",nil,{spent=all,used={}})==nil,"all spent: no spot this attempt")
assert(run("doc-acc",function() return false end)==nil,"nor one the caller's accept refuses")

-- DARK INDOORS, CROWDED and UNWALKABLE are refused.
kind=function() return "dark" end
local got,why=run("doc-dark")
assert(got==nil and (why.dark or 0)>0,"a dark room is refused")
kind=function() return "lit" end
got=run("doc-lit")
assert(got and got.sprite=="floor","a room with a window is a spot, on the floor")
kind=function() return "hole" end
got,why=run("doc-hole")
assert(got==nil and (why.unwalkable or 0)>0,"no floor, no spot")
kind=function() return "yard" end
zombies={}
for i=1,200 do
    local zx,zy=80+(i%50),80+math.floor(i/50)*10
    zombies[#zombies+1]={getX=function() return zx end,getY=function() return zy end}
end
for x=86,124,3 do for y=86,124,3 do
    for _=1,G.CROWD_ZOMBIES do zombies[#zombies+1]={getX=function() return x end,getY=function() return y end} end
end end
got,why=run("doc-crowd")
assert(got==nil and (why.crowded or 0)>0,"a crowd refuses the spot")
zombies={}

-- NEAR THE SURVIVOR: never a spot the Search Mode icon could already show.
px,py=105,105
got,why=run("doc-near")
assert(got==nil and (why["near-survivor"] or 0)>0,"no spot inside the proximity guard")
px,py=5000,5000

-- AT MOST 64 TRIES per attempt.
kind=function() return "none" end
asked=0
got,why=run("doc-none")
local tried=0; for _,n in pairs(why) do tried=tried+n end
assert(got==nil and tried<=G.MAX_TRIES and asked<=G.MAX_TRIES,"stops after "..G.MAX_TRIES.." tries ("..asked..")")
-- The next attempt carries on to new squares, still bounded.
asked=0
run("doc-none")
assert(asked<=G.MAX_TRIES,"each attempt is bounded")

-- The filler offers ground to a ground clue.
local src=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb")):read("*a")
local filler=src:match("local function filler%(api%).-\nend\n")
assert(filler:find('elseif doc and doc.spot=="ground" then',1,true) and filler:find("scan=groundScan(site,",1,true),
    "a ground clue is given a ground scan")
assert(filler:find("nearestWaiting(root,waiting)",1,true),"the filler serves the nearest areas first")
assert(filler:find('CFLog.write("d","skip",{doc=id,area=site and site.id,distance=distance,why=why})',1,true),
    "a miss is logged with area, clue and distance")

print("nohelp ground spots: world order, 44-tile box, spent/used/dark/crowded/unwalkable/near refused, 64 tries at most")
