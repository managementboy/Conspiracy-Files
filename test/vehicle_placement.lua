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

-- One car parked between two of the case's buildings is a candidate at both.
-- It may hold a clue for one of them, never for both: the 2026-09-11 playtest
-- crashed with "repeated physical container" the first time vehicles were
-- really found. The shared boot is the only lived-in candidate anywhere, so
-- every site prefers it and the later sites must fall back to their own.
-- The fixture's buildings are 100 tiles apart, so this test packs them onto
-- one street, 12 tiles apart, where one parked van is in reach of its neighbours.
local street = dofile("test/fixtures/synthetic_locations.lua")
for i, location in ipairs(street.locations) do
    location.bounds = { x1 = i * 12, y1 = 0, x2 = i * 12 + 8, y2 = 8, z = 0 }
end
local packed = assert(G.generate(street, 5,
    { mapId = "SYNTHETIC-MAP", buildLine = "TEST-ONLY", allowSynthetic = true }))
local xs = {}
for _, location in ipairs(packed.locations) do xs[#xs + 1] = location.bounds.x1 end
table.sort(xs)
local van = { x = math.floor((xs[1] + xs[#xs] + 8) / 2), y = 4, z = 0, objectIndex = 0,
              containerIndex = 0, containerType = "vehicle", sprite = "Base.Van", vehiclePart = "TruckBed" }
local both, lived, reachable = {}, {}, 0
for _, location in ipairs(packed.locations) do
    location.containerTypes[#location.containerTypes + 1] = "vehicle"
    table.sort(location.containerTypes)
    local list = { {} }
    for k, v in pairs(van) do list[1][k] = v end
    local here = { true }
    for i = 1, 6 do
        list[#list + 1] = { x = location.bounds.x1, y = 0, z = 0, objectIndex = i - 1, containerIndex = 0,
                            containerType = location.containerTypes[1], sprite = "s" }
        here[#list] = false
    end
    both[location.id], lived[location.id] = list, here
    if S.target(list[1], location) then reachable = reachable + 1 end
end
assert(reachable >= 2, "the test must really put one van within reach of two sites (got " .. reachable .. ")")
local sharedRoot, why = S.createDistributed(packed, both, nil, lived)
assert(sharedRoot, "a van shared by two sites must not refuse the case: " .. tostring(why))
assert(S.validate(sharedRoot))
local inVan = 0
for _, a in pairs(sharedRoot.assignments) do if a.target.vehiclePart then inVan = inVan + 1 end end
assert(inVan == 1, "exactly one site's clue goes in the shared van, got " .. inVan)

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
