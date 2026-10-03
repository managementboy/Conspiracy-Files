-- Nothing from the game (its jar, stdlib.lua, vanilla Lua, or method lists derived from them) may be
-- tracked by git. Also proves the gate itself fires on a bad path.
local function run(cmd) local p = io.popen(cmd .. " 2>&1; echo EXIT=$?"); local o = p:read("*a"); p:close(); return tonumber(o:match("EXIT=(%d+)")), o end
local code, out = run("tools/realengine/leak_gate.sh")
assert(code == 0, "a game file is tracked:\n" .. out)
local list = os.tmpname()
local fh = io.open(list, "w"); fh:write("mod/ok.lua\nstdlib.lua\ndocs/reference/pz-modding/vanilla-lua/client/x.lua\ntools/enginecalls/.cache/sigs-ab12.txt\n"); fh:close()
code, out = run("tools/realengine/leak_gate.sh --files-from " .. list)
os.remove(list)
assert(code == 1, "the gate must refuse game files:\n" .. out)
local n = select(2, out:gsub("LEAK", ""))
assert(n == 3, "expected 3 refusals, got " .. n .. ":\n" .. out)
print("PASS no game files tracked; the gate refuses stdlib.lua, vanilla Lua and derived method lists")
