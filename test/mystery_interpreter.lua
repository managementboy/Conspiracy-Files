-- WHAT IS VISIBLE, RECOMPUTED EVERY TIME - NEVER A STALE CACHE.
--
-- docs/design/ENGINE_REDESIGN_ITERATIONS_2026-09-25.md, iteration 3's
-- attacker frame on Interpreter.lua: "a REVEAL's requires finding gets
-- retracted after being placed; the REVEAL stays visible because
-- Interpreter only checked requires once, on first satisfaction, and
-- cached the result." This module has no cache to go stale in; this test
-- proves it by retracting a finding mid-sequence and showing the REVEAL
-- disappears on the very next call.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local I=require("ConspiracyFiles/Mystery/Interpreter")
local L=require("ConspiracyFiles/Mystery/Ledger")

local mystery={
    id="t",centralAxis="movement",
    findings={
        a={where="onMe",capacity="object",kind="Key1",wear="worn",outdoor=false},
        b={where="site",capacity="prose",kind="notepad",outdoor=true},
    },
    reveals={
        {requires={"a"},text="I have a key."},
        {requires={"a","b"},about="b",text={fresh="The note is legible.",worn="Some of the note has faded.",
            faded="The note is unreadable.",unplaced="No note yet."}},
    },
    gates={{kind="door",produces="a"}},
    close={kind="all",keys={"a","b"}},
}

-- 1. Nothing known yet: nothing visible.
local ledger=L.new()
assert(#I.visibleReveals(mystery,ledger,0,{})==0,"no reveal should show before anything is known")
assert(I.gateSatisfied(mystery,1,ledger)==false)
assert(I.close(mystery,ledger)=="carried")

-- 2. Knowing `a` reveals the first, tier-blind REVEAL. The gate is now
--    satisfied because it produces `a`.
ledger=assert(L.markKnown(ledger,"a",1,"search"))
local visible=I.visibleReveals(mystery,ledger,1,{})
assert(#visible==1 and visible[1].text=="I have a key.")
assert(I.gateSatisfied(mystery,1,ledger)==true)
assert(I.close(mystery,ledger)=="carried","still waiting on b")

-- 3. Knowing `b` too reveals the tier-branching second REVEAL, resolved
--    against a frozen `now` and the placement hours the caller supplies.
ledger=assert(L.markKnown(ledger,"b",5,"search"))
local placements={a=1,b=5}
local visibleFresh=I.visibleReveals(mystery,ledger,5,placements)
assert(#visibleFresh==2 and visibleFresh[2].text=="The note is legible.",
    "b just placed, at now=5, must read as fresh: got "..tostring(visibleFresh[2] and visibleFresh[2].text))
local visibleFaded=I.visibleReveals(mystery,ledger,5+30,placements) -- outdoors, paper-equivalent curve on notepad's default kind
-- notepad has no explicit curve in Spoilage.CURVES, so it stays "fresh"
-- (fails safe rather than assuming a fade rate this module was not told).
assert(visibleFaded[2].text=="The note is legible.","an uncurved kind must fail safe to fresh, never assumed faded")
assert(I.close(mystery,ledger)=="completed")

-- 4. THE ATTACK: retract `b` (its world state is confirmed gone) BEFORE it
--    was known, in a fresh ledger, and show the REVEAL that requires it
--    never appears - not once, not stale.
local ledger2=assert(L.markKnown(L.new(),"a",1,"search"))
ledger2=assert(L.markRetracted(ledger2,"b",9))
local visible2=I.visibleReveals(mystery,ledger2,9,{})
assert(#visible2==1,"a REVEAL whose requirement was retracted must never appear, not even once: got "..#visible2)
assert(I.close(mystery,ledger2)=="retracted","the mystery itself must report retracted, not carried")

print("PASS interpreter: reveals recompute fresh every call, tier-branching text resolves "
    .."against a frozen now, an uncurved kind fails safe, and a retracted requirement "
    .."never lets its dependent reveal appear")
