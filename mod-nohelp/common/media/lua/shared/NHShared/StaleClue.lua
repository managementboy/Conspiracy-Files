-- Stale clue relocation policy (docs/management/STALE_CLUE_RELOCATION.md).
-- Pure domain: zero PZ runtime dependencies, testable in plain Lua 5.1. The
-- client adapter (GeneratedRuntime) supplies live world observations as
-- plain numbers/booleans; this module only decides what is safe and where.
local Session=require("NHShared/Generated/Session")
local M={}
M.RELOCATE_AFTER_HOURS=Session.RELOCATE_AFTER_HOURS
M.PROXIMITY_GUARD_TILES=20

local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end

-- THE PROMISE CLOCK (owner, 2026-09-27, "How a read map changes the game"):
-- "3 in-game days after a map is read, its marks' unfound, unshown clues
-- begin their silent within-place moves; unread maps' marks stay still."
--
-- readAtBySite: site id -> the earliest hour any map or flyer marking it was
-- read, or false when every map marking it is unread. A site not in the table
-- is not marked by any map or flyer and keeps the ordinary rule. Built by the
-- runtime from the map state's saved read hours (a world event, not belief).
--
-- clockStart returns the hour from which a site's clues may move: nil for an
-- unmarked site (no promise clock), math.huge for a marked site no one has
-- read (never), else the earliest read hour plus `window`.
M.PROMISE_WINDOW_HOURS=M.RELOCATE_AFTER_HOURS
function M.clockStart(siteId,readAtBySite,window)
    if type(readAtBySite)~="table" or siteId==nil then return nil end
    local at=readAtBySite[siteId]
    if at==nil then return nil end
    if at==false or not finite(at) then return math.huge end
    return at+(window or M.PROMISE_WINDOW_HOURS)
end

-- The table above from the static list of map and flyer places
-- (Generated/MapSites `sites`) and the read hours (design or "print:"..flyer
-- -> hour, MapMediaRuntime.readHours). Every marked site gets its earliest
-- read hour, or false when nothing marking it was read.
function M.readAtBySite(sites,readHours)
    local out={}
    readHours=type(readHours)=="table" and readHours or {}
    for _,e in ipairs(type(sites)=="table" and sites or {}) do
        local earliest,marked=nil,false
        for _,m in ipairs(e.marks or {}) do
            local d=m.design or (m.print and "print:"..m.print)
            if d then
                marked=true
                local at=readHours[d]
                if finite(at) and (earliest==nil or at<earliest) then earliest=at end
            end
        end
        if marked and type(e.areaId)=="string" then
            if earliest~=nil then out[e.areaId]=earliest else out[e.areaId]=false end
        end
    end
    return out
end

-- All three staleness conditions from the design doc: placed, undiscovered,
-- and unfound for at least RELOCATE_AFTER_HOURS. With `readAtBySite`, a clue
-- at a map-marked site (assignment.locationId) also waits for the promise
-- clock: stale only once worldHours reaches both placedHours plus
-- RELOCATE_AFTER_HOURS and the site's clockStart. After a move the ordinary
-- rule restarts from the new placedHours, so moves never come in a burst.
function M.isStale(assignment,known,worldHours,readAtBySite)
    if type(assignment)~="table" or assignment.status~="placed" then return false end
    if not finite(assignment.placedHours) or assignment.placedHours<0 then return false end
    if not finite(worldHours) or worldHours<0 then return false end
    if type(known)=="table" then for _,id in ipairs(known) do if id==assignment.id then return false end end end
    local start=M.clockStart(assignment.locationId,readAtBySite)
    if start~=nil and (start==math.huge or worldHours<start) then return false end
    return worldHours-assignment.placedHours>=M.RELOCATE_AFTER_HOURS
end

-- Stale document ids of one Session root, in deterministic document order. A
-- clue the Search Mode icon has shown never moves (root.shown, owner
-- 2026-09-27), so it is never offered as stale.
function M.staleIds(root,worldHours,readAtBySite)
    local out={}
    if type(root)~="table" or type(root.case)~="table" or type(root.assignments)~="table" then return out end
    for _,doc in ipairs(root.case.documents or {}) do
        local a=root.assignments[doc.id]
        if a and not (type(root.shown)=="table" and root.shown[doc.id]) and M.isStale({status=a.status,placedHours=a.placedHours,
                id=doc.id,locationId=a.locationId or doc.locationId},root.known,worldHours,readAtBySite) then
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

return M
