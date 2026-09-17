-- Stages for checks/clue_search.sh: clues are found by searching (P4-R132,
-- stage 1). Loaded once through the eval channel, then called by name with real
-- game frames in between - a handler added from here would never run, so the
-- driver polls.
CFClue = CFClue or {}
local K = CFClue
local R = ConspiracyFiles.GeneratedRuntime
local C = ConspiracyFiles.ClueSearch
local CATEGORY = "Clues"

local function player() return getPlayer() end
local function manager() return ISSearchManager.getManager(player()) end

-- (a) The focus: registered, translated, offered by the Investigate Area
-- window, and provably unable to spawn anything.
function K.focus()
    local def = forageSystem.catDefs[CATEGORY]
    local text = getTextOrNull("IGUI_SearchMode_Categories_" .. CATEGORY)
    ISSearchWindow.createUI(player():getPlayerNum())
    local window = ISSearchWindow.players[player()]
    local offered = false
    if window then
        window:updateSearchFocusCategories()
        for _, option in ipairs(window.searchFocus.options) do
            if option.data == CATEGORY then offered = true end
        end
    end
    -- Nothing in the loot table under Clues, in any zone, and the picker finds
    -- nothing when asked for a Clues item there.
    local zones, items, picked = 0, 0, 0
    for zoneName, zone in pairs(forageSystem.lootTable or {}) do
        zones = zones + 1
        local cat = zone.categories and zone.categories[CATEGORY]
        for _ in pairs(cat and cat.items or {}) do items = items + 1 end
        for _ = 1, 10 do
            if forageSystem.pickRandomItemType(zoneName, CATEGORY) then picked = picked + 1 end
        end
    end
    local rolls = 0
    for _, n in pairs(def and def.zones or {}) do rolls = rolls + (tonumber(n) or 0) end
    return def ~= nil, tostring(text), offered, zones, items, picked, rolls,
        tostring(def and def.chanceToCreateIcon), tostring(def and def.focusChanceMax), tostring(C and C.registered)
end

