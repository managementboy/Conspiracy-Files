-- Snapshot of everything a save/reload must keep, for checks/reload.sh
-- (catalogue PS-07, PS-08, CG-02, AS-04). One line per value, compact, so a
-- before/after comparison is a plain string comparison.
CFReload = CFReload or {}
local S = CFReload
local V = require("ConspiracyFiles/Validator")
local R = ConspiracyFiles.GeneratedRuntime

-- The same roots SaveBudget.check measures, summed.
local TAGS = { "ConspiracyFiles.Generated.G2", "ConspiracyFiles.AddressBook.Muldraugh", "ConspiracyFiles.DeadAir",
    "ConspiracyFiles.IdentityObservations", "ConspiracyFiles.KeyConnections", "ConspiracyFiles.LocalPeople",
    "ConspiracyFiles.DiscoveryLedger", "ConspiracyFiles.VisitedBuildings", "ConspiracyFiles.ObservedKeyLeads",
    "ConspiracyFiles.PersonNameObservations", "ConspiracyFiles.BodyOutfitObservations" }
function S.bytes()
    local total, parts = 0, {}
    for _, tag in ipairs(TAGS) do
        local w = ModData.get(tag)
        if w then
            local n = V.estimateEncodedBytes(w)
            total = total + n
            parts[#parts + 1] = tag:gsub("^ConspiracyFiles%.", "") .. "=" .. n
        end
    end
    local markers = getPlayer():getModData()["ConspiracyFiles.ClueMarkers"]
    if markers then total = total + V.estimateEncodedBytes(markers) end
    return total, table.concat(parts, " ")
end

-- Notebook order: ids and titles in discovery order.
function S.notebook()
    local out = {}
    for i, row in ipairs(R.known()) do out[#out + 1] = i .. "=" .. tostring(row.id):gsub("^generated:", "") .. ":" .. tostring(row.title) end
    return #out, table.concat(out, " | ")
end

-- The case as placed: which document, where, in what state.
function S.placement()
    local out = {}
    for _, d in ipairs(CFLoop.docs()) do
        out[#out + 1] = d.id:gsub("^generated:", "") .. "@" .. d.x .. "," .. d.y .. "," .. d.z .. ":" .. d.status
    end
    return #out, table.concat(out, " ")
end

function S.schedule()
    local s = R.automaticStatus()
    return s.count, tostring(s.lastCreatedHours), s.scheduled
end
