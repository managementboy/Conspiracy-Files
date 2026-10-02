-- The wordless cue (P4-R132, stage 2), which replaced the spoken clue hints.
-- Near a clue nobody has recognised, where the survivor could see it, they may
-- say "Hm?" in the bubble: once per place for the life of the case, the very
-- first cue of the save teaching "Hm? I should have a proper look around
-- here.", "...again?" for a later cue of the same case, a global cooldown, less
-- likely in the dark and the rain, never for a recognised clue, never a name,
-- direction or distance.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Rules=require("ConspiracyFiles/ClueCueRules")

-- The rules.
local store=Rules.state({})
local clue={id="d1",case="c1",place="1:1:0:0:0",status="placed",recognised=false}
assert(Rules.decide(store,clue,0,nil,0.1,1,1)==Rules.FIRST,"the first cue of the save teaches")
assert(Rules.FIRST=="Hm? I should have a proper look around here.")
Rules.record(store,clue)
local line,why=Rules.decide(store,clue,999999,nil,0.1,1,1)
assert(line==nil and why=="place already cued","once per place")
local drawer2={id="d2",case="c1",place="2:1:0:0:0",status="placed"}
assert(Rules.decide(store,drawer2,1000,0,0.1,1,1)==nil,"cooldown")
assert(select(2,Rules.decide(store,drawer2,1000,0,0.1,1,1))=="cooldown")
assert(Rules.decide(store,drawer2,Rules.COOLDOWN_MS,0,0.1,1,1)=="...again?","a later cue of the same case")
local other={id="e1",case="c2",place="9:9:0:0:0",status="placed"}
assert(Rules.decide(store,other,0,nil,0.1,1,1)=="Hm?","a cue of another case is a plain Hm?")
-- Same place, another clue of the same case: still once per place.
Rules.record(store,drawer2)
assert(select(2,Rules.decide(store,{id="d3",case="c1",place="2:1:0:0:0",status="placed"},0,nil,0,1,1))=="place already cued")
-- Never for a recognised clue or one not placed.
assert(select(2,Rules.decide(Rules.state({}),{id="x",case="c",place="p",status="placed",recognised=true},0,nil,0,1,1))=="recognised")
assert(select(2,Rules.decide(Rules.state({}),{id="x",case="c",place="p",status="pending"},0,nil,0,1,1))=="not placed")
-- Chance: the game's light and weather factors (1 = bright, clear).
assert(Rules.chance(1,1)==Rules.BASE_CHANCE and Rules.BASE_CHANCE<1,"never certain")
assert(Rules.chance(0.5,1)<Rules.chance(1,1),"darker, less likely")
assert(Rules.chance(1,0.4)<Rules.chance(1,1),"rain, less likely")
assert(Rules.chance(0.5,0.4)<Rules.chance(0.5,1))
local fresh=Rules.state({})
assert(Rules.decide(fresh,clue,0,nil,Rules.chance(0.3,1)+0.01,0.3,1)==nil,"a roll above the dark chance says nothing")
assert(Rules.decide(fresh,clue,0,nil,Rules.chance(0.3,1)-0.01,0.3,1)==Rules.FIRST)
Rules.debugChance=1
assert(Rules.chance(0,0)==1,"checks can fix the chance"); Rules.debugChance=nil
-- Radius, same floor.
assert(Rules.near(10.5,10.5,0,13,13,0,Rules.RADIUS) and not Rules.near(10.5,10.5,0,14,10,0,Rules.RADIUS))
assert(not Rules.near(10.5,10.5,1,10,10,0,Rules.RADIUS),"another floor")
-- Bounded: finished cases forgotten, the first flag kept, places capped.
Rules.prune(store,{c2=true})
assert(store.first==true and store.cases.c1==nil and not store.places["c1|1:1:0:0:0"],"a finished case is forgotten")
local big=Rules.state({first=true})
for i=1,Rules.MAX_PLACES+30 do big.places["c|"..i]=true end
Rules.prune(big,{c=true})
local n=0; for _ in pairs(big.places) do n=n+1 end
assert(n==Rules.MAX_PLACES,"places are capped: "..n)
print("PASS clue cue rules: first-cue teaching, once per place, ...again? for the same case, cooldown, chance falls with darkness and rain, never when recognised, bounded")

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
local light,weather=1,1
forageSystem={getLightLevelPenalty=function() return light end,getWeatherPenalty=function() return weather end}
getSoundManager=function() return {playUISound=function(self) assert(self,"receiver") end} end
local says={}
local px,py,pz=0,0,0
local player={getX=function() return px end,getY=function() return py end,getZ=function() return pz end,
    Say=function(self,t) assert(self,"Say needs a receiver"); says[#says+1]=t end}
getPlayer=function() return player end
getCell=function() return {getGridSquare=function(_,x,y,z) return {x=x,y=y,z=z} end} end
local present={}
package.preload["ConspiracyFiles/WorldAccess"]=function() return {
    resolve=function(t) return present[t.x] and {} or nil end,
    resolveVehicle=function() return nil end,
    count=function(_,_,done) return function() done(1); return true end end,
} end
local visible=true
local rows={
    {id="a1",case="c1",place="3:0:0:0:0",x=3,y=0,z=0,status="placed",recognised=false,target={x=3}},
    {id="a2",case="c1",place="20:0:0:0:0",x=20,y=0,z=0,status="placed",recognised=false,target={x=20}},
    {id="a3",case="c1",place="40:0:0:0:0",x=40,y=0,z=0,status="placed",recognised=true,target={x=40}},
}
present[3]=true; present[20]=true; present[40]=true
ConspiracyFiles={GeneratedRuntime={},ClueSearch={
    liveClues=function() return rows end,
    seesSpot=function() if visible then return true end return false,"not in view" end}}
local Cue=dofile("mod/common/media/lua/client/ConspiracyFiles/ClueCue.lua")
local function tick() clock=clock+600; for _,f in ipairs(ticks) do f() end end
local function walk(x) px=x; tick() end

-- Out of view: nothing.
visible=false; walk(1); walk(2)
assert(#says==0,"not in view: nothing")
-- Not there any more (taken): nothing.
visible=true; present[3]=false; walk(8); walk(2)
assert(#says==0,"a clue no longer in its container gives no cue")
present[3]=true; walk(8)
-- In view and there: the first cue of the save teaches.
walk(2)
assert(#says==1 and says[1]==Rules.FIRST,"first cue: "..tostring(says[1]))
assert(saved[Cue.TAG].first==true,"the first-cue flag is saved")
-- Standing about: nothing more.
for _=1,20 do tick() end
assert(#says==1,"no stationary chatter")
-- Leave and come back: the place was cued, nothing.
walk(12); clock=clock+Rules.COOLDOWN_MS; walk(2)
assert(#says==1,"once per place")
-- The next place of the same case (session cooldown cleared): "...again?".
Cue.debugReset()
walk(19)
assert(#says==2 and says[2]=="...again?","a later place of the same case: "..tostring(says[2]))
-- A recognised clue: never.
walk(39); walk(40)
assert(#says==2,"never for a recognised clue")
-- Cooldown: a second place right after a cue says nothing on that approach.
rows[#rows+1]={id="b1",case="c2",place="60:0:0:0:0",x=60,y=0,z=0,status="placed",recognised=false,target={x=60}}
rows[#rows+1]={id="b2",case="c2",place="62:0:0:0:0",x=64,y=0,z=0,status="placed",recognised=false,target={x=64}}
present[60]=true; present[64]=true
clock=clock+Rules.COOLDOWN_MS
walk(59)
assert(#says==3 and says[3]=="Hm?","another case's first place: Hm?")
walk(63)
assert(#says==3,"the global cooldown holds")
-- Dark: a failed roll is tried again while the survivor stays near.
Cue.debugReset(); walk(90); clock=clock+Rules.COOLDOWN_MS
light=0.2; roll=0.5
walk(63); tick(); tick()
assert(#says==3,"too little light for this roll")
light=1; tick()
assert(#says==3,"not re-rolled before the re-roll time")
clock=clock+Rules.REROLL_MS; tick()
assert(#says==4 and says[4]=="...again?","a failed roll is followed by a cue while still near: "..tostring(says[4]))
-- Still near, nothing more (the place is cued).
clock=clock+Rules.REROLL_MS; tick(); tick()
assert(#says==4,"no repeat for a cued place")
-- Failing can still happen: every roll fails, or the spot is out of view, or far.
rows[#rows+1]={id="f1",case="c3",place="80:0:0:0:0",x=80,y=0,z=0,status="placed",recognised=false,target={x=80}}
present[80]=true
Cue.debugReset(); clock=clock+Rules.COOLDOWN_MS
roll=0.99; walk(79)
for _=1,5 do clock=clock+Rules.REROLL_MS; tick() end
assert(#says==4,"rolls that keep failing give no cue")
visible=false; roll=0.0
for _=1,3 do clock=clock+Rules.REROLL_MS; tick() end
assert(#says==4,"never when the spot is not visible")
visible=true; walk(95); clock=clock+Rules.REROLL_MS; tick()
assert(#says==4,"never when far away")
walk(79); roll=0.0; clock=clock+Rules.REROLL_MS; tick()
assert(#says==5,"near and visible with a passing roll: a cue")
-- Cooldown still spaces cues: a second place soon after waits, then cues.
rows[#rows+1]={id="f2",case="c3",place="82:0:0:0:0",x=82,y=0,z=0,status="placed",recognised=false,target={x=82}}
present[82]=true
walk(81); tick()
assert(#says==5,"cooldown holds between cues")
clock=clock+Rules.COOLDOWN_MS; tick()
assert(#says==6,"after the cooldown the nearby spot cues")
-- Rain likewise delays, then the repeated rolls get through.
weather=0.1; Cue.debugReset(); walk(120)
rows[#rows+1]={id="g1",case="c4",place="130:0:0:0:0",x=130,y=0,z=0,status="placed",recognised=false,target={x=130}}
present[130]=true
clock=clock+Rules.COOLDOWN_MS
roll=0.5; walk(129)
local n0=#says
roll=0.01
clock=clock+Rules.REROLL_MS; tick()
assert(#says==n0+1,"clear roll later in the rain: a cue")
weather=1
-- The saved state is small: places and cases, nothing else.
local keys={}
for k in pairs(saved[Cue.TAG]) do keys[#keys+1]=k end
table.sort(keys)
assert(table.concat(keys,",")=="cases,first,places","saved: "..table.concat(keys,","))
-- The bubble only, never a name, direction or distance.
for _,s in ipairs(says) do assert(s==Rules.FIRST or s=="Hm?" or s=="...again?","only the three lines: "..s) end
print("PASS clue cue: in view and present only, first cue teaches and is saved, once per place, ...again? for the same case, cooldown, a failed roll is re-rolled while near (dark, rain) but never when far or out of view, never for a recognised clue, only the three lines")
