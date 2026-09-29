-- THE CONTAINER KINDS A CLUE MAY NAME (DR-20260929-NOHELP-GAP-PLAN, E2).
-- The game's own fixed-container types, as the offline census of the map
-- found them (Generated/FixedContainerIndexData.lua D.types; a test keeps the
-- two lists equal). A clue's where entry may name up to M.MAX of them, in
-- order of preference: the exact one, then its fallbacks (owner, 2026-09-29).
-- If none is at the site the clue takes any container there, then a body
-- nearby, then the floor - never lost.
local M={MAX=6}
M.list={"barbecue","barbecuepropane","bin","brazier","campfire","cardboardbox","cashregister","clothingdryer","clothingdryerbasic","clothingrack","clothingwasher","coffin","composter","counter","crate","desk","dishescabinet","dishwasher","displaycase","displaycasebakery","displaycasebutcher","doghouse","dresser","dumpster","filingcabinet","fireplace","freezer","fridge","fruitbusha","fruitbushb","fruitbushc","fruitbushd","fruitbushe","grocerstand","locker","logs","medicine","metal_shelves","microwave","militarycrate","militarylocker","overhead","plankstash","postbox","restaurantdisplay","shelter","shelves","shelvesmag","sidetable","smallbox","smallcrate","stonefurnace","stove","tent","toolcabinet","trough","vendingpop","vendingsnack","wardrobe","woodstove"}
M.known={}
for _,k in ipairs(M.list) do M.known[k]=true end
-- A where entry's containers: a list of 1..MAX known kinds, no repeats.
function M.valid(list)
    if type(list)~="table" or #list<1 or #list>M.MAX then return false end
    local n,seen=0,{}
    for k in pairs(list) do n=n+1; if type(k)~="number" then return false end end
    if n~=#list then return false end
    for _,kind in ipairs(list) do
        if not M.known[kind] or seen[kind] then return false end
        seen[kind]=true
    end
    return true
end
return M
