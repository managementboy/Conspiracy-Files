-- THE THIRD MYSTERY, PROVEN OFFLINE - THE FITNESS TEN, REDESIGNED.
--
-- docs/design/EVERY_MYSTERY_ITS_OWN_2026-09-25.md §5 step 6: "The Fitness
-- ten are redesigned as one or two mysteries of their own, or retired."
-- The owner's own answer, DR-20260925-MYSTERY-BOUNDARIES q6: "Include
-- them all in the redesign." This proves the redesign lints clean, and
-- that its ShapeCard collides with neither of the two mysteries already
-- proven live.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Linter=require("ConspiracyFiles/Mystery/Linter")
local ShapeCard=require("ConspiracyFiles/Mystery/ShapeCard")
local DiversityGuard=require("ConspiracyFiles/Mystery/DiversityGuard")
local Ledger=require("ConspiracyFiles/Mystery/Ledger")
local Interpreter=require("ConspiracyFiles/Mystery/Interpreter")
local fitness=require("ConspiracyFiles/Mystery/Content/FitnessInstructorWelfareVisit")
local electrician=require("ConspiracyFiles/Mystery/Content/ElectricianUnsignedRepair")
local farmer=require("ConspiracyFiles/Mystery/Content/FarmerRecalledDelivery")

local ok,why=Linter.lint(fitness)
assert(ok,"fitness instructor mystery failed the honesty check: "..tostring(why))

local roster={fitness,electrician,farmer}
local keys={}
for _,m in ipairs(roster) do
    local key=ShapeCard.tupleKey(ShapeCard.compute(m))
    assert(not keys[key],"a structural tuple collision among the three mysteries: "..key)
    keys[key]=m.id
end

local cardF=ShapeCard.compute(fitness)
assert(cardF.countBucket=="5-6","expected the redesign to land in a new count bucket, got "..cardF.countBucket)
assert(cardF.dominantGate=="door","expected a door GATE, got "..cardF.dominantGate)
assert(cardF.closeKind=="all","expected close kind all, got "..cardF.closeKind)
assert(cardF.linkShapes=="pair,threeWay","expected pair,threeWay link shapes, got "..cardF.linkShapes)

local guardOk,guardWhy=DiversityGuard.check(roster,{"fitness-instructor","electrician","farmer"})
assert(guardOk,"guard refused a genuinely diverse roster of three: "..tostring(guardWhy))

-- CLOSE reports "completed" only once literally every declared key is
-- known - preserving the original ten's own "essential" discipline, not
-- loosening it in the rewrite.
local ledger=Ledger.new()
assert(Interpreter.close(fitness,ledger)=="carried")
for _,id in ipairs({"claim","appointment","response","review","vehicle"}) do
    ledger=assert(Ledger.markKnown(ledger,id,10,"search"))
    assert(Interpreter.close(fitness,ledger)=="carried",
        "must not report completed before every key, including the gate's own, is known")
end
ledger=assert(Ledger.markKnown(ledger,"doorConfirmed",11,"gate:door"))
assert(Interpreter.close(fitness,ledger)=="completed",
    "must report completed once every declared key, including the door, is known")

print("PASS mystery_fitness_instructor: lints clean, its ShapeCard collides with "
    .."neither earlier mystery's exact tuple, the diversity guard accepts all three "
    .."together, and CLOSE=all only completes once every declared finding - the "
    .."door included - is known")
