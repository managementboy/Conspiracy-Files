-- No Help: when an unfound clue may move (the promise clock was removed by the owner; what remains is the ordinary wait).
-- (DECISIONS.md, "Revised after an /adhd run on the owner's pushback",
-- 2026-09-27): "what does arriving late mean? No player is in a hurry in PZ".
-- Reading a map starts no clock. Every place ages alike: a placed, unfound,
-- unshown clue may move once it has lain RELOCATE_AFTER_HOURS, one clue one
-- move per attempt. (Own area, same kind of spot and spent spots:
-- test/nohelp_moves.lua.)
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local SC=require("NHShared/StaleClue")
local W=SC.RELOCATE_AFTER_HOURS
assert(W==72,"a clue lies 3 in-game days before it may move")

-- NO PROMISE CLOCK: the read-hour machinery is gone.
assert(SC.clockStart==nil and SC.readAtBySite==nil and SC.PROMISE_WINDOW_HOURS==nil,"no promise clock")

-- EVERY PLACE ALIKE: a map-marked place and an unmarked one wait the same.
local function clue(site,placed) return {status="placed",placedHours=placed,id="c",locationId=site} end
for _,site in ipairs({"t3:marked-by-a-map","flyer-place","t3:plain"}) do
    assert(not SC.isStale(clue(site,10),{},10+W-1),site..": not before 3 days")
    assert(SC.isStale(clue(site,10),{},10+W),site..": after 3 days it may move")
end
-- A move restarts the wait from the new placement: never a burst.
assert(not SC.isStale(clue("t3:plain",200),{},200+W-1),"moved at 200: waits again")

-- FOUND and SHOWN never move.
local root={case={documents={{id="a",locationId="t3:one"},{id="b",locationId="t3:one"},{id="c",locationId="t3:plain"}}},
    assignments={a={status="placed",placedHours=0,locationId="t3:one"},b={status="placed",placedHours=0,locationId="t3:one"},
        c={status="placed",placedHours=0,locationId="t3:plain"}},
    known={},shown={b=true}}
local ids=SC.staleIds(root,1000)
assert(#ids==2 and ids[1]=="a" and ids[2]=="c","the shown clue is never stale; the others are")
root.known={"a"}
assert(#SC.staleIds(root,1000)==1,"a found clue is never stale")

-- THE RUNTIME: relocation asks the plain rule, leaves a shown clue alone, and
-- takes one clue per attempt.
local function read_(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local src=read_("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local mover=src:match("local id,site,scan,target,oldContainer.-\nend\n")
assert(mover:find("StaleClue.staleIds(root,hours)",1,true),"relocation picks stale clues by the plain rule")
assert(mover:find("root.known,hours) then return true end",1,true),"and re-checks by it")
assert(mover:find("root.shown[id] then return true end",1,true),"a shown clue is left alone")
assert(mover:find("then id=candidate; break end",1,true),"one clue per attempt")
assert(not src:find("readAtBySite",1,true) and not src:find("readStamp",1,true),"no read-hour table in the runtime")
local map=read_("mod-nohelp/common/media/lua/client/NHShared/MapMediaRuntime.lua")
assert(not map:find("function R.readHours",1,true) and not map:find("readStamp",1,true),"the map runtime gives no read hours")

print("nohelp clock: no promise clock; every place waits 3 days; found and shown never move; one move per attempt")
