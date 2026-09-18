-- Bounded scan of observed room rectangles; accepts only loaded real furniture.
local N=require("ConspiracyFiles/Generated/NearbyCatalog")
local V=require("ConspiracyFiles/Validator")
local W=require("ConspiracyFiles/WorldAccess")
local M={}
-- MAILBOXES (P4-R134, docs/design/CLUES_ON_THE_MOVE.md). A mailbox at the gate
-- is a distinct, replenishing place a survivor already searches, and it is the
-- only new fixed container kind the design needs.
--
-- *** VERIFIED ON BUILD 42.20, 2026-09-18. *** The engine calls it "postbox",
-- not "mailbox": a real game found five `postbox` containers within 40 tiles of
-- the survivor and no `mailbox` anywhere on 6,561 loaded squares
-- (tools/autotest/checks/carriers.sh, evidence
-- docs/management/evidence/linux-autotest/20260918T002532-carriers.txt). While
-- the guess stood, no mailbox could ever be chosen - it failed closed, as
-- P4-R135 point 4 said it would.
--
-- The string is the ENGINE's word and is named once, here; the word the
-- survivor uses is "mailbox" and lives once in ContainerWords, keyed on this
-- string. Nothing else in the mod spells either out.
M.MAILBOX="postbox"
-- Kinds a real game has yet to confirm. Empty since the mailbox was verified;
-- kept so a check can still print "nothing unverified" rather than nothing.
M.UNVERIFIED={}
local kinds={desk=true,counter=true,shelves=true,filingcabinet=true,locker=true,[M.MAILBOX]=true}
M.KINDS=kinds
-- How many kinds one site may report. Six furniture kinds plus "vehicle" is
-- seven; Generated/Catalog.lua allows eight. It was five while there were five
-- kinds, and a site that found a mailbox as well would silently have lost one
-- of them - a candidate whose kind is missing from the list is a candidate
-- S.target refuses.
M.MAX_KINDS=7
function M.scan(result,done,reachable)
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
    -- A MAILBOX STANDS AT THE GATE, and the gate is in no room (P4-R134, fixed
    -- 2026-09-18). A site is a BUILDING's rectangle and the rows above are its
    -- ROOM rectangles; a real game found six postboxes within sixty tiles of
    -- the survivor and not one of them on a square the game calls a room
    -- (evidence 20260918T025841-instalments.txt), so the pass above could never
    -- see one however the allow-list read - and with `postbox` the only kind
    -- allowed, no case could be created at all.
    --
    -- The answer is the one `addVehicles` below already uses for a car in the
    -- driveway: widen the footprint rather than pretend the kerb is a room. One
    -- band per site, walked by the same stepped machinery, accepting ONLY the
    -- mailbox kind - a clue never lands in some crate in the street. Ordered
    -- last, so a room is still the first place to look and a site that already
    -- has its eight candidates skips its whole band in a single step.
    local Session=require("ConspiracyFiles/Generated/Session")
    for _,site in ipairs(catalog.locations) do
        local b=site.bounds
        local r=Session.OUTDOOR_RADIUS
        rects[#rects+1]={kind="rect",outdoor=true,building=(site.id:gsub("^t3:","")),
            -- Street level: a mailbox is never in a basement, and the z-guard
            -- below skips this band for a site whose target sits elsewhere.
            x=b.x1-r,y=b.y1-r,z=0,w=(b.x2-b.x1)+2*r,h=(b.y2-b.y1)+2*r}
    end
    -- Vehicles near a site, added once the room scan is done. A site is a room
    -- rectangle inside a building and a car is in the driveway, so this is the
    -- one place the mod looks outside a site's own footprint - by
    -- Session.VEHICLE_RADIUS, which is a driveway and not the next street.
    local function addVehicles(catalogue,cands,roomsOut,occupiedOut)
        local S=require("ConspiracyFiles/Generated/Session")
        local RoomAffinity=require("ConspiracyFiles/Generated/RoomAffinity")
        for _,site in ipairs(catalogue.locations) do
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
                        local list=cands[site.id]
                        if list and #list<12 and RoomAffinity.knownRoom(part.part) then
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
                        end
                    end
                end
            end
        end
    end
    local index,dx,dy,oi,ci=1,0,0,0,0
    local objects,targets,candidates,rooms,seen,steps=nil,{},{},{},{},0
    local occupied={}
    local function nextTile(r)
        objects=nil; oi,ci=0,0; dy=dy+1
        if dy>=r.h then dy=0; dx=dx+1 end
        if dx>=r.w then dx,dy=0,0; index=index+1 end
    end
    return function()
        steps=steps+1
        if steps>100000 then error("storage scan safety cap; no case committed") end
        local r=rects[index]
        if not r then
            -- Vehicles are added last, so a car never displaces a container
            -- inside the building: a room is still the first place to look.
            local ok=pcall(addVehicles,catalog,candidates,rooms,occupied)
            if not ok then rooms=rooms; end
            done(catalog,targets,candidates,rooms,occupied); return true
        end
        local id="t3:"..r.building
        local site=sites[id]
        if not site or (targets[id] and r.z~=targets[id].z) or (candidates[id] and #candidates[id]>=8) then index=index+1; dx,dy,oi,ci=0,0,0,0; objects=nil; return false end
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
        -- Outside a room only a mailbox counts; inside one, any kind the mod
        -- knows. Nothing else changes: the reach gate, the one-clue-per-
        -- container key (P4-R67) and the resolve-it-again proof all stand.
        local allowed=(r.outdoor and c and c:getType()==M.MAILBOX) or (not r.outdoor and c and kinds[c:getType()])
        if c and name and allowed and (r.z==0 or reachable(x,y,r.z)) then
            local target={x=x,y=y,z=r.z,objectIndex=oi,containerIndex=ci,containerType=c:getType(),sprite=name}
            local key=x..":"..y..":"..r.z..":"..oi..":"..ci
            if W.resolve(target)==c and not seen[key] then
                seen[key]=true;candidates[id]=candidates[id] or {};candidates[id][#candidates[id]+1]=target
                local names=roomNames[r.building]
                local roomName=type(r.room)=="number" and names and names[r.room]
                if type(roomName)=="string" then
                    rooms[id]=rooms[id] or {}; rooms[id][#candidates[id]]=roomName
                end
                -- Does anything already live in here? A clue among somebody's
                -- belongings reads as part of the house; alone in an empty
                -- drawer it reads as placed by software. A preference for
                -- Session.createDistributed, never a filter. Whatever filled
                -- the container - vanilla's procedural pass, hand-placed loot,
                -- a previous survivor - counts the same, so this needs no
                -- engine API beyond the items already readable here.
                local items=c.getItems and c:getItems()
                local count=items and items.size and items:size() or 0
                occupied[id]=occupied[id] or {}
                occupied[id][#candidates[id]]=count>0
                if not targets[id] then targets[id]=target;site.bounds.z=r.z end
                site.paperStorage="observed";local types={};for _,v in ipairs(site.containerTypes) do types[v]=true end;types[c:getType()]=true;site.containerTypes={};for k in pairs(types) do if #site.containerTypes<M.MAX_KINDS then site.containerTypes[#site.containerTypes+1]=k end end;table.sort(site.containerTypes)
                -- Say which it was: a mailbox is NOT inside a room footprint,
                -- and a reference that claimed it was would be a lie in the
                -- one field a reader uses to tell where a site came from.
                -- The room rectangles are walked before any band, so a site
                -- that found furniture keeps that reference and only a site
                -- whose sole candidate is the mailbox says so.
                if not r.outdoor then site.source.reference="G2 loaded container inside T3 room footprint"
                elseif #candidates[id]==1 then site.source.reference="G2 loaded mailbox within reach of a T3 building footprint" end
            end
        end
        ci=ci+1
        return false
    end
end
return M
