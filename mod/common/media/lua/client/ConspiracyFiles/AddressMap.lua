local Core=require("ConspiracyFiles/Generated/AddressIndex")
local Roads=require("ConspiracyFiles/Generated/AddressRoads")
local V=require("ConspiracyFiles/Validator")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.AddressMap and ConspiracyFiles.AddressMap.stop then ConspiracyFiles.AddressMap.stop() end
local M={}; ConspiracyFiles.AddressMap=M
local TAG="ConspiracyFiles.AddressBook.Muldraugh"
local job,handler,book,byId,buckets,peak=nil,nil,nil,{}, {},0
local function log(s) print("[CF-ADDRESS] "..s) end
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
    for _,r in ipairs(root.records) do
        byId["t3:"..r.id]=r
        local cx,cy=(r.x+r.x2-1)/2,(r.y+r.y2-1)/2
        local key=math.floor(cx/64)..":"..math.floor(cy/64)
        buckets[key]=buckets[key] or {}; buckets[key][#buckets[key]+1]=r
    end
end
function M.ready() return book~=nil end
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
            parts[#parts+1]=out:sub(start,a-1);parts[#parts+1]=r.label;start=b+1
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
function M.start()
    if not allowed() then return false,"debug single player required for trial" end
    if job then return false,"address index already building" end
    local world=getWorld(); if not world then return false,"load a game first" end
    local map=tostring(world:getMap()); local build=tostring(getGameVersion())
    if build~="42.20" and build~="42.20.4" then return false,"unverified game build" end
    if not map:find("Muldraugh, KY",1,true) then return false,"unsupported map" end
    hook()
    local existing=ModData.get(TAG)
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
Events.OnGameStart.Add(function() if allowed() and ModData.get(TAG) then M.start() end end)
return M
