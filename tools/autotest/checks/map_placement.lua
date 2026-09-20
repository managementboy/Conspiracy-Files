-- Stages for checks/map_placement.sh: the destination payoff must never record
-- itself as placed unless the item is really in the container.
--
-- Written after a manual attempt at the same thing produced nothing but
-- artefacts (2026-09-20). Two lessons are built in here rather than left to
-- whoever drives it:
--
--   * A fault is armed until something consumes it. Arming one and then failing
--     to reach the placement leaves it live, and the background scanner walks
--     into it later - which is what happened, and every reading taken after
--     that was meaningless. Every stage below reports whether the fault it
--     armed was actually consumed, and the shell treats "not consumed" as
--     inconclusive, never as a pass.
--   * The destination payoff is attempted ONCE per design (place() refuses a
--     second part-4 attempt unless the first was refused), so each fault point
--     needs its own design and its own destination.
CFPlace = CFPlace or {}
local P = CFPlace
local R = ConspiracyFiles.MapMediaRuntime
local C = require("ConspiracyFiles/MapMediaCatalogue")

local TAG = "ConspiracyFiles.MapMedia"

-- Designs that resolve to exactly one building, so a destination really exists.
function P.usable(count)
    local out = {}
    for _, id in ipairs(C.list) do
        local ok, c = pcall(R.coverage, id)
        if ok and type(c) == "table" and tonumber(c.buildings) == 1 then
            local e = C.get(id)
            if e and e.targets and e.targets[1] then
                out[#out + 1] = id
                if #out >= (count or 4) then break end
            end
        end
    end
    return table.concat(out, ",")
end

-- Activate the trail the way a read does, then stand in its destination.
function P.goTo(id)
    local e = C.get(id)
    if not e then return false, "unknown design" end
    local t = e.targets[1]
    require "ISUI/ISInventoryPaneContextMenu"
    local m = getPlayer():getInventory():AddItem("Base.RosewoodMap")
    if not m then return false, "no map item" end
    m:setStashMap(id)
    ISInventoryPaneContextMenu.onCheckMap(m, 0)
    getPlayer():teleportTo(t.x + 0.5, t.y + 0.5, 0)
    return true, tostring(t.x) .. "," .. tostring(t.y)
end

-- What is actually recorded, and what is actually there. Both, because the
-- whole point of the gate is that they must agree.
-- The destination payoff is stored as trails[id].payoff - NOT parts[4]. Reading
-- the wrong field reported "none" for a payoff that was really there, and the
-- whole first run of this check was worthless because of it (2026-09-20).
local function recorded(id)
    local w = ModData.get(TAG)
    local c = w and w.canonical
    local t = c and c.trails and c.trails[id]
    local p = t and t.payoff
    return p and tostring(p.state) or "none"
end

local function realItems(id)
    local p = getPlayer()
    local cell = getCell()
    local n = 0
    for x = -5, 5 do
        for y = -5, 5 do
            local s = cell:getGridSquare(math.floor(p:getX()) + x, math.floor(p:getY()) + y, 0)
            if s then
                local objs = s:getObjects()
                for i = 0, objs:size() - 1 do
                    local o = objs:get(i)
                    local c = o.getContainer and o:getContainer()
                    if c then
                        local items = c:getItems()
                        for j = 0, items:size() - 1 do
                            local md = items:get(j):getModData()
                            if md and md.cfMapDesign == id and md.cfMapPart == 4 then n = n + 1 end
                        end
                    end
                end
            end
        end
    end
    return n
end

-- Arm an interruption BEFORE arriving, so the mod's own scheduled placement
-- walks into it. Driving offerContainer by hand loses the race: the scanner
-- places the payoff first, place() then refuses a second part-4 attempt, and
-- the fault is never reached. Whether it fired is read from the mod's log by
-- the shell, not from here - injectFault returns true whenever it arms, so it
-- can never tell you the fault was consumed.
function P.arm(point)
    if point == nil or point == "none" then return "none" end
    return R.injectFault(point) and "armed" or "arm-failed"
end

-- Drive the production path on every qualifying container in reach, as the
-- loot-window path does. Returns: threw, recorded state, real item count.
function P.drive(id, point)
    local p = getPlayer()
    local cell = getCell()
    local threw = false
    for x = -5, 5 do
        for y = -5, 5 do
            local s = cell:getGridSquare(math.floor(p:getX()) + x, math.floor(p:getY()) + y, 0)
            if s then
                local objs = s:getObjects()
                for i = 0, objs:size() - 1 do
                    local o = objs:get(i)
                    local c = o.getContainer and o:getContainer()
                    -- filled=true is what the real OnFillContainer path passes:
                    -- vanilla has finished with this carrier.
                    if c then
                        local ok = pcall(function() return R.offerContainer(c, true) end)
                        if not ok then threw = true end
                    end
                end
            end
        end
    end
    return tostring(threw), recorded(id), realItems(id)
end

function P.state(id) return recorded(id) end
function P.items(id) return realItems(id) end

-- The gate itself, as one verdict per design.
function P.verdict(id)
    local state, n = recorded(id), realItems(id)
    if state == "placed" and n < 1 then return "BAD", state, n end
    if state == "placed" and n > 1 then return "DUPLICATE", state, n end
    return "ok", state, n
end
