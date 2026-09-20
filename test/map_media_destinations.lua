-- Source geometry contracts; native container availability remains a Linux gate.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local C=require("ConspiracyFiles/MapMediaCatalogue")
local D=require("ConspiracyFiles/MapMediaDestinations")
local expected={"IrvingtonStashMap1","IrvingtonStashMap9","WorldStashMap3","WorldStashMap6",
 "WorldStashMap9","WorldStashMap10","WorldStashMap11","WorldStashMap16","WorldStashMap18","WorldStashMap21","WorldStashMap23"}
local count=0
for _,id in ipairs(C.list) do if C.get(id).areas then count=count+1 end end
assert(count==#expected,"exactly the reviewed eleven designs get area geometry")
for _,id in ipairs(expected) do
 local b=assert(C.get(id));assert(#b.areas>0 and b.areaSource and #b.areaSource>0)
 for _,a in ipairs(b.areas) do
  assert(a.x1<=a.x2 and a.y1<=a.y2)
  assert(D.contains(b,a.x1,a.y1) and D.contains(b,a.x2,a.y2),"authored edges are inclusive")
  assert(D.intersects(b,a.x1,a.y1,a.x1+1,a.y1+1),"area/building intersection")
 end
 assert(not D.contains(b,-1,-1) and not D.intersects(b,-10,-10,-1,-1))
end
local a,b=C.get("MulStashMap11"),C.get("MulStashMap16")
assert(a.sharedPeer==b.id and b.sharedPeer==a.id)
assert(a.targets[1].x==b.targets[1].x and a.targets[1].y==b.targets[1].y)
assert(a.storyFamilies[1]=="food" and b.storyFamilies[1]=="names","independent files at shared restaurant")
assert(not a.areas and not b.areas,"restaurant remains an actual building destination")
print("PASS reviewed map footprints: eleven bounded marked areas and one primary-source shared restaurant pair")
