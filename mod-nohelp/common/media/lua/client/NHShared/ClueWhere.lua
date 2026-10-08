-- DEBUG-ONLY testing aid (owner, 2026-10-01): Shift+L writes the nearest
-- clue's id, status, x/y/z, place, vehicle part and distance to the LOG.
-- Nothing is drawn, nothing is spoken, and no clue text is ever printed.
-- A game that is not in debug mode never binds the key and the handler also
-- re-checks on every press, so players get nothing.
-- Key API as used by the installed game's own Lua (media/lua/client):
-- Events.OnKeyPressed passes the key code (ISUIHandler.onKeyPressed),
-- Keyboard.KEY_L (erosion/debug/DebugDemoTime.lua), isShiftKeyDown()
-- (ISInventoryPage.lua).
NHShared=NHShared or {}
local W=NHShared.ClueWhere or {}
NHShared.ClueWhere=W
local CFLog=require("NHShared/Log")

local function debugGame()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer()) and true or false
end

-- Pure: nearest row of `clues` to (px,py,pz), floor change counted as 1 tile
-- per level is not assumed; plain 3D distance. Rows without integer x,y,z are
-- ignored. Returns row,distance or nil.
function W.nearest(clues,px,py,pz)
    local best,bestD
    for _,c in ipairs(clues or {}) do
        if type(c)=="table" and type(c.x)=="number" and type(c.y)=="number" and type(c.z)=="number" then
            local dx,dy,dz=c.x-px,c.y-py,c.z-pz
            local d=math.sqrt(dx*dx+dy*dy+dz*dz)
            if not bestD or d<bestD then best,bestD=c,d end
        end
    end
    return best,bestD
end

function W.report()
    if not debugGame() then return false end
    local player=getPlayer and getPlayer()
    local R=require("NHShared/EngineAPI").GeneratedRuntime
    if not (player and R and R.clueTargets) then
        CFLog.write("i","clue_where",{why="no player or clue list"}); return false
    end
    local clues=R.clueTargets()
    local c,d=W.nearest(clues,player:getX(),player:getY(),player:getZ())
    if not c then
        CFLog.write("i","clue_where",{n=0,why="no clue has a position"}); return true
    end
    CFLog.write("i","clue_where",{doc=c.id,status=tostring(c.status),x=c.x,y=c.y,z=c.z,
        place=tostring(c.place),vehicle=c.vehicle and tostring(c.part) or "-",
        dist=string.format("%.1f",d),n=#clues})
    return true
end

function W.onKey(key)
    if not debugGame() then return end
    if key ~= (Keyboard and Keyboard.KEY_L) then return end
    if not (isShiftKeyDown and isShiftKeyDown()) then return end
    pcall(W.report)
end

-- Bound only in a debug game.
if debugGame() and Events and Events.OnKeyPressed and not W.bound then
    W.bound=true
    require("NHShared/Events/EngineEvents").on("OnKeyPressed",W.onKey)
end
return W
