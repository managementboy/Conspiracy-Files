-- AD-10 step A (P4-R129): export every building on the map, once, from the
-- real game. Drives checks/address_export.sh. Nothing here ships with the mod.
--
-- Unfiltered on purpose: basements, sheds and garages are all written, so a
-- change to the numbering filter never needs a rescan.
--
-- Driven in steps from the shell, the way every other check drives the game:
-- the first version queued an OnTick handler, which never ran from a file
-- loaded through the eval channel, and two worlds sat for 30 minutes writing
-- nothing (2026-09-16). Each X.step writes one bounded batch.
--
-- Output, a .txt under ~/Zomboid/Lua/ (the game refused a .tsv): '#' header
-- lines (game, map, count, columns), then one tab-separated line per building:
--   id  x  y  x2  y2  basement(0/1)  roomCount  roomNames(sorted, unique, comma-joined)
-- Ids are strings: real building ids exceed what a Lua number holds exactly.
CFAddr = CFAddr or {}
local X = CFAddr

function X.start(name)
    local world = getWorld()
    if not world then return false, "no world" end
    X.buildings = world:getMetaGrid():getBuildings()
    X.total = X.buildings:size()
    X.out = getFileWriter(name, true, false)
    if not X.out then return false, "could not open " .. tostring(name) end
    X.out:write("# game " .. tostring(getGameVersion()) .. "\n")
    X.out:write("# map " .. tostring(world:getMap()) .. "\n")
    X.out:write("# count " .. X.total .. "\n")
    X.out:write("# columns id x y x2 y2 basement roomCount roomNames\n")
    X.n, X.done = 0, false
    return true, X.total
end

-- Writes up to `batch` buildings, stopping early after 20 ms. Returns done,
-- how many written so far, total.
function X.step(batch)
    if X.done then return true, X.n, X.total end
    local started = getTimeInMillis()
    local wrote = 0
    while X.n < X.total and wrote < (batch or 200) and getTimeInMillis() - started < 20 do
        local b = X.buildings:get(X.n)
        X.n, wrote = X.n + 1, wrote + 1
        local rooms = b:getRooms()
        local names, seen = {}, {}
        for r = 0, rooms:size() - 1 do
            local n = rooms:get(r):getName() or ""
            if not seen[n] then seen[n] = true; names[#names + 1] = n end
        end
        table.sort(names)
        X.out:write(table.concat({ tostring(b:getIDString()), b:getX(), b:getY(), b:getX2(), b:getY2(),
            b:isBasement() and 1 or 0, rooms:size(), table.concat(names, ",") }, "\t") .. "\n")
    end
    if X.n >= X.total then
        X.out:close()
        X.done = true
    end
    return X.done, X.n, X.total
end
