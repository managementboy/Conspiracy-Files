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

-- Pure comparison: extract and compare placement-related counts.
-- Returns "true" if identical, "false" if different.
function C.sameAcrossReload(lineA, lineB)
    if not lineA or not lineB then return "false" end

    -- Fields from StateDump.FIELDS that must be identical across reload:
    -- All status counts + case totals; exclude peakMs, bytes, step/queued counts, foundBy*, wait_* counts
    local placementFields = {
        -- Status counts
        pending=true, placing=true, placed=true, unknown=true,
        conflict=true, deferred=true, indexed=true, dropped=true, statusOther=true, lost=true,
        -- Case totals
        areasDecided=true, cluesContainment=true, cluesAgricultural=true, short=true,
    }

    local function extract(line)
        local counts = {}
        for pair in line:gmatch("%S+") do
            local k, v = pair:match("^([^=]+)=(.*)$")
            if k and v and placementFields[k] then
                counts[k] = v
            end
        end
        return counts
    end

    local countsA = extract(lineA)
    local countsB = extract(lineB)

    -- Compare: same keys, same values
    for k, v in pairs(countsA) do
        if countsB[k] ~= v then return "false" end
    end
    for k, v in pairs(countsB) do
        if countsA[k] ~= v then return "false" end
    end

    return "true"
end

return C
