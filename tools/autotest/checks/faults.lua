-- Fault injection at adapter boundaries, for checks/faults.sh (catalogue
-- FC-01, gate E13). The planned DebugHarness.fault(point) was never built;
-- this does the same from outside: swap one function for one that throws,
-- let the game run, measure, put the original back.
CFFault = CFFault or {}
local F = CFFault
F.saved = F.saved or {}

-- point = "Module.fn" on a module table reachable by require or ConspiracyFiles.
local function target(point)
    local mod, fn = point:match("^([%w/]+)%.([%w_]+)$")
    local t = ConspiracyFiles[mod]
    if not t then
        local ok, m = pcall(require, "ConspiracyFiles/" .. mod)
        if ok and type(m) == "table" then t = m end
    end
    return t, fn
end

function F.inject(point)
    local t, fn = target(point)
    if not t or type(t[fn]) ~= "function" then return false, "no such function: " .. point end
    if not F.saved[point] then F.saved[point] = t[fn] end
    t[fn] = function() error("injected fault " .. point) end
    return true
end

function F.restore(point)
    local t, fn = target(point)
    if t and F.saved[point] then t[fn] = F.saved[point]; F.saved[point] = nil end
    return true
end

-- Is the saved case still valid? The same full validation the runtime uses.
function F.stateValid()
    local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
    local w = ModData.get("ConspiracyFiles.Generated.G2")
    local current, why = Cases.current(w)
    return current ~= nil, tostring(why or "valid")
end
