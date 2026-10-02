-- Do the mod's ground readers agree with what is physically there? In a real world, at real buildings near
-- Muldraugh, ask the readers (door / indoor floor / open ground) about squares whose truth is read independently
-- from the squares' own objects, and compare. Drives checks/ground_truth.sh. Nothing here ships with the mod.
--
-- Truth is taken from the world, not from the mod: a square holds an IsoDoor object or it does not; a square is
-- outside or it is not. The reader under test is GeneratedRuntime.groundFacts (the seam R.groundFacts), the same
-- engine reads the clue scan makes. The headless tests prove the CALLS are valid; this proves the ANSWERS.
CFTruth = CFTruth or {}
local T = CFTruth

local function runtime()
    local ok, R = pcall(require, "NHShared/GeneratedRuntime")
    return ok and R or nil
end

local function hasDoor(s)
    if not s then return false end
    local objs = s:getObjects()
    for i = 0, objs:size() - 1 do
        if instanceof(objs:get(i), "IsoDoor") then return true end
    end
    return false
end
local function squareAt(x, y) return getCell():getGridSquare(x, y, 0) end

-- Buildings near Muldraugh's crossroads, no basements, in a fixed order, so every run visits the same ones.
function T.start(count, name)
    local R = runtime()
    if not R or not R.groundFacts then return false, "the mod's GeneratedRuntime.groundFacts is not available" end
    local list = getWorld():getMetaGrid():getBuildings()
    local picks = {}
    for i = 0, list:size() - 1 do
        local b = list:get(i)
        if not b:isBasement() and b:getRooms():size() > 0 and b:getX() >= 10600 and b:getX2() <= 10900
           and b:getY() >= 9300 and b:getY2() <= 9700 then
            picks[#picks + 1] = b
        end
    end
    table.sort(picks, function(a, b) return tostring(a:getIDString()) < tostring(b:getIDString()) end)
    T.queue = {}
    for i = 1, math.min(count or 8, #picks) do T.queue[i] = picks[i] end
    T.i, T.phase, T.wait, T.checked, T.failed = 0, "next", 0, 0, 0
    T.out = getFileWriter(name, true, false)
    if not T.out then return false, "could not open " .. tostring(name) end
    T.out:write("# game " .. tostring(getGameVersion()) .. "\n# columns building kind x y expected got ok\n")
    return true, #T.queue
end

local function record(b, kind, x, y, expected, got)
    local ok = (expected == got)
    T.checked = T.checked + 1
    if not ok then T.failed = T.failed + 1 end
    T.out:write(table.concat({ tostring(b:getIDString()), kind, x, y, tostring(expected), tostring(got), ok and "ok" or "WRONG" }, "\t") .. "\n")
end

local function probe(b)
    local R = runtime()
    local x1, y1, x2, y2 = b:getX(), b:getY(), b:getX2(), b:getY2()
    local doors, floors = {}, {}
    for x = x1, x2 - 1 do for y = y1, y2 - 1 do
        local s = squareAt(x, y)
        if s then
            if hasDoor(s) then
                doors[#doors + 1] = { x, y }
            elseif not s:isOutside() and s:TreatAsSolidFloor() then
                -- far from any door, so an edge door of a neighbour cannot be what the reader sees
                local near = false
                for dx = -1, 1 do for dy = -1, 1 do if hasDoor(squareAt(x + dx, y + dy)) then near = true end end end
                if not near then floors[#floors + 1] = { x, y } end
            end
        end
    end end
    local function facts(x, y) return R.groundFacts(x, y, 0, "truth:" .. x .. ":" .. y, nil, {}, nil) end
    for i = 1, math.min(2, #doors) do
        local f = facts(doors[i][1], doors[i][2])
        record(b, "door-square", doors[i][1], doors[i][2], true, f.door)
    end
    for i = 1, math.min(2, #floors) do
        local f = facts(floors[i][1], floors[i][2])
        record(b, "indoor-floor-door", floors[i][1], floors[i][2], false, f.door)
        record(b, "indoor-floor-outside", floors[i][1], floors[i][2], false, f.outside)
        record(b, "indoor-floor-floor", floors[i][1], floors[i][2], true, f.floor)
    end
    local ox, oy = x1 - 4, math.floor((y1 + y2) / 2)
    local so = squareAt(ox, oy)
    if so and so:isOutside() and so:TreatAsSolidFloor() then
        local f = facts(ox, oy)
        record(b, "open-ground-outside", ox, oy, true, f.outside)
        record(b, "open-ground-door", ox, oy, false, f.door)
    end
    return #doors, #floors
end

-- One bounded action per call, driven from the shell. Returns done, buildings finished, checked, wrong, note.
function T.step()
    if T.phase == "done" then return true, T.i, T.checked, T.failed, "" end
    local p = getPlayer()
    if T.phase == "next" then
        T.i = T.i + 1
        if T.i > #T.queue then T.out:close(); T.phase = "done"; return true, T.i - 1, T.checked, T.failed, "" end
        local b = T.queue[T.i]
        local cx, cy = math.floor((b:getX() + b:getX2()) / 2), math.floor((b:getY() + b:getY2()) / 2)
        p:teleportTo(cx + 0.5, cy + 0.5, 0)
        T.phase, T.wait, T.loaded = "wait", 0, 0
        return false, T.i - 1, T.checked, T.failed, "going to building " .. T.i
    elseif T.phase == "wait" then
        -- After teleportTo the area streams in over seconds; wait until the whole building is loaded.
        local b = T.queue[T.i]
        T.wait = T.wait + 1
        local all = true
        for x = b:getX(), b:getX2() - 1, 2 do for y = b:getY(), b:getY2() - 1, 2 do
            if not squareAt(x, y) then all = false end
        end end
        T.loaded = all and (T.loaded + 1) or 0
        if T.loaded >= 3 then T.phase = "probe" elseif T.wait > 120 then
            T.out:write(tostring(b:getIDString()) .. "\tUNLOADED\t\t\t\t\t\n"); T.failed = T.failed + 1; T.phase = "next"
        end
        return false, T.i - 1, T.checked, T.failed, "waiting for the area to load"
    elseif T.phase == "probe" then
        local b = T.queue[T.i]
        local nd, nf = probe(b)
        T.phase = "next"
        return false, T.i, T.checked, T.failed, "building " .. T.i .. ": " .. nd .. " door squares, " .. nf .. " indoor squares"
    end
end
