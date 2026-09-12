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
        local staged,changed=Ledger.record(root(),kind,reference,at)
        if not staged or not changed then return false end
        if not Budget.check("discoveries",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        store.canonical=staged
        local event=staged.events[#staged.events]
        CFLog.message("ledger","note","#"..event.seq.." "..event.kind.." "..event.ref.." at hour "..string.format("%.2f",event.at))
        -- Set A voice line: fire on every genuinely new discovery, whatever
        -- its kind. Guarded so a missing/unloaded PlayerVoice degrades to
        -- silence rather than blocking the ledger write above.
        local voice=ConspiracyFiles.PlayerVoice
        if voice and voice.onDiscovery then pcall(voice.onDiscovery,kind,reference) end
        return true
    end)
    if not ok then CFLog.message("ledger","note","Discovery not recorded: "..tostring(recorded)); return false end
    return recorded
end

function D.events() return Ledger.events(D.root()) end
function D.order(rows) local ok,out=pcall(Ledger.order,D.root(),rows); return ok and out or rows end

return D
