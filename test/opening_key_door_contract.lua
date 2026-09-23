-- THE OPENING KEY MUST BE CUT FROM THE BUILDING, AND THE CLAIM MUST STAY
-- FALSIFIABLE.
--
-- Measured on Project Zomboid 42.20.4 (b0bbce05d5), 2026-09-23, in a fresh
-- Fitness Instructor world:
--
--   keyItemId = 37335555, buildingDefKeyId = 37335555   (identical)
--   every door of that building: getKeyId() = -1
--
-- and across a 121x121 tile census of the surrounding area:
--
--   doors=72  withRealKeyId=0  minus1=72
--   locked=50 lockedWithNoKeyId=50
--   buildings=11  buildingsWithDefKeyId=11  buildingsWithAMatchingDoor=0
--
-- So the mod cuts the key correctly - it copies the building definition's own
-- key id and verifies the assignment - and the engine locks doors without
-- stamping that id onto the door instance. isLocked() is true while
-- getKeyId() is -1. No door in the sampled area could accept any key.
--
-- This test does NOT assert that a door opens; that is a native question and
-- native runs answer it. It pins the two things that would let the failure be
-- hidden rather than fixed:
--
--   1. the key is cut from the building's own key id, not invented;
--   2. the native check still asks a door, rather than asking the key's title.
--
-- A key that says "house key" and opens nothing is the exact defect here, and
-- the cheapest way to make the gate go green would be to stop asking doors.
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
