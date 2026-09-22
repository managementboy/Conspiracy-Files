-- All 125 map destinations, in the game. Loaded after map_placement.lua,
-- whose CFPlace does the per-design work; this adds the walk over the whole
-- catalogue and the two questions the geometry pass could not answer.
--
-- The 2026-09-20 coverage evidence established geometry only, and said so:
-- 107 designs resolve to one building, 18 to more than one, none to none. Its
-- closing section is explicit that it does not show a reachable non-floor
-- container, an actual payoff insertion, or player access. Those are the three
-- columns here.
CFCov = CFCov or {}
local V = CFCov
local R = ConspiracyFiles.MapMediaRuntime
local C = require("ConspiracyFiles/MapMediaCatalogue")
local World = require("ConspiracyFiles/WorldAccess")
-- StorageChoices, not Choices. The wrong path cost a whole run: Kahlua's
-- require returns NIL for a missing module instead of raising, so the fixture
-- loaded without complaint and only failed when V.container was called - and
-- ev() swallows the error, so every design recorded an empty row which the
-- shell then misread as "resolves to no building and no area". The designs
-- resolve perfectly well; CFCov.geometry returns 1|0 for the first of them.
local Choices = require("ConspiracyFiles/Generated/StorageChoices")
assert(type(Choices) == "table" and Choices.fixedKind,
    "StorageChoices did not load; require returns nil here rather than raising")
local TAG = "ConspiracyFiles.MapMedia"

function V.count() return #C.list end
function V.at(i) return C.list[i] or "" end

-- Geometry, unchanged from the earlier pass so the two can be compared.
function V.geometry(id)
    local c = R.coverage(id)
    if not c then return "0\t0\tunknown" end
    return tostring(c.buildings) .. "\t" .. tostring(c.areas) .. "\t" .. tostring(c.source or "?")
end

local function payoff(id)
    local w = ModData.get(TAG)
    local t = w and w.canonical and w.canonical.trails[id]
    return t and t.payoff
end

-- THE CONTAINER, and whether the engine calls it a floor.
-- Choices.fixedKind is the shipped rule for what may carry a clue, so asking
-- it here is asking the product, not a copy of its opinion.
function V.container(id)
    local p = payoff(id)
    if not p or not p.target then return "none\tnone\tfalse" end
    local kind = tostring(p.target.containerType or "?")
    local sprite = tostring(p.target.sprite or "?")
    local nonFloor = kind ~= "floor" and Choices.fixedKind(kind) == true
    return kind .. "\t" .. sprite .. "\t" .. tostring(nonFloor)
end

-- PLAYER ACCESS, only as far as the engine can actually establish it.
-- Reported in three parts rather than one boolean, because they are three
-- different claims and collapsing them is how "all destinations PASS" got
-- written last time:
--   resolve   the mod's own WorldAccess can resolve the stored target to a
--             live container right now
--   square    the target square exists in the loaded cell
--   standable the target square or one of its four neighbours is free for the
--             player to stand on, which is the strongest statement available
--             without a full path solve
function V.access(id)
    local p = payoff(id)
    if not p or not p.target then return "false\tfalse\tfalse" end
    local resolved = World.resolve(p.target) ~= nil
    local cell = getCell()
    local t = p.target
    local square = cell and cell:getGridSquare(t.x, t.y, t.z)
    local standable = false
    if square then
        local player = getPlayer()
        for _, d in ipairs({{0,0},{1,0},{-1,0},{0,1},{0,-1}}) do
            local s = cell:getGridSquare(t.x + d[1], t.y + d[2], t.z)
            if s then
                local ok, free = pcall(function() return s:isFree(false) end)
                if ok and free then standable = true; break end
            end
        end
        if not standable and player then
            -- A square the player is already standing on is standable by
            -- demonstration, whatever isFree says about it.
            if math.floor(player:getX()) == t.x and math.floor(player:getY()) == t.y then
                standable = true
            end
        end
    end
    return tostring(resolved) .. "\t" .. tostring(square ~= nil) .. "\t" .. tostring(standable)
