-- CI's documentation must describe CI.
--
-- docs/design/CI_PLAN.md spent the whole life of the implementation saying
-- "CI is intentionally not enabled while the repository contains no Lua
-- implementation". By the time anybody read it there were 124 shipped Lua
-- files and 175 tests, and a rewrite of the entire writing layer had reached
-- the Workshop without one automated run. A plan nobody revisits is worse
-- than no plan, because it answers the question wrongly.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local plan=read("docs/design/CI_PLAN.md")
local flow=read(".github/workflows/offline.yml")

-- 1. The workflow exists and the plan points at it.
assert(plan:find("offline.yml",1,true),"the plan must name the workflow file")
-- The plan quotes its own retracted sentence, which is the right thing to do.
-- What must not survive is the sentence asserted rather than quoted.
for line in plan:gmatch("[^\n]+") do
    if line:find("intentionally not enabled",1,true) then
        assert(line:find('"'),
            "the plan states CI is not enabled outside a quotation; it is "
            .."enabled: "..line)
    end
end
assert(plan:find("CI exists and runs",1,true),
    "the plan must open by saying CI exists")

-- 2. Every job the plan's table names must exist in the workflow, and every
-- job in the workflow must be named in the plan. A job nobody documented is a
-- job nobody knows is optional.
local jobs={}
for id in flow:gmatch("\n  ([%w_-]+):\n    name:") do jobs[#jobs+1]=id end
assert(#jobs>=6,"expected at least six jobs, found "..#jobs)
for _,id in ipairs(jobs) do
    local name=flow:match("\n  "..id..":\n    name: ([^\n]+)")
    local first=name:match("^[%w ]+"):gsub("%s+$","")
    assert(plan:find(first,1,true),
        "the workflow has a job the plan does not mention: "..name)
end

-- 3. The blocking job is the shipped one, and only that one is called blocking.
local blocking=0
for line in plan:gmatch("[^\n]+") do
    if line:find("^| ") and line:find("| **yes**",1,true) then blocking=blocking+1 end
end
assert(blocking==1,"exactly one job may block integration, the plan marks "..blocking)
assert(plan:find("Only `shipped` should be a required check",1,true),
    "the plan must say which job belongs in branch protection")
assert(plan:find("prototype",1,true) and plan:find("not.*blocking") ,
    "the plan must say the prototype job is visible but not blocking")

-- 4. KAHLUA IS NOT PROVEN BY PUC LUA, and CI must not imply that it is.
assert(plan:find("does not prove Kahlua compatibility",1,true),
    "the plan must state that PUC Lua parsing proves nothing about Kahlua")
assert(flow:find("CF_SKIP_KAHLUA=1",1,true),
    "the shipped job must skip kahlua explicitly, not by accident")
local unit=read("tools/autotest/unit.sh")
assert(unit:find("NOT EXERCISED",1,true) and unit:find("this is not a pass",1,true),
    "unit.sh must report a skipped kahlua run as NOT EXERCISED and not a pass")
assert(flow:find("kahlua_gate.sh",1,true),
    "CI must point at the gate that does run kahlua")
local gate=read("tools/autotest/kahlua_gate.sh")
assert(gate:find("exit 2",1,true),
    "the gate must be able to say it could not run, which is not a pass")

-- 5. Every command the plan tells a reader to run must exist.
for cmd in plan:gmatch("(tools/[%w_/]+%.sh)") do
    local f=io.open(cmd,"rb")
    assert(f,"the plan names a command that does not exist: "..cmd)
    f:close()
end

-- 6. Every job starts where the repository is, because this repository is
-- nested inside a larger workspace and a run one directory up finds nothing
-- and reports nothing wrong.
local checkouts=select(2,flow:gsub("uses: actions/checkout@",""))
local guards=select(2,flow:gsub("at_repo_root%.sh",""))
assert(checkouts==guards,
    checkouts.." jobs check out the repository but only "..guards
    .." confirm they are in it")

print("PASS ci_contract: "..#jobs.." jobs, all documented, one blocking, "
    .."kahlua reported as NOT EXERCISED rather than passed, "
    ..guards.." repository-root guards")
