-- Stages for the core investigation loop (catalogue INF-02). Loaded once
-- through DevEval, then called by name with real game frames in between.
-- Each step goes through what a player's click would run: the loot panel's
-- selectContainer, a transfer timed action, and the real right-click menu
-- (ISInventoryPaneContextMenu.createMenu fires the mod's own menu hook).
CFLoop = CFLoop or {}
local L = CFLoop
local R = ConspiracyFiles.GeneratedRuntime

-- Placed documents, parsed from the runtime's own diagnostic.
function L.docs()
    local text = R.devLocations()
    local out = {}
    for line in (tostring(text) .. "\n"):gmatch("([^\n]*)\n") do
        local id, place, x, y, z, status =
            line:match("^(%S+)%s+(.-)%s+(%-?%d+),(%-?%d+) floor (%-?%d+)%s+%[(%w+)%]$")
        if id then
            out[#out + 1] = { id = id, place = place, x = tonumber(x), y = tonumber(y), z = tonumber(z), status = status }
        end
    end
    L.list = out
    return out
end

function L.summary()
    local parts = {}
    for i, d in ipairs(L.docs()) do parts[#parts + 1] = i .. ":" .. d.status .. "@" .. d.place end
    return #L.list, table.concat(parts, "; ")
end

local function scanSquare(sq, id)
    if not sq then return nil end
    local objects = sq:getObjects()
    for i = 0, objects:size() - 1 do
        local o = objects:get(i)
        for c = 0, o:getContainerCount() - 1 do
            local items = o:getContainerByIndex(c):getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getModData().cfGeneratedId == id then return it, o end
            end
        end
    end
    -- Vehicles: a case may put a clue in a car (VehicleProbe, 7983376). Parts
    -- by index on the vehicle itself; VehicleParts cannot be indexed (6d2d3c3).
    local v = sq:getVehicleContainer()
    if v then
        for p = 0, v:getPartCount() - 1 do
            local part = v:getPartByIndex(p)
            local c = part and part:getItemContainer()
            if c then
                local items = c:getItems()
                for j = 0, items:size() - 1 do
                    local it = items:get(j)
                    if it:getModData().cfGeneratedId == id then L.vehicle, L.part = v, part; return it, v end
                end
            end
        end
    end
    local world = sq:getWorldObjects()
    for i = 0, world:size() - 1 do
        local it = world:get(i):getItem()
        if it and it:getModData().cfGeneratedId == id then return it, world:get(i) end
    end
end

-- The physical item for document n, searched on its square and neighbours.
function L.find(n)
    local d = L.list[n]
    L.vehicle, L.part = nil, nil
    for dx = -1, 1 do for dy = -1, 1 do
        local it, holder = scanSquare(getCell():getGridSquare(d.x + dx, d.y + dy, d.z), d.id)
        if it then
            L.item, L.holder = it, holder
            local where = L.part and ("vehicle " .. tostring(L.part:getId())) or tostring(it:getContainer() and it:getContainer():getType())
            -- Room and floor, so repeated runs can tally where clues land.
            local sq = getCell():getGridSquare(d.x + dx, d.y + dy, d.z)
            local room = sq and sq:getRoom() and sq:getRoom():getName() or (L.part and "vehicle" or "outdoors")
            return true, it:getDisplayName(), where, room, d.z
        end
    end end
    L.item = nil
    return false, "not on or next to its square"
end

-- Stand where the loot panel can show the document's container: a free square
-- in the 3x3 around it that can reach it (the panel drops squares behind
-- walls, ISInventoryPage:refreshBackpacks). Teleport; arrival tests walk.
function L.goTo(n)
    local d = L.list[n]
    local target = (L.holder and L.holder.getSquare and L.holder:getSquare()) or getCell():getGridSquare(d.x, d.y, d.z)
    if not target then return false, "document square not loaded" end
    local best
    for dx = -1, 1 do for dy = -1, 1 do
        local sq = getCell():getGridSquare(target:getX() + dx, target:getY() + dy, target:getZ())
        if not best and sq and sq:isFree(false) and (sq == target or sq:canReachTo(target)) then best = sq end
    end end
    best = best or target
    getPlayer():teleportTo(best:getX() + 0.5, best:getY() + 0.5, best:getZ())
    return true, best:getX() .. "," .. best:getY()
end

-- A clue in a car: stand by it and get in through the vehicle menu's own
-- action, which walks to the door and enters, as a player's click does.
function L.enterVehicle()
    local v = L.vehicle
    if not v then return false, "no vehicle" end
    -- Stand at the driver's door (the seat's own area), not a guessed offset
    -- that can land inside a wall and leave no path to the door.
    local c = v:getAreaCenter(v:getPassengerArea(0))
    if c then getPlayer():teleportTo(c:getX(), c:getY(), v:getZ())
    else getPlayer():teleportTo(v:getX() + 2.5, v:getY() + 0.5, v:getZ()) end
    ISVehicleMenu.onEnter(getPlayer(), v, 0)
    return true
end
function L.inVehicle() return getPlayer():getVehicle() ~= nil end
function L.exitVehicle()
    if getPlayer():getVehicle() then ISVehicleMenu.onExit(getPlayer()) end
    return true
end

-- Click the container's icon in the loot panel, as a player would. Right after
-- a long move the panel has no icon yet, so the caller polls this.
function L.openContainer()
    local target = L.item:getContainer()
    if not target then return false, "item is not in a container" end
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        if b.inventory == target then loot:selectContainer(b); return true, tostring(target:getType()) end
    end
    return false, "no loot-panel icon for " .. tostring(target:getType())
end

function L.take()
    local p = getPlayer()
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, L.item, L.item:getContainer(), p:getInventory()))
    return true
