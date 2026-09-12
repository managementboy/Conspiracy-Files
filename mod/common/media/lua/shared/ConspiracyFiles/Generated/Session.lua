local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local RoomAffinity=require("ConspiracyFiles/Generated/RoomAffinity")
local S={}
-- Stale clue relocation (docs/management/STALE_CLUE_RELOCATION.md): a placed,
-- undiscovered document gets one new home after going unfound this long.
-- Single named constant per the design doc; relocations are capped so a
-- document cannot churn forever.
S.RELOCATE_AFTER_HOURS=72
S.RELOCATE_CAP=3
local function copy(v) if type(v)~="table" then return v end local out={} for k,c in pairs(v) do out[k]=copy(c) end return out end
local function fields(t,allowed)
    if type(t)~="table" then return false end
    for k in pairs(t) do if not allowed[k] then return false end end
    return true
end
local function integer(n) return type(n)=="number" and n==math.floor(n) and math.abs(n)<1000000 end
-- How far outside a site's own footprint a vehicle may be and still count as
-- belonging to it. Sites are room rectangles INSIDE buildings and cars are in
-- driveways, which is the one real mismatch in treating a vehicle as a place.
-- Twelve tiles is a driveway, a verge or a kerb; it is not the next street.
S.VEHICLE_RADIUS=12
S.VEHICLE_CONTAINER="vehicle"
-- A vehicle target names a part and carries the mark the runtime stamps on it.
-- It is addressed by that mark rather than by a parking space, because only
-- the player can move a car and the clue travels with them when they do.
local function vehicleTarget(t) return type(t)=="table" and type(t.vehiclePart)=="string" end
function S.target(t,site)
    if vehicleTarget(t) then
        if not fields(t,{x=true,y=true,z=true,objectIndex=true,containerIndex=true,containerType=true,
                         sprite=true,vehiclePart=true,vehicleMark=true}) then return false end
        for _,k in ipairs({"x","y","z","objectIndex","containerIndex"}) do if not integer(t[k]) then return false end end
        if t.objectIndex~=0 or t.containerIndex~=0 then return false end
        if type(t.sprite)~="string" or #t.sprite>300 then return false end
        if #t.vehiclePart==0 or #t.vehiclePart>60 then return false end
        if t.vehicleMark~=nil and (type(t.vehicleMark)~="string" or #t.vehicleMark>300) then return false end
        if t.containerType~=S.VEHICLE_CONTAINER then return false end
        local b=site.bounds
        local r=S.VEHICLE_RADIUS
        if t.x<b.x1-r or t.x>=b.x2+r or t.y<b.y1-r or t.y>=b.y2+r or t.z~=b.z then return false end
        for _,kind in ipairs(site.containerTypes) do if kind==S.VEHICLE_CONTAINER then return true end end
        return false
    end
    if not fields(t,{x=true,y=true,z=true,objectIndex=true,containerIndex=true,containerType=true,sprite=true}) then return false end
    for _,k in ipairs({"x","y","z","objectIndex","containerIndex"}) do if not integer(t[k]) then return false end end
    if t.objectIndex<0 or t.containerIndex<0 or type(t.sprite)~="string" or #t.sprite>300 then return false end
    local b=site.bounds
    if t.x<b.x1 or t.x>=b.x2 or t.y<b.y1 or t.y>=b.y2 or t.z~=b.z then return false end
    for _,kind in ipairs(site.containerTypes) do if kind==t.containerType then return true end end
    return false
end
function S.validate(root)
    local ok,why=V.validateStructure(root); if not ok then return false,why end
    if not fields(root,{schema=true,case=true,assignments=true,known=true}) or root.schema~=1 then return false,"invalid generated session" end
    ok,why=G.validate(root.case); if not ok then return false,why end
    if type(root.assignments)~="table" or type(root.known)~="table" then return false,"missing session fields" end
    local ids,sites={},{}
    for _,s in ipairs(root.case.locations) do sites[s.id]=s end
    for _,d in ipairs(root.case.documents) do
        ids[d.id]=true
        local a=root.assignments[d.id]
        if not fields(a,{physicalToken=true,target=true,status=true,placedHours=true,relocations=true,locationId=true}) or a.physicalToken~="cf-g2:"..d.id
            or not ({pending=true,placing=true,placed=true,unknown=true,conflict=true})[a.status] then return false,"invalid assignment" end
        -- Relocation moves the physical object, never the document's own
        -- narrative locationId: a present `locationId` is the assignment's
        -- current site once it differs from where the case first placed it.
        if a.locationId~=nil and (type(a.locationId)~="string" or not sites[a.locationId]) then return false,"invalid assignment" end
        if not S.target(a.target,sites[a.locationId or d.locationId]) then return false,"invalid assignment" end
        if not integer(a.relocations) or a.relocations<0 or a.relocations>S.RELOCATE_CAP then return false,"invalid assignment" end
        local function validHours(h) return type(h)=="number" and h==h and h~=math.huge and h~=-math.huge and h>=0 end
        if a.status=="placed" and not validHours(a.placedHours) then return false,"invalid assignment" end
        if a.placedHours~=nil and not validHours(a.placedHours) then return false,"invalid assignment" end
    end
    for id in pairs(root.assignments) do if not ids[id] then return false,"extra assignment" end end
    local seen,n={},0
    for k,id in pairs(root.known) do
        if not integer(k) or k<1 or k>#root.case.documents or not ids[id] or seen[id] then return false,"invalid discoveries" end
        seen[id]=true; n=n+1
    end
    for i=1,n do if not root.known[i] then return false,"sparse discoveries" end end
    if V.estimateEncodedBytes(root)>500000 then return false,"canonical size exceeded" end
    return true
end
function S.create(case,targets,documentTargets)
    local root={schema=1,case=copy(case),assignments={},known={}}
    for _,d in ipairs(case.documents) do root.assignments[d.id]={physicalToken="cf-g2:"..d.id,target=copy(documentTargets and documentTargets[d.id] or targets[d.locationId]),status="pending",relocations=0} end
    local ok,why=S.validate(root); if not ok then return nil,why end
    return root
end
-- `rooms` is OPTIONAL (Phase 2, docs/design/USING_GAME_ASSETS.md): when it is
-- omitted this runs the exact original counts-indexed loop below, so
-- behaviour is byte-identical to before Phase 2 existed. When `rooms` is
-- supplied (rooms[siteId][candidateIndex] -> room name, from
-- Generated/Storage.scan), each document instead prefers the first unused
-- candidate at its site whose room fits its `kind` (Generated/RoomAffinity),
-- and falls back to the first unused candidate -- in the same order the
-- omitted-rooms loop would have picked -- whenever nothing fits. This is
-- ordering only: S.target's allow-list and the distinct/repeated-container
-- checks below are untouched, so a stored target is unaffected by whether a
-- room fit.
local function physicalKey(target)
    return table.concat({target.x,target.y,target.z,target.objectIndex,target.containerIndex,
                         target.vehiclePart or "-"},":")
end
function S.createDistributed(case,candidates,rooms,occupied)
    local valid,why=G.validate(case);if not valid then return nil,why end
    local sites,used,counts,taken,targets={},{},{},{},{}
    for _,site in ipairs(case.locations) do sites[site.id]=site end
    for _,doc in ipairs(case.documents) do
        local list=type(candidates)=="table" and candidates[doc.locationId]
        local target
        -- The original counts-indexed path runs only when NEITHER hint is
        -- supplied, so behaviour is byte-identical to before either existed.
        -- Testing occupancy alone caught this: gating on `rooms` made the
        -- preference inert whenever room names were absent.
        if rooms==nil and occupied==nil then
            counts[doc.locationId]=(counts[doc.locationId] or 0)+1
            target=type(list)=="table" and list[counts[doc.locationId]]
        else
            taken[doc.locationId]=taken[doc.locationId] or {}
            local siteTaken=taken[doc.locationId]
            local roomsForSite=type(rooms)=="table" and rooms[doc.locationId]
            local index
            -- Only ever choose a candidate that would validate anyway. The
            -- sequential path reaches candidates 1..n in order, so an invalid
            -- entry later in the list could never be selected; preferring by
            -- room can reach further in, so it must check rather than rely on
            -- Storage.scan happening to emit only in-bounds candidates.
            local site=sites[doc.locationId]
            -- Not already given to another site either. A car parked between
            -- the case's two buildings is a candidate at both (2026-09-11
            -- playtest: "repeated physical container" the first time vehicles
            -- were actually found).
            local function usable(i)
                return not siteTaken[i] and S.target(list[i],site) and not used[physicalKey(list[i])]
            end
            -- `occupied` is OPTIONAL and is a preference, never a filter. A
            -- document left alone in an empty drawer is the thing that reads
            -- as placed by software; among somebody's belongings it reads as
            -- part of the house. So a container that already holds something
            -- is preferred, and a site with nothing but empty containers still
            -- gets its document rather than deferring.
            --
            -- Order of preference: fits the room AND lived-in, then fits the
            -- room, then lived-in, then first usable - which is exactly what
            -- the loops below did before this existed, so omitting `occupied`
            -- and `rooms` leaves the original behaviour untouched.
            local occupiedForSite=type(occupied)=="table" and occupied[doc.locationId]
            local function livedIn(i)
                return type(occupiedForSite)=="table" and occupiedForSite[i]==true
            end
            if type(list)=="table" and type(roomsForSite)=="table" then
                for i in ipairs(list) do
                    if usable(i) and RoomAffinity.prefers(doc,roomsForSite[i]) and livedIn(i) then index=i;break end
                end
                if not index then
                    for i in ipairs(list) do
                        if usable(i) and RoomAffinity.prefers(doc,roomsForSite[i]) then index=i;break end
                    end
                end
            end
            if not index and type(list)=="table" and type(occupiedForSite)=="table" then
                for i=1,#list do if usable(i) and livedIn(i) then index=i;break end end
            end
            if not index and type(list)=="table" then
                for i=1,#list do if usable(i) then index=i;break end end
            end
            if index then siteTaken[index]=true end
            target=index and list[index]
        end
        if not S.target(target,sites[doc.locationId]) then return nil,"not enough distinct suitable containers" end
        -- Two documents may share a car but never a part, so the part joins
        -- the uniqueness key: without it, a glovebox and a boot at the same
        -- parking square would look like one container.
        local key=physicalKey(target)
        if used[key] then return nil,"repeated physical container" end
        used[key]=true;targets[doc.id]=target
    end
    return S.create(case,{},targets)
