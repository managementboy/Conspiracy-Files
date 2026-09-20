-- Load explicitly via tools/autotest/pz.sh eval -f. Read-only snapshots for
-- Claude's Phase 0 run. No fixture creation, teleport, stash preparation,
-- container exploration flags, save writes or automatic verdicts.
if not (getDebug and getDebug()) or (isClient and isClient()) or (isServer and isServer()) then
    return false, "debug single-player only"
end
ConspiracyFiles = ConspiracyFiles or {}
local P = ConspiracyFiles.MapMediaProbe or {}
ConspiracyFiles.MapMediaProbe = P
local O = require "ConspiracyFiles/MapReadObserver"

local function value(fn)
    local ok, result = pcall(fn)
    if not ok then return "unknown:" .. tostring(result):gsub("[%c]", " "):sub(1, 100) end
    if result == nil then return "nil" end
    return tostring(result):gsub("[%c]", " "):sub(1, 160)
end
local function log(kind, fields)
    local keys, parts = {}, { "kind=" .. kind }
    for k in pairs(fields) do keys[#keys + 1] = k end
    table.sort(keys)
    for _, k in ipairs(keys) do parts[#parts + 1] = k .. "=" .. tostring(fields[k]) end
    print("[CF-MAP-WORLD] " .. table.concat(parts, " | "))
end
local function permitted()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
end

function P.start(label) return O.start(label) end
function P.stop() return O.stop() end
function P.mark(label) return O.mark(label) end
function P.status() return O.status() end

-- Inventory access does not count as exposure. IDs correlate physical copies
-- only; never infer canonical design identity from item names or engine IDs.
function P.maps()
    if not permitted() then return false, "debug single-player only" end
    local player = getSpecificPlayer(0)
    if not player then return false, "player unavailable" end
    P.items = {}
    local visited, inspected, truncated = {}, 0, false
    local function scan(container, depth)
        if visited[container] then return end
        if depth > 4 then truncated = true; return end
        visited[container] = true
        local items = container:getItems()
        for i = 0, items:size() - 1 do
            if inspected >= 512 then truncated = true; return end
            inspected = inspected + 1
            local item = items:get(i)
            if item:IsMap() then
                P.items[#P.items + 1] = item
                local fields = O.item(item, 0)
                fields.index = #P.items
                log("inventory-map", fields)
            end
            if instanceof(item, "InventoryContainer") then scan(item:getInventory(), depth + 1) end
        end
    end
    scan(player:getInventory(), 0)
    return #P.items, inspected, truncated
end

-- Only returns the item previously enumerated; never creates or reads it.
function P.map(index)
    if not permitted() then return nil end
    return P.items and P.items[index]
end

function P.stash(label)
    if not permitted() then return false, "debug single-player only" end
    local ok, list = pcall(function() return StashSystem.getAlreadyReadMap() end)
    if not ok or not list then
        log("stash-read-list", { label = label or "", state = "unknown", reason = tostring(list) })
        return false, "stash read list unavailable"
    end
    local ids = {}
    for i = 0, math.min(list:size(), 256) - 1 do ids[#ids + 1] = tostring(list:get(i)) end
    table.sort(ids)
    log("stash-read-list", { label = label or "", count = list:size(), ids = table.concat(ids, ","),
        truncated = list:size() > 256 })
    return list:size(), list:size() > 256
end

-- Inspect ONE loaded square without triggering a load, loot roll or exploration.
-- Captures actual item IDs/types for before/after comparison, never just totals.
-- Truncation is explicit and makes a complete-preservation claim inconclusive.
function P.square(x, y, z, label)
    if not permitted() then return false, "debug single-player only" end
    if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number"
        or x ~= math.floor(x) or y ~= math.floor(y) or z ~= math.floor(z) then
        return false, "integer coordinates required"
    end
    local square = getCell():getGridSquare(x, y, z)
    local where = tostring(x) .. "," .. tostring(y) .. "," .. tostring(z)
    if not square then log("square", { at = where, label = label or "", state = "unloaded" }); return false, "unloaded" end
    local objects = square:getObjects()
    local count, remaining, truncated = 0, 256, objects:size() > 32
    for i = 0, math.min(objects:size(), 32) - 1 do
        local object = objects:get(i)
        local containers = object:getContainerCount()
        if containers > 4 then truncated = true end
        for c = 0, math.min(containers, 4) - 1 do
            local container = object:getContainerByIndex(c)
            local items = container:getItems()
            local details = {}
            local limit = math.min(items:size(), remaining)
            if limit < items:size() then truncated = true end
            for n = 0, limit - 1 do
                local item = items:get(n)
                details[#details + 1] = value(function() return item:getID() end) .. ":"
                    .. value(function() return item:getFullType() end)
            end
            remaining = remaining - limit
            table.sort(details)
            count = count + 1
            log("carrier", { at = where, label = label or "", object = i, container = c,
                type = value(function() return container:getType() end), count = items:size(),
                explored = value(function() return container:isExplored() end),
                items = table.concat(details, ","), truncated = limit < items:size() })
        end
    end
    log("square", { at = where, label = label or "", state = "loaded", carriers = count,
        objects = objects:size(), truncated = truncated })
    return true, count, truncated
end

function P.here(label)
    if not permitted() then return false, "debug single-player only" end
    local player = getSpecificPlayer(0)
    local square = player and player:getCurrentSquare()
    if not square then return false, "player square unavailable" end
    local building = square:getBuilding()
    log("player", { label = label or "", x = square:getX(), y = square:getY(), z = square:getZ(),
        indoors = building ~= nil,
        buildingX = building and value(function() return building:getDef():getX() end) or "none",
        buildingY = building and value(function() return building:getDef():getY() end) or "none" })
    return P.square(square:getX(), square:getY(), square:getZ(), label)
end

return true, "loaded only; call ConspiracyFiles.MapMediaProbe.start(label) explicitly"
