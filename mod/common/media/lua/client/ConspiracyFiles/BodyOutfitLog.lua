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

function L.outfitFor(token)
    local ok,outfit=pcall(Outfits.outfitFor,L.root(),token)
    return ok and outfit or nil
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
    local ok,outfit=pcall(Outfits.describe,L.outfitFor(token))
    return ok and outfit or nil
end

return L
