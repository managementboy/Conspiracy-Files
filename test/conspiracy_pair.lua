package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Pair=require("ConspiracyFiles/Generated/ConspiracyPair")
local pair=Pair.current()
assert(Pair.validate(pair))
assert(#pair.theories==2 and pair.theories[1].id~="" and pair.theories[2].id~="")
assert(pair.correct==nil and pair.winner==nil and pair.score==nil,
 "the campaign pair must not encode an objectively correct interpretation")
assert(pair.question=="Did the infection leave the farm as a sample, or arrive at the farm as a sample?")
pair.theories[1].title="changed"
assert(Pair.current().theories[1].title=="Farm Zero","callers cannot mutate canonical campaign history")
assert(not Pair.validate(pair),"altered campaign history is refused")
local withWinner=Pair.current();withWinner.correct="farm-zero"
assert(not Pair.validate(withWinner),"a hidden winner cannot be smuggled into the saved pair")
print("PASS conspiracy pair: two immutable readings share facts and have no winner")
