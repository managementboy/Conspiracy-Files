-- Catalogue of the dependency's notes: id + place code + (our own) story/theme codes. PURE: build()
-- takes the dependency's tables as arguments and touches no global, so offline tests pass fakes.
-- It reads ids (the keys of the dependency's EN id->text maps), the place tag of pool entries and
-- nothing else: the text values are never read, copied or logged (the owner plays blind).
-- Codes are numbers: story 1..23, order 1.., place 1..13 (index in the dependency's
-- KNOWN_CATEGORIES), theme 1..30, confidence 1 low / 2 medium / 3 high. 0 in the shipped table = none.
OIShared = OIShared or {}
local C = {}
OIShared.NoteCatalogue = C

local function hex(n)
    local d, out = "0123456789abcdef", ""
    for _ = 1, 8 do local r = n % 16; out = d:sub(r + 1, r + 1) .. out; n = (n - r) / 16 end
    return out
end
-- Order-insensitive callers sort first. Two small polynomial hashes (doubles stay exact below 2^53).
local function hashLines(lines)
    local h1, h2 = 7, 11
    for _, s in ipairs(lines) do
        for i = 1, #s do
            local b = s:byte(i)
            h1 = (h1 * 131 + b) % 2147483629
            h2 = (h2 * 257 + b) % 2147483587
        end
        h1 = (h1 * 131 + 10) % 2147483629
        h2 = (h2 * 257 + 10) % 2147483587
    end
    return hex(h1) .. hex(h2)
end
C.hashLines = hashLines

local function sortedKeys(t)
    local out = {}
    for k in pairs(t) do out[#out + 1] = k end
    table.sort(out)
    return out
end

function C.staticFingerprint(tables)
    local lines = {}
    for _, id in ipairs(sortedKeys(tables)) do
        local r = tables[id]
        lines[#lines + 1] = id .. ":" .. table.concat({ r[1], r[2], r[3], table.concat(r[4], "."), r[5] }, ",")
    end
    return hashLines(lines)
end

local function empty(reason, tables)
    return { active = false, reason = reason, entries = {}, ids = {}, counts = { pools = 0, entries = 0, stories = 0, places = 0,
        themes = 0, dropped = 0, unknown = 0, duplicates = 0, badids = 0, badplace = 0, placemismatch = 0 },
        staticFp = tables and C.staticFingerprint(tables) or "-", dynamicFp = "-", lang = "EN", nonEN = false,
        droppedIds = {}, byStoryIdx = {}, byPlaceIdx = {}, byThemeIdx = {}, standaloneIdx = {} }
end

local function idNumber(key)
    if type(key) ~= "string" then return nil end
    return key:match("^(%d+)%.txt$")
end

-- deps = {NoteContentPool, NoteContentPoolEN, LetterContentPools, LetterContentPoolsEN,
--         KNOWN_CATEGORIES, language}.  tables = the shipped NoteTables.  Returns a catalogue instance.
function C.build(deps, tables)
    if type(tables) ~= "table" then return empty("no shipped table", nil) end
    if type(deps) ~= "table" then return empty("no dependency", tables) end
    local need = { "NoteContentPool", "NoteContentPoolEN", "LetterContentPools", "LetterContentPoolsEN", "KNOWN_CATEGORIES" }
    for _, k in ipairs(need) do
        if type(deps[k]) ~= "table" then return empty("missing " .. k, tables) end
    end
    local cats = {}
    for i, name in ipairs(deps.KNOWN_CATEGORIES) do cats[name] = i end

    -- pools: {label (for the id), poolKey, pool array, EN map}
    local pools = { { "Note", "Note", deps.NoteContentPool, deps.NoteContentPoolEN } }
    for _, cat in ipairs(sortedKeys(deps.LetterContentPoolsEN)) do
        pools[#pools + 1] = { "Letter/" .. cat, cat, deps.LetterContentPools[cat], deps.LetterContentPoolsEN[cat] }
    end
    local c = empty(nil, tables)
    c.reason = nil
    c.lang = type(deps.language) == "string" and deps.language or "EN"
    c.nonEN = c.lang ~= "EN"
    local counts, entries, found, poolCount = c.counts, c.entries, {}, {}
    for _, p in ipairs(pools) do
        local label, key, arr, en = p[1], p[2], p[3], p[4]
        if type(en) ~= "table" then return empty("bad pool " .. key, tables) end
        counts.pools = counts.pools + 1
        local loc, seen = {}, {}
        if type(arr) == "table" then
            for _, e in ipairs(arr) do
                if type(e) == "table" and type(e.id) == "string" then
                    if seen[e.id] then counts.duplicates = counts.duplicates + 1 end
                    seen[e.id] = true
                    if type(e.location) == "string" then loc[e.id] = e.location end
                end
            end
        end
        local n = 0
        for k in pairs(en) do -- keys only: the values are text and are never touched
            local num = idNumber(k)
            if not num then counts.badids = counts.badids + 1
            else
                local id = label .. "/" .. num
                local t = tables[id]
                local rec = { id = id, pool = key, story = nil, order = nil, place = nil, themes = {}, conf = nil, known = t ~= nil }
                local depPlace
                if loc[k] then
                    depPlace = cats[loc[k] ]
                    if not depPlace then counts.badplace = counts.badplace + 1 end
                end
                if t then
                    if t[1] > 0 then rec.story = t[1] end
                    if t[2] > 0 then rec.order = t[2] end
                    if t[5] > 0 then rec.conf = t[5] end
                    for i, th in ipairs(t[4]) do rec.themes[i] = th end
                    if depPlace and t[3] > 0 and depPlace ~= t[3] then counts.placemismatch = counts.placemismatch + 1 end
                    rec.place = depPlace or (t[3] > 0 and t[3] or nil)
                else
                    counts.unknown = counts.unknown + 1
                    rec.place = depPlace
                end
                entries[id] = rec
                found[#found + 1] = id
                n = n + 1
            end
        end
        poolCount[#poolCount + 1] = key .. "=" .. n
    end
    table.sort(found); table.sort(poolCount)
    c.ids = found
    counts.entries = #found
    if counts.entries == 0 then return empty("no entries", tables) end
    for id in pairs(tables) do
        if not entries[id] then counts.dropped = counts.dropped + 1; c.droppedIds[#c.droppedIds + 1] = id end
    end
    table.sort(c.droppedIds)
    local stories, places, themes = {}, {}, {}
    for _, id in ipairs(found) do
        local r = entries[id]
        if r.story then
            stories[r.story] = true
            local l = c.byStoryIdx[r.story]; if not l then l = {}; c.byStoryIdx[r.story] = l end
            l[#l + 1] = id
        else c.standaloneIdx[#c.standaloneIdx + 1] = id end
        if r.place then
            places[r.place] = true
            local l = c.byPlaceIdx[r.place]; if not l then l = {}; c.byPlaceIdx[r.place] = l end
            l[#l + 1] = id
        end
        for _, th in ipairs(r.themes) do
            themes[th] = true
            local l = c.byThemeIdx[th]; if not l then l = {}; c.byThemeIdx[th] = l end
            l[#l + 1] = id
        end
    end
    for _, l in pairs(c.byStoryIdx) do
        table.sort(l, function(a, b)
            local oa, ob = entries[a].order or 1e9, entries[b].order or 1e9
            if oa ~= ob then return oa < ob end
            return a < b
        end)
    end
    local function count(t) local n = 0; for _ in pairs(t) do n = n + 1 end; return n end
    counts.stories, counts.places, counts.themes = count(stories), count(places), count(themes)
    local lines = {}
    for _, id in ipairs(found) do lines[#lines + 1] = id end
    for _, s in ipairs(poolCount) do lines[#lines + 1] = "#" .. s end
    c.dynamicFp = hashLines(lines)
    c.active = true
    return c
end

-- Module-level current catalogue (installed by the adapter) and the API for later phases.
local current = empty("not built", nil)
function C.install(inst) current = inst or empty("not built", nil); return current end
function C.current() return current end
function C.reset() current = empty("not built", nil) end
function C.isActive() return current.active == true end
function C.get(noteId) return current.entries[noteId] end
function C.byStory(story) return current.byStoryIdx[story] or {} end
function C.byPlace(code) return current.byPlaceIdx[code] or {} end
function C.byTheme(code) return current.byThemeIdx[code] or {} end
function C.standalone() return current.standaloneIdx end
function C.fingerprint() return current.staticFp, current.dynamicFp end
function C.counts() return current.counts end

return C
