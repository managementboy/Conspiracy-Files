-- THE SECOND HAND-AUTHORED MYSTERY, PROVEN OFFLINE.
--
-- Phase E of the active goal, converging three ADHD frames (remove-load-
-- bearing-assumption, game designer, attacker) into a mystery deliberately
-- unlike the electrician on almost every ShapeCard axis: a redHerring
-- LINK (the one shape LegacyAdapter's own calibration proved the legacy
-- engine can never produce), a heard PRIMARY finding, an "answer" GATE,
-- and close=nil (permanently carried) - proving that ending shape
-- natively for the first time (mystery_ledger.lua proved it only against
-- a hand-built fixture, never a real authored mystery).
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Linter=require("ConspiracyFiles/Mystery/Linter")
local ShapeCard=require("ConspiracyFiles/Mystery/ShapeCard")
local DiversityGuard=require("ConspiracyFiles/Mystery/DiversityGuard")
local Ledger=require("ConspiracyFiles/Mystery/Ledger")
local Interpreter=require("ConspiracyFiles/Mystery/Interpreter")
local farmer=require("ConspiracyFiles/Mystery/Content/FarmerRecalledDelivery")
local electrician=require("ConspiracyFiles/Mystery/Content/ElectricianUnsignedRepair")

local ok,why=Linter.lint(farmer)
assert(ok,"farmer failed the honesty check: "..tostring(why))

local cardF,cardE=ShapeCard.compute(farmer),ShapeCard.compute(electrician)
assert(ShapeCard.tupleKey(cardF)~=ShapeCard.tupleKey(cardE),
    "the second mystery must not share the first's exact structural tuple")
assert(cardF.linkShapes=="redHerring" and cardE.linkShapes=="contradiction",
    "the two mysteries must use different LINK shapes")
assert(cardF.closeKind=="carried" and cardE.closeKind=="gate",
    "the two mysteries must end differently")

local guardOk,guardWhy=DiversityGuard.check({farmer,electrician},{"farmer","electrician"})
assert(guardOk,"guard refused a genuinely diverse pair: "..tostring(guardWhy))

-- close=nil reports carried with nothing known, and STAYS carried once the
-- rumour alone is known - proving "carried" is never a transition a
-- player can force by knowing everything short of a completion predicate
-- the author never wrote.
local ledger=Ledger.new()
assert(Interpreter.close(farmer,ledger)=="carried")
local withRumour=assert(Ledger.markKnown(ledger,"rumour",10,"heard"))
assert(Interpreter.close(farmer,withRumour)=="carried",
    "close=nil must never report anything but carried, no matter what is known")
local withReading=assert(Ledger.markKnown(withRumour,"reading",11,"gate:answer"))
assert(Interpreter.close(farmer,withReading)=="carried",
    "even the GATE's own produced finding must not end a close=nil mystery")

print("PASS mystery_farmer: lints clean, its ShapeCard collides with neither the "
    .."electrician's tuple nor its LINK shape nor its CLOSE kind, the diversity "
    .."guard accepts the pair, and close=nil reports carried under every ledger "
    .."state - never completing regardless of what becomes known")
