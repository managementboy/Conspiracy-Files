-- Thin engine-contact adapter for ConspiracyFiles/ObservedKeyLead. Reads a
-- key item's live keyId and the live keyId of each catalogued building the
-- current generated cases already enumerate, then hands plain data to the
-- pure domain module. Never scans the map: candidates come only from
-- `root.case.locations`, the same bounded T3 catalog rows Storage.scan and
-- LocalPersonIntegration already read (<=2 sites per case, <=8 cases -- see
-- SuccessiveCases.MAX_CASES). Observe only; never mutates the key, the
-- building, or vanilla loot.
--
-- ENGINE CALL RULE: Kahlua refuses a Java method invoked without a receiver
-- (obj.method() instead of obj:method()). Every engine call below goes
-- through `call`, which always applies the receiver explicitly, so the
-- distinction cannot be lost to a typo the offline Lua suite cannot catch.
local Lead = require("ConspiracyFiles/ObservedKeyLead")
local A = { MAX_SITES_PER_CASE = 2 }

local function call(o, m, ...)
    if not o or type(o[m]) ~= "function" then return nil, "missing native method: " .. tostring(m) end
    local ok, r = pcall(o[m], o, ...)
    if not ok then return nil, r end
    return r
end

local function keyIdValue(v) return type(v) == "number" and v == v and v % 1 == 0 and v >= 0 end

-- The observed key's own keyId, or nil if it is not a real, locking key
-- (missing getKeyId, or PZ's -1 "no key id" sentinel).
function A.observedKeyId(item)
    local id = call(item, "getKeyId")
    if not keyIdValue(id) then return nil end
    return id
end

-- One case's catalogued sites, each resolved to its live building keyId.
-- A site whose square is not currently loaded, or has no building, is
-- skipped rather than guessed -- it simply cannot become a candidate.
-- Bounded to root.case.locations, which Generator.build always sizes to 2.
local function sitesOf(root)
    local out = {}
    local locations = root and root.case and root.case.locations
    if type(locations) ~= "table" then return out end
    for i = 1, math.min(#locations, A.MAX_SITES_PER_CASE) do
        local site = locations[i]
        local bounds = site and site.bounds
        if site and type(site.id) == "string" and bounds then
            local square = call(getCell(), "getGridSquare", bounds.x1, bounds.y1, bounds.z)
            local building = square and call(square, "getBuilding")
            local def = building and call(building, "getDef")
            local keyId = def and call(def, "getKeyId")
            if keyIdValue(keyId) then out[#out + 1] = { id = site.id, keyId = keyId } end
        end
    end
    return out
end

-- Bounded candidate list across every active session's catalogued sites.
-- `sessions` is the small list `Cases.sessions` already returns (<=8, each
-- contributing <=2 sites), so this never grows past ObservedKeyLead's own
-- MAX_CANDIDATES cap; duplicate building ids are folded to their first sighting.
function A.candidates(sessions)
    local out, seen = {}, {}
    for _, api in ipairs(sessions or {}) do
        -- api.snapshot is our own plain-Lua closure (see Session.open), not a
        -- PZ engine object; it takes no receiver, unlike the square/building
        -- calls in sitesOf below.
        local root = type(api.snapshot) == "function" and api.snapshot()
        for _, candidate in ipairs(sitesOf(root)) do
            if not seen[candidate.id] and #out < Lead.MAX_CANDIDATES then
                seen[candidate.id] = true
                out[#out + 1] = candidate
            end
        end
    end
    return out
end

-- Resolve one observed key against the currently active sessions' catalogued
-- buildings. Returns the matched {id=buildingId, keyId=...} row, or nil plus
-- a reason ("not-a-locking-key", "no-match", "ambiguous", ...). Never asserts
-- identity or residence -- that restraint lives in the caller's fact/wording,
-- not here.
function A.resolve(item, sessions)
    local keyId = A.observedKeyId(item)
    if not keyId then return nil, "not-a-locking-key" end
    return Lead.match(keyId, A.candidates(sessions))
end

return A
