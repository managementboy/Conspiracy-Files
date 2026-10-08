-- No Help runs on Build 42.20 and every later build (owner decision
-- 2026-09-30). The in-Lua build checks go through OIShared/GameBuild, so a
-- 42.21 or 43 game is not turned away by a string compare against "42.20".
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
local B=require("OIShared/GameBuild")

local a,b,c=B.parse("42.20.4"); assert(a==42 and b==20 and c==4)
a,b,c=B.parse("42.20"); assert(a==42 and b==20 and c==0,"a bare major.minor has patch 0")
assert(B.parse("t")==nil and B.parse(nil)==nil and B.parse("")==nil,"non-builds do not parse")

for _,v in ipairs({"42.20","42.20.0","42.20.4","42.21","42.21.3","42.100","43.0","43.1.2 (rc)"}) do
    assert(B.supported(v),v.." is supported")
end
for _,v in ipairs({"42.19","42.19.9","42.2","42.0.0","41.78.16","","unknown"}) do
    assert(not B.supported(v),v.." is not supported")
end
assert(not B.supported(nil))

-- Street names: a later build line is looked up, an older one is not.
local P=require("OIShared/Generated/PlaceNames")
local function site(line) return {buildLine=line,mapId="Muldraugh, KY",bounds={x1=10520,y1=9700,x2=10530,y2=9710,z=0}} end
local on20=P.street(site("42.20"))
assert(on20,"a Muldraugh site next to Carpenter Test Road has a street on 42.20")
assert(P.street(site("42.21"))==on20,"42.21 names the same street")
assert(P.street(site("43.0"))==on20,"a later major names the same street")
assert(P.street(site("42.19"))==nil,"a build older than 42.20 is refused")

print("PASS nohelp game build: 42.20 and every later build are supported")
