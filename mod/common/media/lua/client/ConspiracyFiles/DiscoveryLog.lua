-- ModData-backed writer/reader for the shared chronological discovery ledger.
-- Every discovery source appends here as it happens; the organiser reads only
-- this ledger for ordering, so numbering matches what the player actually did.
local CFLog=require("ConspiracyFiles/Log")
local Ledger=require("ConspiracyFiles/DiscoveryLedger")
local Budget=require("ConspiracyFiles/SaveBudget")
-- Load the voice, do not merely hope it is loaded. PZ does not execute every
-- client file on its own - proven with GeneratedDiagnostic - so a module
-- reached only through the shared table can silently never exist.
require("ConspiracyFiles/PlayerVoice")
require("ConspiracyFiles/PlaceVisitLog")
ConspiracyFiles=ConspiracyFiles or {}
local D=ConspiracyFiles.DiscoveryLog or {}
ConspiracyFiles.DiscoveryLog=D
local TAG="ConspiracyFiles.DiscoveryLedger"

local function root()
    local store=ModData.get(TAG)
    if not store then return Ledger.empty() end
    for key in pairs(store) do if key~="canonical" then error("unknown discovery ledger field") end end
    if store.canonical==nil then return Ledger.empty() end
    local ok=Ledger.validate(store.canonical)
    if not ok then error("invalid discovery ledger state") end
    return store.canonical
end
D.root=function() local ok,value=pcall(root); return ok and value or Ledger.empty() end

-- Where the player is standing when a discovery is stamped, as the address
-- book names it. Stamped ONCE, here, and never recomputed: a document found
-- in a car that is later driven across town was still found where it was
-- found, and a record that quietly rewrites its own history is worse than
-- one that says nothing.
--
-- Two readings, in order. The building the player is standing in is the
-- honest answer indoors. Outdoors there is no building, so the nearest named
-- one within 30 tiles stands in - a wallet on the pavement outside 109 Walker
-- Road belongs to that stretch of road, not to nowhere.
--
-- nil is a real answer and stays nil. A shed off a dirt road has no address,
-- and inventing "Unknown" for it would put every placeless discovery under
-- one fake heading.
local function whereNow()
    local map=ConspiracyFiles.AddressMap
    if not map or not map.ready or not map.ready() then return nil end
    local player=getPlayer and getPlayer()
    local square=player and player.getSquare and player:getSquare()
    if not square then return nil end
    local building=square.getBuilding and square:getBuilding()
    local def=building and building:getDef()
    local id=def and def.getIDString and tostring(def:getIDString())
    local label=id and map.labelForBuilding and map.labelForBuilding(id)
    if type(label)=="string" and label~="" then return label,id end
    local x,y=square.getX and square:getX(),square.getY and square:getY()
    local nearest=map.nearest and map.nearest(x,y,30)
    if type(nearest)=="string" and nearest~="" then return nearest,nil end
    return nil
end

local function worldHours()
    local clock=getGameTime and getGameTime()
    local hours=clock and clock:getWorldAgeHours()
    if type(hours)~="number" or hours~=hours or hours<0 or hours==math.huge then return nil end
    return hours
end

