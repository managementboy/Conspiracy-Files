-- Current development build: automatic single-player trial activation.
local CFLog=require("ConspiracyFiles/Log")
require("ConspiracyFiles/MapMediaRuntime")
ConspiracyFiles=ConspiracyFiles or {}
local A=ConspiracyFiles.AutomaticInvestigations or {}
ConspiracyFiles.AutomaticInvestigations=A
-- afterCompletionHours (P4-R121): after a case finishes, the next one waits
-- this long, on top of minGapHours, so answers given right away can steer it.
A.config={minGapHours=24,afterCompletionHours=1,retryTicks=600}
local ticks,ready=0,false
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
-- Select the generated mode before shared legacy OnGameStart handlers run.
if allowed() then ConspiracyFiles.GeneratedMode=true end
-- EVERY SILENCE HAS A REASON (P4-R133). This is the one place that decides
-- whether to ask for a case, and it used to return quietly five times over -
-- so "no case came" was unexplained in exactly the states a long save sits in,
-- `active=4/4` above all. Each of those returns now reports a code from the
-- closed set (Generated/SuccessiveCases.DEFER_CODES) through the runtime, which
-- logs the same `ev=defer` line the generator's own refusals use and answers
-- automaticStatus().defer with it.
--
-- This decides only what is SAID. Every condition below, and their order, is
-- exactly as it was: nothing here changes when a case is created.
--
-- pcall because a refusal is bookkeeping: it must never be the reason a poll
-- stops. (Our own plain Lua, so the call form of AGENTS.md does not apply.)
local function quiet(runtime,code,dueAt)
 pcall(runtime.deferPoll,code,dueAt)
end
function A.poll()
 if not ready or not allowed() or not getPlayer() then return end
 local runtime=require("ConspiracyFiles/GeneratedRuntime")
 local status=runtime.automaticStatus()
 if status.preparing then return quiet(runtime,"busy") end
 if status.count==0 then
  local ok,why=require("ConspiracyFiles/Trial").start(nil,{firstHouse=true})
  -- THE LAST SILENCE WITH NO REASON (P4-R133, found in a real game
  -- 2026-09-18). The first case of a save is anchored on the building the
  -- survivor is standing in, so it waits until they are inside one - and that
  -- wait said nothing at all: a player who spawned on a street got no case and
  -- automaticStatus() read why=nil, so the mod could not answer "why is
  -- nothing happening?". It now carries `outdoors`, logged like every other
  -- refusal. Only what is SAID changes: the wait itself, and when the first
  -- case is created, are untouched.
  if not ok and why==runtime.WAITING_INDOORS then return quiet(runtime,"outdoors") end
  return
 end
 if not A.initialized then
  local ok=require("ConspiracyFiles/Trial").start()
  -- The first case's own preparation is still running, which is `busy`.
  if not ok then return quiet(runtime,"busy") end
  A.initialized=true
 end
 if status.count>=status.limit then return quiet(runtime,"cap") end
 -- No schedule means a save with nowhere to pace cases from (a legacy
 -- single-case save): automatic creation is off for it, which is `disabled`.
 if not status.scheduled then return quiet(runtime,"disabled") end
 -- Four unfinished cases is all the save allows: do not even try until one is
 -- finished (a refused attempt used to cost a nearby scan every ten seconds).
 if status.active and status.activeLimit and status.active>=status.activeLimit then
  return quiet(runtime,"active-limit")
 end
 local hours=getGameTime():getWorldAgeHours()
 -- A clock that reads NaN or infinity is an engine fault, not a refusal: the
 -- three caller-bug refusals in R.nextCase stay untyped for the same reason.
 if type(hours)~="number" or hours~=hours or hours==math.huge then return end
 -- The ordinary gap between cases, and the extra hour after one finished so
 -- answers given right away can steer the next (P4-R121). Both are our own
 -- pacing, so both are `gap` and both promise the hour they are waiting for.
 local due=status.lastCreatedHours+A.config.minGapHours
 if hours<due then return quiet(runtime,"gap",due) end
 if type(status.lastCompletedHours)=="number" then
  local after=status.lastCompletedHours+A.config.afterCompletionHours
  if hours<after then return quiet(runtime,"gap",after) end
 end
 runtime.nextCase(ZombRand(2147483646)+1)
end
function A.onStart() ticks=0;ready=true;A.initialized=false;A.lastError=nil;A.openingPrimed=false end
function A.onTick()
 ticks=ticks+1
 -- The personal key is the opening beat, so try it from the first playable
 -- frame instead of making it wait behind the 250-tile catalogue. Retry only
 -- through the short startup window while the player/building may still be
 -- materialising. The runtime is idempotent and declines every other career.
 if not A.openingPrimed and ticks<=29 and ready and allowed() then
  local ok,done=pcall(function() return require("ConspiracyFiles/GeneratedRuntime").primeOpening() end)
  if ok and done then A.openingPrimed=true
  elseif not ok and tostring(done)~=A.lastError then
   A.lastError=tostring(done);CFLog.message("auto","case","Opening key deferred: "..A.lastError)
  end
 end
 if ticks~=30 and ticks%A.config.retryTicks~=0 then return end
 local ok,err=pcall(A.poll)
 if not ok and tostring(err)~=A.lastError then A.lastError=tostring(err);CFLog.message("auto","case","Deferred: "..A.lastError) end
end
if Events and not A.tickHandler then
 A.tickHandler=function() A.onTick() end;Events.OnTick.Add(A.tickHandler)
 A.startHandler=function() A.onStart() end;Events.OnGameStart.Add(A.startHandler)
end
return A
