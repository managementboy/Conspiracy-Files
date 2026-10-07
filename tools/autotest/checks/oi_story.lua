-- Stages for checks/oi_story.sh: STORIES AS SCENES in the real game. Needs checks/oi_scene.lua loaded first
-- (its CFSCENE does the walking, the shape reading and the find; this file only points it at a story's
-- first scene and reads the world record). IDS, COUNTS AND DIGESTS ONLY: no note text is ever read here.
CFSTORY = CFSTORY or {}
local K = CFSTORY
local function R() return OIShared.GeneratedRuntime end
local function storyLocs()
    local case = R().worldCase()
    local out = {}
    for _, l in ipairs(case and case.locations or {}) do
        if type(l.story) == "table" then out[#out + 1] = l end
    end
    table.sort(out, function(a, b) return a.id < b.id end)
    return out
end
function K.god() getPlayer():setGodMod(true); return true end
function K.count() return #storyLocs() end
local function noteOf(areaId)
    local case = R().worldCase()
    for _, d in ipairs(case.documents) do
        if d.locationId == areaId and type(d.members) == "table" and d.members[1] then return d.members[1].noteId, d end
    end
end
-- per story: scenes, distinct buildings, distinct towns, distinct areas
function K.story(n)
    local scenes, b, t, a = 0, {}, {}, {}
    for _, l in ipairs(storyLocs()) do
        if l.story.story == n then
            scenes = scenes + 1; b[l.story.building] = true; t[l.story.town] = true; a[l.story.area] = true
        end
    end
    local function c(x) local k = 0; for _ in pairs(x) do k = k + 1 end; return k end
    return scenes, c(b), c(t), c(a)
end
-- all notes unique and forced-able (catalogue ids), no building shared, a digest of scene:building
function K.global()
    local notes, builds, dupN, dupB, unknown, shared = {}, {}, 0, 0, 0, 0
    local digest = {}
    local Cat = OIShared.NoteCatalogue
    for _, l in ipairs(storyLocs()) do
        local id = noteOf(l.id)
        if notes[id] then dupN = dupN + 1 end; notes[id] = true
        if not Cat.get(id) then unknown = unknown + 1 end
        if builds[l.story.building] then dupB = dupB + 1 end; builds[l.story.building] = true
        digest[#digest + 1] = l.id .. ":" .. l.story.building
    end
    return dupN, unknown, dupB, table.concat(digest, ",")
end
-- Point CFSCENE at the first scene (lowest scene id) of a story.
function K.select(n)
    for _, l in ipairs(storyLocs()) do
        if l.story.story == n then
            local sid = l.id:sub(6)
            local docId = require("OIShared/Generated/AreaCase").docId(l.id, sid, 1)
            CFSCENE.id = docId
            CFSCENE.home = { x = math.floor((l.bounds.x1 + l.bounds.x2) / 2), y = math.floor((l.bounds.y1 + l.bounds.y2) / 2), z = l.bounds.z or 0 }
            CFSCENE.noteId = noteOf(l.id)
            return docId, CFSCENE.noteId
        end
    end
    return false
end
