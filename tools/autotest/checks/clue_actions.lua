-- Stages for checks/clue_actions.sh: clues are found by searching (P4-R132,
-- stage 2) - the wordless cue, "Look it over" and Inspect as timed actions.
-- Loaded once through the eval channel, then called by name with real game
-- frames in between; a handler added from here would never run, so the driver
-- polls.
CFAct = CFAct or {}
local K = CFAct
local R = ConspiracyFiles.GeneratedRuntime
local Cue = ConspiracyFiles.ClueCue
local Search = ConspiracyFiles.ClueSearch
local Actions = ConspiracyFiles.ClueActions

local function player() return getPlayer() end
local function now() return getTimestampMs() end

function K.running()
    local speed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if speed ~= 1 then pcall(function() UIManager.getSpeedControls():SetCurrentGameSpeed(1) end) end
    return tostring(isGamePaused()), speed
end

function K.clues()
    local rows = R.clueTargets()
    local placed, pending, parts = 0, 0, {}
    for _, c in ipairs(rows) do
        if c.status == "placed" then placed = placed + 1 else pending = pending + 1 end
        parts[#parts + 1] = c.id .. ":" .. c.status .. (c.vehicle and ":vehicle" or "") .. (c.recognised and ":recognised" or "")
    end
    return #rows, placed, pending, table.concat(parts, " ")
end

function K.version() return tostring(ConspiracyFiles.VERSION) end

-- The n-th unrecognised clue in a container (not a car), in a stable order.
function K.pick(n)
    local list = {}
    for _, c in ipairs(R.clueTargets()) do
        if c.status == "placed" and not c.recognised and not c.vehicle then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    K.target = list[n]
    if not K.target then return false, "only " .. #list .. " clues in containers" end
    local t = K.target
    return true, t.id, t.x .. "," .. t.y .. "," .. t.z, t.place
end

function K.teleport(x, y, z) player():teleportTo(x + 0.5, y + 0.5, z); return true end
function K.where()
    local p = player()
    return math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
end
function K.loaded()
    local t = K.target
    local cell = getCell()
    if not t or not cell then return false end
    for dx = -1, 1 do for dy = -1, 1 do
        if not cell:getGridSquare(t.x + dx, t.y + dy, t.z) then return false end
    end end
    return true
end

-- An open side of the clue's container: a free square with no wall between.
function K.side(k)
    local t = K.target
    local target = getCell():getGridSquare(t.x, t.y, t.z)
    if not target then return false, "square not loaded" end
    local found = 0
    for _, d in ipairs({ {0, 1}, {1, 0}, {0, -1}, {-1, 0} }) do
        local sq = getCell():getGridSquare(t.x + d[1], t.y + d[2], t.z)
        if sq and sq:isFree(false) and not target:isWallTo(sq) and not sq:isBlockedTo(target) then
            found = found + 1
            if found == (k or 1) then K.spot = sq; return true, sq:getX() .. "," .. sq:getY() end
        end
    end
    return false, "no open side " .. tostring(k or 1)
end

-- Would the cue's own sight test pass from that side? (lit, same room, in view)
function K.seenFrom()
    local t = K.target
    local p = player()
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    local seen, why = Search.seesSpot(p, sq)
    return seen == true, tostring(why), string.format("%.2f", forageSystem.getLightLevelPenalty(p, sq, true))
end

-- A start square for a walk: a free square on the same floor, 6 to 10 tiles
-- from the clue (outside the cue's reach), in the same building as the side
-- square (or out of doors if that is), so the game's pathfinding can walk it.
function K.walkStart()
    local t = K.target
    local goal = K.spot
    local building = goal:getBuilding()
    for r = 6, 10 do
        for dx = -r, r do for dy = -r, r do
            if math.max(math.abs(dx), math.abs(dy)) == r then
                local sq = getCell():getGridSquare(t.x + dx, t.y + dy, t.z)
                if sq and sq:isFree(false) and sq:getBuilding() == building then
                    player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
                    return true, sq:getX() .. "," .. sq:getY()
                end
            end
        end end
    end
    return false, "no start square"
end
-- Walk to the side square as a player's click does.
function K.walk()
    ISTimedActionQueue.add(ISWalkToTimedAction:new(player(), K.spot))
    return true
end
function K.arrived()
    local cur = player():getCurrentSquare()
    return cur == K.spot, cur and (cur:getX() .. "," .. cur:getY()) or "?"
end
function K.faceClue()
    local t = K.target
    pcall(function() player():faceLocation(t.x + 0.5, t.y + 0.5) end)
    return true
end

function K.cueState()
    local s = Cue.state()
    return s.said, s.suppressed, tostring(s.first), s.places, tostring(s.last and s.last.line), tostring(s.last and s.last.id)
end
function K.cueReset() Cue.debugReset(); return true end
function K.cueOnly(on) Cue.debugOnly = on and K.target and K.target.id or nil; return tostring(Cue.debugOnly) end
function K.cueChance(n) Cue.Rules.debugChance = n; return tostring(Cue.Rules.debugChance) end

-- The physical item of the picked clue, in its container.
function K.find()
    local t = K.target
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    if not sq then return false, "not loaded" end
    local objects = sq:getObjects()
    for i = 0, objects:size() - 1 do
        local o = objects:get(i)
        for c = 0, o:getContainerCount() - 1 do
            local items = o:getContainerByIndex(c):getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getModData().cfGeneratedId == t.id then
                    K.item = it
                    return true, tostring(it:getName()), tostring(it:getDisplayCategory())
                end
            end
        end
    end
    return false, "not in its container"
end
function K.take()
    local p = player()
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, K.item, K.item:getContainer(), p:getInventory()))
    return true
