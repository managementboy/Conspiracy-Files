-- Stages for checks/nohelp_features.sh: four No Help features seen with real game state.
--   (a) the "you are close" cue (ClueCue): fires within 3 tiles of a placed clue in view, not far away,
--       re-rolls after a failed roll, and does NOT re-roll when the re-roll interval is broken;
--   (b) a clue in a container of the car the survivor sits in is recognised when the loot panel
--       shows it (SearchedContainerWatch.findSeated), and not from outside or in another car;
--   (c) debug Shift+L logs ev=clue_where (a real key press), and plain L does not;
--   (d) the quiet "observer unsupported" log: counted with the gate closed (normal play) and with
--       IdentityObserver.verbose on (the control that proves the counter can see the line).
-- Loaded through the eval channel, then called by name with real game frames in between.
-- Nothing here ships with the mod, and nothing here prints clue text.
CFNH = CFNH or {}
local K = CFNH

local function player() return getPlayer() end
local function R() return NHShared.GeneratedRuntime end
local function Cue() return NHShared.ClueCue end

-- ---------------------------------------------------------------- clues
function K.clues()
    local rows = R().clueTargets()
    local placed, pending, veh = 0, 0, 0
    for _, c in ipairs(rows) do
        if c.status == "placed" then placed = placed + 1 else pending = pending + 1 end
        if c.vehicle then veh = veh + 1 end
    end
    return #rows, placed, pending, veh
end

-- The n-th unrecognised placed clue in a container (not a car), in a stable order.
function K.pick(n)
    local list = {}
    for _, c in ipairs(R().clueTargets()) do
        if c.status == "placed" and not c.recognised and not c.vehicle and not c.carrier then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    K.target = list[n]
    if not K.target then return false, "only " .. #list .. " clues in containers" end
    local t = K.target
    return true, t.id, t.x .. "," .. t.y .. "," .. t.z, t.place
end

function K.teleport(x, y, z) player():teleportTo(x + 0.5, y + 0.5, z); return true end
function K.loaded()
    local t, cell = K.target, getCell()
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
            if found == (k or 1) then return true, sq:getX(), sq:getY() end
        end
    end
    return false, "no open side " .. tostring(k or 1)
end
function K.faceClue()
    local t = K.target
    pcall(function() player():faceLocation(t.x + 0.5, t.y + 0.5) end)
    return true
end
-- The cue's own sight test from where the survivor stands: true/false, why, light factor.
function K.seenFrom()
    local t, p = K.target, player()
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    local seen, why = NHShared.ClueSearch.seesSpot(p, sq)
    return seen == true, tostring(why), string.format("%.2f", forageSystem.getLightLevelPenalty(p, sq, true))
end
-- Tiles (same floor, max of the two axes, as the cue measures) between the survivor and the clue.
function K.distance()
    local t, p = K.target, player()
    return math.max(math.abs(math.floor(p:getX()) - t.x), math.abs(math.floor(p:getY()) - t.y))
end
-- A loaded, free square 8..14 tiles from the clue on its floor, the same building first, else any.
function K.farSquare()
    local t = K.target
    local home = getCell():getGridSquare(t.x, t.y, t.z)
    local building = home and home:getBuilding()
    for _, sameBuilding in ipairs({ true, false }) do
        for r = 8, 14 do
            for dx = -r, r do for dy = -r, r do
                if math.max(math.abs(dx), math.abs(dy)) == r then
                    local sq = getCell():getGridSquare(t.x + dx, t.y + dy, t.z)
                    if sq and sq:isFree(false) and (not sameBuilding or sq:getBuilding() == building) then
                        return true, sq:getX(), sq:getY()
                    end
                end
            end end
        end
    end
    return false, "no far square"
end

-- ---------------------------------------------------------------- cue controls
function K.cueState()
    local s = Cue().state()
    return s.said, s.suppressed, tostring(s.first), s.places, tostring(s.last and s.last.id), tostring(Cue().lastSpoken ~= nil)
