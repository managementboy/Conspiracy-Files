-- The No Help runtime's area mode (task 3 plan, phase 5): the old case
-- generator is gone from the runtime (owner, 2026-09-27), a save gets one world
-- record of areas, created once with its own world seed, and the runtime
-- decides interesting places near the survivor through the existing nearby
-- scan. The filler only ever gives a clue its own kind of spot.
--
-- Two halves: what the source must and must not contain, then the runtime
-- itself loaded under plain Lua with the engine stubbed, from a new save's
-- OnGameStart to a decided area.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local PATH="mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua"
local src=read(PATH)
local function has(text,why) assert(src:find(text,1,true),why.." ("..text..")") end
local function hasNot(text,why) assert(not src:find(text,1,true),why.." ("..text..")") end

-- The Dead Air slice is gone, and with it the switch that kept it off.
hasNot("GeneratedMode","nothing is left to switch off")
hasNot("NHShared.Runtime","the Dead Air runtime is gone")

-- The old case lifecycle is gone.
for _,name in ipairs({"function R.start(","function R.nextCase(","function R.reshuffle(","function R.primeOpening(",
    "function R.automaticStatus(","function R.deferPoll(","function R.retiredPaper(","function R.setAnswers(",
    "function R.questions(","local function prepare(","local function firstCase(","local function retireIfAccounted(",
    "local function lastSeenJob("}) do
    hasNot(name,"the old case generator's entry point is removed")
end
for _,module in ipairs({"Generated/Generator\")","Generated/RetiredCase\")","Generated/Story\")",
    "NHShared/CasePerson","NHShared/OpeningMemoryStore","NHShared/Trial"}) do
    hasNot(module,"the runtime no longer needs")
end

-- The bootstrap creates the world record with Session.createArea and a seed
-- drawn once.
local boot=src:match("function R%.bootstrap%(%).-\nend\n")
assert(boot,"a bootstrap exists")
assert(boot:find("Session.createArea(worldSeed)",1,true),"the bootstrap creates the world record")
assert(boot:find("ZombRand(2147483646)+1",1,true),"from a world seed drawn in the game")
assert(boot:find("if not wrapper.canonical then",1,true),"only when the save has none yet")
assert(boot:find("swap({canonical=root})",1,true),"stored as the save's canonical record")
assert(boot:find("setup()",1,true) and boot:find("openAll()",1,true),"and the scheduler and sessions are opened")
local start=src:match('on%("OnGameStart", function%(%).-\nend%)')
assert(start and start:find("R.bootstrap",1,true),"OnGameStart runs the bootstrap")

-- Deciding nearby areas.
local decide=src:match("local function decideFrom%(result%).-\nend\n")
assert(decide,"the area decision exists")
assert(decide:find("api.addArea{",1,true),"it adds areas through the Session")
assert(decide:find("version=Manifest.VERSION",1,true),"with the clue list's version")
assert(decide:find("clues=Manifest.clues",1,true),"and the clue list")
assert(decide:find("AreaPlace.of(",1,true),"places are mapped by AreaPlace")
assert(decide:find("Storage.scan(",1,true) and decide:find("withReachability(",1,true),"through the existing storage scan")
local nearby=src:match("function R%.decideNearby%(force%).-\nend\n")
assert(nearby and nearby:find("decideFrom(",1,true),"R.decideNearby runs the decision")
assert(nearby:find("R.DECIDE_TILES",1,true) and nearby:find("R.DECIDE_HOURS",1,true),"and waits to move on")
local tick=src:match('on%("OnTick", function%(%).-\nend%)')
assert(tick and tick:find("R.decideNearby",1,true),"the runtime's tick asks for nearby areas")

-- The filler takes only a clue's own kind of spot.
local filler=src:match("local function filler%(api%).-\nend\n")
assert(filler,"the filler is where it was")
assert(filler:find("Session.physicalKey(candidate)] and Session.intentMatches(doc,candidate)",1,true),
    "the filler's accept requires the clue's own kind of spot")

-- Pinned by test/nohelp_sets.lua as well; must survive the removal.
has("expected[d.id]=Session.pieceCount(d)","the identity scan still counts a set by its pieces")
has("Every piece of the clue is rebuilt","the relocation mover is untouched")

-- THE RUNTIME ITSELF, with the engine stubbed.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local handlers={}
local clock=0
Events=setmetatable({},{__index=function(t,name)
    local ev={Add=function(fn) handlers[name]=handlers[name] or {}; table.insert(handlers[name],fn) end,
        Remove=function() end}
    rawset(t,name,ev); return ev
end})
local function fire(name) clock=clock+16; for _,fn in ipairs(handlers[name] or {}) do fn() end end
local store={}
ModData={getOrCreate=function(tag) store[tag]=store[tag] or {}; return store[tag] end,
    get=function(tag) return store[tag] end}
getDebug=function() return false end  -- No Help runs in normal play (owner, 2026-09-27)
isClient=function() return false end
isServer=function() return false end
-- Still within a frame, so the scheduler's time budget is never spent.
getTimeInMillis=function() return clock end
local rolls=0
ZombRand=function(n) rolls=rolls+1; return 777 end
local hours=5
getGameTime=function() return {getWorldAgeHours=function() return hours end} end
local px,py=1000,1000
local player={getX=function() return px end,getY=function() return py end,getZ=function() return 0 end,
    getSquare=function() return nil end,getInventory=function() return {getItems=function() return nil end} end,
    getModData=function() return {} end}
