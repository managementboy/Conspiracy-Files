-- Of Interest: an identical log line repeated in the same in-game minute prints once (then once per
-- REPEAT_EVERY, saying how often), and the scheduler reports jobs that ran over their budget.
package.path = "mod-ofinterest/common/media/lua/shared/?.lua;" .. package.path
local Log = require("OIShared/Log")
local lines, realPrint = {}, print
print = function(s) lines[#lines + 1] = s end
for _ = 1, 250 do Log.info("note", { why = "same news" }) end
Log.info("note", { why = "other news" })
print = realPrint
-- 250 identical: first, the 100th and the 200th (with repeated=), plus the different one.
assert(#lines == 4, "expected 4 printed lines, got " .. #lines)
assert(lines[2]:find("repeated=100", 1, true) and lines[3]:find("repeated=200", 1, true), "repeat counts are said")
assert(lines[4]:find("other news", 1, true), "a different line is never hidden")

local Scheduler = require("OIShared/Scheduler")
local now = 0
local s = Scheduler.new(function() return now end, function() end)
s.enqueue("a", "alpha", function() now = now + 5; return true end)  -- over the 2 ms budget
s.enqueue("b", "beta", function() now = now + 1; return true end)   -- within it
s.step()
local slow = s.takeSlow()
assert(slow.alpha and slow.alpha.n == 1 and slow.alpha.maxMs == 5, "the slow job is reported with its worst time")
assert(slow.beta == nil, "a job within budget is not reported")
assert(next(s.takeSlow()) == nil, "reading it clears it")
print("oi log repeat and slow-job test: ok")
