-- Every owner directive for CF: No Help has a named check, or says it has none.
--
-- The owner set seven directives on 2026-09-27 (DECISIONS.md,
-- DR-20260927-NOHELP-RULE-PLACEMENT). The task 3 plan's section 4a table maps
-- each one to the files that prove it. A directive that silently loses its
-- check is how "two conspiracies" turns into one, or "no maximum" into a
-- hidden cap, without any test going red. So:
--   - all seven NH-D rows must be in the table;
--   - every file a row names must exist and carry that row's tag;
--   - a row still saying "not yet written" is reported as pending, not failed,
--     so the suite's known red list is not made longer by work not yet begun.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local plan=read("docs/design/NO_HELP_TASK3_PLACEMENT_PLAN_2026-09-27.md")

local rows={}
for line in plan:gmatch("[^\n]+") do
    local n=line:match("^| NH%-D(%d) ")
    if n then
        local cells={}
        for cell in line:gmatch("|([^|]*)") do cells[#cells+1]=cell end
        -- | directive | proof | readout | checks |
        rows[tonumber(n)]=cells[4] or ""
    end
end

local pending={}
for n=1,7 do
    local checks=rows[n]
    assert(checks,"the plan's directive table has no row for NH-D"..n)
    local tag="NH-D"..n
    local named=0
    for path in checks:gmatch("`([^`]+)`") do
        named=named+1
        assert(read(path):find(tag,1,true),path.." is named as a check for "..tag.." but never mentions "..tag)
    end
    if named==0 then
        assert(checks:find("not yet written",1,true),
            tag.." names no check file and does not say \"not yet written\"")
        pending[#pending+1]=tag
    end
end
if #pending>0 then print("directives without a check yet: "..table.concat(pending,", ")) end
print("nohelp directive trace: 7 directives, "..(7-#pending).." covered")
