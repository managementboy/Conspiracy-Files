-- Per-frame cost of the mod's handlers, for checks/perf.sh (catalogue PF-02,
-- PF-03, gate E12). Kahlua has only a millisecond clock, so each call is timed
-- to the millisecond and the numbers are aggregated over thousands of calls:
-- the average is statistically sound, and any call of 2 ms or more is caught.
CFPerf = CFPerf or {}
local P = CFPerf
P.stats = P.stats or {}
P.saved = P.saved or {}

local function target(point)
    local mod, fn = point:match("^([%w/]+)%.([%w_]+)$")
    local t = ConspiracyFiles[mod]
    if not t then
        local ok, m = pcall(require, "ConspiracyFiles/" .. mod)
        if ok and type(m) == "table" then t = m end
    end
    return t, fn
end

function P.wrap(point)
    local t, fn = target(point)
    if not t or type(t[fn]) ~= "function" then return false, "no such function: " .. point end
    if P.saved[point] then return true end
    local original = t[fn]
    P.saved[point] = original
    local s = { calls = 0, total = 0, max = 0, over2 = 0 }
    P.stats[point] = s
    t[fn] = function(...)
        local t0 = getTimestampMs()
        local a, b, c, d = original(...)
        local dt = getTimestampMs() - t0
        s.calls = s.calls + 1; s.total = s.total + dt
        if dt > s.max then s.max = dt end
        if dt >= 2 then s.over2 = s.over2 + 1 end
        return a, b, c, d
    end
    return true
end

function P.unwrapAll()
    for point, original in pairs(P.saved) do
        local t, fn = target(point)
        if t then t[fn] = original end
        P.saved[point] = nil
    end
    return true
end

-- One line per point: calls, average ms, worst ms, calls at 2 ms or more.
function P.report()
    local out = {}
    for point, s in pairs(P.stats) do
        local avg = s.calls > 0 and s.total / s.calls or 0
        out[#out + 1] = string.format("%s calls=%d avg=%.3fms max=%dms over2ms=%d", point, s.calls, avg, s.max, s.over2)
    end
    table.sort(out)
    return table.concat(out, " | ")
end
