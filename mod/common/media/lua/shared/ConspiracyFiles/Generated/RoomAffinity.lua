-- Phase 2 of docs/design/USING_GAME_ASSETS.md: "room labels constrain roles".
--
-- Affinity is keyed on the carrier `kind` every document already persists
-- (dispatch, receipt, letter, ...), not on a role -- so this needs no schema
-- change and invalidates no existing save. It is a PREFERENCE for candidate
-- ORDERING only: Generated/Session.lua's createDistributed falls back to the
-- first unused candidate whenever nothing fits, and a stored target is still
-- exactly {x,y,z,objectIndex,containerIndex,containerType,sprite}. Nothing
-- here can block placement.
--
-- docs/research/T3_LOCATION_CATEGORISATION.md is the reason this stays a
-- preference: exact room labels are useful, but generic categorisation is
-- not reliable, and generation must never fail because no room matched (see
-- the MAX_ACTIVE=2 incident this table must not repeat).
local EvidenceKinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local M={}

-- Room names actually observed from T3 (docs/research/T3_LOCATION_CATEGORISATION.md,
-- "2026-09-05 -- structured nearby extraction trial"). Kept as a closed list
-- so a typo in `affinity` below is caught at load time rather than silently
-- matching nothing forever.
local rooms={
    hall=true,kitchen=true,bedroom=true,kidsbedroom=true,livingroom=true,
    bathroom=true,closet=true,office=true,toolstore=true,garagestorage=true,
    derelict=true,
}

-- Starting affinity table from the design doc, kept small and legible:
-- work paperwork prefers office/work-storage rooms; personal carriers prefer
-- lived-in rooms; a key prefers rooms plausible for it to be kept or issued
-- from; cards/tickets prefer rooms a person would keep them or an office
-- would file them. `notebook` (a field notebook) is grouped with the other
-- work-paperwork carriers for the same reason as dispatch/receipt/notepad.
local affinity={
    dispatch={office=true,toolstore=true,garagestorage=true},
    receipt={office=true,toolstore=true,garagestorage=true},
    notepad={office=true,toolstore=true,garagestorage=true},
    clipping={office=true,toolstore=true,garagestorage=true},
    notebook={office=true,toolstore=true,garagestorage=true},
    diary={bedroom=true,livingroom=true},
    letter={bedroom=true,livingroom=true},
    key={office=true,garagestorage=true,closet=true},
    idcard={bedroom=true,livingroom=true,office=true},
    creditcard={bedroom=true,livingroom=true,office=true},
    businesscard={bedroom=true,livingroom=true,office=true},
    ticket={bedroom=true,livingroom=true,office=true},
}

-- Object evidence (2026-09-09) cannot be listed here: it comes from a
-- catalogue of several thousand items derived from the game's own scripts, so
-- its room preference is derived too - from the item's DisplayCategory, which
-- is the game's own statement about what kind of thing it is.
--
-- This is what lets a rule ask for the RIGHT room or a WRONG one. Owner's two
-- examples are the two shapes: a hundred eggs in the fridge is the right room
-- and an impossible count; fifty bricks in the bedroom is an ordinary count in
-- a room that has no business holding them.
local ObjectCatalogue=require("ConspiracyFiles/Generated/ObjectCatalogue")
local categoryRooms={
    Food={kitchen=true},
    Cooking={kitchen=true},
    WaterContainer={kitchen=true},
    Household={kitchen=true,bathroom=true,closet=true},
    Hygiene={bathroom=true},
    FirstAid={bathroom=true},
    Bandage={bathroom=true},
    ProtectiveGear={closet=true,garagestorage=true},
    Gardening={garagestorage=true,toolstore=true},
    Tool={toolstore=true,garagestorage=true},
    Material={toolstore=true,garagestorage=true},
    Camping={closet=true,garagestorage=true},
    Container={closet=true,garagestorage=true},
    Electronics={livingroom=true,office=true},
    Junk={garagestorage=true,derelict=true},
    Memento={bedroom=true,livingroom=true},
    Accessory={bedroom=true,closet=true},
    Clothing={bedroom=true,closet=true},
    Literature={livingroom=true,bedroom=true,office=true},
}
for category,set in pairs(categoryRooms) do
    for room in pairs(set) do
        assert(rooms[room],"RoomAffinity: unknown room name "..tostring(room).." for category "..category)
    end
end

-- The rooms an object kind belongs in, or nil when the game gives us no
-- opinion - in which case neither "right room" nor "wrong room" means
-- anything, and the caller must fall back rather than guess.
local function objectRooms(kind)
    local item=ObjectCatalogue.get(kind)
    if not item then return nil end
    return categoryRooms[item.category]
end

-- Validated once at module load: every affinity entry must name a real
-- evidence kind and only known room labels, so a typo cannot silently
-- disable ordering for a whole kind.
for kind,set in pairs(affinity) do
    assert(EvidenceKinds.get(kind),"RoomAffinity: unknown evidence kind "..tostring(kind))
    for room in pairs(set) do
        assert(rooms[room],"RoomAffinity: unknown room name "..tostring(room))
    end
end

-- True only when `room` is a known-good room label for `kind`. Any other
-- input (unknown kind, unknown/absent/non-string room) returns false rather
-- than guessing -- callers must already have a safe non-fitting fallback.
function M.fits(kind,room)
    if type(room)~="string" then return false end
    local set=affinity[kind] or objectRooms(kind)
    if not set then return false end
    return set[room]==true
end

-- True when the game has an opinion about where this kind belongs and this is
-- not one of those rooms. Deliberately NOT the negation of fits: an item the
-- catalogue says nothing about is not "in the wrong room", it is simply
-- unplaced, and treating the two alike would scatter unremarkable objects into
-- unremarkable rooms and call it evidence.
function M.avoids(kind,room)
    if type(room)~="string" then return false end
    local set=affinity[kind] or objectRooms(kind)
    if not set then return false end
    return set[room]~=true
end

-- What a document wants from a room. `roomIntent` is set by the generator on
-- the two documents where the room is part of the evidence; everything else
-- keeps the original behaviour exactly.
function M.prefers(doc,room)
    if type(doc)~="table" then return false end
    if doc.roomIntent=="wrong" then return M.avoids(doc.kind,room) end
    return M.fits(doc.kind,room)
end

return M
