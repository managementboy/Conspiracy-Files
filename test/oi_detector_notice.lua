-- Phase 8: the visible notice when the scene detector (ZombieBuddy jar) is not live: once per save, after a grace
-- period, neutral halo text, one log line; never while the listener answers.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
OIShared={}
Events=setmetatable({},{__index=function(t,k) local e={Add=function() end,Remove=function() end}; rawset(t,k,e); return e end})
isClient=function() return false end
isServer=function() return false end
getGameTime=function() return {getWorldAgeHours=function() return 7 end} end
local clock=0
getTimeInMillis=function() return clock end
local store={}
ModData={getOrCreate=function(n) store[n]=store[n] or {}; return store[n] end}
local halos={}
local player={setHaloNote=function(self,text,r,g,b,d) halos[#halos+1]=text end}
getPlayer=function() return player end
local lines={}
local Log=require("OIShared/Log")
local realWrite=Log.write
Log.write=function(level,ev,fields) lines[#lines+1]={ev=ev,why=fields and fields.why} end
local R=require("OIShared/VanillaSceneRuntime")
local function notices() local n=0; for _,l in ipairs(lines) do if l.why=="scene-listener-notice" then n=n+1 end end; return n end

-- Detector missing: nothing before the grace period ...
assert(R.listen()==false); assert(#halos==0 and notices()==0,"silent inside the grace period")
clock=R.NOTICE_GRACE_MS-1; R.listen(); assert(#halos==0,"still silent just before the end")
-- ... then exactly one notice, however long it stays missing.
clock=R.NOTICE_GRACE_MS; R.listen()
assert(#halos==1 and halos[1]==R.NOTICE_TEXT and notices()==1,"one halo text and one log line")
for i=1,50 do clock=clock+1000; R.listen() end
assert(#halos==1 and notices()==1,"never twice in a session")
-- Neutral: no survivor voice (Say) was used.
player.Say=function() error("the survivor must not speak the notice") end
-- A new session of the same save (reset, as OnGameStart does): the save's flag holds.
R.reset(); clock=0; R.listen(); clock=R.NOTICE_GRACE_MS; R.listen()
assert(#halos==1 and notices()==1,"once per save, not per session")
-- A new save (fresh ModData): once again.
store={}; R.reset(); clock=0; R.listen(); clock=R.NOTICE_GRACE_MS; R.listen()
assert(#halos==2 and notices()==2,"a new save gets its own notice")
-- Never when the detector is live.
store={}; R.reset(); halos={}; lines={}
OISceneDrain=function() return "" end
clock=0; for i=1,200 do clock=clock+5000; R.listen() end
assert(#halos==0 and notices()==0,"live detector: no notice")
-- A detector that goes away later restarts the grace period (it was live a moment ago).
OISceneDrain=nil; local t0=clock; R.listen(); clock=t0+R.NOTICE_GRACE_MS-1; R.listen(); assert(#halos==0)
clock=t0+R.NOTICE_GRACE_MS; R.listen(); assert(#halos==1,"grace counted from when it went missing")
-- Test injection: a live detector treated as missing.
store={}; R.reset(); halos={}; lines={}; OISceneDrain=function() return "" end; R.forceInactive=true
clock=0; R.listen(); clock=R.NOTICE_GRACE_MS; R.listen(); assert(#halos==1,"forced inactive notices")
R.forceInactive=nil
print("oi detector notice: once per save after the grace period, neutral, never while live")
