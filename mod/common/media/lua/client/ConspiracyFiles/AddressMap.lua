local Core=require("ConspiracyFiles/Generated/AddressIndex")
local Roads=require("ConspiracyFiles/Generated/AddressRoads")
local V=require("ConspiracyFiles/Validator")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.stop then ConspiracyFiles.AddressMap.stop() end
local M={}; ConspiracyFiles.AddressMap=M
local TAG="ConspiracyFiles.AddressBook.Muldraugh"
local job,handler,book,byId,buckets,peak=nil,nil,nil,{}, {},0
-- Where the survivor is, for AD-10's out-of-town town names (see M.currentTown).
local where={}
local CFLog=require("ConspiracyFiles/Log")
local function log(s) CFLog.message("address","address",s) end
local status="Not started"
local view,viewReasons,auditHandler
local function stopAudit() if auditHandler then Events.OnTick.Remove(auditHandler);auditHandler=nil end end
function M.status() log(status); return status end
local function allowed() return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer()) end
local function valid(root)
    local ok=V.validateStructure(root)
    if not ok or type(root)~="table" or root.revision~=Core.REVISION or type(root.records)~="table" then return false end
    if V.estimateEncodedBytes(root)>400000 then return false end
    local seen,labels,n={},{},0
    for i,r in pairs(root.records) do
        if type(i)~="number" or i<1 or i~=math.floor(i) or type(r)~="table" or type(r.id)~="string"
            or type(r.label)~="string" or #r.label>160 or seen[r.id] or labels[r.label] then return false end
        for _,k in ipairs({"x","y","x2","y2"}) do if type(r[k])~="number" or r[k]~=math.floor(r[k]) or math.abs(r[k])>100000 then return false end end
        if r.x2<=r.x or r.y2<=r.y then return false end
        seen[r.id]=true;labels[r.label]=true;n=n+1
    end
    for i=1,n do if not root.records[i] then return false end end
    return true
end
local function use(root)
    book=root; byId,buckets={},{}
    -- A different book may put the survivor in a different town.
    where.x,where.y,where.at,where.town=nil,nil,nil,nil
 -- Anything asked before the book existed was answered with a refusal and
 -- remembered as one; let those readers ask again now.
 local observer=ConspiracyFiles.IdentityObserver
 if observer and observer.forgetPlaces then pcall(observer.forgetPlaces) end
    for _,r in ipairs(root.records) do
        byId["t3:"..r.id]=r
        local cx,cy=(r.x+r.x2-1)/2,(r.y+r.y2-1)/2
        local key=math.floor(cx/64)..":"..math.floor(cy/64)
        buckets[key]=buckets[key] or {}; buckets[key][#buckets[key]+1]=r
    end
end
function M.ready() return book~=nil end
-- AD-10 (P4-R129): house numbers for the whole map ship with the mod, worked
-- out once from the real game's building list (tools/addresses/build.lua). A
-- new save reads them at game start: nothing is scanned and nothing is written
-- to the save. A save that already froze a Muldraugh book keeps it (P4-R120).
-- Rows are "id|x|y|x2|y2|area|street|number"; labels are unique per town, not
-- across the map, and a record carries its town's name when the town has one.
local SHIPPED_REVISION="whole-map-1"
-- The regions file names a town as an id - "WestPoint", "MarchRidge". The
-- survivor writes it the way it is said, so these three are spelled out. A
-- closed, hand-written table, like the outfit trades: a name that is not
-- listed is used exactly as the file spells it and is never invented or split
-- up, so "LAA" stays "LAA" rather than becoming "L A A".
local TOWN_NAMES={WestPoint="West Point",MarchRidge="March Ridge",ValleyStation="Valley Station"}
local function shippedBook(map,build)
    local ok,B=pcall(require,"ConspiracyFiles/Generated/AddressBook")
    if not ok or type(B)~="table" or B.revision~=SHIPPED_REVISION or type(B.rows)~="table"
        or type(B.streets)~="table" or type(B.areas)~="table" then return nil,"no shipped address book" end
    if type(B.map)~="string" or not tostring(map):find(B.map,1,true) then return nil,"shipped addresses are for "..tostring(B.map) end
    local records={}
    for _,row in ipairs(B.rows) do
        local id,x,y,x2,y2,area,street,number=row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%d+)|(%d+)|(%d+)$")
        local name=id and B.streets[tonumber(street)]
        if name then
            local a=B.areas[tonumber(area)]
            records[#records+1]={id=id,x=tonumber(x),y=tonumber(y),x2=tonumber(x2),y2=tonumber(y2),
                label=number.." "..name,town=(a and a.town==1) and (TOWN_NAMES[a.name] or a.name) or nil}
        end
    end
    if #records==0 then return nil,"shipped address book is empty" end
    return {revision=B.revision,map=tostring(map),build=build,records=records,coverage=3,shipped=true}
