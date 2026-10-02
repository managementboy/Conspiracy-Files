-- EXPECT_FAIL: isKnown
local v = RE.visited()
return v:isKnown("x", "y")
