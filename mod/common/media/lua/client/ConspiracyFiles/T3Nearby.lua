-- Manual, read-only T3 extension. No game/save mutation or automatic startup.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles = ConspiracyFiles or {}
-- A reload must take the PREVIOUS module's handler off the list, and it has to
-- happen here, at load, rather than from inside the event's own dispatch.
if ConspiracyFiles.T3Nearby then
    ConspiracyFiles.T3Nearby.cancel()
    if ConspiracyFiles.T3Nearby.handler and Events then
        Events.OnTick.Remove(ConspiracyFiles.T3Nearby.handler)
    end
end
local Selection = require("ConspiracyFiles/T3Selection")
local Reach = require("ConspiracyFiles/Reach")
local T = { version = "T3-nearby-2", reachPolicy = "P4-R55" }
ConspiracyFiles.T3Nearby = T
local job, tick
-- THE BUILDING LIST NEVER CHANGES; ONLY WHERE THE SURVIVOR IS STANDING.
-- Every attempt at a case re-walked all 9,978 buildings and asked each one
-- for its four corners across the Lua/Java bridge. That is ~105 s on the
-- hidden test machine (678 frames at about 6.5 frames a second), paid again
-- for every case, and the campaign check gave a neighbourhood 45-210 s before
-- moving on. Only two cases were generated in a whole campaign run
-- (20260921T074140-campaign).
--
-- The corners are a property of the map, so they are read once and kept. A
-- later scan does the distance arithmetic in Lua and crosses the bridge only
-- for a building the survivor could actually reach. The cache is dropped if
-- the map changes or the building count does, so a different world can never
-- be measured with another world's corners.
local bounds=nil
local function boundsFor(buildings,map)
    if bounds and bounds.map==map and bounds.count==buildings:size() then return bounds end
    bounds={map=map,count=buildings:size(),x={},y={},x2={},y2={},read=0}
    return bounds
