-- Isolation proof, part 1: leave state behind. Part 2 must never see it, in any order.
LEAKED = "from isolation_a"
local sq = RE.square(1, 1, 0)
assert(sq:getX() == 1)
