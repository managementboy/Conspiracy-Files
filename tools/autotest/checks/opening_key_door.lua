-- Stages for checks/opening_key_door.sh.
--
-- Reconciles two contradictory reports about the opening key:
--
--   Linux, 2026-09-23: two sampled starting-house keys opened none of the
--   tested doors. That check compared IsoDoor:getKeyId() against the key and
--   found every door reporting -1.
--
--   Windows, 2026-09-24: the owner's key opened the current house. No finding
--   was recorded, and the session console holds no keyDoorMatch line.
--
-- An id comparison and a door interaction are different questions, so this
-- asks BOTH and reports them side by side. The interaction is performed
-- through the game's own timed action, which is what the mod hooks, rather
-- than by reasoning about ids.
CFKeyDoor = {}
local K = CFKeyDoor

local function root()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    if type(store) ~= "table" then return nil end
    local C = require("ConspiracyFiles/Generated/SuccessiveCases")
    local wrapper = C.current(store)
    local roots = wrapper and C.sessions(wrapper)
    return roots and roots[1] or nil
end

local function openingKey()
    local r = root(); if not r or not r.case then return nil, "no case" end
    local first = r.case.documents[1]
    local inv = getPlayer():getInventory():getItems()
    for i = 0, inv:size() - 1 do
        local it = inv:get(i)
        local md = it:getModData()
        if md and md.cfGeneratedId == first.id then return it, first.id end
    end
    return nil, "the opening key is not in the survivor's inventory"
end

-- Every door of the building the key's target sits in, with the id comparison
-- the earlier Linux check made. Reported, not acted on.
function K.census()
    local key, why = openingKey()
    if not key then return "no-key: " .. tostring(why) end
    local r = root()
    local a = r.assignments and r.assignments[r.case.documents[1].id]
    local t = a and a.target
    if not t then return "no-target" end
    local keyId = key:getKeyId()
    local square = getCell():getGridSquare(t.x, t.y, t.z)
    local building = square and square:getBuilding()
    local def = building and building:getDef()
    local out = { "keyId=" .. tostring(keyId),
        "buildingDefKeyId=" .. tostring(def and def:getKeyId()) }
    local doors, matching, locked = 0, 0, 0
    if def then
        for x = def:getX() - 1, def:getX2() + 1 do
            for y = def:getY() - 1, def:getY2() + 1 do
                local s = getCell():getGridSquare(x, y, t.z)
                local objs = s and s:getObjects()
                for i = 0, (objs and objs:size() or 0) - 1 do
                    local o = objs:get(i)
                    if instanceof(o, "IsoDoor") then
                        doors = doors + 1
                        local okL, isL = pcall(function() return o:isLocked() end)
                        if okL and isL then locked = locked + 1 end
                        local okK, id = pcall(function() return o:getKeyId() end)
                        if okK and id == keyId then matching = matching + 1 end
                        if not K.door then K.door = o end
                        if okK and id == keyId then K.door = o end
                    end
                end
            end
        end
    end
    out[#out + 1] = "doors=" .. doors
    out[#out + 1] = "matchingByKeyId=" .. matching
    out[#out + 1] = "locked=" .. locked
    return table.concat(out, "\t")
end

-- The question the id comparison cannot answer: does using it record anything?
-- Runs the game's own action so the mod's ISOpenCloseDoor hook fires.
function K.useKeyOnDoor()
    local key = openingKey()
    if not key then return "no-key" end
    if not K.door then return "no-door" end
    local player = getPlayer()
    -- Stand beside the door, or the action refuses before it begins.
    local square = K.door:getSquare()
    if square then player:setX(square:getX() + 0.5); player:setY(square:getY() + 1.5)
        player:setZ(square:getZ()) end
    local before = K.rows()
    local ok, why = pcall(function()
        ISTimedActionQueue.add(ISOpenCloseDoor:new(player, K.door))
    end)
    return table.concat({ tostring(ok), tostring(why), "rowsBefore=" .. before }, "\t")
end

-- How many key-door observations the journal holds.
function K.rows()
    local J = ConspiracyFiles and ConspiracyFiles.KeyJournal
    if not (J and J.rows) then return -1 end
    local ok, rows = pcall(J.rows)
    if not ok or type(rows) ~= "table" then return -1 end
    local n = 0
    for _, row in ipairs(rows) do
        if tostring(row.id):find("keydoor:", 1, true) then n = n + 1 end
    end
    return n
end

function K.rowText()
    local J = ConspiracyFiles and ConspiracyFiles.KeyJournal
    local ok, rows = pcall(J.rows)
    if not ok then return "none" end
    for _, row in ipairs(rows) do
        if tostring(row.id):find("keydoor:", 1, true) then
            return (tostring(row.detailText):gsub("\n+", " \\n "))
        end
    end
    return "none"
end

-- Did the door actually move? The interaction's own result, independent of
-- whether the mod recorded anything.
function K.doorOpen()
    if not K.door then return "no-door" end
    local ok, open = pcall(function() return K.door:IsOpen() end)
    return tostring(ok and open)
end
return "opening key door stages loaded"
