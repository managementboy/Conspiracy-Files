-- A clue can now be placed in a car, and found again after it is driven.
--
-- This is the piece that was missing while everything else about vehicles was
-- being built: the access layer, the capacities and the affinity rules were
-- all real, and nothing could put a document in a glovebox because placement
-- only understood grid squares inside a building's rooms.
--
-- Sites are room rectangles and cars are in driveways, so a vehicle target is
-- allowed outside a site's own footprint by Session.VEHICLE_RADIUS - and by
-- nothing else. Twelve tiles is a driveway; it is not the next street.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local S = require("ConspiracyFiles/Generated/Session")
local G = require("ConspiracyFiles/Generated/Generator")

local site = {
    id = "site-a", mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY",
    bounds = { x1 = 100, x2 = 110, y1 = 100, y2 = 110, z = 0 },
    containerTypes = { "counter", "vehicle" },
}

local function target(over)
    local t = { x = 105, y = 105, z = 0, objectIndex = 0, containerIndex = 0,
                containerType = "vehicle", sprite = "Base.VanAmbulance", vehiclePart = "GloveBox" }
    for k, v in pairs(over or {}) do t[k] = v end
    return t
end

-- A car in the driveway belongs to the house.
assert(S.target(target(), site), "a vehicle inside the footprint must be usable")
assert(S.target(target({ x = 110 + S.VEHICLE_RADIUS - 1 }), site), "a car in the driveway belongs to the house")
assert(not S.target(target({ x = 110 + S.VEHICLE_RADIUS }), site),
    "a car in the next street does not; a site's clue must stay findable from the site")
assert(not S.target(target({ z = 1 }), site), "a car is not on the first floor")

-- The shape is checked as strictly as a square target's.
assert(not S.target(target({ containerType = "counter" }), site), "a vehicle target must say it is one")
assert(not S.target(target({ objectIndex = 3 }), site), "a vehicle has no object index into a square")
assert(not S.target(target({ vehiclePart = "" }), site), "a nameless part is not a part")
assert(not S.target(target({ vehicleMark = 7 }), site), "a mark is a string or absent")
assert(S.target(target({ vehicleMark = "cf-g2:doc-1" }), site), "a marked target stays valid")
-- A site that never reported a vehicle container cannot hold a vehicle clue.
local noCars = { id = "site-b", mapId = site.mapId, buildLine = site.buildLine,
                 bounds = site.bounds, containerTypes = { "counter" } }
assert(not S.target(target(), noCars), "a site with no vehicle container must refuse a vehicle target")

-- Square targets are untouched. This is the assertion that matters most: the
-- mod places every clue it has ever placed through this function.
local square = { x = 105, y = 105, z = 0, objectIndex = 2, containerIndex = 1,
                 containerType = "counter", sprite = "furniture_01" }
assert(S.target(square, site), "an ordinary container target must still validate")
assert(not S.target({ x = 90, y = 105, z = 0, objectIndex = 0, containerIndex = 0,
                      containerType = "counter", sprite = "f" }, site),
    "an ordinary target outside the footprint must still be refused; the widening is for cars only")

-- A whole case distributed across a house and the car outside it.
local catalog = dofile("test/fixtures/synthetic_locations.lua")
local case = assert(G.generate(catalog, 5,
    { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }))
local choices, rooms = {}, {}
for _, location in ipairs(case.locations) do
    local b = location.bounds
    -- Make the site accept vehicles the way Storage.scan would have.
    location.containerTypes[#location.containerTypes + 1] = "vehicle"
    table.sort(location.containerTypes)
    choices[location.id], rooms[location.id] = {}, {}
    for i = 1, 6 do
        choices[location.id][i] = { x = b.x1, y = b.y1, z = b.z, objectIndex = i - 1,
            containerIndex = 0, containerType = location.containerTypes[1], sprite = "s" }
        rooms[location.id][i] = "office"
    end
    -- Two parts of one car parked just outside, exactly as the scan reports.
    for i, part in ipairs({ "GloveBox", "TruckBed" }) do
        local n = 6 + i
        choices[location.id][n] = { x = b.x2 + 1, y = b.y1, z = b.z, objectIndex = 0,
            containerIndex = 0, containerType = "vehicle", sprite = "Base.Van", vehiclePart = part }
        rooms[location.id][n] = part
    end
end
local root = assert(S.createDistributed(case, choices, rooms))
assert(S.validate(root), "a case using a car must validate like any other")

-- Two parts of the same car at the same parking square are two containers, not
-- one. Without the part in the uniqueness key they would collide and the case
-- would be refused as a repeated container.
local sameSquare = { id = "site-c", mapId = site.mapId, buildLine = site.buildLine,
                     bounds = site.bounds, containerTypes = { "vehicle" } }
local glove = target({ vehiclePart = "GloveBox" })
local boot = target({ vehiclePart = "TruckBed" })
assert(S.target(glove, sameSquare) and S.target(boot, sameSquare))
local keyOf = function(t) return table.concat({ t.x, t.y, t.z, t.objectIndex, t.containerIndex,
                                                t.vehiclePart or "-" }, ":") end
assert(keyOf(glove) ~= keyOf(boot), "a glovebox and a boot must not look like one container")

print("PASS vehicle placement: a car in the driveway belongs to the house, a car in the next "
    .. "street does not, square targets are untouched, and one car offers two distinct containers")
