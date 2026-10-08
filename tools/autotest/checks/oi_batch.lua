-- Stages for checks/oi_batch.sh: ALL STORIES + THE STANDALONE BATCH in the real game. Needs checks/oi_scene.lua
-- loaded first (its CFSCENE does the walking, the shape reading and the find). IDS, COUNTS AND DIGESTS ONLY:
-- no note text is ever read here.
CFBATCH = CFBATCH or {}
local K = CFBATCH
local function R() return OIShared.GeneratedRuntime end
local function locs()
    local case = R().worldCase()
    local out = {}
    for _, l in ipairs(case and case.locations or {}) do
        if type(l.story) == "table" or type(l.batch) == "table" then out[#out + 1] = l end
    end
    table.sort(out, function(a, b) return a.id < b.id end)
    return out
end
local function info(l) return l.story or l.batch end
local function noteOf(areaId)
    local case = R().worldCase()
    for _, d in ipairs(case.documents) do
        if d.locationId == areaId and type(d.members) == "table" and d.members[1] then return d.members[1].noteId end
    end
end
function K.god() getPlayer():setGodMod(true); return true end
-- total scenes, of them standalone
function K.count()
    local n, s = 0, 0
    for _, l in ipairs(locs()) do n = n + 1; if l.batch then s = s + 1 end end
    return n, s
end
-- duplicate notes, unknown notes, shared buildings, digest of scene:building
function K.global()
    local notes, builds, dupN, dupB, unknown = {}, {}, 0, 0, 0
    local digest = {}
    local Cat = OIShared.NoteCatalogue
    for _, l in ipairs(locs()) do
        local id = noteOf(l.id)
        if notes[id] then dupN = dupN + 1 end; notes[id] = true
        if not Cat.get(id) then unknown = unknown + 1 end
        local b = info(l).building
        if builds[b] then dupB = dupB + 1 end; builds[b] = true
        digest[#digest + 1] = l.id .. ":" .. b
    end
    local d = table.concat(digest, ",")
    -- a short stable hash of the digest (kept small for the log)
    local h = 5381
    for i = 1, #d do h = (h * 33 + d:byte(i)) % 2147483647 end
    return dupN, unknown, dupB, h
end
-- towns: scenes per town; min, max, number of towns, and the list "t:n"
function K.towns()
    local per = {}
    for _, l in ipairs(locs()) do local t = info(l).town; per[t] = (per[t] or 0) + 1 end
    local mn, mx, n, list = 1e9, 0, 0, {}
    for t, c in pairs(per) do n = n + 1; mn = math.min(mn, c); mx = math.max(mx, c); list[#list + 1] = t .. ":" .. c end
    table.sort(list)
    return mn, mx, n, table.concat(list, " ")
end
-- standalone host kinds: building, vehicle, body
function K.hosts()
    local b, v, y = 0, 0, 0
    for _, l in ipairs(locs()) do
        if l.batch then
            if l.batch.host == "vehicle" then v = v + 1 elseif l.batch.host == "body" then y = y + 1 else b = b + 1 end
        end
    end
    return b, v, y
end
-- Point CFSCENE at the nth scene of a kind: "story" | "building" | "vehicle" | "body"
function K.select(kind, nth)
    local k = 0
    for _, l in ipairs(locs()) do
        local ok
        if kind == "story" then ok = l.story ~= nil
        elseif kind == "building" then ok = l.batch ~= nil and (l.batch.host == "building" or l.batch.host == nil)
        else ok = l.batch ~= nil and l.batch.host == kind end
        if ok then
            k = k + 1
            if k == (nth or 1) then
                local docId = require("OIShared/Generated/AreaCase").docId(l.id, l.id:sub(6), 1)
                CFSCENE.id = docId
                CFSCENE.home = { x = math.floor((l.bounds.x1 + l.bounds.x2) / 2), y = math.floor((l.bounds.y1 + l.bounds.y2) / 2), z = l.bounds.z or 0 }
                CFSCENE.noteId = noteOf(l.id)
                K.bounds = l.bounds; K.docId = docId; K.spawnedOk = nil
                return docId, CFSCENE.noteId
            end
        end
    end
    return false
end

-- VEHICLE HOST: the world has no fitting vehicle at the site by chance, so the check spawns one (debug call) on
-- a free outdoor square next to the building, of the first vehicle type the scene names.
function K.prep()
    local b = K.bounds
    getPlayer():teleportTo(math.floor((b.x1 + b.x2) / 2) + 0.5, math.floor((b.y1 + b.y2) / 2) + 0.5, 0)
    return true
end
function K.spawn()
    if K.spawnedOk then return true end
    local b, cell = K.bounds, getCell()
    local doc
    for _, d in ipairs(R().worldCase().documents) do if d.id == K.docId then doc = d end end
    if not (b and cell and doc and doc.vehicles) then return false end
    local script = doc.vehicles[1]
    for r = 2, 12 do
        for x = b.x1 - r, b.x2 + r do
            for _, y in ipairs({ b.y1 - r, b.y2 + r }) do
                local sq = cell:getGridSquare(x, y, 0)
                if sq and sq:isFree(false) and sq:isOutside() and not sq:getBuilding() then
                    local v = addVehicleDebug("Base." .. script, IsoDirections.S, nil, sq)
                    if v then K.spawnedOk = true; K.spawnedAt = x .. "," .. y; K.spawnedScript = script; return true end
                end
            end
        end
    end
    return false
end
function K.spawned() return K.spawnedScript or "-", K.spawnedAt or "-" end