end
local MINIMUM_STEPS = 8
local function now() return getTimeInMillis() end
local function emit(row, level)
    local keys, parts = {}, {}
    for k in pairs(row) do keys[#keys+1] = k end
    table.sort(keys)
    for _,k in ipairs(keys) do parts[#parts+1] = k .. "=" .. string.format("%q", tostring(row[k])) end
    CFLog.message("nearby","scan","" .. table.concat(parts, " "), level)
end
-- Read-only. Nothing here mutates the job; it exists because working out why
-- a scan had stalled meant counting frame numbers in the log and guessing at
-- steps per frame, which was wrong twice.
function T.progress()
    if not job then return nil end
    return {phase=job.phase, index=job.index,
        total=job.buildings and job.buildings:size() or nil,
        scanned=job.scanned, ticks=job.ticks or 0, steps=job.steps or 0,
        cornersRead=job.bounds and job.bounds.read or nil,
        frames=job.frames, peakMs=job.peak}
end
-- NEVER TOUCH THE EVENT LIST HERE. cancel() is called from inside step(), which
-- runs inside tick(), which runs inside OnTick's own dispatch - and removing a
-- handler mid-dispatch leaves OnTick unable to accept new ones at all.
--
-- Measured 2026-09-21. The first scan of a world completes, calls cancel() from
-- within the dispatch, and from that moment Events.OnTick.Add() is inert: a
-- probe handler added afterwards recorded 0 ticks over 30 seconds while the
-- game clock advanced normally. The second case's scan then sat at building 0
-- of 9,978 with ticks=0 forever, no error and no refusal - the generator
-- reported "busy" because it genuinely was still waiting. That is why a
-- campaign run produced two cases and then nothing
-- (20260921T074140-campaign: nineteen failures, one cause).
--
-- The handler is registered once at load and stays registered. It already
-- returns immediately when there is no job, so leaving it costs one nil test
-- per frame.
function T.cancel()
    job = nil
end
local function step()
    local j = job
    if j.phase == "scan" then
        if j.candidate then
            local v=j.candidate
            if j.scanRoomIndex < j.scanRooms:size() then
                local room=j.scanRooms:get(j.scanRoomIndex)
                j.names[room:getName() or ""]=true
                j.scanRoomIndex=j.scanRoomIndex+1
            else
                v.category=Selection.category(j.names)
                if v.id==j.requiredId then j.required=v end
                Selection.retain(j.pool,v)
                j.candidate,j.scanRooms,j.names=nil,nil,nil
            end
            return
        end
        if j.index >= j.buildings:size() then
            j.selected=Selection.choose(j.pool,j.seed)
            if j.required then
                local found=false;for _,v in ipairs(j.selected) do if v.id==j.required.id then found=true end end
                if not found then if #j.selected>=12 then table.remove(j.selected) end;j.selected[#j.selected+1]=j.required end
            end
            j.buildings,j.pool = nil,nil
            j.phase, j.index = "rooms", 1
            return
        end
        local idx = j.index
        j.index = j.index + 1
        j.scanned = j.scanned + 1
        local cache = j.bounds
        local x,y,x2,y2 = cache.x[idx],cache.y[idx],cache.x2[idx],cache.y2[idx]
        local b
        if x==nil then
            b = j.buildings:get(idx)
            x,y,x2,y2 = b:getX(),b:getY(),b:getX2(),b:getY2()
            cache.x[idx],cache.y[idx],cache.x2[idx],cache.y2[idx] = x,y,x2,y2
            cache.read = cache.read + 1
        end
        -- REJECT ON DISTANCE BEFORE TOUCHING THE ENGINE AGAIN. The map holds
        -- about ten thousand buildings and the survivor's reach covers a few
        -- dozen, so all but a handful of these are thrown away. getRooms()
        -- crosses the Lua/Java bridge and returns a collection; asking every
        -- building on the map for one, only to discard it on the next line,
        -- was most of the cost of preparing a case. Measured 2026-09-21: the
        -- first case took eight and a half minutes to appear.
        --
        -- The four coordinates are needed for the distance test itself, so
        -- they stay. The room list is now fetched only for a building the
        -- survivor could actually reach.
        if x2 <= x or y2 <= y then return end
        local dx = math.max(x-j.anchor.x, 0, j.anchor.x-(x2-1))
        local dy = math.max(y-j.anchor.y, 0, j.anchor.y-(y2-1))
        local d = dx*dx+dy*dy
        if d > j.radius*j.radius then return end
        -- Only now is the engine worth talking to.
        b = b or j.buildings:get(idx)
        if b:getRooms():size() == 0 then return end
        local id = tostring(b:getIDString())
        j.candidate={id=id,distance2=d,engine=b,x=x,y=y,x2=x2,y2=y2}
        j.scanRooms,j.scanRoomIndex,j.names=b:getRooms(),0,{}
    elseif j.phase == "rooms" then
        local v = j.selected[j.index]
        if not v then j.phase,j.index = "output",1; return end
        if not j.rooms then
            local b=v.engine
            j.rows[#j.rows+1] = { kind="building", id=v.id, x=v.x,y=v.y,x2=v.x2,y2=v.y2,
                minLevel=b:getMinLevel(),maxLevel=b:getMaxLevel(),distance=math.sqrt(v.distance2),
                roomCount=b:getRooms():size(),isShop=b:isShop(),isResidential=b:isResidential(),
                storage="unknown",categoryHint=v.category }
            j.rooms,j.roomIndex = b:getRooms(),0
            return
        end
        if j.rects then
            if j.rectIndex < j.rects:size() then
                j.rectCount=j.rectCount+1
                if j.rectCount > 16384 then error("rectangle safety cap exceeded; incomplete result") end
                local r=j.rects:get(j.rectIndex)
                j.rows[#j.rows+1]={kind="rect",building=v.id,room=j.roomIndex,
                    ordinal=j.rectIndex+1,x=r:getX(),y=r:getY(),w=r:getW(),h=r:getH(),z=j.roomZ}
                j.rectIndex=j.rectIndex+1
            else j.rects=nil end
            return
        end
        if j.roomIndex >= j.rooms:size() then
            v.engine=nil
            j.rooms=nil
            j.index=j.index+1
            return
        end
        local r=j.rooms:get(j.roomIndex)
        j.roomIndex=j.roomIndex+1
        j.roomCount=j.roomCount+1
        if j.roomCount > 4096 then error("room safety cap exceeded; incomplete result") end
        j.rows[#j.rows+1]={kind="room",building=v.id,ordinal=j.roomIndex,name=r:getName() or "",
            x=r:getX(),y=r:getY(),x2=r:getX2(),y2=r:getY2(),z=r:getZ(),area=r:getArea()}
        j.rects,j.rectIndex,j.roomZ=r:getRects(),0,r:getZ()
    elseif j.phase == "output" then
        -- Every row is debug detail. As info they wrote thousands of lines per
        -- case, one a step, filling the console and delaying each new case
        -- (campaign check, 2026-09-15). The summary below stays at info.
        if not CFLog.enabled("d") then j.index = #j.rows + 1 end
        if j.index <= #j.rows then
            emit(j.rows[j.index], "d"); j.index=j.index+1
        else
            T.result={version=T.version,anchor=j.anchor,gameVersion=j.gameVersion,map=j.map,
                radius=j.radius,seed=j.seed,buildings=#j.selected,rooms=j.roomCount,rectangles=j.rectCount,rows=j.rows}
            emit({kind="complete",status="extracted",buildings=#j.selected,rooms=j.roomCount,
                rectangles=j.rectCount,scanned=j.scanned,frames=j.frames,peakMs=j.peak,
                callbacksOver2Ms=j.over,scarcity=#j.selected<12,
                -- How many corners had to be read from the engine this time.
                -- 9,978 on the first scan of a world, near zero afterwards.
                cornersRead=j.bounds.read})
            T.cancel()
        end
    end
end
tick = function()
    if not job then return end
    local started, j = now(), job
    j.ticks = (j.ticks or 0) + 1
    local ok,err=pcall(function()
        for n=1,24 do
            step()
            j.steps = (j.steps or 0) + 1
            -- A FLOOR BEFORE THE CLOCK IS CONSULTED. getTimeInMillis() counts
            -- whole milliseconds, so "now()-started >= 1" is true the moment a
            -- millisecond boundary falls anywhere inside the first step - which
            -- at these speeds is most frames. The loop then did ONE building a
            -- frame instead of twenty-four.
            --
            -- Measured 2026-09-21: the first scan of a world managed 13.7
            -- buildings a frame (9,978 in 726 frames). A second scan, started
            -- while a case was live, got about one a frame and had not
            -- finished after 7,058 frames and twenty-five minutes. The frame
            -- rate was unchanged at 7.09 fps throughout, so the frames were
            -- there; the budget was refusing to use them. This is why a
            -- campaign run produced two cases and no more.
            --
            -- MINIMUM is what the frame is guaranteed to cost: eight steps of
            -- arithmetic against cached corners. The peak measured with all
            -- twenty-four was 5-6 ms, so eight is well inside it, and the time
            -- guard still stops a frame that turns out expensive.
            if not job then break end
            if n >= MINIMUM_STEPS and now()-started >= 1 then break end
        end
    end)
    local elapsed=now()-started
    j.frames,j.peak=j.frames+1,math.max(j.peak,elapsed)
    if elapsed>2 then j.over=j.over+1 end
    if not ok then T.error=tostring(err);emit({kind="error",message=err}); T.cancel() end
end
-- `radiusSource` names WHY a radius was given, for the log and the evidence
-- file. A caller that widens the reach on purpose (P4-R133's second rung) must
-- not have to borrow the debug override's label: the two are read by a person
-- deciding whether a scan was policy or a hand-typed console command.
function T.start(radius,seed,requiredId,radiusSource)
    if not getDebug or not getDebug() then return false,"debug mode required" end
    if (isClient and isClient()) or (isServer and isServer()) then return false,"single player only" end
    seed=seed or 1
    if type(seed)~="number" or seed~=math.floor(seed) or seed<1 or seed>=2147483647 then return false,"seed must be 1..2147483646" end
    local p=getPlayer()
    local w=getWorld()
    if not p or not w or not w:getMetaGrid() then return false,"load a game first" end
    local hours=p:getHoursSurvived()
    local automatic=radius==nil
    if automatic then
        local why
        radius,why=Reach.radius(hours)
        if not radius then return false,why end
    end
    if type(radius)~="number" or radius~=radius or radius<1 or radius>5000 then return false,"radius must be 1..5000 tiles" end
    local buildings=w:getMetaGrid():getBuildings()
    if not buildings then return false,"building metadata unavailable" end
    T.cancel()
    T.result=nil
    T.error=nil
    local cache=boundsFor(buildings,tostring(w:getMap())); cache.read=0
    job={phase="scan",index=0,buildings=buildings,bounds=cache,
        selected={},pool={},rows={},radius=radius,seed=seed,
        requiredId=requiredId,
        anchor={x=math.floor(p:getX()),y=math.floor(p:getY()),z=math.floor(p:getZ()),source="manual-start-position"},
        gameVersion=tostring(getGameVersion()),map=tostring(w:getMap()),
        scanned=0,roomCount=0,rectCount=0,frames=0,peak=0,over=0}
    emit({kind="begin",version=T.version,gameVersion=job.gameVersion,map=job.map,
        x=job.anchor.x,y=job.anchor.y,z=job.anchor.z,anchorSource=job.anchor.source,radius=radius,
        selection="category-round-robin-nearest-3-seeded",seed=seed,storage="unknown",
        hoursSurvived=hours,radiusSource=(type(radiusSource)=="string" and #radiusSource>0 and #radiusSource<=40
            and radiusSource) or (automatic and "P4-R55" or "explicit-debug-override")})
    return true
end
T.handler = tick
if Events then Events.OnTick.Add(tick) end
-- Inline diagnostic allows hot loading through an already indexed PZ file.
ConspiracyFiles.GeneratedDiagnostic=(function()
-- Read-only owner-triggered diagnostic. No item, save or placement mutations.
local D={}
local active
function D.run()
    if active then return false,"diagnostic running" end
    if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer()) then return false,"debug single player required" end
    local wrapper=ModData.get("ConspiracyFiles.Generated.G2")
    local root=wrapper and wrapper.canonical
    if not root or not root.case then return false,"no generated case" end
    local function log(s) CFLog.message("nearby","scan",s) end
    local player=getPlayer()
    if player then log("player="..player:getX()..","..player:getY()..","..player:getZ()) end
    local tasks={}
    for _,doc in ipairs(root.case.documents) do
        local a=root.assignments[doc.id]; local t=a.target
        -- A clue can be waiting for a container and have no target at all
        -- (P4-R133); it is not a thing this probe can look at.
        if not t then log("document="..doc.title.." status="..a.status.." target=none")
        else
        log("document="..doc.title.." status="..a.status.." target="..t.x..","..t.y..","..t.z..
            " object="..t.objectIndex.." container="..t.containerIndex.." type="..t.containerType.." sprite="..t.sprite)
        tasks[#tasks+1]={doc=doc,a=a,oi=0,ci=0,ii=0}
        end
    end
    local cursor=1
    local function step()
        local task=tasks[cursor]
        if not task then return true end
        local t=task.a.target
        local square=getCell():getGridSquare(t.x,t.y,t.z)
        if not square then log("target unloaded: "..task.doc.title); cursor=cursor+1; return end
        local objects=square:getObjects()
        if task.oi>=objects:size() or task.oi>=32 then
            if objects:size()>32 then log("objects truncated at 32") end
            cursor=cursor+1; return
        end
        local o=objects:get(task.oi)
        if not o.getContainerCount or task.ci>=o:getContainerCount() or task.ci>=8 then task.oi=task.oi+1; task.ci=0; task.ii=0; return end
        local c=o:getContainerByIndex(task.ci)
        if not c then task.ci=task.ci+1; task.ii=0; return end
        local items=c:getItems()
        if task.ii==0 then
            local sprite=o:getSprite()
            log("actual object="..task.oi.." container="..task.ci.." type="..c:getType()..
                " sprite="..tostring(sprite and sprite:getName()).." explored="..tostring(c:isExplored()).." items="..items:size())
        end
        if task.ii>=items:size() or task.ii>=128 then
            if items:size()>128 then log("contents truncated at 128") end
            task.ci=task.ci+1; task.ii=0; return
        end
        local item=items:get(task.ii); local md=item:getModData()
        log("item="..tostring(item:getName()).." matchesExpectedToken="..tostring(md.cfPhysicalToken==task.a.physicalToken))
        task.ii=task.ii+1
    end
    -- Same rule as T.cancel above: this handler must not remove itself from
    -- inside OnTick's dispatch, or OnTick stops accepting new handlers for the
    -- rest of the session. It parks itself with a flag and is taken off the
    -- list on the next frame, from outside its own run.
    local finished=false
    active=function()
        if finished then
            Events.OnTick.Remove(active); active=nil; finished=false; return
        end
        local begin=getTimeInMillis()
        local ok,err=pcall(function()
            for i=1,16 do
                if step() then finished=true; log("complete"); return end
                if getTimeInMillis()-begin>=1 then return end
            end
        end)
        if not ok then finished=true; log("error="..tostring(err)) end
    end
    Events.OnTick.Add(active)
    return true
end
return D
end)()
return T
