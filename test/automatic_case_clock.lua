package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator");local S=require("ConspiracyFiles/Generated/Session");local C=require("ConspiracyFiles/Generated/SuccessiveCases")
local catalog=dofile("test/fixtures/synthetic_locations.lua")
local function root(seed)
 local case=assert(G.generate(catalog,seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}));local t={};for _,s in ipairs(case.locations) do t[s.id]={x=s.bounds.x1,y=s.bounds.y1,z=s.bounds.z,objectIndex=0,containerIndex=0,containerType="shelves",sprite="s"} end;return assert(S.create(case,t))
end
local a,b=root(17),root(18);local w={canonical=a,schedule={schema=1,createdHours={10}}};assert(C.validate(w))
local staged=assert(C.stage(w,b,12));assert(#staged.schedule.createdHours==2 and staged.schedule.createdHours[2]==12 and #w.schedule.createdHours==1)
assert(not C.stage(w,b,9) and not C.stage(w,b,0/0));assert(not C.stage({canonical=a},b,12))
for _,bad in ipairs({{schema=1,createdHours={-1}},{schema=1,createdHours={0/0}},{schema=1,createdHours={10,11}},{schema=1,createdHours={10},extra=true}}) do local x={canonical=a,schedule=bad};assert(not C.validate(x)) end
local replaced=assert(C.replace(staged,1,a));assert(replaced.schedule.createdHours[1]==10 and replaced.schedule.createdHours[2]==12)
assert(not C.validate({canonical=a,schedule=false}))
assert(not C.validate({canonical=a,schedule={schema=1,createdHours={[2]=10}}}))
assert(not C.validate({canonical=a,schedule={schema=1,createdHours={math.huge}}}))
print("PASS automatic case clock: strict optional schedule, monotonic stage, atomic failure, replacement retention")
