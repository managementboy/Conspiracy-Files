package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local A=require("EvidenceArchive")
local c={documents={{id="a",references={"shared"}},{id="b",references={"unrelated"}},{id="c",references={"shared"}},{id="hidden",references={"shared"}}}}
local touched,stats=A.relevant(c,{"a","b","c"},"c")
assert(#touched==1 and touched[1]=="a" and stats.visited==1,"only affected known bucket visited")
local times=A.rebuild(c,{"a","b","c"},{a=1,b=2,c=10})
assert(times.a==10 and times.b==2 and times.c==10 and times.hidden==nil)
local rows={{id="a",links={{target="c"}}},{id="b"}}
local view=assert(A.project(rows,times,12,5));assert(not view[1].archived and view[2].archived)
view[1].links[1].target="changed";assert(rows[1].links[1].target=="c")
assert(assert(A.project(rows,times,15,5))[1].archived)
assert(not A.project(rows,times,9,5))
print("PASS EvidenceArchive: affected bucket only, unknown exclusion, resurfacing, exact age and deep copies")
