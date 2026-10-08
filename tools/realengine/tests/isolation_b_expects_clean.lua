-- Isolation proof, part 2: a fresh engine, whatever ran before.
assert(LEAKED == nil, "state leaked in from another test file")
local v = RE.visited()
assert(v:isKnown(3, 4) == false)
