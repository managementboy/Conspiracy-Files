-- ASKING "IS IT RUNNING?" BY MATCHING COMMAND LINES IS BANNED IN THE CHECKS.
--
-- It went wrong four times, always the same way: the question mentions the
-- thing it asks about, so the asker matches itself or any diagnostic command
-- that names it.
--
--   pkill -f checks/campaign.sh        killed the asking shell (exit 144)
--   pgrep -f autotest/checks/          counted the asking shell as two checks
--   pz.sh status                       reported the asking shell as the game
--   until ! pgrep -f "bash .../campaign.sh"
--                                      never exited: the loop's own command
--                                      line contained the pattern. It spun for
--                                      37 minutes after the run it watched had
--                                      finished AND PASSED, which the owner saw
--                                      as "the campaign gate is 56 minutes in".
--
-- The bracket trick ([c]ampaign) only stops the matcher matching ITSELF; it
-- does not stop it matching another process that mentions the name.
--
-- So checks write a PID file and the answer comes from /proc: alive, and the
-- same process that wrote it (PID plus its start time, so a recycled PID
-- cannot answer yes).
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local lib=read("tools/autotest/lib.sh")

assert(lib:find("cf_claim_run",1,true) and lib:find("cf_run_alive",1,true),
    "lib.sh must provide PID-file based run tracking")
assert(lib:find("/proc/$1/stat",1,true) or lib:find("cf_proc_started",1,true),
    "liveness must be decided from /proc, not from a command-line pattern")
assert(lib:find("$now\" = \"$started",1,true),
    "a recycled PID must not answer yes: compare the process start time")
assert(lib:find("trap 'rm -f",1,true),
    "the PID file must be removed however the check exits")

-- Every long check claims a run, before it starts a world.
for _,c in ipairs({"campaign","map_coverage","marker_lifecycle"}) do
    local body=read("tools/autotest/checks/"..c..".sh")
    assert(body:find("cf_claim_run "..c,1,true),
        c..".sh must claim its run so nobody has to guess from ps output")
    local claim=body:find("cf_claim_run",1,true)
    local work=body:find("start_world",1,true) or body:find("start_cold",1,true)
        or body:find("claim_game",1,true)
    assert(claim and work and claim<work,
        c..".sh must claim the run before it starts working")
end

-- And the helper exists for anything that needs to wait on one.
local runner=read("tools/autotest/running.sh")
assert(runner:find("cf_run_alive",1,true),
    "running.sh must answer from the PID files")
-- Executable lines only: the file's own comment says "never `pgrep -f`", and
-- a blanket search flagged that. Prose about the ban is not the ban broken.
for line in runner:gmatch("[^\n]+") do
    if not line:match("^%s*#") then
        assert(not line:find("pgrep",1,true) and not line:find("pkill",1,true),
            "running.sh must not fall back to matching command lines: "..line)
    end
end

-- A CLEANUP TRAP MUST NOT SWALLOW THE SIGNAL. Trapping INT/TERM with a
-- handler that only cleans up makes bash run the handler and carry on, so
-- `kill` stopped working on these checks the moment run-tracking was added:
-- the PID file was removed while the process lived, running.sh reported "no
-- autotest check is running" about a run still holding the machine lock, and
-- the next check waited on a lock nobody would release (2026-09-22).
assert(lib:find("exit 130",1,true) and lib:find("exit 143",1,true),
    "the INT and TERM traps must clean up AND terminate; a trap that only "
    .."cleans up swallows the signal")
-- Matched by LINE, not by a quoted-string pattern: the trap body itself
-- contains single quotes, so a [^']* pattern truncates it and asserts about
-- the wrong text.
for line in lib:gmatch("[^\n]+") do
    if line:find("trap ",1,true) and line:find(" EXIT",1,true) then
        assert(not line:find("exit 1",1,true),
            "the EXIT trap must only clean up; exiting from it would recurse: "..line)
    end
end

-- And there must be a documented way to stop a run, because `kill PID` alone
-- is deferred until whatever child the check is waiting on returns.
local stopf=assert(io.open("tools/autotest/stop.sh","rb"))
local stop=stopf:read("*a"); stopf:close()
assert(stop:find('kill -TERM "-$pid"',1,true),
    "stopping a check must signal the process GROUP, so the sleep or eval it "
    .."is waiting on is interrupted too")
assert(stop:find("kill -KILL",1,true),
    "a check that ignores TERM must still be stoppable")
assert(stop:find("pz.sh stop",1,true),
    "stopping a check must also stop the game: a killed check that leaves the "
    .."game up keeps the machine lock with it")

print("PASS no_process_matching: liveness comes from PID files and /proc, "
    .."never from a command-line pattern that can match the asker")
