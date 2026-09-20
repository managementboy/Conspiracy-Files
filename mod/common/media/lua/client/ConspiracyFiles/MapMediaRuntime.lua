-- Printed-media integration. Fresh-save, single-player; ordinary Lua ModData.
local State=require("ConspiracyFiles/MapMediaState")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
local Destinations=require("ConspiracyFiles/MapMediaDestinations")
local Content=require("ConspiracyFiles/MapMediaContent")
local Budget=require("ConspiracyFiles/SaveBudget")
local World=require("ConspiracyFiles/WorldAccess")
local Scheduler=require("ConspiracyFiles/Scheduler")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local Choices=require("ConspiracyFiles/Generated/StorageChoices")
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.MapMediaRuntime or {}
ConspiracyFiles.MapMediaRuntime=R
local TAG="ConspiracyFiles.MapMedia"
local state,scheduler,ready,scan,metadata
local destinations,targets={},{}
local ticks,designCursor,entryCursor=0,0,0
local priority,prioritySet,offers={},{},{}
local function allowed() return not (isClient and isClient()) and not (isServer and isServer()) end
local function log(why) CFLog.message("mapmedia","note",tostring(why)) end
local faultPoint,lastFault
function R.injectFault(point,id,part)
    if not (getDebug and getDebug()) or not allowed() then return false end
    local points={beforeInsert=true,afterInsert=true,beforeCommit=true,afterCommit=true}
    if point~=nil and not points[point] then return false end
    if id~=nil and not Catalogue.get(id) then return false end
    if part~=nil and (type(part)~="number" or part%1~=0 or part<1 or part>4) then return false end
    faultPoint=point and {point=point,id=id,part=part} or nil
    if point then lastFault=nil end
    return true
end
local function fault(point,id,part)
    local f=faultPoint
    if f and f.point==point and (not f.id or f.id==id) and (not f.part or f.part==part)
        and getDebug and getDebug() then
        local recorded=state and State.get(state,id,part)
        lastFault={point=point,id=id,part=part,recorded=recorded and recorded.state or "none"}
        faultPoint=nil
        error("map placement injected interruption: "..point.." "..id.." part "..part)
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
local function atDestination(id,square)
    if not square then return false end
    local binding=Catalogue.get(id)
    if binding.areas then return Destinations.contains(binding,square:getX(),square:getY()) end
    local bid=buildingId(square)
    if not bid then return false end
    -- A loaded target's actual building resolves overlapping metadata bounds.
    -- Where no target floor is observable, keep the indexed source candidates;
    -- coverage reports their multiplicity for native review.
    local resolved,match=false,false
    for _,point in ipairs(binding.targets) do
        local anchor=getCell():getGridSquare(point.x,point.y,0)
        local owner=buildingId(anchor)
        if owner then resolved=true;if owner==bid then match=true end end
    end
    if resolved then return match end
    return destinations[id]~=nil and destinations[id][bid]==true
end
local function matches(def,binding)
    return Destinations.intersects(binding,def:getX(),def:getY(),def:getX2(),def:getY2())
end
-- Metadata only; no loading, entering, stash preparation, or visit fiction.
local function indexStep()
    if metadata.index>=metadata.buildings:size() then metadata=nil; R.indexed=true; return true end
    local def=metadata.buildings:get(metadata.index); metadata.index=metadata.index+1
    local bid=tostring(def:getIDString())
    for _,id in ipairs(Catalogue.list) do
        if matches(def,Catalogue.get(id)) then
            destinations[id]=destinations[id] or {};destinations[id][bid]=true
        end
    end
    return false
end
function R.read(id,item)
    if not allowed() or not Catalogue.get(id) then return false end
    -- A reviewed outdoor marked area is a destination in its own right.
    -- Building absence is decisive only for building-bound designs after the
    -- metadata pass; it must not erase a railyard, track or service compound.
    if R.indexed and not destinations[id] and not Catalogue.get(id).areas then
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
                if part==4 and Catalogue.get(id).sharedPeer then
                    local peerKnown={}
                    for source=1,4 do
                        local peer=State.get(root(),Catalogue.get(id).sharedPeer,source)
                        peerKnown[source]=peer and peer.noted==true
                    end
                    local shared=Content.sharedFinding(Catalogue.get(id),known,peerKnown)
                    if shared then detail=detail.."\n\nTHE OTHER FILE AT THIS PLACE\n"..shared end
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
    fault("beforeInsert",id,part)
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
    fault("afterInsert",id,part)
    local found,verdict=findItem(container,id,part,attempt)
    p.state=found and "placed" or (ok and result==nil and verdict=="absent" and "refused" or "unknown")
    local next=State.set(root(),id,part,p); next.cursor=designCursor
    fault("beforeCommit",id,part)
    if save(next) then rememberTarget(id,part,p,found) end
    fault("afterCommit",id,part)
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
local function targetKey(t)
    return table.concat({t.x,t.y,t.z,t.objectIndex,t.containerIndex},":")
