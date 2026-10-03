-- EXPECT_FAIL: REJECTED noSuchMethod
-- The engine reports a missing method with an empty message, so this canary first proves
-- the engine is healthy (a real call works), then that the bad call is rejected.
local sq = RE.square()
assert(sq:getX() == 5, "engine not healthy before the bad call")
local ok = pcall(function() return sq:noSuchMethod() end)
if not ok then error("REJECTED noSuchMethod") end
return "the game accepted a method that does not exist"
