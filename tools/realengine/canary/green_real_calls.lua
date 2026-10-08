-- EXPECT_PASS
-- The partner of the red canaries: correct calls on real objects must work in the same
-- boot, so a half-failed engine set-up cannot make the red ones "fail" for the wrong reason.
local sq = RE.square(7, 8, 1)
assert(sq:getX() == 7 and sq:getY() == 8 and sq:getZ() == 1, "square coordinates")
-- the 42.20.4 door API, both facing directions (nil: this empty square has no door)
assert(sq:getDoor(GridSquareEdgeFacingDirection.NORTH_SOUTH) == nil)
assert(sq:getDoor(GridSquareEdgeFacingDirection.EAST_WEST) == nil)
local v = RE.visited()
assert(v:isKnown(1, 2) == false, "fresh map knowledge is empty")
assert(v:isKnown(1, 2, 3, 4) == false, "four-argument form")
RE.mustReject("getDoor with a boolean", function() return sq:getDoor(true) end)
