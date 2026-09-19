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
-- THE FAILURES ARE KEPT APART, because they have different causes and looked
-- identical in every log we have:
--   placed-absent     the record says `placed`, its square IS loaded, the
--                     survivor is not carrying it, and the container does not
--                     have it. THE FAULT UNDER INVESTIGATION.
--   never-placed      `deferred`, or dropped after waiting - never in the world
--                     (P4-R133). Not a mismatch; the record is honest.
--   carrier-path      dropped by the carrier path (`droppedFrom=="carrier"`).
--                     That names the PATH and is NOT proof the clue was ever
--                     placed: dropMissing needs only a mobile target, not a
--                     `placed` status (P4-R141).
--   carrier-missing   a carrier clue with a running missing timer.
--   unknown-history   dropped, with no history recorded. Unknown, and never
--                     rounded down to "never placed".
-- And two outcomes that are NOT failures at all, excluded at the source rather
-- than filtered afterwards: a clue in the survivor's own bags (it was picked
-- up), and a target square that is not loaded (no verdict is possible).
CFPlace = {}
local S = require("ConspiracyFiles/Generated/Session")
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired = require("ConspiracyFiles/Generated/RetiredCase")
local World = require("ConspiracyFiles/WorldAccess")

local TAG = "ConspiracyFiles.Generated.G2"
-- THE STORE IS NOT THE WRAPPER. Campaign cases live under `store.campaign` (or
-- `store.canonical` for a single case), and Cases.current is what unwraps them -
-- exactly as campaign.lua:25 does. Passing the raw store to Cases.sessions
-- returns nothing, so the first version of this check would have inspected no
-- cases at all and reported "no discrepancy" from an empty world. Exposed so
-- test/placement_fixture.lua can hold it without a game.
function CFPlace.storeRoots(store)
    local wrapper = store and Cases.current(store)
    if not wrapper then return {} end
    local ok, list = pcall(Cases.sessions, wrapper)
    if not ok or type(list) ~= "table" then return {} end
    local live = {}
    for _, r in ipairs(list) do if not Retired.isRetired(r) then live[#live + 1] = r end end
    return live
end
local function roots()
    return CFPlace.storeRoots(ModData and ModData.get and ModData.get(TAG))
end

-- WHICH FAILURE IS THIS, from the record alone.
--
-- `droppedFrom` names the PATH that dropped a clue, and nothing more (P4-R141).
-- "carrier" does not prove the clue was ever placed: dropMissing requires only a
-- mobile target, not a `placed` status, and the watcher reaches pending and
-- unknown assignments too. And a record written before the field existed has NO
-- history, which is not evidence of anything - so it is "unknown-history", never
-- rounded down to "never-placed". Exposed for test/placement_fixture.lua.
function CFPlace.classify(a)
    if not a then return "no-assignment" end
    if a.status == "deferred" then return "never-placed" end
    if a.status == "dropped" then
        if a.droppedFrom == "deferred" then return "never-placed" end
        if a.droppedFrom == "carrier" then return "carrier-path" end
        return "unknown-history"
    end
    if a.target and type(a.target.carrierMark) == "string" and a.missingHours then return "carrier-missing" end
    return "placed"
end
local category = CFPlace.classify

-- Every clue of every live case, by category. Cheap, non-mutating, and the
-- number the shell polls until placement has settled.
function CFPlace.clues()
    local n = { placed = 0, ["never-placed"] = 0, ["carrier-path"] = 0, ["carrier-missing"] = 0,
                ["unknown-history"] = 0, pending = 0, other = 0 }
    for _, root in ipairs(roots()) do
        for _, d in ipairs(root.case.documents) do
            local a = root.assignments[d.id]
            local c = category(a)
            if c == "placed" then
                if a.status == "placed" then n.placed = n.placed + 1 else n.pending = n.pending + 1 end
            elseif n[c] then n[c] = n[c] + 1 else n.other = n.other + 1 end
        end
    end
    return table.concat({ n.placed, n.pending, n["never-placed"],
                          n["carrier-path"] + n["carrier-missing"], n["unknown-history"], n.other }, "\t")
end

-- THE RESOLVER, as a named seam. placement.lua is a diagnostic and its own
-- failure modes matter, so the fixture injects a throwing resolver, an absent
-- token and a throwing container through this rather than hoping.
CFPlace.resolver = function(target, token) return World.resolve(target, token) end

-- Is the token in this container? Returns ok,holds - because reading a
-- container's contents CAN throw, and a throw here used to take the whole
-- verify() down and lose the capture entirely (found by fault injection).
local function readContainer(container, token)
    if not container then return false, nil, "no container" end
    local okItems, items = pcall(function() return container.getItems and container:getItems() end)
    if not okItems then return false, nil, "getItems threw: " .. tostring(items) end
    if not items then return false, nil, "no items list" end
    local okWalk, holds = pcall(function()
        for i = 0, items:size() - 1 do
            local md = items:get(i):getModData()
            if type(md) == "table" and md.cfPhysicalToken == token then return true end
        end
        return false
    end)
    if not okWalk then return false, nil, "reading items threw: " .. tostring(holds) end
    return true, holds, nil
end
-- The old shape, for the wider search where a failed read is simply "not here".
local function inContainer(container, token)
    local ok, holds = readContainer(container, token)
    return ok and holds or false
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

-- IS THE TARGET'S OWN SQUARE LOADED? A clue in an unloaded cell cannot be
-- resolved, and calling that a discrepancy is the loudest false alarm this
-- check could produce: the shell loads ONE clue's square at a time, so every
-- other clue is legitimately unreadable at that moment. Exposed for the
-- fixture test.
function CFPlace.targetLoaded(t)
    if not t then return false end
    local cell = getCell and getCell()
    if not cell then return false end
    return cell:getGridSquare(t.x, t.y, t.z) ~= nil
end

-- COVERAGE. A diagnostic that performed NO container comparison must not be
-- able to report "no discrepancy": no ids, or every clue unloaded or skipped,
-- would otherwise end a clean run having looked at nothing. The shell reads
-- these and calls that inconclusive. Counted here rather than in the shell so
-- test/placement_fixture.lua can hold the counting.
CFPlace.coverageCounts={compared=0,unloaded=0,inhand=0,skipped=0,missing=0,readerror=0}
function CFPlace.resetCoverage()
    CFPlace.coverageCounts={compared=0,unloaded=0,inhand=0,skipped=0,missing=0,readerror=0}
    return "ok"
end
local function count(kind)
    local c=CFPlace.coverageCounts
    c[kind]=(c[kind] or 0)+1
end
-- compared: we actually resolved the container and compared its contents. This
-- is the only number that makes a clean result mean anything.
function CFPlace.coverage()
    local c=CFPlace.coverageCounts
    return table.concat({c.compared,c.unloaded,c.inhand,c.skipped,c.missing,c.readerror},"\t")
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
        local ok, container = pcall(CFPlace.resolver, t, a.physicalToken)
        if not ok then add("resolve=THREW " .. tostring(container))
        elseif not container then add("resolve=REFUSED (nil)")
        else
            local okType, ctype = pcall(function() return container.getType and container:getType() end)
            local readOK, holds, why = readContainer(container, a.physicalToken)
            local okN, n = pcall(function()
                local items = container.getItems and container:getItems()
                return items and items:size() or -1
            end)
            add(string.format("resolve=ok type=%s items=%s holdsOurToken=%s",
                okType and tostring(ctype) or "THREW",
                okN and tostring(n) or "THREW",
                readOK and tostring(holds) or ("UNREADABLE " .. tostring(why))))
        end
    end
    -- 3. where the item actually is: wider than the mod looks, and the bags
    -- EVERY world read below is guarded. A dump that throws loses the capture
    -- it exists to preserve, and these walk engine objects whose shape varies
    -- with what the cell happens to hold.
    local token = a and a.physicalToken
    if token and t then
        local ok, near = pcall(tokenNear, t.x, t.y, t.z, 8, token)
        add("nearby=" .. (ok and tostring(near or "not found within 8 tiles")
                             or ("SEARCH THREW " .. tostring(near))))
    end
    local okP, onP = pcall(inPlayer, token)
    add("onPlayer=" .. (okP and tostring(onP or "no") or ("THREW " .. tostring(onP))))
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

-- THE WHOLE CHECK FOR ONE CLUE, in one evaluation. Takes the id the shell has
-- just stood next to.
--
-- It used to walk EVERY placed clue after the shell loaded one clue's square,
-- so every other clue - sitting in an unloaded cell by definition - resolved to
-- nothing and would have been reported as the fault. That would have produced a
-- confident dump about a clue nobody had gone to look at.
--
-- Returns one line, then the dump when there is something to dump:
--   "none"        the container really holds it
--   "unloaded"    its square is not loaded; no verdict is possible
--   "in-hand"     the survivor is carrying it; the record is not wrong
--   "skipped"     not a `placed` clue at all, with its category
--   "DISCREPANCY" placed, loaded, not in hand, and the container does not have it
function CFPlace.verify(id)
    if not id then return "no-id" end
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a then
            local c = category(a)
            if c ~= "placed" or a.status ~= "placed" then
                count("skipped")
                return "skipped\t" .. c .. "\t" .. tostring(a.status)
            end
            if not CFPlace.targetLoaded(a.target) then
                count("unloaded")
                return "unloaded\t" .. targetWords(a.target)
            end
            local token = a.physicalToken
            local okHand, hand = pcall(inPlayer, token)
            if okHand and hand then
                count("inhand")
                return "in-hand\t" .. tostring(hand)
            end
            -- A FAILED READ IS NOT A FINDING. Fault injection showed both ways
            -- this went wrong: a throwing resolver was reported as DISCREPANCY
            -- and counted as a comparison, and a throwing container took
            -- verify() down and returned no capture at all. Neither is evidence
            -- about placement; both are evidence the check could not look.
            local ok, container = pcall(CFPlace.resolver, a.target, token)
            if not ok then
                count("readerror")
                return "read-error\tresolver threw\n" .. dump(root, id, a,
                    "resolution threw: " .. tostring(container))
            end
            if not container then
                count("readerror")
                return "read-error\tresolution refused\n" .. dump(root, id, a,
                    "resolution returned no container")
            end
            local readOK, holds, why = readContainer(container, token)
            if not readOK then
                count("readerror")
                return "read-error\tcontents unreadable\n" .. dump(root, id, a,
                    "container contents unreadable: " .. tostring(why))
            end
            -- Only here has a real comparison happened, whichever way it went.
            count("compared")
            if holds then return "none" end
            return "DISCREPANCY\n" .. dump(root, id, a, "placed but not in its container")
        end
    end
    count("missing")
    return "no-assignment\t" .. tostring(id)
end

-- AFTER A SAVE AND RELOAD: what is true of THIS clue now.
--
-- The first version treated every outcome except `holds=true` as "still
-- absent", which would have called a retired case, a clue in the survivor's
-- bag and an unloaded square all persistence of the fault. Each is now its own
-- verdict, and an unloaded target yields NO verdict at all.
--   holds      the container has it: the discrepancy did not persist
--   absent     loaded, not in hand, container does not have it: it persisted
--   in-hand    the survivor is carrying it: not a fault
--   unloaded   no verdict possible
--   retired    the case is no longer live
--   gone       no assignment for this id
function CFPlace.recheck(id)
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a then
            -- CLASSIFY FIRST. Without this a clue that is now pending,
            -- relocating or deferred came back "absent" - reported as the fault
            -- persisting when in fact the record had legitimately changed.
            -- A changed state is its own answer and never a mismatch.
            local c = category(a)
            if c ~= "placed" or a.status ~= "placed" then
                return "changed\t" .. c .. "\t" .. tostring(a.status)
                       .. "\n" .. dump(root, id, a, "after reload, no longer a placed clue")
            end
            local token = a.physicalToken
            if not CFPlace.targetLoaded(a.target) then
                return "unloaded\t" .. targetWords(a.target) .. "\n" .. dump(root, id, a, "after reload, square not loaded")
            end
            local okHand, hand = pcall(inPlayer, token)
            if okHand and hand then
                return "in-hand\t" .. tostring(hand) .. "\n" .. dump(root, id, a, "after reload, in hand")
            end
            local ok, container = pcall(CFPlace.resolver, a.target, token)
            if not ok or not container then
                return "read-error\t" .. (ok and "resolution refused" or "resolver threw")
                       .. "\n" .. dump(root, id, a, "after reload, could not read: " .. tostring(container))
            end
            local readOK, holds, why = readContainer(container, token)
            if not readOK then
                return "read-error\tcontents unreadable\n"
                       .. dump(root, id, a, "after reload, contents unreadable: " .. tostring(why))
            end
            if holds then
                return "holds\t" .. tostring(a.status) .. "\t" .. tostring(a.relocations)
                       .. "\n" .. dump(root, id, a, "after reload, container holds it")
            end
            return "absent\t" .. tostring(a.status) .. "\t" .. tostring(a.relocations)
                   .. "\n" .. dump(root, id, a, "after reload, still absent")
        end
    end
    -- Live cases hold no assignment for it. Retired is the innocent
    -- explanation and must not read as the fault persisting.
    local store = ModData and ModData.get and ModData.get(TAG)
    local wrapper = store and Cases.current(store)
    for _, r in ipairs((wrapper and Cases.sessions(wrapper)) or {}) do
        if Retired.isRetired(r) then
            for _, kid in ipairs(r.known or {}) do
                if kid == id then return "retired\tthe clue's case has retired" end
            end
        end
    end
    return "gone\tno assignment for " .. tostring(id)
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
