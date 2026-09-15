-- The in-game vehicle probe (owner, 2026-09-11: "found a car... time to test if
-- we can place things?"). Checked at the source: every step is an engine call.
local src = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/VehicleProbe.lua")):read("*a")
assert(src:find("World.vehiclesNear", 1, true), "the probe must use the same vehicle scan a case uses")
assert(src:find("World.markVehiclePart", 1, true), "it must mark the part as a case would")
assert(src:find("World.resolveVehicle", 1, true), "and find it again by that mark, as a case would")
assert(src:find("function V.find", 1, true), "and offer a second check after the vehicle has moved")
local observer = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua")):read("*a")
assert(observer:find('"VehicleProbe"', 1, true), "the probe must be in the module self-check")
print("PASS vehicle probe: places, marks and re-finds through the same path a case uses")
