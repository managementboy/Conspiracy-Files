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
local P=dofile('mod/common/media/lua/client/ConspiracyFiles/IdentityProbe.lua')
assert(not tick and #output==0,'loading probe does not scan')
local function drain()
 for i=1,2000 do if not tick then return end;ops=0;tick();assert(ops<=16,'scan and item work bounded per tick') end
 assert(not tick,'bounded completion')
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
assert(P.run());P.stop();assert(not tick,'cancel removes listener')
assert(P.run());clock=60001;tick();assert(not tick and P.last.reason=='timeout')
isClient=function() return true end;assert(not P.run() and not tick,'multiplayer refused')
print=originalPrint
print('PASS IdentityProbe: explicit-only, names/profession/ID items, missing and throwing getters, filtering, 16-step/32-entity/200-item bounds, cancel and timeout')
