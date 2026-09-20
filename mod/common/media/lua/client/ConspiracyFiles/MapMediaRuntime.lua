-- Printed-media integration. Fresh-save, single-player; ordinary Lua ModData.
local State=require("ConspiracyFiles/MapMediaState")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Content=require("ConspiracyFiles/MapMediaContent")
local Budget=require("ConspiracyFiles/SaveBudget")
local World=require("ConspiracyFiles/WorldAccess")
local Scheduler=require("ConspiracyFiles/Scheduler")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.MapMediaRuntime or {}
ConspiracyFiles.MapMediaRuntime=R
local TAG="ConspiracyFiles.MapMedia"
local state,scheduler,ready,scan,metadata
local destinations,byBuilding,targets={},{},{}
local ticks,designCursor,entryCursor=0,0,0
local priority,prioritySet={},{}
local function allowed() return not (isClient and isClient()) and not (isServer and isServer()) end
local function log(why) CFLog.message("mapmedia","note",tostring(why)) end
local faultPoint
function R.injectFault(point)
    if not (getDebug and getDebug()) or not allowed() then return false end
    local points={beforeInsert=true,afterInsert=true,beforeCommit=true,afterCommit=true}
    if point~=nil and not points[point] then return false end
    faultPoint=point; return true
end
local function fault(point)
    if faultPoint==point and getDebug and getDebug() then
        faultPoint=nil; error("map placement injected interruption: "..point)
    end
end
local function hours() return getGameTime():getWorldAgeHours() end
local function clock() return getTimestampMs and getTimestampMs() or getTimeInMillis() end
local function root()
    if state then return state end
    local store=ModData.get(TAG)
    local candidate=store and store.canonical or State.empty()
    local ok,why=State.validate(candidate,Catalogue)
    if not ok then error(why) end -- Never replace corrupt current-build state.
    state=candidate; return state
end
function R.invalidate() state=nil end
local function save(next)
    local started=clock()
    local ok,why=State.validate(next,Catalogue)
    if ok then ok,why=Budget.check("mapMedia",{canonical=next}) end
    if not ok then R.lastRefusal=why; log(why); return false end
    ModData.getOrCreate(TAG).canonical=next; state=next
    R.peakWriteMs=math.max(R.peakWriteMs or 0,clock()-started)
    return true
end
local function defOf(square)
    local b=square and square:getBuilding(); return b and b:getDef()
end
local function buildingId(square)
    local def=defOf(square); return def and tostring(def:getIDString())
end
local function atDestination(id,building)
    return destinations[id] and destinations[id][building]==true
end
local function matches(def,p)
    return p.x>=def:getX() and p.x<def:getX2() and p.y>=def:getY() and p.y<def:getY2()
end
-- Metadata only; no loading, entering, stash preparation, or visit fiction.
local function indexStep()
    if metadata.index>=metadata.buildings:size() then metadata=nil; R.indexed=true; return true end
    local def=metadata.buildings:get(metadata.index); metadata.index=metadata.index+1
    local bid=tostring(def:getIDString())
    for _,id in ipairs(Catalogue.list) do
        for _,point in ipairs(Catalogue.get(id).targets) do
            if matches(def,point) then
                destinations[id]=destinations[id] or {}; destinations[id][bid]=true
                byBuilding[bid]=byBuilding[bid] or {}; byBuilding[bid][id]=true
            end
        end
    end
    return false
