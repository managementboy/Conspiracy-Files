package.path="mod/common/media/lua/shared/?.lua;"..package.path
-- Isolated adapter fixtures omit generator metadata; full validation is covered by successive_cases/g2_smoke.
require("ConspiracyFiles/Generated/SuccessiveCases").current=function(store) return store end

local callback,clock,count,says=nil,0,1,{}
local x,y,z=0,0,0
local target={x=1,y=1,z=0,objectIndex=0,containerIndex=0}
local root={case={documents={{id="d"}}},assignments={d={status="placed",target=target,physicalToken="token"}},known={}}
ModData={get=function() return {canonical=root} end}
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getTimeInMillis=function() return clock end
local haloNotes={}
getPlayer=function() return {getX=function() return x end,getY=function() return y end,getZ=function() return z end,
 -- Engine doubles must demand a receiver, exactly as Kahlua does. A permissive
 -- table accepts obj.method(x) and hides the call-form bug that shipped three
 -- defects on 2026-09-07 (77d46ef, d747a25, 5f12fa1).
 Say=function(self,s) assert(self~=nil,"Say needs a receiver: player:Say(x)"); says[#says+1]=s end,
 -- setHaloNote is the only halo API that takes a duration; record it so the
 -- test proves a duration is passed, not merely that some text appeared.
 setHaloNote=function(self,text,r,g,b,duration)
  assert(self~=nil,"setHaloNote needs a receiver: player:setHaloNote(...)")
  haloNotes[#haloNotes+1]={text=text,duration=duration} end} end
Events={OnTick={Add=function(f) assert(not callback); callback=f end,Remove=function(f) if callback==f then callback=nil end end}}
local container={}
package.preload["ConspiracyFiles/WorldAccess"]=function() return {
    resolve=function() return container end,
    count=function(_,_,done) return function() done(count); return true end end
} end
local function tick() clock=clock+500; callback() end
local H=dofile('mod/common/media/lua/client/ConspiracyFiles/ClueHints.lua')
z=1; tick(); tick(); assert(#says==0,'wrong floor')
z=0; count=0; tick(); tick(); assert(#says==0,'absent clue')
-- More copies than the document expects is still a duplicate, and still
-- silent. What changed (2026-09-10) is that "more than one" alone is no longer
-- the test: a pile is one document and many identical items.
count=2; tick(); tick(); assert(#says==0,'duplicate clue')
count=1; tick(); tick(); assert(#says==1,'one-tile diagonal clue')
for i=1,130 do tick() end; assert(#says==1,'no stationary chatter')
x=20; tick(); x=0; tick(); tick(); assert(#says==2 and says[1]~=says[2],'re-entry varies phrase')
x=20; tick(); x=0; tick(); tick(); assert(#says==2,'global cooldown')
x=20; clock=clock+61000; tick(); root.known={'d'}; x=0; tick(); tick(); assert(#says==2,'known clue silent')
root.known={}; tick(); x=20; tick(); assert(#says==2,'moved away during count')
-- Owner decision 2026-09-06: trigger at two tiles and announce on three
-- channels.  Halo text and the UI sound must stay optional, so the module is
-- exercised both without the globals (above) and with them (here).
local halos,uiSounds={},{}
HaloTextHelper={addText=function(_,t) halos[#halos+1]=t end}
getSoundManager=function() return {playUISound=function(_,name) uiSounds[#uiSounds+1]=name end} end
x=20; y=0; clock=clock+61000; tick()
x=4; tick(); tick(); assert(#says==2,'three tiles is outside the trigger radius')
x=3; y=1; tick(); tick()
assert(#says==3,'two tiles triggers a hint')
-- Every spoken hint carries a halo note, from the first one onward.
assert(#haloNotes==#says,'each spoken hint gets exactly one halo note')
-- Two channels, two strings (owner, 2026-09-10: "some messages on top of the
-- player repeated once in colour once in white"). The bubble carries the
-- survivor's line; the halo carries the fact in as few words as fit above a
-- head. This assertion used to demand the opposite - it pinned the echo - so
-- it is inverted deliberately, not relaxed.
assert(haloNotes[#haloNotes].text~=says[#says],'the halo must not repeat the spoken phrase')
assert(haloNotes[#haloNotes].text=='Something nearby','the halo states the fact, briefly')
assert(type(haloNotes[#haloNotes].duration)=='number' and haloNotes[#haloNotes].duration>=300,
 'the halo note must carry an explicit, generous duration: a hint that vanishes before it is read is no hint')
assert(#halos==0,'setHaloNote is preferred; HaloTextHelper is only the fallback')
assert(uiSounds[1]=='UIObjectMenuEnter','UI-channel sound only; never a world emitter')
-- A step off the container keeps the scan alive instead of cancelling it.
x=20; clock=clock+61000; tick(); x=3; tick(); x=2; tick(); tick()
assert(#says==4 and #haloNotes==#says,'a step during the scan does not abandon the hint')

H.stop(); assert(not callback)
print('PASS proximity hints: floor, distance, actual token count, duplicates, cooldown, re-entry, phrase variation, discovery and stale-position guards')

-- A pile must still be hinted at. The hint required EXACTLY one item carrying
-- the token, so a container holding eleven credit cards - the clue most worth
-- hinting at - went silent, logged as "suppressed matches=2".
--
-- Third caller of World.count to assume one item per document. The other two
-- were fixed earlier the same day and this one was missed, which is why the
-- check is on the source: the behavioural tests here do not build a pile.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/ClueHints.lua', 'r'))
local hints = f:read('*a'); f:close()
assert(not hints:find('task.count==1', 1, true),
    'the hint must not require exactly one item; a pile is one document and many items')
assert(hints:find('task.count>=1', 1, true), 'one or more matching items means the clue is there')
assert(hints:find('task.count<=(task.expected or 1)', 1, true),
    'more copies than the document expects is still a duplicate and still silent')
assert(hints:find('doc.quantity or 1', 1, true), 'the hint must know how many copies belong here')
print('PASS clue hints: a pile of eleven is still worth mentioning')