end

-- PROGRESS, so a design that is still working can be told from one that is
-- stuck. A wall clock cannot tell those apart, and every job here is paced per
-- frame (see T3Nearby.STALL_FRAMES and the campaign gate's own fingerprint).
function V.progress(id)
    local s = R.status() or {}
    local p = payoff(id)
    return table.concat({
        tostring(s.indexed), tostring(s.indexAt), tostring(s.indexOf),
        tostring(p and p.state or "none"),
        tostring(p and p.target and (p.target.x .. "," .. p.target.y .. "," .. p.target.z) or "none"),
        tostring(s.refusal or "none"),
    }, "\t")
end

-- WHY A DESIGN PRODUCED NO PAYOFF, which is a different question from whether
-- it did. Two designs answered `state none, items -1, container none` on
-- 2026-09-21 (WorldStashMap9, WorldStashMap20) and the run could only report
-- that nothing happened. There are two quite different reasons:
--
--   IMPOSSIBLE   the destination has no eligible non-floor container at all,
--                so no amount of waiting will place anything;
--   UNFINISHED   the trail was never active, or the scan had not resolved a
--                candidate yet when the row was read.
--
-- Reported as a census rather than a verdict: how many containers the engine
-- shows around the destination, how many the shipped rule would accept, how
-- many are explored, and what the trail state actually is.
function V.why(id)
    local SC = require("ConspiracyFiles/Generated/StorageChoices")
    local binding = Catalogue.get(id)
    local t = binding and binding.targets and binding.targets[1]
    if not t then return "no target in the catalogue" end
    local cell = getCell()
    if not cell then return "no cell" end
    local total, eligible, explored, kinds = 0, 0, 0, {}
    local R2 = 12
    for dx = -R2, R2 do for dy = -R2, R2 do
        local sq = cell:getGridSquare(t.x + dx, t.y + dy, 0)
        if sq then
            local objs = sq:getObjects()
            for i = 0, math.min(48, objs:size()) - 1 do
                local o = objs:get(i)
                local n = o.getContainerCount and o:getContainerCount() or 0
                for ci = 0, math.min(8, n) - 1 do
                    local c = o:getContainerByIndex(ci)
                    if c then
                        total = total + 1
                        local k = tostring(c:getType())
                        if SC.fixedKind(k) then
                            eligible = eligible + 1
                            kinds[k] = (kinds[k] or 0) + 1
                            if c:isExplored() then explored = explored + 1 end
                        end
                    end
                end
            end
        end
    end end
    local parts = {}
    for k, v in pairs(kinds) do parts[#parts + 1] = k .. "=" .. v end
    table.sort(parts)
    local root = R.status() and R.status().state
    local trail = root and root.trails and root.trails[id]
    local p = trail and trail.payoff
    return table.concat({
        "target=" .. t.x .. "," .. t.y,
        "containers=" .. total,
        "eligible=" .. eligible,
        "explored=" .. explored,
        "kinds=" .. (table.concat(parts, ",") ~= "" and table.concat(parts, ",") or "none"),
        "trailActive=" .. tostring(trail ~= nil),
        "payoffState=" .. tostring(p and p.state or "none"),
        "verdict=" .. (eligible == 0 and "IMPOSSIBLE-HERE: no eligible non-floor container within "
            .. R2 .. " tiles" or "POSSIBLE: eligible containers exist, so no payoff means the "
            .. "trail or scan did not get there"),
    }, "\t")
end

-- One row per design, everything at once, so the shell asks the game once per
-- design rather than six times.
-- Has the world around the teleported survivor streamed in far enough for the
-- stored target to resolve? Until it has, P.items cannot count anything and
-- every verdict is INCONCLUSIVE for a reason that has nothing to do with the
-- design.
function V.settled(id)
    return tostring(CFPlace.observable(id) == true)
end

function V.row(id)
    local verdict, state, n = CFPlace.verdict(id)
    return table.concat({
        id, V.geometry(id), verdict, tostring(state), tostring(n),
        V.container(id), V.access(id),
    }, "\t")
end
return true
