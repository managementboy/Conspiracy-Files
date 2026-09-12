package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local function site(id,x)
 return {id=id,name=id,areaId=id,mapId="M",buildLine="42.20",bounds={x1=x,y1=0,x2=x+1,y2=1,z=0},source={kind="synthetic",reference="offline fixture"},paperStorage="observed",containerTypes={"desk"},excluded=false}
end
local catalog={revision="selected-test",locations={site("a",0),site("b",10)}}
local opts={mapId="M",buildLine="42.20",allowSynthetic=true}
for seed=1,20 do
 local c=assert(G.generateSelected(catalog,seed,opts,{"b","a"}))
 assert(c.locations[1].id=="b" and c.documents[1].locationId=="b" and c.documents[2].locationId=="a")
 assert(G.validate(c))
end
assert(not G.generateSelected(catalog,1,opts,{"a","a"}))
assert(not G.generateSelected(catalog,1,opts,{"a","b",extra=true}))
assert(not G.generateSelected(catalog,1,{mapId="M",buildLine="42.20",allowSynthetic=true,extra=true},{"a","b"}))
assert(not G.generateSelected(catalog,1,{mapId="M",buildLine="42.20"},{"a","b"}))
assert(not G.generateSelected(catalog,1,opts,setmetatable({"a","b"},{})))
local cycle={};cycle[1]=cycle;assert(not G.generateSelected(catalog,1,opts,cycle))
print("PASS selected generation: explicit order across seeds; strict input and eligibility")
