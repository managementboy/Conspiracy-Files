-- Snapshot of everything a save/reload must keep, for checks/reload.sh
-- (catalogue PS-07, PS-08, CG-02, AS-04). One line per value, compact, so a
-- before/after comparison is a plain string comparison.
CFReload = CFReload or {}
local S = CFReload
local V = require("ConspiracyFiles/Validator")
local R = ConspiracyFiles.GeneratedRuntime

-- The same roots SaveBudget measures, ASKED OF SAVEBUDGET rather than copied.
-- The copy said eleven where the module budgets fourteen: mapMedia,
-- placeVisits and casePeople were missing, so every save size printed by the
-- campaign gate was an undercount and its 500 kB assertion was made against
-- the wrong number. Map media is the root the withdrawn save-size claim turned
-- on, which is what makes the omission worth this comment.
local Budget = require("ConspiracyFiles/SaveBudget")
local TAGS = {}
for _, tag in pairs(assert(Budget.tags, "SaveBudget must publish its roots")) do
    TAGS[#TAGS + 1] = tag
end
table.sort(TAGS)
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

-- The case-people root is one fixed-field record per case (CasePerson.FIELDS,
-- MAX_RECORDS): a re-bind after a load rewrites her position and fills in
-- outfit/female, so its BYTES move within that bound while nothing leaks.
-- The property a reload must keep there is the record count.
function S.casePeople()
    local P = ConspiracyFiles.CasePerson
    local store = P and P.store and P.store()
    if not store then return 0, "no store" end
    local n, keys = 0, {}
    for k in pairs(store.records or {}) do n = n + 1; keys[#keys + 1] = k end
    table.sort(keys)
    return n, table.concat(keys, " ")
end

-- The record's order: noted evidence ids and titles in discovery order.
function S.record()
    local out = {}
    for i, row in ipairs(R.known()) do out[#out + 1] = i .. "=" .. tostring(row.id):gsub("^generated:", "") .. ":" .. tostring(row.title) end
    return #out, table.concat(out, " | ")
end

-- The case as placed: which document, where, in what state.
function S.placement()
    local out = {}
    for _, d in ipairs(CFLoop.docs()) do
        -- A waiting clue has no square (P4-R133): its site and status are what
        -- a reload must keep. Concatenating its nil x took the whole snapshot
        -- down and left the budget line empty (20260924T222804).
        local where = d.waiting and ("waiting:" .. tostring(d.place)) or (tostring(d.x) .. "," .. tostring(d.y) .. "," .. tostring(d.z))
        out[#out + 1] = d.id:gsub("^generated:", "") .. "@" .. where .. ":" .. tostring(d.status)
    end
    return #out, table.concat(out, " ")
end

function S.schedule()
    local s = R.automaticStatus()
    return s.count, tostring(s.lastCreatedHours), s.scheduled
end