-- Stable sequence numbers come from the ledger itself; the world clock is
-- recorded alongside because several discoveries share one game-time interval.
function D.record(kind,reference,mapState)
    local ok,recorded=pcall(function()
        local at=worldHours(); if not at then return false end
        -- A place that cannot be read costs the entry nothing: the discovery
        -- is recorded either way, placeless.
        local ok,where,whereId=pcall(whereNow); if not ok then where,whereId=nil,nil end
        local staged,changed=Ledger.record(root(),kind,reference,at,where,whereId)
        if not staged or not changed then return false end
        local mapStore
        if mapState then
            local State=require("ConspiracyFiles/MapMediaState")
            local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
            if not State.validate(mapState,Catalogue) then return false end
            if not Budget.checkMany({discoveries={canonical=staged},mapMedia={canonical=mapState}}) then return false end
            mapStore=ModData.getOrCreate("ConspiracyFiles.MapMedia")
        elseif not Budget.check("discoveries",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        -- Both roots are staged and checked together. No engine calls/yields
        -- between these assignments; readers never observe a half discovery.
        if mapStore then mapStore.canonical=mapState end
        store.canonical=staged
        local event=staged.events[#staged.events]
        -- Straight to disk, before anything else can go wrong. ModData will
        -- not reach the disk until the game next saves.
        --
        -- AND IT HAS TO SAY SO IF IT FAILS. This is the whole of the crash
        -- protection: the journal is why a crash no longer costs the player
        -- their research. The result used to be discarded, so a disk that
        -- refused the write left every discovery living in ModData only,
        -- unprotected until the next save, with nothing anywhere saying the
        -- safety net was gone. Two crashes in play on 2026-09-13 ended on
        -- device input with no Lua trace; if the journal had been failing
        -- those runs, nothing would have told us.
        --
        -- It does not abort the discovery: the entry IS recorded, and losing
        -- it because the journal is unhappy would be strictly worse. It warns,
        -- once per session for the same reason, because a warning repeated on
        -- every discovery buries the log that a real problem has to be spotted in.
        local journalled,written=pcall(D.journalAppend,event)
        if not journalled or written~=true then
            if not D.journalWarned then
                D.journalWarned=true
                CFLog.message("ledger","note",
                    "Discoveries are NOT being written to the journal: "..tostring(written)
                    .."; they survive only from the game's next save onward. Further"
                    .." journal failures this session will not be repeated here.","w")
            end
            D.journalFailures=(D.journalFailures or 0)+1
        end
        CFLog.message("ledger","note","#"..event.seq.." "..event.kind.." "..event.ref.." at hour "..string.format("%.2f",event.at)
            ..(event.place and (" at "..event.place) or " (no named place)"))
        -- Set A voice line: fire on every genuinely new discovery, whatever
        -- its kind. Guarded so a missing/unloaded PlayerVoice degrades to
        -- silence rather than blocking the ledger write above.
        local voice=ConspiracyFiles.PlayerVoice
        if voice and voice.onDiscovery then pcall(voice.onDiscovery,kind,reference) end
        -- Whatever the organiser is showing is now out of date. Its list was
        -- cached until the player left the program, so a picked-up ID or a
        -- read document only appeared after going out and back in (owner,
        -- Windows, 2026-09-14). Every discovery passes through here, and each
        -- store is written before this runs, so the next draw sees it.
        local screen=ConspiracyFiles.OrganiserScreen
        if screen and screen.window then screen.window.cachedList=nil end
        -- Finding something here counts as being here, judged against the
        -- number this very discovery just produced.
        if event.place then pcall(D.visit,event.place) end
        return true
    end)
    if not ok then CFLog.message("ledger","note","Discovery not recorded: "..tostring(recorded)); return false end
    return recorded
end

-- The highest discovery number the ledger has reached. A visit is judged
-- against it: same number as last time means nothing was learned in between.
function D.highestSeq()
    local top=0
    for _,e in ipairs(D.events()) do if type(e.seq)=="number" and e.seq>top then top=e.seq end end
    return top
end

-- WP6, observation first. Being somewhere is only interesting if the player
-- has learned something since they were last there; PlaceVisits decides that,
-- this only supplies the place and the number. Wired to two moments, both of
-- which mean the player was thinking about where they are rather than merely
-- passing through it: opening the notes, and recording a discovery.
--
-- Opening the notes is also the one stamp a debug teleport cannot fake, since
-- teleporting fires no movement event.
function D.visit(place)
    local log=ConspiracyFiles.PlaceVisitLog
    if not log or not log.visit then return "invalid",0 end
    if place==nil then local ok,where=pcall(whereNow); place=ok and where or nil end
    if type(place)~="string" or place=="" then return "invalid",0 end
    local ok,verdict,n=pcall(log.visit,place,D.highestSeq())
    if not ok then return "invalid",0 end
    return verdict,n
end

function D.events() return Ledger.events(D.root()) end
function D.places() return Ledger.places(D.root()) end
function D.placeIds() return Ledger.placeIds(D.root()) end
function D.order(rows) local ok,out=pcall(Ledger.order,D.root(),rows); return ok and out or rows end

-- The write-ahead journal ----------------------------------------------------
--
-- The ledger above lives in ModData, and ModData only reaches the disk when
-- the GAME saves. A hard crash therefore loses every discovery made since the
-- last autosave - which is exactly what happened to the owner on 2026-09-13:
-- "game crashed. all lost in the files".
--
-- So every discovery is also appended to a plain file the moment it is
-- recorded, and anything the save turns out to be missing is replayed on the
-- next load. The journal is the belt; ModData is still the braces.
--
-- Replay is safe to run at any time because Ledger.record refuses a reference
-- it already holds and reports changed=false, so an entry that did survive the
-- save is a no-op rather than a duplicate.
local JOURNAL="ConspiracyFiles_discoveries.txt"
local SEP="\29"     -- a field separator no place name or reference contains

local function saveId()
    local world=getWorld and getWorld()
    local name=world and world.getWorld and world:getWorld()
    return (type(name)=="string" and name~="" ) and name or "?"
end

local function encode(value)
    if value==nil then return "" end
    return (tostring(value):gsub("[\r\n\29]"," "))
end

-- One line per discovery, appended. Never rewrites the file: an append cannot
-- corrupt what is already on disk, which is the whole point of it.
function D.journalAppend(event)
    if not event then return false end
    local ok,written=pcall(function()
        local w=getFileWriter(JOURNAL,true,true)
        if not w then return false end
        -- writeln, not write: it owns the line ending, and the play machine
        -- is Windows while this is read back on Linux.
        local fields={saveId(),encode(event.kind),encode(event.ref),
            encode(string.format("%.6f",event.at or 0)),encode(event.place),
            encode(event.placeId)}
        local design,part=event.ref:match("^map:([^:]+):([1-4])$")
        local store=design and ModData.get("ConspiracyFiles.MapMedia")
        local trail=store and store.canonical and store.canonical.trails[design]
        local p=trail and (tonumber(part)==4 and trail.payoff or trail.fragments[tonumber(part)])
        if trail and p and p.noted then
            fields[7]=encode(trail.seed); fields[8]=encode(trail.at)
            fields[9]=encode(p.attempt); fields[10]=encode(p.at); fields[11]=encode(p.observation)
        end
        w:writeln(table.concat(fields,SEP))
        w:close()
        return true
    end)
    return ok and written==true
end

function D.journalRead()
    local out={}
    pcall(function()
        local r=getFileReader(JOURNAL,false)
        if not r then return end
        local mine=saveId()
        while true do
            local line=r:readLine()
            if line==nil then break end
            local f={}
            for part in (line..SEP):gmatch("([^"..SEP.."]*)"..SEP) do f[#f+1]=part end
            if #f>=4 and f[1]==mine then
                out[#out+1]={kind=f[2],ref=f[3],at=tonumber(f[4]),
                             place=(f[5]~="" and f[5]) or nil,
                             placeId=(f[6]~="" and f[6]) or nil,
                             mapSeed=tonumber(f[7]),mapReadAt=tonumber(f[8]),
                             mapAttempt=tonumber(f[9]),mapPlacedAt=tonumber(f[10]),
                             mapObservation=(f[11]~="" and f[11]) or nil}
            end
        end
        r:close()
    end)
    return out
end

-- Put back anything the save did not keep. Returns how many were restored.
function D.journalReplay()
    local entries=D.journalRead()
    if #entries==0 then return 0 end
    local restored=0
    for _,e in ipairs(entries) do
        local ok,done=pcall(function()
            local staged,changed=Ledger.record(root(),e.kind,e.ref,e.at,e.place,e.placeId)
            if not staged then return false end
            local mapNext,mapStore
            local design,part=e.ref:match("^map:([^:]+):([1-4])$")
            if design and e.mapSeed then
                local S=require("ConspiracyFiles/MapMediaState")
                local C=require("ConspiracyFiles/MapMediaCatalogue")
                mapStore=ModData.getOrCreate("ConspiracyFiles.MapMedia")
                local current=mapStore.canonical or S.empty()
                if not S.validate(current,C) then return false end
                local trail=current.trails[design]
                if trail and trail.seed~=e.mapSeed then return false end
                local previous=S.get(current,design,tonumber(part))
                if not previous or not previous.noted then
                    mapNext=S.activate(current,design,e.mapSeed,e.mapReadAt,C)
                    if not mapNext then return false end
                    mapNext=S.set(mapNext,design,tonumber(part),{state="noted",noted=true,recognised=true,
                        attempt=e.mapAttempt,at=e.mapPlacedAt,observation=e.mapObservation})
                    if not S.validate(mapNext,C) then return false end
                end
            end
            if not changed and not mapNext then return false end
            local replacements={discoveries={canonical=staged}}
            if mapNext then replacements.mapMedia={canonical=mapNext} end
            if not Budget.checkMany(replacements) then return false end
            local store=ModData.getOrCreate(TAG)
            if mapNext then mapStore.canonical=mapNext end
            store.canonical=staged
            if mapNext and ConspiracyFiles.MapMediaRuntime then ConspiracyFiles.MapMediaRuntime.invalidate() end
            return true
        end)
        if ok and done then restored=restored+1 end
    end
    if restored>0 then
        CFLog.message("ledger","note","restored "..restored.." discoveries from the journal after an unclean shutdown")
    end
    return restored
end

if Events and Events.OnGameStart and not D.journalHooked then
    D.journalHooked=true
    Events.OnGameStart.Add(function() pcall(D.journalReplay) end)
end

return D
