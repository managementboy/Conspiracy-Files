-- E4 (DR-20260929-NOHELP-GAP-PLAN): the ZombieBuddy scene listener's lines
-- become confirmed scenes - every allowed kind, at its own point, in its
-- box - once the world record is open; with the listener present the trace
-- scan does not run. Kinds are taken from the table at run time, so this file
-- names none.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path
NHShared={}
Events=setmetatable({},{__index=function(t,k) local e={Add=function() end,Remove=function() end}; rawset(t,k,e); return e end})
isClient=function() return false end
isServer=function() return false end
getGameTime=function() return {getWorldAgeHours=function() return 7 end} end
getTimeInMillis=function() return 0 end
local Scenes=require("NHShared/Generated/VanillaScenes")
local SceneMatch=require("NHShared/Generated/SceneMatch")
local kind,other
for _,k in ipairs(Scenes.allowedKinds()) do
    if not Scenes.citation(k) then if not kind then kind=k elseif not other then other=k end end
end
assert(kind and other,"two allowed kinds")
-- A stand-in runtime: scenes by key, a world seed once the record is open.
local scenes,seed={},nil
NHShared.GeneratedRuntime={
    scene=function(key) return scenes[key] end,
    sceneSeen=function(key,rec) if scenes[key] and scenes[key].kind then return false,"decided" end; scenes[key]=rec; return true end,
    worldSeed=function() return seed end}
local queue={}
local drained=0
local R=require("NHShared/VanillaSceneRuntime")

-- No listener: said once, and the old path stays.
assert(R.listen()==false,"without the jar, no listener")
NHSceneDrain=function(max) drained=drained+1; local out={}; while #out<max and #queue>0 do out[#out+1]=table.remove(queue,1) end; return table.concat(out,"\n") end
queue={kind.."|building|100|200|120|230|0|110|215",
       "RBBasic|building|0|0|10|10|0|5|5",
       other.."|vehicle|300|300|304|309|0|302|305",
       "garbage line",
       kind.."|zone|500|500|500|500|0|505|506"}
-- The world record not open yet: nothing is drained, nothing lost.
assert(R.listen()==true and drained==0 and #queue==5,"lines wait in the jar until the world record is open")
seed=778
assert(R.listen()==true and #queue==0,"then drained")
local k1=SceneMatch.keyAt(110,215,0)
assert(scenes[k1] and scenes[k1].kind==kind and scenes[k1].source=="generated","a generated scene is confirmed at its own point")
assert(scenes[k1].x==110 and scenes[k1].y==215 and scenes[k1].z==0 and scenes[k1].hours==7)
local b=scenes[k1].bounds
assert(b.x1==100 and b.y1==200 and b.x2==120 and b.y2==230,"in its building's box")
assert(scenes[SceneMatch.keyAt(5,5,0)]==nil,"a kind that holds no clue is ignored")
assert(scenes[SceneMatch.keyAt(302,305,0)].kind==other,"a vehicle scene")
local k3=SceneMatch.keyAt(505,506,0)
local cb=scenes[k3].bounds
assert(cb.x2>cb.x1 and cb.y2>cb.y1,"an empty box falls back to the scene's cell")
-- Twice at one place: once.
queue={kind.."|building|100|200|120|230|0|110|215"}
local before=scenes[k1]
assert(R.listen()) ; assert(scenes[k1]==before,"a scene already confirmed there is not recorded again")
-- The save accepts the new source.
local S=require("NHShared/Generated/Session")
assert(S.validScenes({[k1]=scenes[k1]}),"a generated scene is valid in the save")
assert(not S.validScenes({[k1]={kind=kind,x=1,y=1,z=0,hours=1,source="guessed"}}),"an unknown source is not")
-- mod.info declares the dependency and the jar.
local info=assert(io.open("mod-nohelp/42/mod.info","rb")):read("*a")
assert(info:find("\nrequire=\\ZombieBuddy",1,true) and info:find("\njavaJarFile=media/java/NoHelpScenes.jar",1,true)
    and info:find("\njavaPkgName=conspiracyfiles.nohelp",1,true),"mod.info requires ZombieBuddy and names the jar")
assert(io.open("mod-nohelp/42/media/java/NoHelpScenes.jar","rb"),"the jar ships")
-- Health: the jar's status parsed; the state dump carries the counts.
NHSceneListener=function() return "2|9|0|1|0|NoSuchFieldException:x" end
local st=R.listenerStatus()
assert(st and st.version=="2" and st.seen==9 and st.failed==1 and st.err=="NoSuchFieldException:x","status parsed")
NHSceneListener=function() return "2|9|0|0|3|" end
assert(R.listenerStatus().err==nil and R.listenerStatus().queued==3,"no error, no err field")
local Dump=require("NHShared/StateDump")
local f=Dump.build({scenes=scenes,assignments={},case={documents={}}},nil,nil,true)
assert(f.scenes>=3 and f.zbSeen==9 and f.zbQueued==3 and f.zbMissing==nil,"the dump line counts scenes and the listener")
for k in pairs(f) do assert(Dump.FIELDS[k],"dump field "..k.." is declared") end
NHSceneListener=nil
assert(Dump.build({scenes={},assignments={},case={documents={}}},nil,nil,true).zbMissing==1,"no listener: zbMissing=1")
print("nohelp scene listener: every generated scene of an allowed kind is confirmed at its point, once")
