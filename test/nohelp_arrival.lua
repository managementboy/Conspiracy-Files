-- No Help: DECIDE EARLY, CREATE ON ARRIVAL (DECISIONS.md, "Revised after an
-- /adhd run on the owner's pushback", 2026-09-27): "Which clues a place holds
-- is decided and saved early (reload never changes it), but the objects only
-- come into the world as the player approaches, in spots the player cannot
-- see - nothing sits at a place before the player comes." And looted drawers:
-- "a clue is only ever seen through the hint and the inspection tool, so a
-- drawer emptied earlier may hold one."
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path

-- LOOTED DRAWERS: a No Help clue may go in a container searched earlier; the
-- open loot window still refuses. Without the flag nothing changes.
local looted,open=true,false
local container={}
container.isHasBeenLooted=function() return looted end
container.getParent=function() return {getModData=function() return {} end} end
getPlayerLoot=function() return {backpacks=open and {{inventory=container}} or {}} end
local FC=require("NHShared/Generated/FixedContainerRuntime")
local ok,why=FC.fresh(container)
assert(not ok and why=="already-searched","the old rule still holds without the flag")
assert(FC.fresh(container,true)==true,"a No Help clue may go in a drawer searched earlier")
open=true
ok,why=FC.fresh(container,true)
assert(not ok and why=="loot-window-open","never into a container open in the loot panel")
looted,open=false,false
assert(FC.fresh(container)==true and FC.fresh(container,true)==true,"an unsearched, closed drawer either way")

-- THE RUNTIME, read as text: the ring, the guards, the arrival trigger.
local function read(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local src=read("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
assert(src:find("R.ARRIVE_TILES=40",1,true) and not src:find("FILL_REACH",1,true),"the ring is 40 tiles; the old 120-tile reach is gone")
local near=src:match("local function nearestWaiting%(root,waiting,onlyArea%).-\nend\n")
assert(near and near:find("d<=R.ARRIVE_TILES",1,true),"only areas the survivor has arrived at are filled")
local far=src:match("local function farFromSurvivor%(site%).-\nend\n")
assert(far and far:find("d>R.ARRIVE_TILES",1,true),"and a picked clue whose area is outside the ring waits")
local filler=src:match("local function filler%(api,onlyArea%).-\nend\n")
assert(filler,"the filler takes an optional area")
assert(filler:find("FixedContainers.fresh(destination,areaClue)",1,true),"a No Help clue's final check lets a searched drawer through")
assert(filler:find("end,id,areaClue)",1,true),"and so does its container scan")
assert(filler:find("if not areaClue or open then",1,true),"a closed container needs no distance guard")
assert(filler:find("hidden=hiddenFromSurvivor(target)",1,true),"open ground and a body only out of sight")
assert(filler:find("if not hiddenFromSurvivor(carrier) then return false end",1,true),"a body is chosen only out of sight")
assert(not filler:find("Layout",1,true) and not filler:find("rank",1,true) and not filler:find("layout-hold",1,true),"no layout order and no layout hold")
local placement=src:match("local function placement%(api,id%).-\nend\n")
assert(placement:find("FixedContainers.fresh(current,Session.isArea(api.snapshot()))",1,true),
    "the placement job lets a No Help clue into a searched drawer too")
local tick=src:match('on%("OnTick", function%(%).-\nend%)')
assert(tick:find("ticks%R.ARRIVE_CHECK_TICKS==0",1,true) and tick:find("pcall(arrivals)",1,true),
    "the arrival check runs between the regular passes")
local arrive=src:match("local function arrivals%(%).-\nend\n")
assert(arrive:find('scheduler.enqueue("arrive:"..row.id,"filler",filler(api,row.id))',1,true),
    "entering a ring queues one filler attempt for that area")
assert(arrive:find("if x.d~=y.d then return x.d<y.d end",1,true),"nearest area first")
assert(arrive:find("if not inRing[areaId] then",1,true),"once per stay in the ring")
-- Visibility: the Build 42 per-square API, under pcall, unreadable = visible.
assert(src:find("square:isCouldSee(n) or square:isCanSee(n)",1,true),"a square the survivor could see is not used")
assert(src:find("s:isCouldSee(survivor.n) or s:isCanSee(survivor.n)",1,true),"nor in the ground scan")

-- The decision is untouched: the map path and the nearby scan still decide
-- early, and the map path still decides within R.MAP_NEAR_TILES.
assert(src:find("R.MAP_NEAR_TILES=100",1,true) and src:find("function R.decideMapArea(entry,source)",1,true),
    "places are still decided early")

print("nohelp arrival: created only within 40 tiles, closed containers at any distance, open spots out of sight, searched drawers allowed")