end
function K.carried() return K.item ~= nil and K.item:getOutermostContainer() == player():getInventory() end
function K.item_()
    local it = K.item
    return tostring(it:getName()), tostring(it:getDisplayCategory()), tostring(R.isRecognised(it)), tostring(R.isInspected(it))
end

-- The real right-click menu on the carried item: its option labels.
function K.menu()
    local ctx = ISInventoryPaneContextMenu.createMenu(0, true, { K.item }, 200, 200)
    if not ctx then return false, "no context menu" end
    local labels = {}
    for _, o in ipairs(ctx.options or {}) do
        if o.name == "Look it over" or o.name == "Inspect Investigation Evidence" or o.name == "Note in the Investigation" then
            labels[#labels + 1] = o.name .. (o.notAvailable and "(greyed)" or "")
        end
    end
    ctx:closeAll()
    return true, table.concat(labels, "|")
end
-- Choose an option from the real menu.
function K.choose(name)
    local ctx = ISInventoryPaneContextMenu.createMenu(0, true, { K.item }, 200, 200)
    if not ctx then return false, "no context menu" end
    local option = ctx:getOptionFromName(name)
    local result
    if not option then result = "no option " .. name
    elseif option.notAvailable then result = name .. " is greyed out"
    else
        K.chosenAt = now()
        option.onSelect(option.target, option.param1, option.param2, option.param3)
        result = true
    end
    ctx:closeAll()
    return result == true, tostring(result)
end
-- What the survivor's action queue is doing: the current action's type, its
-- progress, and the time since the option was chosen.
function K.queue()
    local q = ISTimedActionQueue.getTimedActionQueue(player())
    local current = q and q.queue and q.queue[1]
    local delta = -1
    if current and current.action then pcall(function() delta = current:getJobDelta() end) end
    -- Read in the same call as the queue, so completion cannot fall between.
    return tostring(current and current.Type), string.format("%.2f", delta), now() - (K.chosenAt or now()),
        tostring(current and current.forceProgressBar), tostring(R.isRecognised(K.item) == true), tostring(R.isInspected(K.item) == true)
end
function K.since() return now() - (K.chosenAt or now()) end
function K.recognised() return R.isRecognised(K.item) == true end
function K.inspected() return R.isInspected(K.item) == true end
function K.actionTimes() return Actions.LOOK_TIME, Actions.INSPECT_TIME end
-- How long the last action ran, start to completion, in real milliseconds.
function K.ran(which)
    local last = which == "look" and Actions.lastLook or Actions.lastInspect
    return tostring(last and last.ok), tostring(last and last.ms)
end
