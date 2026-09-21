-- Read-only owner-triggered diagnostic. No item, save or placement mutations.
local CFLog=require("ConspiracyFiles/Log")
local D={}
-- ONE PERMANENT DISPATCHER, AND A JOB THAT IS EITHER THERE OR NOT.
--
-- Both probes below used to take themselves off Events.OnTick from inside
-- their own run - which is inside OnTick's dispatch, because that is where a
-- handler runs. Removing a handler mid-dispatch leaves OnTick unable to accept
-- new ones for the rest of the session: a probe handler added afterwards
-- recorded 0 ticks over 30 seconds while the game clock advanced normally, and
-- the next case's scan sat at building 0 of 9,978 with ticks=0 forever, no
-- error and no refusal (T3Nearby, 2026-09-21; 20260921T074140-campaign).
--
-- These two are debug-gated and so never cost a player a case, but they ship,
-- and a debug session that ran one would poison every later tick handler in
-- the same way. The rule is the same one T3Nearby already follows: register
-- once at load, never touch the event list again, and say "finished" by
-- clearing the job.
local jobs={}
local function runJobs()
    if not jobs.access and not jobs.contents then return end
    for name,fn in pairs(jobs) do
        local ok,err=pcall(fn)
        if not ok then jobs[name]=nil; CFLog.message("nearby","scan","error="..tostring(err)) end
    end
end
D.handler=runJobs
-- Observable job state, so a caller (and a test) can ask whether anything is
-- still running instead of inferring it from the size of the event list - which
-- is exactly the inference that stopped being available when the dispatcher
-- became permanent, and was never a safe one anyway.
function D.busy()
    local names={}
    for name in pairs(jobs) do names[#names+1]=name end
    table.sort(names)
    return #names>0, table.concat(names, ",")
end
-- A reload must take the PREVIOUS module's handler off the list, and it has to
-- happen HERE, at load, which is outside any dispatch - never from inside one.
if ConspiracyFiles and ConspiracyFiles.GeneratedDiagnostic
    and ConspiracyFiles.GeneratedDiagnostic.handler and Events then
    Events.OnTick.Remove(ConspiracyFiles.GeneratedDiagnostic.handler)
end
-- Published on the shared table, not just returned: reloadLuaFile re-runs
-- this body, while require() would keep serving the cached older module.
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.GeneratedDiagnostic=D
function D.run()
    if jobs.contents then return false,"diagnostic running" end
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
        -- A clue still waiting for a container has no target (P4-R133).
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
    jobs.contents=function()
        local begin=getTimeInMillis()
        for _=1,16 do
            if step() then jobs.contents=nil; log("complete"); return end
            if getTimeInMillis()-begin>=1 then return end
        end
    end
    return true
end

-- Read-only reachability probe.  Answers "can the player actually get to every
-- placed clue", and detects a target square whose real z differs from the one
-- recorded in the assignment.  Bounded and incremental; mutates nothing.
function D.access(radius)
    if jobs.access then return false,"access probe running" end
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
            -- A clue waiting for a container has no target (P4-R133).
            local t=root.assignments[doc.id].target
            if t then
            targets[#targets+1]={title=doc.title,t=t}
            levels[t.z]=true
            if not box then box={x1=t.x,y1=t.y,x2=t.x,y2=t.y}
            else box.x1=math.min(box.x1,t.x); box.y1=math.min(box.y1,t.y); box.x2=math.max(box.x2,t.x); box.y2=math.max(box.y2,t.y) end
            end
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
    jobs.access=function()
        local begin=getTimeInMillis()
        do
            for _=1,64 do
                local z=zs[zi]
                if not z then
                    for _,level in ipairs(zs) do
                        log("level "..level..": squares="..squares[level].." stairSquares="..stairs[level])
                    end
                    log("scanned radius "..radius.." around "..box.x1..","..box.y1.." - "..box.x2..","..box.y2)
                    log("complete")
                    jobs.access=nil; return
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
        end
    end
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

-- Registered once, at load, and never removed. It returns on the first line
-- when there is no job, so an idle dispatcher costs two nil tests a frame.
if Events then Events.OnTick.Add(D.handler) end
return D
