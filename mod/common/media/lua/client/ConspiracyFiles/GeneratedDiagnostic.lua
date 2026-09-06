-- Read-only owner-triggered diagnostic. No item, save or placement mutations.
local D={}
local active
function D.run()
    if active then return false,"diagnostic running" end
    if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer()) then return false,"debug single player required" end
    local wrapper=ModData.get("ConspiracyFiles.Generated.G2")
    local current=wrapper and require("ConspiracyFiles/Generated/SuccessiveCases").current(wrapper)
    local root=current and current.canonical
    if not root or not root.case then return false,"no generated case" end
    local function log(s) print("[CF-G2-DIAG] "..s) end
    local player=getPlayer()
    if player then log("player="..player:getX()..","..player:getY()..","..player:getZ()) end
    local tasks={}
    for _,doc in ipairs(root.case.documents) do
        local a=root.assignments[doc.id]; local t=a.target
        log("document="..doc.title.." status="..a.status.." target="..t.x..","..t.y..","..t.z..
            " object="..t.objectIndex.." container="..t.containerIndex.." type="..t.containerType.." sprite="..t.sprite)
        tasks[#tasks+1]={doc=doc,a=a,oi=0,ci=0,ii=0}
    end
    local cursor=1
    local function step()
        local task=tasks[cursor]
        if not task then return true end
        local t=task.a.target
        local square=getCell():getGridSquare(t.x,t.y,t.z)
        if not square then log("target unloaded: "..task.doc.title); cursor=cursor+1; return end
        local objects=square:getObjects()
        if task.oi>=objects:size() or task.oi>=32 then
            if objects:size()>32 then log("objects truncated at 32") end
            cursor=cursor+1; return
        end
        local o=objects:get(task.oi)
        if not o.getContainerCount or task.ci>=o:getContainerCount() or task.ci>=8 then task.oi=task.oi+1; task.ci=0; task.ii=0; return end
        local c=o:getContainerByIndex(task.ci)
        if not c then task.ci=task.ci+1; task.ii=0; return end
        local items=c:getItems()
        if task.ii==0 then
            local sprite=o:getSprite()
            log("actual object="..task.oi.." container="..task.ci.." type="..c:getType()..
                " sprite="..tostring(sprite and sprite:getName()).." explored="..tostring(c:isExplored()).." items="..items:size())
        end
        if task.ii>=items:size() or task.ii>=128 then
            if items:size()>128 then log("contents truncated at 128") end
            task.ci=task.ci+1; task.ii=0; return
        end
        local item=items:get(task.ii); local md=item:getModData()
        log("item="..tostring(item:getName()).." matchesExpectedToken="..tostring(md.cfPhysicalToken==task.a.physicalToken))
        task.ii=task.ii+1
    end
    active=function()
        local begin=getTimeInMillis()
        local ok,err=pcall(function()
            for i=1,16 do
                if step() then Events.OnTick.Remove(active); active=nil; log("complete"); return end
                if getTimeInMillis()-begin>=1 then return end
            end
        end)
        if not ok then Events.OnTick.Remove(active); active=nil; log("error="..tostring(err)) end
    end
    Events.OnTick.Add(active)
    return true
end
return D
