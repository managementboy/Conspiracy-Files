-- Stages for checks/oi_drift.sh: the version-drift gate and the vehicle fallback in the real game. Needs
-- checks/oi_scene.lua and checks/oi_batch.lua loaded first. IDS, COUNTS AND LEVELS ONLY: no note text is read
-- or printed (the owner plays blind). The mutated copies below are never installed into the real globals.
CFDRIFT = CFDRIFT or {}
local K = CFDRIFT
local function R() return OIShared.GeneratedRuntime end
local function A() return require("OIShared/DependencyAdapter") end
local function ser(v)
    if type(v) ~= "table" then return tostring(v) end
    local k = {}
    for key in pairs(v) do k[#k + 1] = key end
    table.sort(k, function(a, b) return tostring(a) < tostring(b) end)
    local o = {}
    for _, key in ipairs(k) do o[#o + 1] = tostring(key) .. "=" .. ser(v[key]) end
    return "{" .. table.concat(o, ",") .. "}"
end
local function hash(s)
    local h = 5381
    for i = 1, #s do h = (h * 33 + s:byte(i)) % 2147483647 end
    return h
end

-- The gate as the game booted: level, then the counts.
function K.live()
    local g = OIShared.DriftGate.current()
    if not g then return -1 end
    local n = g.counts
    return g.level, n.missing, n.added, n.restored, n.poolsMissing, n.poolsExtra, n.placesExtra, n.forcedGone, n.entries
end
-- A signature of everything the mutations must not change.
function K.state()
    local F = OIShared.NoteForcer
    local cat = OIShared.NoteCatalogue.current()
    local s, d = OIShared.NoteCatalogue.fingerprint()
    return hash(ser(ModData.getOrCreate(F.RECORD)) .. "|" .. ser(ModData.getOrCreate(F.TRACKER))),
        s .. "/" .. d, tostring(OIShared.DriftGate.level()), cat.counts.entries, tostring(OIShared.DriftGate.forcingOn())
end

-- A copy of the gathered dependency tables: new tables everywhere, the entries shared (never printed).
local function copyDeps()
    local d = A().gather()
    local c = { registry = d.registry, language = d.language }
    local function arr(t) local o = {}; for i, v in ipairs(t) do o[i] = v end return o end
    local function map(t) local o = {}; for k, v in pairs(t) do o[k] = v end return o end
    c.NoteContentPool, c.NoteContentPoolEN = arr(d.NoteContentPool), map(d.NoteContentPoolEN)
    c.LetterContentPools, c.LetterContentPoolsEN = {}, {}
    for k, v in pairs(d.LetterContentPools) do c.LetterContentPools[k] = arr(v) end
    for k, v in pairs(d.LetterContentPoolsEN) do c.LetterContentPoolsEN[k] = map(v) end
    c.KNOWN_CATEGORIES = arr(d.KNOWN_CATEGORIES)
    return c
end
local function probeCopy()
    local p = A().lastProbe()
    local c = { ran = p.ran, tracker = p.tracker, resolve = p.resolve, keys = {} }
    for i, k in ipairs(p.keys) do c.keys[i] = k end
    return c
end
-- Run the gate on a mutated copy: returns level, then missing, added, why. `which` = none | remove5 | key | reorder.
function K.mutate(which)
    local c, probe = copyDeps(), probeCopy()
    local Tables = require("OIShared/Generated/NoteTables")
    if which == "remove5" then
        local ids = {}
        for k in pairs(c.NoteContentPoolEN) do
            local num = k:match("^(%d+)%.txt$")
            if num and Tables["Note/" .. num] then ids[#ids + 1] = k end
        end
        table.sort(ids)
        for i = 1, 5 do
            local k = ids[i + 20]
            c.NoteContentPoolEN[k] = nil
            for j, e in ipairs(c.NoteContentPool) do if e.id == k then table.remove(c.NoteContentPool, j); break end end
        end
    elseif which == "key" then probe.keys = { "iioitmTxtId" }
    elseif which == "reorder" then c.KNOWN_CATEGORIES[1], c.KNOWN_CATEGORIES[2] = c.KNOWN_CATEGORIES[2], c.KNOWN_CATEGORIES[1] end
    local ok, cat, res = pcall(A().evaluate, c, probe, nil)
    if not ok then return -1, 0, 0, tostring(cat) end
    return res.level, res.counts.missing, res.counts.added, #res.why > 0 and table.concat(res.why, ",") or "-"
end

-- Pretend one note is gone from the live pool (debug hook), or clear every pretence.
function K.hide(noteId) return A().testHide(noteId) end
function K.unhide() return A().testHide(nil) end

-- The scene's pieces and whether the note is among them: forced pieces, plain pieces, loose/inside counts.
function K.pieces()
    local f, p, o = CFSCENE.keys()
    return f, p, o
end

-- ---- vehicle fallback ---------------------------------------------------------------------------------------
local function wcase() return R().worldCase() end
-- The assignment and its site for a scene: ok, fallback flag, status, site id, centre x, y, building, host.
function K.where(docId)
    docId = docId or CFSCENE.id
    local a = R().assignmentOf(docId)
    if not a then return false end
    local site
    for _, l in ipairs(wcase().locations) do if l.id == a.locationId then site = l end end
    if not site then return false end
    local b = site.bounds
    return true, tostring(a.fallback or 0), a.status, a.locationId, math.floor((b.x1 + b.x2) / 2), math.floor((b.y1 + b.y2) / 2),
        tostring(site.batch and site.batch.building or "-"), tostring(site.batch and site.batch.host or "-")
end
-- Stand `dist` tiles east of the current scene's decided centre (inside 25 tiles of its site).
function K.near(dist)
    local h = CFSCENE.home
    getPlayer():teleportTo(h.x + (dist or 20) + 0.5, h.y + 0.5, h.z)
    return true
end
-- After the move: point CFSCENE at the new building.
function K.follow(x, y)
    CFSCENE.home = { x = x, y = y, z = 0 }
    return true
end
-- Is any vehicle of the allowed scripts within 25 tiles of the current vehicle scene's centre?
function K.vehicleNear()
    local h, doc = CFSCENE.home, nil
    for _, d in ipairs(wcase().documents) do if d.id == CFBATCH.docId then doc = d end end
    local VF = require("OIShared/VehicleFallback")
    local World = require("OIShared/WorldAccess")
    local n = 0
    for _, e in ipairs(World.vehiclesNear(h.x, h.y, h.z, 25, 16)) do
        if VF.allowed(e.vehicle:getScriptName(), doc and doc.vehicles) then n = n + 1 end
    end
    return n
end

-- Buildings held by two locations at once (the fallback site counts as a location with a building too).
function K.dupBuildings()
    local seen, dup = {}, 0
    for _, l in ipairs(wcase().locations) do
        local info = l.story or l.batch
        if type(info) == "table" and info.building then
            if seen[info.building] then dup = dup + 1 end
            seen[info.building] = true
        end
    end
    return dup
end
-- Decisions digest (scene id : assignment's site), the same before and after a fallback except for the one moved.
function K.digest()
    local d = {}
    for _, l in ipairs(wcase().locations) do
        local info = l.story or l.batch
        if type(info) == "table" and not tostring(l.id):find(":fb", 1, true) then d[#d + 1] = l.id .. ":" .. tostring(info.building) end
    end
    table.sort(d)
    return hash(table.concat(d, ","))
end
