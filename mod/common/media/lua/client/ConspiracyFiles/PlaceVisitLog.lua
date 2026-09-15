-- ModData-backed writer/reader for the bounded per-place visit counts that
-- decide which places have earned a heading (P4-R81, WP6).
--
-- Deliberately a separate store from the discovery ledger. Visits are far
-- more frequent than discoveries and are worth far less: losing this whole
-- table costs some headings and not one recorded fact, which is exactly the
-- trade that lets it be small, capped and evictable.
local CFLog=require("ConspiracyFiles/Log")
local Visits=require("ConspiracyFiles/PlaceVisits")
local Budget=require("ConspiracyFiles/SaveBudget")
ConspiracyFiles=ConspiracyFiles or {}
local L=ConspiracyFiles.PlaceVisitLog or {}
ConspiracyFiles.PlaceVisitLog=L
local TAG="ConspiracyFiles.PlaceVisits"

local function root()
    local store=ModData.get(TAG)
    if not store then return Visits.empty() end
    for key in pairs(store) do if key~="canonical" then error("unknown place-visits field") end end
    if store.canonical==nil then return Visits.empty() end
    local ok=Visits.validate(store.canonical)
    if not ok then error("invalid place-visits state") end
    return store.canonical
end
L.root=function() local ok,value=pcall(root); return ok and value or Visits.empty() end

-- Record being at `place` while the ledger's highest discovery number is
-- `seq`. Returns the verdict ("first" / "swallowed" / "returned" / "invalid")
-- and the place's count.
--
-- Every call is logged with both numbers, because the point of shipping this
-- before any UI is to read a real session and find out whether ordinary play
-- produces returns at all. If it does not, the idea dies cheaply.
function L.visit(place,seq)
    local ok,verdict,n=pcall(function()
        local before=root()
        local previous=before.places[place]
        local staged,outcome,total,why=Visits.visit(before,place,seq)
        if not staged then return "invalid",0,why end
        if outcome=="returned" or outcome=="first" then
            if not Budget.check("placeVisits",{canonical=staged}) then return "invalid",0,"budget" end
            ModData.getOrCreate(TAG).canonical=staged
        end
        CFLog.message("places","note","visit "..tostring(place)
            .." stored="..tostring(previous and previous.seq or "none")
            .." now="..tostring(seq).." -> "..tostring(outcome).." n="..tostring(total))
        return outcome,total
    end)
    if not ok then CFLog.message("places","note","visit not recorded: "..tostring(verdict)); return "invalid",0 end
    return verdict,n
end

function L.counts() return Visits.counts(L.root()) end

return L
