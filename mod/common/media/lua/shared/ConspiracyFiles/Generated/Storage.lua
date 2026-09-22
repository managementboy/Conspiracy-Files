-- Bounded scan of observed room rectangles; accepts only loaded real furniture.
local N=require("ConspiracyFiles/Generated/NearbyCatalog")
local Choices=require("ConspiracyFiles/Generated/StorageChoices")
local FixedIndex=require("ConspiracyFiles/Generated/FixedContainerIndex")
local FixedData=require("ConspiracyFiles/Generated/FixedContainerIndexData")
local W=require("ConspiracyFiles/WorldAccess")
local M={}
-- Verified engine type: docs/management/evidence/linux-autotest/
-- 20260918T002532-carriers.txt. Outdoor scope remains the mailbox band;
-- indoor furniture no longer needs a hand-written type whitelist.
M.MAILBOX="postbox"
M.fixedKind=Choices.fixedKind
M.MAX_KINDS=Choices.MAX_SITE_TYPES
function M.scan(result,done,reachable,fixedData)
    reachable=reachable or function(x,y,z) return z==0 end
    local catalog,why=N.fromResult(result); if not catalog then return nil,why end
    local sites,rects,roomNames={},{},{}
    for _,site in ipairs(catalog.locations) do sites[site.id]=site end
    -- Room names (T3 kind=="room" rows) are collected in this same pass so
    -- lookup does not depend on row order: a rect's room name is joined by
    -- building id + room ordinal, never inferred or guessed. A rect with no
    -- matching room row, or a room row with an unusable (non-string/empty)
    -- name, contributes nothing here -- see Generated/RoomAffinity.lua for
    -- why an absent name must never be guessed at.
    for _,row in ipairs(result.rows) do
        if row.kind=="room" then
            if type(row.building)=="string" and type(row.ordinal)=="number" and type(row.name)=="string" and row.name~="" then
                roomNames[row.building]=roomNames[row.building] or {}
                roomNames[row.building][row.ordinal]=row.name
            end
        elseif row.kind=="rect" then
            if type(row.building)~="string" then return nil,"invalid rectangle building" end
            for _,k in ipairs({"x","y","z","w","h"}) do
                local n=row[k]; if type(n)~="number" or n~=math.floor(n) or math.abs(n)>100000 then return nil,"invalid rectangle" end
            end
            if row.w<1 or row.h<1 then return nil,"empty rectangle" end
            rects[#rects+1]=row
        end
    end
    -- Mailboxes may stand outside room rectangles. Walk the existing band
    -- after rooms; a full counter group no longer skips later rooms or the band.
    local Session=require("ConspiracyFiles/Generated/Session")
    for _,site in ipairs(catalog.locations) do
        local b=site.bounds
        local r=Session.OUTDOOR_RADIUS
        -- `string.sub`, not `gsub` with a pattern: Kahlua's string library is
        -- incomplete and the site id is always "t3:" and then the building's.
        rects[#rects+1]={kind="rect",outdoor=true,building=string.sub(site.id,4),
            -- Street level: a mailbox is never in a basement, and the z-guard
            -- below skips this band for a site whose target sits elsewhere.
            x=b.x1-r,y=b.y1-r,z=0,w=(b.x2-b.x1)+2*r,h=(b.y2-b.y1)+2*r}
    end
    -- Vehicles near a site, added once the room scan is done. A site is a room
    -- rectangle inside a building and a car is in the driveway, so this is the
    -- one place the mod looks outside a site's own footprint - by
    -- Session.VEHICLE_RADIUS, which is a driveway and not the next street.
    local function addVehicles(catalogue,cands,roomsOut,occupiedOut,targetsOut)
        local S=require("ConspiracyFiles/Generated/Session")
        local RoomAffinity=require("ConspiracyFiles/Generated/RoomAffinity")
        for _,site in ipairs(catalogue.locations) do
            local added=0
            local b=site.bounds
            local cx=math.floor((b.x1+b.x2)/2)
            local cy=math.floor((b.y1+b.y2)/2)
            local reach=math.max(b.x2-b.x1,b.y2-b.y1)+S.VEHICLE_RADIUS
            local near=W.vehiclesNear(cx,cy,b.z,reach,6)
            for _,entry in ipairs(near) do
                -- Only inside the widened footprint the target validator will
                -- accept, or the candidate could never be chosen.
                if entry.x>=b.x1-S.VEHICLE_RADIUS and entry.x<b.x2+S.VEHICLE_RADIUS
                    and entry.y>=b.y1-S.VEHICLE_RADIUS and entry.y<b.y2+S.VEHICLE_RADIUS then
                    local script=entry.vehicle.getScriptName and entry.vehicle:getScriptName() or "vehicle"
                    for _,part in ipairs(entry.parts) do
                        if added<4 and RoomAffinity.knownRoom(part.part) then
                            local list=cands[site.id]
                            if not list then list={};cands[site.id]=list end
                            added=added+1
                            list[#list+1]={x=entry.x,y=entry.y,z=entry.z,objectIndex=0,containerIndex=0,
                                containerType=S.VEHICLE_CONTAINER,sprite=tostring(script),vehiclePart=part.part}
                            roomsOut[site.id]=roomsOut[site.id] or {}
                            roomsOut[site.id][#list]=part.part
                            local items=part.container.getItems and part.container:getItems()
                            occupiedOut[site.id]=occupiedOut[site.id] or {}
                            occupiedOut[site.id][#list]=(items and items.size and items:size() or 0)>0
                            local types={}
                            for _,v in ipairs(site.containerTypes) do types[v]=true end
                            if not types[S.VEHICLE_CONTAINER] and #site.containerTypes<M.MAX_KINDS then
                                site.containerTypes[#site.containerTypes+1]=S.VEHICLE_CONTAINER
                                table.sort(site.containerTypes)
                            end
                            if not targetsOut[site.id] then targetsOut[site.id]=list[#list] end
                        end
                    end
                end
            end
        end
    end
    -- Exact map/build match: fixed furniture comes from the shipped compact
    -- index.  Unsupported maps/builds retain the bounded live fixed scan below.
    -- The index carries no engine object indexes and makes no world calls.
    local fixedRegistry=FixedIndex.open(fixedData or FixedData,result.map,result.gameVersion)
    local indexed=fixedRegistry~=nil
    local index,dx,dy,oi,ci=indexed and (#rects+1) or 1,0,0,0,0
    local objects,targets,candidates,rooms,steps=nil,{},{},{},0
    local pools={}
    local occupied={}
    if indexed then
        for _,site in ipairs(catalog.locations) do
            local b=site.bounds
            local selectedZ
            for _,signature in ipairs(fixedRegistry.candidates(site.id)) do
                local margin=signature.containerType==M.MAILBOX and Session.OUTDOOR_RADIUS or 0
                local inside=signature.x>=b.x1-margin and signature.x<b.x2+margin
                    and signature.y>=b.y1-margin and signature.y<b.y2+margin
                if inside and Choices.fixedKind(signature.containerType)
                    and (signature.z==0 or reachable(signature.x,signature.y,signature.z)) then
                    if selectedZ==nil then selectedZ=signature.z;site.bounds.z=selectedZ end
                    if signature.z==selectedZ then
                        pools[site.id]=pools[site.id] or Choices.new()
                        Choices.offer(pools[site.id],signature,signature.room,false)
                    end
                end
            end
            if pools[site.id] then
                site.paperStorage="indexed"
                site.source.reference="build-versioned fixed-container index; live validation required"
            end
        end
    end
    local function nextTile(r)
        objects=nil; oi,ci=0,0; dy=dy+1
        if dy>=r.h then dy=0; dx=dx+1 end
        if dx>=r.w then dx,dy=0,0; index=index+1 end
    end
    return function()
        steps=steps+1
        -- Each invocation examines at most one square or one container.
        -- The scheduler owns the per-tick budget; this remains a runaway guard.
        if steps>200000 then error("storage scan safety cap; no case committed") end
        local r=rects[index]
        if not r then
            for id,site in pairs(sites) do
                local pool=pools[id]
                if pool then
                    candidates[id],rooms[id],occupied[id]=Choices.finish(pool)
                    targets[id]=candidates[id][1]
                    local types={};for _,kind in ipairs(pool.order) do types[#types+1]=kind end
                    table.sort(types);site.containerTypes=types
                end
            end
            -- Retain up to four vehicle parts in addition to fixed choices.
            local ok=pcall(addVehicles,catalog,candidates,rooms,occupied,targets)
            if not ok then rooms=rooms; end
            done(catalog,targets,candidates,rooms,occupied); return true
        end
        local id="t3:"..r.building
        local site=sites[id]
        if not site or (targets[id] and r.z~=targets[id].z) then index=index+1; dx,dy,oi,ci=0,0,0,0; objects=nil; return false end
        local x,y=r.x+dx,r.y+dy
        local b=site.bounds
        -- The footprint a candidate must fall inside, which is the site's own
        -- for a room rectangle and the widened one for the mailbox band - the
        -- same box Session.target will accept it in, or it could never be
        -- chosen (addVehicles keeps the same promise for a car).
        local margin=r.outdoor and Session.OUTDOOR_RADIUS or 0
        if x<b.x1-margin or x>=b.x2+margin or y<b.y1-margin or y>=b.y2+margin then nextTile(r); return false end
        if not objects then
            local square=getCell():getGridSquare(x,y,r.z)
            if not square then nextTile(r); return false end
            objects=square:getObjects(); return false
        end
        if oi>=objects:size() then nextTile(r); return false end
        local o=objects:get(oi)
        if not o or not o.getContainerCount or ci>=o:getContainerCount() then oi=oi+1; ci=0; return false end
        local c=o:getContainerByIndex(ci)
        local sprite=o:getSprite(); local name=sprite and sprite:getName()
        -- Non-ground candidates must be proven reachable (Connectivity, wired
        -- through ReachabilityAdapter) before they can ever become a site's
        -- target; an unproven basement tile is treated exactly like no
        -- container being there at all, never placed on a guess.
        -- Every identified non-floor furniture kind is eligible inside a room.
        -- Outside, retain the observed mailbox-only footprint rule.
        local allowed=c and Choices.fixedKind(c:getType()) and (not r.outdoor or c:getType()==M.MAILBOX)
        local unexplored=false
        if c then
            local stateOK,state=pcall(function() return c:isExplored() end)
            -- Test doubles and nonstandard containers may not expose the read;
            -- selection is harmless, because FixedContainerRuntime repeats it
            -- fail-closed immediately before any insertion.
            unexplored=not stateOK or state~=true
        end
        if c and name and allowed and unexplored and (r.z==0 or reachable(x,y,r.z)) then
            local target={x=x,y=y,z=r.z,objectIndex=oi,containerIndex=ci,containerType=c:getType(),sprite=name}
            if W.resolve(target)==c then
                pools[id]=pools[id] or Choices.new()
                local names=roomNames[r.building]
                local roomName=type(r.room)=="number" and names and names[r.room]
                local items=c.getItems and c:getItems()
                local count=items and items.size and items:size() or 0
                if Choices.offer(pools[id],target,type(roomName)=="string" and roomName or nil,count>0) then
                    if not targets[id] then
                        targets[id]=target;site.bounds.z=r.z
                        site.source.reference=r.outdoor and "G2 loaded mailbox within reach of a T3 building footprint"
                            or "G2 loaded container inside T3 room footprint"
                    end
                    site.paperStorage="observed"
                end
            end
        end
        ci=ci+1
        return false
    end
end
return M
