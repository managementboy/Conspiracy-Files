-- The engine-call scanner (tools/enginecalls) must ignore comments/strings, count arguments,
-- and catch the removed getDoor(boolean). The selftest needs no game; the regression proof
-- (the code from before the door fix is flagged) needs the game and says so when it is absent.
local ok = os.execute("python3 tools/enginecalls/enginecalls.py --selftest >/dev/null 2>&1")
assert(ok == 0 or ok == true, "enginecalls selftest failed: run python3 tools/enginecalls/enginecalls.py --selftest")
local p = io.popen("python3 tools/enginecalls/enginecalls.py --tree-from-git a7720a00~1 2>&1")
local out = p:read("*a"); p:close()
if out:find("NOT EXERCISED", 1, true) then
    print("PASS enginecalls selftest (regression proof NOT EXERCISED: no game here, not a pass)")
else
    assert(out:find("getDoor", 1, true), "the scanner no longer flags getDoor(true) in the pre-fix code:\n" .. out)
    print("PASS enginecalls: selftest, and the pre-fix getDoor(true) is flagged by the real game's method list")
end
