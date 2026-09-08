-- Bounded scan of observed room rectangles; accepts only loaded real furniture.
local N=require("ConspiracyFiles/Generated/NearbyCatalog")
local V=require("ConspiracyFiles/Validator")
local W=require("ConspiracyFiles/WorldAccess")
local M={}
local kinds={desk=true,counter=true,shelves=true,filingcabinet=true,locker=true}
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
        if not r then done(catalog,targets,candidates,rooms,occupied); return true end
        local id="t3:"..r.building
        local site=sites[id]
        if not site or (targets[id] and r.z~=targets[id].z) or (candidates[id] and #candidates[id]>=8) then index=index+1; dx,dy,oi,ci=0,0,0,0; objects=nil; return false end
        local x,y=r.x+dx,r.y+dy
        local b=site.bounds
        if x<b.x1 or x>=b.x2 or y<b.y1 or y>=b.y2 then nextTile(r); return false end
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
        if c and name and kinds[c:getType()] and (r.z==0 or reachable(x,y,r.z)) then
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
                site.paperStorage="observed";local types={};for _,v in ipairs(site.containerTypes) do types[v]=true end;types[c:getType()]=true;site.containerTypes={};for k in pairs(types) do if #site.containerTypes<5 then site.containerTypes[#site.containerTypes+1]=k end end;table.sort(site.containerTypes)
                site.source.reference="G2 loaded container inside T3 room footprint"
            end
        end
        ci=ci+1
        return false
    end
end
return M
