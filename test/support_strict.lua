-- The strict double must reject exactly the call form the engine rejects.
local strict = dofile("test/support/strict.lua")

local square = strict.object("square", { HasStairs = function() return true end })
assert(square:HasStairs() == true, "colon syntax works")

local ok, err = pcall(function() return square.HasStairs() end)
assert(not ok, "receiver-less call must fail, as Kahlua does")
assert(tostring(err):find("needs a receiver", 1, true), "the error must say why: " .. tostring(err))

-- Passing the receiver explicitly is how our pcall-wrapped code calls through.
assert(square.HasStairs(square) == true, "explicit receiver is accepted")

-- Arguments and self both arrive intact.
local seen
local door = strict.object("door", { isBlockedTo = function(self, other) seen = other; return true end })
assert(door:isBlockedTo("west") == true and seen == "west", "arguments pass through")

-- Non-function fields are left alone.
local item = strict.object("item", { name = "ID Card", getName = function() return "ID Card" end })
assert(item.name == "ID Card" and item:getName() == "ID Card", "plain fields are untouched")

local quick = strict.returning("player", { getX = 10, getY = 20 })
assert(quick:getX() == 10 and quick:getY() == 20, "returning() builds strict methods too")
assert(not pcall(function() return quick.getX() end), "returning() doubles are strict as well")

print("PASS strict doubles: colon accepted, receiver-less refused, arguments and fields intact")
