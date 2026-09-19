-- STALE-CLUE RELOCATION, UNDER A CONTROLLED CLOCK.
--
-- The placement diagnostic found no immediate mismatch in three fresh worlds,
-- and said plainly why that is weak evidence: it verifies one case immediately
-- after placement, with no in-game time passing, so RELOCATION NEVER RUNS. The
-- reported fault came from long runs where it did. This check creates those
-- conditions deliberately, in ONE real save.
--
-- THE CLOCK. There is no setWorldAgeHours on Build 42.20 - probed, it does not
-- exist. But `getWorldAgeHours` is derived from nights survived, and
-- `setNightsSurvived` moves it: measured, +4 nights moved world age from 2.06 to
-- 98.06 hours, exactly +96. setDay adds nothing on top. So nights is the lever,
-- and it is a REAL game-state change (zombie scaling follows it), made
-- deliberately and recorded rather than pretended away.
--
-- Relocation's own conditions, all of which must hold (StaleClue):
--   status "placed", not yet found, placedHours set;
--   worldAgeHours - placedHours >= RELOCATE_AFTER_HOURS (72);
--   relocations < RELOCATE_CAP;
--   exactly ONE item carrying the token (a pile never relocates);
--   not on a carrier (a body's clue expires instead, P4-R134);
--   and an unvisited destination site that holds no other placed clue.
-- Confirming these BEFORE advancing is what separates "relocation ran and the
-- record went wrong" from "relocation never ran at all".
--
-- THE REFUSED-CANONICAL-WRITE EXPLANATION IS A HYPOTHESIS. The design notes bet
-- on it: a relocation whose canonical write was refused leaves the item in the
-- new container while the record still names the old one. Nothing here assumes
-- it. The canonical write goes through `checked(api.relocate(...))`, which
-- throws into the scheduler's error handler, so the log carries the trail - and
-- this check reports what the log and the record actually say.
CFReloc = {}
local S = require("ConspiracyFiles/Generated/Session")
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired = require("ConspiracyFiles/Generated/RetiredCase")
local StaleClue = require("ConspiracyFiles/StaleClue")
local World = require("ConspiracyFiles/WorldAccess")

local TAG = "ConspiracyFiles.Generated.G2"
local function roots()
    local store = ModData and ModData.get and ModData.get(TAG)
    local wrapper = store and Cases.current(store)
    if not wrapper then return {} end
    local ok, list = pcall(Cases.sessions, wrapper)
    if not ok or type(list) ~= "table" then return {} end
    local live = {}
    for _, r in ipairs(list) do if not Retired.isRetired(r) then live[#live + 1] = r end end
    return live
end

local function targetWords(t)
    if not t then return "none" end
    return string.format("%s,%s,%s/obj%s/con%s/%s",
        tostring(t.x), tostring(t.y), tostring(t.z),
        tostring(t.objectIndex), tostring(t.containerIndex), tostring(t.containerType))
end

-- ---------------------------------------------------------------------------
-- The clock
-- ---------------------------------------------------------------------------
function CFReloc.clock()
    local gt = getGameTime and getGameTime()
    if not gt then return "no-gametime" end
    return table.concat({ string.format("%.2f", gt:getWorldAgeHours()),
                          tostring(gt:getDay()), tostring(gt:getNightsSurvived()) }, "\t")
end

-- Advance the world clock by at least `hours`, in whole nights, and report what
-- actually moved. Returns before, after, requested, nightsAdded.
function CFReloc.advance(hours)
    local gt = getGameTime and getGameTime()
    if not gt then return "no-gametime" end
    hours = tonumber(hours) or 0
    local before = gt:getWorldAgeHours()
    local nights = math.ceil(hours / 24)
    local ok, err = pcall(function() gt:setNightsSurvived(gt:getNightsSurvived() + nights) end)
    if not ok then return "advance-threw\t" .. tostring(err) end
    local after = gt:getWorldAgeHours()
    return table.concat({ string.format("%.2f", before), string.format("%.2f", after),
                          tostring(hours), tostring(nights),
                          tostring(after - before >= hours) }, "\t")
end

-- ---------------------------------------------------------------------------
-- 1. Capture the originals, BEFORE the clock moves
-- ---------------------------------------------------------------------------
-- One line per unfound placed clue: the state relocation might change, plus
-- where the item actually is right now. This is the baseline every later
-- comparison is made against.
CFReloc.baseline = {}
function CFReloc.capture()
    CFReloc.baseline = {}
    local out = {}
    for _, root in ipairs(roots()) do
        local known = {}
        for _, id in ipairs(root.known or {}) do known[id] = true end
        for _, d in ipairs(root.case.documents) do
            local a = root.assignments[d.id]
            if a and a.status == "placed" and not known[d.id] then
                local okR, container = pcall(World.resolve, a.target, a.physicalToken)
                local holds = "unreadable"
                if okR and container then
                    local okI, items = pcall(function() return container:getItems() end)
                    if okI and items then
                        holds = "false"
                        local okW, found = pcall(function()
                            for i = 0, items:size() - 1 do
                                local md = items:get(i):getModData()
                                if type(md) == "table" and md.cfPhysicalToken == a.physicalToken then return true end
                            end
                            return false
                        end)
                        if okW then holds = tostring(found) end
                    end
                elseif okR then holds = "no-container" end
                CFReloc.baseline[d.id] = { token = a.physicalToken, target = a.target,
                                           placedHours = a.placedHours, relocations = a.relocations,
                                           locationId = a.locationId, holds = holds }
                out[#out + 1] = table.concat({ d.id, tostring(a.physicalToken), targetWords(a.target),
                                               tostring(a.placedHours), tostring(a.relocations),
                                               holds }, "\t")
            end
        end
    end
    if #out == 0 then return "none" end
    return table.concat(out, "\n")
end

-- ---------------------------------------------------------------------------
-- 2. Are relocation's conditions actually satisfied?
-- ---------------------------------------------------------------------------
-- Reported per clue, so a check that sees no relocation can say WHICH condition
-- withheld it rather than concluding anything about placement.
function CFReloc.conditions()
    local gt = getGameTime and getGameTime()
    local hours = gt and gt:getWorldAgeHours() or -1
    local out = {}
    for _, root in ipairs(roots()) do
        local stale = {}
        for _, id in ipairs(StaleClue.staleIds(root, hours)) do stale[id] = true end
        for _, d in ipairs(root.case.documents) do
            local a = root.assignments[d.id]
            if a and a.status == "placed" then
                local carrier = S.isMobile(a.target) and type(a.target.carrierMark) == "string"
                local okD, dests = pcall(StaleClue.destinations, root, {})
                -- tooClose is a real refusal: relocation will not move a clue
                -- out from under the survivor. Reported, because this check
                -- teleports the player about and must not mistake its own
                -- position for an absent fault.
                local close = "n/a"
                local p = getPlayer and getPlayer()
                if p and a.target and StaleClue.tooClose then
                    local okC, res = pcall(StaleClue.tooClose,
                        math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()), a.target)
                    close = okC and tostring(res) or "threw"
                end
                out[#out + 1] = table.concat({ d.id,
                    "stale=" .. tostring(stale[d.id] == true),
                    "canAttempt=" .. tostring(StaleClue.canAttempt(a)),
                    "relocations=" .. tostring(a.relocations),
                    "onCarrier=" .. tostring(carrier),
                    "destinations=" .. (okD and tostring(#dests) or "THREW"),
                    "playerTooClose=" .. close,
                    "age-placed=" .. string.format("%.1f", hours - (a.placedHours or 0)) }, "\t")
            end
        end
    end
    if #out == 0 then return "none" end
    return table.concat(out, "\n")
end

-- ---------------------------------------------------------------------------
-- 3 & 4. What changed, and where the item actually is
-- ---------------------------------------------------------------------------
-- The wider search, so "the record names the wrong container" is distinguishable
-- from "the item is gone".
local function locate(token, t, radius)
    local cell = getCell and getCell()
    if not cell or not t then return nil end
    for r = 0, (radius or 20) do
        for dx = -r, r do for dy = -r, r do
            if math.max(math.abs(dx), math.abs(dy)) == r then
                local sq = cell:getGridSquare(t.x + dx, t.y + dy, t.z)
                local okO, objects = pcall(function() return sq and sq:getObjects() end)
                if okO and objects then
                    for i = 0, objects:size() - 1 do
                        local o = objects:get(i)
                        local okC, n = pcall(function() return o.getContainerCount and o:getContainerCount() or 0 end)
                        for c = 0, (okC and n or 0) - 1 do
                            local okF, found = pcall(function()
                                local cont = o:getContainerByIndex(c)
                                local items = cont and cont.getItems and cont:getItems()
                                for j = 0, (items and items:size() or 0) - 1 do
                                    local md = items:get(j):getModData()
                                    if type(md) == "table" and md.cfPhysicalToken == token then return true end
                                end
                                return false
                            end)
                            if okF and found then
                                return string.format("%d,%d,%d r=%d", t.x + dx, t.y + dy, t.z, r)
                            end
                        end
                    end
                end
            end
        end end
    end
    return nil
end

-- One clue, compared against its captured baseline. Every outcome is named, and
-- a read failure is never a finding (the discipline placement.lua earned).
function CFReloc.compare(id)
    local base = CFReloc.baseline[id]
    if not base then return "no-baseline\t" .. tostring(id) end
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a then
            local moved = targetWords(a.target) ~= targetWords(base.target)
            local parts = { id,
                "recordMoved=" .. tostring(moved),
                "relocations=" .. tostring(base.relocations) .. "->" .. tostring(a.relocations),
                "status=" .. tostring(a.status),
                "was=" .. targetWords(base.target),
                "now=" .. targetWords(a.target) }
            local okR, container = pcall(World.resolve, a.target, a.physicalToken)
            if not okR then
                parts[#parts + 1] = "verdict=read-error resolver threw: " .. tostring(container)
            elseif not container then
                parts[#parts + 1] = "verdict=read-error resolution refused"
            else
                local okW, holds = pcall(function()
                    local items = container:getItems()
                    for i = 0, items:size() - 1 do
                        local md = items:get(i):getModData()
                        if type(md) == "table" and md.cfPhysicalToken == a.physicalToken then return true end
                    end
                    return false
                end)
                if not okW then
                    parts[#parts + 1] = "verdict=read-error contents unreadable: " .. tostring(holds)
                elseif holds then
                    parts[#parts + 1] = "verdict=record-matches-world"
                else
                    -- THE INTERESTING CASE. Where is it instead?
                    local elsewhere = locate(a.physicalToken, a.target, 20)
                    local atOld = locate(a.physicalToken, base.target, 3)
                    parts[#parts + 1] = "verdict=MISMATCH"
                    parts[#parts + 1] = "foundNear=" .. tostring(elsewhere or "not within 20 tiles")
                    parts[#parts + 1] = "atOldTarget=" .. tostring(atOld or "no")
                end
            end
            return table.concat(parts, "\t")
        end
    end
    return "gone\tno live assignment for " .. tostring(id)
end

-- Every captured clue, compared. Returns one line each.
function CFReloc.compareAll()
    local out = {}
    for id in pairs(CFReloc.baseline) do out[#out + 1] = CFReloc.compare(id) end
    table.sort(out)
    if #out == 0 then return "none" end
    return table.concat(out, "\n")
end

-- The ids captured, so the shell can walk them and load each square.
function CFReloc.captured()
    local out = {}
    for id in pairs(CFReloc.baseline) do out[#out + 1] = id end
    table.sort(out)
    return table.concat(out, "\t")
end

-- Stand on a clue's recorded square so its containers load.
function CFReloc.teleportTo(id)
    for _, root in ipairs(roots()) do
        local a = root.assignments[id]
        if a and a.target then
            local p = getPlayer and getPlayer()
            if not p then return "false\tno player" end
            p:teleportTo(a.target.x + 0.5, a.target.y + 0.5, a.target.z)
            return "true\t" .. targetWords(a.target)
        end
    end
    return "false\tno such clue"
end
function CFReloc.loaded()
    local p = getPlayer and getPlayer()
    if not p then return "false" end
    local ok, sq = pcall(function()
        return getCell():getGridSquare(math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()))
    end)
    return tostring(ok and sq ~= nil)
end

-- The baseline survives a reload only if we re-capture it, so the shell can ask
-- for it as a serialised blob and hand it back. Keyed by id, tab separated.
function CFReloc.exportBaseline()
    local out = {}
    for id, b in pairs(CFReloc.baseline) do
        out[#out + 1] = table.concat({ id, b.token, b.target.x, b.target.y, b.target.z,
                                       b.target.objectIndex, b.target.containerIndex,
                                       tostring(b.target.containerType), tostring(b.relocations) }, "|")
    end
    table.sort(out)
    return table.concat(out, "\n")
end
function CFReloc.importBaseline(blob)
    CFReloc.baseline = {}
    local n = 0
    for line in tostring(blob):gmatch("[^\n]+") do
        local f = {}
        for part in line:gmatch("[^|]+") do f[#f + 1] = part end
        if #f >= 9 then
            CFReloc.baseline[f[1]] = { token = f[2],
                target = { x = tonumber(f[3]), y = tonumber(f[4]), z = tonumber(f[5]),
                           objectIndex = tonumber(f[6]), containerIndex = tonumber(f[7]),
                           containerType = f[8] },
                relocations = tonumber(f[9]) }
            n = n + 1
        end
    end
    return tostring(n)
end

return CFReloc
