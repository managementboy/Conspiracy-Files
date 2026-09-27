-- Step 0 of the No Help task 3 plan: an ID-only clue inventory for offline
-- tests. INVENTED PLACEHOLDERS. No clue here says anything, no piece is chosen
-- for what it would mean, and nothing here may be shipped or quoted as story;
-- real clues are authored separately and their direction comes from the owner.
--
-- The vocabulary is real, from the owner's decisions (DECISIONS.md,
-- DR-20260927-NOHELP-RULE-PLACEMENT):
--   leans   the two conspiracies;
--   places  the interesting places clues go around: research place types (T3),
--           places named on vanilla maps and flyers, farms and checkpoints;
--   spots   where inside a place a clue lies: the four the engine already
--           supports, plus open ground.
--
-- The shape is deliberately uneven where later code could otherwise pass by
-- accident (phase 1 review): whether a clue is a set does not follow from its
-- place or lean, a clue's two leans may use different spots, every set has its
-- own pieces, and one set holds two of the same item.
local M={revision="synthetic-nohelp-inventory-2"}

M.leans={"containment","agricultural"}

M.places={
    "police","hospital","office","bookstore","transmission","warehouse","government",
    "mapNamed","farm","checkpoint",
}

M.spots={"furniture","mailbox","vehicle","corpse","ground"}

-- Pieces are real vanilla catalogue ids (Generated/ObjectCatalogue.lua), picked
-- only because they exist. Every set is distinct; S-set 12 repeats an item on
-- purpose, so pieces must be told apart by piece, not by item type.
local setPieces={
    {"Twine","Tarp"},
    {"Bleach","Gloves_Surgical","Paperclip"},
    {"Rope","Wire","Fertilizer","Notebook"},
    {"Tarp","Rope"},
    {"Wire","Paperclip"},
    {"Gloves_Surgical","Twine","Notebook"},
    {"Fertilizer","Tarp"},
    {"Bleach","Rope","Wire"},
    {"Notebook","Twine"},
    {"Paperclip","Fertilizer","Gloves_Surgical"},
    {"Wire","Tarp","Rope","Twine"},
    {"Bleach","Bleach"},
}

-- Which of the 24 clues are sets: 12 of them, spread so that no place and no
-- lean is all-set or all-written.
local isSet={}
for _,i in ipairs({1,2,4,7,9,10,13,15,16,19,21,24}) do isSet[i]=true end

M.clues={}
local s=0
for i=1,24 do
    local placeA=M.places[((i-1)%#M.places)+1]
    local placeB=M.places[((i+3)%#M.places)+1]
    local spotA=M.spots[((i-1)%#M.spots)+1]
    local spotB=M.spots[((i*2)%#M.spots)+1]
    local pieces
    if isSet[i] then s=s+1; pieces=setPieces[s] else pieces={"Note"} end
    M.clues[i]={
        id=(isSet[i] and "S" or "W")..string.format("%02d",i),
        kind=isSet[i] and "set" or "written",
        pieces=pieces,
        where={
            {place=placeA,spot=spotA,lean="containment",rival="agricultural"},
            {place=placeB,spot=spotB,lean="agricultural",rival="containment"},
        },
    }
end

return M
