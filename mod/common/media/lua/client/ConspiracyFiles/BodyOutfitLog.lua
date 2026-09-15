-- ModData-backed store for the token->observed-outfit association the
-- notebook needs to mention a corpse's outfit alongside a document found on
-- the same body (docs/design/USING_GAME_ASSETS.md, Phase 1). Same house
-- style as PersonNameLog: validated, bounded, copy-on-write, gated by
-- SaveBudget, no metatables.
local CFLog=require("ConspiracyFiles/Log")
local Outfits=require("ConspiracyFiles/BodyOutfitObservations")
local Budget=require("ConspiracyFiles/SaveBudget")
ConspiracyFiles=ConspiracyFiles or {}
local L=ConspiracyFiles.BodyOutfitLog or {}
ConspiracyFiles.BodyOutfitLog=L
local TAG="ConspiracyFiles.BodyOutfitObservations"

-- Why an outfit line did NOT appear. Every way to it is silent by design - a
-- body with no readable outfit records nothing, an outfit with no written
-- line says nothing - which leaves a playtest unable to tell "never met a
-- distinctively dressed body" from "met one and dropped it" (O2, and the
-- 2026-09-08 audit's silent returns). Off by default; from the debug console:
--   ConspiracyFiles.BodyOutfitLog.verbose=true
-- Each reason is said once per body, so a list refreshing every second does
-- not repeat it.
L.verbose=false
local said,saidCount={},0
local SAID_MAX=200
local function why(token,reason)
    if not L.verbose then return end
    local key=tostring(token).."|"..reason
    if said[key] or saidCount>=SAID_MAX then return end
    said[key]=true; saidCount=saidCount+1
    CFLog.message("outfit","outfit","no outfit line for token "..tostring(token)..": "..reason)
end

local function root()
    local store=ModData.get(TAG)
    if not store then return Outfits.empty() end
    for key in pairs(store) do if key~="canonical" then error("unknown body outfit field") end end
    if store.canonical==nil then return Outfits.empty() end
    local ok=Outfits.validate(store.canonical)
    if not ok then error("invalid body outfit state") end
    return store.canonical
end
L.root=function() local ok,value=pcall(root); return ok and value or Outfits.empty() end

-- Record the outfit IsoDeadBody:getOutfitName() reported for a corpse,
-- against that body's existing provenance token. Never invents an outfit:
-- callers only ever pass what the engine returned. Returns true once the
-- token is known to carry this outfit (whether newly recorded or already
-- recorded); false only on refusal (contradiction, invalid input, or a
-- budget refusal).
function L.record(token,outfit)
    local ok,recorded=pcall(function()
        local staged,changed=Outfits.observe(root(),token,outfit)
        if not staged then return false end
        if not changed then return true end
        if not Budget.check("bodyOutfits",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        store.canonical=staged
        CFLog.message("outfit","outfit","recorded outfit for token "..tostring(token))
        return true
    end)
    if not ok then CFLog.message("outfit","outfit","Not recorded: "..tostring(recorded)); return false end
    return recorded
end

-- The body was observed but gave no outfit to record.
function L.noOutfit(token)
    why(token,"the body reported no readable outfit")
end

function L.outfitFor(token)
    local ok,outfit=pcall(Outfits.outfitFor,L.root(),token)
    if not ok then why(token,"the outfit store could not be read: "..tostring(outfit)); return nil end
    return outfit
end

-- What the notebook may print. outfitFor returns the game's raw id, because
-- that is the observation and the store keeps facts; this is the same value
-- turned into words, and nil where the id identifies nobody. Keeping them
-- apart means a stored observation is never rewritten for presentation.
function L.readableOutfitFor(token)
    -- WP3. A written line, from a closed table, or nothing. The raw id is
    -- still what gets stored - it is the game's own fact - but an id the mod
    -- has no words for stays unsaid rather than being turned into words
    -- automatically. A future game update must not be able to put a new word
    -- in the survivor's mouth.
    local raw=L.outfitFor(token)
    if raw==nil then why(token,"no outfit recorded for this body"); return nil end
    local ok,outfit=pcall(Outfits.describe,raw)
    if not ok then why(token,"describing '"..tostring(raw).."' failed: "..tostring(outfit)); return nil end
    if outfit==nil then why(token,"outfit '"..tostring(raw).."' has no written line (generic clothes, or not in the table)") end
    return outfit
end

return L
