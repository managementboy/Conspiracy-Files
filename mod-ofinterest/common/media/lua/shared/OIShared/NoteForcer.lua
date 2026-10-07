-- Forces ONE specific note of the dependency ("It is of interest to me!") onto an item we place.
-- PURE: every engine/dependency object comes in through `deps`, so the offline test passes fakes.
-- The owner plays blind: this file never reads, copies or logs note text. Ids and codes only.
--
-- What the dependency does (read from its code, not its notes): the first Read picks a random pool
-- entry (its registry's getOrAssignText), bakes item modData iioitmTextId = "<n>.txt", marks it in
-- the world tracker ModData "ItIsOfInterestToMe_UsedText"[poolKey][id] = true, and re-resolves the TEXT by
-- that id on every open (so a language switch does not re-pick). Location (iioitmLocation) is baked
-- once from the room name on first right-click/transfer unless iioitmLocationBaked is already true;
-- it only steers which entry a FRESH pick may take. poolKey is "Note" or "Letter_<Category>".
-- So forcing = write exactly what its own DebugSpawner writes (iioitmTextId, iioitmLocationBaked,
-- iioitmLocation, iioitmLetterCategory + display name) AND mark the tracker in the same call.
-- No place given: LocationBaked is still set (room lookup can then never write a different category)
-- and iioitmLocation stays nil, exactly like DebugSpawner with no location.
--
-- Keys we add to the ITEM's modData: oiToken, oiSeal. We add to THEIR tables nothing but
-- tracker[poolKey][id] = true. Our authority is the world record ModData "OIShared.ForcedNotes":
-- token -> {note, place, fp, ver, st, fix}. verify() re-asserts the item (and the tracker) from it.
--
-- deps = {registry, poolFor(poolKey)->array, categories (their KNOWN_CATEGORIES), store(name)->table,
--         version, fingerprint, catalogue (optional, with isActive/get), getText (optional), log(level, fields)}
OIShared = OIShared or {}
local Catalogue = require("OIShared/NoteCatalogue")
local F = {}
OIShared.NoteForcer = F

F.VERSION = "1"
F.RECORD = "OIShared.ForcedNotes"
F.TRACKER = "ItIsOfInterestToMe_UsedText"

-- "Note/0042" or "Letter/<Category>/0012" -> pool, tracker key, file id, kind. nil when malformed.
function F.parse(noteId)
    if type(noteId) ~= "string" then return nil end
    local n = noteId:match("^Note/(%d+)$")
    if n then return { pool = "Note", tracker = "Note", file = n .. ".txt", kind = "note" } end
    local cat, m = noteId:match("^Letter/(%w+)/(%d+)$")
    if cat then return { pool = cat, tracker = "Letter_" .. cat, file = m .. ".txt", kind = "letter", category = cat } end
    return nil
end

local function say(deps, level, fields)
    if deps and deps.log then pcall(deps.log, level, fields) end
end

local function seal(token, noteId, version)
    return Catalogue.hashLines({ tostring(token), tostring(noteId), tostring(version) })
end
F.seal = seal

local function poolHas(deps, p)
    local ok, pool = pcall(deps.poolFor, p.pool)
    if not ok or type(pool) ~= "table" then return false end
    for _, e in ipairs(pool) do
        if type(e) == "table" and e.id == p.file then return true end
    end
    return false
end

local function tracker(deps)
    local ok, t = pcall(deps.store, F.TRACKER)
    if ok and type(t) == "table" then return t end
    return nil
end

-- The contract check. Returns true, parsed  or  false, reason-code. Touches nothing.
function F.handshake(spec, deps)
    if type(deps) ~= "table" or type(spec) ~= "table" then return false, "args" end
    local p = F.parse(spec.noteId)
    if not p then return false, "bad-id" end
    local r = deps.registry
    if type(r) ~= "table" or type(r.getOrAssignText) ~= "function" or type(r.resolveTextById) ~= "function"
        or type(r.isRegistered) ~= "function" then return false, "no-registry" end
    if type(deps.store) ~= "function" or type(deps.poolFor) ~= "function" then return false, "no-store" end
    if not tracker(deps) then return false, "no-tracker" end
    if spec.pool ~= nil and spec.pool ~= p.pool then return false, "pool-mismatch" end
    if spec.place ~= nil then
        if type(spec.place) ~= "number" or type(deps.categories) ~= "table" or not deps.categories[spec.place] then
            return false, "bad-place"
        end
    end
    if not poolHas(deps, p) then return false, "not-in-pool" end -- also covers ids the dependency holds back
    if deps.catalogue and not (deps.catalogue.isActive() and deps.catalogue.get(spec.noteId)) then
        return false, "not-in-catalogue"
    end
    if type(spec.token) ~= "string" or spec.token == "" then return false, "no-token" end
    return true, p
end

local function writeItem(item, p, rec, deps)
    local md = item:getModData()
    md.iioitmTextId = p.file
    md.iioitmLocationBaked = true
    local name = rec.place and rec.place > 0 and deps.categories[rec.place] or nil
    if name or md.iioitmLocation ~= nil then md.iioitmLocation = name end
    if p.kind == "letter" then
        md.iioitmLetterCategory = p.category
    end
    md.oiToken = rec.token
    md.oiSeal = seal(rec.token, rec.note, rec.ver)
end

local function markTracker(deps, p)
    local t = tracker(deps)
    if not t then return false end
    if type(t[p.tracker]) ~= "table" then t[p.tracker] = {} end
    t[p.tracker][p.file] = true
    return true
end

-- Item kind must match the id (a Note id only on Base.Note; letters on a letter/mail type).
local function itemFits(item, p, deps)
    local okT, ft = pcall(function() return item:getFullType() end)
    if not okT or type(ft) ~= "string" then return false end
    if p.kind == "note" then return ft == "Base.Note" end
    return ft ~= "Base.Note" and deps.registry.isRegistered(ft) == true
end

-- force(item, spec, deps): spec = {noteId, token, place (optional code), pool (optional)}.
-- Everything is validated BEFORE the first write; on any failure the item and the world are untouched
-- and exactly one log line says why. Returns true | false, reason.
function F.force(item, spec, deps)
    local ok, p = F.handshake(spec, deps)
    if not ok then say(deps, "w", { op = "force", ok = 0, why = p, note = type(spec) == "table" and spec.noteId or "-" }); return false, p end
    if not item or not itemFits(item, p, deps) then
        say(deps, "w", { op = "force", ok = 0, why = "item-kind", note = spec.noteId }); return false, "item-kind"
    end
    local md = item:getModData()
    local recs = deps.store(F.RECORD)
    local mine = recs[spec.token]
    local function refuse(why) say(deps, "w", { op = "force", ok = 0, why = why, note = spec.noteId }); return false, why end
    if mine and mine.note ~= spec.noteId then return refuse("token-reused") end
    for tok, r in pairs(recs) do
        if r.note == spec.noteId and tok ~= spec.token then return refuse("id-taken") end
    end
    if md.oiToken and md.oiToken ~= spec.token then return refuse("item-forced") end
    if md.iioitmTextId and not mine then return refuse("item-baked") end
    if md.iioitmText then return refuse("item-baked") end
    local used = tracker(deps)[p.tracker]
    if not mine and type(used) == "table" and used[p.file] then return refuse("contested") end

    local rec = mine or { note = spec.noteId, token = spec.token, ver = F.VERSION, st = "forced", fix = 0 }
    rec.place = spec.place or 0
    rec.fp = deps.fingerprint or "-"
    rec.st = mine and rec.st or "forced"
    recs[spec.token] = rec
    markTracker(deps, p)
    writeItem(item, p, rec, deps)
    if p.kind == "letter" and p.category ~= "Letter" and deps.getText then
        local nm = deps.getText("IGUI_" .. p.category)
        if type(nm) == "string" and nm ~= "" then
            pcall(function() item:setName(nm) end)
            pcall(function() item:setCustomName(true) end)
        end
    end
    say(deps, "i", { op = "force", ok = 1, note = spec.noteId, place = rec.place })
    return true
end

local function copyOf(rec) return { token = rec.token, note = rec.note, ver = rec.ver, place = rec.place } end

-- verify(item, deps): "unknown" (not ours, untouched) | "foreign" (carries our token but the record
-- is gone: left alone) | "gone" (the dependency no longer has that id: left alone) | "ok" | "repaired".
function F.verify(item, deps)
    local okM, md = pcall(function() return item:getModData() end)
    if not okM or type(md) ~= "table" or not md.oiToken then return "unknown" end
    local recs = deps.store(F.RECORD)
    local rec = recs[md.oiToken]
    if not rec then return "foreign" end
    local p = F.parse(rec.note)
    if not p or not poolHas(deps, p) then return "gone" end
    local want = seal(md.oiToken, rec.note, rec.ver)
    local r = copyOf(rec); r.token = md.oiToken
    local dirty = md.iioitmTextId ~= p.file or md.oiSeal ~= want or md.iioitmLocationBaked ~= true
        or (p.kind == "letter" and md.iioitmLetterCategory ~= p.category)
    if not dirty and rec.place and rec.place > 0 then dirty = md.iioitmLocation ~= deps.categories[rec.place] end
    local t = tracker(deps)
    local flagged = t and type(t[p.tracker]) == "table" and t[p.tracker][p.file] == true
    if not flagged then markTracker(deps, p) end
    if not dirty then return "ok" end
    writeItem(item, p, r, deps)
    rec.st = "repaired"; rec.fix = (rec.fix or 0) + 1
    return "repaired"
end

-- Re-asserts every record's tracker flag (the dependency clears a pool's flags when a cycle ends).
-- Returns how many flags had to be put back, and the number of records.
function F.reassertTracker(deps)
    local recs = deps.store(F.RECORD)
    local back, n = 0, 0
    local t = tracker(deps)
    if not t then return 0, 0 end
    for _, rec in pairs(recs) do
        n = n + 1
        local p = F.parse(rec.note)
        if p then
            local flagged = type(t[p.tracker]) == "table" and t[p.tracker][p.file] == true
            if not flagged then markTracker(deps, p); back = back + 1 end
        end
    end
    return back, n
end

-- Sweep: tracker re-assert + verify of the given items. One log line with counts.
function F.sweep(deps, items)
    local c = { ok = 0, repaired = 0, foreign = 0, gone = 0, unknown = 0 }
    local back, n = F.reassertTracker(deps)
    for _, it in ipairs(items or {}) do
        local s = F.verify(it, deps)
        c[s] = (c[s] or 0) + 1
    end
    say(deps, (c.repaired > 0 or back > 0 or c.foreign > 0) and "w" or "i",
        { op = "sweep", records = n, items = (c.ok + c.repaired + c.foreign + c.gone), ok = c.ok,
          repaired = c.repaired, foreign = c.foreign, gone = c.gone, tracker = back })
    return c, back, n
end

return F
