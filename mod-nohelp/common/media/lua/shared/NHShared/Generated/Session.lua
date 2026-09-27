local StorageChoices=require("NHShared/Generated/StorageChoices")
local AreaCase=require("NHShared/Generated/AreaCase")
local V=require("NHShared/Validator")
local S={}
-- A No Help world record (AreaCase) is the only case there is: the old
-- runtime case generator is gone (owner, 2026-09-27).
local function isArea(root) return type(root)=="table" and AreaCase.isAreaCase(root.case) end
S.isArea=isArea
local function validateCase(case)
    if AreaCase.isAreaCase(case) then return AreaCase.validate(case) end
    return false,"not a No Help world record"
end
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
local WAITING={deferred=true,indexed=true,dropped=true}
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
-- A MAILBOX IS IN NO ROOM (P4-R134, fixed 2026-09-18). It stands at the gate,
-- outdoors, and a real game found six postboxes near the survivor with not one
-- of them on a square the game calls a room (evidence 20260918T025841) - so
-- while a fixed container had to be strictly inside the footprint, a mailbox
-- could never be offered as a place and a neighbourhood with nothing but
-- mailboxes could supply no case at all. It is allowed a widening of its own,
-- the way a car in the driveway is (S.VEHICLE_RADIUS): the gate and the
-- driveway are the same few tiles of ground.
--
-- TWELVE, and it is measured, not guessed. A band is walked square by square
-- around every candidate site on every case attempt, so the width is a real
-- cost (about 1,050 squares a site, against 380 at six tiles) and was set at
-- six first. A running game then said six is not enough: of the six postboxes
-- within sixty tiles of the survivor, the nearest two stood **8 and 9 tiles**
-- outside the nearest live site footprint and the rest further
-- (`20260918T060614-instalments.txt`, which prints the distance for every one).
-- Twelve is the same number a car in the driveway gets, for the same ground.
--
-- The band is ordered after every room rectangle. The variety scan walks it
-- even when room storage exists, so a gate mailbox remains a possible kind.
-- Work stays stepped; Claude must measure the increased total scan time.
S.OUTDOOR_RADIUS=12
-- The kinds allowed out there. The engine's own word for a mailbox is named
-- ONCE, in Generated/Storage.MAILBOX, so it is asked for rather than spelled
-- again here; if that module cannot be loaded nothing is outdoor, which is the
-- state before this existed - a mailbox is then never chosen, never a bad
-- placement.
local function outdoorKind(kind)
    local ok,Storage=pcall(require,"NHShared/Generated/Storage")
    return ok and type(Storage)=="table" and kind==Storage.MAILBOX
