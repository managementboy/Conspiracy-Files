next=nil
local tick,clock,ops= nil,0,0
local output={};local originalPrint=print;print=function(s) output[#output+1]=s end
Events={OnTick={Add=function(f) tick=f end,Remove=function(f) if tick==f then tick=nil end end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
getTimeInMillis=function() return clock end
local function forbidden() error('forbidden mutation or identity generation') end
ModData={getOrCreate=forbidden};SurvivorFactory={CreateSurvivor=forbidden};instanceItem=forbidden
local function list(t) return {size=function() return #t end,get=function(_,i) ops=ops+1;return t[i+1] end,add=forbidden} end
local desc={getID=function() return 7 end,getForename=function() return 'Ada' end,getSurname=function() return 'Vale' end,getCharacterProfession=function() return {getName=function() return 'doctor' end} end,setForename=forbidden}
local function entity(x,d,items)
 return {getX=function() return x end,getY=function() return 0 end,getZ=function() return 0 end,getDescriptor=function() return d end,getInventory=function() return {getItems=function() return list(items or {}) end,AddItem=forbidden} end}
end
local idItem={getID=function() return 42 end,getFullType=function() return 'Base.IDcard' end,getDisplayName=function() return 'ID Card: Ada Vale' end,getName=forbidden,nameAfterDescriptor=forbidden}
local zombie=entity(1,desc,{idItem});local far=entity(99,desc);local corpse=entity(2,desc)
local missing=entity(3,nil);local broken=entity(4,nil);broken.getDescriptor=function() error('unavailable native method') end
local zombies={zombie,far,missing,broken};local static={corpse,{}}
instanceof=function(o,k) return k=='IsoDeadBody' and o==corpse end
local player=entity(0,desc);getPlayer=function() return player end
getCell=function() return {getZombieList=function() return list(zombies) end,getGridSquare=function(_,x,y,z)
 ops=ops+1
 if x==2 and y==0 then return {getStaticMovingObjects=function() return list(static) end} end
end} end
-- The probe logs through ConspiracyFiles/Log (2026-09-10), which lives in
-- shared, so dofile needs shared on the path.
package.path='mod/common/media/lua/shared/?.lua;'..package.path
local P=dofile('mod/common/media/lua/client/ConspiracyFiles/IdentityProbe.lua')
-- THE DISPATCHER IS PERMANENT (2026-09-21). It used to be created and
-- registered inside run(), and taken off Events.OnTick from inside its own
-- dispatch when the scan finished - which leaves OnTick unable to accept new
-- handlers for the rest of the session. So "no listener" is no longer how the
-- probe says it is idle, and it never should have been; ask P.busy().
assert(tick,'one permanent dispatcher is registered at load')
assert(not P.busy() and #output==0,'loading probe does not scan')
local before=ops
tick(); tick()
assert(not P.busy() and #output==0 and ops==before,
 'the idle dispatcher does no work at all: no job, no output, no engine calls')
local function drain()
 for i=1,2000 do if not P.busy() then return end;ops=0;tick();assert(ops<=16,'scan and item work bounded per tick') end
 assert(not P.busy(),'bounded completion')
end
assert(P.run() and not P.run(),'explicit start and duplicate rejection');drain()
assert(P.last.reason=='scan-complete' and P.last.entities==4 and P.last.items==1)
assert(P.last.records[1].kind=='player-control' and P.last.records[2].profession=='doctor')
assert(P.last.errors==1,'throwing getter contained; missing descriptor allowed')
local found=false;for _,s in ipairs(output) do if s:find('displayName=ID Card: Ada Vale',1,true) then found=true end end;assert(found,'existing identity item reported')
-- Dense populations and inventories stay finite; no mutation or generation getters exist.
local items={};for i=1,300 do items[i]=idItem end
zombies={};for i=1,40 do zombies[i]=entity(1,desc,i==1 and items or {}) end
assert(P.run());drain();assert(P.last.entities==32 and P.last.items==200 and P.last.reason=='entity-cap')
-- Cancelling clears the JOB and leaves the listener exactly where it was.
-- Mutating the listener list is the defect, not the cure.
assert(P.run());P.stop();assert(not P.busy() and tick,'cancel clears the job and keeps the dispatcher')
assert(P.run());clock=60001;tick();assert(not P.busy() and tick and P.last.reason=='timeout')
isClient=function() return true end;assert(not P.run() and not P.busy(),'multiplayer refused')
print=originalPrint
print('PASS IdentityProbe: explicit-only, names/profession/ID items, missing and throwing getters, filtering, 16-step/32-entity/200-item bounds, cancel and timeout, one permanent dispatcher that is free when idle')
