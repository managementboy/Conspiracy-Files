-- Read-only owner-triggered diagnostic. No item, save or placement mutations.
local CFLog=require("ConspiracyFiles/Log")
local D={}
local active,accessTask
-- Published on the shared table, not just returned: reloadLuaFile re-runs
-- this body, while require() would keep serving the cached older module.
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.GeneratedDiagnostic=D
function D.run()
    if active then return false,"diagnostic running" end
    if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer()) then return false,"debug single player required" end
    local wrapper=ModData.get("ConspiracyFiles.Generated.G2")
    local current=wrapper and require("ConspiracyFiles/Generated/SuccessiveCases").current(wrapper)
    local root=current and current.canonical
    if not root or not root.case then return false,"no generated case" end
    local function log(s) CFLog.message("diag","probe",s) end
    local player=getPlayer()
    if player then log("player="..player:getX()..","..player:getY()..","..player:getZ()) end
    local tasks={}
    for _,doc in ipairs(root.case and root.case.documents or {}) do
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

-- Read-only reachability probe.  Answers "can the player actually get to every
-- placed clue", and detects a target square whose real z differs from the one
-- recorded in the assignment.  Bounded and incremental; mutates nothing.
function D.access(radius)
    if accessTask then return false,"access probe running" end
    if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer()) then return false,"debug single player required" end
    local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
    local wrapper=ModData.get("ConspiracyFiles.Generated.G2")
    local current=wrapper and Cases.current(wrapper)
    local roots=current and Cases.sessions(current)
    if not roots or #roots==0 then return false,"no generated case" end
    radius=(type(radius)=="number" and radius>=1 and radius<=24) and math.floor(radius) or 12
    local function log(s) CFLog.message("diag","probe",s) end
    local targets,levels,box={},{},nil
    for _,root in ipairs(roots) do
        for _,doc in ipairs(root.case and root.case.documents or {}) do
            local t=root.assignments[doc.id].target
            targets[#targets+1]={title=doc.title,t=t}
            levels[t.z]=true
            if not box then box={x1=t.x,y1=t.y,x2=t.x,y2=t.y}
            else box.x1=math.min(box.x1,t.x); box.y1=math.min(box.y1,t.y); box.x2=math.max(box.x2,t.x); box.y2=math.max(box.y2,t.y) end
        end
    end
    for _,entry in ipairs(targets) do
        local t=entry.t
        local square=getCell():getGridSquare(t.x,t.y,t.z)
        if not square then
            log(entry.title.." "..t.x..","..t.y..","..t.z.." -> NO SQUARE (absent or unloaded)")
        else
            local room=square:getRoom()
            local actual=square:getZ()
            log(entry.title.." "..t.x..","..t.y..","..t.z.." -> actual z="..actual..
                (actual~=t.z and " *** Z MISMATCH ***" or "")..
                " room="..tostring(room and room:getName())..
                " objects="..square:getObjects():size())
        end
    end
    -- Scan the level above each target too: the way down into a basement is
    -- a staircase on the floor above, not on the floor the clue sits on.
    local wanted={}
    for z in pairs(levels) do wanted[z]=true; wanted[z+1]=true end
    local zs={}
    for z in pairs(wanted) do zs[#zs+1]=z end
    table.sort(zs)
    local squares,stairs,dx,dy,zi={},{},box.x1-radius,box.y1-radius,1
    for _,z in ipairs(zs) do squares[z]=0; stairs[z]=0 end
    accessTask=function()
        local begin=getTimeInMillis()
        local ok,err=pcall(function()
            for _=1,64 do
                local z=zs[zi]
                if not z then
                    for _,level in ipairs(zs) do
                        log("level "..level..": squares="..squares[level].." stairSquares="..stairs[level])
                    end
                    log("scanned radius "..radius.." around "..box.x1..","..box.y1.." - "..box.x2..","..box.y2)
                    log("complete")
                    Events.OnTick.Remove(accessTask); accessTask=nil; return
                end
                local square=getCell():getGridSquare(dx,dy,z)
                if square then
                    squares[z]=squares[z]+1
                    if square.HasStairs and square:HasStairs() then
                        stairs[z]=stairs[z]+1
                        log("stairs at "..dx..","..dy..","..z)
                    end
                end
                dx=dx+1
                if dx>box.x2+radius then
                    dx=box.x1-radius; dy=dy+1
                    if dy>box.y2+radius then dy=box.y1-radius; zi=zi+1 end
                end
                if getTimeInMillis()-begin>=1 then return end
            end
        end)
        if not ok then Events.OnTick.Remove(accessTask); accessTask=nil; log("error="..tostring(err)) end
    end
    Events.OnTick.Add(accessTask)
    return true
end

-- Log level, from the debug console. Debug is off by default because a log
-- left at debug is how this became unreadable the first time:
--
--     ConspiracyFiles.logLevel("d")   everything, for one session
--     ConspiracyFiles.logLevel("i")   the default
--     ConspiracyFiles.logLevel()      report the current level
ConspiracyFiles=ConspiracyFiles or {}
function ConspiracyFiles.logLevel(level)
    local Log=require("ConspiracyFiles/Log")
    if level==nil then return Log.level end
    Log.level=level
    Log.info("note",{mod="diag",msg="log level now "..tostring(Log.level)})
    return Log.level
end

return D

