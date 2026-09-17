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
-- INSTALMENTS (P4-R133, docs/design/CASE_PACING.md). A case goes live with the
-- clues that fit now; the rest are an open order. A `deferred` assignment has
-- no target and no sprite - only the site it is meant for, named by the
-- locationId the schema already validates - and the filler gives it one as the
-- survivor moves about and more of the world loads.
--
-- A clue that cannot be placed within three in-game days is `dropped`: the
-- case then completes on the clues it got, because a half-placed case that
-- squats one of the four active slots blocks new cases worse than the refusal
-- this whole change exists to fix.
S.DEFER_EXPIRE_HOURS=72
local WAITING={deferred=true,dropped=true}
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
-- CLUES ON THE MOVE (P4-R134, docs/design/CLUES_ON_THE_MOVE.md). A third target
-- shape beside the fixed container and the car part: a CARRIER - a fresh corpse
-- or a wandering zombie the world already put in reach. Like a car part it is
-- addressed by a mark of ours rather than by a square, because it need not stay
-- where it was found; unlike a car part the mark names the CARRIER, so the
-- distinctness register below can refuse a second clue on one body (P4-R67).
S.CARRIER_CONTAINER="carrier"
S.CARRIER_KINDS={corpse=true,zombie=true}
-- How far outside a site's own footprint a carrier may be. Sites are room
-- rectangles inside buildings and a body lies in the yard or at the kerb; the
-- same twelve tiles a car in the driveway gets, for the same reason. A clue
-- must stay findable from the address the case names.
S.CARRIER_RADIUS=12
-- AT MOST ONE MOBILE CLUE PER CASE. A car, a body and a zombie can all leave
-- the address the case names. One such find is better than the twelfth
-- cupboard; a case whose every clue walks away is not an investigation.
S.MOBILE_PER_CASE=1
local function carrierTarget(t) return type(t)=="table" and type(t.carrierMark)=="string" end
-- Does this target travel? Both kinds of carrier, for the cap above.
function S.isMobile(target)
    return vehicleTarget(target) or carrierTarget(target)
