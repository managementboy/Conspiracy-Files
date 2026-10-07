-- VERSION-DRIFT GATE for the dependency ("It is of interest to me!"). PURE: the dependency's shape comes in
-- as plain data (snapshot()), the shipped expectations as Generated/Contract + Generated/Baseline; nothing
-- here touches a global but the module's own current result. Ids, names and counts only (the owner plays
-- blind: no note text is ever read or logged).
--
--  level 0  identical      static + dynamic fingerprint equal to the shipped baseline, structure as contracted
--  level 1  additive       new ids / extra pools / place list appended / re-appearing held ids: proceed; new
--                          notes are never placed (the catalogue is cut back to the ids we know)
--  level 2  ids missing    some of OUR ids are gone from the live pools: those scenes degrade to objects-only
--                          (the stand-in object), the world record stays untouched, nothing is repaired toward
--                          a missing id; an existing save decides nothing new
--  level 3  contract breach a required function / key / tracker shape / place name / pool structure is gone or
--                          changed, or the dependency is absent: forcing OFF for the session, every scene
--                          objects-only, nothing new decided, record untouched
-- Place codes are verified BY NAME (code -> category name). Renamed ids are NOT matched: a rename is "missing"
-- plus "added". Never throws.
OIShared = OIShared or {}
local G = {}
OIShared.DriftGate = G

