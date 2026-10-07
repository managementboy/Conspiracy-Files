-- OBJECT PLAUSIBILITY (Of Interest phase 6). PURE. Per place code (OF_INTEREST_CODES.md) a small deny-list of
-- item KINDS that make no sense beside a note of that place: a weapon in a hospital scene, civilian clothing in
-- a military one, alcohol in a school. The placers filter their recipe choices through it and the manifest
-- linter (tools/ofinterest/lint_manifest.lua) checks every generated scene again. Ids and codes only.
local M={}
M.kinds={
    weapon={"Saw","HandShovel","Dart","Wrench","Pliers","Screwdriver","Whetstone"},
    alcohol={"Wine"},
    smoking={"CigarettePack","Lighter","Matches"},
    civilian={"Hat_BaseballCap","Gloves_LeatherGloves","Socks_Ankle","Scarf_White","Necklace_Gold","Lipstick"},
    food={"Egg","Milk","Butter","Pop","Crisps","Sandwich","Apple","Peanuts","Chocolate","Bread"},
    toy={"Doll","Dice_6","GolfBall","Harmonica","Baseball","Doodle"},
}
-- place code -> kinds that do not belong there
M.deny={
    [1]={"weapon","alcohol","smoking","toy"},          -- hospital
    [2]={"toy"},                                        -- police station
    [3]={"alcohol"},                       -- prison
    [4]={"civilian","alcohol","toy"},                   -- military
    [6]={"weapon","smoking","toy"},                     -- church
    [7]={"weapon","alcohol","smoking"},                 -- school
    [10]={"weapon","alcohol","smoking","food","toy"},   -- laboratory
    [11]={"weapon","alcohol","smoking","food"},         -- library
}
local kindOf={}
for k,l in pairs(M.kinds) do for _,id in ipairs(l) do kindOf[id]=kindOf[id] or {}; kindOf[id][#kindOf[id]+1]=k end end
-- true, item id, kind when an object does not belong with a note of this place
function M.denied(place,objects)
    local d=place and M.deny[place]
    if not d then return false end
    local set={}; for _,k in ipairs(d) do set[k]=true end
    for _,o in ipairs(objects) do
        for _,k in ipairs(kindOf[o] or {}) do if set[k] then return true,o,k end end
    end
    return false
end
return M
