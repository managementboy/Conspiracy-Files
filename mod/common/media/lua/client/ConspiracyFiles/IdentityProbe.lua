-- Explicit read-only probe. Never creates descriptors, loot, or persisted state.
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.IdentityProbe and ConspiracyFiles.IdentityProbe.stop then ConspiracyFiles.IdentityProbe.stop() end
local P={};ConspiracyFiles.IdentityProbe=P
local handler,job
local function read(o,k,...)
 if not o then return nil end
 local args={...}
 local ok,v=pcall(function() if o[k] then return o[k](o,unpack(args)) end end)
 if not ok then if job then job.errors=job.errors+1 end;return nil end
 return v
end
local function finite(v) return type(v)=='number' and v==v and v~=math.huge and v~=-math.huge end
local function text(v) if v==nil or v=='' then return 'unavailable' end;return tostring(v):gsub('[\r\n]',' '):sub(1,180) end
local CFLog=require("ConspiracyFiles/Log")
local function log(s) CFLog.message("identity","probe",s) end
-- NEVER TOUCH THE EVENT LIST HERE. stop() is called from finish(), which is
-- called from inside handler(), which runs inside OnTick's own dispatch - and
-- removing a handler mid-dispatch leaves OnTick unable to accept new ones for
-- the rest of the session. Measured on T3Nearby, 2026-09-21: a probe handler
-- added afterwards recorded 0 ticks over 30 seconds while the game clock ran
-- normally, and the next case's scan sat at building 0 of 9,978 with ticks=0
-- forever, with no error and no refusal.
--
-- This probe is debug-gated and so never cost a player a case, but it ships,
-- and a debug session that ran it would poison every later tick handler the
-- same way. Stopping is clearing the job; the dispatcher is permanent and
-- returns on its first line when there is nothing to do.
function P.stop()
 job=nil
end
-- Whether a scan is running, so a caller can ask the module instead of
-- inferring it from the size of the event list - an inference that stopped
-- being available when the dispatcher became permanent, and was never safe.
function P.busy() return job~=nil end
local function finish(reason)
 local j=job
 P.last={entities=j.count,items=j.items,errors=j.errors,reason=reason,records=j.records}
 log('complete reason='..reason..' entities='..j.count..' itemsRead='..j.items..' getterErrors='..j.errors..'; IDs are candidates, not proven persistent identities')
 P.stop()
