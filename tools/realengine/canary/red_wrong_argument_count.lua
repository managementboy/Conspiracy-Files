-- EXPECT_FAIL: isKnown
-- WorldMapVisited:isKnown takes (x, y) or (x1, y1, x2, y2); one argument fits neither.
local v = RE.visited()
return v:isKnown(1)
