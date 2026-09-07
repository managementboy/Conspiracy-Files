-- ModData-backed store for the token->observed-outfit association the
-- notebook needs to mention a corpse's outfit alongside a document found on
-- the same body (docs/design/USING_GAME_ASSETS.md, Phase 1). Same house
-- style as PersonNameLog: validated, bounded, copy-on-write, gated by
-- SaveBudget, no metatables.
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
        print("[CF-OUTFIT] recorded outfit for token "..tostring(token))
        return true
    end)
    if not ok then print("[CF-OUTFIT] Not recorded: "..tostring(recorded)); return false end
    return recorded
end

function L.outfitFor(token)
    local ok,outfit=pcall(Outfits.outfitFor,L.root(),token)
    return ok and outfit or nil
end

return L
