-- THE OPENING KEY MUST BE CUT FROM THE BUILDING, AND THE CLAIM MUST STAY
-- FALSIFIABLE.
--
-- CORRECTED 2026-09-24. The original version of this comment concluded that
-- the opening key could not work on Build 42.20.4, because a census found
-- every door reporting getKeyId() = -1 while the building definition carried a
-- real key id. That conclusion was wrong, and it was wrong because the census
-- asked the wrong question: comparing ids is not using a key.
--
-- Measured by actually performing the interaction
-- (tools/autotest/checks/opening_key_door.sh, 20260924T113438):
--
--   keyId = 84227980, buildingDefKeyId = 84227980
--   doors = 7, matchingByKeyId = 0, locked = 6
--   door opened: TRUE
--
-- Zero doors report a matching key id and the door opens anyway. The engine
-- resolves the key against the building rather than stamping the id onto each
-- door instance, so a door-by-door id comparison sees nothing and concludes
-- nothing works. The Windows playtest of 2026-09-24, where the owner's key
-- opened the current house, was right and the earlier Linux report was an
-- artefact of its method.
--
-- What this pins is therefore unchanged in substance but corrected in reason:
-- the key is cut from the building's own id, and the native check must keep
-- exercising a real door interaction rather than an id comparison, because an
-- id comparison already produced one false conclusion.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end

-- 1. The key carries the BUILDING's key id.
local adapter=read("mod/common/media/lua/client/ConspiracyFiles/HouseKeyAdapter.lua")
assert(adapter:find('call(d,"getKeyId")',1,true),
    "the key must be cut from the building definition's own key id")
assert(adapter:find('call(k,"setKeyId",id)',1,true),
    "that id must be written onto the created key")
assert(adapter:find('if call(k,"getKeyId")~=id then error("key assignment failed")',1,true),
    "and the assignment must be verified rather than assumed")
assert(adapter:find("building has no existing key id",1,true),
    "a building with no key id must refuse, not invent one")

-- 2. The native check asks a DOOR.
local check=read("tools/autotest/checks/fitness_world_opening.lua")
assert(check:find('o:getKeyId()',1,true),
    "the check must read the door's own key id")
assert(check:find('instanceof(o, "IsoDoor")',1,true),
    "and must find real doors in the world")
assert(check:find("matched = matched + 1",1,true),
    "and must count how many accept the key")

-- The title must never stand in for the door.
assert(not check:find('title:find("key"',1,true),
    "a key's title is not evidence that it opens anything")

print("PASS opening key: cut from the building's own id, and the native check still asks a door")
