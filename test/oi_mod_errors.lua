-- The harness's mod_errors (tools/autotest/lib.sh) sees No Help's errors too
-- (first visible playtest, 2026-09-27). It matched only the original mod's
-- trace tag "MOD:Conspiracy-Files"; No Help's traces say "MOD:Conspiracy
-- Files: No Help", so a No Help error thrown three times at every world start
-- never reached a check. Run against a console excerpt in the game's shape.
local path=os.tmpname()
local f=assert(io.open(path,"wb"))
f:write([[
[CF-AUTOTEST] launching session=s1
ERROR: General      f:30> Lua((MOD:Conspiracy Files: No Help)).known> Exception thrown
	java.lang.RuntimeException: attempted index: id of non-table: null
	Lua((MOD:Conspiracy Files: No Help)).known(LocalPersonIntegration.lua:390)
ERROR: General      f:31> Lua((MOD:Conspiracy-Files)).tick> Exception thrown
	java.lang.RuntimeException: original mod failure
	Lua((MOD:Conspiracy-Files)).tick(Runtime.lua:1)
ERROR: General      f:32> Lua((MOD:SomeOtherMod)).x> Exception thrown
	java.lang.RuntimeException: not ours
	Lua((MOD:SomeOtherMod)).x(Other.lua:1)
]])
f:close()
local cmd="bash -c '. tools/autotest/lib.sh; CONSOLE="..path.."; session() { echo s1; }; mod_errors'"
local p=assert(io.popen(cmd))
local out=p:read("*a"); p:close(); os.remove(path)
assert(out:find("id of non-table: null",1,true),"No Help's error is reported:\n"..out)
assert(out:find("original mod failure",1,true),"the original mod's error still is:\n"..out)
assert(not out:find("not ours",1,true),"another mod's error is not:\n"..out)
print("nohelp mod errors: the harness reports both mods' errors and no one else's")
