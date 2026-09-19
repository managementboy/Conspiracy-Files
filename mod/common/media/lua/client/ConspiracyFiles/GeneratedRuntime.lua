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
local Carriers=require("ConspiracyFiles/Carriers")
local Visited=require("ConspiracyFiles/VisitedBuildingLog")
local Reachability=require("ConspiracyFiles/ReachabilityAdapter")
require("ConspiracyFiles/DiscoveryLog")
ConspiracyFiles=ConspiracyFiles or {}
local R=ConspiracyFiles.GeneratedRuntime or {}
ConspiracyFiles.GeneratedRuntime=R
if R.loaded then return R end
local sessions,scheduler,wrapper,ticks,preparing
-- Rows of retired cases. They have no Session to project from, but the player
-- learned them and FILES must still render them.
local retiredRows={}
-- Every document of every archived case, rows or not (P4-R111): what marks a
-- clue Evidence / Old and answers "already in the organiser".
local retiredIds={}
-- What the last refusal of a new case owed the player (P4-R133), and where and
-- when a later case last found nothing usable nearby (P4-R125). One record:
-- the wait P4-R125 asks for is one property of a refusal, not a separate fact.
--   code,count,sinceHours,dueHours,rung  the debt; mirrored into the case
--                                        store's schedule slot so a reload
--                                        does not reset the count
--   atHours                              when this code was last counted
--   x,y,waitHours                        only for a refusal that came from a
--                                        nearby scan: the 50 tiles / half hour
--                                        the survivor must move on. In memory
--                                        only, so loading a save clears the
--                                        wait but not the debt (P4-R125).
local debt=nil
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
    local map=ConspiracyFiles.AddressMap
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
local TAG="ConspiracyFiles.Generated.G2"
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("case","note",message) end
local function allowed()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
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
-- and find blank contradicts the record the organiser keeps of it, and the
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
-- A finished case's evidence is Old. Owner, 2026-09-15, after finding two clues
-- of a completed case in the house with no Investigation option at all: "We
-- should change the category to Evidence / Old" (P4-R118). The loot list then
-- says the item belongs to a closed case. Same rules as Evidence: a
-- translation key (IGUI_ItemCat_EvidenceOld) and a runtime property, so every
-- place that stamps a category asks this instead of assuming Evidence.
-- Asked of every archived case, not only the ones that still carry rows: the
-- oldest lose their bulk to the archive cap (P4-R111) and their clues are
-- still lying in drawers around Muldraugh. A clue whose case no longer has a
-- row must still say Evidence / Old and still say it is already recorded,
-- because that missing menu is exactly what read as broken in play.
local function retiredId(id)
    if not id then return false end
    return retiredIds[id]==true
