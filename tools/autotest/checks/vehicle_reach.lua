-- Stages for checks/vehicle_reach.sh: a paper in a van's truck bed and in its
-- glove box, reached as a player reaches them - from outside, through the door
-- that guards the part. Cases put clues in cars at random, so the core loop met
-- a car on some runs only, and the fix for reaching one (after 20260914T173417)
-- had never met a car at all. This spawns one. Loaded after core_loop.lua,
-- whose reach stages it drives.
CFVan = CFVan or {}
local V = CFVan
local L = CFLoop

-- Open ground for a van: every square of a 7 x 5 block outdoors and free.
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

function V.spawn()
    local p = getPlayer()
    pcall(function() p:setGodMod(true); p:setInvisible(true) end)
    local sq = openGround(math.floor(p:getX()), math.floor(p:getY()), 0)
    if not sq then return false, "no open ground within 40 tiles" end
    local v = addVehicleDebug("Base.PickUpVan", IsoDirections.N, nil, sq)
    if not v then return false, "the van did not spawn" end
    pcall(function() v:repair() end)
    pcall(function() v:setLocked(false) end)
    V.vehicle = v
    return true, tostring(v:getScriptName()), sq:getX() .. "," .. sq:getY()
end

-- A paper in `partId`, with every door shut, the player stood a few tiles away,
-- and the core loop's stages pointed at it - so reaching it has to walk to the
-- part's own area and open the door that guards it.
function V.place(partId)
    local v = V.vehicle; if not v then return false, "no van" end
    local part = v:getPartById(partId)
    local c = part and part:getItemContainer()
    if not c then return false, "the van has no " .. partId .. " container" end
    for _, doorId in ipairs({ "TrunkDoor", "DoorFrontRight", "DoorFrontLeft" }) do
        local door = v:getPartById(doorId)
        local d = door and door:getDoor()
        if d then pcall(function() d:setLocked(false); d:setOpen(false) end) end
    end
    local item = c:AddItem("Base.Note")
    if not item then return false, "could not put a paper in the " .. partId end
    item:getModData().cfVanProbe = partId
    getPlayer():teleportTo(v:getX() - 6, v:getY() + 0.5, v:getZ())
    L.vehicle, L.part, L.item = v, part, item
    return true, partId
end

-- Owner, 2026-09-14: a truck bed or trunk is reached from outside "only if they
-- are open". So the rule is proved from both sides: standing in the part's own
-- area with its door still shut, the game must refuse the container; the reach
-- stage then opens the door and the game must allow it.
function V.accessWhileShut()
    local v, part = L.vehicle, L.part
    if not v or not part then return false, "no part" end
    local area = part:getArea()
    local c = area and v:getAreaCenter(area)
    if not c then return false, "the part has no area" end
    getPlayer():teleportTo(c:getX(), c:getY(), v:getZ())
    return true, tostring(v:canAccessContainer(part:getIndex(), getPlayer()) == true)
end

function V.inVehicle() return getPlayer():getVehicle() ~= nil end

return CFVan
