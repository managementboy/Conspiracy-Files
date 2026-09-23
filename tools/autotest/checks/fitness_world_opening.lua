-- The Fitness Instructor world-evidence opening, observed in a running game.
-- Loaded by checks/fitness_world_opening.sh after core_loop and
-- profession_openings.
--
-- Every answer here is read from the WORLD or the PLAYER, never from the
-- record that says what should have happened. "Assigned" and "in the player's
-- hand" are different claims; so are "nine members authored" and "nine items
-- exist".
CFFit = CFFit or {}
local F = CFFit
local R = ConspiracyFiles.GeneratedRuntime
local Session = require("ConspiracyFiles/Generated/Session")

local function root()
    local w = ModData.get("ConspiracyFiles.Generated.G2")
    return w and w.canonical
end
local function docById(case, id)
    for _, d in ipairs(case.documents) do if d.id == id then return d end end
end

-- In-game minutes since the world began, so "how long before the key
-- appeared" is answered in the player's time, not the wall clock.
function F.minutes()
    local gt = getGameTime()
    return tostring(gt and gt:getWorldAgeHours() and math.floor(gt:getWorldAgeHours() * 60) or -1)
end

-- (1)(2)(3)(10) THE OPENING CLUE. Is it on the player, is it a real key, does
-- it carry the opening line, and what does the door say about it?
function F.opening()
    local r = root()
    if not r or not r.case then return "no-case" end
    local first = r.case.documents[1]
    local inv = getPlayer():getInventory():getItems()
    local held, itemType, voice, gotKey = false, "none", "none", false
    for i = 0, inv:size() - 1 do
        local it = inv:get(i)
        local md = it:getModData()
        if md and md.cfGeneratedId == first.id then
            held = true
            itemType = tostring(it:getFullType())
            voice = tostring(md.cfOpeningVoice or "none")
            -- A REAL KEY, asked of the item's own class rather than its title.
            gotKey = instanceof(it, "InventoryItem") and tostring(it:getFullType()):find("Key") ~= nil
        end
    end
    return table.concat({tostring(first.title), tostring(held), itemType, tostring(gotKey), voice,
        F.minutes()}, "\t")
end

-- (2) DOES THE KEY OPEN THE STARTING HOUSE? Asked of the door, not of the
-- key's title: a key that says "house key" and opens nothing is the failure
-- this is for.
function F.keyOpensHouse()
    local r = root()
    if not r or not r.case then return "no-case" end
    local first = r.case.documents[1]
    local a = r.assignments and r.assignments[first.id]
    local t = a and a.target
    if not t then return "no-target" end
    local inv = getPlayer():getInventory():getItems()
    local key
    for i = 0, inv:size() - 1 do
        local md = inv:get(i):getModData()
        if md and md.cfGeneratedId == first.id then key = inv:get(i) end
    end
    if not key then return "key-not-held" end
    -- Walk the squares of the starting building looking for a door this key
    -- opens. getKeyId is what the engine matches on.
    local cell = getCell()
    local keyId = key.getKeyId and key:getKeyId() or nil
    local doors, matched = 0, 0
    for dx = -12, 12 do for dy = -12, 12 do
        local sq = cell:getGridSquare(t.x + dx, t.y + dy, t.z)
        if sq then
            local objs = sq:getObjects()
            for i = 0, math.min(32, objs:size()) - 1 do
                local o = objs:get(i)
                if instanceof(o, "IsoDoor") or instanceof(o, "IsoThumpable") then
                    doors = doors + 1
                    local ok, id = pcall(function() return o:getKeyId() end)
                    if ok and id and keyId and id == keyId then matched = matched + 1 end
                end
            end
        end
    end end
    return table.concat({tostring(keyId), tostring(doors), tostring(matched)}, "\t")
end

-- (4)(5) THE THREE WORLD ANCHORS. For each: is it assigned, has it been
-- placed, and - for the grouped one - how many real items exist at its
-- target. Nine items and ONE finding is the claim; both halves are counted.
function F.anchors()
    local r = root()
    if not r or not r.case then return "no-case" end
    local out = {}
    for _, d in ipairs(r.case.documents) do
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        local items, members = 0, 0
        if type(d.members) == "table" then for _, m in ipairs(d.members) do members = members + (m.quantity or 1) end end
        if t then
            local sq = getCell():getGridSquare(t.x, t.y, t.z)
            if sq then
                local objs = sq:getObjects()
                for i = 0, math.min(48, objs:size()) - 1 do
                    local o = objs:get(i)
                    for ci = 0, math.min(8, (o.getContainerCount and o:getContainerCount() or 0)) - 1 do
                        local c = o:getContainerByIndex(ci)
                        if c then
                            local list = c:getItems()
                            for k = 0, list:size() - 1 do
                                local md = list:get(k):getModData()
                                if md and md.cfGeneratedId == d.id then items = items + 1 end
                            end
                        end
                    end
                end
            end
        end
        out[#out + 1] = table.concat({d.id:match("document%-(%d+)$") or d.id,
            tostring(d.title), tostring(a and a.status or "none"),
            tostring(members), tostring(items)}, ":")
    end
    return table.concat(out, "\t")
end

-- (6)(7) THE VEHICLE SCENE. Whether a stable scene has been confirmed, and
-- whether clue five is still waiting for one.
function F.vehicle()
    local r = root()
    if not r or not r.case then return "no-case" end
    local V = ConspiracyFiles.VanillaSceneRuntime
    local confirmed = V and V.confirmed and V.confirmed() or nil
    local n = 0
    if type(confirmed) == "table" then for _ in pairs(confirmed) do n = n + 1 end end
    local vid, status, sig
    for _, d in ipairs(r.case.documents) do
        if d.placementIntent == "vehicle" or d.sceneKind then
            vid = d.id
            local a = r.assignments and r.assignments[d.id]
            status = a and a.status or "none"
            sig = a and a.target and a.target.sceneSignature or "none"
        end
    end
    return table.concat({tostring(n), tostring(vid and "yes" or "no"),
        tostring(status), tostring(sig)}, "\t")
end

-- (8) A SIGNATURE OF EVERYTHING THAT MUST SURVIVE A RELOAD.
function F.signature()
    local r = root()
    if not r or not r.case then return "no-case" end
    local parts = {}
    for _, d in ipairs(r.case.documents) do
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        parts[#parts + 1] = (d.id:match("document%-(%d+)$") or d.id) .. "="
            .. tostring(a and a.status) .. "@"
            .. (t and (t.x .. "," .. t.y .. "," .. t.z) or "none")
            .. (t and t.sceneSignature and ("#" .. tostring(t.sceneSignature)) or "")
    end
    table.sort(parts)
    return table.concat(parts, " ")
end
return true
