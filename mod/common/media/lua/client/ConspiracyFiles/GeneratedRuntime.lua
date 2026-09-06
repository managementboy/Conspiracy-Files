-- G2 development adapter: one case, manual start, automatic saved-case resume.
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Storage=require("ConspiracyFiles/Generated/Storage")
local World=require("ConspiracyFiles/WorldAccess")
local Scheduler=require("ConspiracyFiles/Scheduler")
local Budget=require("ConspiracyFiles/SaveBudget")
require("ConspiracyFiles/DiscoveryLog")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.GeneratedRuntime or {}
ConspiracyFiles.GeneratedRuntime=R
if R.loaded then return R end
local sessions,scheduler,wrapper,ticks,preparing
local TAG="ConspiracyFiles.Generated.G2"
local function log(message) print("[CF-G2] "..tostring(message)) end
local function allowed()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function checked(ok,why) if not ok then error(why or "generated session write rejected") end end
local function setup()
    if not allowed() then return false,"G2 requires debug single-player, without T11/T12" end
    ConspiracyFiles.GeneratedMode=true
    if ConspiracyFiles.Runtime then ConspiracyFiles.Runtime.disabled=true end
    local store=ModData.getOrCreate(TAG)
    local active,err=Cases.current(store)
    -- Kahlua exposes pairs, but not the standard Lua next global.
    if not active then
        for _ in pairs(store) do return false,err end
    end
    wrapper=active or {}
    scheduler=Scheduler.new(getTimeInMillis,function(system,why) if system=="preparation" then preparing=false end;log(system..": "..why) end)
    scheduler.maxSteps=24; scheduler.budgetMs=1
    ticks=0; return true
end
local function placement(api,id)
    local scan,count,finished,container,created
    return function()
        local a=api.assignment(id)
        if a.status=="placed" or a.status=="conflict" or a.status=="unknown" then return true end
        local current=World.resolve(a.target)
        if not current then return true end
        if not scan then
            container=current
            scan=World.count(current,a.physicalToken,function(n) count=n; finished=true end)
        end
        if not finished then scan(); return false end
        if current~=container or count==nil then return true end
        if count>1 then checked(api.status(id,"conflict")); return true end
        if count==1 then checked(api.status(id,"placed")); log("Document placed or reconciled."); return true end
        if a.status=="placing" and not created then
            checked(api.status(id,"unknown")); log("Interrupted placement is uncertain; no automatic replacement."); return true
        end
        if a.status=="pending" then checked(api.status(id,"placing")); created=true; return false end
        local doc
        for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then doc=d end end
        local carrier=assert(require("ConspiracyFiles/Generated/EvidenceKinds").get(doc.kind))
        local item=assert(instanceItem(carrier.fullType),"could not create evidence item")
        local md=item:getModData()
        md.cfGeneratedId=id; md.cfPhysicalToken=a.physicalToken
        item:setName(doc.title); item:setCustomName(true)
        assert(current:AddItem(item),"could not add note")
        created=false; finished=false
        scan=World.count(current,a.physicalToken,function(n) count=n; finished=true end)
        return false
    end
end
local function enqueue()
    if not sessions then return end
    for index,api in ipairs(sessions) do for _,d in ipairs(api.snapshot().case.documents) do
        scheduler.enqueue("place:"..d.id,"placement",placement(api,d.id))
    end
    end
end
local function copyValue(v)
    if type(v)~="table" then return v end
    local out={};for k,value in pairs(v) do out[k]=copyValue(value) end;return out
end
local function swap(next)
    -- Keep fallback and active payload independent; validator forbids shared aliases.
    next=copyValue(next)
    checked(Cases.validate(next)); checked(Budget.check("generatedCampaign",next))
    local store=ModData.getOrCreate(TAG); store.campaign=next; wrapper=next
end
local function openAll()
    -- Replacing the session set invalidates queued closures over old APIs.
    scheduler=Scheduler.new(getTimeInMillis,function(system,why) if system=="preparation" then preparing=false end;log(system..": "..why) end);scheduler.maxSteps=24;scheduler.budgetMs=1
    sessions={}
    for index,root in ipairs(Cases.sessions(wrapper)) do
        sessions[index]=assert(Session.open(root,function(staged) swap(assert(Cases.replace(wrapper,index,staged))) end))
    end
    enqueue(); log("Generated case active. Take an evidence item, then right-click Inspect Investigation Evidence.")
end
local function worldHours()
    local n=getGameTime():getWorldAgeHours()
    assert(type(n)=="number" and n==n and n>=0 and n<math.huge,"invalid world clock")
    return n
end
local function currentHouse()
    local p=getPlayer();local square=p and p:getSquare();local building=square and square:getBuilding()
    local def=building and building:getDef()
    return def and ("t3:"..tostring(def:getIDString())) or nil
