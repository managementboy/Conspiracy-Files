-- AD-10 step A (P4-R129): export every building on the map, once, from the
-- real game. Drives checks/address_export.sh. Nothing here ships with the mod.
--
-- Unfiltered on purpose: basements, sheds and garages are all written, so a
-- change to the numbering filter never needs a rescan. Bounded per tick (at
-- most 100 buildings and a few milliseconds, P4-R34).
--
-- Output, a .txt under ~/Zomboid/Lua/ (the game refused a .tsv): '#' header lines (game, map, count, columns),
-- then one tab-separated line per building:
--   id  x  y  x2  y2  basement(0/1)  roomCount  roomNames(sorted, unique, comma-joined)
-- Ids are strings: real building ids exceed what a Lua number holds exactly.
CFAddr = CFAddr or {}
local X = CFAddr

function X.start(name)
    local world = getWorld()
    if not world then return false, "no world" end
    local buildings = world:getMetaGrid():getBuildings()
    local total = buildings:size()
    local out = getFileWriter(name, true, false)
    if not out then return false, "could not open " .. tostring(name) end
    out:write("# game " .. tostring(getGameVersion()) .. "\n")
    out:write("# map " .. tostring(world:getMap()) .. "\n")
    out:write("# count " .. total .. "\n")
    out:write("# columns id x y x2 y2 basement roomCount roomNames\n")
    X.done, X.n, X.total, X.error = false, 0, total, nil
    local i = 0
    if X.handler then Events.OnTick.Remove(X.handler) end
    X.handler = function()
        local ok, why = pcall(function()
            local started = getTimeInMillis()
            local step = 0
            while i < total and step < 100 and getTimeInMillis() - started < 4 do
                local b = buildings:get(i)
                i, step = i + 1, step + 1
                local rooms = b:getRooms()
                local names, seen = {}, {}
                for r = 0, rooms:size() - 1 do
                    local n = rooms:get(r):getName() or ""
                    if not seen[n] then seen[n] = true; names[#names + 1] = n end
                end
                table.sort(names)
                out:write(table.concat({ tostring(b:getIDString()), b:getX(), b:getY(), b:getX2(), b:getY2(),
                    b:isBasement() and 1 or 0, rooms:size(), table.concat(names, ",") }, "\t") .. "\n")
            end
            X.n = i
            if i >= total then
                out:close()
                X.done = true
                Events.OnTick.Remove(X.handler)
            end
        end)
        if not ok then
            X.error = tostring(why)
            pcall(function() out:close() end)
            Events.OnTick.Remove(X.handler)
        end
    end
    Events.OnTick.Add(X.handler)
    return true, total
end

function X.status()
    return tostring(X.done), X.n or 0, X.total or 0, tostring(X.error)
end
