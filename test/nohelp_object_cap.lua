-- The object cap counts observation + note only; the source sentence is exempt
-- (owner, 2026-10-02). Fails if the rest goes over; passes when only the
-- source sentence is long.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local Linter=require("NHShared/Mystery/Linter")
local Vocab=require("NHShared/Mystery/Vocabulary")
local cap=Vocab.MAX_CHARS.object
local function check(observation,source,note)
    local f={where="site",capacity="object",kind="Key1",wear="worn",observation=observation,source=source,note=note}
    return Linter.lint({id="t",findings={k=f},links={},reveals={},gates={},mutations={},centralAxis="records"})
end
local longSource=string.rep("It is a plain brass key. ",20)
assert(#longSource>cap)
local ok,why=check("A key.",longSource,"Mine.")
assert(not (why and why:find("exceeds",1,true)),"a long source alone must not trip the cap: "..tostring(why))
local rest=string.rep("x",cap-3)
ok,why=check(rest,"Short.","N.")
assert(not (why and why:find("exceeds",1,true)),"at the cap must pass: "..tostring(why))
ok,why=check(rest,"Short.","Nn.")
assert(not ok and why:find("exceeds",1,true),"observation + note over the cap must be refused")
ok,why=check(rest,longSource,"Nn.")
assert(not ok and why:find("exceeds",1,true),"a long source must not hide an over-long rest")
print("PASS nohelp object cap counts observation + note only; the source sentence is exempt")
assert(check("A key.","Short.","Mine."),"a plain object finding must lint clean")
