-- Evidence is the record of what was true at a commit, so a record that says
-- nothing is not evidence (2026-09-15). 20260913T223949-core-loop.txt was
-- committed at 0 bytes: that run died after the game stopped and before its
-- report was written, and `{ ... } > "$report"` had already created the file.
-- Every check now writes its report beside it and moves it into place only
-- once it is whole, so an interrupted run leaves a .part (ignored by git),
-- never an empty record.
local function lines(cmd)
    local p=assert(io.popen(cmd))
    local out={}
    for l in p:lines() do out[#out+1]=l end
    p:close()
    return out
end

local DIR="docs/management/evidence/linux-autotest/"
local files=lines("git ls-files "..DIR.." 2>/dev/null")
assert(#files>100,"the committed evidence must be listable (git ls-files): "..#files)
local empty={}
for _,path in ipairs(files) do
    local f=io.open(path,"rb")
    if f then
        local size=f:seek("end")
        f:close()
        if size==0 then empty[#empty+1]=path end
    end
end
assert(#empty==0,"empty evidence files: "..table.concat(empty,", "))

-- Every committed script that writes a report writes it whole.
local scripts=lines("git ls-files 'tools/autotest/*.sh' 'tools/fieldnote-test/*.sh' 2>/dev/null")
assert(#scripts>=15,"the check scripts must be listable: "..#scripts)
local bare={}
for _,path in ipairs(scripts) do
    local f=assert(io.open(path,"r"))
    local src=f:read("*a")
    f:close()
    for target in src:gmatch('}%s*>%s*"%$(%w+)"') do bare[#bare+1]=path.." ($"..target..")" end
end
assert(#bare==0,"a report written straight into place leaves an empty file when the run dies: "
    ..table.concat(bare,", "))

print("PASS evidence files: "..#files.." records, none empty; "..#scripts.." scripts write their reports whole")
