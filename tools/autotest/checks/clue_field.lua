-- Stages for checks/clue_field.sh: the four things about searching for clues
-- (P4-R132) that only a running game can answer, and that the unit tests and
-- stages 1-3 left open (docs/design/SEARCH_TO_FIND.md, "Differs from the
-- design"):
--   a clue in a car whose car is then moved - does its icon follow;
--   recognition across a save and a reload;
--   walking and aiming part-way through "Look it over" and Inspect;
--   a clue in an unlit room, and the same clue with a lit torch in hand.
--
-- Loaded after clue_actions.lua, whose stages this one reuses rather than
-- copying: CFAct drives the real right-click menu, the action queue and the
-- timings, and K.adopt() points it at the clue chosen here.
CFField = CFField or {}
local K = CFField
local R = ConspiracyFiles.GeneratedRuntime
local Search = ConspiracyFiles.ClueSearch

local function player() return getPlayer() end
local function manager() return ISSearchManager.getManager(player()) end

function K.version() return tostring(ConspiracyFiles.VERSION), tostring(Search.Rules and Search.Rules.REMOVE_RADIUS) end

-- Every live clue, and which of them sit in a car.
function K.clues()
    local placed, pending, cars, parts = 0, 0, 0, {}
    for _, c in ipairs(R.clueTargets()) do
        if c.status == "placed" then placed = placed + 1 else pending = pending + 1 end
        if c.vehicle then cars = cars + 1 end
        parts[#parts + 1] = c.id .. ":" .. c.status .. (c.vehicle and ":" .. tostring(c.part) or "") .. (c.recognised and ":recognised" or "")
    end
    return placed, pending, cars, table.concat(parts, " ")
end

-- The n-th unrecognised clue of a kind: "car" for one in a vehicle, "box" for
-- one in furniture. A stable order, so the driver can ask for the next.
function K.pick(kind, n)
    local list = {}
    for _, c in ipairs(R.clueTargets()) do
        local want = (kind == "car") == (c.vehicle == true)
        if c.status == "placed" and not c.recognised and want then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    K.target = list[tonumber(n) or 1]
    if not K.target then return "false", #list .. " clues of kind " .. tostring(kind) end
    local t = K.target
    return "true", t.id, t.x .. "," .. t.y .. "," .. t.z, tostring(t.place), tostring(t.part)
end

function K.teleport(x, y, z) player():teleportTo(x + 0.5, y + 0.5, z); return true end
function K.where()
    local p = player()
    return math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
end
-- Whether the clue's square and its neighbours have loaded.
function K.loaded()
    local t, cell = K.target, getCell()
    if not t or not cell then return "false" end
    for dx = -1, 1 do for dy = -1, 1 do
        if not cell:getGridSquare(t.x + dx, t.y + dy, t.z) then return "false" end
    end end
    return "true"
end
-- Is the clue's square in a room (a clue indoors, for the darkness stage)?
function K.inRoom()
    local t = K.target
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    local room = sq and sq:getRoom()
    return tostring(room ~= nil), room and tostring(room:getName()) or "outdoors"
end

-- Search Mode on (the game turns it off by itself when a zombie is close), and
-- facing the clue, which is what the survivor's own spotting needs.
function K.searchOn()
    local m = manager()
    if not m.isSearchMode then m:toggleSearchMode(true) end
    local live = K.livePosition()
    if live then pcall(function() player():faceLocation(live.x + 0.5, live.y + 0.5) end) end
    return tostring(m.isSearchMode == true)
end
function K.searchOff()
    local m = manager()
    if m.isSearchMode then m:toggleSearchMode(false) end
    return tostring(m.isSearchMode == false)
end

-- Where the mod thinks the clue is NOW - for a clue in a car, where the car
-- is (ClueSearch.liveClues), not where it was parked when the case was made.
function K.livePosition()
    local t = K.target
    if not t then return nil end
    for _, c in ipairs(Search.liveClues(player())) do
        if c.id == t.id then return { x = c.x, y = c.y, z = c.z } end
    end
    return { x = t.x, y = t.y, z = t.z }
end
function K.live()
    local l = K.livePosition()
    if not l then return "false", "no clue picked" end
    return "true", l.x .. "," .. l.y .. "," .. l.z
end

-- The clue's icon: whether it exists, the square it is on, whether the game
-- has seen it, and how far its spot timer has got.
function K.icon()
    local t, m = K.target, manager()
    local icon = m.clueIcons and m.clueIcons[Search.iconIdFor(t.id)]
    if not icon then return "false", "no icon", tostring(m.isSearchMode) end
    return "true", math.floor(icon.xCoord) .. "," .. math.floor(icon.yCoord) .. "," .. tostring(icon.zCoord),
        tostring(getmetatable(icon) == Search.Icon), tostring(icon:getIsSeen()),
        string.format("%.0f/%.0f", icon.spotTimer or -1, icon.spotTimerMax or -1),
        string.format("%.2f", icon.distanceToPlayer or -1)
end

function K.recognised() return tostring(R.isRecognisedId(K.target.id) == true) end

-- ---------------------------------------------------------------------------
-- A CLUE IN A CAR. Stage 1 left the icon where the car was parked; stage 2
-- made it follow the car (ClueSearch.vehicleSpot), unit-tested only. The car
-- is found the way the check's other stages find a clue: by the mod's own id
-- on the item, in a vehicle part near the clue's square.
function K.carFind()
    local t = K.target
    local cell = getCell()
    for dx = -2, 2 do for dy = -2, 2 do
        local sq = cell:getGridSquare(t.x + dx, t.y + dy, t.z)
        local v = sq and sq:getVehicleContainer()
        if v then
            for p = 0, v:getPartCount() - 1 do
                local part = v:getPartByIndex(p)
                local c = part and part:getItemContainer()
                local items = c and c:getItems()
                for j = 0, (items and items:size() or 0) - 1 do
                    local it = items:get(j)
                    if it:getModData().cfGeneratedId == t.id then
                        K.vehicle, K.part, K.item = v, part, it
                        return "true", tostring(v:getScriptName()), math.floor(v:getX()) .. "," .. math.floor(v:getY()),
                            tostring(part:getId()), tostring(it:getName())
                    end
                end
            end
        end
    end end
    return "false", "no vehicle holding " .. tostring(t.id) .. " within two tiles of " .. t.x .. "," .. t.y
end

-- Move the car, as driving it would: the vehicle object is taken out of the
-- world, put down on a free square `dist` tiles away and given its physics
-- back. Every step is reported, because which of them the build needs is
-- exactly what nobody had tried (BaseVehicle.setPosition /
-- setCurrentSquareFromPosition / addToWorld / createPhysics, Build 42.20).
function K.carMove(dist)
    local v = K.vehicle
    if not v then return "false", "no car" end
    dist = tonumber(dist) or 10
    local cell = getCell()
    local vx, vy, vz = math.floor(v:getX()), math.floor(v:getY()), math.floor(v:getZ())
    local target
    for _, d in ipairs({ { dist, 0 }, { 0, dist }, { -dist, 0 }, { 0, -dist }, { dist, dist }, { -dist, -dist } }) do
        local ok = true
        for ax = -1, 1 do for ay = -1, 1 do
            local sq = cell:getGridSquare(vx + d[1] + ax, vy + d[2] + ay, vz)
            if not sq or not sq:isFree(false) or not sq:isOutside() then ok = false end
        end end
        if ok and not target then target = { x = vx + d[1], y = vy + d[2] } end
    end
    if not target then return "false", "no free outdoor ground " .. dist .. " tiles from the car" end
    local steps = {}
    local function try(name, fn)
        local ok, why = pcall(fn)
        steps[#steps + 1] = name .. "=" .. (ok and "ok" or tostring(why))
    end
    try("removeFromWorld", function() v:removeFromWorld() end)
    try("physicsOff", function() v:setPhysicsActive(false) end)
    try("setPosition", function() v:setPosition(target.x + 0.5, target.y + 0.5, vz) end)
    try("squareFromPosition", function() v:setCurrentSquareFromPosition() end)
    try("addToWorld", function() v:addToWorld() end)
    try("createPhysics", function() v:createPhysics() end)
    return "true", vx .. "," .. vy, math.floor(v:getX()) .. "," .. math.floor(v:getY()), table.concat(steps, " ")
end

-- Stand beside the car where it is now, so the icon is inside the add radius
-- and the survivor can see the car.
function K.standByCar()
    local v = K.vehicle
    if not v then return "false", "no car" end
    local cell = getCell()
    local vx, vy, vz = math.floor(v:getX()), math.floor(v:getY()), math.floor(v:getZ())
    for r = 2, 5 do
        for dx = -r, r do for dy = -r, r do
            if math.max(math.abs(dx), math.abs(dy)) == r then
                local sq = cell:getGridSquare(vx + dx, vy + dy, vz)
                if sq and sq:isFree(false) then
                    player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
                    pcall(function() player():faceLocation(vx + 0.5, vy + 0.5) end)
                    return "true", sq:getX() .. "," .. sq:getY()
                end
            end
        end end
    end
    return "false", "no free square beside the car"
end
-- Is the clue still really in the car's part, after the move?
function K.stillInCar()
    local t = K.target
    local c = K.part and K.part:getItemContainer()
    local items = c and c:getItems()
    for j = 0, (items and items:size() or 0) - 1 do
        if items:get(j):getModData().cfGeneratedId == t.id then return "true", tostring(K.part:getId()) end
    end
    return "false", "not in " .. tostring(K.part and K.part:getId())
end

-- ---------------------------------------------------------------------------
-- ACROSS A RELOAD. The item objects do not survive a reload, so the clue is
-- found again by the mod's own id - anywhere the survivor carries it - and
-- what the loot list would say about it is read from the item itself.
function K.refind(docId)
    docId = docId or (K.target and K.target.id)
    local found
    local function walk(container, depth)
        if not container or depth > 3 or found then return end
        local items = container:getItems()
        for i = 0, items:size() - 1 do
            local item = items:get(i)
            if item:getModData().cfGeneratedId == docId then found = item; return end
            local inner = item.getInventory and item:getInventory()
            if inner then walk(inner, depth + 1) end
        end
    end
    walk(player():getInventory(), 0)
    if not found then return "false", "the survivor is not carrying " .. tostring(docId) end
    K.item = found
    K.carried = docId
    local ok, category = pcall(function() return found:getDisplayCategory() end)
    return "true", tostring(found:getName()), tostring(ok and category), tostring(R.isRecognised(found)),
        tostring(R.isInspected(found)), tostring(R.isRecognisedId(docId))
end

-- Point the stage-2 stages at the clue chosen here, so the menu, the queue and
-- the timings are read by the code that proved them (checks/clue_actions.lua)
-- instead of a second copy of it.
function K.adopt()
    CFAct.target = K.target
    -- Only when this check has an item of its own: CFAct.find() sets CFAct.item
    -- itself, and a second adopt must not wipe it.
    if K.item then CFAct.item = K.item end
    CFAct.chosenAt = nil
    return tostring(CFAct.target ~= nil), tostring(CFAct.item ~= nil)
end
-- The item either side of the check is working on.
local function held() return K.item or (CFAct and CFAct.item) end

-- ---------------------------------------------------------------------------
-- INTERRUPTION. What the queue holds, and whether the survivor is moving: read
-- together, so "walked, and the action is gone" cannot fall between two calls.
function K.state()
    local p = player()
    local q = ISTimedActionQueue.getTimedActionQueue(p)
    local current = q and q.queue and q.queue[1]
    local delta = -1
    if current and current.action then pcall(function() delta = current:getJobDelta() end) end
    local moving, aiming = false, false
    pcall(function() moving = p:isPlayerMoving() == true end)
    pcall(function() aiming = p:isAiming() == true end)
    local it = held()
    return tostring(current and current.Type), string.format("%.2f", delta), tostring(moving), tostring(aiming),
        tostring(it ~= nil and R.isRecognised(it) == true), tostring(it ~= nil and R.isInspected(it) == true)
end
-- The record's side of it: an interrupted action must leave nothing noted.
function K.noted(docId)
    docId = docId or (K.target and K.target.id)
    for _, row in ipairs(R.known()) do if row.id == docId then return "true", tostring(row.title) end end
    return "false", "not in the record"
end

-- ---------------------------------------------------------------------------
-- DARKNESS. The clock is put to `hour` (the game's own time of day), which is
-- how an unlit interior is arranged without waiting for dusk.
function K.night(hour)
    local t = getGameTime()
    pcall(function() t:setTimeOfDay(tonumber(hour) or 1.0) end)
    return "true", string.format("%.2f", t:getTimeOfDay())
end

-- The light where the clue is, read exactly as the game's foraging reads it,
-- plus the mod's own sight test and the game's cutoff. `dark` is the game's
-- rule: too dark to spot anything here.
function K.light()
    local l = K.livePosition()
    local sq = l and getCell():getGridSquare(l.x, l.y, l.z)
    if not sq then return "false", "square not loaded" end
    local p = player()
    local penalty = forageSystem.getLightLevelPenalty(p, sq, true)
    local dark = (1 - penalty) >= (forageSystem.lightPenaltyCutoff / 100) and sq:getDarkMulti(p:getPlayerNum()) <= 2.0
    local seen, why = Search.seesSpot(p, sq)
    return "true", string.format("%.2f", penalty), tostring(dark), tostring(seen == true), tostring(why),
        string.format("%.2f", sq:getDarkMulti(p:getPlayerNum())), tostring(forageSystem.lightPenaltyCutoff)
end

-- A lit torch in the survivor's hand: the item, in a hand, switched on.
function K.torch(on)
    local p = player()
    if not K.torchItem then
        for _, type_ in ipairs({ "Base.Torch", "Base.HandTorch" }) do
            local item = p:getInventory():AddItem(type_)
            if item then K.torchItem = item; break end
        end
    end
    local item = K.torchItem
    if not item then return "false", "no torch could be added" end
    pcall(function() p:setSecondaryHandItem(item) end)
    pcall(function() item:setActivated(on == true) end)
    local lit, inHand, delta = false, false, "?"
    pcall(function() lit = item:isActivated() == true end)
    pcall(function() inHand = p:getSecondaryHandItem() == item or p:getPrimaryHandItem() == item end)
    pcall(function() delta = tostring(item.getLightStrength and item:getLightStrength()) end)
    return "true", tostring(item:getName()), tostring(lit), tostring(inHand), delta
end

return CFField
