-- Pure domain logic for one question: does an observed vanilla key's keyId
-- identify exactly one catalogued building? See docs/design/CORPSE_KEYS_AND_IDS.md
-- for the motivating observation. A key found on a body is a LEAD only -- it
-- never establishes that the body was any particular person, lived at the
-- matched building, or owned anything there. This module never asserts any
-- of that; callers must not either.
--
-- Zero PZ dependencies. Engine contact (reading a live keyId, resolving a
-- building) belongs in ConspiracyFiles/ObservedKeyAdapter, a thin client
-- adapter that calls into this module with plain data only.
local V = require("ConspiracyFiles/Validator")
local M = { MAX_CANDIDATES = 64, MAX = 64 }

local FACT_FIELDS = { id = true, sourceToken = true, keyId = true, buildingId = true }

local function plain(t) return type(t) == "table" and not getmetatable(t) end
local function finite(v) return type(v) == "number" and v == v and v ~= math.huge and v ~= -math.huge end
-- PZ's own keyId convention: a non-negative integer identifies a real lock;
-- -1 (or any negative) means "no key id" and must never be treated as a match.
local function keyIdValue(v) return finite(v) and v % 1 == 0 and v >= 0 end
local function text(v, n) return type(v) == "string" and #v > 0 and #v <= (n or 160) and v:find("%S") and not v:find("[%c]") end

local function copyFact(f)
    local o = {}
    for k in pairs(FACT_FIELDS) do o[k] = f[k] end
    return o
end

local function validFact(f)
    if not plain(f) then return false end
    for k in pairs(f) do if not FACT_FIELDS[k] then return false end end
    return text(f.id, 200) and text(f.sourceToken, 160) and keyIdValue(f.keyId) and text(f.buildingId, 160)
end

-- Bounded lookup only: `candidates` is a plain array (<= MAX_CANDIDATES) of
-- {id=string, keyId=integer} rows describing catalogued buildings the caller
-- already enumerated (the T3 catalog, never an unbounded map scan). Exactly
-- one candidate sharing the observed keyId is a match; zero is "no-match";
-- two or more sharing that keyId is "ambiguous" and refuses rather than
-- guessing which building the key opens.
function M.match(keyId, candidates)
    if not keyIdValue(keyId) then return nil, "invalid key id" end
    if type(candidates) ~= "table" or getmetatable(candidates) then return nil, "invalid candidates" end
    local n = 0
    for i in pairs(candidates) do
        n = n + 1
        if type(i) ~= "number" or i < 1 or i ~= math.floor(i) then return nil, "invalid candidate index" end
    end
    if n > M.MAX_CANDIDATES then return nil, "too many candidates" end
    for i = 1, n do if candidates[i] == nil then return nil, "invalid candidate index" end end
    local seen, matched, count = {}, nil, 0
    for i = 1, n do
        local c = candidates[i]
        if not plain(c) or not text(c.id, 160) or not keyIdValue(c.keyId) then return nil, "invalid candidate" end
        if seen[c.id] then return nil, "duplicate candidate building" end
        seen[c.id] = true
        if c.keyId == keyId then
            count = count + 1
            matched = c
        end
    end
    if count == 0 then return nil, "no-match" end
    if count > 1 then return nil, "ambiguous" end
    return { id = matched.id, keyId = matched.keyId }, "matched"
end

function M.empty() return { schema = 1, leads = {} } end

function M.validate(root)
    if not plain(root) or root.schema ~= 1 or not plain(root.leads) then return false, "invalid observed-key lead root" end
    for k in pairs(root) do if k ~= "schema" and k ~= "leads" then return false, "unknown lead root field" end end
    local n = 0
    for k, f in pairs(root.leads) do
        n = n + 1
        if n > M.MAX then return false, "lead capacity exceeded" end
        if type(k) ~= "string" or not validFact(f) or f.id ~= k then return false, "invalid lead fact" end
    end
    local seenPair = {}
    for _, f in pairs(root.leads) do
        local pair = f.sourceToken .. "\0" .. f.buildingId
        if seenPair[pair] then return false, "duplicate source/building lead" end
        seenPair[pair] = true
    end
    return V.validateStructure(root)
end

-- Append one observed-key lead. An already-recorded id is a no-op unless the
-- new fact contradicts it, which is refused rather than silently rewritten.
function M.observe(root, fact)
    local ok, why = M.validate(root)
    if not ok then return nil, false, why end
    if not validFact(fact) then return nil, false, "invalid observed-key lead" end
    local staged = M.empty()
    for id, f in pairs(root.leads) do staged.leads[id] = copyFact(f) end
    local existing = staged.leads[fact.id]
    if existing then
        for k in pairs(FACT_FIELDS) do
            if existing[k] ~= fact[k] then return nil, false, "contradictory observed-key lead" end
        end
        return staged, false
    end
    local n = 0
    for _ in pairs(staged.leads) do n = n + 1 end
    if n >= M.MAX then return staged, false, "lead capacity exceeded" end
    staged.leads[fact.id] = copyFact(fact)
    ok, why = M.validate(staged)
    if not ok then return nil, false, why end
    return staged, true
end

-- Cautious, player-facing rows. Wording mirrors KeyJournal.rows and
-- IdentityObservations.rows: a lead, never proof of residence or ownership.
function M.rows(root)
    if not M.validate(root) then return {} end
    local ids = {}
    for id in pairs(root.leads) do ids[#ids + 1] = id end
    table.sort(ids)
    local rows = {}
    for _, id in ipairs(ids) do
        local f = root.leads[id]
        rows[#rows + 1] = {
            id = "observedKeyLead:" .. f.id,
            ordinal = #rows + 1,
            title = "A key found with a body matches a building",
            summary = "Interpretation - observed key",
            detailText = "A key I found among a body's belongings matches the building at " .. f.buildingId ..
                ". This suggests a possible connection between that body and the building; " ..
                "it does not establish who the body was, that they lived there, or that they owned it.",
        }
    end
    return rows
end

return M
