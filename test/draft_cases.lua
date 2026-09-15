package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local D=require("DraftCases")
local facts={sender="M. Ellis",recipient="D. Mercer",organisation="County Stores",code="S-417",firstDay=2,secondDay=4,reviewDay=5}
local sites={{id="site-a",name="Depot"},{id="site-b",name="Workshop"}}
local function clone(v) if type(v)~="table" then return v end local o={} for k,c in pairs(v) do o[k]=clone(c) end return o end
local seen={}
for seed=1,20 do local c=assert(D.build(seed,facts,sites)); assert(D.validate(c)); seen[c.outline]=true; assert(D.build(seed,facts,sites).documents[1].body==c.documents[1].body) end
assert(seen["stock-discrepancy"] and seen["maintenance-readings"], "both draft outlines must be reachable")
local a=assert(D.build(1,facts,sites)); assert(a.contentStatus=="owner-review-required")
local isolated=assert(D.build(1,facts,sites)); local sourceName=sites[1].name; isolated.sites[1].name="changed"; assert(sites[1].name==sourceName, "build output must not alias inputs")
local function invalid(mutator) local c=clone(assert(D.build(1,facts,sites))); mutator(c); assert(not D.validate(c), "tampered case must reject") end
invalid(function(c) c.documents[1].body="tampered" end); invalid(function(c) c.facts.secondDay=1 end); invalid(function(c) c.documents[2].links[1].target="missing" end); invalid(function(c) c.documents[1].leads[1]="missing" end); invalid(function(c) c.organisation.name="other" end)
assert(not D.build(1,{sender="x"},sites) and not D.build(1,facts,{[1]=sites[1],[3]=sites[2]}), "malformed inputs reject")
local cyclic=clone(facts); cyclic.self=cyclic; assert(not D.build(1,cyclic,sites), "cyclic inputs reject without throwing")
local ok,result=pcall(D.validate,nil); assert(ok and not result, "nil case must reject without throwing")
for _,bad in ipairs({{documents={[1]={}}},setmetatable({},{})}) do local safe,result=pcall(D.validate,bad); assert(safe and not result, "malformed cases must reject without throwing") end
local cyclicCase=clone(assert(D.build(1,facts,sites))); cyclicCase.loop=cyclicCase; local ok,result=pcall(D.validate,cyclicCase); assert(ok and not result, "cyclic cases must reject without throwing")
local initial=assert(D.project(a,{})); assert(#initial==0)
local first=assert(D.project(a,{a.documents[1].id})); assert(#first==1 and #first[1].links==0, "single known document has no hidden links")
local forward=assert(D.project(a,{a.documents[1].id,a.documents[2].id})); local reverse=assert(D.project(a,{a.documents[2].id,a.documents[1].id}))
assert(#forward[2].links==1 and #reverse[1].links==1, "all known IDs enable links independent of discovery ordering")
assert(not D.project(a,{"missing"}) and not D.project(a,{a.documents[1].id,a.documents[1].id}))
print("PASS DraftCases: deterministic owner-review drafts, strict validation, coherence, and learned-only projection")
