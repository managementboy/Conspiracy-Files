-- Stale clue relocation policy (docs/management/STALE_CLUE_RELOCATION.md).
-- Pure domain: zero PZ runtime dependencies, testable in plain Lua 5.1. The
-- client adapter (GeneratedRuntime) supplies live world observations as
-- plain numbers/booleans; this module only decides what is safe and where.
local Session=require("NHShared/Generated/Session")
local M={}
M.RELOCATE_AFTER_HOURS=Session.RELOCATE_AFTER_HOURS
M.PROXIMITY_GUARD_TILES=20

local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end

-- All three staleness conditions from the design doc: placed, undiscovered,
-- and unfound for at least RELOCATE_AFTER_HOURS, at every place alike. Reading
-- a map starts no clock (owner, 2026-09-27: "what does arriving late mean? No
-- player is in a hurry in PZ"). After a move the rule restarts from the new
-- placedHours, so moves never come in a burst.
function M.isStale(assignment,known,worldHours)
    if type(assignment)~="table" or assignment.status~="placed" then return false end
    if not finite(assignment.placedHours) or assignment.placedHours<0 then return false end
    if not finite(worldHours) or worldHours<0 then return false end
    if type(known)=="table" then for _,id in ipairs(known) do if id==assignment.id then return false end end end
    return worldHours-assignment.placedHours>=M.RELOCATE_AFTER_HOURS
end

-- Stale document ids of one Session root, in deterministic document order. A
-- clue the Search Mode icon has shown never moves (root.shown, owner
-- 2026-09-27), so it is never offered as stale.
function M.staleIds(root,worldHours)
    local out={}
    if type(root)~="table" or type(root.case)~="table" or type(root.assignments)~="table" then return out end
    for _,doc in ipairs(root.case.documents or {}) do
        local a=root.assignments[doc.id]
        if a and not (type(root.shown)=="table" and root.shown[doc.id]) and M.isStale({status=a.status,placedHours=a.placedHours,
                id=doc.id},root.known,worldHours) then
            out[#out+1]=doc.id
        end
    end
    return out
end

function M.canAttempt(assignment)
    return type(assignment)=="table" and type(assignment.relocations)=="number"
        and assignment.relocations<Session.RELOCATE_CAP
end

-- A destination site: belongs to the case's own catalog locations, is not
-- one the player has visited, and currently holds no other placed clue
-- (including the document being relocated, since moving within the same
-- building would not help). Deterministic order for reproducible choices.
function M.destinations(root,visited,id)
    -- NO HELP: a clue belongs to its area and never leaves it, so its only
    -- destination is its own site; the Session then holds the move to the
    -- same kind of spot, never a spent spot, never after it was shown.
    if type(root.case)=="table" and root.case.kind=="nohelp-areas" then
        for _,d in ipairs(root.case.documents) do
            if d.id==id then
                for _,site in ipairs(root.case.locations) do if site.id==d.locationId then return {site} end end
            end
        end
        return {}
    end
    local occupied={}
    for _,doc in ipairs(root.case.documents) do
        local a=root.assignments[doc.id]
        if a and a.status=="placed" then occupied[a.locationId or doc.locationId]=true end
    end
    local out={}
    for _,site in ipairs(root.case.locations) do
        if not (visited and visited[site.id]) and not occupied[site.id] then out[#out+1]=site end
    end
    table.sort(out,function(a,b) return a.id<b.id end)
    return out
end

-- Untouched-item guard: the original container must show exactly the
-- clue's own number of matching physical items - one for a single item, every
-- piece for an object set (owner, 2026-09-27: a set moves whole or not at
-- all). Fewer means something was carried away or destroyed; more means
-- tampered or ambiguous. Player-carrying guard: the same physical token must
-- not be found anywhere in the player's own inventory. Both must hold before a
-- move is safe.
function M.canRelocate(originalContainerCount,playerInventoryCount,expected)
    return originalContainerCount==(expected or 1) and (playerInventoryCount or 0)==0
end

-- Skip while the player is within the guard radius of either the old or the
-- new target (Chebyshev distance), or on a different floor entirely misses
-- the point -- same floor is required to be "close" at all.
function M.tooClose(px,py,pz,target,radius)
    if pz~=target.z then return false end
    return math.max(math.abs(px-target.x),math.abs(py-target.y))<=(radius or M.PROXIMITY_GUARD_TILES)
end

-- May a clue appear at a spot the survivor could look at (open ground, a
-- body)? Yes on another floor, beyond the guard radius, or where the square
-- is not visible to them (owner, 2026-09-27: objects come into the world as
-- the player approaches, "in spots the player cannot see"). `visible` is the
-- engine's answer for that square (IsoGridSquare:isCouldSee / isCanSee);
-- anything but false counts as visible, so an unreadable answer falls back
-- to the plain guard radius. A closed container needs none of this: nobody
-- sees into it, and only its open loot window refuses (FixedContainers.fresh).
function M.outOfSight(px,py,pz,target,visible,radius)
    if not M.tooClose(px,py,pz,target,radius) then return true end
    return visible==false
end

return M
