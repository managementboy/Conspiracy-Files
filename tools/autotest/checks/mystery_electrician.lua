-- STAGES FOR checks/mystery_electrician.sh.
--
-- Proves the new engine end to end, live: attach the electrician's
-- "unsigned repair" mystery (MysteryRuntime.lua, a fully separate runtime
-- from the legacy generator), place its findings near the survivor,
-- recognise them by picking them up, satisfy its skill GATE, and read
-- CLOSE reporting "completed".
CFMyst={}
local K=CFMyst

function K.attach()
    local Content=require("ConspiracyFiles/Mystery/Content/ElectricianUnsignedRepair")
    local ok,why=ConspiracyFiles.MysteryRuntime.attach(Content)
    return tostring(ok),tostring(why)
end

function K.place()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local ok,n=ConspiracyFiles.MysteryRuntime.place(ConspiracyFiles.MysteryRuntime.current,x,y,z)
    return tostring(ok),tostring(n)
end

-- Pick up every marked item near the player - a plain AddItem transfer,
-- not the legacy engine's timed action, since this proves the new
-- runtime's own recognition path (pollInventory), not the shared UI.
function K.collect()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local cell=getCell()
    -- Collect first, move second: removing from a container while walking
    -- its own item list shrinks the list under the loop and the next index
    -- goes out of bounds (CaseFile.fileEvidence's own comment names this
    -- exact shape). Found live, 2026-09-26: "Index 6 out of bounds for
    -- length 5" after the first Remove call on a 3-item list.
    local marked={}
    for dx=-1,1 do for dy=-1,1 do
        local sq=cell:getGridSquare(x+dx,y+dy,z)
        local objects=sq and sq:getObjects()
        for i=0,(objects and objects:size() or 0)-1 do
            local obj=objects:get(i)
            if obj and obj.getContainerCount and obj:getContainerCount()>0 then
                local container=obj:getContainerByIndex(0)
                local items=container and container:getItems()
                for j=0,(items and items:size() or 0)-1 do
                    local it=items:get(j)
                    local md=it and it:getModData()
                    if type(md)=="table" and md.cfMysteryId then
                        marked[#marked+1]={item=it,container=container}
                    end
                end
            end
        end
    end end
    local moved=0
    for _,entry in ipairs(marked) do
        local ok=pcall(function() entry.container:Remove(entry.item); p:getInventory():AddItem(entry.item) end)
        if ok then moved=moved+1 end
    end
    return tostring(moved)
end

function K.poll()
    ConspiracyFiles.MysteryRuntime.pollInventory()
    ConspiracyFiles.MysteryRuntime.pollGates()
    return "polled"
end

function K.setSkill(level)
    local ok,why=pcall(function() getPlayer():setPerkLevelDebug(Perks.Electricity,level) end)
    return tostring(ok),tostring(why)
end

function K.status()
    return tostring(ConspiracyFiles.MysteryRuntime.status())
end

function K.record()
    local out={}
    for _,r in ipairs(ConspiracyFiles.MysteryRuntime.record()) do out[#out+1]=r.text end
    return table.concat(out," | ")
end

return "mystery electrician stages loaded"
