-- The ONLY file that touches the dependency's globals ("It is of interest to me!"). Everything is
-- read inside pcall; a missing, partial or invalid dependency leaves the catalogue EMPTY and
-- INACTIVE with exactly one log line and no error. Keeps no reference to their tables or text:
-- gather() hands them to NoteCatalogue.build, which copies only ids and place tags.
-- WHEN: their pools are filled by their shared Lua at load; LocationCategory (client) is loaded
-- after all shared files. So the snapshot is taken once, at OnGameStart (after every mod's Lua),
-- never at file-load time. Language: ids come from their EN maps, so a non-EN game gives the same
-- ids (entries without a translation fall back to EN inside the dependency).
OIShared = OIShared or {}
local Catalogue = require("OIShared/NoteCatalogue")
local Log = require("OIShared/Log")
local Gate = require("OIShared/DriftGate")
local A = {}
local tried = false
local lastProbe
local hidden = {} -- TEST HOOK: note ids the adapter pretends are gone from the live pool (debug only)

function A.gather()
    local deps = {
        registry = ReadableItemRegistry,
        NoteContentPool = NoteContentPool, NoteContentPoolEN = NoteContentPoolEN,
        LetterContentPools = LetterContentPools, LetterContentPoolsEN = LetterContentPoolsEN,
        KNOWN_CATEGORIES = LocationCategory and LocationCategory.KNOWN_CATEGORIES or nil,
        language = ContentLoader and ContentLoader.LANGUAGE or nil,
    }
    return deps
end

local function audit(c)
    local n = c.counts
    Log.write(c.active and "i" or "w", "catalogue", {
        state = c.active and "active" or "inactive", why = c.reason, pools = n.pools, entries = n.entries,
        stories = n.stories, places = n.places, themes = n.themes, dropped = n.dropped, unknown = n.unknown,
        dups = n.duplicates, badids = n.badids, badplace = n.badplace, placemismatch = n.placemismatch,
        lang = c.lang, nonEN = c.nonEN and 1 or 0, fpStatic = c.staticFp, fpDynamic = c.dynamicFp,
    })
end

local function recordIds()
    local out = {}
    local okS, recs = pcall(function() return ModData.getOrCreate(require("OIShared/NoteForcer").RECORD) end)
    if okS and type(recs) == "table" then
        for _, r in pairs(recs) do if type(r) == "table" and type(r.note) == "string" then out[#out + 1] = r.note end end
    end
    table.sort(out)
    return out
end

local function drift(c, result)
    local n = result.counts
    Log.write(result.level >= 2 and "w" or "i", "drift", { level = result.level, missing = n.missing, added = n.added,
        restored = n.restored, poolsMissing = n.poolsMissing, poolsExtra = n.poolsExtra, placesExtra = n.placesExtra,
        forcedGone = n.forcedGone, badids = n.badids, entries = n.entries,
        why = #result.why > 0 and table.concat(result.why, ",") or "-" })
end

-- Builds a catalogue from `deps` (as gather() returns) and classifies it against the shipped contract. Installs
-- NOTHING, logs nothing: the eval channel and the tests run it on mutated COPIES. probe: a G.probe result
-- (nil = run the real one now). Returns catalogue, result, live snapshot.
function A.evaluate(deps, probe, forced)
    local okT, tables = pcall(require, "OIShared/Generated/NoteTables")
    local contract = require("OIShared/Generated/Contract")
    local baseline = require("OIShared/Generated/Baseline")
    local c = Catalogue.build(deps, okT and tables or nil)
    if probe == nil then
        probe = Gate.probe(type(deps) == "table" and deps.registry or nil, function(n) return ModData.getOrCreate(n) end, contract.tracker.name)
    end
    local live = Gate.snapshot(deps, probe, contract)
    local result = Gate.classify(contract, live, c, okT and tables or {}, baseline, forced or {})
    return c, result, live, probe
end

-- One snapshot per game: build, install, log one line. force=true re-runs (tests, eval channel).
function A.snapshot(force)
    if tried and not force then return Catalogue.current() end
    tried = true
    local okG, deps = pcall(A.gather)
    local okE, c, result, _, probe = pcall(A.evaluate, okG and deps or nil, nil, nil)
    if not okE then -- the gate itself failed: no catalogue, forcing off, one line, no error
        c = Catalogue.build(nil, nil); c.reason = "build failed"
        result = { level = 3, counts = { missing = 0, added = 0, restored = 0, poolsMissing = 0, poolsExtra = 0, placesExtra = 0, forcedGone = 0, badids = 0, entries = 0 }, why = { "gate-error" }, off = true }
    else
        lastProbe = probe
        local okF, forced = pcall(recordIds)
        if okF then
            local cnt = 0
            for _, id in ipairs(forced) do if not (c.entries and c.entries[id]) then cnt = cnt + 1 end end
            result.counts.forcedGone = cnt
        end
    end
    deps = nil
    if (result.level == 1 or result.level == 2) and c.active then pcall(Catalogue.restrictKnown, c) end
    Catalogue.install(c)
    Gate.install(result)
    pcall(audit, c)
    pcall(drift, c, result)
    return c
end

-- Handles for NoteForcer (phase 3): the registry, pools, their location categories, the world store.
function A.forceDeps()
    local _, dyn = Catalogue.fingerprint()
    return {
        registry = ReadableItemRegistry,
        enabled = Gate.forcingOn(),
        poolFor = function(k)
            local pool
            if k == "Note" then pool = NoteContentPool else pool = LetterContentPools and LetterContentPools[k] or nil end
            if next(hidden) and type(pool) == "table" then
                local out = {}
                for _, e in ipairs(pool) do
                    local id = type(e) == "table" and e.id or nil
                    local full = id and (k == "Note" and ("Note/" .. id:gsub("%.txt$", "")) or ("Letter/" .. k .. "/" .. id:gsub("%.txt$", "")))
                    if not (full and hidden[full]) then out[#out + 1] = e end
                end
                return out
            end
            return pool
        end,
        categories = LocationCategory and LocationCategory.KNOWN_CATEGORIES or nil,
        store = function(n) return ModData.getOrCreate(n) end,
        version = require("OIShared/NoteForcer").VERSION, fingerprint = dyn,
        catalogue = Catalogue, getText = getText,
        log = function(level, fields) Log.write(level, "force", fields) end,
    }
end

-- Runs before(item) just ahead of the dependency's own Read, once. Returns true when installed.
function A.wrapOpen(before)
    if not ReadableItemRegistry or type(ReadableItemRegistry.open) ~= "function" then return false end
    local original = ReadableItemRegistry.open
    ReadableItemRegistry.open = function(item, playerNum)
        before(item)
        return original(item, playerNum)
    end
    return true
end

-- TEST HOOK (debug sessions only): pretend the dependency no longer has this note id. nil clears all.
function A.testHide(noteId)
    if not (isDebugEnabled and isDebugEnabled()) then return false end
    if noteId == nil then hidden = {} else hidden[noteId] = true end
    return true
end
function A.lastProbe() return lastProbe end

-- Lazy entry for callers that run before OnGameStart finished.
function A.ensure() return A.snapshot(false) end
function A.reset() tried = false; hidden = {}; lastProbe = nil; Catalogue.reset(); Gate.reset() end

return A
