-- STAGES FOR checks/mystery_farmer.sh.
--
-- Proves the second hand-authored mystery live: a heard PRIMARY finding
-- recognised through MysteryRuntime.hear() (not a debug ledger flip), an
-- "answer" GATE that the attacker frame's Phase E finding demands must
-- refuse to fire until its own precondition finding is genuinely known,
-- and CLOSE reporting "carried" throughout - proving that ending shape
-- natively for the first time.
CFMyst={}
local K=CFMyst

function K.attach()
    local Content=require("ConspiracyFiles/Mystery/Content/FarmerRecalledDelivery")
    local ok,why=ConspiracyFiles.MysteryRuntime.attach(Content)
    return tostring(ok),tostring(why)
end

function K.place()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local ok,n=ConspiracyFiles.MysteryRuntime.place(ConspiracyFiles.MysteryRuntime.current,x,y,z)
    return tostring(ok),tostring(n)
end

-- Same collect-then-move two-pass pattern as mystery_electrician.lua's
-- K.collect - removing from a container while walking its own item list
-- shrinks the list under the loop.
function K.collect()
    local p=getPlayer()
    local x,y,z=math.floor(p:getX()),math.floor(p:getY()),math.floor(p:getZ())
    local cell=getCell()
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

-- The second channel's own minimal placement primitive, called directly
-- here because this repo has no overheard-dialogue system yet to wire it
-- to - the real trigger this stands in for is named in MysteryRuntime.hear
-- itself.
function K.hear(findingId)
    local ok,why=ConspiracyFiles.MysteryRuntime.hear(findingId)
    return tostring(ok),tostring(why)
end

-- The survivor's own act of answering - deliberately callable BEFORE the
-- rumour is heard, so the driver can prove the GATE's own precondition
-- check is what withholds "reading", not the order stages happen to run in.
function K.giveAnswer(gateProduces)
    local ok=ConspiracyFiles.MysteryRuntime.giveAnswer(gateProduces)
    return tostring(ok)
end

function K.poll()
    ConspiracyFiles.MysteryRuntime.pollInventory()
    ConspiracyFiles.MysteryRuntime.pollGates()
    return "polled"
end

function K.status()
    return tostring(ConspiracyFiles.MysteryRuntime.status())
end

function K.record()
    local out={}
    for _,r in ipairs(ConspiracyFiles.MysteryRuntime.record()) do out[#out+1]=r.text end
    return table.concat(out," | ")
end

return "mystery farmer stages loaded"
