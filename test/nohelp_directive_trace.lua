-- Every owner directive for CF: No Help has a named check, or says which step
-- owes it one.
--
-- The owner set seven directives on 2026-09-27 (DECISIONS.md,
-- DR-20260927-NOHELP-RULE-PLACEMENT). The task 3 plan's section 4a table maps
-- each one to the files that prove it. A directive that silently loses its
-- check is how "two conspiracies" turns into one, or "no maximum" into a
-- hidden cap, without any test going red. So:
--   - only section 4a's table is read, and all seven rows must be there once;
--   - every file a row names must be a test (test/ or tools/autotest/checks/)
--     and must carry the row's tag on a line of code, not only in a comment;
--   - a row still owed says "not yet written, due step N" and is reported as
--     pending, not failed, so the known red list is not made longer by work
--     not yet begun; a row may not name files and still say that.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local plan=read("docs/design/NO_HELP_TASK3_PLACEMENT_PLAN_2026-09-27.md")
local section=plan:match("\n## 4a%.(.-)\n## 5%.")
assert(section,"the plan has no section 4a between sections 4 and 5")

local rows={}
for line in section:gmatch("[^\n]+") do
    local n=line:match("^| NH%-D(%d+) ")
    if n then
        n=tonumber(n)
        assert(n>=1 and n<=7,"the directive table has an unknown row NH-D"..n)
        assert(not rows[n],"the directive table has NH-D"..n.." twice")
        local cells={}
        for cell in line:gmatch("|([^|]*)") do cells[#cells+1]=cell end
        -- | directive | proof | readout | checks |
        rows[n]=cells[4] or ""
    end
end

local function taggedInCode(text,tag)
    for line in text:gmatch("[^\n]+") do
        local code=line:gsub("%-%-.*$","")
        if code:find(tag,1,true) then return true end
    end
    return false
end

local pending={}
for n=1,7 do
    local checks=rows[n]
    assert(checks,"the directive table has no row for NH-D"..n)
    local tag="NH-D"..n
    local named=0
    for path in checks:gmatch("`([^`]+)`") do
        named=named+1
        assert(path:find("^test/") or path:find("^tools/autotest/checks/"),
            tag.." names "..path..", which is not a test")
        assert(taggedInCode(read(path),tag),path.." is named as a check for "..tag.." but never uses "..tag.." outside a comment")
    end
    if named==0 then
        assert(checks:find("not yet written, due step %d"),
            tag.." names no check file and does not say which step owes it")
        pending[#pending+1]=tag
    else
        assert(not checks:find("not yet written",1,true),tag.." names checks but still says \"not yet written\"")
    end
end
if #pending>0 then print("directives without a check yet: "..table.concat(pending,", ")) end
print("nohelp directive trace: 7 directives, "..(7-#pending).." covered")
