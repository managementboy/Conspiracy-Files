-- Shift+L debug hotkey (ClueWhere): silent outside debug, key not bound there,
-- shift required, nearest clue chosen, log only.
package.path="mod-ofinterest/common/media/lua/client/?.lua;mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
OIShared={}
local rows={
 {id="far",x=100,y=100,z=0,status="placed",place="p1"},
 {id="near",x=12,y=10,z=0,status="placed",place="vehicle:tok",vehicle=true,part="TruckBed"},
 {id="otherfloor",x=10,y=10,z=2,status="pending",place="p3"},
}
package.loaded["OIShared/EngineAPI"]={GeneratedRuntime={clueTargets=function() return rows end}}
local bound={}
package.loaded["OIShared/Events/EngineEvents"]={on=function(n,f) bound[#bound+1]={n,f} end}
Events={OnKeyPressed={}}
Keyboard={KEY_L=38}
local player={getX=function() return 10 end,getY=function() return 10 end,getZ=function() return 0 end}
getPlayer=function() return player end
local shift=true
isShiftKeyDown=function() return shift end
local out={}
local real=print
print=function(s) out[#out+1]=tostring(s) end
local function load(debug)
    getDebug=function() return debug end
    for _,m in ipairs{"OIShared/Log","OIShared/ClueWhere"} do package.loaded[m]=nil end
    OIShared={}; bound={}
    return require("OIShared/ClueWhere")
end
local function check(c,m) if not c then print=real; error(m,2) end end

-- not debug: key not bound, handler silent even if called by hand
local W=load(false)
check(#bound==0,"key bound outside debug")
W.onKey(38); check(#out==0,"output outside debug")
check(W.report()==false and #out==0,"report outside debug")

-- debug: bound, shift required, other key ignored
W=load(true)
check(#bound==1 and bound[1][1]=="OnKeyPressed","not bound in debug")
shift=false; bound[1][2](38); check(#out==0,"fired without shift")
shift=true; bound[1][2](37); check(#out==0,"fired on wrong key")
bound[1][2](38)
check(#out==1,"expected one log line, got "..#out)
local l=out[1]
check(l:find("ev=clue_where",1,true) and l:find("doc=near",1,true),"nearest not chosen: "..l)
check(l:find("status=placed",1,true) and l:find("x=12",1,true) and l:find("y=10",1,true) and l:find("z=0",1,true),"fields: "..l)
check(l:find("vehicle=TruckBed",1,true) and l:find("dist=2.0",1,true),"part/dist: "..l)
-- nearest is 3D: move up to floor 2
player.getZ=function() return 2 end
out={}; bound[1][2](38)
check(out[1]:find("doc=otherfloor",1,true) and out[1]:find("status=pending",1,true),"3D nearest: "..out[1])
-- no rows
rows={}; out={}; bound[1][2](38)
check(#out==1 and out[1]:find("n=0",1,true),"empty list line")
print=real
print("PASS nohelp_clue_where")
