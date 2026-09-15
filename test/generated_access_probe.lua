-- Bounded reachability probe. Mock engine only: no rendering, no world writes.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
Cases.current=function(store) return store end
Cases.sessions=function(w) return {w.canonical} end

local printed,ticks={},{}
local realPrint=print
print=function(s) printed[#printed+1]=tostring(s) end
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return 0 end
Events={OnTick={Add=function(f) ticks[#ticks+1]=f end,Remove=function(f) for i,c in ipairs(ticks) do if c==f then table.remove(ticks,i) end end end}}

-- Basement square deliberately reports z=-1; one staircase sits above it.
local function square(x,y,z)
    return {getZ=function() return z end,getRoom=function() return {getName=function() return z<0 and "basement" or "kitchen" end} end,
        getObjects=function() return {size=function() return 2 end} end,
        HasStairs=function() return x==5 and y==5 and z==0 end}
end
local absent={}
getCell=function() return {getGridSquare=function(_,x,y,z)
    if absent[x..":"..y..":"..z] then return nil end
    if z<-1 or z>0 then return nil end
    return square(x,y,z)
end} end
local root={case={documents={{id="d1",title="Ledger page"}}},assignments={d1={target={x=5,y=6,z=-1}}},known={}}
ModData={get=function() return {canonical=root} end}

local D=dofile('mod/common/media/lua/client/ConspiracyFiles/GeneratedDiagnostic.lua')
assert(ConspiracyFiles.GeneratedDiagnostic==D,'published on the shared table so reloadLuaFile replaces it')
assert(D.access(2),'probe starts')
assert(not D.access(2),'re-entry guard refuses a second concurrent probe')
local guard=0
while #ticks>0 do ticks[1](); guard=guard+1; assert(guard<20000,'probe must terminate') end
local joined=table.concat(printed,"\n")
assert(joined:find("Ledger page 5,6,-1 -> actual z=-1",1,true),'reports the resolved level\n'..joined)
assert(not joined:find("Z MISMATCH",1,true),'matching level is not flagged')
assert(joined:find("stairs at 5,5,0",1,true),'finds the staircase above the basement\n'..joined)
assert(joined:find("level -1: squares=",1,true) and joined:find("complete",1,true),'summarises each level')

-- A target whose real square sits on another level must be called out.
printed={}
root.assignments.d1.target={x=5,y=6,z=-1}
local realGetCell=getCell
getCell=function() return {getGridSquare=function(_,x,y,z) return square(x,y,0) end} end
assert(D.access(1)); guard=0
while #ticks>0 do ticks[1](); guard=guard+1; assert(guard<20000) end
assert(table.concat(printed,"\n"):find("Z MISMATCH",1,true),'aliased level is flagged')

-- An absent target square is reported, not silently skipped.
printed={}; getCell=realGetCell; absent["5:6:-1"]=true
assert(D.access(1)); guard=0
while #ticks>0 do ticks[1](); guard=guard+1; assert(guard<20000) end
assert(table.concat(printed,"\n"):find("NO SQUARE",1,true),'absent target reported')

print=realPrint
print('PASS access probe: level resolution, z mismatch, absent square, stairs, bounded termination, re-entry guard')
