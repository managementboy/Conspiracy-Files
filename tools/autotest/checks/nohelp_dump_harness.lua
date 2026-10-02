-- Harness for nohelp_dump.sh check: captures dump lines and compares.
CFNHDump = CFNHDump or {}
local C = CFNHDump

-- Last dump line captured (written by StateDump.write)
C.lastDumpLine = nil

-- Intercept the log write to capture dump events
local CFLog = require("NHShared/Log")
local orig_write = CFLog.write
function CFLog.write(level, event, fields)
    if event == "dump" then
        -- Convert fields table to string: "pending=N placing=M ..."
        local parts = {}
        for k, v in pairs(fields) do
            table.insert(parts, k .. "=" .. tostring(v))
        end
        table.sort(parts)
        C.lastDumpLine = table.concat(parts, " ")
    end
    return orig_write(level, event, fields)
end

-- Return the last captured dump line
function C.lastDump()
    return C.lastDumpLine or ""
end

-- Forget the last dump (so a stale line from before a reload is never compared).
function C.reset() C.lastDumpLine = nil end

-- Pure: has the case been decided and clues assigned? A dump taken before this
-- (areasDecided absent or 0, nothing assigned) proves nothing, so the check
-- waits for it. Returns "true" or "false".
function C.ready(line)
    if not line or line == "" then return "false" end
    local decided = tonumber(line:match("areasDecided=(%d+)")) or 0
    if decided <= 0 then return "false" end
    local assigned = 0
    for _, k in ipairs({"pending","placing","placed","deferred","indexed","conflict","dropped","unknown"}) do
        assigned = assigned + (tonumber(line:match("%f[%w]"..k.."=(%d+)")) or 0)
    end
    return assigned > 0 and "true" or "false"
end

-- Pure comparison across save/reload. Returns "true" if the placement state is
-- consistent, "false" if not.
--
-- Must be identical: case totals (areas decided, clues per lean, short), every
-- status other than deferred/placed (pending, placing, indexed, conflict,
-- dropped, unknown, statusOther) and lost.
-- May change, one way only: deferred clues becoming placed. That is by design
-- ("decide early, create on arrival", NO_HELP_TASK3 plan): the arrival ring is
-- forgotten on reload, so a survivor standing in a waiting clue's ring
-- "arrives" again and the clue is created. So placed may rise by k only if
-- deferred falls by exactly k; placed never falls, deferred never rises, and
-- the total of all statuses never changes (a clue placed twice, or made from
-- nothing, would break that).
-- Step counts (carrier, tracking, relocation, filler, ...) are scheduler
-- counters since load, in memory only; they restart at reload, not compared.
function C.sameAcrossReload(lineA, lineB)
    if not lineA or not lineB or lineA == "" or lineB == "" then return "false" end

    local function extract(line)
        local counts = {}
        for pair in line:gmatch("%S+") do
            local k, v = pair:match("^([^=]+)=(.*)$")
            if k and v then counts[k] = tonumber(v) end
        end
        return counts
    end
    local A, B = extract(lineA), extract(lineB)
    local function n(t, k) return t[k] or 0 end

    local fixed = {
        "areasDecided", "cluesContainment", "cluesAgricultural", "short",
        "pending", "placing", "unknown", "conflict", "indexed", "dropped",
        "statusOther", "lost",
    }
    for _, k in ipairs(fixed) do
        if n(A, k) ~= n(B, k) then return "false" end
    end

    local moved = n(B, "placed") - n(A, "placed")
    if moved < 0 then return "false" end
    if n(A, "deferred") - n(B, "deferred") ~= moved then return "false" end
    return "true"
end

return C
