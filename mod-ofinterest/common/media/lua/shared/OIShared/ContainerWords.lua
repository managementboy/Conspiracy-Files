-- Where a clue lies, in words (owner screenshot, Windows, 2026-09-15: "In a
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
    oven="In an oven", microwave="In a microwave", stove="In a stove",
    washingmachine="In a washing machine", dryer="In a dryer", dishwasher="In a dishwasher",
    displaycase="In a display case", clothingdryer="In a dryer",
    -- P4-R134: the mailbox at the gate. The ENGINE calls it "postbox" (verified
    -- in a real game, 2026-09-18; Generated/Storage.MAILBOX names the string
    -- once). A survivor in Kentucky writes "mailbox", so that is what the
    -- record says - the same trick as "counter" reading "In a cupboard".
    postbox="In a mailbox",
}

-- A CLUE ON A CARRIER (P4-R134). A body's inventory has no container type of
-- its own: the engine answers "none", and the record read "accounted In a none
-- at 102 Dewey St." (campaign 20260917T234706).
--
-- A body lies AT an address and will still be there, so that is how it is
-- worded. The "On a zombie near ..." phrasing went with the walking carrier
-- itself (P4-R136, 2026-09-18): no path can reach it any more - Carriers.KINDS,
-- Session.CARRIER_KINDS and the scan all know only a corpse - so it is gone
-- rather than kept as words nothing can produce. A carrier line never says the
-- clue is lost (P4-R104).
M.CARRIER_PHRASES={corpse="On a body"}
M.CARRIER_JOIN={corpse="at"}

-- Where a clue on a carrier is, in one sentence. `address` may be nil - the
-- address book does not name every building, and a zombie walks out of town.
-- Returns nil for anything that is not a carrier kind, so a caller cannot
-- accidentally word a cupboard this way.
function M.carrier(kind,address)
    local phrase=M.CARRIER_PHRASES[kind]
    if not phrase then return nil end
    if type(address)~="string" or address=="" then return phrase.." close by." end
    return phrase.." "..M.CARRIER_JOIN[kind].." "..address.."."
end

-- Container types that say nothing about what the container is. "none" is what
-- the engine gives a body, a zombie and anything else that never declared a
-- type; "floor" is the ground itself, which has its own wording. A caller must
-- choose words from what it knows instead of putting these after "In a".
M.NO_KIND={none=true, floor=true}

local function article(word)
    local first=string.lower(string.sub(word,1,1))
    return (first=="a" or first=="e" or first=="i" or first=="o" or first=="u") and "an" or "a"
end

-- `kind` is the container's type id; `title` the game's own name for it, when
-- there is one. A plural takes no article: "In seed bags", never "In a seed bags".
function M.phrase(kind,title)
    if type(kind)~="string" or kind=="" then return nil end
    -- Nothing usable: the caller says where from what else it knows.
    if M.NO_KIND[kind] then return nil end
    local known=M.PHRASES[kind]
    if known then return known end
    -- An unrecognised engine id is not necessarily an English noun. If the
    -- runtime cannot supply its visible title, say only what is known.
    if type(title)~="string" or title=="" then return "In a container" end
    local word=title
    word=string.lower(word)
    word=string.gsub(word,"_"," ")
    if string.sub(word,#word)=="s" then return "In "..word end
    return "In "..article(word).." "..word
end

return M
