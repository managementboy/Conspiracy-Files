-- Manual, read-only T3 extension. No game/save mutation or automatic startup.
ConspiracyFiles = ConspiracyFiles or {}
if ConspiracyFiles.T3Nearby then ConspiracyFiles.T3Nearby.cancel() end
local Selection = require("ConspiracyFiles/T3Selection")
local Reach = require("ConspiracyFiles/Reach")
local T = { version = "T3-nearby-2", reachPolicy = "P4-R55" }
ConspiracyFiles.T3Nearby = T
local job, tick
local function now() return getTimeInMillis() end
local function emit(row)
    local keys, parts = {}, {}
    for k in pairs(row) do keys[#keys+1] = k end
    table.sort(keys)
    for _,k in ipairs(keys) do parts[#parts+1] = k .. "=" .. string.format("%q", tostring(row[k])) end
    print("[CF-T3-NEARBY] " .. table.concat(parts, " "))
end
function T.cancel()
    if tick and Events then Events.OnTick.Remove(tick) end
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
        local b = j.buildings:get(j.index)
        j.index = j.index + 1
        j.scanned = j.scanned + 1
        local x,y,x2,y2 = b:getX(),b:getY(),b:getX2(),b:getY2()
        if x2 <= x or y2 <= y or b:getRooms():size() == 0 then return end
        local dx = math.max(x-j.anchor.x, 0, j.anchor.x-(x2-1))
        local dy = math.max(y-j.anchor.y, 0, j.anchor.y-(y2-1))
        local d = dx*dx+dy*dy
        if d > j.radius*j.radius then return end
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
        if j.index <= #j.rows then
            emit(j.rows[j.index]); j.index=j.index+1
        else
            T.result={version=T.version,anchor=j.anchor,gameVersion=j.gameVersion,map=j.map,
                radius=j.radius,seed=j.seed,buildings=#j.selected,rooms=j.roomCount,rectangles=j.rectCount,rows=j.rows}
            emit({kind="complete",status="extracted",buildings=#j.selected,rooms=j.roomCount,
                rectangles=j.rectCount,scanned=j.scanned,frames=j.frames,peakMs=j.peak,
                callbacksOver2Ms=j.over,scarcity=#j.selected<12})
            T.cancel()
        end
    end
end
tick = function()
    if not job then return end
    local started, j = now(), job
    local ok,err=pcall(function()
        for _=1,24 do
            step()
            if not job or now()-started >= 1 then break end
        end
    end)
    local elapsed=now()-started
    j.frames,j.peak=j.frames+1,math.max(j.peak,elapsed)
    if elapsed>2 then j.over=j.over+1 end
    if not ok then T.error=tostring(err);emit({kind="error",message=err}); T.cancel() end
end
function T.start(radius,seed,requiredId)
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
    job={phase="scan",index=0,buildings=buildings,selected={},pool={},rows={},radius=radius,seed=seed,
        requiredId=requiredId,
        anchor={x=math.floor(p:getX()),y=math.floor(p:getY()),z=math.floor(p:getZ()),source="manual-start-position"},
        gameVersion=tostring(getGameVersion()),map=tostring(w:getMap()),
        scanned=0,roomCount=0,rectCount=0,frames=0,peak=0,over=0}
    emit({kind="begin",version=T.version,gameVersion=job.gameVersion,map=job.map,
        x=job.anchor.x,y=job.anchor.y,z=job.anchor.z,anchorSource=job.anchor.source,radius=radius,
        selection="category-round-robin-nearest-3-seeded",seed=seed,storage="unknown",
        hoursSurvived=hours,radiusSource=automatic and "P4-R55" or "explicit-debug-override"})
    Events.OnTick.Add(tick)
    return true
end
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
    local function log(s) print("[CF-G2-DIAG] "..s) end
    local player=getPlayer()
    if player then log("player="..player:getX()..","..player:getY()..","..player:getZ()) end
    local tasks={}
    for _,doc in ipairs(root.case.documents) do
        local a=root.assignments[doc.id]; local t=a.target
        log("document="..doc.title.." status="..a.status.." target="..t.x..","..t.y..","..t.z..
            " object="..t.objectIndex.." container="..t.containerIndex.." type="..t.containerType.." sprite="..t.sprite)
        tasks[#tasks+1]={doc=doc,a=a,oi=0,ci=0,ii=0}
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
    active=function()
        local begin=getTimeInMillis()
        local ok,err=pcall(function()
            for i=1,16 do
                if step() then Events.OnTick.Remove(active); active=nil; log("complete"); return end
                if getTimeInMillis()-begin>=1 then return end
            end
        end)
        if not ok then Events.OnTick.Remove(active); active=nil; log("error="..tostring(err)) end
    end
    Events.OnTick.Add(active)
    return true
end
return D
end)()
-- Hot-load proximity hints through an existing indexed file.
function T.enableHints()
    return (function()
-- Subtle discovery assistance: never grants knowledge or calls a zombie-attraction sound API.
local World=require("ConspiracyFiles/WorldAccess")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.ClueHints then ConspiracyFiles.ClueHints.stop() end
local H={}
ConspiracyFiles.ClueHints=H
local phrases={"Is this a clue?","Something here seems worth a look.","Could this mean something?",
    "Maybe I should check that.","That might be worth reading."}
local visits,nextPoll,lastHint,phrase={},0,-60000,0
local pending
local function near(p,t,d)
    return math.floor(p:getZ())==t.z and math.abs(math.floor(p:getX())-t.x)<=d and math.abs(math.floor(p:getY())-t.y)<=d
end
local function eligible(root,id)
    local a=root and root.assignments and root.assignments[id]
    if not a or a.status~="placed" then return nil end
    for _,known in ipairs(root.known or {}) do if known==id then return nil end end
    return a
end
local function enabled()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function step()
    if not enabled() then pending=nil; return end
    local p=getPlayer(); if not p then pending=nil; return end
    local wrapper=ModData.get("ConspiracyFiles.Generated.G2")
    local root=wrapper and wrapper.canonical
    if not root then pending=nil; return end
    local now=getTimeInMillis()
    if pending then
        local task=pending
        local a=eligible(root,task.id)
        if not a or not near(p,a.target,1) or World.resolve(a.target)~=task.container then pending=nil; return end
        local started=now
        for _=1,24 do
            task.steps=task.steps+1
            if task.steps>512 then pending=nil; return end -- unknown if too large; stay silent
            if task.scan() then
                pending=nil
                if task.count==1 and now-lastHint>=60000 and not visits[task.key] then
                    phrase=phrase%#phrases+1
                    p:Say(phrases[phrase])
                    visits[task.key]=a.target; lastHint=now
                end
                return
            end
            if getTimeInMillis()-started>=1 then return end
        end
        return
    end
    if now<nextPoll then return end
    nextPoll=now+500
    for key,t in pairs(visits) do if not near(p,t,3) then visits[key]=nil end end
    if now-lastHint<60000 then return end
    for _,doc in ipairs(root.case.documents) do
        local a=eligible(root,doc.id)
        if a and near(p,a.target,1) then
            local t=a.target
            local key=t.x..":"..t.y..":"..t.z..":"..t.objectIndex..":"..t.containerIndex
            local c=not visits[key] and World.resolve(t)
            if c then
                local task={id=doc.id,key=key,container=c,steps=0}
                task.scan=World.count(c,a.physicalToken,function(n) task.count=n end)
                pending=task; return
            end
        end
    end
end
local handler
function H.stop() if handler then Events.OnTick.Remove(handler) end; pending=nil end
handler=function()
    local ok,why=pcall(step)
    if not ok then H.stop(); print("[CF-G2-HINT] disabled: "..tostring(why)) end
end
Events.OnTick.Add(handler)
return H
end)()
end
return T