end
function S.open(initial,sink)
    local ok,why=S.validate(initial); if not ok then return nil,why end
    local root=copy(initial); local api={}
    local function commit(change)
        local next=copy(root); change(next)
        local valid,err=S.validate(next); if not valid then return false,err end
        local saved,failure=pcall(sink,copy(next)); if not saved then return false,tostring(failure) end
        root=next; return true
    end
    function api.snapshot() return copy(root) end
    function api.assignment(id) return copy(root.assignments[id]) end
    local function validHours(h) return type(h)=="number" and h==h and h~=math.huge and h~=-math.huge and h>=0 end
    -- `hours` is the world clock reading at the moment placement is observed
    -- to succeed; it seeds `placedHours` for stale-clue relocation staleness
    -- checks. Callers that only reconcile an already-known status (tests,
    -- periodic identity checks) may omit it; a prior value, or zero on first
    -- placement, is kept rather than rejecting the call.
    function api.status(id,status,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status=="conflict" and status~="conflict" then return false,"sticky conflict" end
        if status=="pending" or (status=="placing" and a.status~="pending") then return false,"cannot reset placement" end
        -- Periodic identity reconciliation often reports the same status.
        -- Avoid serializing and replacing the whole case when nothing changed.
        if a.status==status then return true end
        if status=="placed" then
            local at=hours; if at==nil then at=a.placedHours or 0 end
            if not validHours(at) then return false,"invalid placement hours" end
            return commit(function(r) r.assignments[id].status=status; r.assignments[id].placedHours=at end)
        end
        return commit(function(r) r.assignments[id].status=status end)
    end
    -- Relocation keeps status "placed" (never resets placement) and instead
    -- moves the physical target, resets the staleness clock and counts
    -- against the per-document cap. Revalidates the whole root through the
    -- same commit path as every other canonical mutation.
    function api.relocate(id,target,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status~="placed" then return false,"can only relocate a placed document" end
        if not validHours(hours) then return false,"invalid relocation hours" end
        if a.relocations>=S.RELOCATE_CAP then return false,"relocation cap reached" end
        local site
        for _,s in ipairs(root.case.locations) do if S.target(target,s) then site=s end end
        if not site then return false,"relocation target does not match a known location" end
        return commit(function(r)
            local ra=r.assignments[id]
            ra.target=copy(target); ra.placedHours=hours; ra.relocations=ra.relocations+1; ra.locationId=site.id
        end)
    end
    function api.inspect(id)
        if not root.assignments[id] or root.assignments[id].status~="placed" then return false,"document unavailable" end
        for _,known in ipairs(root.known) do if known==id then return true end end
        return commit(function(r) r.known[#r.known+1]=id end)
    end
    function api.project() return G.project(root.case,root.known) end
    return api
end
return S
