-- SCENE OBJECT RECIPES (Of Interest phase 5): which 2-3 ordinary vanilla objects lie with a note.
-- Keys are the numeric codes of OF_INTEREST_CODES.md (place 1..13, theme 1..30); values are lists of
-- recipes, each recipe 2-3 ObjectCatalogue ids (real item types of the installed game, checked by
-- test/oi_story_placer.lua). Ids and codes only - never anything taken from a note. The placer picks by
-- hash(note id); a recipe's "object category" is the ObjectCatalogue category of its FIRST item, and the
-- parts of one story prefer different categories.
local M={}
M.place={
 [1]={{"Stethoscope","Pills","Tissue"},{"Book_Medical","Pen"},{"Clipboard","Pencil"},{"Hat_SurgicalMask","Gloves_Surgical"}},
 [2]={{"Book_Policing","Pen"},{"Badge","Key1"},{"Clipboard","Notepad"},{"PenLight","Notepad"}},
 [3]={{"Key1","Padlock"},{"Dice_6","Notepad"},{"Book_Bible","Pencil"}},
 [4]={{"Map","Whistle"},{"Book_Military","Pen"},{"Badge","CompassDirectional"},{"MilitaryMedal","Notepad"},{"CanteenMilitary","Map"}},
 [5]={{"BucketEmpty","Gloves_LeatherGloves","HandShovel"},{"Book_Farming","Pencil"},{"Egg","Milk","Butter"},{"Twine","Rope"},{"Leash","Whistle"}},
 [6]={{"Book_Bible","Candle"},{"Candle","Photo"},{"Doily","Card_Sympathy"},{"Necklace_Gold","Photo"}},
 [7]={{"Book_SchoolTextbook","Pencil","Eraser"},{"Notepad","Pen"},{"Whistle","Baseball"},{"Calculator","Eraser"},{"Glue","Paintbrush"}},
 [8]={{"Pliers","Screwdriver"},{"Gloves_LeatherGloves","Hat_BaseballCap"},{"Clipboard","Paperwork"},{"Whetstone","Nails"}},
 [9]={{"Map","Lighter"},{"Matches","CigarettePack"},{"Pop","Crisps"},{"Wrench","Key1"}},
 [10]={{"Gloves_Surgical","Hat_SurgicalMask"},{"Notebook","Pen"},{"Tweezers","Disinfectant"},{"Calculator","GraphPaper"}},
 [11]={{"Book_Fiction","Notepad"},{"Magazine","Pencil"},{"Catalog","Eraser"},{"Diary1","Pen"}},
 [12]={{"Clipboard","Pen"},{"Rope","Nails"},{"Pliers","Saw"},{"Paperwork","PaperclipBox"}},
 [13]={{"Plate","Spatula"},{"Pop","Sandwich"},{"Notepad","Pen"},{"Wine","Bowl"}},
}
M.theme={
 [1]={{"Pills","Tissue"},{"Bandage","Tissue"},{"PillsVitamins","WaterBottle"},{"Book_Medical","Tissue"},{"Antibiotics","Disinfectant"}},
 [2]={{"Card_Valentine","Photo"},{"Necklace_Gold","Photo"},{"Lipstick","Mirror"},{"Book_Romance","Candle"}},
 [3]={{"Clipboard","Pen"},{"Calculator","Notepad"},{"Paperwork","Stapler"},{"Hat_BaseballCap","Badge"}},
 [4]={{"Money","Notepad"},{"Calculator","Paperwork"},{"Wallet","Money"},{"Book_Business","Pen"}},
 [5]={{"Photo","Doll"},{"Card_Birthday","Pencil"},{"Teacup","Doily"},{"Sandwich","Apple"}},
 [6]={{"Book_Military","Pen"},{"Map","Whistle"},{"Socks_Ankle","Badge"}},
 [7]={{"Card_Sympathy","Candle"},{"Photo","Tissue"},{"Doll","Photo"}},
 [8]={{"Book_Farming","Pencil"},{"Twine","Rope"},{"Egg","Milk"}},
 [9]={{"Padlock","Key1"},{"Newspaper","Matches"},{"Money","Gloves_LeatherGloves"}},
 [10]={{"Card_Valentine","Pen"},{"Photo","Necklace_Gold"},{"Lipstick","Card_Valentine"}},
 [11]={{"Photo","Scissors"},{"Notepad","Pen"},{"Lighter","Matches"}},
 [12]={{"Card_Birthday","Chocolate"},{"Wine","Card_Sympathy"},{"Bread","Butter","Milk"}},
 [13]={{"Key1","Notepad"},{"Diary1","Pen"},{"Padlock","Key1"}},
 [14]={{"Money","Wallet"},{"Calculator","Money"},{"Wallet","Notepad"}},
 [15]={{"Clipboard","Paperwork"},{"Stapler","Paperwork"},{"Badge","Clipboard"}},
 [16]={{"Notepad","Pen"},{"Postcard","Pencil"}},
 [17]={{"Hat_SurgicalMask","Tissue"},{"Gloves_Surgical","Disinfectant"},{"Notepad","Hat_SurgicalMask"}},
 [18]={{"Photo","Candle"},{"Book_Bible","Pencil"},{"Card_Birthday","Photo"}},
 [19]={{"Photo","Pen"},{"Wallet","Photo"},{"Book_Fiction","Pencil"}},
 [20]={{"Padlock","Notepad"},{"Newspaper","Matches"},{"Key1","Notepad"}},
 [21]={{"Card_Sympathy","Photo"},{"Candle","Doily"},{"Photo","Tissue"}},
 [22]={{"Book_Business","Pen"},{"Calculator","Paperwork"},{"Clipboard","Pen"}},
 [23]={{"Photo","Tissue"},{"Card_Sympathy","Pencil"},{"Doll","Photo"}},
 [24]={{"Notepad","Pen"},{"Pencil","Notepad"},{"Postcard","Pen"}},
 [25]={{"Pills","Tissue"},{"Bandage","Tissue"},{"PillsVitamins","WaterBottle"}},
 [26]={{"Photo","Baseball"},{"Card_Birthday","Pen"},{"Photo","Pencil"}},
 [27]={{"Photo","Comb"},{"Card_Birthday","Photo"},{"Diary1","Pen"}},
 [28]={{"Map","Key1"},{"Map","Pencil"},{"Wallet","Notepad"}},
 [29]={{"Paperwork","Stapler"},{"Clipboard","Pen"},{"Badge","Paperwork"}},
 [30]={{"Hat_BaseballCap","Badge"},{"Clipboard","Pencil"},{"Paperwork","PaperclipBox"}},
}
-- Used when a note's place and themes give nothing unused: one recipe per object category, so a
-- 12-part story still finds 12 different kinds of object.
M.general={
 {"Needle","Thread"},{"Magazine","Pencil"},{"Sponge","Soap2"},{"MugWhite","Spoon"},{"Apple","Peanuts"},
 {"Dice_6","Doodle"},{"Earbuds","Battery"},{"Scarf_White","Gloves_LeatherGloves"},{"Socks_Ankle","Scarf_White"},
 {"GolfBall","Dart"},{"Harmonica","GuitarPick"},{"Mirror","Lipstick"},{"HandShovel","GardeningSprayEmpty"},
 {"Bandage","Tissue"},{"VHS_Home","Disc_Retail"},{"Padlock","Key1"},{"Comb","Toothbrush"},{"Candle","Matches"},
}
return M
