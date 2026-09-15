-- PZ-facing glue for ConspiracyFiles/ReachabilityRequest + Connectivity.
-- Every engine call here is cited in docs/research/B42_RUNTIME_PASSABILITY.md.
-- Never writes canonical state or world items; read-only.
local Connectivity = require("ConspiracyFiles/Connectivity")
local Req = require("ConspiracyFiles/ReachabilityRequest")
local A = {}

-- The 3 declared z-levels a search covers: ground, and the site's own
-- (already-known-negative) minimum level. Build 42 basements observed so
-- far are one level deep (docs/research/B42_RUNTIME_BASEMENTS.md); a site
-- reporting a deeper minimum still only gets these two levels searched --
-- see the research note's "Known limitation" section.
local function zLevelsFor(bounds)
    if bounds.z == 0 then return { 0 } end
    return { 0, bounds.z }
end

local function getSquare(x, y, z)
    local cell = getCell and getCell()
    if not cell then return nil end
    local ok, square = pcall(cell.getGridSquare, cell, x, y, z)
    if not ok then return nil end
    return square
end
A.getSquare = getSquare

-- Sites with a below-ground minimum level, derived straight from the raw
-- T3-nearby-2 rows (the same rows NearbyCatalog.fromResult reads), so this
-- can run before the catalog/candidates exist. Returns an array of
-- {id="t3:<building id>", bounds={x1,y1,x2,y2,z=minLevel}}.
function A.basementSites(result)
    local sites = {}
    if type(result) ~= "table" or type(result.rows) ~= "table" then return sites end
    for _, row in ipairs(result.rows) do
        if row.kind == "building" and type(row.minLevel) == "number" and row.minLevel < 0 then
            sites[#sites + 1] = { id = "t3:" .. tostring(row.id),
                bounds = { x1 = row.x, y1 = row.y, x2 = row.x2, y2 = row.y2, z = row.minLevel } }
        end
    end
    return sites
end

-- Start (or resume) one bounded, incremental reachability search for
-- `site` anchored at `anchorSquare` (must be where the player is actually
-- standing -- provably a walkable square). Returns a step function with the
-- Scheduler convention (false=more work, true=done -- `done` already
-- called), or nil,reason if the search area could not be proven safe to
-- scan at all.
function A.search(anchorSquare, site, done)
    if not anchorSquare then return nil, "no anchor square" end
    local anchor = { x = math.floor(anchorSquare:getX()), y = math.floor(anchorSquare:getY()), z = math.floor(anchorSquare:getZ()) }
    local zLevels = zLevelsFor(site.bounds)
    local request, why = Req.requestFor(getSquare, anchor, site.bounds, zLevels)
    if not request then return nil, why end
    return Connectivity.search(request, done)
end

-- Drive every entry in `sites` to completion (each through its own bounded
-- incremental search), merging every *proven* (completed==true) reachable
-- square into `intoCache` as "x:y:z"=true. Returns a Scheduler-compatible
-- step function; calls `onAllDone` exactly once, after the last site.
-- An individual site that cannot be searched safely (too large) or whose
-- search does not complete in budget simply contributes nothing -- its
-- candidates stay unproven, never guessed.
function A.reachabilityJob(sites, anchorSquare, intoCache, onAllDone)
    local index = 1
    local step
    return function()
        if index > #sites then onAllDone(); return true end
        local site = sites[index]
        if not step then
            local why
            step, why = A.search(anchorSquare, site, function(result)
                if result and result.completed then
                    for k in pairs(result.squares) do intoCache[k] = true end
                end
            end)
            if not step then index = index + 1; return false end
        end
        local finished = step()
        if finished then step = nil; index = index + 1 end
        return false
    end
end

-- Build the `reachable(x,y,z)` predicate Storage.scan gates non-ground
-- candidates with. Ground level (z==0) is always true -- it was never part
-- of the regression this module fixes, and is left exactly as before.
function A.predicate(cache)
    return function(x, y, z)
        if z == 0 then return true end
        return cache[x .. ":" .. y .. ":" .. z] == true
    end
end

return A
