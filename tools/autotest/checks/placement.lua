-- THE PLACEMENT MISMATCH: a clue the record calls `placed` that is not in the
-- container the record names. Reported from three of nine overnight runs, never
-- reproduced, never explained.
--
-- What this file is for: catching ONE such discrepancy and describing it
-- completely, before anything can change it.
--
-- CAPTURE IS ATOMIC. The mod relocates a stale clue, retries a refused write
-- and drops an expired one, all from scheduler jobs on the game's own ticks. So
-- `CFPlace.verify()` does the whole job - walk every placed clue, find the
-- first discrepancy, and dump everything about it - inside a SINGLE Lua
-- evaluation. No tick can run between noticing and recording, which is the only
-- way the dump describes the state that was actually wrong rather than the
-- state after the mod tidied up.
--
-- THREE FAILURES ARE KEPT APART, because they have different causes and looked
-- identical in every log we have:
--   placed-absent   the record says `placed`, the container does not have it.
--                   THE FAULT UNDER INVESTIGATION.
--   never-placed    `deferred` or `dropped` - the clue was never in the world
--                   (P4-R133). Not a mismatch; the record is honest.
--   carrier-gone    a carrier clue whose carrier cannot be found, or one
--                   dropped by that path (`droppedFrom=="carrier"`, P4-R141).
--                   The clue WAS out there; its container walked away.
CFPlace = {}
local S = require("ConspiracyFiles/Generated/Session")
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired = require("ConspiracyFiles/Generated/RetiredCase")
local World = require("ConspiracyFiles/WorldAccess")

