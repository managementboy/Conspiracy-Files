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