getPlayer=function() return player end
getWorld=function() return nil end -- services wait for a world; not under test here
getCell=function() return nil end
-- Not the parts under test: kept out of the load.
package.loaded["NHShared/InteractionAPI"]={}
local probe={}
function probe.start(radius,seed) probe.seed=seed; probe.started=(probe.started or 0)+1; return true end
package.loaded["NHShared/T3Nearby"]=probe
package.loaded["NHShared/ReachabilityAdapter"]={basementSites=function() return {} end}
local scanned
package.loaded["NHShared/Generated/Storage"]={MAILBOX="postbox",fixedKind=function() return true end,
    scan=function(result,done,reachable)
        scanned=result
        return function() done(result.catalog,{},result.candidates,{},{}); return true end
    end}
-- A clue list with clues, so a decision has something to give.
local Manifest=require("NHShared/Mystery/Manifest")
local Inventory=require("nohelp_inventory")
Manifest.clues=Inventory.clues

local R=dofile(PATH)
assert(R.start==nil and R.nextCase==nil and R.reshuffle==nil and R.primeOpening==nil,
    "the old entry points do not exist")

-- A new save: one world record, one seed, saved.
fire("OnGameStart")
local S=require("NHShared/Generated/Session")
local saved=store["NHShared.Generated.G2"]
assert(saved and saved.campaign and saved.campaign.canonical,"a new save gets a world record")
local root=saved.campaign.canonical
assert(S.isArea(root) and root.case.seed==778,"the world record is an area record with the drawn seed")
assert(rolls==1,"the world seed is drawn once")
assert(R.metrics(),"the scheduler exists, so the features that need it are on")

-- Loading the same save again opens the same record and draws nothing.
fire("OnGameStart")
assert(rolls==1 and store["NHShared.Generated.G2"].campaign.canonical.case.seed==778,"a reload keeps the seed")

-- Deciding: a police station and a house near the survivor.
local function site(id,x)
    return {id=id,areaId=id,name="Building",mapId="Muldraugh, KY",buildLine="42",
        bounds={x1=x,y1=1000,x2=x+10,y2=1010,z=0},source={kind="map-research",reference="test"},
        paperStorage="observed",containerTypes={"shelves","postbox"},excluded=false}
end
local result={rows={
    {kind="building",id="p1",categoryHint="public-service"},
    {kind="building",id="h1",categoryHint="residential"},
    {kind="room",building="h1",ordinal=1,name="kitchen"},
},catalog={revision="t",locations={site("t3:p1",1000),site("t3:h1",1100)}},
  candidates={["t3:p1"]={{x=1001,y=1001,z=0}},["t3:h1"]={{x=1101,y=1001,z=0}}}}
assert(R.decideNearby()==true,"a first attempt starts the nearby scan")
assert(probe.seed==778,"the scan is seeded from the world record")
assert(select(2,R.decideNearby())=="busy","a second attempt waits while the first runs")
probe.result=result
for _=1,20 do fire("OnTick") end
assert(scanned==result,"the storage scan ran on the nearby result")
root=store["NHShared.Generated.G2"].campaign.canonical
assert(#root.case.areas==1 and root.case.areas[1].id=="t3:p1","only the interesting place is decided")
assert(root.case.areas[1].place=="police" and root.case.areas[1].version==Manifest.VERSION,
    "as police, with the clue list's version")
local waiting=0
for _,a in pairs(root.assignments) do if a.status=="deferred" then waiting=waiting+1 end end
assert(waiting==#root.case.documents and waiting>0,"its clues wait for the filler")

-- The next attempt waits until the survivor moves on or time passes.
assert(select(2,R.decideNearby())=="wait","nothing is scanned again in the same place")
px=1100
assert(R.decideNearby()==true,"after moving 50 tiles it scans again")
for _=1,20 do fire("OnTick") end
root=store["NHShared.Generated.G2"].campaign.canonical
assert(#root.case.areas==1,"an area is never decided twice, and a house is never an area")

-- An empty clue list decides nothing: a later list can still give clues.
Manifest.clues={}
local other=site("t3:p2",2000)
result.rows[#result.rows+1]={kind="building",id="p2",categoryHint="medical"}
result.catalog.locations[#result.catalog.locations+1]=other
result.candidates["t3:p2"]={{x=2001,y=1001,z=0}}
hours=hours+1
assert(R.decideNearby()==true)
for _=1,20 do fire("OnTick") end
root=store["NHShared.Generated.G2"].campaign.canonical
assert(#root.case.areas==1,"a place with nothing to give is not decided")

-- The clue system is not gated on debug mode.
local src=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb")):read("*a")
local gate=src:match("local function allowed%(%).-\nend")
assert(gate and not gate:find("getDebug",1,true),"the runtime runs in normal single-player play")
print("nohelp area runtime: world record bootstrapped once, nearby places decided, own-kind spots only")
