-- The ground-clue readers (door, floor, solid, outside, sight, zombies) against REAL squares.
-- Every engine read in GeneratedRuntime's groundFacts sits inside pcall and returns nil on error,
-- which is how a removed game method (getDoor(boolean), 42.20.4) turned a reader into a silent
-- "always false". Here pcall is wrapped to RECORD every failure, and no reader may reject a call.
local errors, rawpcall = {}, pcall
pcall = function(fn, ...)
    local r = {rawpcall(fn, ...)}
    if not r[1] then errors[#errors + 1] = tostring(r[2]) end
    return unpack(r)
end
local made = {}
getCell = function()
    return {
        getGridSquare = function(_, x, y, z) local s = RE.square(x, y, z); made[#made + 1] = s; return s end,
        getZombieList = function() return nil end,
    }
end
local R = require("NHShared/GeneratedRuntime")
assert(R.groundFacts, "GeneratedRuntime no longer exposes groundFacts")

local survivor = {x = 5, y = 5, z = 0, n = 0}
local facts = R.groundFacts(5, 5, 0, "ground:5:5:0", nil, {}, survivor)
local read = {}
for _, k in ipairs({"exists", "z", "floor", "solid", "outside", "door", "nearSurvivor", "zombies"}) do
    read[k] = facts[k]
end
assert(read.exists == true, "the real square exists")
assert(read.z == 0, "the square reports its floor")
assert(read.door == false, "an empty square has no door: false, not an error")

-- A call the real game rejects shows up here. A binding rejection is a mod bug; anything else
-- (e.g. a null world behind an empty test square) is only a limit of having no loaded map.
local rejected, limits = {}, {}
for _, e in ipairs(errors) do
    if e:find("No implementation found", 1, true) or e:find("attempted to call nil", 1, true) then rejected[#rejected + 1] = e
    else limits[#limits + 1] = e end
end
RE.log(("ground readers: %d squares, %d engine rejections, %d no-world limits"):format(#made, #rejected, #limits))
assert(#rejected == 0, "the real game rejected a reader's call:\n  " .. table.concat(rejected, "\n  "))