end
-- The town a building's number belongs to, or nil (an unnamed area never gets
-- an invented name).
function M.townForBuilding(id)
    if not book or type(id)~="string" then return nil end
    local r=byId["t3:"..id]
    return r and r.town or nil
end
-- AD-10, the last of its "Still open": when the mod's text names a place
-- OUTSIDE the town the survivor is in, the town's name is added - "102 2nd St,
-- West Point". Inside their own town nothing changes: nobody names the town
-- they are standing in, and labels are only unique per town, so an address read
-- in another town could otherwise be the survivor's own street.
--
-- The survivor's town is the town of the numbered building nearest to them, and
-- it is STICKY: walking into the woods does not make someone a stranger to the
-- town they just left, and outside the towns there is no town to be in. When it
-- is not known at all - no player, no book, or a save that has never been near
-- a numbered house - the label reads exactly as it does today: the mod says
-- nothing rather than guessing at a town.
--
-- Kept out of the hot paths: a label costs one field read and one compare, and
-- the town itself is worked out again only after the survivor has moved
-- TOWN_MOVED_TILES or TOWN_EVERY_MS has passed - never per rendered row.
M.TOWN_EVERY_MS=5000
M.TOWN_MOVED_TILES=32
local function nearestRecord(x,y,within)
    if not book or type(x)~="number" or type(y)~="number" then return nil end
    within=within or 30
    local bx,by=math.floor(x/64),math.floor(y/64)
    local best,bestDistance=nil,nil
    for dx=-1,1 do for dy=-1,1 do
        for _,r in ipairs(buckets[(bx+dx)..":"..(by+dy)] or {}) do
            if type(r.label)=="string" and r.label~="" then
                -- Distance to the footprint's edge, not its centre: standing on
                -- a porch is zero tiles from the house, not ten.
                local ex=x<r.x and r.x-x or (x>=r.x2 and x-r.x2+1 or 0)
                local ey=y<r.y and r.y-y or (y>=r.y2 and y-r.y2+1 or 0)
                local d=math.max(ex,ey)
                if d<=within and (not bestDistance or d<bestDistance) then best,bestDistance=r,d end
            end
        end
    end end
    if not best then return nil end
    return best,bestDistance
end
-- The town the survivor is in, or nil while that is not known.
function M.currentTown()
    if not book then return nil end
    -- The clock first, and nothing else while the answer is fresh: FILES
    -- rebuilds every row on every refresh, and asking the player where they
    -- are once per row would be an engine call per line of the record.
    local now=(getTimeInMillis and getTimeInMillis()) or 0
    if where.at and now>=where.at and now-where.at<M.TOWN_EVERY_MS then return where.town end
    local player=getPlayer and getPlayer()
    if not player or not player.getX then return where.town end
    local x,y=player:getX(),player:getY()
    if type(x)~="number" or type(y)~="number" then return where.town end
    x,y=math.floor(x),math.floor(y)
    where.at=now
    -- Still on the same street: the buckets do not need searching again.
    if where.x and math.abs(x-where.x)<M.TOWN_MOVED_TILES and math.abs(y-where.y)<M.TOWN_MOVED_TILES then return where.town end
    where.x,where.y=x,y
    local r=nearestRecord(x,y,64)
    if r and r.town then where.town=r.town end
    return where.town
