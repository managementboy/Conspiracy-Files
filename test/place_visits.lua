-- A heading has to be walked into (P4-R81, WP6).
--
-- The whole idea rests on one rule: a return only counts if the player
-- learned something between the two visits. Without that, a player pacing a
-- doorway mints headings out of their own feet, and the place index becomes
-- an address checklist to sweep - exactly the failure grouping by place was
-- supposed to avoid.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/PlaceVisits")

local root = M.empty()
assert(M.validate(root))

-- Being somewhere once is not a return. It is how you get anywhere.
local verdict, n
root, verdict, n = M.visit(root, "109 Walker Road", 3)
assert(verdict == "first" and n == 1, tostring(verdict) .. " " .. tostring(n))
assert(M.counts(root)["109 Walker Road"] == 1)

-- Walk out, walk back in, having learned nothing. Swallowed, silently, and
-- the store is not touched.
root, verdict, n = M.visit(root, "109 Walker Road", 3)
assert(verdict == "swallowed" and n == 1, tostring(verdict))
root, verdict, n = M.visit(root, "109 Walker Road", 2) -- a number going backwards is not progress
assert(verdict == "swallowed" and n == 1, tostring(verdict))

-- Learn something anywhere, come back, and the return is real.
root, verdict, n = M.visit(root, "109 Walker Road", 4)
assert(verdict == "returned" and n == 2, tostring(verdict) .. " " .. tostring(n))
root, verdict, n = M.visit(root, "109 Walker Road", 9)
assert(verdict == "returned" and n == 3)

-- Places are independent: a busy house earns nothing for a quiet one.
root = select(1, M.visit(root, "42 McCoy Lane", 9))
assert(M.counts(root)["42 McCoy Lane"] == 1 and M.counts(root)["109 Walker Road"] == 3)

-- Junk in, nothing out, and never a crash or a corrupted store.
for _, bad in ipairs({ "", "   ", "\n" }) do
    local staged, why = M.visit(root, bad, 4)
    assert(why == "invalid", "a blank place is not a place")
    assert(M.validate(staged), "a refused visit must still hand back a valid store")
end
local staged, why = M.visit(root, "A Place", -1)
assert(why == "invalid", "a negative discovery number is not a number we wrote")

-- Bounded, and eviction costs a heading and nothing else. The place away
-- from longest goes first.
local full = M.empty()
for i = 1, M.MAX + 6 do full = assert(M.visit(full, "Place " .. i, i)) end
assert(M.validate(full))
local kept = 0
for _ in pairs(M.counts(full)) do kept = kept + 1 end
assert(kept <= M.MAX, "the visit table must stay bounded, got " .. kept)
assert(M.counts(full)["Place 1"] == nil, "the longest-unvisited place is the one evicted")
assert(M.counts(full)["Place " .. (M.MAX + 6)] == 1, "the most recent place must survive")

print("PASS place visits: a first visit is not a return, an unchanged discovery "
    .. "number is swallowed, a real return counts, and the store stays bounded")
