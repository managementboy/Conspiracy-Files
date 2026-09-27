-- No Help, task 3 plan step 4 part 2: THE PROMISE CLOCK (owner, 2026-09-27,
-- "How a read map changes the game"): "3 in-game days after a map is read,
-- its marks' unfound, unshown clues begin their silent within-place moves;
-- unread maps' marks stay still." Places no map or flyer marks keep the
-- ordinary rule; a clue Search Mode has shown never moves.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local SC=require("NHShared/StaleClue")
local W=SC.RELOCATE_AFTER_HOURS
assert(W==72 and SC.PROMISE_WINDOW_HOURS==72,"the window is 3 in-game days (owner)")

-- A marked place, a place two maps mark, a flyer's place and an unmarked one.
local sites={
    {areaId="t3:one",marks={{design="MapA",mark=1,x=1,y=1}}},
    {areaId="t3:two",marks={{design="MapB",mark=1,x=5,y=5},{design="MapC",mark=2,x=6,y=6}}},
    {areaId="flyer",marks={{print="Shop",mark=1,x=9,y=9}}},
}
local function clue(site,placed) return {status="placed",placedHours=placed,id="c",locationId=site} end

-- UNREAD: a marked place's clues stay still, however long.
local none=SC.readAtBySite(sites,{})
assert(none["t3:one"]==false and none["t3:two"]==false and none["flyer"]==false,"every marked place is known, unread")
assert(none["t3:plain"]==nil,"an unmarked place is not in the table")
assert(SC.clockStart("t3:one",none)==math.huge,"unread: the clock never starts")
assert(not SC.isStale(clue("t3:one",0),{},10000,none),"unread: a clue stays still")

-- READ, then before 3 days: still; after: it may move.
local read=SC.readAtBySite(sites,{MapA=100})
assert(read["t3:one"]==100,"the read hour is the place's")
assert(SC.clockStart("t3:one",read)==100+W,"the clock starts 3 days after the read")
assert(not SC.isStale(clue("t3:one",0),{},100+W-1,read),"read, before 3 days: still")
assert(SC.isStale(clue("t3:one",0),{},100+W,read),"read, 3 days on: it moves")
-- A clue placed after the read still waits the ordinary time from placement.
assert(not SC.isStale(clue("t3:one",150),{},100+W+1,read),"placed later: its own 3 days too")
assert(SC.isStale(clue("t3:one",150),{},150+W,read),"then it moves")

-- TWO MAPS: the earliest read counts.
local two=SC.readAtBySite(sites,{MapB=500,MapC=300})
assert(two["t3:two"]==300,"the earliest read of any map marking the place")
assert(SC.isStale(clue("t3:two",0),{},300+W,two),"from the earliest read")
assert(not SC.isStale(clue("t3:two",0),{},300+W-1,two),"not before")
local half=SC.readAtBySite(sites,{MapC=40})
assert(half["t3:two"]==40,"one of two maps read is enough")

-- FLYERS: a read flyer ("print:<name>", as Trails lists it) starts the clock.
local flyer=SC.readAtBySite(sites,{["print:Shop"]=20})
assert(flyer["flyer"]==20,"a flyer's read hour counts")
assert(SC.isStale(clue("flyer",0),{},20+W,flyer) and not SC.isStale(clue("flyer",0),{},20+W-1,flyer),"on a flyer's clock")

-- UNMARKED: today's rule, with or without the table.
assert(not SC.isStale(clue("t3:plain",10),{},10+W-1,read),"unmarked: the ordinary wait")
assert(SC.isStale(clue("t3:plain",10),{},10+W,read),"unmarked: the ordinary rule")
assert(SC.isStale(clue("t3:one",0),{},W,nil),"no table at all: the ordinary rule everywhere")

-- FOUND and SHOWN never move.
local root={case={documents={{id="a",locationId="t3:one"},{id="b",locationId="t3:one"},{id="c",locationId="t3:plain"}}},
    assignments={a={status="placed",placedHours=0,locationId="t3:one"},b={status="placed",placedHours=0,locationId="t3:one"},
        c={status="placed",placedHours=0,locationId="t3:plain"}},
    known={},shown={b=true}}
local ids=SC.staleIds(root,1000,read)
assert(#ids==2 and ids[1]=="a" and ids[2]=="c","the shown clue is never stale; the others are")
assert(#SC.staleIds(root,1000,none)==1 and SC.staleIds(root,1000,none)[1]=="c","unread: only the unmarked place's clue")
root.known={"a"}
assert(#SC.staleIds(root,1000,read)==1,"a found clue is never stale")

-- THE RUNTIME: the read hours come from the saved map state, rebuilt when it
-- changes, and relocation asks the clock.
local function read_(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local src=read_("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
local mover=src:match("local id,site,scan,target,oldContainer.-\nend\n")
assert(mover:find("StaleClue.staleIds(root,hours,readAtBySite())",1,true),"relocation picks stale clues on the promise clock")
assert(mover:find("root.known,hours,readAtBySite())",1,true),"and re-checks on it")
assert(mover:find("root.shown[id] then return true end",1,true),"a shown clue is left alone")
assert(src:find("readClock.stamp==stamp",1,true),"the read hours are rebuilt only when the map state changed")
local map=read_("mod-nohelp/common/media/lua/client/NHShared/MapMediaRuntime.lua")
assert(map:find('out["print:"..id]=at',1,true),"flyer reads are given in Trails' names")
assert(map:find("R.readStamp=R.readStamp+1",1,true),"a map-state save changes the stamp")
-- The runtime's table is built from the real MapSites list.
local Sites=require("NHShared/Generated/MapSites")
local real=SC.readAtBySite(Sites.sites,{})
local n=0; for _,v in pairs(real) do assert(v==false); n=n+1 end
assert(n==#Sites.sites,"every map and flyer place is on the clock")

print("nohelp clock: unread still, read waits 3 days, earliest read counts, flyers count, unmarked unchanged, shown never moves")
