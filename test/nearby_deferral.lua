-- A refused new case waits for the survivor to move on (P4-R125, owner
-- 2026-09-15), and says honestly why it refused (P4-R133). When a later case
-- found no unused, loaded buildings with enough containers nearby, the timer
-- asked again every 10-20 seconds and each attempt re-scanned the same
-- neighbourhood: 61 refused scans in about 25 minutes in the campaign check.
-- Now the next attempt waits until the survivor has moved about 50 tiles or
-- half an in-game hour has passed; a case created, or a load, clears the wait.
--
-- The wait is one property of a wider record (P4-R133): the same refusal also
-- carries its reason code, its count, the hour it started and the hour a case
-- is promised by. The position and the wait clock are the only parts that are
-- NOT persisted, because loading a save clears the wait and nothing else.
local function read(path) local f=assert(io.open(path,"r")); local s=f:read("*a"); f:close(); return s end
local runtime=read("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua")

assert(runtime:find("R.DEFER_TILES=50",1,true) and runtime:find("R.DEFER_HOURS=0.5",1,true),
    "the wait is 50 tiles or half an in-game hour")

local nextCase=assert(runtime:match("function R%.nextCase%(seed%)(.-)\nend\n"),"R.nextCase must exist")
local guard=nextCase:find("if debt and debt.x then",1,true)
local probe=nextCase:find("probe.start",1,true)
assert(guard and probe and guard<probe,"R.nextCase must wait out a refusal BEFORE scanning again")
assert(nextCase:find("dx*dx+dy*dy<R.DEFER_TILES*R.DEFER_TILES and worldHours()<debt.waitHours+R.DEFER_HOURS",1,true),
    "moving on OR the time passing ends the wait")
assert(nextCase:find('return refuse("cooldown")',1,true),
    "the standing wait refuses with the cooldown code")

-- Every refusal in R.nextCase is typed: the caller-bug cases (no first case
-- yet, an impossible seed, no debug mode) are the only plain strings left.
local strings=0
for line in nextCase:gmatch("[^\n]+") do
    if line:find("return false,\"",1,true) then strings=strings+1 end
end
assert(strings==3,"only the three caller-bug refusals stay untyped, found "..strings)

local prepare=assert(runtime:match("local function prepare%(result,seed,later,house%)(.-)\nfunction R%.start"),"prepare must exist")
-- Every refusal that comes from the nearby scan starts the wait, and only a
-- LATER case waits: no eligible pair at all, nothing the distribution could
-- place, and a site that took no clue. A placement still running, or a
-- container that changed under us, is not a reason to stand still for half an
-- hour, and the first case's own house is not a neighbourhood to move on from.
local _,waits=prepare:gsub("later==true%)","")
assert(waits==3,"the three scan refusals start the wait for a later case, found "..waits)
local _,unconditional=prepare:gsub("refuse%([^)]*,true%)","")
assert(unconditional==0,"a first case must never start the move-on wait, found "..unconditional)
assert(prepare:find("clearDebt()",1,true),"a case created clears the wait and the debt")
assert(runtime:find("sessions,scheduler,preparing,wrapper=nil,nil,false,nil\n    clearDebt()",1,true),
    "loading a game clears the wait")
assert(runtime:find("pcall(restoreDebt)",1,true),
    "...but the count and the rung are read back from the save (P4-R133)")

-- The log line a whole run is audited with: ev=defer why=<code> n=<count>
-- rung=<rung> due=<hh:mm>.
assert(runtime:find('CFLog.write(counted and "i" or "d","defer",',1,true),
    "one log line per refusal, in the existing logfmt")
assert(runtime:find("{why=code,n=record.count,rung=record.rung,due=hhmm(record.dueHours)}",1,true),
    "the refusal line carries the code, the count, the rung and the promise")

-- What automaticStatus must report, because the campaign check polls it.
local status=assert(runtime:match("function R%.automaticStatus%(%)(.-)\nend\n"),"R.automaticStatus must exist")
for _,field in ipairs({"defer=","why=","deferCount=","dueHours=","rung=","rungMax="}) do
    assert(status:find(field,1,true),"automaticStatus must report "..field)
end
-- And it reports the LAST reason, counted or not (P4-R133, 2026-09-18): the
-- uncounted codes used to be logged and nothing else, so `why` was nil in
-- exactly the states a long save sits in - a standing cooldown, a placement in
-- progress, the ordinary gap between cases.
assert(status:find("local reported=silence or debt",1,true),
    "automaticStatus must answer with the last reason for the silence, not only the debt")
local refuseBody=assert(runtime:match("local function refuse%(code,wait,dueAt%)(.-)\nend\n"),"refuse must exist")
assert(refuseBody:find("silence=record",1,true),
    "every refusal, counted or not, records why it refused")
assert(refuseBody:find("if COUNTED[code] then",1,true) and refuseBody:find("if counted then rememberDebt() end",1,true),
    "but only a counted code walks the ladder and writes the save")
assert(runtime:find("function R.deferPoll(code,dueAt)",1,true),
    "the poller has a way to say why it stayed silent (P4-R133)")

print("PASS a refused case waits until the survivor moves on, and says why, how often and by when")
