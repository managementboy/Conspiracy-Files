package.path="mod/common/media/lua/shared/?.lua;"..package.path
local M=require("ConspiracyFiles/LocalPerson")
local r={caseId="case-1",buildingId="house-1",sourceToken="corpse:7",observedName="Dana Vale",assignedOccupation="maintenance clerk",keyToken="key:7",keyId=12,status="pending"}
local s=M.empty();assert(M.validate(s));local b,why=M.bind(s,r);assert(why=="bound" and s.records[r.caseId]==nil)
local d=assert(M.bind(b,r));d.records[r.caseId].observedName="changed";assert(b.records[r.caseId].observedName=="Dana Vale")
assert(M.bind(b,{caseId="case-1",buildingId="other",sourceToken="corpse:7",observedName="Dana Vale",assignedOccupation="maintenance clerk",keyToken="key:7",keyId=12,status="pending"})==nil)
local p=assert(M.transition(b,"case-1","placing"));assert(M.transition(p,"case-1","placed"));local u=assert(M.transition(p,"case-1","unknown"));assert(M.transition(u,"case-1","placed",true));assert(M.transition(u,"case-1","placed")==nil)
assert(M.transition(b,"case-1","placed")==nil);assert(M.transition(p,"case-1","pending")==nil)
local bad=M.snapshot(b);bad.extra=true;assert(not M.validate(bad));bad=M.snapshot(b);bad.records["case-1"].keyId=-1;assert(not M.validate(bad));bad=M.snapshot(b);bad.records["case-1"].observedName="bad\nname";assert(not M.validate(bad));assert(not M.validate(setmetatable({},{})))
for i=2,M.MAX do local x={caseId="case-"..i,buildingId="house",sourceToken="body"..i,observedName="Name"..i,assignedOccupation="worker",keyToken="key"..i,keyId=i,status="pending"};b=assert(M.bind(b,x)) end
assert(M.bind(b,{caseId="overflow",buildingId="house",sourceToken="body",observedName="Name",assignedOccupation="worker",keyToken="key",keyId=9,status="pending"})==nil)
print("PASS LocalPerson: strict immutable bindings, bounded transitions and no respawn reset")
assert(not M.validate({schema=1,records={broken=false}}))
