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
local A = {}
local tried = false

function A.gather()
    local deps = {
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

-- One snapshot per game: build, install, log one line. force=true re-runs (tests, eval channel).
function A.snapshot(force)
    if tried and not force then return Catalogue.current() end
    tried = true
    local okT, tables = pcall(require, "OIShared/Generated/NoteTables")
    local okG, deps = pcall(A.gather)
    local okB, c = pcall(Catalogue.build, okG and deps or nil, okT and tables or nil)
    if not okB then c = Catalogue.build(nil, nil); c.reason = "build failed" end
    deps = nil
    Catalogue.install(c)
    pcall(audit, c)
    return c
end

-- Handles for NoteForcer (phase 3): the registry, pools, their location categories, the world store.
function A.forceDeps()
    local _, dyn = Catalogue.fingerprint()
    return {
        registry = ReadableItemRegistry,
        poolFor = function(k)
            if k == "Note" then return NoteContentPool end
            return LetterContentPools and LetterContentPools[k] or nil
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

-- Lazy entry for callers that run before OnGameStart finished.
function A.ensure() return A.snapshot(false) end
function A.reset() tried = false; Catalogue.reset() end

return A
