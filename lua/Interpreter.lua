-- WHAT IS VISIBLE NOW, GIVEN THE LEDGER. RECOMPUTED, NEVER CACHED.
--
-- Design v3. Takes a mystery (Vocabulary shape) and a Ledger snapshot and
-- answers three pure questions: which REVEAL text is visible, whether a
-- GATE is satisfied, what CLOSE reports. No PZ dependency; no state of its
-- own between calls - the caller (the placement/runtime adapter) supplies
-- the ledger fresh each time, and this module's whole contract is that the
-- same mystery plus the same ledger always gives the same answer.
--
-- ONE DECISION FROM ITERATION 3'S ATTACK: a REVEAL is re-evaluated against
-- the ledger's CURRENT known/retracted state on every call - never cached
-- on first satisfaction. The attacker frame found that a cached "this
-- REVEAL is visible" flag survives a later retraction of one of its
-- required findings and shows text the ledger no longer supports; a pure
-- function recomputed each time cannot go stale, because there is nothing
-- to go stale.
local Ledger=require("ConspiracyFiles/Mystery/Ledger")
local Spoilage=require("ConspiracyFiles/Mystery/Spoilage")
local M={}

local function requirementsMet(ledger,requires)
    for _,node in ipairs(requires) do
        if Ledger.isRetracted(ledger,node) then return false,node end
        if not Ledger.isKnown(ledger,node) then return false end
    end
    return true
end

-- Every REVEAL whose `requires` are all known and none retracted, in
-- authored order. Each entry: {index, text}. `text` resolves a tier-
-- branching table ({fresh=,worn=,faded=,unplaced=}) against the finding
-- the reveal is about, when the reveal names one (`reveal.about`) and the
-- mystery's findings carry placement hours; a reveal with no `about` or a
-- plain string `text` is tier-blind and shows the same words always.
--
-- `placements` is an optional {findingId -> placedAtHour} the caller
-- supplies (the adapter knows this; the interpreter does not track world
-- state). `nowHour` is frozen once by the caller for the whole evaluation,
-- so every tier decision inside one call agrees with every other.
function M.visibleReveals(mystery,ledger,nowHour,placements)
    local out={}
    for i,reveal in ipairs(mystery.reveals or {}) do
        local ok=requirementsMet(ledger,reveal.requires)
        if ok then
            local text=reveal.text
            if type(text)=="table" then
                local finding=reveal.about and mystery.findings[reveal.about]
                local tier="fresh"
                if finding and placements then
                    tier=Spoilage.tier(finding.kind,placements[reveal.about],nowHour,finding.outdoor)
                end
                text=text[tier] or text.fresh or text.unplaced
            end
            if text then out[#out+1]={index=i,text=text} end
        end
    end
    return out
end

-- Whether a GATE's produced finding is known. Pure; the mechanic itself
-- (a door tried, a tool used) is the adapter's job to detect and to call
-- Ledger.markKnown for - this only reports what the ledger already holds.
function M.gateSatisfied(mystery,gateId,ledger)
    local gate=mystery.gates and mystery.gates[gateId]
    if not gate then return false,"unknown gate" end
    return Ledger.isKnown(ledger,gate.produces)
end

-- The mystery's current ending. A thin, explicit wrapper over Ledger.close
-- so a caller never has to know the ledger's internal predicate shape -
-- only that a mystery has a `close` field.
function M.close(mystery,ledger)
    return Ledger.close(ledger,mystery.close)
end

return M
