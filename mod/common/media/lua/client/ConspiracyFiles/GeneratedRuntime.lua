-- G2 development adapter: one case, manual start, automatic saved-case resume.
local G=require("ConspiracyFiles/Generated/Generator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Storage=require("ConspiracyFiles/Generated/Storage")
local World=require("ConspiracyFiles/WorldAccess")
local Scheduler=require("ConspiracyFiles/Scheduler")
local Budget=require("ConspiracyFiles/SaveBudget")
local StaleClue=require("ConspiracyFiles/StaleClue")
local Visited=require("ConspiracyFiles/VisitedBuildingLog")
local Reachability=require("ConspiracyFiles/ReachabilityAdapter")
require("ConspiracyFiles/DiscoveryLog")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.GeneratedRuntime or {}
ConspiracyFiles.GeneratedRuntime=R
if R.loaded then return R end
local sessions,scheduler,wrapper,ticks,preparing
-- Rows of retired cases. They have no Session to project from, but the player
-- learned them and the notebook must still render them.
local retiredRows={}
local TAG="ConspiracyFiles.Generated.G2"
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("case","note",message) end
local function allowed()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function checked(ok,why) if not ok then error(why or "generated session write rejected") end end
local function worldHours()
    local n=getGameTime():getWorldAgeHours()
    assert(type(n)=="number" and n==n and n>=0 and n<math.huge,"invalid world clock")
    return n
end
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
-- Put the document's own words on the object. A diary you can pick up, open
-- and find blank contradicts the record the notebook keeps of it, and the
-- object is the thing the player actually holds.
--
-- Literature.addPage was proven to persist across save and reload by T7 on
-- this build; printMedia was the path that failed there, and is not used.
-- Everything is guarded because not every carrier is Literature: a key or a
-- credit card takes its name and nothing else.
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local function writePages(item,doc)
    if not item or not doc or not item.addPage then return end
    local ok,pages=pcall(Pages.pages,doc.body)
    if not ok or type(pages)~="table" or #pages==0 then return end
    pcall(function()
        if item.setNumberOfPages then item:setNumberOfPages(math.max(#pages,1)) end
        for index,text in ipairs(pages) do item:addPage(index,text) end
    end)
end
-- Object evidence is found in the state its story implies. Condition is a core
-- saved field, so this survives a reload; blood is deliberately NOT applied,
-- because setBloodLevel exists on the installed jar but nothing has proven it
-- persists, and no wording anywhere claims an object is bloodied.
local function applyWear(item,doc)
    if not item or not doc or not doc.wear then return end
    if not item.getConditionMax or not item.setCondition then return end
    local ok,max=pcall(function() return item:getConditionMax() end)
    if not ok or type(max)~="number" or max<=0 then return end
    local level=max
    if doc.wear=="poor" then level=math.max(1,math.floor(max*0.15))
    elseif doc.wear=="worn" then level=math.max(1,math.floor(max*0.5)) end
    pcall(function() item:setCondition(level) end)
end
-- How many copies belong to one document. One for everything the survivor
-- reads, and for most objects; more only where the COUNT is the evidence -
-- a cupboard of bleach rather than a bottle of it (ObjectRules.accumulation).
local function expectedCount(api,id)
    for _,d in ipairs(api.snapshot().case.documents) do
        if d.id==id then return d.quantity or 1 end
    end
    return 1
end
local function placement(api,id)
    local scan,count,finished,container,created
    return function()
        local a=api.assignment(id)
        if a.status=="placed" or a.status=="conflict" or a.status=="unknown" then return true end
        -- The physical token doubles as the mark on a vehicle part, so a clue
        -- in a car is found again wherever the player has since driven it.
        local current=World.resolve(a.target,a.physicalToken)
        if not current then return true end
        local expected=expectedCount(api,id)
        if not scan then
            container=current
            scan=World.count(current,a.physicalToken,function(n) count=n; finished=true end,expected)
        end
        if not finished then scan(); return false end
        if current~=container or count==nil then return true end
        if count>expected then checked(api.status(id,"conflict")); return true end
        if count==expected then
            checked(api.status(id,"placed",worldHours()))
            -- Six identical "Document placed" lines answered nothing when the
            -- owner asked where the clues were. The fields exist; use them.
            local address
            do
                local map=ConspiracyFiles.AddressMap
                local site=a.locationId
                if not site then
                    for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then site=d.locationId end end
                end
                if type(site)=="string" and map and map.labelForBuilding then
                    local trimmed=string.sub(site,1,3)=="t3:" and string.sub(site,4) or site
                    local okAddr,label=pcall(map.labelForBuilding,trimmed)
                    if okAddr and type(label)=="string" and label~="" then address=label end
                end
            end
            -- The address for a human reader AND the exact spot for a debugger.
            -- Asking for addresses "instead of coordinates" was about the
            -- journal, which the player reads; stripping the coordinates from
            -- the log left nobody able to say which drawer a missing document
            -- was in (2026-09-11, document 4 at 109 Walker Road).
            local t=a.target
            local placedDoc
            for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then placedDoc=d end end
            CFLog.write("i","placed",{doc=id,place=address,
                at=t and (t.x..","..t.y..","..t.z..":"..tostring(t.objectIndex)..":"..tostring(t.containerIndex)),
                kind=placedDoc and placedDoc.kind or nil,
                room=t and t.vehiclePart or nil,n=expected})
            return true
        end
        if a.status=="placing" and not created then
            checked(api.status(id,"unknown")); log("Interrupted placement is uncertain; no automatic replacement."); return true
        end
        if a.status=="pending" then checked(api.status(id,"placing")); created=true; return false end
        local doc
        for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then doc=d end end
        local carrier=assert(require("ConspiracyFiles/Generated/EvidenceKinds").get(doc.kind))
        -- One copy for everything readable; `quantity` copies where the count
        -- is the point. Each carries the same token, so the scan above counts
        -- the pile rather than calling the second bottle a conflict.
        for copy=1,expected do
            local item=assert(instanceItem(carrier.fullType),"could not create evidence item")
            local md=item:getModData()
            md.cfGeneratedId=id; md.cfPhysicalToken=a.physicalToken
            -- Each copy of a pile counts itself. Eleven items all reading "one
            -- of eleven" told the player nothing about which one they were
            -- holding (owner, 2026-09-10).
            local name=doc.title
            if expected>1 and doc.label then name=doc.label.." ("..copy.." of "..expected..")" end
            item:setName(name); item:setCustomName(true)
            -- Its own category, so evidence sorts together instead of hiding
            -- among Junk (owner, 2026-09-10). A display string only; nothing
            -- in the game keys off it.
            --
            -- The name is a TRANSLATION KEY: the inventory renders
            -- IGUI_ItemCat_<category>, and without the entry the player sees
            -- the raw key. Ours ships in Translate/EN/IG_UI.json - seen in
            -- play as "IGUI_ItemCat_Evidence" down a whole column.
            pcall(function() item:setDisplayCategory("Evidence") end)
            applyWear(item,doc)
            writePages(item,doc)
            assert(current:AddItem(item),"could not add note")
        end
        -- Claim the part, once the items are actually in it.
        World.markVehiclePart(current,a.physicalToken)
        created=false; finished=false
        scan=World.count(current,a.physicalToken,function(n) count=n; finished=true end,expected)
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
    -- Validated just above: the cached readers need not validate it again.
    pcall(Cases.remember,store,getTimeInMillis and getTimeInMillis())
end
local function openAll()
    -- Replacing the session set invalidates queued closures over old APIs.
    scheduler=Scheduler.new(getTimeInMillis,function(system,why) if system=="preparation" then preparing=false end;log(system..": "..why) end);scheduler.maxSteps=24;scheduler.budgetMs=1
    sessions={}; retiredRows={}; local stale=0
    for index,root in ipairs(Cases.sessions(wrapper)) do
        -- A retired root is not a Session and must never be opened as one.
        -- The closure keeps the true wrapper index, which no longer matches
        -- the position in `sessions` once any root has retired.
        if Retired.isRetired(root) then
            for _,row in ipairs(root.rows) do retiredRows[#retiredRows+1]=row end
        else
            -- A root written by an earlier generator revision no longer
            -- validates, and asserting on it would throw once per tick
            -- forever - the same shape of failure as the retired-case loop
            -- fixed on 2026-09-09. A case from an older build is a case we
            -- stop tracking, not a crash. Its evidence stays in the player's
            -- world and its notebook rows stay readable; only placement and
            -- discovery stop.
            local api,why=Session.open(root,function(staged) swap(assert(Cases.replace(wrapper,index,staged))) end)
            if api then
                sessions[#sessions+1]=api
            else
                stale=stale+1
                log("a saved case predates this build and is no longer tracked: "..tostring(why))
            end
        end
    end
    enqueue()
    if stale>0 then
        log(stale.." saved case(s) predate this build. New cases will generate normally; the old ones stay in the notebook.")
    end
    log("Generated case active. Take an evidence item, then right-click Inspect Investigation Evidence.")
end
local function currentHouse()
    local p=getPlayer();local square=p and p.getSquare and p:getSquare()
    local building=square and square.getBuilding and square:getBuilding()
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
-- A basement candidate only ever becomes usable once ConspiracyFiles/
-- Connectivity, fed by ReachabilityAdapter, proves the exact square
-- reachable from the player's current square (provably a place the player
-- can stand). This runs as its own bounded "reachability" scheduler job,
-- ahead of "storage", so Storage.scan's gate always sees a real answer
-- (proven reachable) rather than a guess -- a site with no basement rows,
-- or no live anchor square, skips straight to the scan exactly as before.
local function withReachability(result,startStorage)
    local sites=Reachability.basementSites(result)
    local p=getPlayer()
    local anchorSquare=#sites>0 and p and p.getSquare and p:getSquare()
    if not anchorSquare then startStorage(function() return false end); return end
    local cache={}
    scheduler.enqueue("reachability","preparation",Reachability.reachabilityJob(sites,anchorSquare,cache,function()
        startStorage(Reachability.predicate(cache))
    end))
end
local function prepare(result,seed,later,house)
  withReachability(result,function(reachable)
    local scan,why=Storage.scan(result,function(catalog,targets,candidates,rooms,occupied)
        local p=getPlayer()
        -- Sites earlier cases used are not reused. A retired case keeps no case
        -- envelope, only its rows, and each row still names its site. Reading
        -- root.case.locations for a retired case threw here, so once a player's
        -- only case was complete no further case could ever be prepared
        -- (Linux core-loop check, 2026-09-11; same class as 3fe1813).
        local used={}
        for _,root in ipairs(Cases.sessions(wrapper) or {}) do
            if root.case then for _,site in ipairs(root.case.locations) do used[site.id]=true end
            else for _,row in ipairs(root.rows or {}) do if row.locationId then used[row.locationId]=true end end end
        end
        local filtered={revision=catalog.revision,locations={}}
        for _,site in ipairs(catalog.locations) do
            local available=candidates and candidates[site.id] or {}
            if not used[site.id] and #available>=1 then filtered.locations[#filtered.locations+1]=site end
        end
        local anchor=later and {x=math.floor(p:getX()),y=math.floor(p:getY())} or result.anchor
        preparing=false
        if house and currentHouse()~=house then log("First case deferred: player changed building.");return end
        local options={mapId=result.map,buildLine=result.gameVersion}
        -- The people this case is about come from bodies the player has already
        -- searched, when there are any. Read once, here, at creation, and saved
        -- in the case - never re-read at load, which would break validation.
        -- Named nameLog, not log: a local called `log` shadowed this file's own
        -- log function, and the next line in scope that tried to log crashed
        -- case creation outright (caught by automatic_investigations).
        local nameLog=ConspiracyFiles.PersonNameLog
        if nameLog and nameLog.names then
            local ok,met=pcall(nameLog.names)
            if ok and type(met)=="table" and #met>0 then options.names=met end
        end
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
        local root=assert(Session.createDistributed(case,candidates,rooms,occupied))
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
        -- Give the case's person a body. The case keeps its own name and a
        -- nearby zombie is given THAT name and an ID to match, because a name
        -- read off the world could never be rebuilt from the seed. See
        -- ConspiracyFiles/CasePerson.lua.
        pcall(function()
            local People=require("ConspiracyFiles/CasePerson")
            local person=case.identities and case.identities[1]
            -- A person the player has already met is a body they have already
            -- searched. Naming a second zombie after them would put the same
            -- person in two graves.
            if person and person.met then
                log("case person "..tostring(person.name).." is someone already met; no new body")
            elseif person and person.name then
                local bound,why=People.bind(person.name,case.caseId,t.x,t.y,t.z)
                if not bound then log("case person not bound: "..tostring(why)) end
            end
        end)
    end,reachable)
    if not scan then preparing=false; log(why); return end
    scheduler.enqueue("storage","preparation",scan)
  end)
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
-- Start the investigation over in the save the player is already in.
--
-- Owner, 2026-09-12: every change to the case rules costs a fresh game, and
-- that happened four times in one day. The world, the character, the base and
-- the map knowledge are all still good; only the cases are stale. So this
-- abandons every case and builds new ones under the current rules, right here.
--
-- Nothing is preserved (P4-R77): the old paperwork is stripped back to
-- ordinary loot rather than deleted, because a player may be carrying it and
-- an item vanishing from a hand is worse than a page nobody records.
--
--     ConspiracyFiles.GeneratedRuntime.reshuffle("dry")   say what would go
--     ConspiracyFiles.GeneratedRuntime.reshuffle()        do it
--
-- Developer command: the same debug/single-player gate as nextCase.
function R.reshuffle(mode)
    local dry=mode=="dry"
    if preparing then return false,"preparation already running" end
    if not allowed() then return false,"debug single-player required" end
    if not wrapper or not (wrapper.canonical or wrapper.campaign) then return false,"no generated case to reshuffle" end
    local manifest,why=Cases.abandon(wrapper)
    if not manifest then return false,tostring(why) end
    -- The discovery ledger is append-only and finite. Reshuffling does not
    -- consume it, but the cases that follow do, and a ledger that fills up
    -- refuses every future discovery for the rest of the save. Say so while
    -- there is still room rather than after.
    local Ledger=require("ConspiracyFiles/DiscoveryLedger")
    local log2=ConspiracyFiles.DiscoveryLog
    local used=log2 and log2.events and #log2.events() or 0
    local room=Ledger.MAX-used
    log("Reshuffle: "..#manifest.caseIds.." case(s), "..#manifest.documentIds..
        " document(s), "..room.." discovery slot(s) left of "..Ledger.MAX..(dry and " [dry run]" or ""))
    if dry then return true,manifest end
    if room<G.MAX_EVIDENCE*2 then
        return false,"only "..room.." discovery slots left; a reshuffle now would run the ledger out"
    end
    -- Strip the mod's marks off what is already in the world, so a page in a
    -- drawer becomes ordinary literature instead of evidence nothing knows
    -- about. Bounded: only the containers the cases themselves recorded, plus
    -- whatever the player is carrying.
    local stripped=0
    local function unmark(item)
        local md=item and item.getModData and item:getModData()
        if type(md)=="table" and md.cfGeneratedId then
            md.cfGeneratedId=nil; md.cfPhysicalToken=nil; stripped=stripped+1
        end
    end
    for _,root in ipairs(Cases.sessions(wrapper) or {}) do
        for _,assignment in pairs(root.assignments or {}) do
            local ok,container=pcall(World.resolve,assignment.target)
            local items=ok and container and container.getItems and container:getItems()
            if items and items.size then
                for i=0,items:size()-1 do pcall(unmark,items:get(i)) end
            end
        end
    end
    local player=getPlayer and getPlayer()
    local inventory=player and player:getInventory()
    local carried=inventory and inventory.getItems and inventory:getItems()
    if carried and carried.size then for i=0,carried:size()-1 do pcall(unmark,carried:get(i)) end end
    local markers=ConspiracyFiles.ClueMarkers
    local forgotten=0
    if markers and markers.forget then
        local ok,n=pcall(markers.forget,manifest.documentIds); forgotten=(ok and type(n)=="number") and n or 0
    end
    -- Now the store itself. Clearing both fields is what lets R.start take the
    -- first-house path again, exactly as it does in a brand-new save.
    local store=ModData.getOrCreate(TAG)
    store.canonical=nil; store.campaign=nil
    wrapper=nil; sessions={}; retiredRows={}
    pcall(Cases.remember,store,getTimeInMillis and getTimeInMillis())
    -- Starting the new case here would race the automatic starter: both call
    -- the nearby scan, and T3Nearby.cancel() means the second start kills the
    -- first one's job, so neither waiter ever sees a result (reshuffle check,
    -- 2026-09-12). AutomaticInvestigations.poll already starts a case whenever
    -- there are none, in the building the player is standing in - which is
    -- exactly what a reshuffle wants, and it is the same path a fresh save
    -- takes. So: clear, and let it do its job.
    log("Reshuffle: "..stripped.." item(s) returned to ordinary loot, "..forgotten..
        " map mark(s) forgotten. A new case starts from where you stand, within a few seconds.")
    return true,manifest
end
function R.known()
    if not wrapper or not sessions then return {} end
    local byId={}
    for _,row in ipairs(retiredRows) do byId[row.id]=row end
    for _,api in ipairs(sessions) do for _,row in ipairs(api.project()) do byId[row.id]=row end end
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
-- `inPlace` records a document without taking it. Owner, 2026-09-10: "we
-- should be able to right click and add it to our Notebook without adding them
-- to our inventory" - which is plainly right for a pile of eleven credit cards
-- or, later, a body in a boot.
--
-- Possession was required so that discovery stayed deliberate: a player must
-- not be able to sweep a street by hovering over furniture. A right-click on a
-- named menu option is just as deliberate, so the guarantee survives.
function R.inspect(item,inPlace)
    if not allowed() or not sessions or not item then return false end
    if not inPlace and item:getOutermostContainer()~=getPlayer():getInventory() then return false end
    if inPlace then
        -- It must be somewhere real, and not already in hand: noting an item
        -- you are carrying is the ordinary path and should stay that way.
        local container=item:getContainer()
        if not container or container==getPlayer():getInventory() then return false end
    end
    local md=item:getModData(); local root=md and Cases.find(wrapper,md.cfGeneratedId); local api
    if root then for _,candidate in ipairs(sessions) do if candidate.snapshot().case.caseId==root.case.caseId then api=candidate end end end
    local a=api and api.assignment(md.cfGeneratedId)
    if not a or md.cfPhysicalToken~=a.physicalToken or a.status=="conflict" then return false end
    -- A positively observed surviving item can reconcile an uncertain intent.
    checked(api.status(md.cfGeneratedId,"placed",worldHours())); checked(api.inspect(md.cfGeneratedId))
    local ledger=ConspiracyFiles.DiscoveryLog
    if ledger and ledger.record then ledger.record("evidence",md.cfGeneratedId) end
    -- The moment two records meet. A document only connects to one already
    -- held, so this fires exactly when the player learns something they could
    -- not have known a second earlier - which is the rule every voice trigger
    -- has to pass. The survivor never says which record is true.
    local voice=ConspiracyFiles.PlayerVoice
    if voice and voice.onConnection then
        local snapshot=api.snapshot()
        local held={}
        for _,id in ipairs(snapshot.known or {}) do held[id]=true end
        for _,doc in ipairs(snapshot.case.documents) do
            if doc.id==md.cfGeneratedId then
                for _,link in ipairs(doc.links or {}) do
                    if held[link.target] then
                        pcall(voice.onConnection,link.kind,doc.id)
                        break
                    end
                end
                -- A pile is one document and many identical things; the count
                -- is the whole of the evidence, so it is worth a beat.
                if doc.quantity and voice.onPile then pcall(voice.onPile,doc.id) end
                break
            end
        end
    end
    -- Hovering a document you have already read should say so, without having
    -- to open the notebook to find out which of the four you are holding. The
    -- item already carries its real title as its name, so this only needs to
    -- confirm the notebook has it.
    --
    -- Set on INSPECTION and never before. A tooltip on an undiscovered
    -- document would let a player find every clue by hovering, which would
    -- replace the investigation with a sweep of the furniture.
    pcall(function() item:setTooltip("Tooltip_ConspiracyFiles_Recorded") end)
    -- Record the discovery first, then retire: a case whose last document has
    -- just been found no longer needs its placement bookkeeping, and shedding
    -- it is what keeps later cases inside the shared save budget.
    local done=api.snapshot()
    if #done.known>=#done.case.documents then
        for index,root in ipairs(Cases.sessions(wrapper)) do
            if not Retired.isRetired(root) and root.case and root.case.caseId==done.case.caseId then
                local staged,why=Cases.retire(wrapper,index)
                if staged then
                    swap(staged); openAll(); log("Case complete; placement details retired.")
                    -- Not "solved" - the mod does not know that and never will.
                    -- Only that there is nothing further to find.
                    local v=ConspiracyFiles.PlayerVoice
                    if v and v.onCaseComplete then pcall(v.onCaseComplete,done.case.caseId) end
                else log("Case complete but not retired: "..tostring(why)) end
                break
            end
        end
    end
    return true
end
function R.subject(item)
    if not sessions or not item then return false end
    local md=item:getModData(); local root=md and Cases.find(wrapper,md.cfGeneratedId); local a=root and root.assignments[md.cfGeneratedId]
    return a and md.cfPhysicalToken==a.physicalToken and a.status~="conflict"
end
-- True once the item's document id has been inspected (recorded in the
-- ledger via R.inspect). Distinct from R.subject: a subject item can be
-- live evidence the player has already read.
function R.isInspected(item)
    if not wrapper or not sessions or not item then return false end
    local md=item:getModData(); if not md or not md.cfGeneratedId then return false end
    for _,id in ipairs(Cases.discoveries(wrapper)) do if id==md.cfGeneratedId then return true end end
    return false
end
-- Development only: where this case put its documents, discovered or not.
-- Testing a case repeatedly means finding a document first, and hunting for
-- one has been the slow part of three sessions. This spoils the investigation
-- on purpose, so it is gated on debug like everything else here and is never
-- part of play.
function R.devLocations()
    if not allowed() or not sessions then return "no active case" end
    local out={}
    -- Coordinates alone made this diagnostic almost useless in play: the owner
    -- had searched seven houses and could not tell which of them held the rest.
    -- The address book already knows what a building is called, so say it.
    local map=ConspiracyFiles.AddressMap
    local function addressOf(siteId)
        if type(siteId)~="string" or not map or not map.labelForBuilding then return nil end
        -- Site ids are "t3:<buildingId>"; labelForBuilding adds that prefix
        -- itself, so it is stripped here rather than doubled.
        local buildingId=siteId
        if string.sub(buildingId,1,3)=="t3:" then buildingId=string.sub(buildingId,4) end
        local ok,label=pcall(map.labelForBuilding,buildingId)
        if ok and type(label)=="string" and label~="" then return label end
        return nil
    end
    for _,api in ipairs(sessions) do
        local ok,snap=pcall(api.snapshot)
        if ok and snap and snap.assignments then
            -- Where each document BELONGS, which is what carries the address.
            -- An assignment only gains a locationId once it has relocated.
            local siteOf={}
            if snap.case and snap.case.documents then
                for _,doc in ipairs(snap.case.documents) do siteOf[doc.id]=doc.locationId end
            end
            for id,a in pairs(snap.assignments) do
                local t=a.target
                if t then
                    local where=addressOf(a.locationId or siteOf[id]) or "address unknown"
                    out[#out+1]=string.format("%s  %s  %s,%s floor %s  [%s]",
                        tostring(id),where,tostring(t.x),tostring(t.y),tostring(t.z),tostring(a.status))
                end
            end
        end
    end
    table.sort(out)
    -- LOG the result, do not just return it. A debug-console call shows nothing
    -- when a function only returns a string, so this read as "does nothing"
    -- during the 2026-09-10 playtest - a diagnostic that cannot be used from
    -- the console it was written for.
    if #out==0 then
        log("no documents placed")
        return "no documents placed"
    end
    for _,line in ipairs(out) do log(line) end
    return table.concat(out,"\n")
end
function R.metrics() return scheduler and {peakMs=scheduler.peakMs} end
function R.automaticStatus()
    local roots=wrapper and Cases.sessions(wrapper) or {}
    local schedule=wrapper and wrapper.schedule
    return {count=#roots,preparing=preparing==true,scheduled=schedule~=nil,
        lastCreatedHours=schedule and schedule.createdHours[#schedule.createdHours],limit=Cases.MAX_CASES}
end
-- Bounded scan of a destination site's own bounding box for any container of
-- an allowed type. Mirrors Storage.scan's tile-stepping discipline, but the
-- box is small (one catalog location) and already known, so no rectangle
-- list is needed. Never resumes across relocation attempts; a fresh scan
-- starts once per chosen destination site.
local function boundsScan(site,done)
    local b=site.bounds
    local kinds={}; for _,kind in ipairs(site.containerTypes) do kinds[kind]=true end
    local x,y,objects,oi,ci=b.x1,b.y1,nil,0,0
    return function()
        if y>=b.y2 then done(nil); return true end
        if objects==nil then
            local square=getCell():getGridSquare(x,y,b.z)
            objects=square and square:getObjects() or false
            oi,ci=0,0
        end
        if not objects or oi>=objects:size() then
            objects=nil; x=x+1
            if x>=b.x2 then x=b.x1; y=y+1 end
            return false
        end
        local o=objects:get(oi)
        if not o or not o.getContainerCount or ci>=o:getContainerCount() then oi=oi+1; ci=0; return false end
        local c=o:getContainerByIndex(ci)
        local sprite=o:getSprite(); local name=sprite and sprite:getName()
        if c and name and kinds[c:getType()] then
            done({x=x,y=y,z=b.z,objectIndex=oi,containerIndex=ci,containerType=c:getType(),sprite=name}); return true
        end
        ci=ci+1
        return false
    end
end
-- Stale-clue relocation (docs/management/STALE_CLUE_RELOCATION.md). One job
-- per session (like `identity`, not per document) keeps the job count
-- bounded regardless of case/document count; it considers a single stale
-- document per attempt, so several stale documents in one case are spread
-- across successive periodic cycles rather than bursting all at once. Every
-- guard is checked fresh on each attempt: staleness, the relocation cap, an
-- unvisited destination with no other placed clue, the original item still
-- present untouched, and the player not carrying it or standing near either
-- location. Any refusal is logged and the document stays exactly where it
-- is -- never a loud failure, never a guess.
local function relocation(api)
    local id,site,scan,target,oldContainer,tokenScan,tokenCount,tokenDone,carryScan,carryCount,carryDone,newItem,newDestination
    return function()
        local root=api.snapshot()
        if not id then
            local hours=worldHours()
            local stale=StaleClue.staleIds(root,hours)
            for _,candidate in ipairs(stale) do
                -- A pile does not relocate. Relocation is built on there being
                -- exactly one item carrying the token (T4/T5: loss over
                -- duplication), and moving a hoard would mean moving every
                -- copy without a yield. A quantity is a fact about a place
                -- anyway; carrying it somewhere else would be a different
                -- claim, not the same clue in a new drawer.
                if StaleClue.canAttempt(root.assignments[candidate])
                    and expectedCount(api,candidate)==1 then id=candidate; break end
            end
            if not id then return true end
        end
        local a=root.assignments[id]
        if not a or a.status~="placed" then return true end
        if not StaleClue.canAttempt(a) then return true end
        local hours=worldHours()
        if not StaleClue.isStale({status=a.status,placedHours=a.placedHours,id=id},root.known,hours) then return true end
        oldContainer=oldContainer or World.resolve(a.target)
        if not oldContainer then return true end -- nothing safe to verify against
        local p=getPlayer()
        local px,py,pz=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
        if StaleClue.tooClose(px,py,pz,a.target) then return false end
        if not site then
            local candidates=StaleClue.destinations(root,Visited.set())
            if #candidates==0 then
                log("[CF-G2-RELOCATE] "..id..": no unvisited candidate; leaving in place")
                return true
            end
            site=candidates[1]
            scan=boundsScan(site,function(t) target=t end)
        end
        if not target then
            if scan() then
                if not target then
                    log("[CF-G2-RELOCATE] "..id..": no loaded container at destination; leaving in place")
                    return true
                end
            else return false end
        end
        if StaleClue.tooClose(px,py,pz,target) then return false end
        if not tokenDone then
            tokenScan=tokenScan or World.count(oldContainer,a.physicalToken,function(n) tokenCount=n; tokenDone=true end)
            tokenScan(); if not tokenDone then return false end
        end
        if not carryDone then
            carryScan=carryScan or World.count(p:getInventory(),a.physicalToken,function(n) carryCount=n; carryDone=true end)
            carryScan(); if not carryDone then return false end
        end
        if not StaleClue.canRelocate(tokenCount,carryCount) then
            log("[CF-G2-RELOCATE] "..id..": guard refused (original="..tostring(tokenCount)..", carried="..tostring(carryCount)..")")
            return true
        end
        if not newItem then
            local doc; for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
            local destination=World.resolve(target)
            if not destination then log("[CF-G2-RELOCATE] "..id..": destination changed before placement; leaving in place"); return true end
            local carrier=assert(require("ConspiracyFiles/Generated/EvidenceKinds").get(doc.kind))
            newItem=assert(instanceItem(carrier.fullType),"could not create relocated evidence item")
            local md=newItem:getModData()
            md.cfGeneratedId=id; md.cfPhysicalToken=a.physicalToken
            newItem:setName(doc.title); newItem:setCustomName(true)
            applyWear(newItem,doc)
            writePages(newItem,doc)
            newDestination=destination
        end
        -- T4/T5 policy is loss over duplication, and it is not merely a
        -- preference here: two items sharing one cfPhysicalToken make the
        -- periodic identity scan mark the document "conflict", which is
        -- sticky, so the clue would be dead permanently and Inspect would
        -- refuse it forever. Remove the one verified old item first; the new
        -- copy is already built and detached, so the window is two engine
        -- calls with no yield between them.
        local items=oldContainer:getItems()
        for i=0,items:size()-1 do
            local it=items:get(i); local md=it and it:getModData()
            if md and md.cfPhysicalToken==a.physicalToken then oldContainer:RemoveItem(it); break end
        end
        if not newDestination:AddItem(newItem) then
            -- The old copy is already gone. Record the honest uncertainty
            -- rather than leaving canonical state claiming a placed item.
            checked(api.status(id,"unknown"))
            log("[CF-G2-RELOCATE] "..id..": destination refused the item after removal; marked unknown")
            return true
        end
        checked(api.relocate(id,target,hours))
        local hints=ConspiracyFiles.ClueHints
        if hints and hints.invalidate then hints.invalidate(a.target) end
        log("[CF-G2-RELOCATE] relocated "..id.." to "..target.x..","..target.y..",floor "..target.z)
        return true
    end
end
local function trackVisited()
    local house=currentHouse()
    if not house then return true end
    Visited.record(house)
    -- Recognition, not direction. This fires only once the player is INSIDE a
    -- building an already-discovered document named - a step earlier it would
    -- be a quest marker, which is the one thing this mod does not do. A lead
    -- the player has not read yet says nothing at all.
    local voice=ConspiracyFiles.PlayerVoice
    if not voice or not voice.onNamedPlace or not sessions then return true end
    for _,api in ipairs(sessions) do
        local snapshot=api.snapshot()
        local known={}
        for _,id in ipairs(snapshot.known or {}) do known[id]=true end
        for _,doc in ipairs(snapshot.case.documents) do
            if known[doc.id] then
                for _,lead in ipairs(doc.leads or {}) do
                    if lead==house then pcall(voice.onNamedPlace,house); return true end
                end
            end
        end
    end
    return true
end
-- What the periodic scan has been able to see, per document. Kept in memory
-- rather than in the save on purpose: a saved flag cannot tell "we looked and
-- it is not there" apart from "we have not looked since you loaded", and
-- claiming the first when we mean the second is exactly the kind of unearned
-- certainty this notebook exists to avoid. After a reload we say so.
--
-- The scan covers the player, two tiles around them, their vehicle, and the
-- container the document was originally placed in. Absence therefore means
-- "not anywhere we can currently see", never "destroyed" - which is why the
-- wording is about uncertainty rather than loss.
local sightings={}
-- Every engine call guarded: a document can be in a container whose parent has
-- gone, on a square that has streamed out, or held by an object that does not
-- answer the call at all. None of that should cost the player their notebook.
local function rd(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
end
-- Where a document actually is, in words a survivor would use. "Close by" was
-- vague where we were not: the scan holds the item itself, so it can say
-- whether it is carried, in something, or on the floor - and the address book
-- can usually name the building. Vagueness is for what we cannot know.
local function placeOf(item)
    local player=getPlayer()
    local container=rd(item,"getContainer")
    local carried=player and container and container==rd(player,"getInventory")
    local bag=container and rd(container,"getContainingItem")
    if not carried and bag and player and rd(bag,"getOutermostContainer")==rd(player,"getInventory") then
        local name=rd(bag,"getName")
        -- "Carried, in your Omer's Case File" - seen in play 2026-09-10. A
        -- container the survivor has already named for themselves does not
        -- take a second possessive.
        if not name then return "Carried." end
        name=tostring(name)
        if string.find(name,"'s ",1,true) then return "Carried, in "..name.."." end
        return "Carried, in your "..name.."."
    end
    if carried then return "Carried." end
    -- Somewhere in the world. Name the building if the address book knows it.
    local square=rd(item,"getSquare")
    if not square then
        local world=rd(item,"getWorldItem"); square=world and rd(world,"getSquare")
    end
    if not square and container then
        local parent=rd(container,"getParent"); square=parent and rd(parent,"getSquare")
    end
    local address
    local building=square and rd(square,"getBuilding")
    local def=building and rd(building,"getDef")
    local id=def and rd(def,"getIDString")
    if id then
        local map=ConspiracyFiles.AddressMap
        address=map and map.labelForBuilding and select(2,pcall(map.labelForBuilding,tostring(id)))
        if type(address)~="string" or address=="" then address=nil end
    end
    local kind=container and rd(container,"getType")
    local part=container and rd(container,"getVehiclePart")
    if part then
        -- Name the vehicle. "In a vehicle" cannot tell a mail van from an
        -- unmarked one, and that difference is the whole of what a vehicle
        -- adds over a cupboard.
        local vehicle=rd(part,"getVehicle")
        local script=vehicle and rd(vehicle,"getScriptName")
        -- Plain string.sub, not gsub with a pattern: Kahlua's string library
        -- is incomplete and this stays inside the part the engine implements.
        local name=type(script)=="string" and script or nil
        if name and string.sub(name,1,5)=="Base." then name=string.sub(name,6) end
        -- The game already names its own vehicles: IGUI_VehicleNameVanAmbulance
        -- is "Ambulance", CarLightsPolice is "Police Chevalier Nyala". Ask it
        -- rather than shipping a table of our own, which would be one more
        -- thing to keep in step with the game and would only ever be English.
        -- getText returns the key back when there is no translation, so an
        -- unmatched id falls through to the script name.
        if name and getText then
            local key="IGUI_VehicleName"..name
            local ok,text=pcall(getText,key)
            if ok and type(text)=="string" and text~="" and text~=key then name=text end
        end
        local where=name and ("In a "..name) or "In a vehicle"
        local slot=rd(part,"getId")
        if type(slot)=="string" and slot~="" then where=where.." ("..slot..")" end
        return address and (where.." at "..address..".") or (where..".")
    end
    if kind and kind~="floor" then
        return address and ("In a "..tostring(kind).." at "..address..".")
            or ("In a "..tostring(kind)..".")
    end
    return address and ("On the floor at "..address..".") or "On the ground."
end
-- Five consecutive misses, at one scan per 120 ticks. Long enough that walking
-- through a doorway does not make the notebook doubt itself.
local MISSES_BEFORE_UNCERTAIN=5
function R.whereabouts(id)
    if type(id)~="string" or not sessions then return nil end
    for _,api in ipairs(sessions) do
        local ok,a=pcall(api.assignment,id)
        if ok and a then
            if a.status=="conflict" then return "conflict" end
            local s=sightings[id]
            if not s then return "unchecked" end
            if s.misses>=MISSES_BEFORE_UNCERTAIN then return "uncertain",s.where end
            if s.seen then return "accounted",s.where end
            return "unchecked"
        end
    end
    return nil
end
local function identity(api)
    local found,done
    local snapshot=api.snapshot()
    -- How many copies each document is supposed to have. A pile is one
    -- document and many identical items; finding the second one is not a
    -- conflict, it is the pile.
    local expected={}
    for _,d in ipairs(snapshot.case.documents) do expected[d.id]=d.quantity or 1 end
    local scan=World.identityScan(getPlayer(),snapshot.assignments,function(r) found=r; done=true end,expected)
    return function()
        if not done then scan(); return false end
        for id,items in pairs(found) do
            local want=expected[id] or 1
            if #items>want then checked(api.status(id,"conflict"))
            elseif #items>=1 and api.assignment(id).status~="conflict" then checked(api.status(id,"placed",worldHours())) end
            -- identityScan reports every document, with an empty list where it
            -- found nothing. That empty case was previously ignored, so a
            -- document could never stop being "placed" however far it went.
            local s=sightings[id] or {seen=false,misses=0}
            if #items>=1 then
                s.seen=true; s.misses=0
                local ok,where=pcall(placeOf,items[1])
                s.where=ok and where or nil
            else s.misses=s.misses+1 end
            sightings[id]=s
        end
        return true
    end
end
Events.OnTick.Add(function()
    if not scheduler or not allowed() then return end
    ticks=ticks+1
    if sessions and ticks%120==0 then
        enqueue(); for i,api in ipairs(sessions) do scheduler.enqueue("identity:"..i,"identity",identity(api)) end
        for i,api in ipairs(sessions) do scheduler.enqueue("relocate:"..i,"relocation",relocation(api)) end
        scheduler.enqueue("visited-building","tracking",trackVisited)
    end
    scheduler.step()
end)
Events.OnGameStart.Add(function()
    sessions,scheduler,preparing,wrapper=nil,nil,false,nil
    -- Forget what we could see last time. A new session has not looked yet,
    -- and should say so rather than inherit yesterday's confidence.
    sightings={}
    if not allowed() then return end
    local saved=ModData.getOrCreate(TAG)
    if saved.canonical or saved.campaign then
        local ok,why=pcall(function() checked(setup()); wrapper=assert(Cases.current(saved)); openAll() end)
        if not ok then scheduler=nil; log("Saved case refused: "..tostring(why)) end
    end
end)
R.loaded=true
return R
