-- VEHICLE-HOST FALLBACK (phase 7), the pure side. A vehicle-hosted note scene whose vehicle is not there when
-- the survivor arrives is moved ONCE to a building. This file only chooses the building and the new site;
-- the runtime asks the engine whether a vehicle exists and commits the move (Session.api.moveWaiting).
-- Ids, codes and numbers only.
local Story=require("OIShared/StoryPlacer")
local V={}
V.NO_VEHICLE_TILES=25   -- no allowed vehicle within this many tiles of the site -> the host is missing
V.MAX_MOVE=60           -- the new building lies within this many tiles of the site

-- Does a vehicle script name (with or without "Base.") appear in the allowed list?
function V.allowed(script,list)
    local bare=tostring(script):gsub("^.*%.","")
    for _,w in ipairs(list or {}) do if w==bare then return true end end
    return false
end

-- pick(buildings, used, cx, cy, wantCat) -> building | nil, why
--   buildings: parsed rows (StoryPlacer.parseBuildings), used: set building id -> anything (the world's
--   global used set: every story, batch and earlier fallback), wantCat: place code (0/nil = none).
--   Nearest free eligible building of that category within MAX_MOVE, else nearest ordinary one (cat 0).
--   Ties by id. nil, "none" when no building is free.
function V.pick(buildings,used,cx,cy,wantCat)
    local bestCat,bestCatD,bestOrd,bestOrdD
    for _,b in ipairs(buildings) do
        if not used[b.id] and Story.eligible(b) then
            local d=math.max(math.abs(b.cx-cx),math.abs(b.cy-cy))
            if d<=V.MAX_MOVE then
                if wantCat and wantCat>0 and b.cat==wantCat then
                    if not bestCat or d<bestCatD or (d==bestCatD and b.id<bestCat.id) then bestCat,bestCatD=b,d end
                elseif b.cat==0 then
                    if not bestOrd or d<bestOrdD or (d==bestOrdD and b.id<bestOrd.id) then bestOrd,bestOrdD=b,d end
                end
            end
        end
    end
    if bestCat then return bestCat,bestCatD,true end
    if bestOrd then return bestOrd,bestOrdD,false end
    return nil,"none"
end

-- The appended world-record site for the move: a copy of the decided site, pointed at the building.
function V.site(site,b,matched)
    local s={}
    for k,v in pairs(site) do s[k]=v end
    s.id=site.id..":fb"; s.areaId=s.id
    s.bounds={x1=b.x,y1=b.y,x2=b.x2,y2=b.y2,z=0}
    s.name="A place at "..math.floor(b.cx)..", "..math.floor(b.cy)
    local old=type(site.batch)=="table" and site.batch or {}
    s.batch={host="building",fallback=1,town=b.town,area=b.area,building=b.id,cat=b.cat,matched=matched and true or false,from=old.building}
    s.story=nil
    return s
end

return V
