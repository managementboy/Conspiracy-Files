-- Stages for checks/oi_scene.sh: ONE note scene (a forced note + ordinary objects) in the real game.
-- Loaded through the eval channel, then called by name with real game frames in between.
-- IDS, COUNTS AND LENGTHS ONLY: nothing here reads or prints note text (the owner plays blind).
CFSCENE = CFSCENE or {}
local K = CFSCENE
local function R() return OIShared.GeneratedRuntime end
local function player() return getPlayer() end
local function World() return require("OIShared/WorldAccess") end
local function H() return require("OIShared/SetHolders") end
local FAR = 30

local function row()
    for _, c in ipairs(R().clueTargets()) do if c.id == K.id then return c end end
end
local function docOf(id)
    local case = R().worldCase()
    for _, d in ipairs(case and case.documents or {}) do if d.id == id then return d end end
end

-- Decide the test scene on a 20 x 20 box around where the survivor stands now (their start building).
function K.decide()
    local p = player()
    K.home = { x = math.floor(p:getX()), y = math.floor(p:getY()), z = math.floor(p:getZ()) }
    local scene = require("OIShared/Generated/Scenes").rows[1]
    local C = K.home
    local ok, ids = R().decideNoteScene(scene, { x1 = C.x - 10, y1 = C.y - 10, x2 = C.x + 10, y2 = C.y + 10, z = C.z })
    if ok then K.id = ids[1] end
    return ok, ok and ids[1] or tostring(ids), scene.noteId
