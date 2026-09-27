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
local M={revision="synthetic-nohelp-inventory-1"}

M.leans={"containment","agricultural"}

M.places={
    "police","hospital","office","bookstore","transmission","warehouse","government",
    "mapNamed","farm","checkpoint",
}

M.spots={"furniture","mailbox","vehicle","corpse","ground"}

-- Pieces are real vanilla catalogue ids (Generated/ObjectCatalogue.lua), picked
-- only because they exist. Written clues are carried on a vanilla note.
local setPieces={
    {"Twine","Tarp"},
    {"Bleach","Gloves_Surgical","Paperclip"},
    {"Rope","Wire","Fertilizer","Notebook"},
}

-- 12 object sets and 12 written clues. Each may go to two kinds of place, one
-- per lean, walking the place list so every kind of place can host both leans.
M.clues={}
for i=1,24 do
    local isSet=i%2==1
    local placeA=M.places[((i-1)%#M.places)+1]
    local placeB=M.places[(i%#M.places)+1]
    local spot=M.spots[((i-1)%#M.spots)+1]
    M.clues[i]={
        id=(isSet and "S" or "W")..string.format("%02d",i),
        kind=isSet and "set" or "written",
        pieces=isSet and setPieces[((i-1)%#setPieces)+1] or {"Note"},
        where={
            {place=placeA,spot=spot,lean=M.leans[1]},
            {place=placeB,spot=spot,lean=M.leans[2]},
        },
        rival="placeholder",
    }
end

return M