end
-- Which of a case's clues may be the mobile one, when the choice is deliberate
-- rather than a fallback: the LAST document, so the opening clue - the one the
-- first house must always supply (P4-R67) - is never the one that drives off.
function S.mobileDocId(case)
    local docs=type(case)=="table" and case.documents
    if type(docs)~="table" or #docs==0 then return nil end
    return docs[#docs].id
end
-- How many of this case's clues are already on something that moves.
function S.mobileCount(root)
    local n=0
    for _,a in pairs(type(root)=="table" and root.assignments or {}) do
        if S.isMobile(a.target) then n=n+1 end
    end
    return n
end
-- May this clue take a carrier? The cap is the whole of it: at creation the
-- case names which clue may be mobile (above), but a clue that has waited with
-- nowhere to go takes whatever is left, and a carrier is the one thing that
-- does not run out near a settled player - which is the fault P4-R133 named.
function S.mobileAllowed(root,id)
    local a=type(root)=="table" and root.assignments and root.assignments[id]
    if not a or S.isMobile(a.target) then return false end
    return S.mobileCount(root)<S.MOBILE_PER_CASE
end
function S.target(t,site)
    if carrierTarget(t) then
        -- `sprite` is the carrier's kind in words: a body has no sprite, and
        -- the diagnostics print this field for every target there is.
        if not fields(t,{x=true,y=true,z=true,objectIndex=true,containerIndex=true,containerType=true,
                         sprite=true,carrierKind=true,carrierMark=true}) then return false end
        for _,k in ipairs({"x","y","z","objectIndex","containerIndex"}) do if not integer(t[k]) then return false end end
        if t.objectIndex~=0 or t.containerIndex~=0 then return false end
        if type(t.sprite)~="string" or #t.sprite>300 then return false end
        if not S.CARRIER_KINDS[t.carrierKind] then return false end
        if #t.carrierMark==0 or #t.carrierMark>120 then return false end
        if t.containerType~=S.CARRIER_CONTAINER then return false end
        -- A carrier is NOT checked against the site's `containerTypes`, and a
        -- car part is. That list records the fixed storage the scan observed in
        -- the building; a body in the yard is not the building's furniture and
        -- never will be listed there, so requiring it would make a carrier
        -- clue unplaceable in principle. The kind, the mark and the footprint
        -- are the whole of what makes a carrier target valid.
        local b=site.bounds
        local r=S.CARRIER_RADIUS
        if t.x<b.x1-r or t.x>=b.x2+r or t.y<b.y1-r or t.y>=b.y2+r or t.z~=b.z then return false end
        return true
    end
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
    if not fields(root,{schema=true,case=true,assignments=true,known=true,recognised=true}) or root.schema~=1 then return false,"invalid generated session" end
    ok,why=G.validate(root.case); if not ok then return false,why end
    if type(root.assignments)~="table" or type(root.known)~="table" then return false,"missing session fields" end
    local ids,sites={},{}
    for _,s in ipairs(root.case.locations) do sites[s.id]=s end
    for _,d in ipairs(root.case.documents) do
        ids[d.id]=true
        local a=root.assignments[d.id]
        if not fields(a,{physicalToken=true,target=true,status=true,placedHours=true,relocations=true,
                         locationId=true,deferredHours=true,missingHours=true}) or a.physicalToken~="cf-g2:"..d.id
            or not ({pending=true,placing=true,placed=true,unknown=true,conflict=true,
                     deferred=true,dropped=true})[a.status] then return false,"invalid assignment" end
        -- Relocation moves the physical object, never the document's own
        -- narrative locationId: a present `locationId` is the assignment's
        -- current site once it differs from where the case first placed it.
        if a.locationId~=nil and (type(a.locationId)~="string" or not sites[a.locationId]) then return false,"invalid assignment" end
        local function validHours(h) return type(h)=="number" and h==h and h~=math.huge and h~=-math.huge and h>=0 end
        if WAITING[a.status] then
            -- A clue still waiting for somewhere to go (P4-R133): no target at
            -- all, the intended site named, and the hour the wait started, so
            -- three in-game days can be measured against it. Nothing about it
            -- may claim a physical place: that is the whole difference.
            if a.target~=nil or a.placedHours~=nil then return false,"invalid assignment" end
            if type(a.locationId)~="string" or not sites[a.locationId] then return false,"invalid assignment" end
            if not validHours(a.deferredHours) then return false,"invalid assignment" end
        else
            if a.deferredHours~=nil then return false,"invalid assignment" end
            if not S.target(a.target,sites[a.locationId or d.locationId]) then return false,"invalid assignment" end
            if a.status=="placed" and not validHours(a.placedHours) then return false,"invalid assignment" end
            if a.placedHours~=nil and not validHours(a.placedHours) then return false,"invalid assignment" end
        end
        -- A CARRIER THAT IS GONE (P4-R134): the in-game hour we first could not
        -- find the body, the zombie or the car, so three days can be measured
        -- against it exactly as they are for a clue that never found a
        -- container. Only ever on a clue that is really out there on something
        -- that moves: a cupboard cannot go missing.
        if a.missingHours~=nil then
            if WAITING[a.status] or not validHours(a.missingHours) or not S.isMobile(a.target) then
                return false,"invalid assignment"
            end
        end
        if not integer(a.relocations) or a.relocations<0 or a.relocations>S.RELOCATE_CAP then return false,"invalid assignment" end
    end
    for id in pairs(root.assignments) do if not ids[id] then return false,"extra assignment" end end
    local seen,n={},0
    for k,id in pairs(root.known) do
        if not integer(k) or k<1 or k>#root.case.documents or not ids[id] or seen[id] then return false,"invalid discoveries" end
        -- A clue that was never put anywhere cannot have been found.
        if WAITING[root.assignments[id].status] then return false,"invalid discoveries" end
        seen[id]=true; n=n+1
    end
    for i=1,n do if not root.known[i] then return false,"sparse discoveries" end end
    -- Recognised clues (P4-R132): spotted in Search Mode or looked over, so the
    -- item now shows as evidence. Optional, a dense list of distinct document
    -- ids, in the order they were recognised. Noting implies recognising, so a
    -- known id need not be listed twice.
    if root.recognised~=nil then
        if type(root.recognised)~="table" then return false,"invalid recognition" end
        local rseen,rn={},0
        for k,id in pairs(root.recognised) do
            if not integer(k) or k<1 or k>#root.case.documents or not ids[id] or rseen[id] then return false,"invalid recognition" end
            -- Nor can one be looked over: it is not in the world yet.
            if WAITING[root.assignments[id].status] then return false,"invalid recognition" end
            rseen[id]=true; rn=rn+1
        end
        for i=1,rn do if not root.recognised[i] then return false,"invalid recognition" end end
    end
    if V.estimateEncodedBytes(root)>500000 then return false,"canonical size exceeded" end
    return true
end
-- `hours` is the world clock, and is only ever read for a document that has no
-- target: that clue goes in as `deferred` and the filler places it later
-- (P4-R133). A caller that supplies every target never needs it.
function S.create(case,targets,documentTargets,hours)
    local root={schema=1,case=copy(case),assignments={},known={}}
    for _,d in ipairs(case.documents) do
        local target=documentTargets and documentTargets[d.id] or targets[d.locationId]
        if target==nil then
            root.assignments[d.id]={physicalToken="cf-g2:"..d.id,status="deferred",
                locationId=d.locationId,deferredHours=hours or 0,relocations=0}
        else
            root.assignments[d.id]={physicalToken="cf-g2:"..d.id,target=copy(target),status="pending",relocations=0}
        end
    end
    local ok,why=S.validate(root); if not ok then return nil,why end
    return root
end
-- The clues still waiting for somewhere to go, in document order so the filler
-- takes them in the order the case tells them.
function S.deferredIds(root)
    local out={}
    if type(root)~="table" or type(root.case)~="table" or type(root.assignments)~="table" then return out end
    for _,d in ipairs(root.case.documents or {}) do
        local a=root.assignments[d.id]
        if a and a.status=="deferred" then out[#out+1]=d.id end
    end
    return out
end
-- Those that have waited three in-game days and are to be dropped.
function S.expiredIds(root,hours)
    local out={}
    if type(hours)~="number" or hours~=hours or hours==math.huge then return out end
    for _,id in ipairs(S.deferredIds(root)) do
        local a=root.assignments[id]
        if hours-a.deferredHours>=S.DEFER_EXPIRE_HOURS then out[#out+1]=id end
    end
    return out
end
-- The clues whose carrier has been missing for three in-game days (P4-R134):
-- the zombie walked into a horde, the body burned, the car was wrecked. They
-- share P4-R133's expiry to the hour, because the survivor's position is the
-- same either way - there is nothing there to find and never will be.
function S.missingIds(root,hours)
    local out={}
    if type(hours)~="number" or hours~=hours or hours==math.huge then return out end
    if type(root)~="table" or type(root.case)~="table" then return out end
    local known={}
    for _,id in ipairs(root.known or {}) do known[id]=true end
    for _,d in ipairs(root.case.documents or {}) do
        local a=root.assignments and root.assignments[d.id]
        if a and type(a.missingHours)=="number" and not WAITING[a.status] and not known[d.id]
            and hours-a.missingHours>=S.DEFER_EXPIRE_HOURS then out[#out+1]=d.id end
    end
    return out
end
-- Is every clue of this case accounted for? A found clue is; a dropped one is
-- too - it was never in the world and never will be. A deferred one is NOT,
-- which is what stops "nothing left to find" and the closing question firing
-- while a clue is still unwritten (P4-R133).
function S.accounted(root)
    if type(root)~="table" or type(root.case)~="table" then return false end
    local known={}
    for _,id in ipairs(root.known or {}) do known[id]=true end
    for _,d in ipairs(root.case.documents) do
        local a=root.assignments[d.id]
        if not known[d.id] and not (a and a.status=="dropped") then return false end
    end
    return true
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
-- One container, named so nothing else can claim it: the square, the object and
-- container index on it, and the vehicle part where there is one. Exported
-- because the filler (GeneratedRuntime) must check a late clue's container
-- against every clue already placed, in any case, live or finished.
function S.physicalKey(target)
    -- A CARRIER is keyed on its own mark and nothing else (P4-R134). Two bodies
    -- may lie on one square and a zombie stays on no square at all, so a square
    -- cannot name a carrier; the mark can, and does, which is what makes "never
    -- two clues on one carrier" the same check as "never two clues in one
    -- cupboard" (P4-R67).
    if type(target.carrierMark)=="string" then return "carrier:"..target.carrierMark end
    return table.concat({target.x,target.y,target.z,target.objectIndex,target.containerIndex,
                         target.vehiclePart or "-"},":")
end
local physicalKey=S.physicalKey
-- Returns the root and, second, the ids it could NOT place - the open order
-- (P4-R133). It no longer fails for want of containers: a case goes live with
-- the clues that fit and the rest wait as `deferred` assignments. It still
-- fails for a case that is not a case (an invalid envelope), and it still
-- never puts two clues in one container (P4-R67).
function S.createDistributed(case,candidates,rooms,occupied,hours)
    local valid,why=G.validate(case);if not valid then return nil,why end
    local sites,used,counts,taken,targets={},{},{},{},{}
    local deferred={}
    for _,site in ipairs(case.locations) do sites[site.id]=site end
    -- At most one mobile clue per case, and the case says which (P4-R134): the
    -- last document may take a car part or a carrier, and every other clue
    -- takes a fixed container or waits for one. A car used to be whatever was
    -- left over, so a case could end up with three of its clues driving about.
    local mobileDoc=S.mobileDocId(case)
    local mobile=0
    local function mobileOK(doc,target)
        if not S.isMobile(target) then return true end
        return doc.id==mobileDoc and mobile<S.MOBILE_PER_CASE
    end
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
            -- The one addition to the original path: the mobile cap applies
            -- here too, so a case cannot collect three car clues merely because
            -- nobody passed a hint (P4-R134). A refused candidate defers, which
            -- is what a shortage has meant since P4-R133.
            if not mobileOK(doc,target) then target=nil end
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
                    and mobileOK(doc,list[i])
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
            -- The deliberate choice (P4-R134, build order 4): the one clue that
            -- MAY be mobile takes a car part or a carrier when one is offered,
            -- rather than getting one only because nothing else was left. A
            -- note in a glovebox at the address is a better find than the
            -- twelfth cupboard in the same house; the cap above is what keeps
            -- it to one.
            if type(list)=="table" and doc.id==mobileDoc then
                for i=1,#list do if S.isMobile(list[i]) and usable(i) then index=i;break end end
            end
            if not index and type(list)=="table" and type(roomsForSite)=="table" then
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
        -- Nothing usable at this site right now: the clue waits rather than the
        -- whole case being thrown away. This is the fault P4-R133 was written
        -- for - standing still exhausts the loaded area, and a house yields one
        -- candidate from the street and eight once the survivor walks in.
        if not S.target(target,sites[doc.locationId]) then
            deferred[#deferred+1]=doc.id
        else
            -- Two documents may share a car but never a part, so the part joins
            -- the uniqueness key: without it, a glovebox and a boot at the same
            -- parking square would look like one container.
            local key=physicalKey(target)
            if used[key] then return nil,"repeated physical container" end
            used[key]=true;targets[doc.id]=target
            if S.isMobile(target) then mobile=mobile+1 end
        end
    end
    local root,why=S.create(case,{},targets,hours)
    if not root then return nil,why end
    return root,deferred
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
        -- A clue with no container has no placement to reconcile: only
        -- api.assign (an instalment arriving) or api.drop (it expired) may
        -- move it, so a stray identity scan cannot claim it was placed.
        if WAITING[a.status] then return false,"clue is still waiting for a container" end
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
    -- An instalment arrives (P4-R133): a deferred clue is given the container
    -- the filler found for it and becomes an ordinary pending placement, so
    -- the same placement job that writes every other clue writes this one.
    -- The target must belong to the site the clue was always meant for: a
    -- waiting clue is not a licence to put it anywhere.
    function api.assign(id,target,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status~="deferred" then return false,"only a deferred clue is waiting for a container" end
        local site
        for _,s in ipairs(root.case.locations) do if s.id==a.locationId then site=s end end
        if not site or not S.target(target,site) then return false,"target does not match the clue's own site" end
        -- The cap holds for a late arrival too (P4-R134): a clue that waited is
        -- welcome on a carrier, but only while the case has no mobile clue yet.
        if S.isMobile(target) and S.mobileCount(root)>=S.MOBILE_PER_CASE then
            return false,"a case may carry only one clue on something that moves"
        end
        if hours~=nil and not validHours(hours) then return false,"invalid placement hours" end
        return commit(function(r)
            local ra=r.assignments[id]
            ra.target=copy(target); ra.status="pending"; ra.deferredHours=nil
        end)
    end
    -- Three in-game days with nowhere to go and the clue is dropped: the case
    -- completes on the clues it got (a four-clue case is still a case) rather
    -- than squatting an active slot for ever.
    function api.drop(id)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status=="dropped" then return true end
        if a.status~="deferred" then return false,"only a deferred clue can be dropped" end
        return commit(function(r) r.assignments[id].status="dropped" end)
    end
    -- A CARRIER THAT IS GONE (P4-R134). `hours` remembers when we FIRST could
    -- not find the body, the zombie or the car; nil clears it the moment it
    -- turns up again, because a zombie in an unloaded cell is not a zombie that
    -- is gone. Only the first missing hour counts: the wait is measured from
    -- when it went, not from the last time we looked.
    function api.missing(id,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if not S.isMobile(a.target) then return false,"only a clue on something that moves can lose its carrier" end
        if hours==nil then
            if a.missingHours==nil then return true end
            return commit(function(r) r.assignments[id].missingHours=nil end)
        end
        if not validHours(hours) then return false,"invalid missing hours" end
        if a.missingHours~=nil then return true end
        return commit(function(r) r.assignments[id].missingHours=hours end)
    end
    -- Three in-game days with no carrier and the clue is dropped, exactly as a
    -- clue that never found a container is (P4-R133): the case completes on the
    -- clues it got. The assignment keeps the site it was meant for and loses
    -- its target, which is the same shape a clue that never arrived has - so
    -- no record can say where it is, and none ever says it is lost (P4-R104).
    function api.dropMissing(id,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status=="dropped" then return true end
        if not S.isMobile(a.target) then return false,"only a clue on something that moves can lose its carrier" end
        if not validHours(hours) then return false,"invalid missing hours" end
        -- A clue already found, or already recognised in the survivor's hands,
        -- is not missing whatever the world has done with its carrier.
        if api.isRecognised(id) then return false,"a clue already found is never dropped" end
        local site=a.locationId
        if not site then
            for _,d in ipairs(root.case.documents) do if d.id==id then site=d.locationId end end
        end
        return commit(function(r)
            local ra=r.assignments[id]
            ra.status="dropped"; ra.target=nil; ra.placedHours=nil; ra.missingHours=nil
            ra.locationId=site; ra.deferredHours=hours
        end)
    end
    function api.inspect(id)
        if not root.assignments[id] or root.assignments[id].status~="placed" then return false,"document unavailable" end
        for _,known in ipairs(root.known) do if known==id then return true end end
        return commit(function(r) r.known[#r.known+1]=id end)
    end
    -- A clue becomes evidence the survivor can see (P4-R132). Any assignment,
    -- whatever its placement status: a clue already in hand is still a clue.
    function api.isRecognised(id)
        for _,known in ipairs(root.known) do if known==id then return true end end
        for _,seen in ipairs(root.recognised or {}) do if seen==id then return true end end
        return false
    end
    function api.recognise(id)
        if not root.assignments[id] then return false,"unknown document" end
        if api.isRecognised(id) then return true end
        return commit(function(r) r.recognised=r.recognised or {}; r.recognised[#r.recognised+1]=id end)
    end
    function api.project() return G.project(root.case,root.known) end
    return api
end
return S