end
local function candidate(square,object,index,ci,container,filled)
    local kind=container:getType()
    if not Choices.fixedKind(kind) then return nil end
    -- Any identified fixed non-floor furniture can carry a clue. Room names
    -- and loot categories never stand in for difficulty or better loot.
    if not filled and not container:isExplored() then return nil end
    local sprite=object:getSprite(); local name=sprite and sprite:getName()
    if not name then return nil end
    return {x=square:getX(),y=square:getY(),z=square:getZ(),objectIndex=index,
        containerIndex=ci,sprite=name,containerType=kind}
end
local function newCandidates() return {pool=Choices.new(),filled={},keys={}} end
local function offerCandidate(candidates,target,filled)
    local key=targetKey(target)
    local kept=Choices.offer(candidates.pool,target)
    -- Completion of vanilla filling is observational permission, not a call
    -- to explore or generate loot. Keep it only with a bounded retained target.
    if kept then candidates.keys[key]=true end
    if filled and candidates.keys[key] then candidates.filled[key]=true end
    return kept
end
local function prioritize(id)
    if root().trails[id] and not prioritySet[id] then
        priority[#priority+1]=id; prioritySet[id]=true
    end
end
-- Native loot completion contributes candidates to the same diverse scan as
-- ordinary discovery. It no longer lets the first cupboard bypass selection.
-- The return value means a candidate was queued, NOT that evidence was placed.
function R.offerContainer(container,filled)
    if not ready or not allowed() or not container then return false end
    local object=container:getParent(); local square=object and object:getSquare()
    if not square then return false end
    local objects=square:getObjects(); local oi,ci
    for i=0,math.min(256,objects:size())-1 do if objects:get(i)==object then oi=i; break end end
    if not oi then return false end
    for i=0,math.min(32,object:getContainerCount())-1 do if object:getContainerByIndex(i)==container then ci=i; break end end
    if not ci then return false end
    local target=candidate(square,object,oi,ci,container,filled)
    if not target then return false end
    local queued=false
    for _,id in ipairs(Catalogue.list) do
        local t=root().trails[id]; local p=t and State.get(root(),id,4)
        if t and (not p or p.state=="refused") then
            local match=atDestination(id,square)
            if match and not (p and targetKey(p.target)==targetKey(target)) then
                local candidates
                if scan and scan.id==id then candidates=scan.destination
                else offers[id]=offers[id] or newCandidates(); candidates=offers[id] end
                queued=offerCandidate(candidates,target,filled) or queued
                prioritize(id)
            end
        end
    end
    return queued
end
local function finishCandidates(s,part,candidates)
    local previous=State.get(root(),s.id,part)
    if part==4 then
        if previous and previous.state~="refused" then return false end
    elseif State.nextFragment(root(),s.id,s.x,s.y,hours())~=part then return false end
    local list=Choices.finish(candidates.pool)
    local remaining={};for i in ipairs(list) do remaining[i]=true end
    local usedKinds={}
    for i=1,4 do
        local placed=State.get(root(),s.id,i)
        if placed and placed.target and placed.state~="refused" then
            local kind=placed.target.containerType;usedKinds[kind]=(usedKinds[kind] or 0)+1
        end
    end
    -- Resolve one choice per scheduler step. The pool is bounded; a moved or
    -- dismantled candidate is discarded, never silently treated as inserted.
    s.selection={part=part,list=list,remaining=remaining,filled=candidates.filled,
        usedKinds=usedKinds,salt=root().trails[s.id].seed..":"..part}
    return #list>0
end
local function selectStep(s)
    local choice=s.selection
    local selected=Choices.choose(choice.list,choice.salt,function(i) return choice.remaining[i] end,nil,choice.usedKinds)
    if not selected then s.selection=nil;return false end
    choice.remaining[selected]=nil
    local target=choice.list[selected]
    local previous=State.get(root(),s.id,choice.part)
    if choice.part==4 and previous and previous.state~="refused" then s.selection=nil;return false end
    if choice.part~=4 and State.nextFragment(root(),s.id,s.x,s.y,hours())~=choice.part then s.selection=nil;return false end
    if previous and previous.state=="refused" and targetKey(previous.target)==targetKey(target) then return false end
    local container=World.resolve(target)
    if not container then return false end
    local object=container:getParent();local square=object and object:getSquare()
    if not square then return false end
    if (choice.part==4)~=atDestination(s.id,square) then return false end
    if not candidate(square,object,target.objectIndex,target.containerIndex,container,
        choice.filled[targetKey(target)]) then return false end
    -- Clear the scan BEFORE an attempted insertion. If interruption follows,
    -- the persisted intent is reconciled; this callback cannot replay it.
    scan=nil
    place(s.id,choice.part,target,container)
    return true
end
-- One square/object/container per scheduler step. Full collection precedes
-- selection so eight counters cannot exclude a later bedroom drawer.
local function scanStep()
    local player=getPlayer(); if not player then scan=nil; return true end
    if not scan then
        designCursor=designCursor%#Catalogue.list+1
        local id=table.remove(priority,1) or Catalogue.list[designCursor]
        prioritySet[id]=nil
        if not root().trails[id] then return true end
        local x,y,z=math.floor(player:getX()),math.floor(player:getY()),math.floor(player:getZ())
        local here=getCell():getGridSquare(x,y,z)
        scan={id=id,x=x,y=y,z=z,offset=0,destination=offers[id] or newCandidates(),localCopies=newCandidates(),
            localPart=not atDestination(id,here) and State.nextFragment(root(),id,x,y,hours()) or nil}
        offers[id]=nil
    end
    local s=scan
    if math.abs(player:getX()-s.x)>24 or math.abs(player:getY()-s.y)>24 or player:getZ()~=s.z then
        offers[s.id]=s.destination;scan=nil;return true
    end
    if s.selection then return selectStep(s) end
    if s.finished then
        if not s.triedDestination then
            s.triedDestination=true
            if finishCandidates(s,4,s.destination) then return false end
        end
        if s.localPart and not s.triedLocal then
            s.triedLocal=true
            if finishCandidates(s,s.localPart,s.localCopies) then return false end
        end
        if root().cursor~=designCursor then local next=State.copy(root()); next.cursor=designCursor; save(next) end
        scan=nil;return true
    end
    if s.container then
        local ci=s.containerIndex; s.containerIndex=ci+1
        if ci>=math.min(32,s.object:getContainerCount()) then s.container=nil; return false end
        local container=s.object:getContainerByIndex(ci)
        if not container then return false end
        local destination=atDestination(s.id,s.square)
        if not destination and not s.localPart then return false end
        local target=candidate(s.square,s.object,s.objectIndex-1,ci,container)
        if target then offerCandidate(destination and s.destination or s.localCopies,target,false) end
        return false
    end
    if s.square then
        local objects=s.square:getObjects(); local i=s.objectIndex
        if i>=math.min(256,objects:size()) then s.square=nil; return false end
        s.objectIndex=i+1; s.object=objects:get(i)
        s.container=true; s.containerIndex=0; return false
    end
    if s.offset>=49*49 then s.finished=true;return false end
    local dx=s.offset%49-24; local dy=math.floor(s.offset/49)-24; s.offset=s.offset+1
    s.square=getCell():getGridSquare(s.x+dx,s.y+dy,s.z); s.objectIndex=0
    return false
end
local function visitStep()
    local player=getPlayer();local square=player and player:getSquare()
    if not square then return end
    local bid,def=buildingId(square),defOf(square)
    local changes
    for _,id in ipairs(Catalogue.list) do
        -- A genuine current building can be indexed before the metadata pass.
        if def and matches(def,Catalogue.get(id)) then
            destinations[id]=destinations[id] or {};destinations[id][bid]=true
        end
        if atDestination(id,square) and root().entries[id]==nil then
            changes=State.enter(changes or root(),id,hours());prioritize(id)
        end
    end
    if changes then save(changes) end
end
function R.start()
    if not allowed() then return false end
    state=nil; root(); destinations,targets={},{}
    require("ConspiracyFiles/GeneratedMenu")
    require("ConspiracyFiles/ClueSearch")
    ticks,designCursor,entryCursor=0,root().cursor,0; priority,prioritySet,offers={},{},{}
    scan=nil; faultPoint=nil; lastFault=nil; R.indexed=false; R.entryCandidate=nil
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
        state=State.copy(root()),refusal=R.lastRefusal,pendingFault=faultPoint and State.copy(faultPoint) or nil,
        lastFault=lastFault and State.copy(lastFault) or nil}
end
function R.coverage(id)
    if not (getDebug and getDebug()) then return nil end
    local binding=Catalogue.get(id); if not binding then return nil end
    local count=0; for _ in pairs(destinations[id] or {}) do count=count+1 end
    return {design=id,buildings=count,areas=binding.areas and #binding.areas or 0,
        source=binding.areaSource or binding.anchorSource,related=binding.relatedDestination,
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
