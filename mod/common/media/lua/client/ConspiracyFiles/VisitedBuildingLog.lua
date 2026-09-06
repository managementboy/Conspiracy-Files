-- ModData-backed writer/reader for the bounded set of visited buildings.
-- GeneratedRuntime records the player's current building as it plays; stale
-- clue relocation reads this set to avoid moving a document into a building
-- the player has already searched.
local V=require("ConspiracyFiles/VisitedBuildings")
local Budget=require("ConspiracyFiles/SaveBudget")
ConspiracyFiles=ConspiracyFiles or {}
local L=ConspiracyFiles.VisitedBuildingLog or {}
ConspiracyFiles.VisitedBuildingLog=L
local TAG="ConspiracyFiles.VisitedBuildings"

local function root()
    local store=ModData.get(TAG)
    if not store then return V.empty() end
    for key in pairs(store) do if key~="canonical" then error("unknown visited-buildings field") end end
    if store.canonical==nil then return V.empty() end
    local ok=V.validate(store.canonical)
    if not ok then error("invalid visited-buildings state") end
    return store.canonical
end
L.root=function() local ok,value=pcall(root); return ok and value or V.empty() end

function L.record(id)
    local ok,recorded=pcall(function()
        if type(id)~="string" then return false end
        local staged,changed=V.record(root(),id)
        if not staged or not changed then return false end
        if not Budget.check("visitedBuildings",{canonical=staged}) then return false end
        local store=ModData.getOrCreate(TAG)
        store.canonical=staged
        print("[CF-G2-RELOCATE] visited "..tostring(id))
        return true
    end)
    if not ok then print("[CF-G2-RELOCATE] visited-building not recorded: "..tostring(recorded)); return false end
    return recorded
end

function L.has(id) return V.has(L.root(),id) end

-- One bounded read for callers that need membership tests for several
-- candidate sites at once, rather than one ModData read per site.
function L.set()
    local out={}
    for _,id in ipairs(L.root().ids) do out[id]=true end
    return out
end

return L
