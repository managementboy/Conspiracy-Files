-- Pure-domain builder for a Connectivity request from an INJECTED square
-- accessor. No direct PZ engine calls live here -- see
-- ConspiracyFiles/ReachabilityAdapter.lua (client) for the real
-- getCell()-backed accessor, and docs/research/B42_RUNTIME_PASSABILITY.md
-- for the engine calls each predicate below stands in for.
--
-- `getSquare(x,y,z)` must return either nil (unloaded/nonexistent) or a
-- table exposing the same method names as a real IsoGridSquare:
--   isSolid(), isSolidTrans(), TreatAsSolidFloor(), HasStairs(),
--   isBlockedTo(otherSquare), isWindowTo(otherSquare)
-- Real squares already have these; tests pass plain Lua tables.
local Connectivity = require("ConspiracyFiles/Connectivity")
local R = {}

-- Basement access is frequently OUTSIDE the building footprint
-- (docs/research/B42_RUNTIME_BASEMENTS.md), so the search box must extend
-- past the site's own bounds. Kept small: this is a *local* reachability
-- check ("can you get from here to this container"), not a search over the
-- whole map -- an unbounded flood fill anchored at the player would explore
-- the entire connected outdoor world and never complete within any sane cap.
R.MARGIN = 6
R.MAX_STAIRS = 256
R.MAX_EDGES = 1024

-- Engine objects are Java-backed: PZ's Kahlua rejects a method invoked
-- without a receiver ("Expected a method call but got a function call"), so
-- every call below must use colon syntax. Plain-table mocks accept both
-- forms, which is exactly how a fully broken version passed its tests once.
local function walkable(square)
    if not square then return false end
    if square:isSolid() or square:isSolidTrans() then return false end
    if not square:TreatAsSolidFloor() then return false end
    return true
end
R.walkable = walkable

-- The box a search is confined to. x2/y2 in `bounds` are exclusive (matches
-- every other bounds table in this codebase, e.g. Generated/Catalog sites).
function R.box(bounds, margin)
    margin = margin or R.MARGIN
    return { x1 = bounds.x1 - margin, x2 = bounds.x2 - 1 + margin,
             y1 = bounds.y1 - margin, y2 = bounds.y2 - 1 + margin }
end

function R.inBox(box, x, y)
    return x >= box.x1 and x <= box.x2 and y >= box.y1 and y <= box.y2
end

-- Discover stair links within `box` across `zLevels`. For every square with
-- HasStairs()==true, look at the 3x3 horizontal neighbourhood one level up
-- and one level down; a neighbour counts as the landing only if it is
-- independently walkable there. This deliberately does not assert a single
-- fixed tile offset for the "top of stairs" landing -- vanilla placement
-- code (ISWoodenStairs.lua:251-259 vs ISBuildUtil.lua:456-476) does not
-- agree closely enough on that offset to hardcode it safely. Any square
-- that is not independently walkable can never contribute a false link, so
-- widening the neighbourhood only risks missing a real link, never
-- fabricating one.
-- Returns stairs, capped (capped==true means the box had too many stair
-- squares to enumerate safely -- callers must treat this as "not proven").
function R.stairLinks(getSquare, box, zLevels)
    local stairs = {}
    for _, z in ipairs(zLevels) do
        for x = box.x1, box.x2 do
            for y = box.y1, box.y2 do
                local square = getSquare(x, y, z)
                if square and square.HasStairs and square:HasStairs() then
                    for _, dz in ipairs({ 1, -1 }) do
                        local nz = z + dz
                        local linked = false
                        for dx = -1, 1 do
                            for dy = -1, 1 do
                                if not linked then
                                    local nx, ny = x + dx, y + dy
                                    if R.inBox(box, nx, ny) then
                                        local candidate = getSquare(nx, ny, nz)
                                        if walkable(candidate) then
                                            if #stairs >= R.MAX_STAIRS then return stairs, true end
                                            stairs[#stairs + 1] = { x1 = x, y1 = y, z1 = z, x2 = nx, y2 = ny, z2 = nz, twoWay = true }
                                            linked = true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return stairs, false
end

-- Discover blocked (walled/windowed) horizontal edges within `box` across
-- `zLevels`. Only pairs where BOTH squares are independently walkable are
-- worth recording -- an edge into an already-impassable square can never
-- change the search outcome. Returns edges, capped; a capped result MUST be
-- treated as "not proven safe to search" by the caller (missing a real wall
-- would let the flood fill leak through it and falsely prove reachability).
function R.wallEdges(getSquare, box, zLevels)
    local edges = {}
    for _, z in ipairs(zLevels) do
        for x = box.x1, box.x2 do
            for y = box.y1, box.y2 do
                local here = getSquare(x, y, z)
                if walkable(here) then
                    for _, d in ipairs({ { 1, 0 }, { 0, 1 } }) do
                        local nx, ny = x + d[1], y + d[2]
                        if R.inBox(box, nx, ny) then
                            local there = getSquare(nx, ny, z)
                            if walkable(there) then
                                if here:isBlockedTo(there) or here:isWindowTo(there) then
                                    if #edges >= R.MAX_EDGES then return edges, true end
                                    edges[#edges + 1] = { x1 = x, y1 = y, z1 = z, x2 = nx, y2 = ny, z2 = z }
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return edges, false
end

-- Assemble the full Connectivity request. `stairs`/`blockedEdges` are
-- precomputed dense arrays (Connectivity requires them up front; it does
-- not discover them lazily during the flood fill).
function R.build(getSquare, anchor, box, stairs, blockedEdges)
    return {
        anchors = { { x = anchor.x, y = anchor.y, z = anchor.z } },
        passable = function(x, y, z)
            if not R.inBox(box, x, y) then return false end
            return walkable(getSquare(x, y, z))
        end,
        stairs = stairs,
        blockedEdges = blockedEdges,
        maxVisited = Connectivity.DEFAULT_MAX_VISITED,
        maxSteps = Connectivity.DEFAULT_MAX_STEPS,
        stepBudget = Connectivity.DEFAULT_STEP_BUDGET,
    }
end

-- One-call convenience: build the box, discover stairs/edges and assemble
-- the request, or return nil,"reason" if the area was too large to prove
-- safely (never a guessed/partial request).
function R.requestFor(getSquare, anchor, bounds, zLevels)
    local box = R.box(bounds)
    local stairs, stairsCapped = R.stairLinks(getSquare, box, zLevels)
    if stairsCapped then return nil, "too many stair squares in search area" end
    local edges, edgesCapped = R.wallEdges(getSquare, box, zLevels)
    if edgesCapped then return nil, "too many walls in search area" end
    return R.build(getSquare, anchor, box, stairs, edges)
end

return R
