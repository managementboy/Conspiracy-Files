-- Which of the owner's interesting places a nearby building is (No Help,
-- DECISIONS.md, DR-20260927-NOHELP-RULE-PLACEMENT), from what the nearby scan
-- already reports: its T3 category (T3Selection) and its room names.
--
-- T3 detection is advisory, never authoritative (T3 spike policy): this only
-- decides which kind of place a building is TREATED as for clue choice. It
-- maps nothing it has not seen verified. Homes, garages, restaurants and
-- ordinary shops map to nothing and get no clues. Farms, warehouses,
-- government buildings, checkpoints and places named on vanilla maps are not
-- reachable from the nearby scan's categories; they come from the address
-- book, vanilla map marks and vanilla scenes (task 3 plan, steps 4-5).
local M={}

local byCategory={
    ["public-service"]="police",
    medical="hospital",
    office="office",
    communications="transmission",
}

-- category: the scan's categoryHint; roomNames: a set or list of room names.
function M.of(category,roomNames)
    local place=byCategory[category]
    if place then return place end
    if category=="retail" and type(roomNames)=="table" then
        for k,v in pairs(roomNames) do
            if k=="bookstore" or v=="bookstore" then return "bookstore" end
        end
    end
    return nil
end

return M
