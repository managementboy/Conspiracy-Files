-- Owner code review F-01 (2026-09-28): the package may only claim the Build 42
-- versions the project has verified. PROJECT_STATE.md names the verified
-- build; both mods' mod.info must start there, never at a bare "42.0.0".
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end
local verified=read("PROJECT_STATE.md"):match("verified stable Build %*%*(%d+%.%d+%.%d+)%*%*")
assert(verified,"PROJECT_STATE.md names the verified build")
for _,p in ipairs({"mod-nohelp/42/mod.info","mod/42/mod.info"}) do
    local v=read(p):match("\nversionMin=([%d%.]+)")
    assert(v==verified,p..": versionMin is "..tostring(v)..", the verified build is "..verified)
end
print("nohelp mod.info: both mods start at the verified build "..verified)
