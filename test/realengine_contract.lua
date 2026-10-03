-- The real-engine run contract (tools/realengine/contract.py) must refuse to look green when it
-- was silent, partial or stale. Pure logic: runs anywhere, no game needed.
local tmp = os.tmpname()
local lock = tmp .. ".lock"
local function run(args)
    local p = io.popen("python3 tools/realengine/contract.py --lock " .. lock .. " --jar-sha AAAA --build 100 " .. args .. " 2>&1; echo EXIT=$?")
    local out = p:read("*a"); p:close()
    return tonumber(out:match("EXIT=(%d+)")), out
end
local function expect(want, args, label)
    local code, out = run(args)
    assert(code == want, label .. ": wanted exit " .. want .. ", got " .. tostring(code) .. "\n" .. out)
    return out
end
os.remove(lock)
expect(21, "--real 5", "no lock yet is never a pass")
expect(0, "--real 5 --relock", "relock records the build")
expect(0, "--real 5", "same build, enough real tests")
expect(1, "--real 5 --failed 1", "a failure is exit 1")
expect(22, "--real 0 --skipped 5", "an all-skip run is not a pass")
expect(22, "--real 4", "fewer real tests than the lock demands")
local out = expect(21, "--real 5 --jar-sha BBBB --build 101", "a different game build")
assert(out:find("verified against build 100, game is build 101", 1, true), "drift message names both builds:\n" .. out)
expect(22, "--real 3 --relock", "relock never lowers the minimum, and the shortfall still fails")
expect(22, "--real 4", "...so 4 is still below 5")
expect(0, "--real 9 --relock", "relock raises the minimum")
expect(22, "--real 8", "now 9 are demanded")
expect(0, "--real 3 --relock --allow-lower", "lowering takes the explicit flag")
expect(0, "--real 3", "and then 3 is enough")
local slow = expect(0, "--real 3 --startup-ms 99999", "slow start-up only warns")
assert(slow:find("warning", 1, true), "slow start-up must be reported")
os.remove(lock); os.remove(tmp)
print("PASS realengine contract: exit 0/1/21/22, drift message, lock never lowers silently")
