local Content = require("ConspiracyFiles/Content")
local Placement = require("ConspiracyFiles/Placement")
local Session = require("ConspiracyFiles/Session")
local Scheduler = require("ConspiracyFiles/Scheduler")
local Bindings = require("ConspiracyFiles/Bindings")
local World = require("ConspiracyFiles/WorldAccess")
ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.Runtime = ConspiracyFiles.Runtime or {}
local Runtime = ConspiracyFiles.Runtime
if Runtime.scriptLoaded then return Runtime end
Runtime.VERSION = "DEV-0.6-transactional-candidate"
Runtime.disabled = true
local session, scheduler, sampler, ticks
local bindingNotices={}
local assets = {}; for _,id in ipairs(Content.thread.documentAssetIds) do assets[#assets+1]=id end
for _,id in ipairs(Content.thread.optionalAssetIds) do assets[#assets+1]=id end
local function log(kind,message)
    print("[CF-DEAD-AIR]|"..kind.."|version="..Runtime.VERSION.."|"..tostring(message or ""):gsub("\n"," "):gsub("|","/"))
end
local function debugMode() return isDebugEnabled and isDebugEnabled() end
local function empty(value) for _ in pairs(value) do return false end; return true end
local function multiplayer() return (isClient and isClient()) or (isServer and isServer()) end
local function checked(ok,why) if not ok then error(tostring(why)) end end
local function boundary(subsystem,fn)
    if Runtime.disabled or (scheduler and scheduler.isDisabled(subsystem)) then return false end
    local ok,result,a,b=pcall(fn)
    if not ok then
        if scheduler then scheduler.failed(subsystem,result) else log("ERROR",subsystem..":"..tostring(result)) end
        return false,result
    end
    return true,result,a,b
end
Runtime.boundary=boundary
local function fault(point)
    if not debugMode() or Runtime.faultPoint~=point then return end
    Runtime.faultPoint=nil; log("FAULT",point); error("one-shot fault:"..point)
end
local function placementJob(id)
    local phase,scanResult,scanFinished,entry,count,countFinished,created
    return function()
        local a=session.assignment(id)
        if a.status=="placed" or a.status=="conflict" or a.status=="unavailable" then return true end
        if not a.target then
            if not phase then
                phase=World.candidateScan(Placement.resolveCandidate(a),function(targets,complete)
                    scanResult=complete and targets or nil; scanFinished=true
                end)
            end
            if not scanFinished then phase(); return false end
            if not scanResult then return true end -- unloaded coverage is never terminal loss
            local target=scanResult[Placement.resolveCandidate(a).containerOrdinal]
            if not target then
                -- A provisional candidate may be wrong. Do not classify that as
                -- destruction or choose a different container opportunistically.
                if not bindingNotices[a.candidateId] then bindingNotices[a.candidateId]=true; log("BINDING_REQUIRED",a.candidateId) end
                return true
            end
            checked(session.bind(id,target)); phase=nil; return false
        end
        local container,reason=World.resolve(a.target)
        if not container then
            -- Destroyed/changed furniture is ambiguous after placement intent;
            -- absence alone must not respawn or trigger fallback.
            checked(session.observe(id,0,a.status=="pending" and reason=="target-changed" and Bindings.accepted)); return true
        end
        if not phase then
            entry=container
            phase=World.count(container,a.physicalToken,function(observed) count=observed; countFinished=true end)
        end
        if not countFinished then phase(); return false end
        if container~=entry or count==nil then return true end
        if count>1 then checked(session.observe(id,count,false)); return true end
        if count==1 then
            fault("before-placed-commit"); checked(session.placed(id,count)); log("PLACED",id..":reconciled"); return true
        end
        if a.status=="placing" and not created then
            -- A persisted intent plus zero at the target is ambiguous across
            -- chunk/GlobalModData persistence. Bias toward loss, never respawn.
            checked(session.observe(id,0,false)); return true
        end
        if a.status=="pending" then
            fault("before-intent"); checked(session.intent(id)); fault("after-intent")
            created=true; return false
        end
        fault("before-add")
        local asset=Content.assets[id]
        local item=instanceItem(id==Content.ids.key and "Base.KeyRing" or "Base.Note")
        assert(item,"item creation failed")
        local md=item:getModData()
        md.cfSchema=2; md.cfAssetId=id; md.cfAssetKind=asset.assetKind; md.cfPhysicalToken=a.physicalToken
        md.cfResolvedTitle=asset.displayName; md.cfResolvedBody=asset.bodyText; md.cfFoundLocationId=a.locationId
        item:setName(asset.displayName); item:setCustomName(true)
        assert(container:AddItem(item),"container add returned nil")
        fault("after-add")
        -- Recount after add before committing placed. A retry only reconciles.
        countFinished=false; count=nil; created=false
        phase=World.count(container,a.physicalToken,function(observed) count=observed; countFinished=true end)
        return false
    end
end
local function enqueuePlacements()
    for _,id in ipairs(assets) do
        local a=session.assignment(id)
        if (not ConspiracyFiles.T11Mode or id==Content.ids.d1) and (a.status=="pending" or a.status=="placing") then scheduler.enqueue("place:"..id,"placement",placementJob(id)) end
    end
end
local function identityJob()
    local results,complete,cursor=nil,false,1
    local step=World.identityScan(getPlayer(),session.snapshot().placement.assignments,function(found) results=found; complete=true end)
    return function()
        if not complete then step(); return false end
        local id=assets[cursor]; if not id then return true end
        cursor=cursor+1
        local a=session.assignment(id)
        if a.status=="placed" or a.status=="conflict" then checked(session.observe(id,#results[id],false)) end
        return false
    end
end
function Runtime.assignment(id) return session and session.assignment(id) end
function Runtime.placementSummary() return session and session.snapshot().placement end
function Runtime.requestAllPlacements() if not Runtime.disabled then enqueuePlacements() end end
function Runtime.allPlacementsSettled()
    if not session then return false end
    for _,id in ipairs(assets) do if session.assignment(id).status~="placed" then return false end end; return true
end
function Runtime.isMarked(id)
    if not Runtime.state then return false end
    for _,e in ipairs(Runtime.state.snapshot().evidence) do if e.assetId==id and e.playerMarkedInteresting then return true end end
    return false
end
function Runtime.inspect(id,context,location)
    if Runtime.disabled or not session then return false,"runtime unavailable" end
    fault("inspect-domain")
    return session.command("discover",id,context,location)
end
function Runtime.mark(id,context,location)
    if Runtime.disabled or not session then return false,"runtime unavailable" end
    local a=session.assignment(id)
    return session.command("markInteresting",a.physicalToken,{assetId=id,contextText=context,foundLocationId=location})
end
function Runtime.markGeneric(intent,label)
    if Runtime.disabled or not session then return false,"runtime unavailable" end
    return session.command("markInteresting",intent,{subjectLabel=label:sub(1,240),contextText="Marked an acquired object as worth remembering: "..label:sub(1,240)})
end
function Runtime.hasMarkIntent(intent)
    if not Runtime.state then return false end
    for _,e in ipairs(Runtime.state.snapshot().evidence) do if e.markIntentId==intent then return true end end
    return false
end
function Runtime.newMarkIntent()
    return "cf-mark:"..tostring(session.snapshot().placement.seed)..":"..tostring(#Runtime.state.snapshot().evidence+1)..":"..tostring(ZombRand(2147483646))
end
function Runtime.confirmDestroyed(id)
    -- Development fault-matrix control only; not an inference from search absence.
    if not debugMode() or Runtime.disabled then return false end
    return session.observe(id,0,true)
end
function Runtime.conflict(id) return session.observe(id,2,false) end
function Runtime.metrics() return scheduler and {peakMs=scheduler.peakMs,maxSteps=scheduler.maxSteps,budgetMs=scheduler.budgetMs} end
local function initialize()
    Runtime.disabled=true; Runtime.state=nil; session=nil
    if multiplayer() then log("DISABLED","multiplayer"); return end
    if ConspiracyFiles.T12Mode then log("DISABLED","T12 synthetic UI only; world adapter inactive"); return end
    if not Bindings.accepted and not debugMode() then log("DISABLED","candidate bindings require debug mode until accepted"); return end
    assert(getTimestampMs,"bounded scheduler requires engine clock")
    scheduler=Scheduler.new(getTimestampMs,function(system,why,disabled) log(disabled and "SUBSYSTEM_DISABLED" or "ERROR",system..":"..why) end)
    sampler=Bindings.newSampler(); ticks=0
    local tag=ConspiracyFiles.T11Mode and "ConspiracyFiles.T11.Session" or "ConspiracyFiles.DeadAir"
    local wrapper=ModData.getOrCreate(tag)
    for key in pairs(wrapper) do assert(key=="canonical","legacy/invalid state: use a fresh disposable save; no migration performed") end
    if not ConspiracyFiles.T11Mode then
        assert(empty(ModData.getOrCreate("ConspiracyFiles.DeadAir.Placement")),"legacy placement data: fresh disposable save required")
    end
    local seed=debugMode() and Placement.DEBUG_SEED or (ZombRand(2147483646)+1)
    local why
    session,why=Session.new(wrapper.canonical,seed,function(staged)
        fault("before-canonical-swap")
        wrapper.canonical=staged -- T4-proven single staged-root assignment; no work after swap
    end)
    assert(session,why)
    Runtime.state=session.view; Runtime.disabled=false
    log("READY","tag="..tag..";build="..tostring(getGameVersion())..";bindings="..tostring(Bindings.accepted))
    enqueuePlacements() -- includes already-loaded targets outside the player's location
end
local function onStart()
    local ok,why=pcall(initialize)
    if not ok then Runtime.disabled=true; log("INIT_REJECTED",why) end
end
local function onTick()
    boundary("scheduler",function()
        ticks=ticks+1
        if ticks%15==0 then
            scheduler.enqueue("arrival","arrival",function()
                local p=getPlayer(); if not p then return true end
                fault("arrival-domain")
                local id=sampler(Runtime.state.snapshot(),{x=math.floor(p:getX()),y=math.floor(p:getY()),z=math.floor(p:getZ())})
                if id then checked(session.command("confirmLocation",id)); log("ARRIVAL",id) end
                return true
            end)
        end
        if ticks%120==0 then
            enqueuePlacements(); scheduler.enqueue("identity","identity",identityJob())
        end
        scheduler.step()
    end)
end
local function onSquare(square)
    boundary("grid",function()
        if not square then return end
        local x,y,z=square:getX(),square:getY(),square:getZ()
        for _,id in ipairs(assets) do
            local a=session.assignment(id); local c=Placement.resolveCandidate(a)
            if (not ConspiracyFiles.T11Mode or id==Content.ids.d1) and z==c.z and math.abs(x-c.x)<=c.radius and math.abs(y-c.y)<=c.radius then
                scheduler.enqueue("place:"..id,"placement",placementJob(id))
            end
        end
    end)
end
Runtime.start=onStart
Events.OnGameStart.Add(onStart); Events.OnTick.Add(onTick); Events.LoadGridsquare.Add(onSquare)
Runtime.scriptLoaded=true
return Runtime
