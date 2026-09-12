-- ModData-backed writer/reader for the shared chronological discovery ledger.
-- Every discovery source appends here as it happens; the notebook reads only
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
-- found, and a notebook that quietly rewrites its own history is worse than
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
function D.record(kind,reference)
    local ok,recorded=pcall(function()
        local at=worldHours(); if not at then return false end
        -- A place that cannot be read costs the entry nothing: the discovery
        -- is recorded either way, placeless.
        local ok,where,whereId=pcall(whereNow); if not ok then where,whereId=nil,nil end
        local staged,changed=Ledger.record(root(),kind,reference,at,where,whereId)
        if not staged or not changed then return false end
        if not Budget.check("discoveries",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        store.canonical=staged
        local event=staged.events[#staged.events]
        CFLog.message("ledger","note","#"..event.seq.." "..event.kind.." "..event.ref.." at hour "..string.format("%.2f",event.at)
            ..(event.place and (" at "..event.place) or " (no named place)"))
        -- Set A voice line: fire on every genuinely new discovery, whatever
        -- its kind. Guarded so a missing/unloaded PlayerVoice degrades to
        -- silence rather than blocking the ledger write above.
        local voice=ConspiracyFiles.PlayerVoice
        if voice and voice.onDiscovery then pcall(voice.onDiscovery,kind,reference) end
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

return D
