-- THE LEDGER NEVER UN-KNOWS, NEVER DOUBLE-CLAIMS, NEVER RETRACTS A FACT.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, iteration 2's
-- speedrunner frame named six exploits against a naive version of this
-- design; iteration 2's "abuse-proof endings" deepening named the fix for
-- each. This test is iteration 2's own instruction to itself: "replay the
-- six exploit scenarios as ledger event sequences and assert each one now
-- resolves correctly before touching any PZ API."
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local L=require("ConspiracyFiles/Mystery/Ledger")

-- ---------------------------------------------------------------------------
-- 1. CLOSE=carried is not a zero-effort exit; it is only what an author
--    writing NO predicate produces. A predicate always resolves to
--    completed/retracted/carried-by-shortfall, never a free "none".
-- ---------------------------------------------------------------------------
local empty=L.new()
assert(L.close(empty,nil)=="carried","no predicate at all is carried, by design, not by exploit")
assert(L.close(empty,{kind="all",keys={"a","b"}})=="carried","nothing known yet is carried, not a free ending")
local ok,why=L.close(empty,{kind="all",keys={}})
assert(ok==nil and why=="invalid predicate","an empty key set is refused, not a trivial always-available exit")

-- ---------------------------------------------------------------------------
-- 2. REVEAL/GATE farming: re-forming a LINK or re-satisfying a GATE across
--    loads is a no-op. The ledger key already existing is the whole fix.
-- ---------------------------------------------------------------------------
local l2=assert(L.markKnown(L.new(),"n1",10,"search"))
local again=assert(L.markKnown(l2,"n1",99,"search"))
assert(again.known.n1.hour==10,"a second mark for the same node must not move its hour")
assert(again==l2 or (again.known.n1.hour==l2.known.n1.hour and again.known.n1.mechanic==l2.known.n1.mechanic),
    "re-marking a known node is a no-op")

-- ---------------------------------------------------------------------------
-- 3. A failed GATE does not persist beside a later success: there is only
--    ever one ledger entry per node, so "failed" is simply not-yet-known,
--    never a second row credited alongside a real one.
-- ---------------------------------------------------------------------------
local l3=L.new()
-- A "failed attempt" writes nothing to the ledger at all - only a real
-- satisfaction does. Two attempts, one entry.
l3=assert(L.markKnown(l3,"gate1",5,"door"))
l3=assert(L.markKnown(l3,"gate1",6,"door"))
local n=0; for _ in pairs(l3.known) do n=n+1 end
assert(n==1,"one gate satisfied twice must never double-credit: got "..n.." entries")

-- ---------------------------------------------------------------------------
-- 4. One corpse cannot be aliased by two mysteries' reservations.
-- ---------------------------------------------------------------------------
local l4=assert(L.reserve(L.new(),"body:1","mystery-a"))
local sameOwner=assert(L.reserve(l4,"body:1","mystery-a"))
assert(sameOwner.reservation["body:1"]=="mystery-a")
local blocked,blockWhy=L.reserve(l4,"body:1","mystery-b")
assert(blocked==nil and blockWhy=="held by another mystery","a second mystery must never claim a held body")
assert(L.heldBy(l4,"body:1")=="mystery-a")

-- ---------------------------------------------------------------------------
-- 5. Expiry is not modelled here (it is the placement adapter's job, keyed
--    on a stored in-game hour), but the ledger itself has no wall-clock
--    concept at all to freeze - every hour passed to it is the caller's own
--    in-game hour, so there is nothing in this module a save/load or a
--    time-skip could manipulate.
-- ---------------------------------------------------------------------------
local bad,badWhy=L.markKnown(L.new(),"n",-1,"search")
assert(bad==nil and badWhy=="invalid hour","only a real, non-negative in-game hour may be recorded")

-- ---------------------------------------------------------------------------
-- 6. Destroying a found finding cannot force "carried": `known` never reads
--    the world, only itself, so there is no live-object check to defeat by
--    burning the item. A node once known stays known for ever.
-- ---------------------------------------------------------------------------
local l6=assert(L.markKnown(L.new(),"a",1,"search"))
l6=assert(L.markKnown(l6,"b",2,"search"))
assert(L.close(l6,{kind="all",keys={"a","b"}})=="completed")
-- The player "destroys" a and b in the world; the ledger is asked nothing
-- about the world, so nothing changes.
assert(L.close(l6,{kind="all",keys={"a","b"}})=="completed",
    "destroying found evidence in the world must not un-close a completed mystery")

-- ---------------------------------------------------------------------------
-- 7. Retraction: a required node the world no longer holds forecloses an
--    "all" predicate for ever - and a known node can never be retracted
--    after the fact (the world cannot un-happen a fact the survivor holds).
-- ---------------------------------------------------------------------------
local l7=assert(L.markKnown(L.new(),"a",1,"search"))
l7=assert(L.markRetracted(l7,"c",5))
assert(L.close(l7,{kind="all",keys={"a","c"}})=="retracted","a foreclosed required node must retract the mystery")
local refused,refuseWhy=L.markRetracted(l7,"a",9)
assert(refused==nil and refuseWhy=="node already known","a known fact can never be retracted after it was found")

-- An "any" predicate is not retracted while one option is still live.
local l8=L.new()
l8=assert(L.markRetracted(l8,"x",1))
assert(L.close(l8,{kind="any",keys={"x","y"}})=="carried","one live option keeps an any-of predicate open, not retracted")
l8=assert(L.markRetracted(l8,"y",2))
local kind,node=L.close(l8,{kind="any",keys={"x","y"}})
assert(kind=="retracted" and node=="x","every option foreclosed retracts an any-of predicate")

print("PASS mystery ledger: the six exploits from iteration 2 all resolve correctly - "
    .."no free carried exit, no farming, no double-crediting, no aliased reservation, "
    .."no wall-clock to freeze, no forcing carried by destroying evidence")