end
function R.read(id,item)
    if not allowed() or not Catalogue.get(id) then return false end
    -- Never issue a lead toward a place that does not exist. Eleven of the 125
    -- designs resolve to no building at all (coverage check, 2026-09-20): nine
    -- are countryside stashes - a fuel stop, a railyard - which are not
    -- buildings, and one is not a place at all, its annotation being a pair of
    -- lap times. Reading one used to start a trail regardless, inviting the
    -- survivor to travel somewhere no evidence could ever be waiting.
    --
    -- Only refuse when we KNOW. Before indexing finishes, no destination means
    -- not looked yet, and the whole subsystem turns on absence never being
    -- inferred from incomplete coverage.
    if R.indexed and not destinations[id] then
        log("no destination building for "..tostring(id).."; no trail started")
        return false
    end
    local next,changed=State.activate(root(),id,ZombRand(2147483646)+1,hours(),Catalogue)
    if not changed then return true end
    if not save(next) then return false end
    if not prioritySet[id] then priority[#priority+1]=id; prioritySet[id]=true end
    if item then item:getModData().cfMapDesign=id end
    return true
end
function R.printRead(id)
    if not allowed() or not Catalogue.print(id) then return false end
    local next,changed=State.printRead(root(),id,hours())
    if changed and not save(next) then return false end
    local screen=ConspiracyFiles.OrganiserScreen
    if screen and screen.window then screen.window.cachedList=nil end
    return true
end
local function itemIdentity(item)
    if not item then return nil end
    local md=item:getModData(); local id,part=md.cfMapDesign,md.cfMapPart
    local t=id and root().trails[id]
    if t and type(part)=="number" and part%1==0 and part>=1 and part<=4
        and md.cfMapSeed==t.seed and type(md.cfMapAttempt)=="number" and md.cfMapAttempt>=1 then return id,part end
end
local function parse(subject)
    if type(subject)=="string" then
        local id,part=subject:match("^map:([^:]+):([1-4])$")
        if id and root().trails[id] then return id,tonumber(part) end
    elseif subject then return itemIdentity(subject) end
end
function R.subject(item)
    if not allowed() or not ready then return false end
    local ok,id=pcall(parse,item); return ok and id~=nil
end
-- Bounded search; a truncated carrier is UNKNOWN, never absent.
local function findItem(container,id,part,attempt)
    local pending,count={{container=container,depth=0}},0
    while #pending>0 do
        local node=table.remove(pending); local items=node.container:getItems()
        for i=0,items:size()-1 do
            count=count+1; if count>512 then return nil,"unknown" end
            local item=items:get(i); local md=item:getModData()
            if md.cfMapDesign==id and md.cfMapPart==part and md.cfMapSeed==root().trails[id].seed
                and (attempt==nil or md.cfMapAttempt==attempt) then return item,"present" end
            if instanceof(item,"InventoryContainer") then
                if node.depth>=4 then return nil,"unknown" end
                pending[#pending+1]={container=item:getInventory(),depth=node.depth+1}
            end
        end
    end
    return nil,"absent"
end
local function resolve(p)
    local container,why=World.resolve(p.target)
    if not container then return nil,why end
    return container
end
local function doc(id,part,observation)
    return Content.render(Catalogue.get(id),root().trails[id].seed,part,observation)
end
local function stamp(item,id,part,observation)
    local d=doc(id,part,observation)
    item:setName(d.title); item:setCustomName(true); item:setDisplayCategory("Evidence")
    if item.addPage then
        local pages=Pages.pages(d.body)
        item:setNumberOfPages(math.max(1,#pages))
        for i,text in ipairs(pages) do item:addPage(i,text) end
    end
end
local function actualItem(subject,id,part,p)
    if type(subject)~="string" then return subject end
    if not p or not p.target then return nil end
    local container=resolve(p)
    if container then return findItem(container,id,part,p.attempt) end
end
function R.isRecognised(subject)
    local id,part=parse(subject); local p=id and State.get(root(),id,part)
    return p and p.recognised==true or false
end
function R.recognise(subject,source)
    if not allowed() then return false end
    local id,part=parse(subject); local p=id and State.get(root(),id,part)
    if not p then return false,"unknown contribution" end
    local item=actualItem(subject,id,part,p); if not item then return false,"item not observable" end
    if not p.recognised then
        local next=State.copy(p); next.recognised=true
        if next.state=="intent" or next.state=="unknown" then next.state="placed" end
        if not save(State.set(root(),id,part,next)) then return false end
    end
    targets[State.reference(id,part)]=nil
    stamp(item,id,part,p.observation); return true
end
local function observation(binding,player,part)
    local descriptor=player:getDescriptor()
    local job=descriptor and descriptor:getCharacterProfession()
    local profession=job and tostring(job:getName()) or ""
    local skills={}
    for _,name in ipairs({"Doctor","Electricity","Mechanics","Woodwork","MetalWelding","PlantScavenging"}) do
        if Perks[name] then skills[name]=player:getPerkLevel(Perks[name]) end
    end
    return Content.observation(binding,profession,skills,root().trails[binding.id].seed,part)
end
function R.inspect(subject,inPlace)
    if not allowed() then return false end
    local id,part=parse(subject); local p=id and State.get(root(),id,part)
    if not p or not p.recognised then return false,"not recognised" end
    if p.noted then return true end
    local item=actualItem(subject,id,part,p); if not item then return false,"not observable" end
    local player=getPlayer()
    if not inPlace and item:getOutermostContainer()~=player:getInventory() then return false,"not carried" end
    local next=State.copy(p); next.noted=true; next.recognised=true; next.state="noted"
    next.observation=observation(Catalogue.get(id),player,part)
    -- Found location is preserved in the shared ledger. An obsolete placement
    -- locator is no longer authoritative once the survivor has noted/moved it.
    next.target=nil
    local replacement=State.set(root(),id,part,next)
    local D=require("ConspiracyFiles/DiscoveryLog")
    if not D.record("evidence",State.reference(id,part),replacement) then return false,"discovery commit refused" end
    state=replacement; targets[State.reference(id,part)]=nil
    stamp(item,id,part,next.observation); return true
end
function R.rows()
    if not ready or not allowed() then return {} end
    local out={}
    for _,id in ipairs(Catalogue.list) do
        local t=root().trails[id]
        if t then
            local known={}
            for source=1,4 do local p=State.get(root(),id,source);known[source]=p and p.noted==true end
            for part=1,4 do
            local p=State.get(root(),id,part)
            if p and p.noted then
                local d=doc(id,part,p.observation); local detail=d.body
                for _,finding in ipairs(Content.findings(Catalogue.get(id),t.seed,part,known)) do
                    detail=detail.."\n\nALONGSIDE THE OTHER RECORDS\n"..finding
                end
                local source=Catalogue.get(id).sourceText
                if source and source~="" then detail=detail.."\n\nMAP NOTE\nThe handwritten map reads:\n"..source end
                for _,printId in ipairs(Catalogue.get(id).printIds or {}) do
                    if root().prints[printId] then
                        local advert=Catalogue.print(printId)
                        detail=detail.."\n\nPLACE IDENTIFICATION\n"..advert.title.."\n"..advert.text
                    end
                end
                out[#out+1]={id=State.reference(id,part),title=d.title,detailText=detail,
                    cfCarrier="Evidence",summary="Evidence",cfMapMedia=true}
            end
        end end
    end
    return out
end
function R.clueTargets()
    local out={}; if not ready or not allowed() then return out end
    local player=getPlayer(); if not player then return out end
    for ref,t in pairs(targets) do
        if math.abs(player:getX()-t.x)<40 and math.abs(player:getY()-t.y)<40 then out[#out+1]=t end
    end
    return out
end
local function rememberTarget(id,part,p,item)
    local ref=State.reference(id,part)
    if item and not p.recognised and p.target then
        targets[ref]={id=ref,x=p.target.x,y=p.target.y,z=p.target.z,status="placed",recognised=false}
    else targets[ref]=nil end
end
-- Persist intent BEFORE insertion. Stamp identity BEFORE AddItem. An exception
-- after AddItem may mean it succeeded; reconciliation must observe the token.
local function place(id,part,target,container)
    local previous=State.get(root(),id,part)
    if previous and part==4 and previous.state~="refused" then return false end
    local attempt=previous and previous.attempt+1 or 1
    local p={target=target,state="intent",attempt=attempt,at=hours()}
    fault("beforeInsert")
    if not save(State.set(root(),id,part,p)) then return false end
    local d=doc(id,part); local kind=assert(Kinds.get(d.kind))
    local item=instanceItem(kind.fullType)
    if not item then
        p.state="refused"; save(State.set(root(),id,part,p)); return false
    end
    local md=item:getModData()
    md.cfMapDesign=id; md.cfMapPart=part; md.cfMapSeed=root().trails[id].seed; md.cfMapAttempt=attempt
    -- This token is an intention receipt, not a claim that insertion succeeded.
    local token=State.token(id,part,attempt); md.cfMapToken=token
    local ok,result=pcall(function() return container:AddItem(item) end)
    fault("afterInsert")
    local found,verdict=findItem(container,id,part,attempt)
    p.state=found and "placed" or (ok and result==nil and verdict=="absent" and "refused" or "unknown")
    local next=State.set(root(),id,part,p); next.cursor=designCursor
    fault("beforeCommit")
    if save(next) then rememberTarget(id,part,p,found) end
    fault("afterCommit")
    return found~=nil
end
local function reconcile(id,part,p)
    if not p.target or p.state=="noted" or p.state=="refused" then return end
    local player=getPlayer()
    if math.abs(player:getX()-p.target.x)>40 or math.abs(player:getY()-p.target.y)>40 then
        targets[State.reference(id,part)]=nil; return
    end
    local container=resolve(p)
    if not container then targets[State.reference(id,part)]=nil; return end
    local item=findItem(container,id,part,p.attempt)
    if item and (p.state=="intent" or p.state=="unknown") then
        local next=State.copy(p); next.state="placed"
        if save(State.set(root(),id,part,next)) then p=next end
    end
    -- Observable absence after an attempted insertion may be collection or
    -- destruction. Hold uncertain; never repair it by creating another payoff.
    rememberTarget(id,part,p,item)
    if item and p.recognised then stamp(item,id,part,p.observation) end
end
local function candidate(square,object,index,ci,container,binding,part,filled)
    local bid=buildingId(square); if not bid then return nil end
    local room=square:getRoom(); local roomName=room and room:getName() or ""
    local kind=container:getType()
    local containers=part==4 and binding.destinationContainers or binding.localContainers
    if not containers[kind] then return nil end
    if part~=4 and not binding.localRooms[roomName] then return nil end
    -- Never force loot exploration, clear containers or invoke stash setup.
    -- Wait for vanilla to finish filling this carrier before adding our item.
    if not filled and not container:isExplored() then return nil end
    local sprite=object:getSprite(); local name=sprite and sprite:getName()
    if not name then return nil end
    return {x=square:getX(),y=square:getY(),z=square:getZ(),objectIndex=index,
        containerIndex=ci,sprite=name,containerType=kind}
end
-- Native loot completion and the loot-window's pre-display boundary supplement
-- the background scan. They never mark a visit or force generation/exploration.
function R.offerContainer(container,filled)
    if not ready or not allowed() or not container then return false end
    local object=container:getParent(); local square=object and object:getSquare()
    local def=defOf(square); if not def then return false end
    local objects=square:getObjects(); local oi,ci
    for i=0,math.min(256,objects:size())-1 do if objects:get(i)==object then oi=i; break end end
    if not oi then return false end
    for i=0,math.min(32,object:getContainerCount())-1 do if object:getContainerByIndex(i)==container then ci=i; break end end
    if not ci then return false end
    local placed=false
    for _,id in ipairs(Catalogue.list) do
        local binding=Catalogue.get(id); local t=root().trails[id]
        local p=t and State.get(root(),id,4)
        if t and (not p or p.state=="refused") then
            local match=false
            for _,point in ipairs(binding.targets) do if matches(def,point) then match=true; break end end
            if match then
                local target=candidate(square,object,oi,ci,container,binding,4,filled)
                if target and not (p and p.target.x==target.x and p.target.y==target.y
                    and p.target.z==target.z and p.target.objectIndex==oi and p.target.containerIndex==ci) then
                    placed=place(id,4,target,container) or placed
                end
            end
        end
    end
    return placed
end
local function prioritize(id)
    if root().trails[id] and not prioritySet[id] then
        priority[#priority+1]=id; prioritySet[id]=true
    end
end
-- One square/object/container per scheduler step. The scan moves with the
-- survivor between sweeps; round-robin design choice prevents starvation.
local function scanStep()
    local player=getPlayer(); if not player then scan=nil; return true end
    if not scan then
        designCursor=designCursor%#Catalogue.list+1
        local id=table.remove(priority,1) or Catalogue.list[designCursor]
        prioritySet[id]=nil
        if not root().trails[id] then return true end
        scan={id=id,x=math.floor(player:getX()),y=math.floor(player:getY()),z=math.floor(player:getZ()),offset=0}
    end
    local s=scan; local binding=Catalogue.get(s.id)
    if math.abs(player:getX()-s.x)>24 or math.abs(player:getY()-s.y)>24 or player:getZ()~=s.z then scan=nil; return true end
    if s.container then
        local ci=s.containerIndex; s.containerIndex=ci+1
        if ci>=math.min(32,s.object:getContainerCount()) then s.container=nil; return false end
        local container=s.object:getContainerByIndex(ci)
        if not container then return false end
        local bid=buildingId(s.square); local part
        if bid and atDestination(s.id,bid) then
            local payoff=State.get(root(),s.id,4)
            if not payoff or payoff.state=="refused" then part=4 end
        else
            part=State.nextFragment(root(),s.id,s.x,s.y,hours())
            -- A read at the destination cannot scatter its local fragments in it.
        end
        if not part then return false end
        local target=candidate(s.square,s.object,s.objectIndex-1,ci,container,binding,part)
        if target then
            local previous=State.get(root(),s.id,part)
            if previous and previous.state=="refused" and previous.target.x==target.x
                and previous.target.y==target.y and previous.target.z==target.z
                and previous.target.objectIndex==target.objectIndex
                and previous.target.containerIndex==target.containerIndex then return false end
            local here=getCell():getGridSquare(s.x,s.y,s.z)
            -- Local discoveries should be on the same journey, not a remote
            -- adjacent building the survivor has not entered or searched yet.
            if part==4 or not atDestination(s.id,buildingId(here)) then
                place(s.id,part,target,container); scan=nil; return true
            end
        end
        return false
    end
    if s.square then
        local objects=s.square:getObjects(); local i=s.objectIndex
        if i>=math.min(256,objects:size()) then s.square=nil; return false end
        s.objectIndex=i+1; s.object=objects:get(i)
        s.container=true; s.containerIndex=0; return false
    end
    if s.offset>=49*49 then
        if root().cursor~=designCursor then local next=State.copy(root()); next.cursor=designCursor; save(next) end
        scan=nil; return true
    end
    local dx=s.offset%49-24; local dy=math.floor(s.offset/49)-24; s.offset=s.offset+1
    s.square=getCell():getGridSquare(s.x+dx,s.y+dy,s.z); s.objectIndex=0
    return false
end
local function visitStep()
    local player=getPlayer(); local square=player and player:getSquare()
    local bid=buildingId(square)
    if not bid then R.entryCandidate=nil; return end
    if R.entryCandidate~=bid then
        R.entryCandidate=bid
        local def=defOf(square)
        -- Preserve real entries even while the initial metadata pass is running.
        for _,id in ipairs(Catalogue.list) do
            for _,point in ipairs(Catalogue.get(id).targets) do
                if matches(def,point) then
                    destinations[id]=destinations[id] or {}; destinations[id][bid]=true
                    byBuilding[bid]=byBuilding[bid] or {}; byBuilding[bid][id]=true
                    prioritize(id)
                end
            end
        end
        return
    end
    local changes
    for id in pairs(byBuilding[bid] or {}) do
        if root().entries[id]==nil then changes=State.enter(changes or root(),id,hours()) end
    end
    if changes then save(changes) end
end
function R.start()
    if not allowed() then return false end
    state=nil; root(); destinations,byBuilding,targets={},{},{}
    require("ConspiracyFiles/GeneratedMenu")
    require("ConspiracyFiles/ClueSearch")
    ticks,designCursor,entryCursor=0,root().cursor,0; priority,prioritySet={},{}
    scan=nil; faultPoint=nil; R.indexed=false; R.entryCandidate=nil
    scheduler=Scheduler.new(clock,function(_,why) log(why) end)
    scheduler.maxSteps=16; scheduler.budgetMs=2
    metadata={buildings=getWorld():getMetaGrid():getBuildings(),index=0}
    scheduler.enqueue("metadata","map-metadata",indexStep)
    local hooks=require("ConspiracyFiles/MapMediaRead")
    local ok,why=hooks.start(R.read,R.printRead)
    if not ok then error(why) end
    ready=true; return true
end
function R.tick()
    if not ready or not allowed() then return end
    ticks=ticks+1
    if ticks%15==0 then visitStep() end
    if R.indexed then
        if not scheduler.has("map-placement") then scheduler.enqueue("scan","map-placement",scanStep) end
        if not scheduler.has("map-reconcile") then
            entryCursor=entryCursor%(#Catalogue.list*4)+1
            local id=Catalogue.list[math.floor((entryCursor-1)/4)+1]; local part=(entryCursor-1)%4+1
            local p=State.get(root(),id,part)
            if p then scheduler.enqueue("reconcile","map-reconcile",function() reconcile(id,part,p); return true end) end
        end
    end
    scheduler.step()
end
-- Diagnostics deliberately expose hidden state only through explicit debug use.
function R.status()
    if not (getDebug and getDebug()) then return nil end
    return {ready=ready,indexed=R.indexed,peakMs=scheduler and scheduler.peakMs,peakWriteMs=R.peakWriteMs,
        state=State.copy(root()),refusal=R.lastRefusal}
end
function R.coverage(id)
    if not (getDebug and getDebug()) then return nil end
    local binding=Catalogue.get(id); if not binding then return nil end
    local count=0; for _ in pairs(destinations[id] or {}) do count=count+1 end
    return {design=id,buildings=count,source=binding.anchorSource,related=binding.relatedDestination,
        active=root().trails[id]~=nil,entered=root().entries[id]~=nil}
end
if Events and not R.hooked then
    R.hooked=true
    Events.OnGameStart.Add(function() local ok,why=pcall(R.start); if not ok then ready=false; log(why) end end)
    Events.OnTick.Add(function() local ok,why=pcall(R.tick); if not ok then ready=false; log(why) end end)
    if Events.OnFillContainer then Events.OnFillContainer.Add(function(_,_,container)
        local ok,why=pcall(R.offerContainer,container,true); if not ok then log(why) end
    end) end
    if Events.OnRefreshInventoryWindowContainers then Events.OnRefreshInventoryWindowContainers.Add(function(page,phase)
        if phase~="beforeFloor" or not ready then return end
        for i,button in ipairs(page.backpacks or {}) do
            if i>32 then break end
            local ok,why=pcall(R.offerContainer,button.inventory,false); if not ok then log(why) end
        end
    end) end
end
return R