end
-- A vehicle target names a part and carries the mark the runtime stamps on it.
-- It is addressed by that mark rather than by a parking space, because only
-- the player can move a car and the clue travels with them when they do.
local function vehicleTarget(t) return type(t)=="table" and type(t.vehiclePart)=="string" end
-- CLUES ON THE MOVE (P4-R134, docs/design/CLUES_ON_THE_MOVE.md). A third target
-- shape beside the fixed container and the car part: a CARRIER - a body the
-- world already put in reach. Like a car part it is addressed by a mark of ours
-- rather than by a square, because it need not stay where it was found; unlike
-- a car part the mark names the CARRIER, so the distinctness register below can
-- refuse a second clue on one body (P4-R67).
--
-- A CORPSE IS THE ONLY CARRIER KIND (P4-R136, owner, 2026-09-18): the game will
-- not keep Search Mode on beside a walking zombie, so a clue on one could never
-- be searched out, and a walker that wandered off stranded a case for three
-- in-game days. A zombie the survivor kills is an ordinary body from then on.
S.CARRIER_CONTAINER="carrier"
S.CARRIER_KINDS={corpse=true}
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
-- OPEN GROUND (No Help, owner 2026-09-27: "place the clues anywhere that is
-- interesting"). A clue lying on a square, not in anything. Like a carrier, it
-- is not checked against the site's observed furniture, only its footprint and
-- the driveway margin; `sprite` holds a short word for the spot, since a square
-- has no furniture sprite and the diagnostics print this field.
S.GROUND_CONTAINER="floor"
-- How many physical items one document is: the sum of a set's pieces, else
-- its stated pile count, else one. The one place this is counted, so the
-- placement count, the identity scan and relocation cannot disagree (phase 5
-- mapping: the identity scan read `quantity` alone and would have marked every
-- set without a stated total a permanent conflict).
function S.pieceCount(doc)
    if type(doc)~="table" then return 1 end
    if type(doc.members)=="table" and #doc.members>0 then
        local n=0
        for _,m in ipairs(doc.members) do n=n+(tonumber(m.quantity) or 1) end
        return n
    end
    return tonumber(doc.quantity) or 1
end
-- The ways a clue can come to be recognised, as R.recognise names them.
S.FOUND_HOW={search=true,look=true,opening=true,debug=true}
local function groundTarget(t) return type(t)=="table" and t.ground==true end
S.isGround=groundTarget
function S.isMobile(target)
    return vehicleTarget(target) or carrierTarget(target)
end
-- An authored placement intent is a hard constraint.  In particular, the
-- transport clue may wait for a real vehicle; it must never quietly become a
-- cooler in a bathroom cupboard or on an unrelated corpse.
function S.intentMatches(doc,target)
    if type(doc)~="table" then return false end
    -- A No Help clue names its kind of spot, and that is a hard constraint
    -- too: a mailbox clue is only ever in a mailbox, a ground clue only ever
    -- on the ground, and so on.
    if doc.spot~=nil then
        local t=target
        if doc.spot=="ground" then return groundTarget(t) end
        if doc.spot=="corpse" then return carrierTarget(t) and t.carrierKind=="corpse" end
        if doc.spot=="vehicle" then return vehicleTarget(t) end
        if doc.spot=="mailbox" then return type(t)=="table" and outdoorKind(t.containerType) and not S.isMobile(t) and not groundTarget(t) end
        if doc.spot=="furniture" then
            return type(t)=="table" and not S.isMobile(t) and not groundTarget(t) and not outdoorKind(t.containerType)
        end
        return false
    end
    if doc.placementIntent=="vehicle" then
        return vehicleTarget(target) and type(target.sceneSignature)=="string" and target.sceneSignature~=""
    end
    return true
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
    if groundTarget(t) then
        if not fields(t,{x=true,y=true,z=true,objectIndex=true,containerIndex=true,containerType=true,
                         sprite=true,ground=true}) then return false end
        for _,k in ipairs({"x","y","z","objectIndex","containerIndex"}) do if not integer(t[k]) then return false end end
        if t.objectIndex~=0 or t.containerIndex~=0 then return false end
        if type(t.sprite)~="string" or #t.sprite==0 or #t.sprite>80 then return false end
        if t.containerType~=S.GROUND_CONTAINER then return false end
        local b=site.bounds
        local r=S.OUTDOOR_RADIUS
        if t.x<b.x1-r or t.x>=b.x2+r or t.y<b.y1-r or t.y>=b.y2+r or t.z~=b.z then return false end
        return true
    end
    if vehicleTarget(t) then
        if not fields(t,{x=true,y=true,z=true,objectIndex=true,containerIndex=true,containerType=true,
                         sprite=true,vehiclePart=true,vehicleMark=true,sceneSignature=true}) then return false end
        for _,k in ipairs({"x","y","z","objectIndex","containerIndex"}) do if not integer(t[k]) then return false end end
        if t.objectIndex~=0 or t.containerIndex~=0 then return false end
        if type(t.sprite)~="string" or #t.sprite>300 then return false end
        if #t.vehiclePart==0 or #t.vehiclePart>60 then return false end
        if t.vehicleMark~=nil and (type(t.vehicleMark)~="string" or #t.vehicleMark>300) then return false end
        if t.sceneSignature~=nil and (type(t.sceneSignature)~="string" or #t.sceneSignature==0 or #t.sceneSignature>1000) then return false end
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
    -- Inside the footprint, unless it is a mailbox at the gate (above), which
    -- gets the driveway's twelve tiles. The kind must still be one the scan
    -- actually observed at this site, exactly as before.
    local margin=outdoorKind(t.containerType) and S.OUTDOOR_RADIUS or 0
    if t.x<b.x1-margin or t.x>=b.x2+margin or t.y<b.y1-margin or t.y>=b.y2+margin or t.z~=b.z then return false end
    for _,kind in ipairs(site.containerTypes) do if kind==t.containerType then return true end end
    return false
end
-- A shipped fixed-container signature deliberately has no object/container
-- indexes.  It names the furniture that should exist; the runtime turns it
-- into an exact target only after the square is loaded and verified.
function S.plannedTarget(t,site)
    if type(t)~="table" or type(site)~="table" then return false end
    if not fields(t,{buildingId=true,x=true,y=true,z=true,sprite=true,containerType=true,room=true,indexed=true})
        or t.indexed~=true then return false end
    for _,k in ipairs({"x","y","z"}) do if not integer(t[k]) then return false end end
    if type(t.buildingId)~="string" or #t.buildingId==0 or #t.buildingId>160 then return false end
    if type(t.sprite)~="string" or #t.sprite==0 or #t.sprite>300 then return false end
    if type(t.containerType)~="string" or #t.containerType==0 or #t.containerType>80 then return false end
    if t.room~=nil and (type(t.room)~="string" or #t.room==0 or #t.room>120) then return false end
    local expected=string.sub(site.id,1,3)=="t3:" and string.sub(site.id,4) or site.id
    if t.buildingId~=expected then return false end
    local margin=outdoorKind(t.containerType) and S.OUTDOOR_RADIUS or 0
    local b=site.bounds
    if t.x<b.x1-margin or t.x>=b.x2+margin or t.y<b.y1-margin or t.y>=b.y2+margin or t.z~=b.z then return false end
    for _,kind in ipairs(site.containerTypes) do if kind==t.containerType then return true end end
    return false
end
function S.validate(root)
    local ok,why=V.validateStructure(root); if not ok then return false,why end
    if not fields(root,{schema=true,case=true,assignments=true,known=true,recognised=true,recognisedHow=true}) or root.schema~=1 then return false,"invalid generated session" end
    ok,why=validateCase(root.case); if not ok then return false,why end
    if type(root.assignments)~="table" or type(root.known)~="table" then return false,"missing session fields" end
    local ids,sites={},{}
    for _,s in ipairs(root.case.locations) do sites[s.id]=s end
    for _,d in ipairs(root.case.documents) do
        ids[d.id]=true
        local a=root.assignments[d.id]
        if not fields(a,{physicalToken=true,target=true,planned=true,status=true,placedHours=true,relocations=true,
                         locationId=true,deferredHours=true,missingHours=true,droppedFrom=true}) or a.physicalToken~="cf-g2:"..d.id
            or not ({pending=true,placing=true,placed=true,unknown=true,conflict=true,
                     deferred=true,indexed=true,dropped=true})[a.status] then return false,"invalid assignment" end
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
            if a.status=="indexed" then
                if not S.plannedTarget(a.planned,sites[a.locationId]) then return false,"invalid assignment" end
            elseif a.planned~=nil then return false,"invalid assignment" end
        else
            if a.deferredHours~=nil or a.planned~=nil then return false,"invalid assignment" end
            if not S.target(a.target,sites[a.locationId or d.locationId]) or not S.intentMatches(d,a.target) then
                return false,"invalid assignment"
            end
            if a.status=="placed" and not validHours(a.placedHours) then return false,"invalid assignment" end
            if a.placedHours~=nil and not validHours(a.placedHours) then return false,"invalid assignment" end
        end
        -- A CARRIER THAT IS GONE (P4-R134): the in-game hour we first could not
        -- find the body, the zombie or the car, so three days can be measured
        -- against it exactly as they are for a clue that never found a
        -- container. Only ever on a clue that is really out there on something
        -- that moves: a cupboard cannot go missing.
        -- HOW A DROPPED CLUE GOT THERE. Two paths reach `dropped` and they have
        -- different histories: `drop` gives up on a clue that never found a
        -- container and so was NEVER in the world, while `dropMissing` gives up
        -- on one that WAS placed, on a carrier that then went away (P4-R134).
        -- dropMissing nils the target, so after the fact the two were
        -- indistinguishable - which made "a dropped clue was never placed" a
        -- false statement about half of them, and left a run unable to say
        -- which failure it had seen. This records it, and only on a dropped
        -- clue: no other status may carry it.
        if a.droppedFrom~=nil then
            if a.status~="dropped" or not ({deferred=true,carrier=true})[a.droppedFrom] then
                return false,"invalid assignment"
            end
        end
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
    -- HOW each recognised clue was found (No Help, owner directive 2: the hint
    -- and Search Mode are the way in, "Look it over" the fallback). Optional;
    -- one short word per recognised id, so a playtest can count how many clues
    -- were found by searching and how many were looted and looked over.
    if root.recognisedHow~=nil then
        if type(root.recognisedHow)~="table" then return false,"invalid recognition method" end
        local listed={}
        for _,id in ipairs(root.recognised or {}) do listed[id]=true end
        for id,how in pairs(root.recognisedHow) do
            if not listed[id] or not S.FOUND_HOW[how] then return false,"invalid recognition method" end
        end
    end
    -- A No Help world record has no size ceiling (owner, 2026-09-27).
    return true
end
-- A new, empty No Help world record for a world seed.
function S.createArea(seed)
    local root={schema=1,case=AreaCase.new(seed),assignments={},known={}}
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
-- THE FILLER'S TURN. One waiting clue per attempt, but not always the same
-- one: the filler used to take waiting[1] every attempt, so a clue whose site
-- was unloaded or had nowhere to go ("no-containers") blocked every clue
-- behind it until it expired three days later - measured 2026-09-24, four
-- clues at a loaded site behind one receipt at a house the survivor had left.
-- The cursor is the caller's; it advances by one each attempt and wraps.
function S.pick(ids,cursor)
    local c=type(cursor)=="number" and cursor or 0
    if type(ids)~="table" or #ids==0 then return nil,c end
    return ids[(c % #ids)+1],c+1
end
function S.indexedIds(root)
    local out={}
    if type(root)~="table" or type(root.case)~="table" or type(root.assignments)~="table" then return out end
    for _,d in ipairs(root.case.documents or {}) do
        local a=root.assignments[d.id]
        if a and a.status=="indexed" then out[#out+1]=d.id end
    end
    return out
end
-- Those that have waited three in-game days and are to be dropped.
function S.expiredIds(root,hours)
    local out={}
    if type(hours)~="number" or hours~=hours or hours==math.huge then return out end
    -- A No Help clue waits for its spot as long as it takes: the world keeps
    -- everything, and nothing about an area already decided is given up.
    if isArea(root) then return out end
    for _,d in ipairs(root.case and root.case.documents or {}) do
        local a=root.assignments[d.id]
        if a and (a.status=="deferred" or a.status=="indexed")
            and hours-a.deferredHours>=S.DEFER_EXPIRE_HOURS then out[#out+1]=d.id end
    end
    return out
end
-- The clues whose carrier has been missing for three in-game days (P4-R134):
-- the zombie walked into a horde, the body burned, the car was wrecked. They
-- share P4-R133's expiry to the hour, because the survivor's position is the
-- same either way - there is nothing there to find and never will be.
-- THE CARRIER MARK: what the watcher should record after looking for a carrier.
-- nil when it is there - clear the timer - and the hour when it is not.
--
-- This exists as a function because the watcher used to decide it inline with
--
--     api.missing(d.id, found and nil or hours)
--
-- and `true and nil` is nil, so `nil or hours` is hours; `false and nil` is
-- false, so `false or hours` is hours. BOTH branches passed the hour. The
-- clear-the-timer branch was unreachable, and since api.missing keeps only the
-- FIRST missing hour, a carrier standing in front of the survivor was marked
-- missing once, never cleared, and its clue dropped three in-game days later.
-- The decision is one line and it was wrong for weeks, so it lives here where
-- a plain Lua test can hold it to account (test/carrier_timer.lua).
function S.missingMark(found,hours)
    if found then return nil end
    return hours
end
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
-- One container, named so nothing else can claim it: the square, the object and
-- container index on it, and the vehicle part where there is one. Exported
-- because the filler (GeneratedRuntime) must check a late clue's container
-- against every clue already placed, in any case, live or finished.
function S.physicalKey(target)
    if target and target.indexed==true then return StorageChoices.key(target) end
    -- A CARRIER is keyed on its own mark and nothing else (P4-R134). Two bodies
    -- may lie on one square and a body may be dragged off it, so a square
    -- cannot name a carrier; the mark can, and does, which is what makes "never
    -- two clues on one carrier" the same check as "never two clues in one
    -- cupboard" (P4-R67).
    if type(target.carrierMark)=="string" then return "carrier:"..target.carrierMark end
    -- OPEN GROUND is keyed on its square alone, and apart from furniture: a
    -- ground target's zero indexes are "not an index", so without the prefix a
    -- yard spot and the first cupboard on the same square would be one key.
    if target.ground==true then return "ground:"..table.concat({target.x,target.y,target.z},":") end
    return table.concat({target.x,target.y,target.z,target.objectIndex,target.containerIndex,
                         target.vehiclePart or "-"},":")
end
function S.open(initial,sink)
    local ok,why=S.validate(initial); if not ok then return nil,why end
    local root=copy(initial); local api={}
    local function commit(change)
        local next=copy(root); change(next)
        -- The No Help world record only grows (AreaCase.grows).
        local grows,growsWhy=AreaCase.grows(root.case,next.case)
        if not grows then return false,growsWhy end
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
        -- A No Help clue belongs to its area: it may move within it, only to
        -- the same kind of spot, never to another area.
        if isArea(root) then
            local doc
            for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
            if not doc or site.id~=doc.locationId then return false,"a clue stays in its own area" end
            if not S.intentMatches(doc,target) then return false,"a clue moves only to the same kind of spot" end
        end
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
        if a.status~="deferred" and a.status~="indexed" then return false,"only a waiting clue can be assigned a container" end
        local site
        for _,s in ipairs(root.case.locations) do if s.id==a.locationId then site=s end end
        if not site or not S.target(target,site) then return false,"target does not match the clue's own site" end
        local doc
        for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
        if not S.intentMatches(doc,target) then return false,"target does not match the clue's placement intent" end
        -- The cap holds for a late arrival too (P4-R134): a clue that waited is
        -- welcome on a carrier, but only while the case has no mobile clue yet.
        if S.isMobile(target) and not isArea(root) and S.mobileCount(root)>=S.MOBILE_PER_CASE then
            return false,"a case may carry only one clue on something that moves"
        end
        if hours~=nil and not validHours(hours) then return false,"invalid placement hours" end
        return commit(function(r)
            local ra=r.assignments[id]
            ra.target=copy(target); ra.status="pending"; ra.deferredHours=nil; ra.planned=nil
        end)
    end
    -- An indexed signature that no longer matches the live building becomes an
    -- ordinary deferred clue.  Only then may the modified-building fallback
    -- scan inspect fixed furniture at that site.
    function api.unplan(id,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status~="indexed" then return false,"only an indexed clue can lose its plan" end
        if not validHours(hours) then return false,"invalid placement hours" end
        return commit(function(r)
            local ra=r.assignments[id];ra.status="deferred";ra.planned=nil
            -- The index plan was waiting from case creation, so falling back
            -- must not restart its three-day expiry clock.
            ra.deferredHours=ra.deferredHours or hours
        end)
    end
    -- A selected fixed container can be searched or replaced between selection
    -- and insertion.  No item has been created while status is pending, so it
    -- is safe to return that assignment to the fallback queue.
    function api.deferTarget(id,hours)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status~="pending" then return false,"only an unstarted placement can be deferred" end
        if not validHours(hours) then return false,"invalid placement hours" end
        local site=a.locationId
        if not site then for _,d in ipairs(root.case.documents) do if d.id==id then site=d.locationId end end end
        return commit(function(r)
            local ra=r.assignments[id];ra.status="deferred";ra.target=nil;ra.locationId=site;ra.deferredHours=hours
        end)
    end
    -- Three in-game days with nowhere to go and the clue is dropped: the case
    -- completes on the clues it got (a four-clue case is still a case) rather
    -- than squatting an active slot for ever.
    function api.drop(id)
        local a=root.assignments[id]; if not a then return false,"unknown document" end
        if a.status=="dropped" then return true end
        if a.status~="deferred" and a.status~="indexed" then return false,"only a waiting clue can be dropped" end
        -- Never in the world: this clue never found a container at all.
        return commit(function(r)
            local ra=r.assignments[id];ra.status="dropped";ra.droppedFrom="deferred";ra.planned=nil
        end)
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
            -- This one WAS out there, on a carrier that went away. Recorded
            -- because nilling the target above erases the only other trace.
            ra.droppedFrom="carrier"
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
    function api.recognise(id,how)
        if not root.assignments[id] then return false,"unknown document" end
        if api.isRecognised(id) then return true end
        return commit(function(r)
            r.recognised=r.recognised or {}; r.recognised[#r.recognised+1]=id
            if S.FOUND_HOW[how] then r.recognisedHow=r.recognisedHow or {}; r.recognisedHow[id]=how end
        end)
    end
    -- Decide one No Help area and add it in one write: the grown world record
    -- and a waiting assignment for each new clue, which the filler then gives
    -- a real spot of the clue's own kind at its area (P4-R133's path).
    function api.addArea(args)
        if not isArea(root) then return false,"not a No Help world" end
        local nextCase,ids=AreaCase.decide{case=root.case,site=args.site,place=args.place,
            clues=args.clues,version=args.version,hours=args.hours,source=args.source}
        if not nextCase then return false,ids end
        if not validHours(args.hours) then return false,"invalid hours" end
        local ok,why=commit(function(r)
            r.case=nextCase
            for _,id in ipairs(ids) do
                local doc
                for _,d in ipairs(nextCase.documents) do if d.id==id then doc=d end end
                r.assignments[id]={physicalToken="cf-g2:"..id,status="deferred",locationId=doc.locationId,
                    deferredHours=args.hours,relocations=0}
            end
        end)
        if not ok then return false,why end
        return true,ids
    end
    function api.project()
        return AreaCase.project(root.case)
    end
    return api
end
return S