end
-- What the survivor would write down for this address, here.
local function qualified(label,town)
    if type(label)~="string" or label=="" or type(town)~="string" or town=="" then return label end
    local here=M.currentTown()
    if here==nil or here==town then return label end
    return label..", "..town
end
-- The named building nearest to a point, and how far away it is. For things
-- found OUTDOORS: a wallet on the street beside 109 Walker Road was reported as
-- "in a building the address book does not name" (2026-09-11), which was false
-- twice over - it was not in a building, and the building next to it had a
-- name. Searches the point's own 64-tile bucket and its neighbours, which the
-- book already builds, so this costs a handful of comparisons.
function M.nearest(x,y,within)
    local best,distance=nearestRecord(x,y,within)
    if not best then return nil end
    return qualified(best.label,best.town),distance
end
-- THE TWO HALVES OF AN ADDRESS, unqualified: the label as the book holds it,
-- and the town it belongs to (nil outside the named towns).
--
-- A caller that REMEMBERS an address must remember these two and call M.qualify
-- at read time, never keep what labelForBuilding returned. The qualified form
-- depends on where the survivor is standing now, so a remembered one is frozen:
-- a label first read in Muldraugh never gained ", Muldraugh" once the survivor
-- was in West Point, and a real game found 0 of 16 records naming the town they
-- were about (campaign 20260918T005315). Qualifying costs one compare and the
-- town is re-measured at most every TOWN_EVERY_MS - never per rendered row.
function M.labelParts(id)
    if not book or type(id)~="string" or id=="" then return nil end
    local r=byId["t3:"..id]
    if not r or type(r.label)~="string" or r.label=="" then return nil end
    return r.label,r.town
end
-- What the survivor would write for those two halves, here and now.
function M.qualify(label,town) return qualified(label,town) end
-- The address for a building id, or nil. Keyed exactly as the book is built:
-- every id here comes from BuildingDef:getIDString(), the same call T3Nearby
-- and the audit at line 121 use, so an observedKeyDoor building id resolves
-- directly. Returns nil for a building the book never gave an address to -
-- a shed off a dirt road is not "useful" and never gets one.
function M.labelForBuilding(id)
    local label,town=M.labelParts(id)
    if not label then return nil end
    return qualified(label,town)