end

function L.carried()
    return L.item:getContainer() == getPlayer():getInventory()
end

-- The real right-click menu on the carried item, then its Inspect option.
function L.inspect()
    local ctx = ISInventoryPaneContextMenu.createMenu(0, true, { L.item }, 200, 200)
    if not ctx then return false, "no context menu" end
    local option = ctx:getOptionFromName("Inspect Investigation Evidence")
    local result
    if not option then result = "the menu has no Inspect Investigation Evidence option"
    elseif option.notAvailable then result = "the Inspect option is greyed out"
    else
        option.onSelect(option.target, option.param1, option.param2, option.param3)
        result = true
    end
    ctx:closeAll()
    return result == true, result == true and "inspected" or result
end

function L.inspected() return R.isInspected(L.item) == true end

-- What the notebook knows: count and the newest titles.
function L.known()
    local rows = R.known()
    local titles = {}
    for i = math.max(1, #rows - 2), #rows do titles[#titles + 1] = tostring(rows[i].title) end
    return #rows, table.concat(titles, " | ")
end

-- A writing tool, so map markers can be drawn (catalogue INF-07).
function L.givePen()
    getPlayer():getInventory():AddItem("Base.Pen")
    return true
end

function L.markers()
    local written, pending, missing = ConspiracyFiles.ClueMarkers.status()
    return written, pending, missing
end

-- Open the world map on document n at a zoom where marks are drawn (>= 14).
function L.showMap(n)
    local d = L.list[n] or L.last
    ISWorldMap.ShowWorldMap(0, d.x + 0.5, d.y + 0.5, 17)
    return ISWorldMap_instance ~= nil and ISWorldMap_instance:isVisible()
end

function L.hideMap()
    if ISWorldMap_instance then ISWorldMap.HideWorldMap(0) end
    return true
end

-- Remember where the last document was, since a retired case lists nothing.
function L.remember(n) L.last = L.list[n]; return true end

function L.caseCount()
    local s = R.automaticStatus()
    return s.count, s.scheduled, s.preparing
end

-- Test pacing: the 24 h gap between cases (catalogue INF-04, AS-02).
function L.noGap()
    ConspiracyFiles.AutomaticInvestigations.config.minGapHours = 0
    return true
end
