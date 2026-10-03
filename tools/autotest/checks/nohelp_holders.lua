-- Stages for checks/nohelp_holders.sh: a placed object SET is one holder with its pieces inside, and
-- inspecting it records the find once (docs/design/SET_HOLDERS.md). Counts, ids and item names only; no clue text.
CFHOLD = CFHOLD or {}
local K = CFHOLD
local function R() return NHShared.GeneratedRuntime end
local function World() return require("NHShared/WorldAccess") end
local function H() return require("NHShared/SetHolders") end

local function docOf(id)
    local case = R().worldCase()
    for _, d in ipairs(case and case.documents or {}) do if d.id == id then return d end end
end
-- Placed sets (2+ pieces) in a container or on the ground, stable order.
function K.sets()
    local list = {}
    for _, c in ipairs(R().clueTargets()) do
        local d = c.status == "placed" and not c.vehicle and not c.carrier and docOf(c.id)
        if d and type(d.members) == "table" and H().pieces(d)[2] then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    K.list = list
    return #list
end
-- Sets with a spot that are not placed yet: standing there loads the square so placement can run.
function K.waiting(n)
    local list = {}
    for _, c in ipairs(R().clueTargets()) do
        local d = c.status ~= "placed" and not c.vehicle and not c.carrier and docOf(c.id)
        if d and type(d.members) == "table" then list[#list + 1] = c end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    if not n then return #list end
    local t = list[((n - 1) % math.max(#list, 1)) + 1]
    if not t then return false, "none waiting" end
    K.target = t
    getPlayer():teleportTo(t.x + 0.5, t.y + 0.5, t.z)
    return true, t.id, t.status
end
function K.pick(n)
    local t = K.list and K.list[n]
    if not t then return false, "only " .. tostring(K.list and #K.list or 0) end
    K.target = t
    return true, t.id, t.x .. "," .. t.y .. "," .. t.z
end
function K.teleport(x, y, z) getPlayer():teleportTo(x + 0.5, y + 0.5, z); return true end
function K.loaded()
    local t, cell = K.target, getCell()
    if not t or not cell then return false end
    for dx = -1, 1 do for dy = -1, 1 do
        if not cell:getGridSquare(t.x + dx, t.y + dy, t.z) then return false end
    end end
    return true
end
-- What lies at the clue's spot: one holder? how many pieces inside, how many loose, is it the pick the rule makes?
function K.shape()
    local t = K.target
    local container = World().resolve(t.target, t.token)
    if not container then return false, "container not resolved" end
    local doc = docOf(t.id)
    local shape = H().shape(container, t.token)
    if not shape.holder then return false, "no holder", shape.loose end
    local pick = H().pick(R().worldSeed(), t.id, H().pieces(doc))
    local inv = shape.holder:getInventory()
    local weight = 0
    local items = inv:getItems()
    for i = 0, items:size() - 1 do weight = weight + items:get(i):getActualWeight() end
    K.holder = shape.holder
    return true, shape.holder:getFullType(), shape.holder:getDisplayName(), shape.inside, shape.loose,
        shape.holders, #H().pieces(doc), tostring(pick and pick.fullType == shape.holder:getFullType()),
        string.format("%.2f", weight) .. "/" .. tostring(inv:getCapacity())
end
local function times(id)
    local n = 0
    for _, row in ipairs(R().known()) do if row.id == id then n = n + 1 end end
    return n
end
function K.inspectHolder()
    local id, holder = K.target.id, K.holder
    if not holder then return false, "no holder" end
    local before = times(id)
    local recognised = R().recognise(holder, "debug")
    local ok1 = R().inspect(holder, true)
    local after1 = times(id)
    local ok2 = R().inspect(holder, true)
    return true, before, after1, times(id), tostring(recognised), tostring(ok1), tostring(ok2),
        tostring(R().isRecognisedId(id))
end
-- Inspecting a piece lying in the holder afterwards: still one find.
function K.inspectPiece()
    local id = K.target.id
    local items = K.holder:getInventory():getItems()
    local piece = items:size() > 0 and items:get(0)
    if not piece then return false, "empty holder" end
    local md = piece:getModData()
    local ok = R().inspect(piece, true)
    return true, times(id), tostring(ok), tostring(md.cfPiece), tostring(piece:getDisplayCategory())
end