end
local function report(o,kind)
 local j=job;local d=read(o,'getDescriptor')
 local r={kind=kind,x=read(o,'getX'),y=read(o,'getY'),z=read(o,'getZ'),descriptorId=read(d,'getID'),onlineId=read(o,'getOnlineID'),outfitId=read(o,'getPersistentOutfitID'),forename=read(d,'getForename'),surname=read(d,'getSurname')}
 local profession=read(d,'getCharacterProfession');r.profession=profession and (read(profession,'getName') or tostring(profession)) or nil
 j.records[#j.records+1]=r
 log(kind..' xyz='..text(r.x)..','..text(r.y)..','..text(r.z)..' descriptor='..tostring(d~=nil)..' descriptorId='..text(r.descriptorId)..' onlineId='..text(r.onlineId)..' outfitId='..text(r.outfitId)..' name='..text(r.forename)..' '..text(r.surname)..' profession='..text(r.profession))
 if kind~='player-control' then
  local c=read(o,'getInventory') or read(o,'getContainer')
  j.currentItems=read(c,'getItems');j.itemIndex=0;j.owner=r
 end
end
local function near(o)
 local x,y,z=read(o,'getX'),read(o,'getY'),read(o,'getZ')
 return finite(x) and finite(y) and finite(z) and z==job.z and (x-job.x)^2+(y-job.y)^2<=job.radius^2
end
local function accept(o,kind)
 if not o or job.seen[o] or not near(o) then return end
 job.seen[o]=true;job.count=job.count+1;report(o,kind)
end
local function step()
 local j=job
 if j.currentItems then
  local size=read(j.currentItems,'size') or 0
  if j.itemIndex>=size or j.items>=200 then j.currentItems=nil;return end
  local item=read(j.currentItems,'get',j.itemIndex);j.itemIndex=j.itemIndex+1;j.items=j.items+1
  local fullType=read(item,'getFullType');local name=read(item,'getDisplayName');local id=read(item,'getID')
  local key=type(fullType)=='string' and fullType:lower() or ''
  if key:find('idcard',1,true) or key:find('passport',1,true) or key:find('wallet',1,true) or key:find('badge',1,true) or key:find('keyring',1,true) or key:find('diary',1,true) or key:find('dogtag',1,true) or key:find('notebook',1,true) or key:find('creditcard',1,true) then
   log('item ownerDescriptorId='..text(j.owner.descriptorId)..' xyz='..text(j.owner.x)..','..text(j.owner.y)..','..text(j.owner.z)..' id='..text(id)..' type='..text(fullType)..' displayName='..text(name))
  end
  return
 end
 if j.count>=32 then finish('entity-cap');return end
 if j.phase=='zombies' then
  local size=math.min(read(j.zombies,'size') or 0,4096)
  if j.zi>=size then j.phase='bodies';return end
  local o=read(j.zombies,'get',j.zi);j.zi=j.zi+1;accept(o,'zombie');return
 end
 if j.static then
  local size=math.min(read(j.static,'size') or 0,64)
  if j.si>=size then j.static=nil;return end
  local o=read(j.static,'get',j.si);j.si=j.si+1
  if o and instanceof(o,'IsoDeadBody') then accept(o,'corpse') end
  return
 end
 if j.dx>j.radius then finish('scan-complete');return end
 local sq=read(j.cell,'getGridSquare',j.x+j.dx,j.y+j.dy,j.z)
 j.dy=j.dy+1;if j.dy>j.radius then j.dy=-j.radius;j.dx=j.dx+1 end
 j.static=read(sq,'getStaticMovingObjects');j.si=0
end
function P.run()
 if job then return false,'probe already running' end
 if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer()) then return false,'debug single-player only' end
 local player=getPlayer();local cell=getCell()
 local x,y,z=read(player,'getX'),read(player,'getY'),read(player,'getZ')
 if not cell or not finite(x) or not finite(y) or not finite(z) then return false,'loaded player/cell required' end
 job={cell=cell,x=math.floor(x),y=math.floor(y),z=math.floor(z),radius=30,dx=-30,dy=-30,phase='zombies',zi=0,zombies=read(cell,'getZombieList'),count=0,items=0,errors=0,seen={},records={},ticks=0,started=getTimeInMillis()}
 log('begin radius=30 same-floor; max32 entities/200 top-level item reads; no loot generation or save writes; nearby identities only, not home addresses')
 report(player,'player-control')
 return true
end
-- THE DISPATCHER IS PERMANENT. It was defined and registered inside run(), and
-- taken off the list from inside its own dispatch when the probe finished. It
-- is now one function, registered once at load, that returns on its first line
-- when there is no job - which is all but the few seconds a probe is running.
handler=function()
 if not job then return end
 job.ticks=job.ticks+1
 if job.ticks>2000 or getTimeInMillis()-job.started>60000 then finish('timeout');return end
 local started=getTimeInMillis()
 local ok,err=pcall(function()
  for _=1,16 do step();if not job or getTimeInMillis()-started>=1 then return end end
 end)
 if not ok then log('error='..text(err));if job then finish('error') end end
end
P.handler=handler
-- A reload must take the PREVIOUS module's handler off the list, at load,
-- which is outside any dispatch.
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.IdentityProbe and ConspiracyFiles.IdentityProbe.handler and Events then
 Events.OnTick.Remove(ConspiracyFiles.IdentityProbe.handler)
end
ConspiracyFiles.IdentityProbe=P
if Events then Events.OnTick.Add(handler) end
return P
