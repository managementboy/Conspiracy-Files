-- Native placement gate. Uses real fill/exploration state; never manufactures it.
-- Each interruption is scoped to one design's payoff. A positive pass requires
-- an observed insertion, exactly one physical token and the same saved state.
CFPlace = CFPlace or {}
local P = CFPlace
local R = ConspiracyFiles.MapMediaRuntime
local C = require("ConspiracyFiles/MapMediaCatalogue")
local World = require("ConspiracyFiles/WorldAccess")
local TAG = "ConspiracyFiles.MapMedia"
local function payoff(id)
    local w=ModData.get(TAG)
    local t=w and w.canonical and w.canonical.trails[id]
    return t and t.payoff
end
function P.usable(count)
    local out,buildings={},{}
    for _,id in ipairs(C.list) do
        local c=R.coverage(id)
        local e=C.get(id)
        if c and c.buildings==1 and c.areas==0 and not c.active and e.targets[1] then
            local t=e.targets[1];local key=t.x..":"..t.y
            if not buildings[key] then
                buildings[key]=true;out[#out+1]=id
                if #out>=(count or 5) then break end
            end
        end
    end
    return table.concat(out,",")
end
function P.goTo(id)
    local e=C.get(id);if not e then return false,"unknown design" end
    local t=e.targets[1]
    require "ISUI/ISInventoryPaneContextMenu"
    local m=getPlayer():getInventory():AddItem("Base.RosewoodMap")
    if not m then return false,"no map item" end
    m:setStashMap(id)
    ISInventoryPaneContextMenu.onCheckMap(m,0)
    getPlayer():teleportTo(t.x+0.5,t.y+0.5,0)
    return true,t.x..","..t.y
end
-- A fresh scheduler isolates deliberately injected errors from its ordinary
-- three-failure circuit breaker. Canonical state and physical items survive.
function P.reset() return R.start() end
function P.arm(point,id)
    R.injectFault(nil)
    if point=="none" then return true end
    return R.injectFault(point,id,4)
end
function P.clear() return R.injectFault(nil) end
function P.fired(id,point)
    local status=R.status();local f=status and status.lastFault
    return f~=nil and f.id==id and f.part==4 and f.point==point
end
function P.faultState()
    local f=R.status().lastFault
    return f and f.recorded or "not-consumed"
end
-- Inspect the exact persisted target (all container indexes and z levels are
-- supported by World.resolve). Unloaded/unresolvable is unknown, not absence.
-- Also count the loaded scan neighbourhood to catch a second physical copy.
function P.items(id)
    local p=payoff(id)
    if not p or not p.target then return -1,"no-target" end
    local target,why=World.resolve(p.target)
    if not target then return -1,tostring(why or "unobservable") end
    local counted,n={},0
    local function count(c)
        if not c or counted[c] then return end
        counted[c]=true
        local items=c:getItems()
        for i=0,items:size()-1 do
            local item=items:get(i);local md=item:getModData()
            if md and md.cfMapDesign==id and md.cfMapPart==4 then n=n+1 end
            if instanceof(item,"InventoryContainer") then count(item:getInventory()) end
        end
    end
    count(target)
    local player=getPlayer();local cell=getCell()
    for dx=-24,24 do for dy=-24,24 do
        local s=cell:getGridSquare(math.floor(player:getX())+dx,math.floor(player:getY())+dy,p.target.z)
        if s then
            local objects=s:getObjects()
            for i=0,objects:size()-1 do
                local o=objects:get(i)
                for ci=0,o:getContainerCount()-1 do count(o:getContainerByIndex(ci)) end
            end
        end
    end end
    count(player:getInventory())
    return n,"observed"
end
function P.state(id) local p=payoff(id);return p and p.state or "none" end
function P.placed(id) return P.state(id)=="placed" end
function P.observable(id)
    local p=payoff(id);return p and p.target and World.resolve(p.target)~=nil or false
end
function P.targetVisit(id)
    local p=payoff(id)
    if not p or not p.target then return false end
    getPlayer():teleportTo(p.target.x+0.5,p.target.y+0.5,p.target.z)
    return true
end
function P.verdict(id)
    local state=P.state(id);local n=P.items(id)
    if n<0 then return "INCONCLUSIVE",state,n end
    if n>1 then return "DUPLICATE",state,n end
    if state=="placed" and n==0 then return "BAD",state,n end
    if state~="placed" or n~=1 then return "INCONCLUSIVE",state,n end
    return "ok",state,n
end