end
local function categoryOf(id) return retiredId(id) and "EvidenceOld" or "Evidence" end

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
        -- A clue with no container yet is the filler's business, not this job's
        -- (P4-R133); a dropped one is nobody's.
        if a.status=="deferred" or a.status=="dropped" then return true end
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
            -- No title and no category here (P4-R132): the plain item, until
            -- the survivor recognises it (R.recognise).
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
-- Retired rows, re-read from the stored wrapper. A last-seen write changes
-- only these, so it refreshes them without reopening every live session.
local function refreshRetired()
    retiredRows={}; retiredIds={}
    for _,root in ipairs(Cases.sessions(wrapper) or {}) do
        if Retired.isRetired(root) then
            -- `rows` is absent once a case is deep-archived; `known` is still
            -- every document it placed, and that is what marks the items.
            for _,row in ipairs(root.rows or {}) do retiredRows[#retiredRows+1]=row; retiredIds[row.id]=true end
            for _,id in ipairs(root.known or {}) do retiredIds[id]=true end
        end
    end
end
-- HONEST REFUSALS (P4-R133, docs/design/CASE_PACING.md).
--
-- A refusal used to be a sentence in a log line, so nothing could count them,
-- nothing could act on them, and nothing could say when the next case was due.
-- One long campaign run refused seventeen times and never delivered a second
-- case, and the mod said nothing at all. Now every refusal carries:
--   * a code from the closed set (SuccessiveCases.DEFER_CODES),
--   * a per-code count, which resets when the reason changes,
--   * dueHours, the in-game hour by which the next case IS expected, and
--   * the rung of the ladder the count has earned.
-- The count and rung are written into the case store's schedule slot, so they
-- survive a reload. Nothing of this reaches the player: no voice line, no
-- marker, no hint. The world simply thins out.
local REFUSALS_PER_RUNG=Cases.REFUSALS_PER_RUNG
R.RUNG_MAX=Cases.MAX_RUNG
-- A repeated refusal of the same code inside this much in-game time is the
-- same refusal still standing, not a new one: it neither counts nor writes to
-- the save. Without it a ten-second poll would count a standing wait a hundred
-- times an hour and validate the whole store each time - which is the fault
-- P4-R125 was written to fix, in a new place.
R.DEBT_GAP_HOURS=0.25
-- The in-game clock as the reader sees it, for the log's `due` field.
local function hhmm(h)
    if type(h)~="number" or h~=h or h==math.huge then return nil end
    local minutes=math.floor(h*60+0.5)%1440
    return string.format("%02d:%02d",math.floor(minutes/60),minutes%60)
end
-- When the next case is expected, AND IT IS ALWAYS A TIME IN THE FUTURE.
--
-- This used to return `math.max(now,last+gap)` for every code but `cooldown`,
-- and the generator is only ever ASKED once the gap has passed - so
-- `last+gap<=now`, the promised hour WAS the current hour, and a fresh
-- `no-containers` refusal was overdue a minute later (evidence
-- 20260918T045250-promise.txt, FAIL "the refusal promised 02:10 and it is
-- already 02:11"). A promise that cannot be kept cannot be broken either, so
-- P4-R133's "past the promised hour it is a failure" meant nothing at all, and
-- prove.py's promise-overdue mutation could not be caught because the clean
-- code already behaved as the bug.
--
-- Every refusal now promises the wait that actually applies to it, measured
-- from now, and no case can arrive before the ordinary gap either - so the
-- promise is the later of the two:
--   * `cooldown` is P4-R125's own wait still standing: its end, half an
--     in-game hour, is the whole of the promise.
--   * `no-containers` and `no-reach` impose that same wait (the generator is
--     not asked again until the survivor has moved about fifty tiles or half
--     an hour has passed), so it is their floor too.
--   * every other code - the cap, the active limit, `disabled`, and the
--     ordinary `gap` - waits for the gap measured from the last case created,
--     which is exactly what AutomaticInvestigations waits for, and never for
--     an hour already gone.
-- The rule itself is pure and lives in the domain module (Cases.dueHours); this
-- is only what the runtime knows that the rule needs.
local function dueFor(code,now)
    local auto=ConspiracyFiles.AutomaticInvestigations
    local gap=(auto and auto.config and auto.config.minGapHours) or 24
    local schedule=wrapper and wrapper.schedule
    local last=schedule and schedule.createdHours and schedule.createdHours[#schedule.createdHours]
    return Cases.dueHours(code,now,R.DEFER_HOURS,gap,last)
end
local function rememberDebt()
    if not wrapper or not wrapper.schedule then return end
    local staged,why=Cases.setDefer(wrapper,debt and {code=debt.code,count=debt.count,
        sinceHours=debt.sinceHours,dueHours=debt.dueHours,rung=debt.rung} or nil)
    if not staged then log("refusal not recorded: "..tostring(why)); return end
    -- A refusal must never throw: the debt is bookkeeping, and a save that
    -- refuses the write is already saying something louder.
    local ok,err=pcall(swap,staged)
    if not ok then log("refusal not recorded: "..tostring(err)) end
end
-- Refusals per code, so an interleaved `busy` cannot reset the count that the
-- ladder reads. Only the standing refusal's own count is written to the save;
-- the rest are this session's, which is what P4-R125 already assumed.
local refusals={}
-- Two codes are never counted. A `cooldown` is the wait we imposed ourselves
-- (P4-R125) and `busy` is a placement in progress: neither is the world
-- failing to supply a case, and counting a ten-second poll would walk the
-- ladder up for nothing. Both are still logged, once per occurrence.
local COUNTED={["no-reach"]=true,["no-containers"]=true,cap=true,["active-limit"]=true,disabled=true}
-- The rung the ladder has reached: the highest any one code has earned. A
-- property of the generator, not of one refusal, so a different code refusing
-- in between never lowers it back.
local function rungNow()
    local rung=0
    for _,r in pairs(refusals) do
        rung=math.max(rung,math.min(R.RUNG_MAX,math.floor(r.count/REFUSALS_PER_RUNG)))
    end
    return rung
end
function R.rung() return rungNow() end
-- THE REASON FOR THE SILENCE, counted or not. `debt` is what the save owes -
-- only a counted code writes that - and `silence` is the last reason a case did
-- not come, which is what a reader asking "why is nothing happening?" needs.
-- Before this, an uncounted code was logged and nothing else, so
-- automaticStatus().why was nil in exactly the states a long save sits in.
local silence
-- `wait` marks the refusals that came from a nearby scan: those, and only
-- those, make the next attempt wait for the survivor to move on (P4-R125).
-- `dueAt` is for a caller that knows when it is waiting until better than
-- dueFor does (the poller's extra hour after a case finished, P4-R121).
local function refuse(code,wait,dueAt)
    assert(Cases.DEFER_CODES[code],"unknown refusal code "..tostring(code))
    local now=worldHours()
    if type(dueAt)~="number" or dueAt~=dueAt or dueAt==math.huge or dueAt==-math.huge then dueAt=nil end
    local record={code=code,count=0,sinceHours=now,rung=rungNow(),
        dueHours=dueAt or dueFor(code,now)}
    local counted=false
    if COUNTED[code] then
        local r=refusals[code]
        counted=not r or (now-r.atHours)>=R.DEBT_GAP_HOURS or now<r.atHours
        if counted then
            r=r or {count=0,sinceHours=now}
            r.count=r.count+1; r.atHours=now; refusals[code]=r
        end
        record.count=r.count; record.sinceHours=r.sinceHours; record.rung=rungNow()
        if wait then
            local p=getPlayer()
            record.x=p and p:getX(); record.y=p and p:getY(); record.waitHours=now
        elseif debt and debt.x then
            -- A standing wait is not cancelled by some other refusal happening.
            record.x,record.y,record.waitHours=debt.x,debt.y,debt.waitHours
        end
        debt=record
    else
        -- Never counted, never written to the save: a cooldown, a placement in
        -- progress and the ordinary gap between cases are all our own pacing
        -- rather than the world failing to supply a case, and all three are
        -- polled every ten seconds. The standing count is reported so the line
        -- still says how much is owed.
        record.count=debt and debt.count or 0
    end
    silence=record
    CFLog.write(counted and "i" or "d","defer",
        {why=code,n=record.count,rung=record.rung,due=hhmm(record.dueHours)})
    if counted then rememberDebt() end
    return false,code
end
-- WHY NO CASE CAME, from the one place that decides whether to ask for one
-- (P4-R133). AutomaticInvestigations.poll had five silent early returns, so
-- "no case came" was still entirely unexplained - including `active=4/4`, the
-- state a long save actually sits in. This gives the poller's own silence a
-- code from the same closed set and the same `ev=defer` line. It changes
-- nothing about WHEN a case is created.
function R.deferPoll(code,dueAt)
    if not allowed() then return false,"debug single-player required" end
    return refuse(code,false,dueAt)
end
-- A case arrived: nothing is owed and the ladder starts from the bottom again.
local function clearDebt()
    debt=nil; refusals={}; silence=nil
end
-- What the save still owes, after a reload (P4-R133). The count and the rung
-- come back; the wait does not - a load clears the wait, which is what P4-R125
-- decided and what the player expects after coming back to the game.
local function restoreDebt()
    debt=Cases.defer(wrapper)
    refusals={}
    if debt then
        refusals[debt.code]={count=debt.count,sinceHours=debt.sinceHours,atHours=0}
        debt.rung=rungNow()
    end
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
    sessions={}; refreshRetired(); local stale=0
    for index,root in ipairs(Cases.sessions(wrapper)) do
        -- A retired root is not a Session and must never be opened as one
        -- (its rows were collected by refreshRetired above).
        -- The closure keeps the true wrapper index, which no longer matches
        -- the position in `sessions` once any root has retired.
        if not Retired.isRetired(root) then
            -- A root written by an earlier generator revision no longer
            -- validates, and asserting on it would throw once per tick
            -- forever - the same shape of failure as the retired-case loop
            -- fixed on 2026-09-09. A case from an older build is a case we
            -- stop tracking, not a crash. Its evidence stays in the player's
            -- world and its evidence rows stay readable; only placement and
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
        log(stale.." saved case(s) predate this build. New cases will generate normally; the old ones stay on the organiser.")
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
    if not eligible then return nil,why,"no-containers" end
    local radius=Reach.radius(context.hoursSurvived);if not radius then return nil,"invalid survival reach","no-reach" end
    local intro,partners
    partners={}
    for _,site in ipairs(eligible) do if site.id==house and Reach.contains(site.bounds,context.anchor,radius) then intro=site end end
    if not intro then return nil,"current house needs suitable loaded storage","no-containers" end
    for _,site in ipairs(eligible) do
        if Catalog.distinct(intro,site) and Reach.contains(site.bounds,context.anchor,radius) then partners[#partners+1]=site end
    end
    if #partners==0 then return nil,"no second loaded site within reach","no-reach" end
    table.sort(partners,function(a,b) return a.id<b.id end)
    -- Before commitment, try each deterministic partner once.  Capacity follows
    -- the selected story roles, not the former 3/4 building split.
    --
    -- One container at each site is enough (P4-R133): the clues that do not fit
    -- now wait as an open order and the filler places them as the survivor
    -- moves about. Demanding every container up front is what stopped cases
    -- coming for a player who stays in one house.
    for offset=0,#partners-1 do
        local partner=partners[(seed+offset)%#partners+1]
        local case=G.generateSelected(catalog,seed,options,{intro.id,partner.id})
        if case and #(candidates[intro.id] or {})>=1 and #(candidates[partner.id] or {})>=1 then return case end
    end
    return nil,"first house and partner lack containers for this generated evidence set","no-containers"
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
        -- THE LADDER (P4-R133). After three refusals of one code the generator
        -- lowers its own standard, one rung at a time. Only for a later case:
        -- the first case's site is the house the player is standing in
        -- (P4-R66), which is not a standard that can be lowered.
        local rung=later and rungNow() or 0
        local used={}
        -- RUNG 3: release the oldest finished case's sites back into the pool.
        -- A deep-archived case (P4-R111) already has no rows and so excludes
        -- nothing; this is the oldest one that still does.
        local released=nil
        if rung>=3 then
            for index,root in ipairs(Cases.sessions(wrapper) or {}) do
                if Retired.isRetired(root) and root.rows then released=index; break end
            end
        end
        for index,root in ipairs(Cases.sessions(wrapper) or {}) do
            if index~=released then
                if root.case then for _,site in ipairs(root.case.locations) do used[site.id]=true end
                else for _,row in ipairs(root.rows or {}) do if row.locationId then used[row.locationId]=true end end end
            end
        end
        local filtered={revision=catalog.revision,locations={}}
        for _,site in ipairs(catalog.locations) do
            local available=candidates and candidates[site.id] or {}
            if not used[site.id] and #available>=1 then filtered.locations[#filtered.locations+1]=site end
        end
        local anchor=later and {x=math.floor(p:getX()),y=math.floor(p:getY())} or result.anchor
        preparing=false
        if house and currentHouse()~=house then refuse("busy");return end
        local options={mapId=result.map,buildLine=result.gameVersion}
        -- The first case of a game carries the relay memo (P4-R96); later
        -- cases never do, so a game holds exactly one.
        if not later then options.relayMemo=true end
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
        -- "What do I make of it?" (P4-R113): the most recently changed unused
        -- answers about a finished case steer this one. Read here, saved in
        -- the case, and marked used in the same swap below.
        local steerFrom
        if later then
            local okSteer,steer,index=pcall(Cases.pendingSteer,wrapper)
            if okSteer and steer then options.steer=steer; steerFrom=index end
        end
        local context={hoursSurvived=p:getHoursSurvived(),anchor=anchor}
        -- RUNG 2: one step wider reach. The nearby scan was already started at
        -- the wider radius (R.nextCase); this is the generator's own filter
        -- being told the same thing, or it would throw the extra buildings
        -- straight back out. Reachability itself is never traded: an
        -- unreachable clue is not a clue, and Storage.scan's basement gate is
        -- untouched.
        if rung>=2 then
            local Reach=require("ConspiracyFiles/Reach")
            local base=Reach.radius(context.hoursSurvived)
            context.radius=base and Reach.wider(base) or nil
        end
        local case,err,code
        if house then case,err,code=firstCase(filtered,seed,options,context,house,candidates)
        else
            case,err=G.generateNew(filtered,seed,options,context)
            -- RUNG 1: a smaller case. A case is re-derived from its seed, so
            -- its clues cannot be trimmed - a smaller case is a DIFFERENT
            -- case. So try a bounded, deterministic sequence of seeds and keep
            -- the smallest case any of them gives, down to the generator's own
            -- minimum (a claim and a record contradicting it, which every case
            -- carries by construction). Bounded at three tries because each
            -- one is a full generate-and-validate.
            if rung>=1 then
                local best=case
                for step=1,R.RUNG1_TRIES do
                    if best and #best.documents<=G.MIN_EVIDENCE then break end
                    local other=(seed*31+step*1013904223)%2147483646+1
                    local try=G.generateNew(filtered,other,options,context)
                    if try and (not best or #try.documents<#best.documents) then best=try end
                end
                if best and best~=case then
                    log("rung 1: a smaller case, "..#best.documents.." clue(s) instead of "
                        ..(case and #case.documents or "none"))
                    case=best
                end
            end
        end
        if not case then
            -- Which refusal it is, honestly: nothing eligible within reach at
            -- all is a different fault from buildings that hold no loaded
            -- container, and only the second one is cured by walking inside.
            if not code then
                code=(#catalog.locations<2) and "no-reach" or "no-containers"
            end
            log("no case: "..tostring(err))
            refuse(code,later==true); return
        end
        for _,site in ipairs(case.locations) do
            if not World.resolve(targets[site.id]) then refuse("busy"); return end
        end
        -- INSTALMENTS (P4-R133). The case goes live with the clues that fit
        -- now; the rest wait as an open order and the filler places them as
        -- the survivor moves about and more of the world loads. This is where
        -- the old fault was: the whole case was thrown away unless every site
        -- could supply its share of distinct containers at that moment, so a
        -- player who stays in one house got no further cases at all.
        local root,waiting=Session.createDistributed(case,candidates,rooms,occupied,worldHours())
        if not root then refuse("no-containers",later==true); return end
        -- A case is a claim and a record that contradicts it, in two different
        -- places (Generator.MIN_EVIDENCE). One clue on its own is not a case,
        -- and a case with one clue could never finish - it would squat an
        -- active slot for ever, which is worse than the refusal this change
        -- exists to fix. So each of the two sites must take a clue now; the
        -- rest may wait.
        local placedAt={}
        for _,doc in ipairs(case.documents) do
            local a=root.assignments[doc.id]
            if a.status~="deferred" then placedAt[doc.locationId]=(placedAt[doc.locationId] or 0)+1 end
        end
        for _,site in ipairs(case.locations) do
            if not placedAt[site.id] then refuse("no-containers",later==true); return end
        end
        -- The opening clue of the FIRST case is in the house the player is
        -- standing in (P4-R66), so it is never an instalment.
        if house and root.assignments[case.documents[1].id].status=="deferred" then
            refuse("no-containers",false); return
        end
        for _,assignment in pairs(root.assignments) do
            if assignment.target and not World.resolve(assignment.target) then refuse("busy");return end
        end
        -- Validate once more before the single authoritative swap.
        checked(Session.validate(root))
        if later then
            local staged=assert(Cases.stage(wrapper,root,wrapper.schedule and worldHours() or nil,steerFrom))
            -- A case arrived: nothing is owed. Cleared in the same swap that
            -- stages the case, so the store is never observably in debt for a
            -- case it already has.
            if staged.schedule then staged.schedule.defer=nil end
            swap(staged)
            clearDebt()
            if steerFrom then log("Case shaped by the survivor's answers about "..tostring(case.steer and case.steer.fromCase)) end
        elseif house then swap({canonical=root,schedule={schema=1,createdHours={worldHours()}}}); clearDebt()
        else swap({canonical=root}); clearDebt() end
        openAll()
        local first=case.documents[1]; local t=targets[first.locationId]
        log("DEV first clue container: "..t.x..", "..t.y..", floor "..t.z..". No discoveries granted.")
        -- How much of the case is an open order. A count, in the log, never on
        -- any surface the player reads: the record shows what was found and
        -- never a total (P4-R133).
        if #waiting>0 then
            CFLog.write("i","case",{case=case.caseId,n=#waiting,why="instalments"})
        end
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
-- WHY THE FIRST CASE OF A SAVE IS STILL WAITING: the survivor is not inside a
-- building yet (the firstHouse option below; the first case is anchored on the
-- house the survivor is standing in). Named rather than written twice, because
-- AutomaticInvestigations turns exactly this wait into the typed refusal
-- `outdoors` (P4-R133, "every silence has a reason") and matching on a
-- sentence would come apart the day someone rewords it. Every other refusal
-- from R.start is a different reason and stays untyped.
R.WAITING_INDOORS="waiting until player is inside a building"
function R.start(seed,options)
    require("ConspiracyFiles/GeneratedMenu")
    require("ConspiracyFiles/ClueCue")
    if preparing then return false,"preparation already running" end
    local house
    local saved=ModData.get(TAG)
    if options and options.firstHouse and not (saved and (saved.canonical or saved.campaign)) then
        house=currentHouse();if not house then return false,R.WAITING_INDOORS end
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
    wrapper=nil; sessions={}; retiredRows={}; retiredIds={}
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
-- The address book builds in the background; anything it could not name before
-- it finished deserves a second chance, once.
local addressBookWasReady=false
local function refreshAddressCache()
    local map=ConspiracyFiles.AddressMap
    local ready=map and map.ready and map.ready()==true
    if ready and not addressBookWasReady then addressCache={} end
    addressBookWasReady=ready
end

function R.known()
    refreshAddressCache()
    if not wrapper or not sessions then return {} end
    local byId={}
    for _,row in ipairs(retiredRows) do byId[row.id]=row end
    for _,api in ipairs(sessions) do for _,row in ipairs(api.project()) do byId[row.id]=row end end
    local rows={}; for _,id in ipairs(Cases.discoveries(wrapper)) do if byId[id] then rows[#rows+1]=byId[id] end end; return rows
end
-- After a refused later case (P4-R125): how far the survivor must move, or how
-- long must pass, before the neighbourhood is scanned again.
R.DEFER_TILES=50
R.DEFER_HOURS=0.5
-- How many extra seeds the ladder's first rung may try for a smaller case.
-- Each one is a full generate-and-validate (about 20 ms on the test laptop),
-- and this runs inside the storage scan's own callback, so three is the most
-- a single frame should carry.
R.RUNG1_TRIES=3
function R.nextCase(seed)
    if preparing then return refuse("busy") end
    -- Not refusals of a case the world could have supplied, so they carry no
    -- code and no debt: a caller asking for a second case before the first, or
    -- with a seed no generator would take, is a caller bug.
    if not wrapper or not wrapper.canonical then return false,"start the first generated case before requesting another" end
    if type(seed)~="number" or seed~=math.floor(seed) or seed<1 or seed>=2147483647 then return false,"invalid seed" end
    if not allowed() then return false,"debug single-player required" end
    -- Finished cases are archived and no longer block a new one (P4-R111);
    -- this is the store's own cap, reached only when the archive itself is
    -- full - 16 cases on the measured worst case, where it used to be ten.
    if #Cases.sessions(wrapper)>=Cases.MAX_CASES then return refuse("cap") end
    -- Four unfinished cases is all the save allows (MAX_ACTIVE). A scan started
    -- here could only be refused at the final swap; three refusals disabled
    -- preparation, the next attempt set `preparing` with a job the scheduler
    -- would not take, and no case ever came again - not even after one was
    -- finished (campaign check, 2026-09-15). Refuse before scanning instead.
    local active=0
    for _,root in ipairs(Cases.sessions(wrapper)) do if not Retired.isRetired(root) then active=active+1 end end
    if active>=Cases.MAX_ACTIVE then return refuse("active-limit") end
    if scheduler.isDisabled("preparation") then return refuse("disabled") end
    -- Nothing usable nearby last time: do not scan the same neighbourhood again
    -- until the survivor has moved on or half an in-game hour has passed
    -- (P4-R125; the campaign check saw 61 refused scans in about 25 minutes).
    -- `debt.x` is set only by the refusals that came from a nearby scan, so
    -- the other codes wait for nothing, exactly as before.
    if debt and debt.x then
        local p=getPlayer()
        local dx=p and (p:getX()-debt.x) or 0
        local dy=p and (p:getY()-debt.y) or 0
        if dx*dx+dy*dy<R.DEFER_TILES*R.DEFER_TILES and worldHours()<debt.waitHours+R.DEFER_HOURS then
            return refuse("cooldown")
        end
    end
    for _,api in ipairs(sessions or {}) do
        for _,a in pairs(api.snapshot().assignments) do
            if a.status=="pending" or a.status=="placing" then return refuse("busy") end
        end
    end
    local probe=require("ConspiracyFiles/T3Nearby");local ok,why
    -- RUNG 2 of the ladder (P4-R133): the scan itself looks one step further,
    -- under its own label so the log still tells policy from a console
    -- override. prepare widens the generator's filter to match.
    local radius,radiusSource
    if rungNow()>=2 then
        local Reach=require("ConspiracyFiles/Reach")
        local p=getPlayer()
        local base=p and Reach.radius(p:getHoursSurvived())
        local wider=base and Reach.wider(base)
        if wider and wider>base then radius,radiusSource=wider,"P4-R133-rung2" end
    end
    ok,why=probe.start(radius,seed,nil,radiusSource); if not ok then return false,why end
    preparing=true; local waited=0; local queued=scheduler.enqueue("next-metadata","preparation",function() waited=waited+1;if probe.error then preparing=false;error(probe.error) end;if probe.result then prepare(probe.result,seed,true);return true end;if waited>240000 then preparing=false;error("metadata extraction did not complete") end;return false end)
    -- A refused job never runs, so nothing else would ever clear the flag.
    if not queued then preparing=false; return refuse("busy") end
    return true
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
    if root then for _,candidate in ipairs(sessions) do if candidate.snapshot().case.caseId==root.case.caseId then api=candidate end end end
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
        local markers=ConspiracyFiles.ClueMarkers
        if markers and markers.foundHere then pcall(markers.foundHere,item) end
    end
    checked(api.status(md.cfGeneratedId,"placed",worldHours())); checked(api.inspect(md.cfGeneratedId))
    -- The item in hand shows as Evidence however it reached the hand.
    pcall(function() item:setDisplayCategory(categoryOf(md.cfGeneratedId)) end)
    local ledger=ConspiracyFiles.DiscoveryLog
    if ledger and ledger.record then ledger.record("evidence",md.cfGeneratedId) end
    -- The moment two records meet. A document only connects to one already
    -- held, so this fires exactly when the player learns something they could
    -- not have known a second earlier - which is the rule every voice trigger
    -- has to pass. The survivor never says which record is true.
    local voice=ConspiracyFiles.PlayerVoice
    if voice and voice.onConnection and not already then
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
    -- to open the organiser to find out which of the four you are holding. The
    -- item already carries its real title as its name, so this only needs to
    -- confirm the record has it.
    --
    -- Set on INSPECTION and never before. A tooltip on an undiscovered
    -- document would let a player find every clue by hovering, which would
    -- replace the investigation with a sweep of the furniture.
    pcall(function() item:setTooltip("Tooltip_ConspiracyFiles_Recorded") end)
    -- Record the discovery first, then retire: a case whose last document has
    -- just been found no longer needs its placement bookkeeping, and shedding
    -- it is what keeps later cases inside the shared save budget.
    local done=api.snapshot()
    -- Every clue accounted for, not merely every clue found (P4-R133): a clue
    -- still waiting for a container is not accounted for, so "nothing left to
    -- find" and the closing question cannot fire while one is unwritten. A
    -- clue that waited three in-game days and was dropped IS accounted for -
    -- a four-clue case is still a case.
    if Session.accounted(done) then
        for index,root in ipairs(Cases.sessions(wrapper)) do
            if not Retired.isRetired(root) and root.case and root.case.caseId==done.case.caseId then
                -- Keep where each clue was last seen. Owner, 2026-09-14: "I
                -- lost my files somewhere?" - retiring dropped every placement
                -- detail, and the record could no longer say (P4-R104). The
                -- document in hand is where it is right now, not where the
                -- last scan happened to see it.
                local seen={}
                for sid,s in pairs(sightings) do if s.where then seen[sid]=s.where end end
                local okHere,here=pcall(placeOf,item)
                if okHere and here then seen[md.cfGeneratedId]=here end
                -- The hour it finished lets the next case wait a little for
                -- the survivor's answers (P4-R121).
                local staged,why=Cases.retire(wrapper,index,seen,worldHours())
                if staged then
                    swap(staged); openAll(); log("Case complete; placement details retired.")
                    -- The item in hand is Old at once; the rest are marked
                    -- as the last-seen scan passes them (P4-R118).
                    pcall(function() item:setDisplayCategory(categoryOf(md.cfGeneratedId)) end)
                    -- Not "solved" - the mod does not know that and never will.
                    -- Only that there is nothing further to find - and where a
                    -- clue was never placed at all, not even that
                    -- (DR-20260919-SOLVABLE-WITHDRAWN). The count of clues the
                    -- case ended without decides which closing line is honest;
                    -- the log carries the ids so a run can be read afterwards.
                    -- The log names each gap AND which history it had - never
                    -- placed, or placed on a carrier that went away - because
                    -- the two are different failures and looked identical
                    -- before `droppedFrom` recorded them.
                    local gaps,history=Session.gaps(done)
                    if #gaps>0 then
                        local parts={}
                        for _,gid in ipairs(gaps) do parts[#parts+1]=gid.."("..tostring(history[gid])..")" end
                        log("Case complete with "..#gaps.." clue(s) the case never had: "..table.concat(parts,", ")
                            .." [case="..tostring(done.case.caseId).."]")
                    end
                    local v=ConspiracyFiles.PlayerVoice
                    if v and v.onCaseComplete then pcall(v.onCaseComplete,done.case.caseId,#gaps) end
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
    if retiredId(id) then return true end
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
function R.recognise(target,how)
    if not allowed() or not sessions then return false,"no case" end
    local id=target
    if type(target)~="string" then
        local ok,md=pcall(function() return target:getModData() end)
        id=ok and type(md)=="table" and md.cfGeneratedId or nil
    end
    if type(id)~="string" then return false,"not a clue" end
    if retiredId(id) then return true,false end
    local api,root=liveApi(id)
    if not api then return false,"not a live clue" end
    if R.isRecognisedId(id) then return true,false end
    local ok,why=api.recognise(id)
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
        if not Retired.isRetired(root) and root.assignments then
            local seen={}
            for _,id in ipairs(root.known or {}) do seen[id]=true end
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
-- Evidence of a case that has retired. Retirement drops the case's
-- assignments, so the item is no longer a subject and the menu used to offer
-- nothing at all, which read as broken in play (2026-09-15). Its id is still
-- in a retired row, so the menu can say it is already recorded (P4-R118).
function R.retiredPaper(item)
    if not item then return false end
    local md=item:getModData(); if type(md)~="table" or not md.cfGeneratedId then return false end
    return retiredId(md.cfGeneratedId) and not R.subject(item)
end
-- Every finished case that carries questions ("What do I make of it?",
-- P4-R113), newest case first: its id, its place in the campaign, what it asks
-- about and the answers so far. Copies, so the organiser cannot change a save
-- by editing what it was handed.
function R.questions()
    if not wrapper then return {} end
    local function dup(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=dup(x) end return o end
    local out={}
    for index,root in ipairs(Cases.sessions(wrapper) or {}) do
        if Retired.isRetired(root) and root.offered then
            out[#out+1]={caseId=root.caseId,number=index,offered=dup(root.offered),answers=dup(root.answers)}
        end
    end
    table.sort(out,function(a,b) return a.number>b.number end)
    return out
end
-- The survivor's answers about a finished case ("What do I make of it?",
-- P4-R113): reading, who matters, way. An empty table clears them. Refused
-- once a case has been built from them. Used by the organiser's question
-- screen and by the Linux core-loop check.
function R.setAnswers(caseId,answers)
    if not allowed() or not wrapper then return false,"no campaign" end
    for index,root in ipairs(Cases.sessions(wrapper) or {}) do
        if Retired.isRetired(root) and root.caseId==caseId then
            local staged,why=Cases.setAnswers(wrapper,index,answers,worldHours())
            if not staged then return false,why end
            swap(staged); refreshRetired()
            return true
        end
    end
    return false,"no finished case "..tostring(caseId)
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
function R.metrics() return scheduler and {peakMs=scheduler.peakMs} end
function R.automaticStatus()
    local roots=wrapper and Cases.sessions(wrapper) or {}
    local schedule=wrapper and wrapper.schedule
    -- When the most recent case finished, so the next one can wait a little
    -- for the survivor's answers (P4-R121). nil when none recorded one.
    local lastCompleted,active=nil,0
    for _,root in ipairs(roots) do
        local h=type(root)=="table" and root.completedHours
        if type(h)=="number" and (not lastCompleted or h>lastCompleted) then lastCompleted=h end
        if not Retired.isRetired(root) then active=active+1 end
    end
    -- WHY NO CASE HAS COME (P4-R133): the code, how many times it has refused,
    -- when that started, the in-game hour a case is promised by and the rung of
    -- the ladder. The last reason reported wins - counted or not, the
    -- generator's or the poller's - and the debt the save came back with
    -- answers before anything has refused this session. `defer` is nil only
    -- when nothing is being withheld at all; the flat fields are there so a
    -- check can read them without a nil test.
    local reported=silence or debt
    return {count=#roots,preparing=preparing==true,scheduled=schedule~=nil,
        lastCreatedHours=schedule and schedule.createdHours[#schedule.createdHours],
        lastCompletedHours=lastCompleted,limit=Cases.MAX_CASES,
        active=active,activeLimit=Cases.MAX_ACTIVE,
        defer=reported and {code=reported.code,count=reported.count,sinceHours=reported.sinceHours,
            dueHours=reported.dueHours,rung=reported.rung} or nil,
        why=reported and reported.code or nil,deferCount=reported and reported.count or 0,
        dueHours=reported and reported.dueHours or nil,
        rung=rungNow(),rungMax=R.RUNG_MAX}
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
local function boundsScan(site,done,accept)
    local b=site.bounds
    local kinds={}; for _,kind in ipairs(site.containerTypes) do kinds[kind]=true end
    local margin=kinds[Storage.MAILBOX] and Session.OUTDOOR_RADIUS or 0
    local x1,y1,x2,y2=b.x1-margin,b.y1-margin,b.x2+margin,b.y2+margin
    local x,y,objects,oi,ci=x1,y1,nil,0,0
    return function()
        if y>=y2 then done(nil); return true end
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
        if c and name and kinds[c:getType()] and (inside or c:getType()==Storage.MAILBOX) then
            local found={x=x,y=y,z=b.z,objectIndex=oi,containerIndex=ci,containerType=c:getType(),sprite=name}
            if not accept or accept(found) then done(found); return true end
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
        -- A clue on a carrier does not relocate (P4-R134). Relocation gives a
        -- clue one new home when the survivor never came looking; a body is
        -- where the world left it, and taking the note out
        -- of a dead man's jacket to put it in a drawer would undo the find the
        -- whole decision exists for. Its answer to going stale is expiry.
        if Session.isMobile(a.target) and type(a.target.carrierMark)=="string" then return true end
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
            -- Relocation RECREATES the item, and used to set the name here
            -- and nothing else - so a relocated document reverted to its
            -- script's own category and appeared as "Literature" in the middle
            -- of a session (owner, 2026-09-13, at 101 4th St). Same stamp as
            -- first placement now, from one function, so a third creation path
            -- cannot drift the same way.
            -- Still a plain item unless the survivor had already recognised
            -- it (P4-R132).
            if R.isRecognisedId(id) then stampEvidence(newItem,doc.title) end
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
        local cue=ConspiracyFiles.ClueCue
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
-- RETIRE A CASE THAT HAS JUST BECOME ACCOUNTED FOR, FROM ANY PATH.
--
-- Session.accounted used to be consulted in exactly ONE place: the path that
-- runs when a clue is inspected. Both drop paths - a deferred clue that has
-- waited three in-game days, and a clue whose carrier is gone - dropped the
-- clue and never asked again. So this sequence stuck a case for the rest of
-- the save:
--   1. the survivor finds and inspects every clue that HAS a container;
--   2. the last one is still deferred, so the case is not accounted for and
--      does not retire - correct so far (P4-R133);
--   3. three in-game days later that clue expires and is dropped;
--   4. the case is NOW accounted for, and nothing will ever look again,
--      because looking only happened on inspection and there is nothing left
--      to inspect.
-- The case keeps its active slot for ever. With MAX_ACTIVE slots held that way
-- every later case is refused `active-limit`, and no ladder rung can free a
-- slot a finished case is still holding - the rungs release an old FINISHED
-- case's sites, which does nothing here.
--
-- Returns false when there is nothing to do, so a caller can tell "not ready"
-- from "retired". Exposed as R.retireIfAccounted for
-- test/retire_after_final_drop.lua, because the bug was that nothing was
-- called and only a test that watches the call can hold that.
local function retireIfAccounted(done)
    if type(done)~="table" or type(done.case)~="table" then return false end
    if not Session.accounted(done) then return false end
    -- No campaign loaded is a normal state, not a fault: a drop can fire during
    -- a reset or before the store exists, and ipairs(nil) would throw inside a
    -- scheduler job. Nothing to retire into, so nothing to do.
    if type(wrapper)~="table" then return false end
    for index,root in ipairs(Cases.sessions(wrapper)) do
        if not Retired.isRetired(root) and root.case and root.case.caseId==done.case.caseId then
            -- Where each clue was last seen, from the scan's own sightings
            -- (P4-R104). No item in hand on this path: nothing was just picked
            -- up, a clue simply ran out of time.
            local seen={}
            for sid,s in pairs(sightings or {}) do if s.where then seen[sid]=s.where end end
            local staged,why=Cases.retire(wrapper,index,seen,worldHours())
            if not staged then log("case accounted for but not retired: "..tostring(why)); return false end
            swap(staged); openAll()
            local gaps,history=Session.gaps(done)
            if #gaps>0 then
                local parts={}
                for _,gid in ipairs(gaps) do parts[#parts+1]=gid.."("..tostring(history[gid])..")" end
                log("Case complete with "..#gaps.." clue(s) the case never had: "..table.concat(parts,", ")
                    .." [case="..tostring(done.case.caseId).."]")
            else
                log("Case complete; placement details retired.")
            end
            local v=ConspiracyFiles.PlayerVoice
            if v and v.onCaseComplete then pcall(v.onCaseComplete,done.case.caseId,#gaps) end
            return true
        end
    end
    return false
end
R.retireIfAccounted=retireIfAccounted
local function carrierScanFor(site,found)
    local b=site.bounds
    local r=Session.CARRIER_RADIUS
    local reach=math.max(b.x2-b.x1,b.y2-b.y1)+r
    return Carriers.scan(math.floor((b.x1+b.x2)/2),math.floor((b.y1+b.y2)/2),b.z,reach,found,
        function(entry)
            return entry.x>=b.x1-r and entry.x<b.x2+r and entry.y>=b.y1-r and entry.y<b.y2+r and entry.z==b.z
        end)
end
local function filler(api)
    local id,site,scan,target,bodyScan,carrier
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
                    -- The drop may have been the event that completed this case.
                    -- Nothing else will ever look again: retirement used to be
                    -- checked only when a clue was inspected, and there is
                    -- nothing left to inspect.
                    retireIfAccounted(api.snapshot())
                else log("could not drop a waiting clue: "..tostring(why)) end
                return true
            end
            local waiting=Session.deferredIds(root)
            if #waiting==0 then return true end
            id=waiting[1]
            for _,s in ipairs(root.case.locations) do
                if s.id==root.assignments[id].locationId then site=s end
            end
            if not site then return true end
            local taken=usedPhysicalKeys()
            scan=boundsScan(site,function(t) target=t end,
                function(candidate) return not taken[Session.physicalKey(candidate)] end)
        end
        local a=api.assignment(id)
        if not a or a.status~="deferred" then return true end
        if not target and scan then
            if scan() then
                -- Nothing loaded and free at that site: a carrier next, which
                -- is the one place that does not run out (P4-R134).
                if not target then scan=nil end
            else return false end
        end
        if not target then
            if not Session.mobileAllowed(api.snapshot(),id) then
                -- Debug, not info: this is the ordinary state of an open order
                -- and would otherwise be a line every two seconds.
                CFLog.write("d","skip",{doc=id,why="no-containers"}); return true
            end
            if not bodyScan then bodyScan=carrierScanFor(site,function(entry) carrier=entry end) end
            if not carrier then
                if bodyScan() then
                    if not carrier then CFLog.write("d","skip",{doc=id,why="no-containers"}); return true end
                else return false end
            end
            local pc=getPlayer()
            if pc and StaleClue.tooClose(math.floor(pc:getX()),math.floor(pc:getY()),math.floor(pc:getZ()),carrier) then
                return false
            end
            local mark=Carriers.newMark(carrier.x,carrier.y,carrier.z,hours)
            local claimed,whyNot=Carriers.claim(carrier,mark)
            if not claimed then
                CFLog.write("d","skip",{doc=id,why="carrier-"..tostring(whyNot or "refused")})
                carrier=nil; return false
            end
            target={x=carrier.x,y=carrier.y,z=carrier.z,objectIndex=0,containerIndex=0,
                containerType=Session.CARRIER_CONTAINER,sprite=carrier.kind,
                carrierKind=carrier.kind,carrierMark=mark}
        end
        -- Nothing materialises under the survivor's feet: the same guard
        -- relocation uses, with the same radius.
        local p=getPlayer()
        if p and StaleClue.tooClose(math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ()),target) then
            return false
        end
        if not World.resolve(target) then return true end
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
                -- Same window as the expiry path above.
                retireIfAccounted(api.snapshot())
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
    local Words=require("ConspiracyFiles/ContainerWords")
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
    -- A finished case keeps no scan of its own, only where its evidence was last
    -- seen (P4-R104). No record means we say nothing, never that it is gone.
    for _,row in ipairs(retiredRows) do
        if row.id==id then
            if type(row.lastSeen)=="string" then return "lastseen",row.lastSeen end
            return nil
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
-- Where a finished case's evidence is now (P4-R104). Owner, 2026-09-14: "I lost
-- my files somewhere?" The case had completed, retirement had dropped its
-- placement details, and nothing could say where the evidence had gone.
--
-- A retired case has no identity scan, so this is a smaller one: the player's
-- inventory with bags inside it (depth 3, as restampEvidence walks it) and the
-- containers the loot panel is showing, one item per scheduler step, at most
-- every ten seconds of real time. What it finds is written to the save only
-- when the words changed, and never more than once a minute per document: a
-- player walking round with the evidence album must not cost a 20 ms validation every
-- time a bag changes hands.
local LAST_SEEN_EVERY_MS=10000
local LAST_SEEN_WRITE_MS=60000
local LAST_SEEN_CONTAINERS=64
local LAST_SEEN_ITEMS=2048
local lastSeenAt=nil
local lastSeenWritten={}
local function lastSeenJob()
    local rows={}
    for _,row in ipairs(retiredRows) do rows[row.id]=row end
    local tasks,listed={},{}
    local function add(container,depth)
        if container and depth<=3 and not listed[container] and #tasks<LAST_SEEN_CONTAINERS then
            listed[container]=true; tasks[#tasks+1]={container=container,depth=depth}
        end
    end
    local player=getPlayer and getPlayer()
    add(player and rd(player,"getInventory"),0)
    -- The loot panel's containers are what the player is looking into; its
    -- buttons already hold them, so reaching them costs nothing.
    pcall(function()
        local page=getPlayerLoot and getPlayerLoot(0)
        for _,button in ipairs(page and page.backpacks or {}) do add(button.inventory,0) end
    end)
    local found,cursor,index,examined={},1,0,0
    return function()
        local task=tasks[cursor]
        if task and examined<LAST_SEEN_ITEMS then
            local items=rd(task.container,"getItems")
            local size=items and rd(items,"size") or 0
            if type(size)~="number" or index>=size then cursor=cursor+1; index=0; return false end
            local item=rd(items,"get",index); index=index+1; examined=examined+1
            local md=item and rd(item,"getModData")
            local id=type(md)=="table" and md.cfGeneratedId
            -- Marked Old wherever this scan meets it: after a reload, and in
            -- saves whose case retired before the mark existed (P4-R118).
            if id and rows[id] then pcall(function() item:setDisplayCategory("EvidenceOld") end) end
            if id and rows[id] and not found[id] then
                local ok,where=pcall(placeOf,item)
                if ok and type(where)=="string" then found[id]=where end
            end
            local inner=item and rd(item,"getInventory")
            if inner then add(inner,task.depth+1) end
            return false
        end
        if saveRefused() or not wrapper then return true end
        local now=getTimeInMillis and getTimeInMillis() or 0
        local updates,any={},false
        for id,where in pairs(found) do
            local words=Retired.cleanLastSeen(where)
            local at=lastSeenWritten[id]
            if words and words~=rows[id].lastSeen and (not at or now-at>=LAST_SEEN_WRITE_MS or now<at) then
                updates[id]=words; any=true
            end
        end
        if not any then return true end
        local staged,changed=Cases.noteLastSeen(wrapper,updates)
        if not staged then log("Last-seen note refused: "..tostring(changed)); return true end
        if changed then
            swap(staged); refreshRetired()
            for id in pairs(updates) do lastSeenWritten[id]=now end
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
        -- Beside relocation, and bounded the same way: one job per session,
        -- one waiting clue per attempt (P4-R133).
        for i,api in ipairs(sessions) do scheduler.enqueue("fill:"..i,"filler",filler(api)) end
        -- And the carrier watch, the same shape: one job per session, one clue
        -- per attempt (P4-R134).
        for i,api in ipairs(sessions) do scheduler.enqueue("carrier:"..i,"carrier",carrierWatch(api)) end

        scheduler.enqueue("visited-building","tracking",trackVisited)
        if #retiredRows>0 then
            local now=getTimeInMillis and getTimeInMillis() or 0
            if not lastSeenAt or now-lastSeenAt>=LAST_SEEN_EVERY_MS or now<lastSeenAt then
                if scheduler.enqueue("last-seen","lastseen",lastSeenJob()) then lastSeenAt=now end
            end
        end
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

Events.OnGameStart.Add(function()
    sessions,scheduler,preparing,wrapper=nil,nil,false,nil
    clearDebt()
    -- Forget what we could see last time. A new session has not looked yet,
    -- and should say so rather than inherit yesterday's confidence.
    sightings={}
    lastSeenAt=nil
    if not allowed() then return end
    local saved=ModData.getOrCreate(TAG)
    if saved.canonical or saved.campaign then
        local ok,why=pcall(function() checked(setup()); wrapper=assert(Cases.current(saved)); openAll() end)
        if not ok then scheduler=nil; log("Saved case refused: "..tostring(why)) end
        -- What the last session was still owed: the count and the rung, never
        -- the wait (P4-R133, P4-R125). Read after the store is open, and never
        -- allowed to stop a save from loading.
        if ok then pcall(restoreDebt) end
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
