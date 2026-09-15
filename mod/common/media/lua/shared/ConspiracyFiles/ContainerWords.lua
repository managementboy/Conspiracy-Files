-- Where a paper lies, in words (owner screenshot, Windows, 2026-09-15: "In a
-- shelves at 105 Pattern St."). The line put the container's raw type id after
-- "In a", which is right for a desk and wrong for shelves. The game's own
-- container titles are no better as prose - a counter is "Cupboard", a dresser
-- "Drawer", a wardrobe "Cabinet", a bin "Garbage" - so the common kinds are
-- written out here, and anything else falls back to the game's title.
local M={}

M.PHRASES={
    shelves="On shelves", metal_shelves="On metal shelves",
    counter="In a cupboard", desk="In a desk", dresser="In a chest of drawers",
    sidetable="In a bedside drawer", officedrawers="In an office drawer",
    filingcabinet="In a filing cabinet", filecabinet="In a filing cabinet",
    crate="In a crate", militarycrate="In a military crate", wardrobe="In a wardrobe",
    locker="In a locker", fridge="In a fridge", freezer="In a freezer", bin="In a bin",
    medicine="In a medicine cabinet", clothingrack="On a clothing rack",
    smallbox="In a box", cardboardbox="In a box", toolbox="In a toolbox",
}

local function article(word)
    local first=string.lower(string.sub(word,1,1))
    return (first=="a" or first=="e" or first=="i" or first=="o" or first=="u") and "an" or "a"
end

-- `kind` is the container's type id; `title` the game's own name for it, when
-- there is one. A plural takes no article: "In seed bags", never "In a seed bags".
function M.phrase(kind,title)
    if type(kind)~="string" or kind=="" then return nil end
    local known=M.PHRASES[kind]
    if known then return known end
    local word=(type(title)=="string" and title~="") and title or kind
    word=string.lower(word)
    word=string.gsub(word,"_"," ")
    if string.sub(word,#word)=="s" then return "In "..word end
    return "In "..article(word).." "..word
end

return M
