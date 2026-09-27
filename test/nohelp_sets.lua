-- No Help, task 3 plan step 1: an object SET is one clue made of several real
-- items, and when an unfound clue moves, a set moves whole or not at all
-- (owner, 2026-09-27; DECISIONS.md DR-20260927-NOHELP-RULE-PLACEMENT).
--
-- The engine already placed a clue as several different items sharing one
-- stamp ("members": GeneratedRuntime placement, and the identity scan counts
-- them against the clue's own number). What it refused was MOVING one: the
-- mover rebuilt a single item and removed a single item. This holds the rule
-- (StaleClue) and the runtime's shape; the move itself in a real world is for
-- the visible playtest (plan step 8).
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local SC=require("NHShared/StaleClue")

-- The guard: every piece present, nothing carried.
assert(SC.canRelocate(1,0),"a single clue still moves as before")
assert(SC.canRelocate(1,0,1),"and says so with its count given")
assert(SC.canRelocate(3,0,3),"a set of three with all three present moves")
assert(not SC.canRelocate(2,0,3),"a set missing a piece stays: someone took part of it")
assert(not SC.canRelocate(4,0,3),"a set with an extra stamped item is ambiguous and stays")
assert(not SC.canRelocate(3,1,3),"a set the player carries a piece of stays")
assert(not SC.canRelocate(0,0,3),"a set that is gone stays gone")

-- The runtime: a set is a candidate, and every piece is rebuilt and removed.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local runtime=read("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local mover=runtime:match("local id,site,scan,target,oldContainer.-\nend\n")
assert(mover,"the relocation job is where it was")
assert(mover:find("isObjectSet(api,candidate)",1,true),"an object set may be chosen to move")
assert(mover:find("canRelocate(tokenCount,carryCount,expectedCount(api,id))",1,true),
    "the guard is given the clue's own number of pieces")
assert(mover:find("for _,member in ipairs(evidenceMembers(doc)) do",1,true),
    "every member of the clue is rebuilt at the new place")
assert(mover:find("for _,it in ipairs(old) do oldContainer:Remove(it) end",1,true),
    "every old piece is removed, not only the first")
assert(mover:find("for _,piece in ipairs(newItem) do",1,true),"every rebuilt piece is added")
assert(not mover:find(":Remove(it); break",1,true),"no longer stops after removing one item")
-- A set's number is the sum of its pieces even when no total is stated
-- (phase 2 review: counted as one, every set would have been refused).
local counter=runtime:match("local function expectedCount%(api,id%).-\nend\n")
assert(counter and counter:find("for _,m in ipairs(d.members) do n=n+",1,true),
    "a set is counted by its pieces")
-- Whole or not at all on the way in: a refused piece takes the landed ones back.
assert(mover:find("for _,piece in ipairs(landed) do",1,true),"pieces that landed are taken back if one is refused")
-- And the destination is asked for room for the whole set before anything moves.
assert(mover:find("hasRoomFor(p,weight)",1,true),"the destination must have room for every piece")
assert(mover:find("hasRoomFor",1,true)<mover:find("oldContainer:Remove",1,true),"room is checked before anything is removed")
-- Piles (many copies of one thing, no members) still do not move: a quantity
-- is a fact about a place.
assert(mover:find("expectedCount(api,candidate)==1 or isObjectSet(api,candidate)",1,true),
    "only single clues and sets move; a pile stays")
print("nohelp sets: guard and mover hold for object sets")
