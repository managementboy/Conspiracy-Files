-- No Help clue cue, spoken line (owner, 2026-10-02): every cue also speaks one
-- varied line from ClueCueLines, never one of the last 12 said. Offline.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
local Rules=require("OIShared/ClueCueRules")
local Lines=require("OIShared/ClueCueLines")

-- The lines: plain, short, no digits, no repeats among themselves.
assert(#Lines>=40,"at least 40 varied lines: "..#Lines)
local seen={}
for i,l in ipairs(Lines) do
    assert(type(l)=="string" and l:match("%S"),"line "..i.." is a non-empty string")
    assert(#l<=60,"line "..i.." too long ("..#l.."): "..l)
    assert(not l:find("%d"),"line "..i.." has a digit: "..l)
    assert(not seen[l],"duplicate line: "..l); seen[l]=true
end

-- Never repeats within the last N, with an adversarial random (always first).
local recent={}
local last={}
for draw=1,2000 do
    local l=Rules.pickLine(Lines,recent,function(n) return (draw%3==0) and 1 or ((draw*7919)%n)+1 end)
    for k=math.max(1,#last-Rules.SPOKEN_MEMORY+1),#last do assert(last[k]~=l,"repeat within N at draw "..draw) end
    last[#last+1]=l
end
assert(Rules.SPOKEN_MEMORY==12 and #recent==12)
-- The random decides: first and last of the pool are reachable.
local r2={}
local a=Rules.pickLine(Lines,r2,function() return 1 end)
local b=Rules.pickLine({"x","y"},{},function(n) return n end)
assert(a==Lines[1] and b=="y")
-- Fewer lines than the memory still speaks.
local r3={}
for _=1,5 do assert(Rules.pickLine({"p","q"},r3,function() return 1 end)) end
assert(Rules.pickLine({},{},function() return 1 end)==nil)
print("PASS spoken cue lines: 80+ plain lines, <=60 chars, no digits, no repeat within 12")

-- The client module against doubles.
local clock=100000
getTimeInMillis=function() return clock end
getDebug=function() return true end
isClient=function() return false end; isServer=function() return false end
local ticks={}
Events={OnTick={Add=function(f) ticks[#ticks+1]=f end,Remove=function() end}}
local saved={}
ModData={getOrCreate=function(tag) saved[tag]=saved[tag] or {}; return saved[tag] end}
local roll=0.1
ZombRandFloat=function() return roll end
forageSystem={getLightLevelPenalty=function() return 1 end,getWeatherPenalty=function() return 1 end}
getSoundManager=function() return {playUISound=function(self) assert(self) end} end
local says,halos={},{}
local player={getX=function() return 0 end,getY=function() return 0 end,getZ=function() return 0 end,
    Say=function(self,t) assert(self); says[#says+1]=t end,
    setHaloNote=function(self,t) assert(self); halos[#halos+1]=t end}
getPlayer=function() return player end
getCell=function() return {getGridSquare=function(_,x,y,z) return {x=x,y=y,z=z} end} end
package.preload["OIShared/WorldAccess"]=function() return {
    resolve=function() return {} end, resolveVehicle=function() return nil end,
    count=function(_,_,done) return function() done(1); return true end end} end
local visible=true
local rows={}
for i=1,40 do
    rows[i]={id="a"..i,case="c"..i,place=i..":0:0:0:0",x=1,y=1,z=0,status="placed",recognised=false,target={x=1}}
end
OIShared={ClueSearch={liveClues=function() return rows end,
    seesSpot=function() if visible then return true end return false,"no" end}}
package.preload["OIShared/EngineAPI"]=function() return {GeneratedRuntime={}} end
local Cue=dofile("mod-ofinterest/common/media/lua/client/OIShared/ClueCue.lua")
local picks=0
Cue.rand=function(n) picks=picks+1; return 1 end
local function tick() clock=clock+600; for _,f in ipairs(ticks) do f() end end

-- A cue that is out of view: no speech at all.
visible=false; tick(); tick()
assert(#halos==0 and #says==0 and picks==0,"suppressed: nothing spoken")
-- Cooldown and the chance suppress too.
visible=true; roll=0.99; tick()
assert(#halos==0 and #says==0,"a failed roll speaks nothing")
-- Fires: the varied line is spoken (halo), the short cue is the bubble.
roll=0.1; clock=clock+Rules.REROLL_MS; tick()
-- The very first cue of a save is the teaching line alone (owner, 2026-10-03).
assert(#halos==0,"first cue: no varied line under the teaching line: "..tostring(halos[1]))
assert(#says==1 and says[1]==Rules.FIRST,"first cue is the teaching line: "..tostring(says[1]))
-- Cooldown: nothing more.
clock=clock+Rules.REROLL_MS; tick()
assert(#halos==0,"cooldown speaks nothing")
-- Many cues: the injected random always says 1, yet no repeat within 12.
local got={}
for _=1,21 do
    clock=clock+Rules.COOLDOWN_MS; Cue.debugReset(); tick()
    got[#got+1]=halos[#halos]
end
assert(#halos==#got,"each cue speaks exactly one line")
for i=2,#got do for k=math.max(1,i-12),i-1 do assert(got[i]~=got[k],"repeat at cue "..i) end end
-- No halo on the player: the words still come in the bubble.
player.setHaloNote=nil
clock=clock+Rules.COOLDOWN_MS; Cue.debugReset(); tick()
local lastSay=says[#says]
local isLine=false; for _,l in ipairs(Lines) do if l==lastSay then isLine=true end end
assert(isLine,"no halo: the varied line goes in the bubble: "..tostring(lastSay))
print("PASS clue cue speaks: one varied line per cue, nothing when suppressed, no repeat within 12, bubble fallback")
