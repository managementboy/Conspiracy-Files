-- E8 (DR-20260929-NOHELP-GAP-PLAN): map markers stay (owner, 2026-09-29) and
-- scale with the game - hundreds of found clues, no 64-record ceiling - and
-- the overlay does not re-validate an unchanged record table every frame.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path
NHShared={}
Events=setmetatable({},{__index=function(t,k) local e={Add=function() end,Remove=function() end}; rawset(t,k,e); return e end})
ModData={get=function() return nil end,getOrCreate=function() return {} end}
getTimeInMillis=function() return 0 end
isClient=function() return false end
isServer=function() return false end
local md={}
local player={}
function player:getModData() return md end
getPlayer=function() return player end
local M=require("NHShared/ClueMarkers")
local TAG="NHShared.ClueMarkers"
local r={schema=1,records={}}
for i=1,600 do r.records["nh:t3:x:C"..i..":1"]={x=1000+i,y=2000,z=0,map="Muldraugh, KY",written=i%2==0,ink=i%2==0 and "Pen" or nil} end
md[TAG]=r
assert(M.forget({"nh:t3:x:C1:1","nh:t3:x:C2:1"})==2,"600 records read and written back, two forgotten")
local n=0; for _ in pairs(md[TAG].records) do n=n+1 end
assert(n==598,"the rest kept: "..n)
-- A bad record is still refused: the shape check stays.
md[TAG].records["bad"]={x=1.5,y=0,z=0,map="m",written=false}
local ok=pcall(M.forget,{"nh:t3:x:C3:1"})
assert(not ok,"a malformed record is still refused")
-- Unchanged table: not walked again (the overlay reads it every frame).
local src=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/ClueMarkers.lua","rb")):read("*a")
assert(src:find("if r~=checked then",1,true),"an already-checked table is not re-validated")
assert(not src:find("n>64",1,true) and not src:find(">24000",1,true),"no count or size ceiling")
print("nohelp markers scale: 600 finds kept on the map, shape still checked, no ceiling")
