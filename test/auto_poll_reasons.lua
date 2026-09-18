-- EVERY SILENCE HAS A REASON (P4-R133, fault found in a real game 2026-09-18).
--
-- P4-R133 gave every refusal a code, a count and a promise - but only inside
-- the generator. `AutomaticInvestigations.poll` is what decides whether to ask
-- for a case at all, and it returned quietly five times over: at the store's
-- cap, with no schedule to pace from, at the four-case active limit, inside the
-- ordinary gap between cases, and inside the extra hour after one finished. So
-- "no case came" was still entirely unexplained (`why=nil`) - including
-- `active=4/4`, which is the state a long save actually sits in.
--
-- Each of those now reports a code from the closed set. This test drives the
-- poller through every one of its exits with a runtime double, and checks two
-- things of each: the code it reports, and that the decision itself is
-- unchanged - a case is still created in exactly the state it was before.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Log=require("ConspiracyFiles/Log")

local ticks,starts={},{}
Events={OnTick={Add=function(f) ticks[#ticks+1]=f end},OnGameStart={Add=function(f) starts[#starts+1]=f end}}
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getPlayer=function() return {} end
local hours=1000
getGameTime=function() return {getWorldAgeHours=function() return hours end} end
ZombRand=function() return 7 end

-- The runtime double. It records what it was told and nothing else: this test
-- is about what the poller says, and test/nearby_deferral.lua is about what the
-- runtime does with it.
local said,status,cases,trialStarts,trialOK={},{},0,0,true
local function reset() said={}; cases=0; trialStarts=0 end
package.preload["ConspiracyFiles/GeneratedRuntime"]=function()
    return {automaticStatus=function() return status end,
        deferPoll=function(code,dueAt) said[#said+1]={code=code,due=dueAt}; return false,code end,
        nextCase=function(seed) cases=cases+1; return true end}
end
package.preload["ConspiracyFiles/Trial"]=function()
    return {start=function() trialStarts=trialStarts+1; return trialOK end}
end
local A=require("ConspiracyFiles/AutomaticInvestigations")
assert(A.config.minGapHours==24 and A.config.afterCompletionHours==1,
    "the gaps this test measures against are the ones the mod ships")

-- A save in the ordinary middle of a campaign: nothing is withheld.
local function healthy()
    return {count=2,limit=Cases.MAX_CASES,scheduled=true,preparing=false,
            active=1,activeLimit=Cases.MAX_ACTIVE,lastCreatedHours=100,lastCompletedHours=nil}
end
local function poll(change)
    status=healthy()
    for k,v in pairs(change or {}) do status[k]=v end
    reset()
    A.poll()
    return said[1]
end

-- Nothing happens at all until the game has started: a poll before OnGameStart
-- is not a refusal, it is a module that is not running yet.
status=healthy()
A.poll()
assert(#said==0 and cases==0,"a poll before the game starts says nothing and does nothing")
for _,f in ipairs(starts) do f() end
A.initialized=true

-- 1. The state that must still create a case, unchanged -----------------------
assert(poll()==nil,"a healthy save refuses nothing")
assert(cases==1,"and still asks for a case: this fix is about saying why, not when")

-- 2. Every silent exit, and the code it now carries ---------------------------
local expected={
    {"a case is being prepared right now",{preparing=true},"busy"},
    {"the store's own case cap",{count=Cases.MAX_CASES},"cap"},
    {"a save with no schedule to pace from",{scheduled=false},"disabled"},
    {"four unfinished cases",{active=Cases.MAX_ACTIVE},"active-limit"},
    {"inside the ordinary gap between cases",{lastCreatedHours=hours-1},"gap"},
    {"inside the hour after a case finished",{lastCompletedHours=hours-0.5},"gap"},
}
for _,row in ipairs(expected) do
    local what,change,code=row[1],row[2],row[3]
    local reported=poll(change)
    assert(reported,what..": the poll must say why it stayed silent")
    assert(reported.code==code,what..": reported "..tostring(reported.code)..", not "..code)
    assert(Cases.DEFER_CODES[reported.code],what..": "..reported.code.." is not in the closed set")
    assert(cases==0,what..": no case may be asked for")
end

-- 3. A wait promises the hour it is waiting for -------------------------------
-- The promise is what the long campaign check polls, and it fails when the
-- promised hour passes with no case. So the gap must promise the gap's own end,
-- not the half hour a standing cooldown promises - twenty-three hours early
-- would be a broken promise every time.
local gap=poll({lastCreatedHours=hours-1})
assert(gap.due==hours-1+A.config.minGapHours,
    "the ordinary gap promises the hour the gap ends: "..tostring(gap.due))
local after=poll({lastCompletedHours=hours-0.5})
assert(after.due==hours-0.5+A.config.afterCompletionHours,
    "and the hour after a completion promises its own end: "..tostring(after.due))
assert(gap.due>hours and after.due>hours,"a promise a poller makes is never already broken")

-- 4. The first case, and a first case still being prepared --------------------
-- An empty save starts the trial rather than refusing: there is no case to pace
-- against yet, and the first house is the first case's own business (P4-R66).
status=healthy(); status.count=0; reset()
A.poll()
assert(trialStarts==1 and #said==0 and cases==0,"an empty save starts the first case and refuses nothing")
-- Trial.start refusing means the first case is still being prepared - which is
-- the one early return of the five that already had somewhere to belong.
A.initialized=false; trialOK=false
status=healthy(); reset()
A.poll()
assert(said[1] and said[1].code=="busy","a first case that will not start yet is busy")
assert(cases==0 and not A.initialized,"and nothing else is asked for")
trialOK=true; A.initialized=true

-- 5. A refusal can never be the reason a poll dies ---------------------------
-- The debt is bookkeeping. If reporting it throws, the poll must carry on
-- exactly as it did before any of this existed.
package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
package.preload["ConspiracyFiles/GeneratedRuntime"]=function()
    return {automaticStatus=function() return status end,
        deferPoll=function() error("the save is refusing writes") end,
        nextCase=function() cases=cases+1; return true end}
end
status=healthy(); status.active=Cases.MAX_ACTIVE; reset()
local ok=pcall(A.poll)
assert(ok,"a refusal that throws must not break the poll")
assert(cases==0,"and must not let a case through the gate it was reporting")

-- 6. The log has a word for it ------------------------------------------------
local events={}
for _,id in ipairs(Log.events()) do events[id]=true end
assert(events.defer,"the log's closed vocabulary knows ev=defer, which is what the poller's line uses")

-- 7. No exit of the poll is silent any more ----------------------------------
-- Read the source and count: every `return` in poll either creates a case,
-- starts the first one, reports a code, or is the one engine fault that is not
-- a refusal (a clock reading NaN), which R.nextCase's own caller-bug refusals
-- leave untyped for the same reason.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/AutomaticInvestigations.lua","r"))
local source=f:read("*a"); f:close()
local body=assert(source:match("function A%.poll%(%)(.-)\nend\n"),"A.poll must exist")
local bare=0
for line in body:gmatch("[^\n]+") do
    local trimmed=line:match("^%s*(.-)%s*$")
    if trimmed=="return" or trimmed:find("then return end",1,true) then bare=bare+1 end
end
-- Three may return without a reason, and no more: the module is not running
-- yet, the first case has just been started (there is nothing to pace against),
-- and the clock is unusable.
assert(bare==3,"only three returns may carry no reason, found "..bare)
assert(body:find('quiet(runtime,"gap",due)',1,true) and body:find('quiet(runtime,"gap",after)',1,true),
    "both waits report the gap and the hour they wait for")

print(string.format("PASS the poller says why: %d silent early returns now carry a code from the closed set "
    .."of %d, both waits promise their own end, and a healthy save still gets its case",
    #expected,(function() local n=0; for _ in pairs(Cases.DEFER_CODES) do n=n+1 end; return n end)()))
