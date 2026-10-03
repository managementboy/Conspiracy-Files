-- EXPECT_FAIL: getDoor
-- The call that broke in build 42.20.4: IsoGridSquare.getDoor(boolean) no longer exists.
-- The hand-made fakes accepted it. The real engine must not.
local sq = RE.square()
return sq:getDoor(true)
