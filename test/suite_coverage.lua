-- Every test must be reachable by a documented command.
--
-- Two ways a test disappears, both of which happened here. A *_spec.lua file
-- is only run if test/run.lua names it in a dofile line - add one and forget
-- the line and it never runs again, silently, because the standalone loop
-- deliberately skips every *_spec.lua. And test/package_experimental_test.py
-- sat in test/ from the day it was written until 2026-09-21 with no command
-- running it at all; the baseline at dc73e1c found it by listing the
-- directory, not by running anything.
--
-- The shipped/prototype split has the same failure mode from the other end: a
-- new prototype test that nobody classifies joins the SHIPPED suite by
-- default and can make the released product's baseline red. That is why the
-- classifier lives in one file and this test insists both runners use it.
local function lines(cmd)
    local p=assert(io.popen(cmd))
    local out={}
    for l in p:lines() do out[#out+1]=l end
    p:close()
    return out
end
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end

local run=read("test/run.lua")
local specs=lines("ls test/*_spec.lua")
assert(#specs>0,"no spec files found")
for _,path in ipairs(specs) do
    local name=path:match("([^/]+)%.lua$")
    assert(run:find(name,1,true),
        path.." exists but test/run.lua never dofiles it, so nothing runs it")
end

-- Both runners must classify through the one shared file, or they can disagree
-- about a test and drop it between them.
local unit=read("tools/autotest/unit.sh")
local proto=read("tools/autotest/prototype.sh")
for label,body in pairs({["unit.sh"]=unit,["prototype.sh"]=proto}) do
    assert(body:find("suites.sh",1,true),
        label.." must source tools/autotest/suites.sh rather than keep its own list")
    assert(body:find("cf_is_prototype_test",1,true),
        label.." must use the shared prototype classifier")
end
-- ...and the classifier must actually separate them. Ask it, rather than read
-- it: the first version of this assertion matched the text of suites.sh and
-- passed happily with the broken classifier in place, because a Lua pattern's
-- `.` crosses newlines and found "package.path" in one comment and the
-- directory name in another.
local function classify(path)
    local p=assert(io.popen(
        ". tools/autotest/suites.sh; cf_is_prototype_test '"..path.."' "
        .."&& echo prototype || echo shipped"))
    local verdict=p:read("*l"); p:close(); return verdict
end
assert(classify("test/first_clue.lua")=="prototype",
    "a test that loads dev/next-phase must be classified prototype")
assert(classify("test/case_file.lua")=="shipped",
    "a test of shipped code must be classified shipped")
-- The trap that caught the first classifier: this file MENTIONS the prototype
-- directory while testing the split. Misfiling it as a prototype would move
-- the guard out of the suite it guards.
assert(classify("test/suite_coverage.lua")=="shipped",
    "merely naming the prototype directory must not make a test a prototype "
    .."test; the classifier must anchor on the package.path line")

-- The prototype suite must not be empty: an empty prototype suite looks green
-- and proves nothing, which is exactly how an unshipped failure hides.
local protoTests=lines("grep -l 'package[.]path.*dev/next-phase' test/*.lua 2>/dev/null")
assert(#protoTests>=9,
    "expected at least 9 prototype tests, found "..#protoTests)

-- Python tests in test/ must match the pattern unit.sh discovers with.
local py=lines("ls test/*.py 2>/dev/null")
for _,path in ipairs(py) do
    assert(path:find("_test%.py$"),
        path.." will not be discovered: unit.sh runs unittest with -p '*_test.py'")
end
assert(unit:find("_test.py",1,true),"unit.sh must run the python tests in test/")

-- The native tier must say out loud that it needs the game.
local native=read("tools/autotest/native.sh")
assert(native:find("NEEDS PROJECT ZOMBOID",1,true),
    "native.sh must state that it requires the game")

print("PASS suite_coverage: "..#specs.." specs named by run.lua, "..#protoTests
    .." prototype tests split out, "..#py.." python tests reachable")
