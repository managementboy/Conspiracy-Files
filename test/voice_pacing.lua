-- Lines that fire together are shown one after another, each long enough to
-- read. Owner, Windows, 2026-09-14: "the text on top of our player describing
-- what he/she found disapears super fast. I cant read that fast". The log
-- showed why: one inspection at 09:28 announced a discovery, a disagreement
-- and a pile in the same instant, and each Say replaced the bubble before it.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local says,halos={},{}
local clock=0
getTimeInMillis=function() return clock end
local p={Say=function(_,t) says[#says+1]=t end,setHaloNote=function(_,t) halos[#halos+1]=t end}
getPlayer=function() return p end
local ticks={}
Events={OnTick={Add=function(fn) ticks[#ticks+1]=fn end}}
ConspiracyFiles={}
local Voice=dofile("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua")
-- Other modules loaded with it register ticks of their own; the voice's must be among them.
local registered=false
for _,fn in ipairs(ticks) do if fn==Voice.drain then registered=true end end
assert(registered,"waiting lines must be delivered from the tick")
local function tick(ms) clock=clock+ms; Voice.drain() end

-- The moment from the owner's log.
clock=60000
Voice.onDiscovery("evidence","doc-6")
Voice.onConnection("disputes-delivery","doc-6")
Voice.onPile("doc-6")
assert(#says==1,"only one line may show at a time, got "..#says)
assert(#halos==1,"and only its halo")
tick(1000); assert(#says==1,"the second line must wait while the first is still being read")
tick(5000); assert(#says==2,"the second line follows once the first has had its time")
assert(says[2]=="Two records disagree",tostring(says[2]))
tick(500); assert(#says==2,"and it holds the space in turn")
tick(6000); assert(#says==3,"the third line follows")
assert(says[3]=="Far too many",tostring(says[3]))
tick(60000); assert(#says==3,"nothing more is said once nothing is waiting")

-- Bounded: a flood is one line showing and four waiting, not minutes of chatter.
Voice.reset(); says,halos={},{}
clock=clock+60000
for i=1,10 do Voice.onBody("flood-"..i) end
for _=1,20 do tick(20000) end
assert(#says==5,"one showing plus four waiting, got "..#says)

-- A line waiting while there is no player stays waiting rather than lost.
Voice.reset(); says,halos={},{}
clock=clock+60000
Voice.onBody("away-1"); Voice.onBody("away-2")
getPlayer=function() return nil end
tick(20000); assert(#says==1,"nobody to say it: the line waits")
getPlayer=function() return p end
tick(1); assert(#says==2,"the waiting line is said once the player is back")

-- Reset drops lines still waiting.
Voice.reset(); says,halos={},{}
clock=clock+60000
Voice.onBody("reset-1"); Voice.onBody("reset-2"); Voice.reset()
tick(20000); assert(#says==1,"reset must drop lines still waiting")

print("PASS voice pacing: lines fired together are shown one after another, each long enough to read, bounded, never lost, cleared on reset")
