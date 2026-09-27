-- No Help runtime: one world record of decided areas, created once per save,
-- grown as the survivor comes near interesting places, and placed by the
-- existing placement, filler, identity and relocation jobs.
NHShared=NHShared or {}
local Session=require("NHShared/Generated/Session")
local AreaPlace=require("NHShared/Generated/AreaPlace")
local Manifest=require("NHShared/Mystery/Manifest")
local Cases=require("NHShared/Generated/SuccessiveCases")
local Storage=require("NHShared/Generated/Storage")
local StorageChoices=require("NHShared/Generated/StorageChoices")
local FixedContainers=require("NHShared/Generated/FixedContainerRuntime")
local World=require("NHShared/WorldAccess")
local HouseKeys=require("NHShared/HouseKeyAdapter")
local Scheduler=require("NHShared/Scheduler")
local Budget=require("NHShared/SaveBudget")
local StaleClue=require("NHShared/StaleClue")
local Carriers=require("NHShared/Carriers")
local Kinds=require("NHShared/Generated/EvidenceKinds")
local Visited=require("NHShared/VisitedBuildingLog")
local Reachability=require("NHShared/ReachabilityAdapter")
local MapSites=require("NHShared/Generated/MapSites")
local GroundSpots=require("NHShared/GroundSpots")
require("NHShared/DiscoveryLog")
NHShared=NHShared or {}
local R=NHShared.GeneratedRuntime or {}
NHShared.GeneratedRuntime=R
NHEngine=NHEngine or {};NHEngine.GeneratedRuntime=R
if R.loaded then return R end
local sessions,scheduler,wrapper,ticks,preparing
-- The open Session of the No Help world record, when this save has one.
local areaSession
-- Declared with the identity scan further down. Retirement (R.inspect) reads
-- both to keep where each clue was last seen, and sits above that code.
local sightings,placeOf
-- Building id -> address, or false for "the book has no name for it". Cleared
-- when the address book finishes building, so early misses are not permanent.
--
-- Every address lookup in this file goes through addressFor. Two of the three
-- places that asked the book directly run on the scheduler, so a case being
-- placed resolved the same two addresses about twice a second for as long as
-- the save was open (traced in game, 2026-09-12).
--
-- WHAT IS CACHED IS THE RAW LABEL AND ITS TOWN, never the finished address
-- (AD-10). The finished form depends on where the survivor is standing: inside
-- their own town an address reads as it always did, and away from it the town
-- is added ("102 2nd St, Muldraugh"). This cache used to hold the OUTPUT of
-- labelForBuilding, so the first reading of a label froze for the session -
-- standing in West Point, 0 of 16 records about Muldraugh named Muldraugh
-- (campaign 20260918T005315). Qualifying on the way out costs one compare, and
-- the town behind it is re-measured at most every AddressMap.TOWN_EVERY_MS and
-- only after TOWN_MOVED_TILES of movement, so this stays off the hot path.
local addressCache={}
local function addressFor(id)
    if type(id)~="string" or id=="" then return nil end
    local trimmed=string.sub(id,1,3)=="t3:" and string.sub(id,4) or id
    local map=NHShared.AddressMap
    if not map or not map.labelParts or not map.qualify then return nil end
    local remembered=addressCache[trimmed]
    if remembered==nil then
        local ok,label,town=pcall(map.labelParts,trimmed)
        if ok and type(label)=="string" and label~="" then remembered={label=label,town=town}
        else remembered=false end
        addressCache[trimmed]=remembered
    end
    if not remembered then return nil end
    local ok,words=pcall(map.qualify,remembered.label,remembered.town)
    if ok and type(words)=="string" and words~="" then return words end
    return remembered.label
