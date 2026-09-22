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

print("PASS no_process_matching: liveness comes from PID files and /proc, "
    .."never from a command-line pattern that can match the asker")
