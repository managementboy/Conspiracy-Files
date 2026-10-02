-- Every hand-made fake declares what it imitates (-- FAKE-OF <class>: names) and must match the real
-- class. The honesty part (declared names really defined) runs anywhere; the comparison with the real
-- game needs the game and says so when it is absent.
local function run(cmd) local p = io.popen(cmd .. " 2>&1; echo EXIT=$?"); local o = p:read("*a"); p:close(); return tonumber(o:match("EXIT=(%d+)")), o end
local code, out = run("python3 tools/realengine/fake_parity.py --offline")
assert(code == 0, "a fake declaration is dishonest:\n" .. out)
code, out = run("python3 tools/realengine/fake_parity.py")
if code == 20 then print("PASS fake declarations honest (comparison with the real game NOT EXERCISED: no game here, not a pass)")
else assert(code == 0, "a fake no longer matches the real game:\n" .. out); print("PASS fakes match the real game's classes") end