local TAG = "ConspiracyFiles.Generated.G2"
local function roots()
    local wrapper = ModData and ModData.get and ModData.get(TAG)
    if not wrapper then return {} end
    local ok, list = pcall(Cases.sessions, wrapper)
    if not ok or type(list) ~= "table" then return {} end
    local live = {}
    for _, r in ipairs(list) do if not Retired.isRetired(r) then live[#live + 1] = r end end
    return live
end

-- Which failure is this, from the record alone.
local function category(a)
    if not a then return "no-assignment" end
    if a.status == "deferred" then return "never-placed" end
    if a.status == "dropped" then
        if a.droppedFrom == "carrier" then return "carrier-gone" end
        return "never-placed"
    end
    if a.target and type(a.target.carrierMark) == "string" and a.missingHours then return "carrier-gone" end
    return "placed"
end

-- Every clue of every live case, by category. Cheap, non-mutating, and the
-- number the shell polls until placement has settled.
function CFPlace.clues()
    local n = { placed = 0, ["never-placed"] = 0, ["carrier-gone"] = 0, pending = 0, other = 0 }
    for _, root in ipairs(roots()) do
        for _, d in ipairs(root.case.documents) do
            local a = root.assignments[d.id]
            local c = category(a)
            if c == "placed" then
                if a.status == "placed" then n.placed = n.placed + 1 else n.pending = n.pending + 1 end
            elseif n[c] then n[c] = n[c] + 1 else n.other = n.other + 1 end
        end
    end
    return table.concat({ n.placed, n.pending, n["never-placed"], n["carrier-gone"], n.other }, "\t")
end

-- Is the token in this container?
local function inContainer(container, token)
    local items = container and container.getItems and container:getItems()
    for i = 0, (items and items:size() or 0) - 1 do
        local md = items:get(i):getModData()
        if type(md) == "table" and md.cfPhysicalToken == token then return true end
    end
    return false
end

-- The item anywhere within `radius` squares of the recorded one, searched wider
-- than the mod itself searches. The Chebyshev distance is the number that
-- settles whether the record was wrong or merely narrow.
local function tokenNear(cx, cy, cz, radius, token)
    local cell = getCell and getCell()
    if not cell then return nil end
    for r = 0, radius do
        for dx = -r, r do for dy = -r, r do
            if math.max(math.abs(dx), math.abs(dy)) == r then
                local sq = cell:getGridSquare(cx + dx, cy + dy, cz)
                local objects = sq and sq:getObjects()
                for i = 0, (objects and objects:size() or 0) - 1 do
                    local o = objects:get(i)
                    for c = 0, (o.getContainerCount and o:getContainerCount() or 0) - 1 do
                        if inContainer(o:getContainerByIndex(c), token) then
                            return string.format("%d,%d,%d r=%d type=%s sprite=%s",
                                cx + dx, cy + dy, cz, r,
                                tostring(o:getContainerByIndex(c).getType and o:getContainerByIndex(c):getType()),
                                tostring(o:getSprite() and o:getSprite():getName()))
                        end
                    end
                end
            end
        end end
    end
    return nil
end

-- THE SURVIVOR'S OWN BAGS, which the mod's own finder does not search for a
-- placed clue. A clue already picked up would read as "missing from its
-- container" and be a false alarm - the evidence album files papers into
-- itself, which is exactly how CFLoop.carried() was wrong before (fixed by
-- getOutermostContainer). Walks nested containers to a sane depth.
local function inPlayer(token, container, depth)
    container = container or (getPlayer and getPlayer() and getPlayer():getInventory())
    if not container or (depth or 0) > 4 then return nil end
    local items = container.getItems and container:getItems()
    for i = 0, (items and items:size() or 0) - 1 do
        local item = items:get(i)
        local md = item and item.getModData and item:getModData()
        if type(md) == "table" and md.cfPhysicalToken == token then
            return "player inventory, depth " .. (depth or 0)
        end
        local inner = item and item.getInventory and item:getInventory()
        if inner then
            local found = inPlayer(token, inner, (depth or 0) + 1)
            if found then return found end
        end
    end
    return nil
end

local function targetWords(t)
    if not t then return "target=none" end
    return string.format("target=%s,%s,%s object=%s container=%s type=%s sprite=%s%s",
        tostring(t.x), tostring(t.y), tostring(t.z), tostring(t.objectIndex), tostring(t.containerIndex),
        tostring(t.containerType), tostring(t.sprite),
        t.carrierMark and (" carrier=" .. tostring(t.carrierKind) .. " mark=" .. tostring(t.carrierMark))
            or (t.vehiclePart and (" part=" .. tostring(t.vehiclePart)) or ""))
end

-- Everything about one clue, in the words the owner's capture list asks for.
-- Called only from verify(), inside the same evaluation, so nothing has moved.
local function dump(root, id, a, why)
    local out = {}
    local function add(s) out[#out + 1] = s end
    add("id=" .. tostring(id))
    add("why=" .. tostring(why))
    add("case=" .. tostring(root.case and root.case.caseId))
    add("token=" .. tostring(a and a.physicalToken))
    -- 1. assignment state, whole
    add(string.format("status=%s droppedFrom=%s relocations=%s site=%s placedHours=%s deferredHours=%s missingHours=%s",
        tostring(a and a.status), tostring(a and a.droppedFrom), tostring(a and a.relocations),
        tostring(a and a.locationId), tostring(a and a.placedHours), tostring(a and a.deferredHours),
        tostring(a and a.missingHours)))
    -- 2. the recorded target and what resolution says about it
    add(targetWords(a and a.target))
    local t = a and a.target
    if t then
        local ok, container = pcall(World.resolve, t, a.physicalToken)
        if not ok then add("resolve=THREW " .. tostring(container))
        elseif not container then add("resolve=REFUSED (nil)")
        else
            local items = container.getItems and container:getItems()
            add(string.format("resolve=ok type=%s items=%d holdsOurToken=%s",
                tostring(container.getType and container:getType()),
                items and items:size() or -1,
                tostring(inContainer(container, a.physicalToken))))
        end
    end
    -- 3. where the item actually is: wider than the mod looks, and the bags
    local token = a and a.physicalToken
    if token and t then
        add("nearby=" .. tostring(tokenNear(t.x, t.y, t.z, 8, token) or "not found within 8 tiles"))
    end
    add("onPlayer=" .. tostring(token and inPlayer(token) or "no"))
    -- 4. the last sighting and the runtime's own state
    local R = ConspiracyFiles and ConspiracyFiles.GeneratedRuntime
    if R and R.whereabouts then
        local ok, st, place = pcall(R.whereabouts, id)
        add("whereabouts=" .. (ok and (tostring(st) .. " / " .. tostring(place)) or "THREW"))
    end
    add("recognised=" .. tostring(R and R.isRecognised and select(2, pcall(R.isRecognised, id))))
    -- 5. the player, so the distance is readable
    local p = getPlayer and getPlayer()
    if p then add(string.format("player=%d,%d,%d", math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()))) end
    return table.concat(out, "\n")
end

-- THE WHOLE CHECK, in one evaluation. Returns:
--   "none"                  no placed clue is absent from its container
--   "<id>\t<category>\n..." the FIRST discrepancy, fully described
-- A clue in the survivor's own bags is NOT a discrepancy: it was picked up.
function CFPlace.verify()
    local skipped = 0
    for _, root in ipairs(roots()) do
        for _, d in ipairs(root.case.documents) do
            local id = d.id
            local a = root.assignments[id]
            local c = category(a)
            if c ~= "placed" or not a or a.status ~= "placed" then
                -- Not the fault under investigation. Counted, never confused
                -- with it.
                skipped = skipped + 1
            else
                local token = a.physicalToken
                local ok, container = pcall(World.resolve, a.target, token)
                local holds = ok and container and inContainer(container, token)
                if not holds then
                    if token and inPlayer(token) then
                        skipped = skipped + 1 -- already in hand; the record is fine
                    else
                        return "DISCREPANCY\n" .. dump(root, id, a, "placed but not in its container")
                    end
                end
            end
        end
    end
    return "none\tskipped=" .. skipped
end

-- After a save and reload: is THIS clue still wrong? Takes the id so the shell
-- can ask about the exact one it captured.
function CFPlace.recheck(id)
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a then
            local token = a.physicalToken
            local ok, container = pcall(World.resolve, a.target, token)
            local holds = ok and container and inContainer(container, token)
            local onPlayer = token and inPlayer(token)
            return table.concat({ tostring(holds and true or false), tostring(onPlayer or "no"),
                                  tostring(a.status), tostring(a.relocations) }, "\t")
                   .. "\n" .. dump(root, id, a, "after save and reload")
        end
    end
    return "gone\tthe clue's case is no longer live (retired?)"
end

-- Stand next to a clue so its containers are loaded. Placement cannot be
-- verified in an unloaded cell, and a square that never loaded is the commonest
-- innocent explanation for "not found".
function CFPlace.teleportTo(id)
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a and a.target then
            local p = getPlayer and getPlayer()
            if not p then return "false\tno player" end
            p:teleportTo(a.target.x + 0.5, a.target.y + 0.5, a.target.z)
            return "true\t" .. a.target.x .. "," .. a.target.y .. "," .. a.target.z
        end
    end
    return "false\tno such clue"
end

-- Is the square under the survivor loaded enough to read containers?
function CFPlace.loaded()
    local p = getPlayer and getPlayer()
    if not p then return "false" end
    local sq = getCell and getCell():getGridSquare(math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()))
    return tostring(sq ~= nil)
end

-- Every placed clue's id, so the shell can walk them one at a time.
function CFPlace.placedIds()
    local out = {}
    for _, root in ipairs(roots()) do
        for _, d in ipairs(root.case.documents) do
            local a = root.assignments[d.id]
            if a and a.status == "placed" then out[#out + 1] = d.id end
        end
    end
    return table.concat(out, "\t")
end

return CFPlace
