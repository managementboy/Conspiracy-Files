-- Stale clue relocation policy (docs/management/STALE_CLUE_RELOCATION.md).
-- Pure domain: zero PZ runtime dependencies, testable in plain Lua 5.1. The
-- client adapter (GeneratedRuntime) supplies live world observations as
-- plain numbers/booleans; this module only decides what is safe and where.
local Session=require("ConspiracyFiles/Generated/Session")
local M={}
M.RELOCATE_AFTER_HOURS=Session.RELOCATE_AFTER_HOURS
M.PROXIMITY_GUARD_TILES=20

local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end

-- All three staleness conditions from the design doc: placed, undiscovered,
-- and unfound for at least RELOCATE_AFTER_HOURS.
function M.isStale(assignment,known,worldHours)
    if type(assignment)~="table" or assignment.status~="placed" then return false end
    if not finite(assignment.placedHours) or assignment.placedHours<0 then return false end
    if not finite(worldHours) or worldHours<0 then return false end
    if type(known)=="table" then for _,id in ipairs(known) do if id==assignment.id then return false end end end
    return worldHours-assignment.placedHours>=M.RELOCATE_AFTER_HOURS
end

-- Stale document ids of one Session root, in deterministic document order.
function M.staleIds(root,worldHours)
    local out={}
    if type(root)~="table" or type(root.case)~="table" or type(root.assignments)~="table" then return out end
    for _,doc in ipairs(root.case.documents or {}) do
        local a=root.assignments[doc.id]
        if a and M.isStale({status=a.status,placedHours=a.placedHours,id=doc.id},root.known,worldHours) then
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
function M.destinations(root,visited)
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

-- Untouched-item guard: the original container must show exactly one
-- matching physical item (not zero -- possibly carried away or destroyed;
-- not two -- tampered/ambiguous). Player-carrying guard: the same physical
-- token must not be found anywhere in the player's own inventory. Both must
-- hold before a move is safe.
function M.canRelocate(originalContainerCount,playerInventoryCount)
    return originalContainerCount==1 and (playerInventoryCount or 0)==0
end

-- Skip while the player is within the guard radius of either the old or the
-- new target (Chebyshev distance), or on a different floor entirely misses
-- the point -- same floor is required to be "close" at all.
function M.tooClose(px,py,pz,target,radius)
    if pz~=target.z then return false end
    return math.max(math.abs(px-target.x),math.abs(py-target.y))<=(radius or M.PROXIMITY_GUARD_TILES)
end

return M
