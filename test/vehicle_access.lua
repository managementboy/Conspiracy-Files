-- Vehicles as places, first slice: finding a car's containers and finding one
-- again after it has been driven away.
--
-- Owner, 2026-09-09: "next is placement of hints in cars. placing bodies in
-- car boots. placing unreasonable amount of things in a car." And then, on the
-- two things the jar could not answer: "I can confirm they do" - a vehicle's
-- identity and the contents of its boot both survive a save and reload.
--
-- Everything the mod places today is addressed by a grid square, which is safe
-- because a kitchen cupboard cannot walk away. This is the layer that stops
-- that assumption reaching cars: a clue in a vehicle is found again by a mark
-- left on the PART, so it does not matter where the car has since been parked.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path

-- A fake cell with two vehicles, one of which will drive off mid-test.
local function fakePart(id, capacity)
    local md = {}
    local part
    part = {
        getId = function() return id end,
        getContainerCapacity = function() return capacity end,
        getModData = function() return md end,
        getItemContainer = function() return part.container end,
    }
    part.container = {
        getType = function() return "vehicle" end,
        getVehiclePart = function() return part end,
        items = {},
    }
    return part
end

local function fakeVehicle(x, y, partIds)
    local parts = {}
    for id, capacity in pairs(partIds) do parts[id] = fakePart(id, capacity) end
    local vehicle
    vehicle = {
        at = { x = x, y = y, z = 0 },
        getSquare = function()
            return { getX = function() return vehicle.at.x end,
                     getY = function() return vehicle.at.y end,
                     getZ = function() return vehicle.at.z end }
        end,
        getParts = function()
            return { getPartById = function(_, id) return parts[id] end }
        end,
        parts = parts,
    }
    return vehicle
end

local car = fakeVehicle(100, 100, { GloveBox = 5, TruckBed = 40 })
local van = fakeVehicle(102, 101, { TruckBed = 70 })
local absent = fakeVehicle(500, 500, { GloveBox = 5 })
local cell = { getVehicles = function() return { [car] = true, [van] = true, [absent] = true } end }
getCell = function() return cell end

local W = require("ConspiracyFiles/WorldAccess")

-- Only the parts a clue could plausibly live in, in a fixed order. Engine
-- iteration order must never decide which container a case uses, for the same
-- reason every other selection in this mod is ordered: a case has to rebuild
-- identically after a reload.
local parts = W.vehicleParts(car)
assert(#parts == 2, "expected two usable containers, got " .. #parts)
assert(parts[1].part == "GloveBox", "GloveBox must come first, got " .. parts[1].part)
assert(parts[2].part == "TruckBed")
assert(parts[1].capacity == 5 and parts[2].capacity == 40,
    "capacity must be reported; a 20-weight body fits a boot and not a glovebox")

-- Distance is measured from where the car is NOW.
local near = W.vehiclesNear(100, 100, 0, 5)
assert(#near == 2, "expected the two nearby vehicles, got " .. #near)
local far = W.vehiclesNear(100, 100, 0, 1)
assert(#far == 1, "only the car itself is within one tile")
assert(#W.vehiclesNear(100, 100, 1, 50) == 0, "a vehicle on another floor is not nearby")

-- Mark a part, then drive the car to the other side of town. The mark is the
-- whole point: nothing here asks the engine which vehicle this is.
local boot = parts[2].container
assert(W.markVehiclePart(boot, "cf-veh:case-1:doc-4"), "marking a real vehicle part must succeed")
local target = { x = 100, y = 100, z = 0, vehiclePart = "TruckBed", vehicleMark = "cf-veh:case-1:doc-4" }
assert(W.resolveVehicle(target) == boot, "the marked boot must resolve where it stands")

-- Only the player can move a car (owner, 2026-09-09), so a moved car means the
-- clue is travelling with the person it is for. What must not break is the mod
-- losing track of a clue the player still has.
car.at = { x = 140, y = 96, z = 0 }
assert(W.resolveVehicle(target) == boot,
    "a driven car must still resolve; the evidence went with the driver and the mod must know it")

-- Driven right out of range: not found, and explicitly so. Absence is never
-- destruction here, exactly as the whereabouts scan already treats it - and
-- here it is not even loss, since somebody drove it there.
car.at = { x = 900, y = 900, z = 0 }
local gone, why = W.resolveVehicle(target)
assert(gone == nil and why == "vehicle-not-found", "a car far away must be reported missing, not guessed at")

-- The van's boot is a different container with no mark, and must never be
-- mistaken for ours.
car.at = { x = 100, y = 100, z = 0 }
local wrongPart = { x = 100, y = 100, z = 0, vehiclePart = "GloveBox", vehicleMark = "cf-veh:case-1:doc-4" }
assert(W.resolveVehicle(wrongPart) == nil, "the mark belongs to one part, not to the whole car")

-- Malformed targets are refused rather than guessed at.
assert(W.resolveVehicle({ x = 1, y = 1, z = 0 }) == nil, "a square target is not a vehicle target")
assert(W.resolveVehicle(nil) == nil)
assert(not W.markVehiclePart(nil, "x"), "marking nothing must fail rather than pretend")
assert(not W.markVehiclePart({ getType = function() return "counter" end }, "x"),
    "a kitchen counter has no vehicle part to mark")

-- The scan is bounded: a cell can hold a great many vehicles.
local many = {}
for i = 1, 40 do many[fakeVehicle(100, 100, { TruckBed = 40 })] = true end
cell.getVehicles = function() return many end
assert(#W.vehiclesNear(100, 100, 0, 5, 8) <= 8, "the vehicle scan must stay bounded")

print("PASS vehicle access: ordered parts with capacities, distance from where a car is now, "
    .. "and a marked boot that survives being driven across town")