end
local function firstCase(catalog,seed,options,context,house,candidates)
    local Catalog=require("ConspiracyFiles/Generated/Catalog")
    local Reach=require("ConspiracyFiles/Reach")
    local eligible,why=Catalog.eligible(catalog,options.mapId,options.buildLine,false)
    if not eligible then return nil,why end
    local radius=Reach.radius(context.hoursSurvived);if not radius then return nil,"invalid survival reach" end
    local intro,partners
    partners={}
    for _,site in ipairs(eligible) do if site.id==house and Reach.contains(site.bounds,context.anchor,radius) then intro=site end end
    if not intro then return nil,"current house needs suitable loaded storage" end
    for _,site in ipairs(eligible) do
        if Catalog.distinct(intro,site) and Reach.contains(site.bounds,context.anchor,radius) then partners[#partners+1]=site end
    end
    if #partners==0 then return nil,"no second loaded site within reach" end
    table.sort(partners,function(a,b) return a.id<b.id end)
    -- Before commitment, try each deterministic partner once.  Capacity follows
    -- the selected story roles, not the former 3/4 building split.
    for offset=0,#partners-1 do
        local partner=partners[(seed+offset)%#partners+1]
        local case=G.generateSelected(catalog,seed,options,{intro.id,partner.id})
        local required=case and G.requiredContainers(case)
        if required and #candidates[intro.id]>=required[intro.id] and #candidates[partner.id]>=required[partner.id] then return case end
    end
    return nil,"first house and partner lack containers for this generated evidence set"
end
local function prepare(result,seed,later,house)
    local scan,why=Storage.scan(result,function(catalog,targets,candidates)
        local p=getPlayer()
        local used={}; for _,root in ipairs(Cases.sessions(wrapper) or {}) do for _,site in ipairs(root.case.locations) do used[site.id]=true end end
        local filtered={revision=catalog.revision,locations={}}
        for _,site in ipairs(catalog.locations) do
            local available=candidates and candidates[site.id] or {}
            if not used[site.id] and #available>=1 then filtered.locations[#filtered.locations+1]=site end
        end
        local anchor=later and {x=math.floor(p:getX()),y=math.floor(p:getY())} or result.anchor
        preparing=false
        if house and currentHouse()~=house then log("First case deferred: player changed building.");return end
        local options={mapId=result.map,buildLine=result.gameVersion}
        local context={hoursSurvived=p:getHoursSurvived(),anchor=anchor}
        local case,err
        if house then case,err=firstCase(filtered,seed,options,context,house,candidates)
        else case,err=G.generateNew(filtered,seed,options,context) end
        if not case then log(later and "Deferred: insufficient distinct loaded storage nearby." or "Waiting for suitable loaded storage: "..tostring(err)); return end
        local required=assert(G.requiredContainers(case))
        for siteId,count in pairs(required) do
            if not candidates[siteId] or #candidates[siteId]<count then
                log("Deferred: selected evidence needs "..count.." distinct containers at "..siteId..".")
                return
            end
        end
        for _,site in ipairs(case.locations) do
            if not World.resolve(targets[site.id]) then log("Storage changed before commit; retry start."); return end
        end
        local root=assert(Session.createDistributed(case,candidates))
        for _,assignment in pairs(root.assignments) do
            if not World.resolve(assignment.target) then log("Distributed storage changed before commit; retry later.");return end
        end
        -- Validate once more before the single authoritative swap.
        checked(Session.validate(root))
        if later then swap(assert(Cases.stage(wrapper,root,wrapper.schedule and worldHours() or nil)))
        elseif house then swap({canonical=root,schedule={schema=1,createdHours={worldHours()}}})
        else swap({canonical=root}) end
        openAll()
        local first=case.documents[1]; local t=targets[first.locationId]
        log("DEV first clue container: "..t.x..", "..t.y..", floor "..t.z..". No discoveries granted.")
    end)
    if not scan then preparing=false; log(why); return end
    scheduler.enqueue("storage","preparation",scan)
end
function R.start(seed,options)
    require("ConspiracyFiles/GeneratedMenu")
    require("ConspiracyFiles/ClueHints")
    if preparing then return false,"preparation already running" end
    local house
    local saved=ModData.get(TAG)
    if options and options.firstHouse and not (saved and (saved.canonical or saved.campaign)) then
        house=currentHouse();if not house then return false,"waiting until player is inside a building" end
    end
    seed=seed or (ZombRand(2147483646)+1)
    if type(seed)~="number" or seed~=math.floor(seed) or seed<1 or seed>=2147483647 then return false,"invalid seed" end
    local ok,why=setup(); if not ok then return false,why end
    if wrapper.canonical then openAll(); return true end
    local probe=require("ConspiracyFiles/T3Nearby")
    ok,why=probe.start(nil,seed,house and house:sub(4)); if not ok then return false,why end
    preparing=true
    local waited=0
    scheduler.enqueue("metadata","preparation",function()
        waited=waited+1
        if probe.error then preparing=false;error(probe.error) end
        if probe.result then prepare(probe.result,seed,false,house); return true end
        if waited>240000 then preparing=false; error("metadata extraction did not complete") end
        return false
    end)
    return true
end
function R.known()
    if not wrapper or not sessions then return {} end
    local byId={}; for _,api in ipairs(sessions) do for _,row in ipairs(api.project()) do byId[row.id]=row end end
    local rows={}; for _,id in ipairs(Cases.discoveries(wrapper)) do if byId[id] then rows[#rows+1]=byId[id] end end; return rows
end
function R.nextCase(seed)
    if preparing then return false,"preparation already running" end
    if not wrapper or not wrapper.canonical then return false,"start the first generated case before requesting another" end
    if type(seed)~="number" or seed~=math.floor(seed) or seed<1 or seed>=2147483647 then return false,"invalid seed" end
    if not allowed() then return false,"debug single-player required" end
    if #Cases.sessions(wrapper)>=Cases.MAX_CASES then return false,"development case limit reached" end
    for _,api in ipairs(sessions or {}) do
        for _,a in pairs(api.snapshot().assignments) do
            if a.status=="pending" or a.status=="placing" then return false,"wait for current placement to finish" end
        end
    end
    local probe=require("ConspiracyFiles/T3Nearby");local ok,why; ok,why=probe.start(nil,seed); if not ok then return false,why end
    preparing=true; local waited=0; scheduler.enqueue("next-metadata","preparation",function() waited=waited+1;if probe.error then preparing=false;error(probe.error) end;if probe.result then prepare(probe.result,seed,true);return true end;if waited>240000 then preparing=false;error("metadata extraction did not complete") end;return false end)
    return true
end
function R.inspect(item)
    if not allowed() or not sessions or not item or item:getOutermostContainer()~=getPlayer():getInventory() then return false end
    local md=item:getModData(); local root=md and Cases.find(wrapper,md.cfGeneratedId); local api
    if root then for _,candidate in ipairs(sessions) do if candidate.snapshot().case.caseId==root.case.caseId then api=candidate end end end
    local a=api and api.assignment(md.cfGeneratedId)
    if not a or md.cfPhysicalToken~=a.physicalToken or a.status=="conflict" then return false end
    -- A positively observed surviving item can reconcile an uncertain intent.
    checked(api.status(md.cfGeneratedId,"placed")); checked(api.inspect(md.cfGeneratedId))
    local log=ConspiracyFiles.DiscoveryLog
    if log and log.record then log.record("evidence",md.cfGeneratedId) end
    return true
end
function R.subject(item)
    if not sessions or not item then return false end
    local md=item:getModData(); local root=md and Cases.find(wrapper,md.cfGeneratedId); local a=root and root.assignments[md.cfGeneratedId]
    return a and md.cfPhysicalToken==a.physicalToken and a.status~="conflict"
end
function R.metrics() return scheduler and {peakMs=scheduler.peakMs} end
function R.automaticStatus()
    local roots=wrapper and Cases.sessions(wrapper) or {}
    local schedule=wrapper and wrapper.schedule
    return {count=#roots,preparing=preparing==true,scheduled=schedule~=nil,
        lastCreatedHours=schedule and schedule.createdHours[#schedule.createdHours],limit=Cases.MAX_CASES}
end
local function identity(api)
    local found,done
    local snapshot=api.snapshot()
    local scan=World.identityScan(getPlayer(),snapshot.assignments,function(r) found=r; done=true end)
    return function()
        if not done then scan(); return false end
        for id,items in pairs(found) do
            if #items>1 then checked(api.status(id,"conflict"))
            elseif #items==1 and api.assignment(id).status~="conflict" then checked(api.status(id,"placed")) end
        end
        return true
    end
end
Events.OnTick.Add(function()
    if not scheduler or not allowed() then return end
    ticks=ticks+1
    if sessions and ticks%120==0 then
        enqueue(); for i,api in ipairs(sessions) do scheduler.enqueue("identity:"..i,"identity",identity(api)) end
    end
    scheduler.step()
end)
Events.OnGameStart.Add(function()
    sessions,scheduler,preparing,wrapper=nil,nil,false,nil
    if not allowed() then return end
    local saved=ModData.getOrCreate(TAG)
    if saved.canonical or saved.campaign then
        local ok,why=pcall(function() checked(setup()); wrapper=assert(Cases.current(saved)); openAll() end)
        if not ok then scheduler=nil; log("Saved case refused: "..tostring(why)) end
    end
end)
R.loaded=true
return R