end
function M.stop() if handler then Events.OnTick.Remove(handler) end; job=nil;stopAudit() end
function M.describe(body,case)
    if not book then return nil end
    local out=body
    for _,site in ipairs(case.locations) do
        local r=byId[site.id]
        if not r or site.mapId~=book.map or site.bounds.x1~=r.x or site.bounds.y1~=r.y or site.bounds.x2~=r.x2 or site.bounds.y2~=r.y2 then return nil end
        local parts,start={},1
        while true do
            local a,b=out:find(site.name,start,true)
            if not a then parts[#parts+1]=out:sub(start); break end
            parts[#parts+1]=out:sub(start,a-1);parts[#parts+1]=qualified(r.label,r.town);start=b+1
        end
        out=table.concat(parts)
    end
    return out
end
function M.draw(ui)
    if not book or not allowed() or not ui.mapAPI or ui.mapAPI:getZoomF()<18 then return end
    local visited=WorldMapVisited.getInstance()
    local api=ui.mapAPI
    local minX,minY,maxX,maxY=math.huge,math.huge,-math.huge,-math.huge
    for _,p in ipairs({{0,0},{ui.width,0},{0,ui.height},{ui.width,ui.height}}) do
        local x,y=api:uiToWorldX(p[1],p[2]),api:uiToWorldY(p[1],p[2])
        minX,minY,maxX,maxY=math.min(minX,x),math.min(minY,y),math.max(maxX,x),math.max(maxY,y)
    end
    if maxX-minX>1024 or maxY-minY>1024 then return end
    view={minX=minX,minY=minY,maxX=maxX,maxY=maxY};viewReasons={}
    local occupied,drawn,checked={},0,0
    -- Fixed work limits keep the same labels visible regardless of frame timing.
    for bx=math.floor(minX/64),math.floor(maxX/64) do for by=math.floor(minY/64),math.floor(maxY/64) do
        for _,r in ipairs(buckets[bx..":"..by] or {}) do
            if drawn>=80 or checked>=512 then return end
            checked=checked+1
            viewReasons[r.id]="hidden by native map knowledge"
            local cx,cy=(r.x+r.x2-1)/2,(r.y+r.y2-1)/2
            if visited:isKnown(math.floor(cx),math.floor(cy)) and visited:isKnown(r.x,r.y) and visited:isKnown(r.x2-1,r.y)
                and visited:isKnown(r.x,r.y2-1) and visited:isKnown(r.x2-1,r.y2-1) then
                viewReasons[r.id]="outside label screen margins"
                local x,y=api:worldToUIX(cx,cy),api:worldToUIY(cx,cy)
                local number=r.label:match("^%d+")
                local width=getTextManager():MeasureStringX(UIFont.Small,number or "")
                local height=getTextManager():getFontHeight(UIFont.Small)+4
                if number and x>width/2+12 and x<ui.width-width/2-12 and y>60 and y<ui.height-100 then
                    local key=math.floor(x/48)..":"..math.floor(y/24)
                    viewReasons[r.id]="suppressed by label overlap"
                    if not occupied[key] then
                        viewReasons[r.id]="drawn"
                        occupied[key]=true;drawn=drawn+1
                        ui:drawText(number,x-width/2,y-height/2,0.12,0.10,0.08,1,UIFont.Small)
                    end
                end
            end
        end
    end end
end
-- Explicit development-only, read-only audit of the last close-zoom map view.
function M.audit()
    if not allowed() or not book or not view then log("Open the world map and zoom in first.");return false end
    if job then log("Wait for address generation to finish first.");return false end
    stopAudit()
    local area,reasons=view,viewReasons
    local buildings=getWorld():getMetaGrid():getBuildings()
    local i,missing,drawn,details,detailIndex=0,0,0,{},1
    log("Audit begin: last map viewport; original numbers and map knowledge remain unchanged.")
    auditHandler=function()
        local started=getTimeInMillis()
        local ok,why=pcall(function()
            if i>=buildings:size() then
                if details[detailIndex] then log(details[detailIndex]);detailIndex=detailIndex+1;return end
                log("Audit complete: "..drawn.." drawn buildings, "..missing.." other footprints (all detailed).")
                stopAudit();return
            end
            for _=1,256 do
                if i>=buildings:size() then
                    return
                end
                local b=buildings:get(i);i=i+1
                local x,y,x2,y2=b:getX(),b:getY(),b:getX2(),b:getY2()
                local cx,cy=(x+x2-1)/2,(y+y2-1)/2
                if not b:isBasement() and cx>=area.minX and cx<=area.maxX and cy>=area.minY and cy<=area.maxY then
                    local id=tostring(b:getIDString());local assigned=byId["t3:"..id]
                    local reason=assigned and (reasons[id] or "outside rendered candidates/work limit") or "no assigned address"
                    if reason=="drawn" then drawn=drawn+1 else
                        missing=missing+1
                        local names={};local rooms=b:getRooms()
                        for n=0,math.min(rooms:size(),16)-1 do names[#names+1]=tostring(rooms:get(n):getName()) end
                        details[#details+1]="Audit "..x..","..y..".."..x2..","..y2.." id="..id.." reason="..reason.." address="..(assigned and assigned.label or "none").." rooms="..table.concat(names,",")
                    end
                end
                if getTimeInMillis()-started>=1 then return end
            end
        end)
        if not ok then stopAudit();log("Audit stopped: "..tostring(why)) end
    end
    Events.OnTick.Add(auditHandler);return true
end
local function hook()
    require("ISUI/Maps/ISWorldMap")
    if not ConspiracyFiles.addressMapRenderHook then
        local previous=ISWorldMap.render
        ISWorldMap.render=function(ui,...)
            previous(ui,...)
            local m=ConspiracyFiles.AddressMap
            if m and not m.renderFailed then
                local ok,why=pcall(m.draw,ui)
                if not ok then m.renderFailed=true;log("labels disabled: "..tostring(why)) end
            end
        end
        ConspiracyFiles.addressMapRenderHook=true
    end
end
function M.start(options)
    options=options or {}
    if not allowed() then return false,"debug single player required for trial" end
    if job then return false,"address index already building" end
    local world=getWorld(); if not world then return false,"load a game first" end
    local map=tostring(world:getMap()); local build=tostring(getGameVersion())
    if build~="42.20" and build~="42.20.4" then return false,"unverified game build" end
    if not map:find("Muldraugh, KY",1,true) then return false,"unsupported map" end
    hook()
    local existing=ModData.get(TAG)
    if not (existing and existing.canonical) then
        if book and book.shipped then return true end
        local loadStarted=getTimeInMillis()
        local shipped,why=shippedBook(map,build)
        if shipped then
            use(shipped)
            M.loadMs=getTimeInMillis()-loadStarted
            status="Ready: "..#shipped.records.." shipped addresses for the whole map in "..M.loadMs.." ms; nothing scanned or saved. Zoom in on the world map."
            log(status)
            return true
        end
        log("Shipped addresses not used: "..tostring(why))
        if options.noScan then return false,why end
    end
    local frozen
    if existing and existing.canonical then
        if not valid(existing.canonical) or existing.canonical.map~=map or existing.canonical.build~=build then return false,"saved address book refused; no renumbering" end
        use(existing.canonical)
        if book.coverage==3 then log("Restored "..#book.records.." fixed addresses. Zoom in on the world map.");return true end
        frozen=book.records
        log("Filling address gaps; preserving all "..#frozen.." existing addresses.")
    end
    local buildings=world:getMetaGrid():getBuildings()
    local index,records,current,ri,names=0,{},nil,0,{}
    local lastReport=getTimeInMillis(); peak=0
    status="Scanning building metadata; keep game unpaused"
    job=function()
        if current then
            local rooms=current:getRooms()
            if ri<rooms:size() then names[rooms:get(ri):getName() or ""]=true;ri=ri+1;return false end
            local useful=false
            for name in pairs(names) do if name~="garage" and name~="garagestorage" and name~="shed" and name~="" then useful=true end end
            if useful then records[#records+1]={id=tostring(current:getIDString()),x=current:getX(),y=current:getY(),x2=current:getX2(),y2=current:getY2()} end
            current=nil;return false
        end
        if index>=buildings:size() then
            buildings=nil
            status="Matching roads for "..#records.." buildings"; log(status)
            job=Core.build(records,Roads,function(result,rejected)
                local root={revision=Core.REVISION,map=map,build=build,records=result,coverage=3}
                if not valid(root) then error("address root invalid or exceeds 400 KB; nothing committed") end
                local within,why=require("ConspiracyFiles/SaveBudget").check("addresses",root)
                if not within then error(why) end
                ModData.getOrCreate(TAG).canonical=root
                use(root);status="Ready: "..#result.." fixed addresses; "..rejected.." unresolved; peak callback "..peak.." ms. Zoom in on the world map.";log(status)
            end,function(n,total) status="Matching roads: "..n.." / "..total.." buildings" end,frozen)
            return false
        end
        local b=buildings:get(index);index=index+1
        status="Scanning metadata: "..index.." / "..buildings:size().." buildings; keep game unpaused"
        if not b:isBasement() and b:getX()>=10000 and b:getX2()<=11500 and b:getY()>=9000 and b:getY2()<=11000 and b:getRooms():size()>0 then current=b;ri=0;names={} end
        return false
    end
    handler=function()
        local started=getTimeInMillis()
        local ok,why=pcall(function()
            for _=1,256 do
                if job() then M.stop();return end
                if getTimeInMillis()-started>=1 then return end
            end
        end)
        peak=math.max(peak,getTimeInMillis()-started)
        if not ok then M.stop();status="Stopped: "..tostring(why);log(status)
        elseif job and getTimeInMillis()-lastReport>=5000 then log(status);lastReport=getTimeInMillis() end
    end
    Events.OnTick.Add(handler); log("Building full Muldraugh trial address index; no terrain revealed.")
    return true
end
-- At game start: a save's own book when it has one, otherwise the shipped
-- numbers - never a scan, which still only begins when a case asks for one.
Events.OnGameStart.Add(function() if allowed() then M.start({noScan=not ModData.get(TAG)}) end end)
return M
