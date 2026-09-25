-- READABILITY, LAZY, NEVER A TIMER TO FREEZE.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, iteration 2's
-- hub-and-spoilage deepening plus iteration 3's attacker frame on this
-- module specifically: a finding not yet placed must never be coerced from
-- nil elapsed-time into "freshest possible" - it has an explicit tier of
-- its own, "unplaced".
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local S=require("ConspiracyFiles/Mystery/Spoilage")

-- 1. Not yet placed at all.
assert(S.tier("paper",nil,10,true)=="unplaced","a finding with no placedAt must never read as fresh")
assert(S.tier("paper",5,nil,true)=="unplaced","a caller with no clock must not be told anything is fresh")
assert(S.tier("paper",10,5,true)=="unplaced","a clock before placement is nonsensical, not fresh")

-- 2. Ordinary ageing, outdoors.
assert(S.tier("paper",0,0,true)=="fresh")
assert(S.tier("paper",0,11,true)=="fresh")
assert(S.tier("paper",0,12,true)=="worn")
assert(S.tier("paper",0,23,true)=="worn")
assert(S.tier("paper",0,24,true)=="faded")
assert(S.tier("photo",0,24,true)=="worn")
assert(S.tier("photo",0,48,true)=="faded")

-- 3. Indoors fades slower - a real floor, not a live weather query.
assert(S.tier("paper",0,12,false)=="fresh","indoors must not fade at the outdoor rate")
assert(S.tier("paper",0,48,false)=="worn")
assert(S.tier("paper",0,96,false)=="faded")

-- 4. Metal and keys never fade, however long elapsed.
assert(S.tier("metal",0,100000,true)=="fresh")
assert(S.tier("key",0,100000,false)=="fresh")

-- 5. An unknown kind is a bug the linter should have caught upstream; this
--    module fails safe rather than throwing on a missing curve.
assert(S.tier("unknown-kind",0,1,true)=="fresh")

print("PASS spoilage: unplaced is its own tier, never a false 'fresh'; "
    .."indoor and outdoor curves differ; metal and keys never fade")