-- Placed clues, from the runtime's own rows.
function K.clues()
    local rows = R.clueTargets()
    local placed, pending, parts = 0, 0, {}
    for _, c in ipairs(rows) do
        if c.status == "placed" then placed = placed + 1 else pending = pending + 1 end
        parts[#parts + 1] = c.id .. ":" .. c.status .. (c.vehicle and ":vehicle" or "")
    end
    return #rows, placed, pending, table.concat(parts, " ")
end

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
    return true, t.id, t.x .. "," .. t.y .. "," .. t.z
end

function K.approach()
    local t = K.target
    player():teleportTo(t.x + 0.5, t.y + 0.5, t.z)
    return true
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

-- Stand next to the container where a player would: on a side of it with no
-- wall between (a corner or the far side of a wall sees nothing), and face it.
-- `k` picks the k-th such square, so the driver can try another when the game
-- nudges the survivor off the one asked for.
function K.stand(k)
    local t = K.target
    local target = getCell():getGridSquare(t.x, t.y, t.z)
    if not target then return false, "square not loaded" end
    local found = 0
    for _, d in ipairs({ {0, 1}, {1, 0}, {0, -1}, {-1, 0} }) do
        local sq = getCell():getGridSquare(t.x + d[1], t.y + d[2], t.z)
        if sq and sq:isFree(false) and not target:isWallTo(sq) and not sq:isBlockedTo(target) then
            found = found + 1
            if found == (k or 1) then
                K.spot = sq
                player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
                pcall(function() player():faceLocation(t.x + 0.5, t.y + 0.5) end)
                return true, sq:getX() .. "," .. sq:getY()
            end
        end
    end
    return false, "no open side " .. tostring(k or 1)
end
-- Did the survivor end up on the square asked for?
function K.settled()
    local cur = player():getCurrentSquare()
    return K.spot ~= nil and cur == K.spot
end

-- Walk away from every clue, for a clean measurement.
function K.teleport(x, y, z)
    player():teleportTo(x + 0.5, y + 0.5, z)
    return true
end
function K.where()
    local p = player()
    return math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
end

function K.setFocus(category)
    ISSearchWindow.createUI(player():getPlayerNum())
    local window = ISSearchWindow.players[player()]
    if not window then return false, "no window" end
    window.searchFocusCategory = category
    return true, tostring(C.focusOf(player()))
end

-- Search Mode on (again, if the game turned it off: a zombie close by does).
function K.searchOn()
    local m = manager()
    local was = m.isSearchMode
    if not was then m:toggleSearchMode(true) end
    K.reEnabled = (K.reEnabled or 0) + ((not was and K.armed) and 1 or 0)
    K.armed = true
    return m.isSearchMode == true, tostring(was)
end
function K.searchOff()
    K.armed = false
    local m = manager()
    if m.isSearchMode then m:toggleSearchMode(false) end
    return m.isSearchMode == false
end

-- (b)/(c) The icon for the picked clue: its class, where it is, and how far
-- the game's spotting has got.
function K.icon()
    local t = K.target
    local m = manager()
    local icon = m.clueIcons and m.clueIcons[C.iconIdFor(t.id)]
    if not icon then return false, "no icon", tostring(m.isSearchMode) end
    local ownClass = getmetatable(icon) == C.Icon
    local onSquare = math.floor(icon.xCoord) == t.x and math.floor(icon.yCoord) == t.y and icon.zCoord == t.z
    return true, tostring(ownClass), tostring(onSquare), tostring(icon:getIsSeen()),
        string.format("%.0f/%.0f", icon.spotTimer or -1, icon.spotTimerMax or -1),
        string.format("%.2f", icon.viewDistance or -1), string.format("%.2f", icon.distanceToPlayer or -1),
        tostring(icon.isSeenThisUpdate), tostring(icon.iconClass), K.vision(icon)
end

-- Why an icon is or is not seen, for the record when spotting fails.
function K.vision(icon)
    local p = player()
    local cur = p:getCurrentSquare()
    local sq = icon.square
    if not sq or not cur then return "no square" end
    local parts = { "at=" .. cur:getX() .. "," .. cur:getY(),
        "base=" .. tostring(ISBaseIcon.getCanSeeThisUpdate(icon)), "ours=" .. tostring(icon:getCanSeeThisUpdate()),
        "canSee=" .. tostring(sq:isCanSee(p:getPlayerNum())), "blocked=" .. tostring(sq:isBlockedTo(cur)),
        string.format("light=%.2f", forageSystem.getLightLevelPenalty(p, sq, true)),
        "dark=" .. tostring(sq:getDarkMulti(p:getPlayerNum())), "running=" .. tostring(icon:checkIsPlayerRunning()) }
    for k, side in pairs(icon.adjacentSquares or {}) do
        parts[#parts + 1] = k .. "=" .. tostring(side:isCanSee(p:getPlayerNum())) .. "/" .. tostring(side:isBlockedTo(cur))
            .. "/" .. tostring(sq:isWallTo(side)) .. "/" .. tostring(side == cur)
    end
    return table.concat(parts, " ")
end

function K.recognised()
    local t = K.target
    local spot = C.spotted[t.id]
    return R.isRecognisedId(t.id) == true, tostring(spot and spot.recognised), tostring(spot and spot.why)
end

-- The items of the picked clue in its container: their names and categories.
function K.items()
    local t = K.target
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    if not sq then return false, "square not loaded" end
    local out = {}
    local objects = sq:getObjects()
    for i = 0, objects:size() - 1 do
        local o = objects:get(i)
        for c = 0, o:getContainerCount() - 1 do
            local items = o:getContainerByIndex(c):getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getModData().cfGeneratedId == t.id then
                    out[#out + 1] = tostring(it:getName()) .. "|" .. tostring(it:getDisplayCategory())
                end
            end
        end
    end
    return #out > 0, table.concat(out, "; ")
end

-- (e) The game's own icons, counted by class and by forage category.
function K.forage()
    local m = manager()
    local total, clues, cats = 0, 0, {}
    for _, icon in pairs(m.forageIcons or {}) do
        total = total + 1
        local name = icon.catDef and icon.catDef.name or tostring(icon.icon and icon.icon.catName)
        cats[name] = (cats[name] or 0) + 1
        if name == CATEGORY then clues = clues + 1 end
    end
    local function count(t) local n = 0; for _ in pairs(t or {}) do n = n + 1 end; return n end
    local parts = {}
    for name, n in pairs(cats) do parts[#parts + 1] = name .. "=" .. n end
    table.sort(parts)
    return total, clues, count(m.activeIcons), count(m.worldObjectIcons), count(m.stashIcons),
        count(m.clueIcons), table.concat(parts, ",")
end

-- The development knob, check-only: scales the spot timer.
function K.spotScale(n)
    C.Rules.debugSpotScale = n
    return C.Rules.debugSpotScale
end

function K.counters()
    local c = C.counters
    return c.added, c.dropped, c.spotted, c.recognised, K.reEnabled or 0
end

-- Is the game running? A paused game ticks no mod handlers, which is how the
-- first run of this check saw no icons at all (2026-09-16). Set speed 1 if not.
function K.running()
    local speed = UIManager.getSpeedControls():getCurrentGameSpeed()
    local paused = isGamePaused()
    if speed ~= 1 then pcall(function() UIManager.getSpeedControls():SetCurrentGameSpeed(1) end) end
    return tostring(paused), speed
end

-- The nearest square outdoors, free to stand on: forage zones are outside, so
-- counting the game's forage icons indoors counts nothing.
function K.outdoors()
    local p = player()
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), 0
    for r = 1, 40 do
        for dx = -r, r do for dy = -r, r do
            if math.abs(dx) == r or math.abs(dy) == r then
                local sq = getCell():getGridSquare(px + dx, py + dy, pz)
                if sq and sq:isOutside() and sq:isFree(false) then
                    p:teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, pz)
                    return true, sq:getX() .. "," .. sq:getY()
                end
            end
        end end
    end
    return false, "no outdoor square within 40"
end

-- Is the picked clue's square lit enough for the game to let anyone spot
-- anything there (forageSystem.lightPenaltyCutoff)? Asked from where the
-- survivor stands.
function K.lit()
    local t = K.target
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    if not sq then return false, "not loaded" end
    local light = forageSystem.getLightLevelPenalty(player(), sq, true)
    local dark = (1 - light) >= (forageSystem.lightPenaltyCutoff / 100) and sq:getDarkMulti(player():getPlayerNum()) <= 2.0
    return not dark, string.format("%.2f", light)
end
