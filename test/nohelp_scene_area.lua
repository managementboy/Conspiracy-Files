-- A confirmed vanilla scene in the world record (task 3 plan, step 5;
-- directive NH-D7): exactly one clue per scene, from the clues anchored to
-- its kind, on its anchor, leaning by the world; independent of every place;
-- scenes saved set-once with pending traces that survive an emptied scene;
-- and the runtime that finds them, driven here against a stubbed engine.
-- WRITER/ENGINEER TEST: kinds come from the shipped table; clues are
-- placeholders.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local DIRECTIVE="NH-D7"
local AreaCase=require("NHShared/Generated/AreaCase")
local Session=require("NHShared/Generated/Session")
local Scenes=require("NHShared/Generated/VanillaScenes")
local SceneMatch=require("NHShared/Generated/SceneMatch")
local Inventory=require("nohelp_inventory")

local cite=Scenes.CITATIONS[1]
local groundKind
for _,r in ipairs(Scenes.rows) do if not groundKind and r.spot=="ground" and r.c~=r.a then groundKind=r.id end end
assert(groundKind,"a ground kind with an uneven fit")

local function set(id,kind,lean,spot,version)
    return {id=id,kind="set",pieces={"Twine","Tarp"},anchor={scene=kind,version=version},
        where={{place="farm",spot=spot,lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end
local function written(id,kind,lean,spot)
    return {id=id,kind="written",pieces={"letter"},anchor={scene=kind},
        where={{place="farm",spot=spot,lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end
local citeSpot=Scenes.spotFor(cite.kind)
local sceneClues={
    set("sc-a",cite.kind,"containment",citeSpot,"A"),
    set("sc-b",cite.kind,"agricultural",citeSpot,"B"),
    set("sg-c",groundKind,"containment","ground"),
    set("sg-a",groundKind,"agricultural","ground"),
    written("sg-w",groundKind,"containment","ground"),
}
local function site(key,b) return {id="scene:"..key,bounds=b or {x1=0,y1=0,x2=10,y2=10,z=0},paperStorage="unknown",containerTypes={}} end

-- ONE CLUE, ON ITS ANCHOR, BY THE WORLD'S LEAN; the version of that lean.
local leans={}
for seed=1,60 do
    local case=AreaCase.new(seed)
    local key=cite.key
    local next,ids=assert(AreaCase.decideScene{case=case,site=site(key),key=key,kind=cite.kind,clues=sceneClues,version="v",hours=2})
    assert(#ids==1 and #next.documents==1,"exactly one clue per scene")
    local d=next.documents[1]
    local lean=Scenes.lean(seed,"scene:"..key,cite.kind)
    assert(d.lean==lean and d.spot==citeSpot,"the world's lean, on the anchor")
    assert(d.clue==(lean=="containment" and "sc-a" or "sc-b"),"one version per conspiracy: the lean's version")
    assert(d.anchor.scene==cite.kind,"the anchor is carried")
    assert(AreaCase.validate(next),"valid")
    assert(next.ledger.scene and next.ledger.scene.placed[d.clue]==1 and next.ledger.placed[d.clue]==nil,"counted apart")
    assert(next.areas[1].place=="scene" and next.areas[1].scene.kind==cite.kind,"a scene area")
    leans[lean]=true
    assert(select(2,AreaCase.decideScene{case=next,site=site(key),key=key,kind=cite.kind,clues=sceneClues,version="v"})=="decided",
        "decided once")
end
assert(leans.containment and leans.agricultural,"random per world: both conspiracies across worlds")

-- Refusals and "empty" (not a decision).
local w=AreaCase.new(7)
assert(select(2,AreaCase.decideScene{case=w,site=site("k"),key="k",kind="RBBasic",clues=sceneClues})=="this kind of scene holds no clue")
assert(select(2,AreaCase.decideScene{case=w,site=site("k"),key="other",kind=groundKind,clues=sceneClues})=="a scene area is named by its scene")
assert(select(2,AreaCase.decideScene{case=w,site=site("k"),key="k",kind=groundKind,clues={}})=="empty","nothing written for it yet")
assert(select(2,AreaCase.decideScene{case=w,site=site("k"),key="k",kind=groundKind,clues=Inventory.clues})=="empty",
    "clues not anchored to the kind never go to it")

-- A written clue never repeats; a set comes again as a new copy.
local case=AreaCase.new(11)
local seenWritten,copies=0,{}
for i=1,12 do
    local key="cell:"..i..":0:0"
    local next=AreaCase.decideScene{case=case,site=site(key,{x1=i*10,y1=0,x2=i*10+10,y2=10,z=0}),key=key,kind=groundKind,clues=sceneClues,version="v"}
    if next then
        case=next
        local d=case.documents[#case.documents]
        if d.clue=="sg-w" then seenWritten=seenWritten+1 end
        copies[d.clue]=math.max(copies[d.clue] or 0,d.copy)
    end
end
assert(seenWritten<=1,"a written clue is placed once")
assert(AreaCase.validate(case),"many scenes, valid")
local more=0; for _,n in pairs(copies) do if n>1 then more=more+1 end end
assert(more>=1,"a set is placed again at another scene of the kind")

-- INDEPENDENCE: a place picks exactly the same clues with or without a scene
-- decided beside it, and with or without scene clues in the list.
local placeSite={id="t3:indep",bounds={x1=0,y1=0,x2=10,y2=10,z=0}}
local function placeClues(c,list)
    local next=assert(AreaCase.decide{case=c,site=placeSite,place="farm",clues=list,version="v",hours=1})
    local out={}
    for _,d in ipairs(next.documents) do if d.locationId==placeSite.id then out[#out+1]=d.clue..":"..d.copy..":"..d.spot end end
    return table.concat(out,",")
end
local both={}
for _,c in ipairs(Inventory.clues) do both[#both+1]=c end
for _,c in ipairs(sceneClues) do both[#both+1]=c end
local plainCase=AreaCase.new(99)
local withScene=assert(AreaCase.decideScene{case=AreaCase.new(99),site=site("cell:5:5:0"),key="cell:5:5:0",kind=groundKind,clues=sceneClues,version="v"})
local base=placeClues(plainCase,Inventory.clues)
assert(base~="","the place gets clues")
assert(placeClues(plainCase,both)==base,"scene clues never reach a place")
assert(placeClues(withScene,both)==base,"a scene decided first changes nothing at the place")

-- SAVED SCENES (Session `scenes`): pending traces only grow; a confirmed
-- scene is set once; an area needs a confirmed scene.
local root=assert(Session.createArea(4242))
local saved=root
local api=assert(Session.open(root,function(n) saved=n end))
assert(api.noteScene("cell:1:2:0",{pending={"vehicle:StepVan_Plonkies"},x=15,y=25,z=0,hours=1}))
assert(select(2,api.noteScene("cell:1:2:0",{pending={"vehicle:StepVan_Plonkies"},x=15,y=25,z=0,hours=2}))=="nothing new")
assert(api.noteScene("cell:1:2:0",{pending={"room:kitchen"},x=99,y=99,z=0,hours=3}))
local rec=api.scene("cell:1:2:0")
assert(#rec.pending==2 and rec.x==15 and rec.hours==1,"pending traces merge; where and when stay the first look's")
assert(not api.addSceneArea{site=site("cell:1:2:0"),key="cell:1:2:0",kind=groundKind,clues=sceneClues,version="v",hours=4},
    "no area for a scene not confirmed")
local b={x1=10,y1=20,x2=20,y2=30}
assert(api.noteScene("cell:1:2:0",{kind=groundKind,x=15,y=25,z=0,hours=5,source="seen",bounds=b}))
assert(select(2,api.noteScene("cell:1:2:0",{kind="RVSPlonkies",x=15,y=25,z=0,hours=6,source="seen"}))=="already confirmed")
assert(saved.scenes["cell:1:2:0"].kind==groundKind,"set once")
assert(Session.validate(saved),"valid")
local ok,ids=api.addSceneArea{site=site("cell:1:2:0",{x1=10,y1=20,x2=20,y2=30,z=0}),key="cell:1:2:0",kind=groundKind,
    clues=sceneClues,version="v",hours=7}
assert(ok and #ids==1,"the scene gets its one clue: "..tostring(ids))
local a=saved.assignments[ids[1]]
assert(a.status=="deferred" and a.locationId=="scene:cell:1:2:0","it waits for the survivor like every clue")
assert(Session.validate(saved))
local bad={}; for k,v in pairs(saved) do bad[k]=v end
bad.scenes={["cell:9:9:0"]={kind="lower",x=1,y=1,z=0,hours=0,source="seen"}}
assert(not Session.validate(bad),"a malformed scene record is refused")
bad.scenes={["cell:9:9:0"]={pending={},x=1,y=1,z=0,hours=0}}
assert(not Session.validate(bad),"a pending record holds traces")

-- THE RUNTIME, against a stubbed engine: flag, bounded look, match, save.
local handlers={}
Events={}
for _,name in ipairs({"LoadGridsquare","OnDeadBodySpawn","OnTick","OnGameStart"}) do
    Events[name]={Add=function(fn) handlers[name]=fn end,Remove=function() end}
end
isClient=function() return false end
isServer=function() return false end
local hours=10
getGameTime=function() return {getWorldAgeHours=function() return hours end,getHour=function() return 1 end,getMinutes=function() return 0 end} end
local player={x=100,y=200,z=0,vehicle=nil}
getPlayer=function() return {getX=function() return player.x end,getY=function() return player.y end,getZ=function() return player.z end,
    getVehicle=function() return player.vehicle end} end
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local world={}   -- "x:y:z" -> {items={}, vehicle=script, room=name, zombies={}, bodies={}, sprites={}}
local reads=0
getCell=function() return {getGridSquare=function(_,x,y,z)
    reads=reads+1
    local s=world[x..":"..y..":"..z]
    if not s then return nil end
    return {getX=function() return x end,getY=function() return y end,getZ=function() return z end,
        getRoom=function() return s.room and {getName=function() return s.room end,getRoomDef=function()
            return {getX=function() return x-2 end,getY=function() return y-2 end,getX2=function() return x+3 end,getY2=function() return y+3 end} end} or nil end,
        getObjects=function() local o={}; for _,n in ipairs(s.sprites or {}) do o[#o+1]={getSprite=function() return {getName=function() return n end} end} end; return list(o) end,
        getWorldObjects=function() local o={}; for _,n in ipairs(s.items or {}) do o[#o+1]={getItem=function() return {getFullType=function() return n end} end} end; return list(o) end,
        getDeadBodys=function() local o={}; for _,n in ipairs(s.bodies or {}) do o[#o+1]={getOutfitName=function() return n end} end; return list(o) end,
        getMovingObjects=function() local o={}; for _,n in ipairs(s.zombies or {}) do o[#o+1]={zombie=true,getOutfitName=function() return n end} end; return list(o) end,
        getVehicleContainer=function() return s.vehicle and {getScriptName=function() return s.vehicle end} or nil end}
end} end
instanceof=function(o,class) return class=="IsoZombie" and type(o)=="table" and o.zombie==true end
getWorld=function() return {
    getRandomizedBuildingList=function() return list({}) end,
    getRBBasic=function() return {getSurvivorStories=function() return list({}) end} end,
    getRandomizedZoneList=function() return list({}) end,
    getRandomizedVehicleStoryList=function() return list({{getName=function() return "Rich Jerk" end},{getName=function() return "Plonkies" end}}) end,
} end
local store={}
NHShared={GeneratedRuntime={
    scene=function(key) return store[key] end,
    sceneSeen=function(key,rec)
        local old=store[key]
        if old and old.kind then return true,"already confirmed" end
        if rec.kind==nil and old then rec.pending=SceneMatch.merge(old.pending,rec.pending) end
        store[key]=rec; return true
    end}}
local printed={}
local realPrint=print
print=function(s) printed[#printed+1]=tostring(s) end
local Runtime=dofile("mod-nohelp/common/media/lua/client/NHShared/VanillaSceneRuntime.lua")
assert(handlers.LoadGridsquare and handlers.OnDeadBodySpawn and handlers.OnTick,"flag events and the tick are registered")
local function sq(x,y,z) return {getX=function() return x end,getY=function() return y end,getZ=function() return z or 0 end} end
local function run(n) for _=1,n do handlers.OnTick() end end

-- A Plonkies van at 105,205 and its driver (the story's own outfit) at 107,206.
world["105:205:0"]={vehicle="Base.StepVan_Plonkies"}
world["107:206:0"]={zombies={"PlonkiesGuy"}}
handlers.LoadGridsquare(sq(105,205))
handlers.LoadGridsquare(sq(106,205))   -- the same cell: flagged once
reads=0
run(Runtime.CHECK_TICKS)               -- picks the cell; the look starts
run(1)
assert(reads<=Runtime.RECORDS_PER_FRAME,"at most "..Runtime.RECORDS_PER_FRAME.." squares a tick, read "..reads)
run(10)
local key=SceneMatch.keyAt(105,205,0)
assert(store[key] and store[key].kind=="RVSPlonkies" and store[key].source=="seen","the scene is confirmed and saved: "..tostring(store[key] and store[key].kind))
local b2=store[key].bounds
assert(b2 and b2.x1<=105 and b2.x2>105,"with its bounds")

-- Across a cell edge: the same scene seen again from the next cell is not a
-- second scene (no second clue).
local keep1,keep2=world["105:205:0"],world["107:206:0"]
world["105:205:0"]=nil; world["107:206:0"]=nil   -- its car moved on
world["112:205:0"]={vehicle="Base.StepVan_Plonkies"}
world["113:206:0"]={zombies={"PlonkiesGuy"}}
handlers.LoadGridsquare(sq(112,205))
run(Runtime.CHECK_TICKS*3)
assert(store[SceneMatch.keyAt(112,205,0)]==nil or not store[SceneMatch.keyAt(112,205,0)].kind,"one scene, one record")
world["112:205:0"]=nil; world["113:206:0"]=nil
world["105:205:0"],world["107:206:0"]=keep1,keep2

-- An emptied scene: the van is seen, its driver had wandered off; later he is
-- killed nearby and his body is found: the saved trace confirms it.
world["305:205:0"]={vehicle="Base.StepVan_Plonkies"}
player.x,player.y=300,200
handlers.LoadGridsquare(sq(305,205))
run(Runtime.CHECK_TICKS*2)
local pk=SceneMatch.keyAt(305,205,0)
assert(store[pk] and store[pk].pending and not store[pk].kind,"a van alone is kept as pending traces")
world["305:205:0"]=nil                 -- the van is driven away
world["308:207:0"]={bodies={"PlonkiesGuy"}}
handlers.OnDeadBodySpawn({getSquare=function() return sq(308,207) end})
run(Runtime.CHECK_TICKS*2)
assert(store[pk] and store[pk].kind=="RVSPlonkies","the earlier trace and the later one confirm it together")

-- The prefilter: a story the game does not list never matches.
world["505:205:0"]={room="jackiejayestudio",items={"Base.Microphone"},zombies={"Jackie_Jaye"}}
player.x,player.y=500,200
handlers.LoadGridsquare(sq(505,205))
run(Runtime.CHECK_TICKS*2)
assert(not (store[SceneMatch.keyAt(505,205,0)] or {}).kind,"not listed, not matched")

-- ORDINARY CLUTTER IS NOT A SCENE (the defect this guards): a parked luxury
-- car and a stray case of money, listed story or not; a parked Plonkies van
-- with a bag of its own snacks.
world["705:205:0"]={vehicle="Base.CarLuxury"}
world["707:206:0"]={items={"Base.Briefcase_Money"}}
world["745:205:0"]={vehicle="Base.StepVan_Plonkies"}
world["747:206:0"]={items={"Base.Plonkies"}}
player.x,player.y=720,200
handlers.LoadGridsquare(sq(705,205))
handlers.LoadGridsquare(sq(745,205))
run(Runtime.CHECK_TICKS*6)
assert(not (store[SceneMatch.keyAt(705,205,0)] or {}).kind,"a parked car and a stray case never confirm")
assert(not (store[SceneMatch.keyAt(745,205,0)] or {}).kind,"a parked van and its snacks never confirm")
assert(store[SceneMatch.keyAt(745,205,0)] and store[SceneMatch.keyAt(745,205,0)].pending,"the van waits as a pending trace")
world["705:205:0"],world["707:206:0"],world["745:205:0"],world["747:206:0"]=nil,nil,nil,nil

-- Too far: a flagged cell beyond reach waits.
world["905:205:0"]={vehicle="Base.StepVan_Plonkies"}
world["906:205:0"]={zombies={"PlonkiesGuy"}}
handlers.LoadGridsquare(sq(905,205))
run(Runtime.CHECK_TICKS*3)
assert(store[SceneMatch.keyAt(905,205,0)]==nil,"a cell beyond reach is not looked at")
player.x=900
run(Runtime.CHECK_TICKS*2)
assert(store[SceneMatch.keyAt(905,205,0)].kind=="RVSPlonkies","looked at once the survivor comes near")
-- A long drive: flags far behind are forgotten before the list fills, so
-- scenes near the survivor are still noticed; a near cell is kept.
local before=Runtime.flaggedCount()
for i=1,Runtime.MAX_FLAGGED do handlers.LoadGridsquare(sq(5000+(i%64)*10,5000+math.floor(i/64)*10)) end
assert(Runtime.flaggedCount()==Runtime.MAX_FLAGGED,"the list is full")
world["955:255:0"]={vehicle="Base.StepVan_Plonkies"}
world["956:255:0"]={zombies={"PlonkiesGuy"}}
player.x,player.y=950,250
handlers.LoadGridsquare(sq(955,255))   -- refused while full
run(Runtime.CHECK_TICKS)
assert(Runtime.flaggedCount()<=before+1,"far flags forgotten: "..Runtime.flaggedCount())
handlers.LoadGridsquare(sq(955,255))   -- its squares load again
run(Runtime.CHECK_TICKS*3)
assert((store[SceneMatch.keyAt(955,255,0)] or {}).kind=="RVSPlonkies","noticed after a long drive")
print=realPrint
local joined=table.concat(printed,"\n")
assert(joined:find("scene-wait-start",1,true) and joined:find("scene-wait-end",1,true),"scene-wait is logged")
assert(joined:find("mode=walking",1,true),"walking or driving is logged")
-- The real end of a wait is counted by length and mode only (checklist C3).
local waits,n=Runtime.waitCounts(),0
for k,v in pairs(waits) do assert(type(v)=="number" and k:match("^%a+_h%d+_?%w*$"),"wait count "..k) n=n+v end
assert(n>=1,"a real scene wait that ended is counted")
assert(Runtime.matchVehicle(105,205,0)=="scene:RVSPlonkies","a confirmed scene's car is recognised")
-- A reload (OnGameStart resets the runtime) does not start that wait again:
-- the saved pending record's hour is its start (first visible playtest,
-- 2026-09-27: repeated starts skewed the wait timings).
do
    local function starts()
        local n=0
        for _,l in ipairs(printed) do if l:find("scene-wait-start",1,true) then n=n+1 end end
        return n
    end
    local n0=starts()
    assert(n0>=1,"the first look started the wait")
    Runtime.reset()
    print=function(line) printed[#printed+1]=tostring(line) end
    world["745:205:0"]={vehicle="Base.StepVan_Plonkies"}
    world["747:206:0"]={items={"Base.Plonkies"}}
    player.x,player.y=720,200
    handlers.LoadGridsquare(sq(745,205))
    run(Runtime.CHECK_TICKS*6)
    world["745:205:0"],world["747:206:0"]=nil,nil
    print=realPrint
    assert(starts()==n0,"a cell pending in the save does not log a new wait start after a reload")
end

-- The source keeps its promises: no debug gate, no isValid, bounded budget,
-- decided and filled by the No Help runtime.
local function read(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
local src=read("mod-nohelp/common/media/lua/client/NHShared/VanillaSceneRuntime.lua")
assert(not src:find("getDebug",1,true),"the scene runtime runs outside debug")
assert(not src:find(":isValid(",1,true),"never calls a story's isValid (side effects)")
assert(Runtime.REACH==30 and Runtime.RECORDS_PER_FRAME==100)
local gr=read("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua")
assert(gr:find("pcall(R.decideScenes)",1,true),"scenes are decided from the tick")
assert(gr:find("and not holdsProps(candidate,site.avoidProps)",1,true),"never a container holding vanilla's own items")
assert(gr:find("areaSession.addSceneArea{",1,true),"through Session")
assert(not io.open("mod-nohelp/common/media/lua/shared/NHShared/Generated/VanillaSceneObserver.lua"),"the old observer is gone")

print("nohelp_scene_area: ok ("..DIRECTIVE..")")
