-- The nearest named building, for things found outdoors.
--
-- A wallet lying on the street beside 109 Walker Road was reported as "observed
-- in a building the address book does not name (10829, 9440)" - false twice:
-- it was not in a building, and the building beside it had a name. The owner
-- had also asked three times for the coordinates to go.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path
local src = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/AddressMap.lua")):read("*a")
assert(src:find("function M.nearest(x,y,within)", 1, true), "the address book must answer 'nearest named building'")
-- Distance to the footprint's EDGE, not its centre: standing on a porch is no
-- distance from the house.
assert(src:find("Distance to the footprint's edge", 1, true))
local observer = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua")):read("*a")
assert(observer:find('"outdoors, near "..label', 1, true), "outdoors must read as outdoors")
assert(observer:find('"right outside "..label', 1, true), "on the doorstep reads as right outside it")
assert(observer:find('map.labelForBuilding', 1, true), "inside a named building still uses its own address first")
print("PASS address nearest: outdoors is outdoors, and the nearest named building gives it a place")
