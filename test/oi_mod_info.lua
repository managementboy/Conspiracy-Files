-- Owner code review F-01 (2026-09-28): the package may only claim the Build 42
-- versions the project has verified. PROJECT_STATE.md names the verified
-- build; Dead Air's mod.info must start there, never at a bare "42.0.0".
-- Owner decision 2026-09-30: No Help runs on the whole 42.20 line and every
-- later build, so its mod.info starts at 42.20.0 and agrees with
-- OIShared/GameBuild.FIRST.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local GameBuild=require("OIShared/GameBuild")
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end
local function versionMin(p) return read(p):match("\nversionMin=([%d%.]+)") end
local verified=read("PROJECT_STATE.md"):match("verified stable Build %*%*(%d+%.%d+%.%d+)%*%*")
assert(verified,"PROJECT_STATE.md names the verified build")
local dead=versionMin("mod/42/mod.info")
assert(dead==verified,"mod/42/mod.info: versionMin is "..tostring(dead)..", the verified build is "..verified)
local nohelp=versionMin("mod-ofinterest/42/mod.info")
assert(nohelp==GameBuild.FIRST..".0","mod-ofinterest/42/mod.info: versionMin is "..tostring(nohelp)..", expected "..GameBuild.FIRST..".0")
assert(GameBuild.supported(verified),"the verified build is inside No Help's supported range")
print("nohelp mod.info: Dead Air starts at the verified build "..verified.."; No Help at "..nohelp.." and later")
