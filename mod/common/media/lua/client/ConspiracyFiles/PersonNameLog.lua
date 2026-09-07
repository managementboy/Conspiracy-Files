-- ModData-backed store for the token->observed-name association PlayerVoice
-- needs to speak a name in Set B (see docs/design/PLAYER_VOICE.md). Same
-- house style as DiscoveryLog: validated, bounded, copy-on-write, gated by
-- SaveBudget, no metatables.
local Names=require("ConspiracyFiles/PersonNameObservations")
local Budget=require("ConspiracyFiles/SaveBudget")
ConspiracyFiles=ConspiracyFiles or {}
local L=ConspiracyFiles.PersonNameLog or {}
ConspiracyFiles.PersonNameLog=L
local TAG="ConspiracyFiles.PersonNameObservations"

local function root()
    local store=ModData.get(TAG)
    if not store then return Names.empty() end
    for key in pairs(store) do if key~="canonical" then error("unknown person name field") end end
    if store.canonical==nil then return Names.empty() end
    local ok=Names.validate(store.canonical)
    if not ok then error("invalid person name state") end
    return store.canonical
end
L.root=function() local ok,value=pcall(root); return ok and value or Names.empty() end

-- Record the name observed on a document found with a body's key/wallet.
-- Never invents a name: callers only ever pass what they parsed off a label.
-- Returns true once the token is known to carry this name (whether newly
-- recorded or already recorded); false only on refusal (contradiction,
-- invalid input, or a budget refusal).
function L.record(token,name)
    local ok,recorded=pcall(function()
        local staged,changed=Names.observe(root(),token,name)
        if not staged then return false end
        if not changed then return true end
        if not Budget.check("personNames",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        store.canonical=staged
        print("[CF-PERSONNAME] recorded name for token "..tostring(token))
        return true
    end)
    if not ok then print("[CF-PERSONNAME] Not recorded: "..tostring(recorded)); return false end
    return recorded
end

function L.nameFor(token)
    local ok,name=pcall(Names.nameFor,L.root(),token)
    return ok and name or nil
end

return L
