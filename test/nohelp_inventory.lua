-- The No Help placeholder inventory (task 3 plan, step 0) is a fair fixture:
-- shaped so later steps cannot pass by accident. This checks the fixture, not
-- the product, so it is not named as proof of any directive.
package.path="mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;"..package.path
local Inventory=require("nohelp_inventory")
local Catalogue=require("NHShared/Generated/ObjectCatalogue")

local leans={}
for _,lean in ipairs(Inventory.leans) do leans[lean]=true end
assert(#Inventory.leans==2,"exactly two conspiracies")

local sets,ids,pieceSets,sawRepeat=0,{},{},false
local mix={}   -- place..lean -> {set=n, written=n}
local spotHosts={}
for _,clue in ipairs(Inventory.clues) do
    assert(not ids[clue.id],"duplicate clue id "..clue.id); ids[clue.id]=true
    if clue.kind=="set" then
        sets=sets+1
        assert(#clue.pieces>=2 and #clue.pieces<=4,clue.id.." a set holds 2-4 pieces")
        local seen,key={},{}
        for _,p in ipairs(clue.pieces) do
            assert(p~="Note",clue.id.." a set is not a written clue in disguise")
            if seen[p] then sawRepeat=true end; seen[p]=true; key[#key+1]=p
        end
        table.sort(key); key=table.concat(key,"+")
        assert(not pieceSets[key],clue.id.." repeats another set's pieces"); pieceSets[key]=true
    else
        assert(clue.kind=="written",clue.id.." is a set or written")
    end
    if clue.kind=="set" then
        for _,piece in ipairs(clue.pieces) do
            assert(Catalogue.get(piece),clue.id.." piece "..piece.." is not a vanilla catalogue item")
        end
    end
    local spotsUsed={}
    for _,w in ipairs(clue.where) do
        assert(leans[w.lean],clue.id.." leans to an unknown theory")
        assert(leans[w.rival] and w.rival~=w.lean,clue.id.." names the other theory as its rival reading")
        local cell=w.place..":"..w.lean
        mix[cell]=mix[cell] or {set=0,written=0}
        mix[cell][clue.kind]=mix[cell][clue.kind]+1
        spotHosts[w.spot]=spotHosts[w.spot] or {}
        spotHosts[w.spot][w.lean]=true
        spotsUsed[w.spot]=true
    end
end
assert(sets*2>=#Inventory.clues,"at least half of the clues are object sets")
assert(sawRepeat,"one set holds two of the same item, so pieces are told apart by piece")
for _,place in ipairs(Inventory.places) do
    for _,lean in ipairs(Inventory.leans) do
        assert(mix[place..":"..lean],place.." cannot host a "..lean.." clue")
    end
end
local mixedCells=0
for _,m in pairs(mix) do if m.set>0 and m.written>0 then mixedCells=mixedCells+1 end end
assert(mixedCells>0,"set or written must not follow from place and lean alone")
for _,spot in ipairs(Inventory.spots) do
    for _,lean in ipairs(Inventory.leans) do
        assert(spotHosts[spot] and spotHosts[spot][lean],spot.." cannot host a "..lean.." clue")
    end
end
local differ=false
for _,clue in ipairs(Inventory.clues) do if clue.where[1].spot~=clue.where[2].spot then differ=true end end
assert(differ,"a clue's two leans may use different spots")
print("nohelp inventory: "..#Inventory.clues.." clues, "..sets.." object sets, "..#Inventory.places.." kinds of place")