end
local TAG="NHShared.Generated.G2"
local CFLog=require("NHShared/Log")
-- Why a clue was not placed this step. See Log.declines.
local declinePlacement=CFLog.declines("placement")
local function log(message) CFLog.message("case","note",message) end
-- No Help runs in every single-player game (owner, 2026-09-27: "Normal play
-- now"); it was debug-only while the old case generator was a prototype.
-- Multiplayer stays out of scope.
local function allowed()
    return not (isClient and isClient()) and not (isServer and isServer())
        and not NHShared.T11Mode and not NHShared.T12Mode
end
local function checked(ok,why) if not ok then error(why or "generated session write rejected") end end

-- When the save itself refuses a write, STOP writing for a while.
--
-- Placement commits after every document, and each commit checks the save
-- budget. With that check failing, the mod kept trying: the scheduler gives up
-- after three failures, but the scheduler is rebuilt whenever the case store is
-- reopened, which resets the count - about ten attempts a second, for as long
-- as the fault lasted (traced in game, 2026-09-12). A refusal is a state of the
-- save, not of one task, so it is remembered here, above all of them.
local saveRefusedUntil=nil
local SAVE_BACKOFF_MS=60000
local function noteSaveRefused(why)
    local now=getTimeInMillis and getTimeInMillis() or 0
    if not saveRefusedUntil or now>saveRefusedUntil then
        log("The save refused a write ("..tostring(why).."); pausing placement for a minute.")
    end
    saveRefusedUntil=now+SAVE_BACKOFF_MS
end
local function saveRefused()
    if not saveRefusedUntil then return false end
    local now=getTimeInMillis and getTimeInMillis() or 0
    if now>=saveRefusedUntil then saveRefusedUntil=nil; return false end
    return true
end
local function worldHours()
    local n=getGameTime():getWorldAgeHours()
    assert(type(n)=="number" and n==n and n>=0 and n<math.huge,"invalid world clock")
    return n
end
local function setup()
    if not allowed() then return false,"G2 requires debug single-player, without T11/T12" end
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
-- and find blank contradicts the record the organiser keeps of it, and the
-- object is the thing the player actually holds.
--
-- Literature.addPage was proven to persist across save and reload by T7 on
-- this build; printMedia was the path that failed there, and is not used.
-- Everything is guarded because not every carrier is Literature: a key or a
-- credit card takes its name and nothing else.
local Pages=require("NHShared/Generated/DocumentPages")
local PlaceNames=require("NHShared/Generated/PlaceNames")
local function writePages(item,doc,case)
    if not item or not doc or not item.addPage then return end
    local map=NHShared.AddressMap
    local context=PlaceNames.context(case,Cases.sessions(wrapper))
    local ok,pages=pcall(Pages.pages,doc.body,context,map and map.describe)
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
-- Everything a RECOGNISED clue needs to look like evidence. Placement no longer
-- calls this (P4-R132): a clue is the plain game item until the survivor
-- recognises it, and then R.recognise stamps it. Relocation calls it only for a
-- clue already recognised.
--
-- The category is a display string only; nothing in the game keys off it. It
-- is also a TRANSLATION KEY - the inventory renders IGUI_ItemCat_<category>,
-- and without the entry the player sees the raw key, so ours ships in
-- Translate/EN/IG_UI.json (seen in play as "IGUI_ItemCat_Evidence" down a
-- whole column). And it is a RUNTIME property: it is not saved with the item,
-- which is why loading a game re-stamps it as well.
local function stampEvidence(item,title)
    if not item then return end
    item:setName(title); item:setCustomName(true)
    pcall(function() item:setDisplayCategory("Evidence") end)
end
-- Every clue in No Help is plain Evidence: no case ever finishes, so nothing is Old.
local function categoryOf() return "Evidence" end

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
        -- A set's number is the sum of its pieces, whether or not the
        -- document also states a total (Session.pieceCount).
        if d.id==id then return Session.pieceCount(d) end
    end
    return 1
end

-- An object SET: one clue made of several different real items, which only
-- mean something together (No Help, owner 2026-09-27).
local function isObjectSet(api,id)
    for _,d in ipairs(api.snapshot().case.documents) do
        if d.id==id then return type(d.members)=="table" and #d.members>0 end
    end
    return false
end

local function createEvidenceItem(doc,kind,target)
    if doc.accessIntent=="starting-building" then
        local cell=getCell and getCell()
        local square=cell and target and cell:getGridSquare(target.x,target.y,target.z)
        local building=square and square.getBuilding and square:getBuilding()
        local item,why=HouseKeys.createForBuilding(building)
        if not item then return nil,"could not create starting-house key: "..tostring(why) end
        return item
    end
    local carrier=assert(require("NHShared/Generated/EvidenceKinds").get(kind))
    return instanceItem(carrier.fullType)
end

local function evidenceMembers(doc)
    if type(doc.members)=="table" and #doc.members>0 then return doc.members end
    return {{kind=doc.kind,quantity=doc.quantity or 1,wear=doc.wear}}
end

local function playerHouse(player)
    local square=player and player.getSquare and player:getSquare()
    local building=square and square.getBuilding and square:getBuilding()
    local def=building and building:getDef()
    return def and ("t3:"..tostring(def:getIDString())) or nil
end


local function placement(api,id)
    local scan,count,finished,container,created
    return function()
        local a=api.assignment(id)
        if a.status=="placed" or a.status=="conflict" or a.status=="unknown" then return true end
        -- A clue with no container yet is the filler's business, not this job's
        -- (P4-R133); a dropped one is nobody's.
        if a.status=="deferred" or a.status=="indexed" or a.status=="dropped" then return true end
        -- The physical token doubles as the mark on a vehicle part, so a clue
        -- in a car is found again wherever the player has since driven it.
        local current,resolveWhy=World.resolve(a.target,a.physicalToken)
        if not current then
            -- A fixed target that changed while loaded returns to the bounded
            -- modified-building scan.  An unloaded square merely waits.  Once
            -- placement reached `placing`, ambiguity still follows T4's
            -- conservative unknown path instead of inventing a retry.
            if a.status=="pending" and not Session.isMobile(a.target) and resolveWhy~="unloaded" then
                local ok,why=api.deferTarget(id,worldHours())
                if not ok then log("could not defer a changed fixed target: "..tostring(why)) end
            end
            return true
        end
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
                local site=a.locationId
                if not site then
                    for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then site=d.locationId end end
                end
                address=addressFor(site)
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
        if a.status=="pending" then
            -- A No Help area clue may go in a drawer searched earlier; only
            -- the open loot window refuses (owner, 2026-09-27).
            local fresh,why=FixedContainers.fresh(current,Session.isArea(api.snapshot()))
            if not fresh then
                local ok,deferWhy=api.deferTarget(id,worldHours())
                if not ok then log("could not defer a searched target: "..tostring(deferWhy)) end
                CFLog.write("d","skip",{doc=id,why="container-"..tostring(why)})
                return true
            end
            -- Persist intent, then create in this same scheduler step.  There
            -- is no player-interaction frame between the final freshness check
            -- and AddItem; a crash in the gap remains `placing` and therefore
            -- reconciles conservatively on the next load.
            checked(api.status(id,"placing")); created=true
        end
        local doc
        for _,d in ipairs(api.snapshot().case.documents) do if d.id==id then doc=d end end
        -- Build every member before inserting any of them.  A mixed PPE scene
        -- is one finding with one token, but it contains real masks, gloves and
        -- disinfectant instead of nine renamed copies of one item.
        local createdItems={}
        for _,member in ipairs(evidenceMembers(doc)) do
          for copyIndex=1,member.quantity do
            local item,createWhy=createEvidenceItem(doc,member.kind,a.target)
            if not item then
                checked(api.status(id,"unknown"))
                log("Evidence creation failed: "..tostring(createWhy))
                return true
            end
            local md=item:getModData()
            md.cfGeneratedId=id; md.cfPhysicalToken=a.physicalToken
            -- Each copy of a pile counts itself. Eleven items all reading "one
            -- of eleven" told the player nothing about which one they were
            -- holding (owner, 2026-09-10).
            -- No title and no category here (P4-R132): the plain item, until
            -- the survivor recognises it (R.recognise).
            applyWear(item,member)
            writePages(item,doc,api.snapshot().case)
            -- A card clue reads like a vanilla card with its name on it.
            Kinds.nameAsVanillaCard(item,doc)
            createdItems[#createdItems+1]=item
          end
        end
        for _,item in ipairs(createdItems) do
            assert(current:AddItem(item),"could not add evidence")
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
        -- Nothing is placed while the save is refusing writes; the documents
        -- are enqueued again when the case store is next opened.
        if not saveRefused() then scheduler.enqueue("place:"..d.id,"placement",placement(api,d.id)) end
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
    checked(Cases.validate(next))
    local within,why=Budget.check("generatedCampaign",next)
    if not within then noteSaveRefused(why); checked(false,why) end
    local store=ModData.getOrCreate(TAG); store.campaign=next; wrapper=next
    -- Validated just above: the cached readers need not validate it again.
    pcall(Cases.remember,store,getTimeInMillis and getTimeInMillis())
end
local function openAll()
    -- Replacing the session set invalidates queued closures over old APIs.
    -- Reopening the sessions invalidates queued jobs that hold the old session
    -- APIs (identity, relocation, tracking, last seen) - but not a case being
    -- prepared. Dropping that restarted a nearby scan that takes minutes every
    -- time a case finished, and the flag it left behind stopped later cases
    -- (campaign check, 2026-09-15). Keep preparation, drop the rest, and forgive
    -- past failures as a fresh scheduler did.
    if scheduler and scheduler.retain then
        scheduler.retain(function(job) return job.subsystem=="preparation" end)
        scheduler.forgive()
    else
        scheduler=Scheduler.new(getTimeInMillis,function(system,why) if system=="preparation" then preparing=false end;log(system..": "..why) end);scheduler.maxSteps=24;scheduler.budgetMs=1
    end
    -- A flag with no preparation behind it would stop every later case.
    if not scheduler.has("preparation") then preparing=false end
    sessions={}; areaSession=nil; local stale=0
    for index,root in ipairs(Cases.sessions(wrapper)) do
        -- The closure keeps the true wrapper index.
        -- A root written by an earlier build no longer validates, and
        -- asserting on it would throw once per tick forever. A case from an
        -- older build is a case we stop tracking, not a crash.
        local api,why=Session.open(root,function(staged) swap(assert(Cases.replace(wrapper,index,staged))) end)
        if api then
            sessions[#sessions+1]=api
            if Session.isArea(root) then areaSession=api end
        else
            stale=stale+1
            log("a saved case predates this build and is no longer tracked: "..tostring(why))
        end
    end
    enqueue()
    if stale>0 then
        log(stale.." saved case(s) predate this build and are no longer tracked.")
    end
    if not areaSession then
        log("This save holds no No Help world record (an old generated case?); no areas will be decided in it.")
    end
    log("No Help world record open: "..#sessions.." session(s).")
end
local function currentHouse()
    return playerHouse(getPlayer())
end
-- A basement candidate only ever becomes usable once NHShared/
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
-- THE WORLD RECORD (No Help, owner 2026-09-27: the old case generator is gone
-- completely). One record per save, created the first time a save is opened
-- and kept for ever: a Session root whose case is the "nohelp-areas" record
-- (Generated/AreaCase). Its world seed is drawn ONCE, here, and saved inside
-- the record, so every later area is picked from the save alone.
--
-- Same gate as the old start (debug single-player, no T11/T12): setup()
-- refuses anything else.
local servicesStarted=false
-- The organiser's map marks and the address book, which the old start path
-- (Trial.start) switched on before the first case. Retried from the tick
-- until the player exists, never allowed to stop the record from opening.
local function startServices()
    if not getPlayer or not getPlayer() or not getWorld or not getWorld() then return false end
    local okM,markers=pcall(require,"NHShared/ClueMarkers")
    if okM and markers and markers.start then
        local ok,why=pcall(markers.start)
        if not ok then log("map marks not started: "..tostring(why)) end
    end
    local okA,addresses=pcall(require,"NHShared/AddressMap")
    if okA and addresses and addresses.start then
        local ok,started,why=pcall(addresses.start)
        if not ok then log("address book not started: "..tostring(started))
        elseif not started and why~="address index already building" then log("address book not started: "..tostring(why)) end
    end
    return true
end
function R.bootstrap()
    -- Lazy, not a top-level require: InteractionAPI.lua's own construction
    -- reaches GeneratedMenu.lua, which reaches EngineAPI.lua, which reaches
    -- this file - a real circular require if resolved at file-load time.
    require("NHShared/InteractionAPI")
    local ok,why=setup(); if not ok then return false,why end
    if not wrapper.canonical then
        local worldSeed=ZombRand(2147483646)+1
        local root,err=Session.createArea(worldSeed)
        if not root then return false,"could not create the world record: "..tostring(err) end
        swap({canonical=root})
        CFLog.write("i","start",{why="world-record",seed=worldSeed})
    end
    openAll()
    servicesStarted=startServices()
    return true
end
-- DECIDING AREAS NEARBY (task 3 plan, phase 5). Replaces the old next-case
-- poller. Every few seconds of play this may run the existing nearby scan
-- (T3Nearby, then the storage scan through withReachability, exactly as the
-- old case preparation did), and every eligible building it finds whose kind
-- maps to one of the owner's interesting places (AreaPlace) is decided: its
-- clues are picked from the clue list and added to the world record in one
-- write, waiting at their own area for the filler to give each a spot of its
-- own kind. A building is decided once; one with nothing to give is not
-- decided at all, so a later clue list can still give it clues.
--
-- The scan is not free, so it waits until the survivor has moved on or half
-- an in-game hour has passed since the last attempt (the same 50 tiles and
-- half hour the old refusals waited, P4-R125).
R.DECIDE_TILES=50
R.DECIDE_HOURS=0.5
local lastDecide=nil
-- Sites already reported as having no clues to give, this session only.
local emptyNoted={}
local function worldRoot()
    for _,root in ipairs(wrapper and Cases.sessions(wrapper) or {}) do
        if Session.isArea(root) then return root end
    end
    return nil
end
-- What the nearby scan knows about each building that the catalogue drops:
-- its T3 category and its room names, keyed by the catalogue's site id.
local function placeFacts(result)
    local hints,rooms={},{}
    for _,row in ipairs(result and result.rows or {}) do
        if row.kind=="building" then
            hints["t3:"..tostring(row.id)]=row.categoryHint
        elseif row.kind=="room" and type(row.building)=="string" and type(row.name)=="string" and row.name~="" then
            local id="t3:"..row.building
            rooms[id]=rooms[id] or {}
            rooms[id][string.lower(row.name)]=true
        end
    end
    return hints,rooms
end
-- THE PLACES VANILLA MAPS AND FLYERS NAME (task 3 plan, step 4). Every mark of
-- every vanilla map, and every place a flyer names, is a clue place fixed in
-- advance (Generated/MapSites). Indexed once: by area id, by design, and in a
-- coarse grid so "near the survivor" looks at a handful of places, not all.
local MAP_BUCKET=128
local mapIndex
local function mapSites()
    if mapIndex then return mapIndex end
    local byArea,byDesign,buckets={},{},{}
    for _,e in ipairs(MapSites.sites) do
        byArea[e.areaId]=e
        local seen={}
        for _,m in ipairs(e.marks) do
            if m.design and not seen[m.design] then
                seen[m.design]=true
                byDesign[m.design]=byDesign[m.design] or {}
                table.insert(byDesign[m.design],e)
            end
        end
        local b=e.bounds
        for bx=math.floor(b.x1/MAP_BUCKET),math.floor((b.x2-1)/MAP_BUCKET) do
            for by=math.floor(b.y1/MAP_BUCKET),math.floor((b.y2-1)/MAP_BUCKET) do
                local k=bx..":"..by
                buckets[k]=buckets[k] or {}
                table.insert(buckets[k],e)
            end
        end
    end
    mapIndex={byArea=byArea,byDesign=byDesign,buckets=buckets}
    return mapIndex
end
local function decideFrom(result)
    local hints,rooms=placeFacts(result)
    withReachability(result,function(reachable)
        local scan,why=Storage.scan(result,function(catalog,targets,candidates)
            preparing=false
            local api=areaSession
            local root=worldRoot()
            if not api or not root then return end
            local decided={}
            for _,a in ipairs(root.case.areas or {}) do decided[a.id]=true end
            local sites={}
            for _,site in ipairs(catalog.locations) do sites[#sites+1]=site end
            table.sort(sites,function(a,b) return a.id<b.id end)
            -- One area per scheduler step (phase 5 review): every addArea
            -- copies and validates the whole growing record, so a dense town
            -- deciding many buildings in one tick would stall the game.
            local index=0
            scheduler.enqueue("area-decide","preparation",function()
                index=index+1
                local site=sites[index]
                if not site then return true end
                api=areaSession
                if not api then return true end
                -- A building a vanilla map or flyer names is the map path's
                -- to decide (as a map-named place), never this scan's, so it
                -- is decided once and as one kind of place.
                if not site.excluded and #(candidates and candidates[site.id] or {})>=1 and not decided[site.id]
                    and not mapSites().byArea[site.id] then
                    local place=AreaPlace.of(hints[site.id],rooms[site.id])
                    if place then
                        local ok,ids=api.addArea{site=site,place=place,clues=Manifest.clues,
                            version=Manifest.VERSION,hours=worldHours(),source="nearby"}
                        if ok then
                            CFLog.write("i","case",{case=site.id,place=place,n=#ids,why="area-decided"})
                        elseif ids=="empty" then
                            -- Normal while the clue list has nothing for this
                            -- kind of place: said once per site per session.
                            if not emptyNoted[site.id] then
                                emptyNoted[site.id]=true
                                CFLog.write("d","skip",{case=site.id,place=place,why="area-empty"})
                            end
                        elseif ids~="decided" then
                            log("area "..tostring(site.id).." ("..place..") not decided: "..tostring(ids))
                        end
                    end
                end
                return false
            end)
        end,reachable)
        if not scan then preparing=false; log("nearby storage scan refused: "..tostring(why)); return end
        scheduler.enqueue("storage","preparation",scan)
    end)
end
function R.decideNearby(force)
    if not allowed() or not scheduler or not wrapper then return false,"not running" end
    if preparing then return false,"busy" end
    if not areaSession then return false,"no world record" end
    if scheduler.isDisabled and scheduler.isDisabled("preparation") then return false,"disabled" end
    local p=getPlayer and getPlayer()
    if not p then return false,"no player" end
    local now=worldHours()
    if lastDecide and not force then
        local dx,dy=p:getX()-lastDecide.x,p:getY()-lastDecide.y
        local moved=dx*dx+dy*dy>=R.DECIDE_TILES*R.DECIDE_TILES
        -- A clock that went backwards restarts the wait; it never counts as
        -- the wait being over (phase 5 review).
        if now<lastDecide.hours then lastDecide.hours=now end
        local waited=now>=lastDecide.hours+R.DECIDE_HOURS
        if not moved and not waited then return false,"wait" end
    end
    local root=worldRoot()
    local seed=root and root.case and root.case.seed
    if type(seed)~="number" then return false,"no world seed" end
    local probe=require("NHShared/T3Nearby")
    local ok,why=probe.start(nil,seed)
    lastDecide={x=p:getX(),y=p:getY(),hours=now}
    if not ok then return false,why end
    preparing=true
    local waited=0
    local queued=scheduler.enqueue("area-metadata","preparation",function()
        waited=waited+1
        if probe.error then preparing=false; error(probe.error) end
        if probe.result then decideFrom(probe.result); return true end
        if waited>240000 then preparing=false; error("metadata extraction did not complete") end
        return false
    end)
    -- A refused job never runs, so nothing else would ever clear the flag.
    if not queued then preparing=false; return false,"busy" end
    return true
end
-- DECIDING A MAP-MARKED PLACE (task 3 plan, step 4). When a map is read, all
-- its marks' places are decided (source "read"); when the survivor comes
-- within R.MAP_NEAR_TILES of any such place, map read or not, it is decided
-- too (source "near"). What a place receives is fixed by the world (its seed,
-- the static list of maps marking it, the clue list): reading only changes
-- WHEN it is decided, never what it holds.
--
-- One addArea per scheduler step, as the nearby scan does: every addArea
-- copies and validates the whole world record.
R.MAP_NEAR_TILES=100
local mapQueue,mapQueued={},{}
-- The maps marking a place, each once, in the static order MapSites gives.
local function designsOf(entry)
    local out,seen={},{}
    for _,m in ipairs(entry.marks or {}) do
        local d=m.design or (m.print and "print:"..m.print)
        if d and not seen[d] then seen[d]=true; out[#out+1]=d end
    end
    return out
end
-- The site row the world record keeps, in the Catalog's shape. Nothing was
-- observed there, so its storage is "unknown" (Session.unobserved).
local function mapSiteRow(entry)
    local b=entry.bounds
    return {id=entry.areaId,areaId=entry.areaId,
        name="Place named on a map at "..math.floor((b.x1+b.x2)/2)..", "..math.floor((b.y1+b.y2)/2),
        mapId=MapSites.map,buildLine=MapSites.game,
        bounds={x1=b.x1,y1=b.y1,x2=b.x2,y2=b.y2,z=b.z},
        source={kind="map-research",reference=entry.reference},
        paperStorage="unknown",containerTypes={},excluded=false}
end
local function decidedAreas()
    local out={}
    local root=worldRoot()
    for _,a in ipairs(root and root.case and root.case.areas or {}) do out[a.id]=true end
    return out
end
local function mapDrain()
    local item=table.remove(mapQueue,1)
    if not item then return true end
    mapQueued[item.entry.areaId]=nil
    local api=areaSession
    if not api then return #mapQueue==0 end
    local entry=item.entry
    local designs=designsOf(entry)
    local ok,ids=api.addArea{site=mapSiteRow(entry),place=entry.place,designs=#designs>0 and designs or nil,
        clues=Manifest.clues,version=Manifest.VERSION,hours=worldHours(),source=item.source}
    if ok then
        CFLog.write("i","case",{case=entry.areaId,place=entry.place,n=#ids,why="area-decided-"..item.source})
    elseif ids=="empty" then
        if not emptyNoted[entry.areaId] then
            emptyNoted[entry.areaId]=true
            CFLog.write("d","skip",{case=entry.areaId,place=entry.place,why="area-empty"})
        end
    elseif ids~="decided" then
        log("map place "..tostring(entry.areaId).." not decided: "..tostring(ids))
    end
    return #mapQueue==0
end
function R.decideMapArea(entry,source)
    if not allowed() or not scheduler or not wrapper then return false,"not running" end
    if not areaSession then return false,"no world record" end
    if type(entry)~="table" or type(entry.areaId)~="string" or mapSites().byArea[entry.areaId]~=entry then
        return false,"not a map place"
    end
    if mapQueued[entry.areaId] then return false,"queued" end
    if decidedAreas()[entry.areaId] then return false,"decided" end
    mapQueue[#mapQueue+1]={entry=entry,source=source=="read" and "read" or "near"}
    mapQueued[entry.areaId]=true
    scheduler.enqueue("map-areas","map-areas",mapDrain)
    return true
end
-- A map was read: every place it marks.
function R.decideMapDesign(design,source)
    local n=0
    for _,entry in ipairs(mapSites().byDesign[design] or {}) do
        if R.decideMapArea(entry,source) then n=n+1 end
    end
    return n
end
-- The survivor is near: every undecided map or flyer place within reach.
-- Looks only at the nine grid cells around the survivor.
function R.decideMapNear()
    if not allowed() or not scheduler or not areaSession then return 0 end
    local p=getPlayer and getPlayer()
    if not p then return 0 end
    local px,py=p:getX(),p:getY()
    local index=mapSites()
    local bx,by=math.floor(px/MAP_BUCKET),math.floor(py/MAP_BUCKET)
    local decided=decidedAreas()
    local n=0
    for dx=-1,1 do for dy=-1,1 do
        for _,e in ipairs(index.buckets[(bx+dx)..":"..(by+dy)] or {}) do
            if not decided[e.areaId] and not mapQueued[e.areaId] and not emptyNoted[e.areaId] then
                local b=e.bounds
                local ox=math.max(b.x1-px,0,px-(b.x2-1))
                local oy=math.max(b.y1-py,0,py-(b.y2-1))
                if ox*ox+oy*oy<=R.MAP_NEAR_TILES*R.MAP_NEAR_TILES and R.decideMapArea(e,"near") then n=n+1 end
            end
        end
    end end
    return n
end
-- The world record's seed, or nil when this save has no world record. The map
-- trails take their seed from it (MapMediaRuntime).
function R.worldSeed()
    local root=worldRoot()
    local seed=root and root.case and root.case.seed
    if type(seed)=="number" then return seed end
    return nil
end
-- The address book builds in the background; anything it could not name before
-- it finished deserves a second chance, once.
local addressBookWasReady=false
local function refreshAddressCache()
    local map=NHShared.AddressMap
    local ready=map and map.ready and map.ready()==true
    if ready and not addressBookWasReady then addressCache={} end
    addressBookWasReady=ready
end

-- The world record's case, read-only, or nil (KeyObserver's area lookup).
function R.worldCase()
    local root=worldRoot()
    return root and root.case or nil
end
function R.known()
    refreshAddressCache()
    if not wrapper or not sessions then return {} end
    local byId={}
    for _,api in ipairs(sessions) do for _,row in ipairs(api.project()) do byId[row.id]=row end end
    local rows={}; for _,id in ipairs(Cases.discoveries(wrapper)) do if byId[id] then rows[#rows+1]=byId[id] end end; return rows
end
-- `inPlace` records a document without taking it. Owner, 2026-09-10: a right
-- click should note it without putting it in the inventory - which is plainly right for a pile of eleven credit cards
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
    if root and root.case then for _,candidate in ipairs(sessions) do if candidate.snapshot().case.caseId==root.case.caseId then api=candidate end end end
    local a=api and api.assignment(md.cfGeneratedId)
    if not a or md.cfPhysicalToken~=a.physicalToken or a.status=="conflict" then return false end
    -- Only a recognised clue can be noted (P4-R132): spotted in Search Mode or
    -- looked over first.
    if not R.isRecognisedId(md.cfGeneratedId) then return false end
    -- A positively observed surviving item can reconcile an uncertain intent.
    -- Known before this inspection? PlayerVoice's once-per-thing memory lives
    -- only while the game runs, so after a reload re-inspecting old evidence
    -- announced its connection again (audit follow-up, 2026-09-15).
    local already=false
    for _,known in ipairs(api.snapshot().known or {}) do if known==md.cfGeneratedId then already=true end end
    -- WHERE IT LAY. A clue noted in place is never picked up, so the marker
    -- module's pickup wraps never see it and no finding location is recorded -
    -- no map mark, however many pens the survivor carries (owner, 2026-09-18).
    -- Taken here, from the clue's own square, and before the discovery is
    -- committed: ClueMarkers refuses a location for a clue already known.
    if inPlace then
        local markers=require("NHShared/InteractionAPI").ClueMarkers
        if markers and markers.foundHere then pcall(markers.foundHere,item) end
    end
    checked(api.status(md.cfGeneratedId,"placed",worldHours())); checked(api.inspect(md.cfGeneratedId))
    -- The item in hand shows as Evidence however it reached the hand.
    pcall(function() item:setDisplayCategory(categoryOf(md.cfGeneratedId)) end)
    local ledger=NHShared.DiscoveryLog
    if ledger and ledger.record then ledger.record("evidence",md.cfGeneratedId) end
    -- A pile is one document and many identical things; the count is the
    -- whole of the evidence, so it is worth a beat, the first time only.
    local voice=require("NHShared/InteractionAPI").PlayerVoice
    if voice and voice.onPile and not already then
        for _,doc in ipairs(api.snapshot().case.documents) do
            if doc.id==md.cfGeneratedId then
                if doc.quantity then pcall(voice.onPile,doc.id) end
                break
            end
        end
    end
    -- Hovering a document you have already read should say so, without having
    -- to open the organiser to find out which of the four you are holding. The
    -- item already carries its real title as its name, so this only needs to
    -- confirm the record has it.
    --
    -- Set on INSPECTION and never before. A tooltip on an undiscovered
    -- document would let a player find every clue by hovering, which would
    -- replace the investigation with a sweep of the furniture.
    pcall(function() item:setTooltip("Tooltip_NHShared_Recorded") end)
    return true
end
function R.subject(item)
    if not sessions or not item then return false end
    local md=item:getModData(); local root=md and Cases.find(wrapper,md.cfGeneratedId)
    local a=root and root.assignments and root.assignments[md.cfGeneratedId]
    return a and md.cfPhysicalToken==a.physicalToken and a.status~="conflict"
end
-- RECOGNITION (P4-R132, docs/design/SEARCH_TO_FIND.md). A clue is placed as the
-- plain game item it is, and becomes evidence - its title, the Evidence
-- category, the Inspect option - only once the survivor recognises it: spotted
-- in Search Mode, or looked over in hand. The flag lives in the case record, not
-- on the item, so it survives relocation and every copy of a pile shares it.
-- Anything noted is recognised; a finished case's evidence always is.
local function liveApi(id)
    if not sessions or not wrapper or type(id)~="string" then return nil end
    local root=Cases.find(wrapper,id)
    if not root or not root.case then return nil end
    for _,api in ipairs(sessions) do
        -- The stored root, not a snapshot: this runs from menus and ticks, and a
        -- snapshot deep-copies the whole case.
        if api.caseId==nil then api.caseId=api.snapshot().case.caseId end
        if api.caseId==root.case.caseId then return api,root end
    end
    return nil
end
function R.isRecognisedId(id)
    if type(id)~="string" then return false end
    if not wrapper then return false end
    local root=Cases.find(wrapper,id)
    if not root then return false end
    for _,known in ipairs(root.known or {}) do if known==id then return true end end
    for _,seen in ipairs(root.recognised or {}) do if seen==id then return true end end
    return false
end
function R.isRecognised(item)
    if not item then return false end
    local ok,md=pcall(function() return item:getModData() end)
    if not ok or type(md)~="table" or not md.cfGeneratedId then return false end
    return R.isRecognisedId(md.cfGeneratedId)
end
-- Title and category on one copy. `copy`/`of` name a pile's copies.
local function stampRecognised(item,doc,id,copy,of)
    if not item or not doc then return end
    local name=doc.title
    if of and of>1 and doc.label then name=doc.label.." ("..copy.." of "..of..")" end
    pcall(function() item:setName(name); item:setCustomName(true) end)
    pcall(function() item:setDisplayCategory(categoryOf(id)) end)
end
-- Every copy of document `id` the runtime can reach now: the survivor's
-- inventory and bags (three deep, as restampEvidence walks) and the container
-- the case placed it in. Returns how many were stamped.
local function stampReachable(id,root)
    local doc
    for _,d in ipairs(root and root.case and root.case.documents or {}) do if d.id==id then doc=d end end
    if not doc then return 0 end
    local of=doc.quantity or 1
    local n,seen=0,{}
    local function walk(container,depth)
        if not container or depth>3 or seen[container] then return end
        seen[container]=true
        local ok,items=pcall(function() return container:getItems() end)
        if not ok or not items then return end
        for i=0,items:size()-1 do
            local item=items:get(i)
            local okM,md=pcall(function() return item:getModData() end)
            if okM and type(md)=="table" and md.cfGeneratedId==id then
                n=n+1; stampRecognised(item,doc,id,n,of)
            end
            -- Asked only of items that have the method: an engine call that
            -- throws inside pcall is still logged as an error by the game.
            local inner=item and item.getInventory and item:getInventory()
            if inner then walk(inner,depth+1) end
        end
    end
    local player=getPlayer and getPlayer()
    if player then walk(player:getInventory(),0) end
    local a=root.assignments and root.assignments[id]
    if a and a.target then
        local ok,container=pcall(World.resolve,a.target,a.physicalToken)
        if ok and container then walk(container,0) end
    end
    return n
end
-- Recognise a clue: an item carrying it, or its document id. `how` is "search"
-- (spotted in Search Mode), "look" (looked over in hand) or "debug" (checks).
-- Returns true when the clue is recognised afterwards, and whether this call
-- was the one that recognised it.
-- The Search Mode icon has pointed at this clue (ClueSearch.addIcon): record
-- it, so the clue never moves again.
function R.shown(id)
    if not allowed() or not sessions or type(id)~="string" then return false end
    local api=liveApi(id)
    if not api or not api.show then return false end
    return api.show(id)
end
function R.recognise(target,how)
    if not allowed() or not sessions then return false,"no case" end
    local id=target
    if type(target)~="string" then
        local ok,md=pcall(function() return target:getModData() end)
        id=ok and type(md)=="table" and md.cfGeneratedId or nil
    end
    if type(id)~="string" then return false,"not a clue" end
    local api,root=liveApi(id)
    if not api then return false,"not a live clue" end
    if R.isRecognisedId(id) then return true,false end
    local ok,why=api.recognise(id,how)
    if not ok then return false,tostring(why) end
    -- The commit swapped the wrapper; stamp from the stored root now in it.
    root=Cases.find(wrapper,id) or root
    local stamped=stampReachable(id,root)
    CFLog.write("i","recognised",{doc=id,how=tostring(how or "?"),n=stamped})
    return true,true
end
-- Where each live clue is, for Search Mode (ClueSearch). Plain rows read from
-- the stored case, no copies of the case text.
local function integerish(n) return type(n)=="number" and n==math.floor(n) end
function R.clueTargets()
    if not allowed() or not wrapper or not sessions then return {} end
    local out={}
    for _,root in ipairs(Cases.sessions(wrapper) or {}) do
        if root.assignments then
            local known,seen={},{}
            for _,id in ipairs(root.known or {}) do known[id]=true; seen[id]=true end
            for _,id in ipairs(root.recognised or {}) do seen[id]=true end
            for id,a in pairs(root.assignments) do
                local t=a.target
                -- A clue still waiting for somewhere to go has no target and no
                -- coordinates at all, and is skipped here rather than handed on
                -- as nil x,y,z (P4-R133, P4-R134). Every row this returns can be
                -- pinned somewhere.
                if type(t)=="table" and integerish(t.x) and integerish(t.y) and integerish(t.z) then
                    local vehicle=type(t.vehiclePart)=="string"
                    local carrier=type(t.carrierMark)=="string"
                    -- `place` names the container (the car's part, or the body)
                    -- for the wordless cue's once-per-place rule; `token` and
                    -- `part` find a car wherever it has been driven, and `mark`
                    -- finds a carrier wherever it has walked (P4-R134).
                    out[#out+1]={id=id,x=t.x,y=t.y,z=t.z,status=a.status,recognised=seen[id]==true,
                        resolved=known[id]==true,
                        vehicle=vehicle,carrier=carrier,case=root.case and root.case.caseId,token=a.physicalToken,
                        part=vehicle and t.vehiclePart or nil,target=t,
                        mark=carrier and t.carrierMark or nil,
                        carrierKind=carrier and t.carrierKind or nil,
                        place=(carrier and ("carrier:"..t.carrierMark))
                            or (vehicle and ("vehicle:"..tostring(a.physicalToken)))
                            or (t.x..":"..t.y..":"..t.z..":"..tostring(t.objectIndex)..":"..tostring(t.containerIndex))}
                end
            end
        end
    end
    return out
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
    -- addressFor is the one address lookup in this file: it asks the book once
    -- per building, remembers a refusal as well as an answer (an address book
    -- that is failing was being asked again for every rebuilt row - 52 caught
    -- errors in fifteen seconds, fault check 2026-09-12), strips the "t3:"
    -- prefix itself, and qualifies the town on the way out rather than freezing
    -- it (AD-10). This had its own copy of that cache, which froze the town.
    local addressOf=addressFor
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
                local where=addressOf(a.locationId or siteOf[id]) or "address unknown"
                if t then
                    out[#out+1]=string.format("%s  %s  %s,%s floor %s  [%s]",
                        tostring(id),where,tostring(t.x),tostring(t.y),tostring(t.z),tostring(a.status))
                else
                    -- A clue waiting for a container, or dropped (P4-R133):
                    -- there is no drawer to send the owner to, only the site
                    -- it is meant for and how long it has waited.
                    out[#out+1]=string.format("%s  %s  waiting since hour %s  [%s]",
                        tostring(id),where,tostring(a.deferredHours),tostring(a.status))
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
function R.metrics()
    if not scheduler then return nil end
    return {peakMs=scheduler.peakMs,
        -- Steps run and jobs waiting, per subsystem. See Scheduler.counts.
        steps=scheduler.counts and scheduler.counts() or nil,
        queued=scheduler.queued and scheduler.queued() or nil}
end
-- Bounded scan of a destination site's own bounding box for any container of
-- an allowed type. Mirrors Storage.scan's tile-stepping discipline, but the
-- box is small (one catalog location) and already known, so no rectangle
-- list is needed. Never resumes across relocation attempts; a fresh scan
-- starts once per chosen destination site.
-- `accept` is OPTIONAL: when given, a container it refuses is stepped over and
-- the scan carries on, so the filler can skip a container another clue already
-- holds (P4-R67) without a second kind of scan. Omitted, this is exactly the
-- scan relocation has always used.
-- A mailbox stands at the gate, in no room and outside the footprint, so this
-- walks the site's own rectangle WIDENED by Session.OUTDOOR_RADIUS - the same
-- band Storage.scan offers a mailbox from at creation, and the same box
-- Session.target accepts one in. Only that kind is taken from the widened part:
-- a clue never lands in something in the street that merely happens to be near
-- a house (P4-R134, fixed 2026-09-18).
--
-- `searchedOk`: a No Help area clue may take a container the survivor searched
-- earlier (FixedContainers.fresh); the open loot window still refuses. Within
-- a place the spot is the world's seeded choice (StorageChoices.choose), with
-- no layout order (owner, 2026-09-27: "clues sit at random").
local function boundsScan(site,done,accept,salt,searchedOk)
    local b=site.bounds
    local kinds={}; for _,kind in ipairs(site.containerTypes) do kinds[kind]=true end
    -- A place decided from afar (a map's mark) observed nothing: any fixed
    -- kind will do, each still checked live below (Session.unobserved).
    local any=Session.unobserved(site)
    local margin=(any or kinds[Storage.MAILBOX]) and Session.OUTDOOR_RADIUS or 0
    local x1,y1,x2,y2=b.x1-margin,b.y1-margin,b.x2+margin,b.y2+margin
    local x,y,objects,oi,ci=x1,y1,nil,0,0
    local pool=StorageChoices.new()
    return function()
        if y>=y2 then
            local list=StorageChoices.finish(pool)
            local i=StorageChoices.choose(list,salt or site.id,function(n)
                return not accept or accept(list[n])
            end)
            done(i and list[i]); return true
        end
        if objects==nil then
            local square=getCell():getGridSquare(x,y,b.z)
            objects=square and square:getObjects() or false
            oi,ci=0,0
        end
        if not objects or oi>=objects:size() then
            objects=nil; x=x+1
            if x>=x2 then x=x1; y=y+1 end
            return false
        end
        local o=objects:get(oi)
        if not o or not o.getContainerCount or ci>=o:getContainerCount() then oi=oi+1; ci=0; return false end
        local c=o:getContainerByIndex(ci)
        local sprite=o:getSprite(); local name=sprite and sprite:getName()
        local inside=x>=b.x1 and x<b.x2 and y>=b.y1 and y<b.y2
        if c and name and Storage.fixedKind(c:getType()) and (any or kinds[c:getType()]) and (inside or c:getType()==Storage.MAILBOX) then
            local found={x=x,y=y,z=b.z,objectIndex=oi,containerIndex=ci,containerType=c:getType(),sprite=name}
            local fresh=FixedContainers.fresh(c,searchedOk)
            if fresh and (not accept or accept(found)) and World.resolve(found)==c then
                StorageChoices.offer(pool,found)
            end
        end
        ci=ci+1
        return false
    end
end
-- Every physical spot a clue already holds, in any case (P4-R67). Above the
-- relocation job, which also asks it; the filler's note on it is below.
local function usedPhysicalKeys()
    local keys={}
    -- A finished case has no assignments left (retirement drops them), so a
    -- retired case contributes nothing here: its containers are free again,
    -- which is also what the ladder's third rung trades on.
    for _,root in ipairs(Cases.sessions(wrapper) or {}) do
        for _,a in pairs(root.assignments or {}) do
            if a.target then keys[Session.physicalKey(a.target)]=true end
        end
    end
    return keys
end
-- OPEN GROUND FOR A CLUE (task 3 plan, step 2/4; owner, 2026-09-27: clues may
-- lie "anywhere that is interesting"). Nothing offered ground before, so a
-- ground clue waited forever. The rules are GroundSpots'; this reads the facts
-- they ask for from the engine, lazily and each under pcall, so a square that
-- fails an early rule costs no more calls.
--
-- The box is the site's bounds widened by Session.OUTDOOR_RADIUS (the same
-- band Session.target accepts a ground spot in), clamped to 44 x 44. Squares
-- are tried in the world's hash order, at most GroundSpots.MAX_TRIES per
-- attempt; the next attempt carries on from where this one stopped (a
-- session-only cursor, wrapping). The zombie list is read once per scan.
--
-- Engine calls used (Build 42, verified against projectzomboid.jar with javap
-- and, where vanilla Lua uses them, against its Lua):
--   IsoCell:getGridSquare, IsoCell:getZombieList (the original mod's CasePerson)
--   IsoGridSquare:TreatAsSolidFloor/isSolid/isSolidTrans (ISTransferAction
--     :canDropOnFloor, docs/research/B42_RUNTIME_PASSABILITY.md)
--   IsoGridSquare:isOutside (ISPlowAction), :getDoor(north) (ISMoveableSpriteProps)
--   IsoGridSquare:isCouldSee(int)/isCanSee(int) (javap: public boolean,
--     playerIndex; vanilla ISDestroyCursor, ISBaseIcon foraging), and
--     IsoPlayer:getPlayerNum (ISScytheGrassCursor)
-- A dark room is no reason any more (owner, 2026-09-27): the player's own
-- light finds a loose floor clue there, like foraging.
-- `keys` = {spent=, used=}: physical keys that may not take a clue.
local groundCursor={}
local ZOMBIE_READ_MAX=2000   -- zombies read from the cell list, at most
local function groundFacts(x,y,z,key,keys,zombies,survivor)
    local square,looked=nil,false
    local function sq()
        if not looked then
            looked=true
            local ok,s=pcall(function() return getCell():getGridSquare(x,y,z) end)
            square=ok and s or nil
        end
        return square
    end
    local function ask(fn)
        local s=sq(); if not s then return nil end
        local ok,v=pcall(fn,s)
        if ok then return v end
        return nil
    end
    local readers={
        exists=function() return sq()~=nil end,
        z=function() return ask(function(s) return s:getZ() end) end,
        floor=function() return ask(function(s) return s:TreatAsSolidFloor() end)==true end,
        solid=function() return ask(function(s) return s:isSolid() or s:isSolidTrans() end)~=false end,
        outside=function() return ask(function(s) return s:isOutside() end)==true end,
        door=function() return ask(function(s) return s:getDoor(true)~=nil or s:getDoor(false)~=nil end)==true end,
        -- The survivor could be looking at it: same floor, within the guard
        -- radius, and the square visible to them. An unreadable answer
        -- counts as visible (StaleClue.outOfSight).
        nearSurvivor=function()
            if survivor==nil then return false end
            local spot={x=x,y=y,z=z}
            if not StaleClue.tooClose(survivor.x,survivor.y,survivor.z,spot) then return false end
            local visible=ask(function(s) return s:isCouldSee(survivor.n) or s:isCanSee(survivor.n) end)
            return not StaleClue.outOfSight(survivor.x,survivor.y,survivor.z,spot,visible)
        end,
        zombies=function() return GroundSpots.zombiesNear(zombies,x,y) end,
    }
    return setmetatable({key=key,spent=keys and keys.spent,used=keys and keys.used,wantZ=z},{__index=function(t,k)
        local read=readers[k]
        if not read then return nil end
        local v=read()
        if v==nil then v=false end
        rawset(t,k,v)
        return v
    end})
end
local function groundScan(site,done,accept,salt,keys)
    local b=site.bounds
    local box=GroundSpots.box(b,Session.OUTDOOR_RADIUS)
    local seed=R.worldSeed() or 0
    local docId=tostring(salt or site.id)
    local start=groundCursor[docId] or 0
    local tries,found,refused,seen=0,nil,{},{}
    local zombies,survivor
    local function finish()
        groundCursor[docId]=(start+tries)%(GroundSpots.MAX_TRIES*GroundSpots.MAX_ROUNDS)
        done(found,refused)
        return true
    end
    return function()
        if not zombies then
            -- Once per scan: the zombies near the box, and where the survivor is.
            zombies={}
            local reach=GroundSpots.CROWD_RADIUS
            pcall(function()
                local list=getCell():getZombieList()
                local n=list and list:size() or 0
                for i=0,math.min(n,ZOMBIE_READ_MAX)-1 do
                    local zed=list:get(i)
                    if zed then
                        local zx,zy=math.floor(zed:getX()),math.floor(zed:getY())
                        if zx>=box.x1-reach and zx<box.x2+reach and zy>=box.y1-reach and zy<box.y2+reach then
                            zombies[#zombies+1]={x=zx,y=zy}
                        end
                    end
                end
            end)
            local p=getPlayer and getPlayer()
            if p then
                pcall(function() survivor={x=math.floor(p:getX()),y=math.floor(p:getY()),z=math.floor(p:getZ())} end)
                if survivor then pcall(function() survivor.n=p:getPlayerNum() end) end
            end
            return false
        end
        if tries>=GroundSpots.MAX_TRIES or found then return finish() end
        tries=tries+1
        local x,y=GroundSpots.square(seed,site.id,docId,start+tries,box)
        if not x then return finish() end
        local key="ground:"..x..":"..y..":"..b.z
        if seen[key] then return false end
        seen[key]=true
        local facts=groundFacts(x,y,b.z,key,keys,zombies,survivor)
        local ok,why=GroundSpots.check(facts)
        if ok then
            local target={x=x,y=y,z=b.z,objectIndex=0,containerIndex=0,containerType=Session.GROUND_CONTAINER,
                sprite=GroundSpots.label(facts),ground=true}
            if not accept or accept(target) then found=target
            else refused.accept=(refused.accept or 0)+1 end
        else
            refused[why]=(refused[why] or 0)+1
        end
        return false
    end
end
R.groundScan=groundScan
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
            -- One clue, one move per attempt, never a batch. Reading a map
            -- starts no clock (owner, 2026-09-27).
            local stale=StaleClue.staleIds(root,hours)
            for _,candidate in ipairs(stale) do
                -- A pile does not relocate. Relocation is built on there being
                -- exactly one item carrying the token (T4/T5: loss over
                -- duplication), and moving a hoard would mean moving every
                -- copy without a yield. A quantity is a fact about a place
                -- anyway; carrying it somewhere else would be a different
                -- claim, not the same clue in a new drawer.
                -- An object SET is the exception (owner, 2026-09-27, No
                -- Help): its pieces mean something only together, so it moves
                -- whole, every piece in one step, or not at all.
                if StaleClue.canAttempt(root.assignments[candidate])
                    and (expectedCount(api,candidate)==1 or isObjectSet(api,candidate)) then id=candidate; break end
            end
            if not id then return true end
        end
        local a=root.assignments[id]
        if not a or a.status~="placed" then return true end
        -- A clue on a carrier does not relocate (P4-R134). Relocation gives a
        -- clue one new home when the survivor never came looking; a body is
        -- where the world left it, and taking the note out
        -- of a dead man's jacket to put it in a drawer would undo the find the
        -- whole decision exists for. Its answer to going stale is expiry.
        if Session.isMobile(a.target) and type(a.target.carrierMark)=="string" then return true end
        if not StaleClue.canAttempt(a) then return true end
        local hours=worldHours()
        -- A clue the Search Mode icon has shown never moves (owner, 2026-09-27).
        if type(root.shown)=="table" and root.shown[id] then return true end
        if not StaleClue.isStale({status=a.status,placedHours=a.placedHours,id=id},root.known,hours) then return true end
        oldContainer=oldContainer or World.resolve(a.target)
        if not oldContainer then return true end -- nothing safe to verify against
        local p=getPlayer()
        local px,py,pz=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
        if StaleClue.tooClose(px,py,pz,a.target) then return false end
        if not site then
            local candidates=StaleClue.destinations(root,Visited.set(),id)
            if #candidates==0 then
                log("[CF-G2-RELOCATE] "..id..": no unvisited candidate; leaving in place")
                return true
            end
            site=candidates[1]
            -- Only a spot the Session would take: the clue's own kind, not
            -- one another clue holds, never a spot that gave up a clue.
            -- Offering anything else was refused only AFTER the pieces had
            -- moved.
            local moving; for _,d in ipairs(root.case.documents) do if d.id==id then moving=d end end
            local taken=usedPhysicalKeys()
            local spentKeys=type(root.spent)=="table" and root.spent or {}
            local accept=function(candidate)
                local k=Session.physicalKey(candidate)
                return not taken[k] and not spentKeys[k] and Session.intentMatches(moving,candidate)
            end
            if moving and moving.spot=="ground" then
                scan=groundScan(site,function(t) target=t end,accept,id,{spent=spentKeys,used=taken})
            else
                scan=boundsScan(site,function(t) target=t end,accept,id,Session.isArea(root))
            end
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
            tokenScan=tokenScan or World.count(oldContainer,a.physicalToken,function(n) tokenCount=n; tokenDone=true end,expectedCount(api,id))
            tokenScan(); if not tokenDone then return false end
        end
        if not carryDone then
            carryScan=carryScan or World.count(p:getInventory(),a.physicalToken,function(n) carryCount=n; carryDone=true end)
            carryScan(); if not carryDone then return false end
        end
        if not StaleClue.canRelocate(tokenCount,carryCount,expectedCount(api,id)) then
            log("[CF-G2-RELOCATE] "..id..": guard refused (original="..tostring(tokenCount)..", carried="..tostring(carryCount)..")")
            return true
        end
        if not newItem then
            local doc; for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
            local destination=World.resolve(target)
            if not destination then log("[CF-G2-RELOCATE] "..id..": destination changed before placement; leaving in place"); return true end
            -- Every piece of the clue is rebuilt before any old piece is
            -- removed: one item for a single clue, all of them for a set.
            newItem={}
            for _,member in ipairs(evidenceMembers(doc)) do
              for _=1,member.quantity do
                local carrier=assert(require("NHShared/Generated/EvidenceKinds").get(member.kind))
                local piece=assert(instanceItem(carrier.fullType),"could not create relocated evidence item")
                local md=piece:getModData()
                md.cfGeneratedId=id; md.cfPhysicalToken=a.physicalToken
                -- Relocation RECREATES the item, and used to set the name here
                -- and nothing else - so a relocated document reverted to its
                -- script's own category and appeared as "Literature" in the middle
                -- of a session (owner, 2026-09-13, at 101 4th St). Same stamp as
                -- first placement now, from one function, so a third creation path
                -- cannot drift the same way.
                -- Still a plain item unless the survivor had already recognised
                -- it (P4-R132).
                if R.isRecognisedId(id) then stampEvidence(piece,doc.title)
                else Kinds.nameAsVanillaCard(piece,doc) end
                applyWear(piece,member)
                writePages(piece,doc,root.case)
                newItem[#newItem+1]=piece
              end
            end
            newDestination=destination
        end
        -- T4/T5 policy is loss over duplication, and it is not merely a
        -- preference here: two items sharing one cfPhysicalToken make the
        -- periodic identity scan mark the document "conflict", which is
        -- sticky, so the clue would be dead permanently and Inspect would
        -- refuse it forever. Remove the verified old pieces first; the new
        -- pieces are already built and detached, and the removes and adds
        -- below run with no yield between them.
        -- A set weighs more than the single item a destination was chosen
        -- for. Ask first, and leave the clue where it is if there is no room:
        -- refusing here keeps it whole, where a refused add below loses it.
        do
            local weight=0
            for _,piece in ipairs(newItem) do
                local okW,w=pcall(function() return piece:getWeight() end)
                weight=weight+((okW and tonumber(w)) or 0)
            end
            local okRoom,room=pcall(function() return newDestination:hasRoomFor(p,weight) end)
            if okRoom and room==false then
                log("[CF-G2-RELOCATE] "..id..": no room for "..#newItem.." piece(s) at the destination; leaving in place")
                return true
            end
        end
        local items=oldContainer:getItems()
        local old={}
        for i=0,items:size()-1 do
            local it=items:get(i); local md=it and it:getModData()
            if md and md.cfPhysicalToken==a.physicalToken then old[#old+1]=it end
        end
        for _,it in ipairs(old) do oldContainer:Remove(it) end
        -- Whole or not at all, on the way in too: if any piece is refused, the
        -- pieces that did land are taken back out, so a set is never split
        -- into two half-sets carrying one token.
        local added,landed=true,{}
        for _,piece in ipairs(newItem) do
            if newDestination:AddItem(piece) then landed[#landed+1]=piece else added=false; break end
        end
        if not added then
            for _,piece in ipairs(landed) do pcall(function() newDestination:Remove(piece) end) end
            -- The old copy is already gone. Record the honest uncertainty
            -- rather than leaving canonical state claiming a placed item.
            checked(api.status(id,"unknown"))
            log("[CF-G2-RELOCATE] "..id..": destination refused the item after removal; marked unknown")
            return true
        end
        checked(api.relocate(id,target,hours))
        local cue=require("NHShared/InteractionAPI").ClueCue
        if cue and cue.invalidate then cue.invalidate(id) end
        log("[CF-G2-RELOCATE] relocated "..id.." to "..target.x..","..target.y..",floor "..target.z)
        return true
    end
end
-- THE FILLER (P4-R133, docs/design/CASE_PACING.md). A case that went live with
-- only the clues that fit keeps the rest as an open order; this is what fills
-- it, one clue per attempt, one job per session, on the same tick dispatch as
-- relocation. `Storage.scan` only ever sees loaded squares, so ordinary
-- movement is what makes the room: a house catalogued from the street yields
-- one or two candidates and eight once the survivor walks in.
--
-- Every guard is checked fresh on each attempt: the clue is still deferred,
-- its own site is where it goes, the container is not one any other clue
-- already holds (P4-R67, live cases and finished ones alike), and the survivor
-- is not standing next to it. Nothing is ever said to the player: a clue
-- appearing is exactly as quiet as a clue placed at creation.
-- A CARRIER FOR A CLUE WITH NOWHERE TO GO (P4-R134). Fixed containers are a
-- finite resource near a settled player - that is the whole of P4-R133's fault
-- - and carriers are not: the bodies in the street replenish themselves, and
-- every zombie the survivor kills adds one. So when no free container is loaded at a waiting clue's
-- own site, the filler looks for a carrier there instead.
--
-- The mod never spawns one. Every guard is checked fresh: the carrier is not
-- already carrying a clue (its mark is the distinctness key, P4-R67), the
-- survivor has not already searched it, its loot window is not open, it is
-- inside the site's footprint as S.target will demand, the case has no mobile
-- clue yet (S.MOBILE_PER_CASE), and the survivor is not standing next to it.
-- `hint` is a No Help clue's optional outfit class: among the bodies in reach
-- one dressed that way is preferred, and no body is refused for its clothes.
local function carrierScanFor(site,found,hint)
    local b=site.bounds
    local r=Session.CARRIER_RADIUS
    local reach=math.max(b.x2-b.x1,b.y2-b.y1)+r
    return Carriers.scan(math.floor((b.x1+b.x2)/2),math.floor((b.y1+b.y2)/2),b.z,reach,found,
        function(entry)
            return entry.x>=b.x1-r and entry.x<b.x2+r and entry.y>=b.y1-r and entry.y<b.y2+r and entry.z==b.z
        end,hint)
end
-- A late-bound transport finding waits for a real vehicle part at its authored
-- address.  This is observation, not scene manufacture: no vehicle is spawned,
-- moved or renamed, and a missing vehicle leaves the clue deferred.
local function vehicleCandidateFor(site,taken)
    local b=site.bounds
    local cx=math.floor((b.x1+b.x2)/2)
    local cy=math.floor((b.y1+b.y2)/2)
    local reach=math.max(b.x2-b.x1,b.y2-b.y1)+Session.VEHICLE_RADIUS
    local choices={}
    local okScene,sceneRuntime=pcall(require,"NHShared/VanillaSceneRuntime")
    for _,entry in ipairs(World.vehiclesNear(cx,cy,b.z,reach,8)) do
        if entry.x>=b.x1-Session.VEHICLE_RADIUS and entry.x<b.x2+Session.VEHICLE_RADIUS
            and entry.y>=b.y1-Session.VEHICLE_RADIUS and entry.y<b.y2+Session.VEHICLE_RADIUS then
            local script=entry.vehicle.getScriptName and entry.vehicle:getScriptName() or "vehicle"
            local signature=okScene and sceneRuntime.matchVehicle
                and sceneRuntime.matchVehicle(entry.x,entry.y,entry.z,tostring(script)) or nil
            for _,part in ipairs(entry.parts) do
                local target={x=entry.x,y=entry.y,z=entry.z,objectIndex=0,containerIndex=0,
                    containerType=Session.VEHICLE_CONTAINER,sprite=tostring(script),vehiclePart=part.part,
                    sceneSignature=signature}
                local key=Session.physicalKey(target)
                if signature and Session.target(target,site) and not taken[key] then
                    choices[#choices+1]={target=target,key=key}
                end
            end
        end
    end
    table.sort(choices,function(a,b) return a.key<b.key end)
    return choices[1] and choices[1].target or nil
end
-- Where each session's filler is in its turn order; the closure below is
-- rebuilt every attempt, so this must live outside it (Session.pick).
local fillCursor=setmetatable({},{__mode="k"})
-- A clue that must go in a vehicle: an old transport scene, or a No Help clue
-- whose spot is a vehicle.
-- DECIDE EARLY, CREATE ON ARRIVAL (owner, 2026-09-27): which clues a place
-- holds is decided and saved early, but nothing is created at a place until
-- the survivor is within R.ARRIVE_TILES of its bounds - "nothing sits at a
-- place before the player comes". Inside that ring a closed container may be
-- filled at any distance (nobody sees into it; its open loot window refuses);
-- open ground and a body only where the survivor cannot see the square, on
-- another floor, or beyond StaleClue's guard radius (StaleClue.outOfSight).
R.ARRIVE_TILES=40
-- How far the survivor is from a site's bounds (Chebyshev, 0 inside), or nil
-- when there is no survivor to measure from.
local function survivorDistance(site)
    local p=getPlayer and getPlayer()
    local b=site and site.bounds
    if not p or not b then return nil end
    local px,py=p:getX(),p:getY()
    local ox=math.max(b.x1-px,0,px-(b.x2-1))
    local oy=math.max(b.y1-py,0,py-(b.y2-1))
    return math.floor(math.max(ox,oy))
end
local function farFromSurvivor(site)
    local d=survivorDistance(site)
    return d~=nil and d>R.ARRIVE_TILES
end
-- NEAREST AREAS FIRST (task 3 plan, step 4 part 2). The waiting clues whose
-- area the survivor has arrived at (within R.ARRIVE_TILES), nearest first
-- (ties in document order), each with its distance. `onlyArea` keeps one
-- area's clues (the arrival trigger). Without a survivor, all of them.
local function nearestWaiting(root,waiting,onlyArea)
    local sites={}
    for _,s in ipairs(root.case.locations or {}) do sites[s.id]=s end
    local rows={}
    for i,wid in ipairs(waiting) do
        local a=root.assignments[wid]
        local s=a and sites[a.locationId]
        local d=s and survivorDistance(s)
        if s and (onlyArea==nil or s.id==onlyArea) and (d==nil or d<=R.ARRIVE_TILES) then
            rows[#rows+1]={id=wid,d=d or 0,i=i}
        end
    end
    table.sort(rows,function(x,y) if x.d~=y.d then return x.d<y.d end return x.i<y.i end)
    local ids,dist={},{}
    for k,r in ipairs(rows) do ids[k]=r.id; dist[r.id]=r.d end
    return ids,dist
end
-- May a clue appear on this ground or body spot now? (StaleClue.outOfSight:
-- another floor, beyond the guard radius, or a square the survivor cannot
-- see.) Engine answers are read under pcall; unreadable counts as visible.
local function hiddenFromSurvivor(target)
    local p=getPlayer and getPlayer()
    if not p or type(target)~="table" then return true end
    local px,py,pz=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    if not StaleClue.tooClose(px,py,pz,target) then return true end
    local visible
    pcall(function()
        local n=p:getPlayerNum()
        local square=getCell():getGridSquare(target.x,target.y,target.z)
        if square then visible=square:isCouldSee(n) or square:isCanSee(n) end
    end)
    return StaleClue.outOfSight(px,py,pz,target,visible)
end
R.hiddenFromSurvivor=hiddenFromSurvivor
local function wantsVehicle(doc)
    return doc~=nil and (doc.placementIntent=="vehicle" or doc.spot=="vehicle")
end
-- `onlyArea` (optional): one attempt for that area's clues only - the arrival
-- trigger's attempt, run the moment the survivor enters the area's ring.
local function filler(api,onlyArea)
    local id,site,scan,target,bodyScan,carrier,indexed,doc,distance,groundWhy,areaClue
    -- A clue that could not be placed this attempt, said with where it is
    -- and how far the survivor is from its area.
    local function miss(why)
        CFLog.write("d","skip",{doc=id,area=site and site.id,distance=distance,why=why})
    end
    return function()
        local hours=worldHours()
        -- The whole case is read ONCE per attempt, not once per step: a
        -- snapshot copies the case, and the steps after this one wait for the
        -- survivor to move or for the scan to reach the next square.
        if not id then
            local root=api.snapshot()
            -- A clue that has waited three in-game days is dropped, and that
            -- is the whole of this attempt: the case then completes on the
            -- clues it got rather than squatting an active slot.
            local expired=Session.expiredIds(root,hours)
            if #expired>0 then
                local ok,why=api.drop(expired[1])
                if ok then
                    CFLog.write("i","stale",{doc=expired[1],why="expired",n=#expired})
                else log("could not drop a waiting clue: "..tostring(why)) end
                return true
            end
            local planned=onlyArea and {} or Session.indexedIds(root)
            local waiting=Session.deferredIds(root)
            if #planned==0 and #waiting==0 then return true end
            indexed=#planned>0
            -- Indexed plans first, as before; within a list, the next one in
            -- turn, so a clue that cannot go anywhere yet does not hold the
            -- rest of the case behind it. Waiting clues are served nearest
            -- area first, only where the survivor has arrived; the cursor
            -- still turns over them.
            local dist
            if not indexed then
                waiting,dist=nearestWaiting(root,waiting,onlyArea)
                if #waiting==0 then
                    -- Nothing is created at a place before the survivor
                    -- arrives (owner, 2026-09-27); its clues stay decided.
                    declinePlacement("no waiting clue's area has the survivor arrived at")
                    return true
                end
            end
            areaClue=Session.isArea(root)
            id,fillCursor[api]=Session.pick(indexed and planned or waiting,fillCursor[api])
            distance=dist and dist[id]
            for _,s in ipairs(root.case.locations) do
                if s.id==root.assignments[id].locationId then site=s end
            end
            for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
            if not site then return true end
            if not indexed and farFromSurvivor(site) then
                declinePlacement("the area of "..tostring(id).." is far from the survivor")
                return true
            end
            if not indexed then
                local taken=usedPhysicalKeys()
                -- Within a place the spots are the world's seeded choice, in
                -- no layout order (owner, 2026-09-27).
                local accept=function(candidate)
                    return not taken[Session.physicalKey(candidate)] and Session.intentMatches(doc,candidate)
                end
                if wantsVehicle(doc) then
                    target=vehicleCandidateFor(site,taken)
                elseif doc and doc.spot=="ground" then
                    -- Open ground (GroundSpots): checked squares in the
                    -- world's order, never a spot that gave up a clue, never
                    -- one the survivor could be looking at.
                    scan=groundScan(site,function(t,refused)
                        target=t
                        if not t then
                            local parts={}
                            for why,n in pairs(refused or {}) do parts[#parts+1]=why.."="..n end
                            table.sort(parts)
                            groundWhy=table.concat(parts,",")
                        end
                    end,accept,id,{spent=type(root.spent)=="table" and root.spent or {},used=taken})
                elseif not (doc and doc.spot=="corpse") then
                    -- A clue only takes its own kind of spot (No Help: a
                    -- mailbox clue only a mailbox, a furniture clue only
                    -- furniture); Session.assign refuses anything else, so a
                    -- container of the wrong kind is never even chosen.
                    -- A drawer searched earlier may take a No Help clue.
                    scan=boundsScan(site,function(t) target=t end,
                        function(candidate)
                            return not taken[Session.physicalKey(candidate)] and Session.intentMatches(doc,candidate)
                        end,id,areaClue)
                end
            end
        end
        local a=api.assignment(id)
        if not a or (a.status~="deferred" and a.status~="indexed") then return true end
        if indexed then
            local why
            target,_,why=FixedContainers.resolve(a.planned)
            if not target then
                if why=="unloaded" then
                    -- NAMED, NOT SILENT. An indexed plan whose square is not loaded
                    -- waits for the player to arrive; that is correct, and until
                    -- 2026-09-24 it was invisible - the filler returned here every
                    -- step with no word, and three native runs reported the PPE
                    -- hoard as "indexed, 0 items" with nothing to say why. The
                    -- answer is "waiting for the square to load", and now it says so.
                    declinePlacement("indexed plan for "..tostring(id).." waits for square "
                        ..tostring(a.planned and a.planned.x)..","..tostring(a.planned and a.planned.y)
                        .." to load")
                    return true
                end
                local ok,unplanWhy=api.unplan(id,hours)
                if not ok then log("could not fall back from an indexed target: "..tostring(unplanWhy)) end
                CFLog.write("d","skip",{doc=id,why="index-"..tostring(why)})
                return true
            end
        end
        if not target and scan then
            if scan() then
                -- Nothing loaded and free at that site: a carrier next, which
                -- is the one place that does not run out (P4-R134).
                if not target then scan=nil end
            else return false end
        end
        if not target then
            if wantsVehicle(doc) then
                -- Named: the fitness audit (20260924T191606) stood at this
                -- clue's site for two minutes and could only report
                -- "last reason: none". A clue that wants a vehicle waits for
                -- a confirmed one at its site, and now says so.
                declinePlacement("no confirmed vehicle at the site for "..tostring(id))
                miss("no-confirmed-vehicle")
                return true
            end
            -- A No Help clue that names a spot other than a body waits for a
            -- spot of its own kind, and a body is never its fallback.
            if doc and doc.spot~=nil and doc.spot~="corpse" then
                declinePlacement("no free "..tostring(doc.spot).." spot at the area for "..tostring(id))
                if doc.spot=="ground" and groundWhy and groundWhy~="" then
                    CFLog.write("d","skip",{doc=id,area=site.id,distance=distance,refused=groundWhy,why="no-ground"})
                else miss("no-"..tostring(doc.spot)) end
                return true
            end
            -- A body clue of the world record is not held to the one-mobile-
            -- clue-per-case cap: the whole world is one record.
            if not (doc and doc.spot=="corpse") and not Session.mobileAllowed(api.snapshot(),id) then
                -- Debug, not info: this is the ordinary state of an open order
                -- and would otherwise be a line every two seconds. Named all
                -- the same (Log.declines), so a check standing at the site can
                -- say why nothing came (core loop 20260924T223914 could not).
                declinePlacement("no free container at the site for "..tostring(id).." and no carrier allowed")
                CFLog.write("d","skip",{doc=id,why="no-containers"}); return true
            end
            if not bodyScan then bodyScan=carrierScanFor(site,function(entry) carrier=entry end,doc and doc.outfit) end
            if not carrier then
                if bodyScan() then
                    if not carrier then
                        declinePlacement("no free container at the site for "..tostring(id).." and no body nearby to carry it")
                        CFLog.write("d","skip",{doc=id,why="no-containers"}); return true
                    end
                else return false end
            end
            -- A body is in the open: never where the survivor could see it.
            if not hiddenFromSurvivor(carrier) then return false end
            local mark=Carriers.newMark(carrier.x,carrier.y,carrier.z,hours)
            local claimed,whyNot=Carriers.claim(carrier,mark)
            if not claimed then
                CFLog.write("d","skip",{doc=id,why="carrier-"..tostring(whyNot or "refused")})
                carrier=nil; return false
            end
            target={x=carrier.x,y=carrier.y,z=carrier.z,objectIndex=0,containerIndex=0,
                containerType=Session.CARRIER_CONTAINER,sprite=carrier.kind,
                carrierKind=carrier.kind,carrierMark=mark,outfit=carrier.outfit}
        end
        -- Nothing materialises in the survivor's sight. Open ground and a
        -- body: another floor, beyond the guard radius, or a square they
        -- cannot see. A closed container (furniture, mailbox, vehicle) at any
        -- distance: nobody sees into it, and its open loot window refuses
        -- below. The old case kind keeps the plain guard radius.
        local open=target.ground==true or target.containerType==Session.GROUND_CONTAINER
            or target.containerType==Session.CARRIER_CONTAINER or type(target.carrierMark)=="string"
        if not areaClue or open then
            local p=getPlayer()
            local hidden
            if areaClue then hidden=hiddenFromSurvivor(target)
            else hidden=not (p and StaleClue.tooClose(math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ()),target)) end
            if not hidden then return false end
        end
        local destination=World.resolve(target)
        if not destination then return true end
        local fresh,why=FixedContainers.fresh(destination,areaClue)
        if not fresh then
            if indexed then api.unplan(id,hours) end
            CFLog.write("d","skip",{doc=id,why="container-"..tostring(why)})
            return true
        end
        local ok,why=api.assign(id,target,hours)
        if not ok then log("could not place a waiting clue: "..tostring(why)); return true end
        -- The ordinary placement job writes the item, exactly as it does for a
        -- clue placed at creation: one path that creates evidence, not two.
        scheduler.enqueue("place:"..id,"placement",placement(api,id))
        CFLog.write("i","placed",{doc=id,place=addressFor(a.locationId),
            at=target.x..","..target.y..","..target.z,why="instalment"})
        return true
    end
end
-- THE ARRIVAL TRIGGER (owner, 2026-09-27: create on arrival). When the
-- survivor enters the ring of an area whose clues still wait, one filler
-- attempt for that area is queued at once, nearest area first, instead of
-- waiting for the regular pass every 120 ticks. Checked every
-- R.ARRIVE_CHECK_TICKS on the stored world record (no snapshot copy). An area
-- counts as entered once per stay in its ring; leaving and coming back
-- enters it again.
R.ARRIVE_CHECK_TICKS=30
local inRing={}
local function arrivals()
    local api=areaSession
    local root=worldRoot()
    if not api or not scheduler or not root or type(root.assignments)~="table" then return 0 end
    local sites={}
    for _,site in ipairs(root.case and root.case.locations or {}) do sites[site.id]=site end
    local waitingAt={}
    for _,a in pairs(root.assignments) do
        if a.status=="deferred" and type(a.locationId)=="string" then waitingAt[a.locationId]=true end
    end
    local now,rows={},{}
    for areaId in pairs(waitingAt) do
        local d=sites[areaId] and survivorDistance(sites[areaId])
        if d~=nil and d<=R.ARRIVE_TILES then
            now[areaId]=true
            if not inRing[areaId] then rows[#rows+1]={id=areaId,d=d} end
        end
    end
    inRing=now
    table.sort(rows,function(x,y) if x.d~=y.d then return x.d<y.d end return x.id<y.id end)
    local n=0
    for _,row in ipairs(rows) do
        if scheduler.enqueue("arrive:"..row.id,"filler",filler(api,row.id)) then
            n=n+1
            CFLog.write("d","case",{case=row.id,distance=row.d,why="arrived"})
        end
    end
    return n
end
R.arrivals=arrivals
-- A CARRIER THAT IS GONE (P4-R134). A body burns, a body is buried, a car is
-- wrecked: the clue is then somewhere nobody will ever reach. It
-- shares P4-R133's expiry to the hour - three in-game days and it is dropped,
-- the case completes on the clues it got, and no record ever claims the
-- document is lost (P4-R104).
--
-- "Gone" is only ever concluded where we could actually have looked: the
-- survivor must be within the carrier search radius of where the clue went in.
-- A carrier in an unloaded cell is not a carrier that is gone, and the hour is
-- cleared the moment it turns up again. One clue per attempt, one job per
-- session, beside the filler.
-- Exposed as R.carrierWatch for test/carrier_timer.lua: the fault was in the
-- arguments this passes to api.missing, and only a test that reads those
-- arguments can hold it. A source-text check cannot.
local function carrierWatch(api)
    return function()
        local root=api.snapshot()
        local hours=worldHours()
        local gone=Session.missingIds(root,hours)
        if #gone>0 then
            local ok,why=api.dropMissing(gone[1],hours)
            if ok then
                CFLog.write("i","stale",{doc=gone[1],why="carrier-gone",n=#gone})
            else log("could not drop a clue whose carrier is gone: "..tostring(why)) end
            return true
        end
        local p=getPlayer and getPlayer()
        if not p then return true end
        local px,py,pz=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
        for _,d in ipairs(root.case.documents) do
            local a=root.assignments[d.id]
            local t=a and a.target
            if t and Session.isMobile(t) and a.status~="conflict" and pz==t.z
                and math.max(math.abs(px-t.x),math.abs(py-t.y))<=Carriers.FIND_RADIUS then
                local ok,container=pcall(World.resolve,t,a.physicalToken)
                local found=ok and container~=nil
                -- `found and nil or hours` yielded the hour on BOTH branches (Lua: `true and
                -- nil` is nil, then `nil or hours` is hours), so the clear-the-timer
                -- branch was unreachable and a carrier standing right here stayed
                -- marked missing until its clue was dropped. The decision now lives in
                -- Session.missingMark, where a plain Lua test can hold it (P4-R141).
                local wrote,why=api.missing(d.id,Session.missingMark(found,hours))
                if not wrote then log("could not note a carrier's whereabouts: "..tostring(why)) end
                return true
            end
        end
        return true
    end
end
R.carrierWatch=carrierWatch
local function trackVisited()
    local house=currentHouse()
    if not house then return true end
    Visited.record(house)
    -- Recognition, not direction. This fires only once the player is INSIDE a
    -- building an already-discovered document named - a step earlier it would
    -- be a quest marker, which is the one thing this mod does not do. A lead
    -- the player has not read yet says nothing at all.
    local voice=require("NHShared/InteractionAPI").PlayerVoice
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
-- certainty this record exists to avoid. After a reload we say so.
--
-- The scan covers the player, two tiles around them, their vehicle, and the
-- container the document was originally placed in. Absence therefore means
-- "not anywhere we can currently see", never "destroyed" - which is why the
-- wording is about uncertainty rather than loss.
sightings={}
-- Every engine call guarded: a document can be in a container whose parent has
-- gone, on a square that has streamed out, or held by an object that does not
-- answer the call at all. None of that should cost the player their record.
local function rd(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
end
-- IS THIS CONTAINER A CARRIER - a body (P4-R134, P4-R136)? A body's inventory
-- answers the container type "none", so the record read `accounted In a none at
-- 102 Dewey St.` (campaign 20260917T234706). Two answers, in the order of what
-- we know best:
--   * the case's own target, which is where the clue was put and which kind of
--     carrier took it;
--   * failing that, the container's owner, which is all a FINISHED case has
--     left once retirement has dropped its assignments. `getParent` on a
--     body's inventory is how IdentityObserver has named a corpse since
--     2026-09-08.
-- nil means "not a carrier", never "not sure".
-- IS THIS CONTAINER A BODY'S? The one question the world itself can answer,
-- asked of the object that owns the container. `getParent` on a body's
-- inventory is how IdentityObserver has named a corpse since 2026-09-08.
local function carrierByOwner(container)
    local owner=container and rd(container,"getParent")
    -- A body, and only a body (P4-R136). A living zombie's inventory can hold
    -- no clue of ours any more, so there is no zombie arm here to reach.
    if owner and instanceof and instanceof(owner,"IsoDeadBody") then return Carriers.CORPSE end
    return nil
end
local function carrierOf(item,container)
    local md=rd(item,"getModData")
    local id=type(md)=="table" and md.cfGeneratedId or nil
    if type(id)=="string" and sessions then
        for _,api in ipairs(sessions) do
            local ok,a=pcall(api.assignment,id)
            local t=ok and type(a)=="table" and a.target
            if type(t)=="table" and type(t.carrierMark)=="string" and Carriers.KINDS[t.carrierKind] then
                return t.carrierKind
            end
        end
    end
    return carrierByOwner(container)
end
-- Where a document actually is, in words a survivor would use. "Close by" was
-- vague where we were not: the scan holds the item itself, so it can say
-- whether it is carried, in something, or on the floor - and the address book
-- can usually name the building. Vagueness is for what we cannot know.
placeOf=function(item)
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
        address=addressFor(tostring(id))
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
    local Words=require("NHShared/ContainerWords")
    -- A BODY IS ASKED ABOUT BEFORE ANY CONTAINER TYPE (P4-R134, P4-R136). A
    -- body's inventory does declare a type of its own - `inventorymale` or
    -- `inventoryfemale`, whose title the game itself translates as "Corpse" -
    -- so asking the type first read `In a corpse at 105 Hill St.` in a real
    -- game (20260918T055418-body-carrier.txt). It is a body, and a survivor
    -- writes "On a body at 105 Hill St." This asks the OWNER, which is what the
    -- container is now, rather than the case's own target, which is where the
    -- clue was put: a clue the survivor has since moved into a cupboard must
    -- read as being in that cupboard.
    local onBody=carrierByOwner(container)
    if onBody then return Words.carrier(onBody,address) end
    if kind and kind~="floor" then
        -- Words, not the type id: this said "In a shelves" (ContainerWords).
        local title
        if getText then
            local key="IGUI_ContainerTitle_"..tostring(kind)
            local ok,text=pcall(getText,key)
            if ok and type(text)=="string" and text~="" and text~=key then title=text end
        end
        local phrase=Words.phrase(tostring(kind),title)
        if phrase then return address and (phrase.." at "..address..".") or (phrase..".") end
        -- The type said nothing usable ("none"): a container that never
        -- declared a type. A carrier gets its own words (P4-R134) - the case's
        -- own target is asked here, which is all a FINISHED case has left once
        -- retirement has dropped its assignments; anything else says what it
        -- honestly knows - that the clue is inside something, and where - and
        -- never that it is lost (P4-R104).
        local carrier=carrierOf(item,container)
        if carrier then return Words.carrier(carrier,address) end
        return address and ("In something at "..address..".") or "In something close by."
    end
    return address and ("On the floor at "..address..".") or "On the ground."
end
-- Five consecutive misses, at one scan per 120 ticks. Long enough that walking
-- through a doorway does not make the record doubt itself.
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
    for _,d in ipairs(snapshot.case.documents) do expected[d.id]=Session.pieceCount(d) end
    local scan=World.identityScan(getPlayer(),snapshot.assignments,function(r) found=r; done=true end,expected)
    return function()
        if not done then scan(); return false end
        for id,items in pairs(found) do
          -- A clue still waiting for a container, or dropped, was never in the
          -- world: the scan finding nothing says nothing about it, and a
          -- record that called it uncertain would be claiming to have looked
          -- (P4-R133).
          local waiting=snapshot.assignments[id]
          waiting=waiting and (waiting.status=="deferred" or waiting.status=="dropped")
          if not waiting then
            -- The category is not saved with an item, so a clue in an area
            -- that streamed out and back lost it while its case was live
            -- (campaign check, 2026-09-15). The scan that finds it restores it.
            -- Only for a recognised clue: an unrecognised one stays the plain
            -- item it looks like (P4-R132).
            if R.isRecognisedId(id) then
                for _,it in ipairs(items) do pcall(function() it:setDisplayCategory(categoryOf(id)) end) end
            end
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
        end
        return true
    end
end
require("NHShared/Events/EngineEvents").on("OnTick", function()
    if not scheduler or not allowed() then return end
    ticks=ticks+1
    -- The living player carries a mark so their body is never chosen to carry
    -- a clue (Carriers.PLAYER_MARK); cheap and idempotent, and it covers a new
    -- character after a death without an event of its own.
    if ticks%120==0 then pcall(Carriers.stampPlayer,getPlayer and getPlayer()) end
    -- The survivor arriving at a place creates its clues now, not at the
    -- next regular pass.
    if sessions and ticks%R.ARRIVE_CHECK_TICKS==0 then
        local ok,err=pcall(arrivals)
        if not ok then log("arrival check failed: "..tostring(err)) end
    end
    if sessions and ticks%120==0 then
        enqueue(); for i,api in ipairs(sessions) do scheduler.enqueue("identity:"..i,"identity",identity(api)) end
        for i,api in ipairs(sessions) do scheduler.enqueue("relocate:"..i,"relocation",relocation(api)) end
        -- Beside relocation, and bounded the same way: one job per session,
        -- one waiting clue per attempt (P4-R133).
        for i,api in ipairs(sessions) do scheduler.enqueue("fill:"..i,"filler",filler(api)) end
        -- And the carrier watch, the same shape: one job per session, one clue
        -- per attempt (P4-R134).
        for i,api in ipairs(sessions) do scheduler.enqueue("carrier:"..i,"carrier",carrierWatch(api)) end

        scheduler.enqueue("visited-building","tracking",trackVisited)
        -- The map marks and the address book, once the player exists.
        if not servicesStarted then servicesStarted=startServices() end
        -- Decide the interesting places nearby. It waits on its own for the
        -- survivor to move on or for time to pass, so asking often is cheap.
        local ok,err=pcall(R.decideNearby)
        if not ok then log("deciding nearby areas failed: "..tostring(err)) end
        -- And the places vanilla maps and flyers name, as the survivor nears
        -- them; a queue left by a reopened scheduler is picked up again.
        ok,err=pcall(R.decideMapNear)
        if not ok then log("deciding map places failed: "..tostring(err)) end
        if #mapQueue>0 then scheduler.enqueue("map-areas","map-areas",mapDrain) end
    end
    scheduler.step()
end)
-- setDisplayCategory is a RUNTIME property: the custom name is saved with the
-- item and the category is not, so reloading a save dropped every document
-- back into Junk (owner, 2026-09-13). Re-stamped on load, for anything still
-- carrying our marker. Walks bags too, because the evidence album is a container and
-- that is where the evidence actually lives.
local function restampEvidence(container,depth)
    if not container or (depth or 0)>3 then return 0 end
    local items=container.getItems and container:getItems()
    if not items then return 0 end
    local n=0
    for i=0,items:size()-1 do
        local item=items:get(i)
        local md=item and item.getModData and item:getModData()
        -- Recognised clues only (P4-R132); the campaign is open by now, so a
        -- retired case's evidence is Old at once (P4-R118).
        if type(md)=="table" and md.cfGeneratedId and R.isRecognisedId(md.cfGeneratedId) then
            pcall(function() item:setDisplayCategory(categoryOf(md.cfGeneratedId)) end)
            n=n+1
        end
        local inner=item and item.getInventory and item:getInventory()
        if inner then n=n+restampEvidence(inner,(depth or 0)+1) end
    end
    return n
end

require("NHShared/Events/EngineEvents").on("OnGameStart", function()
    sessions,scheduler,preparing,wrapper,areaSession=nil,nil,false,nil,nil
    lastDecide=nil; emptyNoted={}; servicesStarted=false
    mapQueue,mapQueued={},{}; inRing={}
    -- Forget what we could see last time. A new session has not looked yet,
    -- and should say so rather than inherit yesterday's confidence.
    sightings={}
    if not allowed() then return end
    -- Open this save's world record, creating it the first time. A save whose
    -- store cannot be read (an old generated case from an earlier build) is
    -- refused with a line in the log, never a crash.
    local ok,started,why=pcall(R.bootstrap)
    if not ok or not started then
        scheduler=nil
        log("World record refused: "..tostring(ok and why or started))
    end
    -- After the campaign is open, so recognition can be read (P4-R132).
    pcall(function()
        local player=getPlayer and getPlayer()
        local n=player and restampEvidence(player:getInventory(),0) or 0
        if n>0 then log("re-stamped "..n.." documents as Evidence after loading") end
    end)
end)
R.loaded=true
return R
