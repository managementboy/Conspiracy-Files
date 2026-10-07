-- In-game side of NoteForcer: builds the real dependency handles, keeps forced notes honest, and
-- offers the debug-only placeTest. Nothing here reads note text (the owner plays blind); the real
-- check reads only ids and text LENGTHS.
--   * OnGameStart: put the tracker flags back (the dependency clears a pool's flags when a cycle
--     ends) and verify every forced note the player carries; one log line with counts.
--   * the registry's open function is wrapped once: the item is verified right BEFORE the dependency's
--     window picks or resolves its text, so a lost iioitmTextId can never become a random pick.
OIShared = OIShared or {}
local F = require("OIShared/NoteForcer")
local G = {}
OIShared.NoteForcerGame = G
OIShared.NoteForcer.placeTest = function(...) return G.placeTest(...) end

function G.deps() return require("OIShared/DependencyAdapter").forceDeps() end

local function collect(container, out, depth)
    if not container or depth > 4 then return end
    local items = container:getItems()
    for i = 0, items:size() - 1 do
        local it = items:get(i)
        if it:getModData().oiToken then out[#out + 1] = it end
        if instanceof(it, "InventoryContainer") then collect(it:getInventory(), out, depth + 1) end
    end
end

-- Forced items in player 0's inventory (bags included).
function G.carried()
    local out = {}
    local p = getSpecificPlayer and getSpecificPlayer(0)
    if p then collect(p:getInventory(), out, 0) end
    return out
end

function G.sweep()
    local c, back, n = F.sweep(G.deps(), G.carried())
    return c, back, n
end

local wrapped = false
local function install()
    pcall(G.sweep)
    if wrapped then return end
    wrapped = require("OIShared/DependencyAdapter").wrapOpen(function(item) pcall(F.verify, item, G.deps()) end)
end
require("OIShared/Events/EngineEvents").on("OnGameStart", install)

-- DEBUG ONLY (like Shift+L): create a Base.Note / letter forced to noteId in player 0's inventory
-- (where = "inv", default) or on the ground at their feet (where = "ground"). Returns the item and
-- its token, or nil and a reason. The item is forced BEFORE it enters inventory or world.
function G.placeTest(noteId, where, place)
    if not (isDebugEnabled and isDebugEnabled()) then return nil, "not-debug" end
    local p = F.parse(noteId)
    if not p then return nil, "bad-id" end
    local player = getSpecificPlayer(0)
    if not player then return nil, "no-player" end
    local fullType = "Base.Note"
    if p.kind == "letter" then
        fullType = "Base.LetterHandwritten" -- the window follows the category, not the item type
    end
    local item = instanceItem(fullType)
    if not item then return nil, "no-item" end
    local deps = G.deps()
    local recs = deps.store(F.RECORD)
    local k = 1
    while recs["pt" .. k] do k = k + 1 end
    local token = "pt" .. k
    local ok, why = F.force(item, { noteId = noteId, token = token, place = place, pool = p.pool }, deps)
    if not ok then return nil, why end
    if where == "ground" then
        local sq = player:getCurrentSquare()
        if not sq then return nil, "no-square" end
        sq:AddWorldInventoryItem(item, 0.5, 0.5, 0)
    else
        player:getInventory():AddItem(item)
    end
    G.last = item
    return item, token
end

return G