end
-- Stand FAR tiles east (side 1) or west (side -1) of the box centre: placement and relocation need the
-- survivor more than 20 tiles from the spot (the engine's guard), inside the arrival ring.
function K.far(side)
    local C = K.home
    player():teleportTo(C.x + FAR * side + 0.5, C.y + 0.5, C.z)
    return true
end
function K.status()
    local t = row()
    if not t then return false, "no row" end
    return true, t.status, t.x, t.y, t.z, tostring(t.recognised)
end
function K.side() -- which side of the box centre the clue is on (1 east, -1 west)
    local t = row()
    return (t and t.x >= K.home.x) and 1 or -1
end
function K.stand(dx)
    local t = row()
    K.target = t
    player():teleportTo(t.x + (dx or 2) + 0.5, t.y + 0.5, t.z)
    return true
end
function K.loaded()
    local t, cell = K.target, getCell()
    if not t or not cell then return false end
    for dx = -3, 3 do for dy = -3, 3 do
        if not cell:getGridSquare(t.x + dx, t.y + dy, t.z) then return false end
    end end
    return true
end
local function noteIn(container, token)
    local function scan(c)
        local items = c:getItems()
        for i = 0, items:size() - 1 do
            local it = items:get(i)
            local md = it:getModData()
            if md.oiToken == token then return it end
            if instanceof(it, "InventoryContainer") then local f = scan(it:getInventory()); if f then return f end end
        end
    end
    return scan(container)
end
-- What lies at the clue's spot: holder shape, pieces, and the forced note's keys (ids and flags only).
function K.shape()
    local t = row()
    K.target = t
    local container = World().resolve(t.target, t.token)
    if not container then return false, "container not resolved" end
    local doc = docOf(K.id)
    local shape = H().shape(container, t.token)
    local want = #H().pieces(doc)
    local pick = H().pick(R().worldSeed(), K.id, H().pieces(doc))
    local note = noteIn(container, t.token)
    if not note then return false, "no forced note at the spot", shape.holders, shape.inside, shape.loose, want end
    local md = note:getModData()
    local F = OIShared.NoteForcer
    local rec = ModData.getOrCreate(F.RECORD)[t.token]
    local file = rec and F.parse(rec.note) and F.parse(rec.note).file
    local used = ModData.getOrCreate(F.TRACKER)
    local flag = rec and used[F.parse(rec.note).tracker] and used[F.parse(rec.note).tracker][file] == true
    local state = OIShared.NoteForcerGame.deps and F.verify(note, OIShared.NoteForcerGame.deps()) or "?"
    local holderType = shape.holder and shape.holder:getFullType() or "-"
    local pickOk = (pick == nil and shape.holder == nil) or (pick ~= nil and shape.holder ~= nil and pick.fullType == holderType)
    local first = note:getModData().oiPiece
    return true, shape.holders, shape.inside, shape.loose, want, holderType, tostring(pickOk),
        tostring(md.iioitmTextId == file), tostring(md.oiToken == t.token), tostring(md.iioitmLocationBaked), tostring(flag),
        rec and rec.note or "-", tostring(rec and rec.re or 0), tostring(rec and rec.fix or 0), state, tostring(first),
        md.iioitmTextId or "-", note:getFullType()
end
-- Item-level facts of every piece: ordinary objects carry no note keys, the note is the only forced one.
function K.keys()
    local t = row()
    local container = World().resolve(t.target, t.token)
    local forced, plain, others = 0, 0, 0
    local function walk(c, depth)
        local items = c:getItems()
        for i = 0, items:size() - 1 do
            local it = items:get(i)
            local md = it:getModData()
            if md.oiPhysicalToken == t.token and not md.oiHolder then
                if md.oiToken then forced = forced + 1 else plain = plain + 1 end
                if md.iioitmTextId and not md.oiToken then others = others + 1 end
            end
            if instanceof(it, "InventoryContainer") and depth < 3 then walk(it:getInventory(), depth + 1) end
        end
    end
    walk(container, 0)
    return forced, plain, others
end
-- Search Mode's view of the scene: how many live clue rows (= icons) it has for this scene id.
function K.liveRows()
    local n = 0
    for _, l in ipairs(OIShared.ClueSearch.liveClues(player())) do if l.id == K.id then n = n + 1 end end
    return n
end

-- The close cue: reset it, aim it at this scene only, stand 2 tiles away, let the game run.
function K.cueSetup()
    local Cue = OIShared.ClueCue
    Cue.debugReset(); Cue.debugOnly = K.id
    K.cooldownWas = K.cooldownWas or Cue.Rules.COOLDOWN_MS; Cue.Rules.COOLDOWN_MS = 0
    local st = Cue.store(); if st then st.places = {}; st.cases = {} end
    return true
end
function K.cueState()
    local s = OIShared.ClueCue.state()
    return s.said, s.suppressed, tostring(s.last and s.last.id == K.id)
end

-- The world clock: nights survived is the lever (relocation.lua measured +96 h for +4 nights).
function K.advance(nights)
    local gt = getGameTime()
    local before = gt:getWorldAgeHours()
    gt:setNightsSurvived(gt:getNightsSurvived() + nights)
    return string.format("%.1f", before), string.format("%.1f", gt:getWorldAgeHours())
end
-- Remove the tracker flag of the forced id (what the dependency's pool reset does), then run the hourly sweep.
function K.trackerCycle()
    local F = OIShared.NoteForcer
    local rec
    for _, r in pairs(ModData.getOrCreate(F.RECORD)) do rec = r end
    local p = F.parse(rec.note)
    local used = ModData.getOrCreate(F.TRACKER)
    used[p.tracker][p.file] = nil
    local cleared = used[p.tracker][p.file] == nil
    local back, n = OIShared.NoteForcerGame.hourly()
    return tostring(cleared), back, n, tostring(used[p.tracker][p.file] == true)
end

-- The find: Search Mode's own call, then the "look it over" path on a second piece (no second find).
function K.find(how)
    local ok, newly = R().recognise(K.id, how)
    return tostring(ok), tostring(newly), tostring(R().isRecognisedId(K.id))
end
-- After a reload: find the scene again by its (derived) id, and its box centre from the saved record.
function K.attach()
    local scene = require("OIShared/Generated/Scenes").rows[1]
    K.id = require("OIShared/Generated/AreaCase").docId(require("OIShared/SceneNote").areaId(scene), scene.id, 1)
    local case = R().worldCase()
    for _, l in ipairs(case and case.locations or {}) do
        if l.id == require("OIShared/SceneNote").areaId(scene) then
            K.home = { x = math.floor((l.bounds.x1 + l.bounds.x2) / 2), y = math.floor((l.bounds.y1 + l.bounds.y2) / 2), z = l.bounds.z }
        end
    end
    return K.home ~= nil and docOf(K.id) ~= nil, K.id
end