end
function K.cueReset() Cue().debugReset(); return true end
-- Forget which places were cued (the save's "once per place" memory) so one clue can be walked up to again.
function K.cueForgetPlaces() local st = Cue().store(); st.places = {}; st.cases = {}; return true end
function K.cueOnly(on) Cue().debugOnly = on and K.target and K.target.id or nil; return tostring(Cue().debugOnly) end
function K.cueChance(n) Cue().Rules.debugChance = n; return tostring(Cue().Rules.debugChance) end
-- The break used by the control run: a failed roll is never tried again.
function K.rerollMs(ms)
    K.rerollWas = K.rerollWas or Cue().Rules.REROLL_MS
    Cue().Rules.REROLL_MS = ms or K.rerollWas
    return Cue().Rules.REROLL_MS
end
-- The cooldown between two cues would hide the second cue of a control run.
function K.noCooldown() K.cooldownWas = K.cooldownWas or Cue().Rules.COOLDOWN_MS; Cue().Rules.COOLDOWN_MS = 0; return true end
function K.rules() return Cue().Rules.RADIUS, Cue().Rules.FORGET_RADIUS, Cue().Rules.REROLL_MS, Cue().Rules.COOLDOWN_MS end
-- The spoken words must be one of the shipped lines (the check never prints them).
function K.spokenIsShipped()
    local spoken = Cue().lastSpoken
    if not spoken then return false, "nothing spoken" end
    for _, l in ipairs(require("NHShared/ClueCueLines")) do if l == spoken then return true, "shipped line" end end
    return false, "not a shipped line"
end

-- ---------------------------------------------------------------- cars
local function openGround(cx, cy, z)
    local cell = getCell()
    for radius = 6, 40, 2 do
        for dx = -radius, radius, 2 do
            for dy = -radius, radius, 2 do
                local ok = true
                for ax = -3, 3 do
                    for ay = -2, 2 do
                        local sq = cell:getGridSquare(cx + dx + ax, cy + dy + ay, z)
                        if not sq or not sq:isOutside() or not sq:isFree(false) then ok = false; break end
                    end
                    if not ok then break end
                end
                if ok then return cell:getGridSquare(cx + dx, cy + dy, z) end
            end
        end
    end
end
-- Spawn a car on open ground near the survivor, nth = 1 or 2 (two cars need separate ground).
function K.spawn(nth)
    local p = player()
    pcall(function() p:setGodMod(true); p:setInvisible(true) end)
    local sq = openGround(math.floor(p:getX()) + (nth == 2 and 14 or 0), math.floor(p:getY()), 0)
    if not sq then return false, "no open ground within 40 tiles" end
    local v = addVehicleDebug("Base.PickUpVan", IsoDirections.N, nil, sq)
    if not v then return false, "the car did not spawn" end
    pcall(function() v:repair() end)
    pcall(function() v:setLocked(false) end)
    for i = 0, v:getPartCount() - 1 do
        local part = v:getPartByIndex(i)
        local d = part and part:getDoor()
        if d then pcall(function() d:setLocked(false) end) end
    end
    K["car" .. nth] = v
    return true, v:getX() .. "," .. v:getY()
end
-- A clue the world itself placed in a car's container (no harness move): go there, then NaturalFind.
function K.naturalGo()
    for _, c in ipairs(R().clueTargets()) do
        if c.status == "placed" and c.vehicle and not c.recognised then
            K.natural = c
            player():teleportTo(c.x + 0.5, c.y + 2.5, c.z)
            return true, c.id, tostring(c.part)
        end
    end
    return false, "no unrecognised clue placed in a car"
end
function K.naturalFind()
    local c = K.natural
    if not c then return false, "no natural clue" end
    for _, l in ipairs(NHShared.ClueSearch.liveClues(player())) do
        if l.id == c.id then
            local sq = getCell():getGridSquare(l.x, l.y, l.z)
            local v = sq and sq:getVehicleContainer()
            if not v then return false, "no car at the clue's square" end
            local part = v:getPartById(c.part)
            local box = part and part:getItemContainer()
            if not box then return false, "no " .. tostring(c.part) .. " container" end
            for i = 0, box:getItems():size() - 1 do
                if box:getItems():get(i):getModData().cfGeneratedId == c.id then
                    for j = 0, v:getPartCount() - 1 do
                        local d = v:getPartByIndex(j) and v:getPartByIndex(j):getDoor()
                        if d then pcall(function() d:setLocked(false) end) end
                    end
                    K.car1, K.box1, K.id1 = v, box, c.id
                    return true, tostring(v:getScriptName())
                end
            end
            return false, "the clue item is not in the " .. tostring(c.part)
        end
    end
    return false, "clue not in the live list"
end
-- Take the picked clue's real item out of its furniture and put it in car nth's glove box.
-- (The runtime placed it; only its container is changed, so the mod's recognition runs on a real item.)
function K.moveClueToCar(nth)
    local t = K.target
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    if not sq then return false, "clue square not loaded" end
    local item
    local objects = sq:getObjects()
    for i = 0, objects:size() - 1 do
        local o = objects:get(i)
        for c = 0, o:getContainerCount() - 1 do
            local items = o:getContainerByIndex(c):getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getModData().cfGeneratedId == t.id then item = it end
            end
        end
    end
    if not item then return false, "clue item not in its container" end
    local v = K["car" .. nth]
    local part = v and v:getPartById("GloveBox")
    local box = part and part:getItemContainer()
    if not box then return false, "no glove box" end
    item:getContainer():Remove(item)
    box:AddItem(item)
    K["box" .. nth], K["id" .. nth] = box, t.id
    return true, tostring(item:getContainer() == box)
end
function K.recognisedId(nth) return R().isRecognisedId(K["id" .. nth]) == true end
function K.toDriverDoor(nth)
    local v = K["car" .. nth]
    local c = v:getAreaCenter(v:getPassengerArea(0))
    if c then player():teleportTo(c:getX(), c:getY(), v:getZ()) else player():teleportTo(v:getX() + 2.5, v:getY() + 0.5, v:getZ()) end
    return true
end
function K.enter(nth) ISVehicleMenu.onEnter(player(), K["car" .. nth], 0); return true end
-- What the game's own enter action does when it completes, called directly.
function K.enterForced(nth)
    local v, p = K["car" .. nth], player()
    local ok, why = pcall(function() v:enter(0, p); v:setCharacterPosition(p, 0, "inside") end)
    return ok, tostring(why)
end
function K.seatedIn() local v = player():getVehicle(); return v ~= nil, v == K.car1 and 1 or (v == K.car2 and 2 or 0) end
function K.exit() if player():getVehicle() then ISVehicleMenu.onExit(player()) end return true end
-- The watch's own reader called directly (the loot panel path is exercised separately).
function K.findSeatedDirect(nth)
    return NHShared.SearchedContainerWatch.findSeated(player(), K["box" .. nth])
end
-- The real loot-panel path: refresh the icons and click the glove box's.
function K.openBox(nth)
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        if b.inventory == K["box" .. nth] then loot:selectContainer(b); return true end
    end
    local seen = {}
    for _, b in ipairs(loot.backpacks) do seen[#seen + 1] = tostring(b.inventory:getType()) end
    return false, "no loot-panel icon for the glove box; icons: " .. table.concat(seen, ",")
end

-- ---------------------------------------------------------------- Shift+L
function K.debugOn() return tostring(getDebug()), tostring(NHShared.ClueWhere ~= nil and NHShared.ClueWhere.bound) end

-- ---------------------------------------------------------------- observer unsupported
-- Close the debug gate for `ms` of real time, then open it again by itself.
function K.gateShut(ms)
    if not K.getDebugReal then K.getDebugReal = getDebug end
    getDebug = function() return false end
    K.gateUntil = getTimestampMs() + ms
    if not K.gateHandler then
        K.gateHandler = function()
            if K.gateUntil and getTimestampMs() >= K.gateUntil then
                getDebug = K.getDebugReal
                K.gateUntil = nil
            end
        end
        Events.OnTick.Add(K.gateHandler)
    end
    return true
end
function K.gateOpen() return K.gateUntil == nil end
function K.verbose(on) NHShared.IdentityObserver.verbose = on and true or false; return tostring(NHShared.IdentityObserver.verbose) end
-- Show a non-player container in the loot panel so a pane really renders each frame.
function K.openSomeLoot()
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        if b.inventory ~= player():getInventory() then loot:selectContainer(b); return true, tostring(b.inventory:getType()) end
    end
    return false, "no container icon in the loot panel"
end
