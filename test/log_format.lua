-- One log format, so a play session can be read by querying it.
--
-- Owner, 2026-09-10: "our logging for you to follow my play has become
-- unstructured... speed and reduced token usage on your side is also very
-- important."
--
-- It had: twelve private log functions and twenty-two prefixes, two pairs of
-- them the same thing under different names, no time, no case, and lines like
-- "Marked=" that name nothing.
--
-- The saving is NOT shorter lines - a key=value line is slightly longer than a
-- sentence. It is that `grep 'ev=placed'` returns five lines where a person
-- would otherwise read five hundred. Everything below defends that one
-- property.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local Log = require("ConspiracyFiles/Log")

local lines = {}
local realPrint = print
print = function(s) lines[#lines + 1] = s end
Log.info("placed", { case = "3", doc = "d4", room = "kitchen" })
Log.warn("conflict", { case = "3", why = "two items share one token" })
Log.error("error", { why = "no container" })
Log.debug("scan", { n = 12 })
Log.message("marker", "marker", "Clue markers active.")
print = realPrint

-- Debug is off by default. A log left at debug is how this became unreadable
-- the first time.
assert(#lines == 4, "debug must not print at the default level, got " .. #lines .. " lines")
assert(Log.level == "i")

-- ONE prefix, on every line, so one grep finds the whole mod.
for _, line in ipairs(lines) do
    assert(line:sub(1, 4) == "[CF]", "every line must carry the one prefix: " .. line)
    assert(line:find(" v=1 ", 1, true), "every line must carry the format version")
    assert(line:find(" lvl=", 1, true), "every line must carry a level")
    assert(line:find(" ev=", 1, true), "every line must carry an event")
    assert(not line:find("\n", 1, true), "one line per event, or grep is useless")
end

-- Fixed field order, so lines column-align and a grep for a prefix of the line
-- keeps working when a field is added later.
assert(lines[1] == "[CF] v=1 t=- lvl=i ev=placed case=3 doc=d4 room=kitchen", lines[1])

-- Values with spaces are quoted, so a field never splits into two.
assert(lines[2]:find('why="two items share one token"', 1, true), lines[2])

-- The event vocabulary is closed. A typo would produce a line nobody ever
-- greps for, which is silent and permanent.
local ok = pcall(Log.write, "i", "notAnEvent", {})
assert(not ok, "an unknown event must fail loudly rather than log quietly")
assert(#Log.events() > 15 and #Log.events() < 60, "the vocabulary should stay small enough to remember")

-- Levels filter.
Log.level = "e"
lines = {}
print = function(s) lines[#lines + 1] = s end
Log.info("placed", {}); Log.error("error", {})
print = realPrint
assert(#lines == 1 and lines[1]:find("lvl=e", 1, true), "at level e only errors print")
Log.level = "i"

-- And no client module may go back to printing its own prefix. That is the
-- regression that produced twenty-two vocabularies, one cheap change at a time.
local handle = io.popen("grep -rln 'print(\"\\[CF' mod/common/media/lua/client/ConspiracyFiles/ 2>/dev/null | wc -l")
local strays = tonumber(handle:read("*a")) or 0
handle:close()
assert(strays == 0, strays .. " client module(s) still print their own prefix instead of using Log")

print("PASS log format: one prefix, one vocabulary, fixed field order, debug off, "
    .. "and no module printing its own prefix")
