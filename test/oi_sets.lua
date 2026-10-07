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
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local SC=require("OIShared/StaleClue")

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
local runtime=read("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua")
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
assert(counter and counter:find("Session.pieceCount(d)",1,true),"placement counts a set by its pieces")
assert(runtime:find("expected[d.id]=Session.pieceCount(d)",1,true),
    "and so does the identity scan, or a set with no stated total is a permanent conflict")
local Session=require("OIShared/Generated/Session")
assert(Session.pieceCount({members={{kind="a",quantity=1},{kind="b",quantity=2}}})==3,"a set is the sum of its pieces")
assert(Session.pieceCount({members={{kind="a",quantity=1},{kind="b",quantity=2}},quantity=9})==3,"even when it states another total")
assert(Session.pieceCount({quantity=6})==6,"a pile is its count")
assert(Session.pieceCount({})==1,"a single item is one")
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

-- Owner decision 2026-10-03: object-SET pieces keep their vanilla item names;
-- paper clues keep their title. Run the real stamp functions against stub items.
local f=assert(io.open("mod-ofinterest/common/media/lua/client/OIShared/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local chunk=src:match("local function isSet%(doc%).-\nlocal function categoryOf%(%) return \"Evidence\" end")
assert(chunk,"stamp functions found")
local stampRec=src:match("local function stampRecognised%(.-\nend\n")
assert(stampRec,"stampRecognised found")
local env=setmetatable({pcall=pcall,type=type,tostring=tostring},{__index=_G})
local code=chunk.."\n"..stampRec.."\nreturn stampEvidence,stampRecognised,categoryOf"
local fn
if setfenv then fn=assert(loadstring(code)); setfenv(fn,env) else fn=assert(load(code,nil,"t",env)) end
local stampEvidence,stampRecognised=fn()
local function item(vanilla)
    local o={name=vanilla,custom=true,cat=nil,named=0}
    function o:setName(n) self.name=n; self.named=self.named+1 end
    function o:setCustomName(b) self.custom=b end
    function o:setDisplayCategory(c) self.cat=c end
    function o:getScriptItem() return {getDisplayName=function() return vanilla end} end
    return o
end
local setDoc={id="s",title="Placeholder Set Title",members={{kind="a"}}}
local paperDoc={id="p",title="Placeholder Paper Title"}
local a=item("Badge"); stampEvidence(a,setDoc.title,setDoc)
assert(a.name=="Badge" and a.cat=="Evidence" and a.custom==false,"a set piece keeps its vanilla name and is Evidence")
local b=item("Badge"); b.name="Placeholder Set Title"; stampRecognised(b,setDoc,"s",1,1)
assert(b.name=="Badge" and b.custom==false and b.cat=="Evidence","an old save's renamed set piece gets its vanilla name back")
local c=item("Note"); stampEvidence(c,paperDoc.title,paperDoc)
assert(c.name=="Placeholder Paper Title" and c.custom==true and c.cat=="Evidence","a paper clue keeps its title")
local d=item("Note"); stampRecognised(d,paperDoc,"p",1,1)
assert(d.name=="Placeholder Paper Title" and d.cat=="Evidence")
print("nohelp sets: set pieces keep vanilla names, paper clues keep their title")
