-- THE LEDGER: WHAT HAPPENED, NEVER UN-HAPPENED.
--
-- Design v3, iteration 2 ("abuse-proof endings", DR-20260925-MYSTERY-
-- BOUNDARIES). Three append-only records and one pure fold:
--
--   known       (node, hour, mechanic)  - written once, on first REVEAL or
--               GATE satisfaction. Never deleted. Burning a found finding
--               changes nothing; iteration 2's speedrunner frame found that
--               destructible findings let a player force "carried" by
--               pruning the solution space, so `known` does not read the
--               world - only itself.
--   retracted   (node, hour)  - written only when a NOT-YET-known node's
--               backing world state is confirmed gone. Forecloses that node
--               for ever: it can never become known after.
--   reservation (physicalKey -> mystery id)  - one entry per physical key,
--               checked-and-set. A body, a car, a container belongs to at
--               most one mystery; iteration 2's speedrunner frame found a
--               shared corpse aliased across two mysteries' claims.
--
-- CLOSE is a PURE FOLD over known/retracted against the mystery's authored
-- predicate. "Carried" is never a transition a player causes - it is what
-- the fold reports when the predicate is nil. This module touches no PZ
-- API and holds no session state of its own: the caller passes a plain
-- ledger table (the shape `M.new()` returns) and gets a new one back or an
-- error; how it is stored in ModData is the adapter's job, not this one's.
local M={}

function M.new()
    return {known={},retracted={},reservation={}}
end

local function copy(t)
    local out={}
    for k,v in pairs(t) do out[k]=v end
    return out
end

-- Record a finding as known. First-time-only by node id: a second call for
-- the same node is a no-op that returns the ledger unchanged (iteration 2's
-- "REVEAL farming by re-forming a LINK across loads" - the ledger key
-- already existing is what makes re-triggering pointless).
function M.markKnown(ledger,node,hour,mechanic)
    if type(ledger)~="table" or type(node)~="string" or node=="" then return nil,"invalid" end
    if type(hour)~="number" or hour~=hour or hour<0 then return nil,"invalid hour" end
    if ledger.known[node] then return ledger end
    if ledger.retracted[node] then return nil,"node already retracted" end
    local out=copy(ledger); out.known=copy(ledger.known)
    out.known[node]={hour=hour,mechanic=mechanic}
    return out
end

-- Record a finding as permanently absent. Refused for a node already known
-- (the world cannot retract a fact the survivor already holds) and a
-- no-op for one already retracted.
function M.markRetracted(ledger,node,hour)
    if type(ledger)~="table" or type(node)~="string" or node=="" then return nil,"invalid" end
    if type(hour)~="number" or hour~=hour or hour<0 then return nil,"invalid hour" end
    if ledger.known[node] then return nil,"node already known" end
    if ledger.retracted[node] then return ledger end
    local out=copy(ledger); out.retracted=copy(ledger.retracted)
    out.retracted[node]=hour
    return out
end

-- Claim a physical key for a mystery. Idempotent for the same mystery,
-- refused for a different one already holding it - the reservation is the
-- fix for "one corpse aliased by two mysteries' reservations" (iteration 2).
function M.reserve(ledger,physicalKey,mysteryId)
    if type(ledger)~="table" or type(physicalKey)~="string" or physicalKey==""
        or type(mysteryId)~="string" or mysteryId=="" then return nil,"invalid" end
    local held=ledger.reservation[physicalKey]
    if held==mysteryId then return ledger end
    if held then return nil,"held by another mystery" end
    local out=copy(ledger); out.reservation=copy(ledger.reservation)
    out.reservation[physicalKey]=mysteryId
    return out
end

function M.isKnown(ledger,node) return ledger.known[node]~=nil end
function M.isRetracted(ledger,node) return ledger.retracted[node]~=nil end
function M.heldBy(ledger,physicalKey) return ledger.reservation[physicalKey] end

-- A CLOSE predicate is {kind="all"|"any"|"gate", keys={node,...}} or nil for
-- carried. `keys` for "gate" names exactly one node - the GATE finding
-- itself. Evaluated purely against the ledger; never touches the world.
--
-- Returns one of Vocabulary.CLOSE_KIND, and for "retracted" the node that
-- foreclosed it, so the record can say what happened without inventing why.
function M.close(ledger,predicate)
    if predicate==nil then return "carried" end
    if type(predicate)~="table" or type(predicate.keys)~="table" or #predicate.keys==0 then
        return nil,"invalid predicate"
    end
    if predicate.kind=="all" then
        for _,node in ipairs(predicate.keys) do
            if ledger.retracted[node] then return "retracted",node end
        end
        for _,node in ipairs(predicate.keys) do
            if not ledger.known[node] then return "carried" end
        end
        return "completed"
    elseif predicate.kind=="any" or predicate.kind=="gate" then
        for _,node in ipairs(predicate.keys) do
            if ledger.known[node] then return "completed" end
        end
        -- Retracted only when EVERY option is foreclosed - one live option
        -- is still a live mystery.
        for _,node in ipairs(predicate.keys) do
            if not ledger.retracted[node] then return "carried" end
        end
        return "retracted",predicate.keys[1]
    end
    return nil,"unknown predicate kind"
end

return M
