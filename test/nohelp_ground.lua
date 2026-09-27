-- No Help, task 3 plan step 2: a clue may lie on open ground (owner,
-- 2026-09-27: "place the clues anywhere that is interesting").
--
-- The ground answers the few questions the engine asks a container, so the
-- same placement, counting, hint and relocation code runs on it. This holds
-- that adapter against a stand-in square, and the Session's rule for what a
-- ground target may be. Whether Search Mode spots an item lying in a garden in
-- the real game, by day and at dusk, is the visible playtest's (plan step 8).
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path

-- A stand-in square with the engine's own shape: a Java-like list of world
-- objects, each holding one item.
local function javaList(t)
    return {size=function() return #t end,get=function(_,i) return t[i+1] end,
            remove=function(_,o) for i,v in ipairs(t) do if v==o then table.remove(t,i); return end end end}
end
local objects={}
local square={}
function square:getWorldObjects() return javaList(objects) end
function square:AddWorldInventoryItem(item,x,y,z)
    local o={item=item,sq=square}
    function o:getItem() return self.item end
    function o:removeFromWorld() self.gone=true end
    function o:removeFromSquare() for i,v in ipairs(objects) do if v==self then table.remove(objects,i) end end end
    function o:setSquare(s) self.sq=s end
    objects[#objects+1]=o
    return o
end
function square:transmitRemoveItemFromSquare(o) end
getCell=function() return {getGridSquare=function(_,x,y,z) if x==10 and y==20 and z==0 then return square end end} end

local function item(token)
    local md={cfPhysicalToken=token}
    local it={}
    function it:getModData() return md end
    function it:setWorldItem() end
    return it
end

local World=require("NHShared/WorldAccess")
local Session=require("NHShared/Generated/Session")

-- The target resolves to the ground at its square, and only a loaded one.
local target={x=10,y=20,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true}
local ground=assert(World.resolve(target),"a ground target resolves to its square")
assert(ground.ground==true)
local _,why=World.resolve({x=99,y=99,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true})
assert(why=="unloaded","ground somewhere not loaded waits, like any square")

-- Nobody loots or opens ground, and it always has room.
local Searched=require("NHShared/SearchedContainers")
assert(Searched.searched(ground)==false,"ground is never already searched")
assert(ground:hasRoomFor(nil,50)==true)

-- Placing a three-piece set on the ground, and counting it by its stamp.
for _=1,3 do assert(ground:AddItem(item("tok-1")),"an item can be laid on the ground") end
assert(ground:AddItem(item("someone-else")))
local counted
local scan=World.count(World.resolve(target),"tok-1",function(n) counted=n end,3)
for _=1,20 do if scan() then break end end
assert(counted==3,"the three pieces on the ground are counted by their stamp, got "..tostring(counted))

-- Removing takes exactly the item asked for, the way vanilla picks one up.
local g=World.resolve(target)
local items=g:getItems()
local first=items:get(0)
assert(g:Remove(first),"a piece is removed from the ground")
assert(#objects==3,"only that piece is gone")
assert(not g:Remove(item("never-here")),"removing something not there says so")

-- The Session's rule: inside the site's footprint and driveway margin, a
-- short word for the spot, and nothing else.
local site={bounds={x1=0,y1=0,x2=20,y2=30,z=0},containerTypes={"shelves"}}
assert(Session.target(target,site),"a ground spot in the footprint is a valid target")
assert(Session.isGround(target))
assert(not Session.isMobile(target),"ground does not travel")
local far={x=100,y=20,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true}
assert(not Session.target(far,site),"ground far outside the footprint is refused")
local extra={x=10,y=20,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true,colour="red"}
assert(not Session.target(extra,site),"a ground target carries no unknown fields")
local unnamed={x=10,y=20,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="",ground=true}
assert(not Session.target(unnamed,site),"a ground spot names what kind of spot it is")
-- A ground spot never shares an identity with furniture on the same square.
local cupboard={x=10,y=20,z=0,objectIndex=0,containerIndex=0,containerType="shelves",sprite="x"}
assert(Session.physicalKey(target)~=Session.physicalKey(cupboard),"a yard spot and a cupboard on one square are two places")
assert(World.resolve(target):getSourceGrid()==square,"the ground says where it stands")
print("nohelp ground: open ground holds, counts and gives up clues like a container")
