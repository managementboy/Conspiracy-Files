-- The No Help placeholder inventory (task 3 plan, step 0) is shaped the way the
-- owner's directives need, so later steps are tested against a fair fixture:
--   NH-D1 every kind of place can host clues of both conspiracies;
--   NH-D5 at least half of the clues are object sets, counted per clue, and
--         every piece is a real vanilla item from the object catalogue.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local Inventory=require("nohelp_inventory")
local Catalogue=require("NHShared/Generated/ObjectCatalogue")

local leans={}
for _,lean in ipairs(Inventory.leans) do leans[lean]=true end
assert(#Inventory.leans==2,"exactly two conspiracies")

local sets,hosts=0,{}
for _,clue in ipairs(Inventory.clues) do
    if clue.kind=="set" then
        sets=sets+1
        assert(#clue.pieces>=2 and #clue.pieces<=4,clue.id.." a set holds 2-4 pieces")
    else
        assert(clue.kind=="written",clue.id.." is a set or written")
    end
    for _,piece in ipairs(clue.pieces) do
        assert(Catalogue.get(piece),clue.id.." piece "..piece.." is not a vanilla catalogue item")
    end
    assert(type(clue.rival)=="string" and clue.rival~="",clue.id.." names the rival reading")
    for _,w in ipairs(clue.where) do
        assert(leans[w.lean],clue.id.." leans to an unknown theory")
        hosts[w.place]=hosts[w.place] or {}
        hosts[w.place][w.lean]=true
    end
end
assert(sets*2>=#Inventory.clues,"at least half of the clues are object sets")
for _,place in ipairs(Inventory.places) do
    for _,lean in ipairs(Inventory.leans) do
        assert(hosts[place] and hosts[place][lean],place.." cannot host a "..lean.." clue")
    end
end
print("nohelp inventory: "..#Inventory.clues.." clues, "..sets.." object sets, "..#Inventory.places.." kinds of place")
