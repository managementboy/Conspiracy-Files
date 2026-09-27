-- VANILLA SCENES IN PLAY (task 3 plan, step 5; directive NH-D7). Finds the
-- scenes vanilla built, from what they left, and hands each confirmed one to
-- the world record (GeneratedRuntime.sceneSeen), where it gets its one clue
-- (AreaCase.decideScene) - created, like every clue, only once the survivor
-- is within the 40-tile arrival ring (GeneratedRuntime's filler). This never
-- intercepts or patches vanilla generation, and never moves, renames or
-- removes anything vanilla put there. Replaces the old debug-only vehicle
-- observer, which no longer gates anything.
--
-- FLAG AND DEFER. Vanilla raises no event for a scene. LoadGridsquare and
-- OnDeadBodySpawn only FLAG the 10x10 cell (a table write, nothing read).
-- Every R.CHECK_TICKS the flagged cell nearest the survivor, within R.REACH
-- tiles, is looked at: its squares plus R.MARGIN around it, at most
-- R.RECORDS_PER_FRAME squares a tick, each read under pcall. What it finds
-- becomes SceneMatch tokens, merged with any traces saved for that cell
-- earlier (a scene emptied before it was confirmed still confirms), and the
-- first kind matched there is saved set-once (Session `scenes`). Traces
-- without a match are saved as pending only when one is more than an
-- ordinary house shows (SceneMatch.worthKeeping).
--
-- "scene-wait" (ev=scan): start when a cell's first look finds traces but no
-- match; end when it confirms; with the area, the in-game hours waited, the
-- survivor's distance and whether they were walking or driving - the timing
-- the plan's step 5 asks to be visible.
--
-- Engine calls (Build 42.20, javap on projectzomboid.jar, and vanilla Lua
-- where it uses them): IsoGridSquare getRoom/getObjects/getWorldObjects/
-- getDeadBodys/getMovingObjects/getVehicleContainer, IsoRoom getName/
-- getRoomDef, RoomDef getX/getY/getX2/getY2, IsoObject getSprite + getName,
-- IsoWorldInventoryObject getItem + getFullType, IsoDeadBody/IsoZombie
-- getOutfitName, BaseVehicle getScriptName, IsoGameCharacter getVehicle;
-- the story lists as DebugContextMenu.lua reads them (SceneMatch prefilter).
local SceneMatch=require("NHShared/Generated/SceneMatch")
local Scenes=require("NHShared/Generated/VanillaScenes")
local CFLog=require("NHShared/Log")
NHShared=NHShared or {}
local R=NHShared.VanillaSceneRuntime or {}
NHShared.VanillaSceneRuntime=R
NHEngine=NHEngine or {};NHEngine.VanillaSceneRuntime=R
if R.loaded then return R end

R.REACH=30
R.MARGIN=5
R.RECORDS_PER_FRAME=100
R.CHECK_TICKS=30
R.MAX_FLAGGED=4096
-- Flags far from the survivor are forgotten once the list is three quarters
-- full: a long drive loads (and flags) a wide band of cells of which only
-- those within REACH are ever looked at, and a full list would stop new
-- scenes being noticed at all. A forgotten cell is flagged again when its
-- squares load again; its waiting traces are kept.
R.FORGET=150

local flagged,nFlagged={},0
local job
local allow,allowRead=nil,false
local ticks=0
local waiting={}     -- cell key -> world hours of the first look with traces
local confirmed={}   -- cell key -> kind, this session (R.matchVehicle)

-- The same gate as the No Help runtime: single player only.
local function enabled()
    return not (isClient and isClient()) and not (isServer and isServer())
        and not NHShared.T11Mode and not NHShared.T12Mode
end
local function hoursNow()
    local ok,h=pcall(function() return getGameTime():getWorldAgeHours() end)
    if ok and type(h)=="number" and h==h and h>=0 and h<math.huge then return h end
    return 0
end
local function runtime() return NHShared.GeneratedRuntime end

local function flag(x,y,z)
    local cx,cy=SceneMatch.cellOf(x,y)
    local key=SceneMatch.cellKey(cx,cy,z)
    if flagged[key] or nFlagged>=R.MAX_FLAGGED then return end
    flagged[key]={cx=cx,cy=cy,z=math.floor(z)}
    nFlagged=nFlagged+1
end
R.flag=flag
local function onSquare(square)
    if not enabled() or not square then return end
    pcall(function() flag(square:getX(),square:getY(),square:getZ()) end)
end
local function onBody(body)
    if not enabled() or not body then return end
    pcall(function()
        local square=body:getSquare()
        if square then flag(square:getX(),square:getY(),square:getZ()) end
    end)
end

-- THE PREFILTER, read once a session: the story names the running game lists.
local function readAllow()
    allowRead=true
    local names={}
    local function add(get)
        pcall(function()
            local list=get()
            if not list then return end
            for i=0,list:size()-1 do
                local story=list:get(i)
                local name=story and story:getName()
                if type(name)=="string" then names[#names+1]=name end
            end
        end)
    end
    add(function() return getWorld():getRandomizedBuildingList() end)
    add(function() return getWorld():getRBBasic():getSurvivorStories() end)
    add(function() return getWorld():getRandomizedZoneList() end)
    add(function() return getWorld():getRandomizedVehicleStoryList() end)
    allow=SceneMatch.allowFromNames(names)
    if not allow then CFLog.write("w","scan",{why="scene-prefilter-unreadable"}) end
end

local function survivor()
    local p=getPlayer and getPlayer()
    if not p then return nil end
    local s
    pcall(function()
        s={x=math.floor(p:getX()),y=math.floor(p:getY()),z=math.floor(p:getZ())}
        s.mode=p:getVehicle()~=nil and "driving" or "walking"
    end)
    return s
end
local function distanceTo(s,x,y)
    if not s then return nil end
    return math.max(math.abs(s.x-x),math.abs(s.y-y))
end

-- One square's facts, as relevant tokens with where they were first seen.
local function note(found,sort,name,x,y,z,room)
    if type(name)~="string" or name=="" then return end
    local token=sort=="vehicle" and SceneMatch.vehicleToken(name) or sort..":"..name
    if SceneMatch.relevant(token) and not found[token] then found[token]={x=x,y=y,z=z,room=room} end
end
local function readSquare(square,found)
    local x,y,z=square:getX(),square:getY(),square:getZ()
    local room
    pcall(function()
        local r=square:getRoom()
        if r then
            room={name=r:getName()}
            local def=r:getRoomDef()
            if def then room.bounds={x1=def:getX(),y1=def:getY(),x2=def:getX2(),y2=def:getY2()} end
        end
    end)
    if room then note(found,"room",room.name,x,y,z,room) end
    pcall(function()
        local list=square:getObjects()
        for i=0,list:size()-1 do
            local sprite=list:get(i):getSprite()
            if sprite then note(found,"sprite",sprite:getName(),x,y,z,room) end
        end
    end)
    pcall(function()
        local list=square:getWorldObjects()
        for i=0,list:size()-1 do
            local item=list:get(i):getItem()
            if item then note(found,"item",item:getFullType(),x,y,z,room) end
        end
    end)
    pcall(function()
        local list=square:getDeadBodys()
        for i=0,list:size()-1 do note(found,"body",list:get(i):getOutfitName(),x,y,z,room) end
    end)
    pcall(function()
        local list=square:getMovingObjects()
        for i=0,list:size()-1 do
            local o=list:get(i)
            if instanceof(o,"IsoZombie") then note(found,"zombie",o:getOutfitName(),x,y,z,room) end
        end
    end)
    pcall(function()
        local v=square:getVehicleContainer()
        if v then note(found,"vehicle",v:getScriptName(),x,y,z,room) end
    end)
end

local function sortedTokens(found)
    local out={}
    for token in pairs(found) do out[#out+1]=token end
    table.sort(out)
    return out
end

-- A finished look at one cell.
local function finish(j)
    local gr=runtime()
    if not gr or not gr.scene or not gr.sceneSeen then return end
    local tokens=sortedTokens(j.found)
    local old=gr.scene(j.key)
    if old and old.kind then return end
    local merged=SceneMatch.merge(tokens,old and old.pending)
    local s=survivor()
    local now=hoursNow()
    local kind,_,anchor=SceneMatch.match(merged,allow)
    if kind then
        local at=anchor and j.found[anchor]
        local x=at and at.x or j.cx*SceneMatch.CELL+SceneMatch.CELL/2
        local y=at and at.y or j.cy*SceneMatch.CELL+SceneMatch.CELL/2
        local cite=Scenes.citation(kind)
        -- A hand-checked scene is its citation's, decided by place (the
        -- runtime's decideScenes): never a second record for it.
        if cite then return end
        local key=SceneMatch.keyAt(x,y,j.z)
        -- One scene, one record: a look that closes a match from traces kept
        -- earlier may not know where the anchor was, and a scene lying across
        -- a cell edge can be seen from the next cell too. The same kind
        -- already confirmed in this cell or a neighbour is that scene.
        local kcx,kcy=SceneMatch.cellOf(x,y)
        for dx=-1,1 do for dy=-1,1 do
            local r=gr.scene(SceneMatch.cellKey(kcx+dx,kcy+dy,j.z))
            if r and r.kind==kind then return end
        end end
        local rec={kind=kind,x=x,y=y,z=j.z,hours=now,source="seen"}
        local row=Scenes.get(kind)
        if row and row.anchor=="room-container" and at and at.room and at.room.bounds
            and at.room.bounds.x2>at.room.bounds.x1 and at.room.bounds.y2>at.room.bounds.y1 then
            rec.room=at.room.name; rec.bounds=at.room.bounds
        else
            local cx,cy=SceneMatch.cellOf(x,y)
            rec.bounds=SceneMatch.cellBounds(cx,cy)
        end
        local ok,why=gr.sceneSeen(key,rec)
        if ok then
            confirmed[key]=kind
            local started=waiting[j.key]
            CFLog.write("i","scan",{why="scene-wait-end",area=key,kind=kind,
                hours=string.format("%.2f",started and now-started or 0),
                distance=distanceTo(s,x,y),mode=s and s.mode})
        else
            CFLog.write("d","skip",{case=key,why="scene-"..tostring(why)})
        end
        return
    end
    if SceneMatch.worthKeeping(merged) then
        if not waiting[j.key] then
            waiting[j.key]=now
            CFLog.write("i","scan",{why="scene-wait-start",area=j.key,n=#merged,
                distance=distanceTo(s,j.cx*SceneMatch.CELL,j.cy*SceneMatch.CELL),mode=s and s.mode})
        end
        gr.sceneSeen(j.key,{pending=merged,x=j.cx*SceneMatch.CELL+SceneMatch.CELL/2,
            y=j.cy*SceneMatch.CELL+SceneMatch.CELL/2,z=j.z,hours=now})
    end
end

-- One look: the cell and its margin, square by square, bounded per tick.
local function startJob(key)
    local c=flagged[key]
    flagged[key]=nil; nFlagged=nFlagged-1
    local x1=c.cx*SceneMatch.CELL-R.MARGIN
    local y1=c.cy*SceneMatch.CELL-R.MARGIN
    local side=SceneMatch.CELL+2*R.MARGIN
    job={key=key,cx=c.cx,cy=c.cy,z=c.z,x1=x1,y1=y1,side=side,i=0,found={}}
end
local function stepJob()
    local j=job
    local total=j.side*j.side
    local stop=math.min(total,j.i+R.RECORDS_PER_FRAME)
    local cell=getCell()
    while j.i<stop do
        local dx,dy=j.i%j.side,math.floor(j.i/j.side)
        j.i=j.i+1
        local square
        pcall(function() square=cell:getGridSquare(j.x1+dx,j.y1+dy,j.z) end)
        if square then pcall(readSquare,square,j.found) end
    end
    if j.i>=total then
        job=nil
        local ok,err=pcall(finish,j)
        if not ok then CFLog.write("w","scan",{why="scene-look-failed",area=j.key,err=tostring(err)}) end
    end
end

local function tick()
    if not enabled() then return end
    ticks=ticks+1
    if job then stepJob(); return end
    if ticks%R.CHECK_TICKS~=0 or nFlagged==0 then return end
    local gr=runtime()
    if not gr or not gr.scene then return end
    if not allowRead then readAllow() end
    local s=survivor()
    if not s then return end
    if nFlagged>=R.MAX_FLAGGED*3/4 then
        local far={}
        for key,c in pairs(flagged) do
            local mx,my=c.cx*SceneMatch.CELL+SceneMatch.CELL/2,c.cy*SceneMatch.CELL+SceneMatch.CELL/2
            if c.z~=math.floor(s.z) or math.max(math.abs(mx-s.x),math.abs(my-s.y))>R.FORGET then far[#far+1]=key end
        end
        for _,key in ipairs(far) do flagged[key]=nil end
        nFlagged=nFlagged-#far
    end
    local keys=SceneMatch.nearCells(flagged,s.x,s.y,s.z,R.REACH,8)
    for _,key in ipairs(keys) do
        local rec=gr.scene(key)
        if rec and rec.kind then flagged[key]=nil; nFlagged=nFlagged-1
        else startJob(key); return end
    end
end

-- The kind of a scene confirmed this session at a vehicle's cell, as the
-- vehicle target's sceneSignature, or nil. Records a scene's car on the
-- target; gates nothing (a No Help vehicle clue takes any car at its place).
function R.matchVehicle(x,y,z)
    local kind=confirmed[SceneMatch.keyAt(x,y,z)]
    return kind and "scene:"..kind or nil
end
function R.flaggedCount() return nFlagged end
function R.reset()
    flagged,nFlagged,job,waiting,confirmed={},0,nil,{},{}
    allow,allowRead,ticks=nil,false,0
end
local Events_=require("NHShared/Events/EngineEvents")
if Events and Events.LoadGridsquare then Events_.on("LoadGridsquare",onSquare) end
if Events and Events.OnDeadBodySpawn then Events_.on("OnDeadBodySpawn",onBody) end
if Events and Events.OnTick then Events_.on("OnTick",function() local ok,err=pcall(tick); if not ok then job=nil; CFLog.write("w","scan",{why="scene-tick-failed",err=tostring(err)}) end end) end
if Events and Events.OnGameStart then Events_.on("OnGameStart",R.reset) end
R.loaded=true
return R