local function set(list) local s = {}; for _, v in ipairs(list or {}) do s[v] = true end; return s end
local function sortedCopy(t) local o = {}; for _, v in ipairs(t) do o[#o + 1] = v end; table.sort(o); return o end

-- The dependency's shape as data. g = {registry, the note pool and its EN map, the letter pools and their EN maps,
-- the place-category list, language}; probe = result of G.probe (or nil).
function G.snapshot(g, probe, contract)
    local s = { present = false, fn = {}, poolNames = {}, poolsOk = true, categories = {}, probe = probe }
    if type(g) ~= "table" then return s end
    local reg = g.registry
    s.present = type(reg) == "table"
    for _, name in ipairs((contract or {}).functions or {}) do
        s.fn[name] = s.present and type(reg[name]) == "function"
    end
    if type(g.NoteContentPoolEN) == "table" then s.poolNames[#s.poolNames + 1] = "Note" else s.poolsOk = false end
    if type(g.NoteContentPool) ~= "table" then s.poolsOk = false end
    if type(g.LetterContentPoolsEN) == "table" and type(g.LetterContentPools) == "table" then
        for k, v in pairs(g.LetterContentPoolsEN) do
            if type(k) == "string" then
                s.poolNames[#s.poolNames + 1] = k
                if type(v) ~= "table" or type(g.LetterContentPools[k]) ~= "table" then s.poolsOk = false end
            end
        end
    else s.poolsOk = false end
    table.sort(s.poolNames)
    if type(g.KNOWN_CATEGORIES) == "table" then
        for i, name in ipairs(g.KNOWN_CATEGORIES) do s.categories[i] = name end
    else s.noCategories = true end
    return s
end

-- A scratch run of the dependency's own pick on a throw-away item and a one-entry pool named "OIProbe":
-- shows which modData key the pick writes and the shape of the world tracker; then removes its trace.
-- store(name) -> the world ModData table (or nil). Returns {ran, keys (sorted names), tracker ("ok"|"bad"|"none"), resolve}.
function G.probe(registry, store, trackerName)
    local r = { ran = false, keys = {}, tracker = "none", resolve = false }
    if type(registry) ~= "table" or type(registry.getOrAssignText) ~= "function" or type(store) ~= "function" then return r end
    local md = {}
    local item = { getModData = function() return md end }
    local pool = { { id = "0.txt", text = "p" } }
    local okT, before = pcall(store, trackerName)
    local had = okT and type(before) == "table" and before.OIProbe ~= nil
    local ok = pcall(registry.getOrAssignText, item, pool, "OIProbe", nil, nil)
    r.ran = ok
    for k in pairs(md) do r.keys[#r.keys + 1] = tostring(k) end
    table.sort(r.keys)
    local okS, t = pcall(store, trackerName)
    if okS and type(t) == "table" then
        local u = t.OIProbe
        r.tracker = (type(u) == "table" and u["0.txt"] == true) and "ok" or "bad"
        if not had then t.OIProbe = nil end
    end
    if type(registry.resolveTextById) == "function" then
        local okR, v = pcall(registry.resolveTextById, pool, "0.txt")
        r.resolve = okR and v == "p"
    end
    return r
end

local function sameList(a, b)
    if #a ~= #b then return false end
    for i = 1, #a do if a[i] ~= b[i] then return false end end
    return true
end

-- classify(contract, live, catalogue, tables, baseline [, forced]) -> {level, counts, why, off}
--   catalogue: a built catalogue instance (NoteCatalogue.build), tables: shipped NoteTables,
--   forced: optional list of note ids already forced in this world (counted when their id is gone).
function G.classify(contract, live, cat, tables, baseline, forced)
    local why, counts = {}, { missing = 0, added = 0, restored = 0, poolsMissing = 0, poolsExtra = 0, placesExtra = 0,
        badids = 0, forcedGone = 0, entries = 0, nonEN = 0 }
    local function flag(code) why[#why + 1] = code end
    local breach = false
    if type(contract) ~= "table" or type(live) ~= "table" or type(tables) ~= "table" or type(baseline) ~= "table" then
        return { level = 3, counts = counts, why = { "no-contract" }, off = true }
    end
    if not live.present then
        flag("absent"); breach = true
    else
        for _, name in ipairs(contract.functions or {}) do
            if not live.fn[name] then flag("fn:" .. name); breach = true end
        end
        local p = live.probe
        if type(p) ~= "table" or not p.ran then flag("probe"); breach = true
        else
            if not sameList(p.keys or {}, contract.probedKeys or {}) then flag("key"); breach = true end
            if p.tracker ~= "ok" then flag("tracker"); breach = true end
            if not p.resolve then flag("resolve"); breach = true end
        end
        if live.noCategories then flag("categories"); breach = true
        else
            for code, name in ipairs(contract.places or {}) do
                if live.categories[code] ~= name then flag("place:" .. code); breach = true end
            end
            if #live.categories > #contract.categories then counts.placesExtra = #live.categories - #contract.categories end
        end
        if not live.poolsOk then flag("pools"); breach = true end
        local liveSet, wantSet = set(live.poolNames), set(contract.pools)
        for _, n in ipairs(contract.pools or {}) do
            if not liveSet[n] then counts.poolsMissing = counts.poolsMissing + 1 end
        end
        for _, n in ipairs(live.poolNames) do if not wantSet[n] then counts.poolsExtra = counts.poolsExtra + 1 end end
        if counts.poolsMissing > 0 then flag("pool-gone"); breach = true end
    end
    local c = cat or {}
    local cc = c.counts or {}
    counts.entries = cc.entries or 0
    counts.badids = cc.badids or 0
    counts.nonEN = c.nonEN and 1 or 0
    if live.present and counts.entries == 0 then flag("empty"); breach = true end
    -- ids: ours that are gone (beyond what the dependency itself already held back at the baseline), new ones
    local held = set(baseline.held)
    for _, id in ipairs(c.droppedIds or {}) do
        if held[id] then -- still held back, as at the baseline
        else counts.missing = counts.missing + 1 end
    end
    for id in pairs(held) do if c.entries and c.entries[id] then counts.restored = counts.restored + 1 end end
    counts.added = cc.unknown or 0
    if counts.badids > 0 and counts.missing > 0 and counts.added == 0 then flag("idpattern"); breach = true end
    for _, id in ipairs(forced or {}) do
        if not (c.entries and c.entries[id]) then counts.forcedGone = counts.forcedGone + 1 end
    end
    local level
    if breach then level = 3
    elseif counts.missing > 0 then level = 2; flag("missing")
    else
        local same = c.active and c.dynamicFp == baseline.dynamic and c.staticFp == baseline.static
            and counts.poolsExtra == 0 and counts.placesExtra == 0 and counts.added == 0 and counts.restored == 0
        if same then level = 0 else level = 1; flag("additive") end
    end
    return { level = level, counts = counts, why = why, off = level >= 3 }
end

-- The installed result: forcing is ON until a level-3 verdict is installed.
local current
function G.install(result) current = result; return result end
function G.current() return current end
function G.level() return current and current.level or nil end
function G.forcingOn() return not (current and current.off) end
function G.reset() current = nil end

return G
