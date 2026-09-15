-- The harness must not hand the machine lock to the game.
--
-- claim_game holds the lock as file descriptor 9. Anything launched without
-- closing that descriptor INHERITS the lock and keeps it for as long as it
-- lives, so a game that outlives its check - one that ignores the quit and has
-- to be terminated, which happens - blocks every later check at flock until
-- its twenty-minute timeout, having printed nothing.
--
-- This happened twice. Xvfb first, fixed months ago with 9>&- and a comment
-- explaining the failure in detail; then the game launch itself on 2026-09-13,
-- which had simply been missed. fuser on the lock file named the holders: the
-- launcher, the game, the check's own bash, and a flock that had been waiting
-- thirteen minutes.
--
-- A shell test rather than a Lua one in spirit, but it lives here because this
-- is where things that must stay true are asserted.
local function read(path)
    local f = assert(io.open(path, "r"), "cannot read " .. path)
    local s = f:read("*a"); f:close(); return s
end

local pz = read("tools/autotest/pz.sh")

-- Every background launch in the harness must close fd 9.
local launches, missing = 0, {}
for line in pz:gmatch("[^\n]+") do
    -- Lines that start a long-lived process: setsid, nohup, or a trailing &.
    local starts = line:find("setsid", 1, true) or line:find("nohup", 1, true)
    -- Skip comments; the explanations mention setsid by name.
    local comment = line:match("^%s*#")
    if starts and not comment then
        launches = launches + 1
        if not line:find("9>&-", 1, true) then
            missing[#missing + 1] = (line:gsub("^%s+", ""):sub(1, 70))
        end
    end
end

assert(launches >= 2, "expected at least the Xvfb and game launches, found " .. launches)
assert(#missing == 0,
    "these launches inherit the machine lock (fd 9) and will hold it for as "
    .. "long as they live; add 9>&-:\n  " .. table.concat(missing, "\n  "))

-- And claim_game must say who is holding the lock when it gives up, or the
-- next person gets a twenty-minute silence instead of a name.
local lib = read("tools/autotest/lib.sh")
assert(lib:find("fuser", 1, true),
    "claim_game must name the lock holder when it times out")

-- And nobody may count with the idiom that returns two numbers.
--
-- `grep -c PATTERN file || echo 0` prints "0" AND exits 1 when it matches
-- nothing, so the fallback fires as well and the result is "0\n0". Feed that
-- to $(( )) and the arithmetic dies, taking the whole check down after its
-- last assertion has already passed - which is exactly what happened to
-- checks/pdagame.sh on 2026-09-13. lib.sh has mod_error_count for this.
local bad = {}
local scripts = io.popen("ls tools/autotest/*.sh tools/autotest/checks/*.sh tools/fieldnote-test/*.sh 2>/dev/null")
for path in scripts:lines() do
    local src = read(path)
    for line in src:gmatch("[^\n]+") do
        -- Not comments: lib.sh's own explanation quotes the bad idiom to
        -- describe it, which is the point of the explanation.
        if not line:match("^%s*#") and line:find("grep %-c") and line:find("||%s*echo%s+0") then
            bad[#bad + 1] = path .. ": " .. (line:gsub("^%s+", ""):sub(1, 60))
        end
    end
end
scripts:close()
assert(#bad == 0,
    "grep -c prints 0 and exits 1 on no match, so these produce \"0\\n0\" and will "
    .. "kill the next arithmetic; use lib.sh's mod_error_count:\n  "
    .. table.concat(bad, "\n  "))

print("PASS harness correctness: all " .. launches ..
      " background launches close the machine lock descriptor, a timeout names the holder, " ..
      "and nothing counts with grep -c || echo 0")
