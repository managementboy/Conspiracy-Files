package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local C=require("CampaignPolicy"); local M=require("MultiCaseNotebook")
local ledger=C.new(); local cfg={minGapHours=0,maxConcurrent=2,maxRetained=3}
local function q(id,h,sites) return {caseId=id,createdHours=h,survivalHours=h,anchor={x=1,y=2},radius=250,siteIds=sites,activeIds={},activeCount=0} end
ledger=assert(C.stage(ledger,cfg,q("one",0,{"a","b"}),{})); ledger=assert(C.stage(ledger,cfg,q("two",1,{"c","d"}),{}))
local projections={one={{id="same",title="Known A",body="A",locationId="hidden-site",leads={},connections={{target="hidden",kind="lead"}}}},two={{id="same",title="Known B",body="B",locationId="other-site",leads={},connections={{target="same",kind="self"}}}}}
local groups=assert(M.project(ledger,projections)); assert(#groups==2 and groups[1].name=="Investigation 1" and #groups[1].rows[1].links==0)
assert(groups[1].rows[1].evidenceKey~=groups[2].rows[1].evidenceKey, "same document IDs require namespaced keys")
projections.one[1].title="changed"; assert(groups[1].rows[1].title=="Known A", "return must not alias source")
groups[1].rows[1].title="returned"; assert(projections.one[1].title=="changed", "source must not alias return")
local reordered=assert(M.project(ledger,{one={{id="b",title="B",body="b",locationId="x",leads={},connections={{target="a",kind="link"}}},{id="a",title="A",body="a",locationId="x",leads={},connections={}}}})); assert(#reordered==1 and reordered[1].rows[1].id=="b" and #reordered[1].rows[1].links==1, "known row order and same-case links preserve")
assert(not M.project(ledger,{ghost={}}) and not M.project(ledger,{one={{id="x",title="x",body="x",locationId="x",leads={},connections={},target="raw"}}}), "unknown cases and raw fields reject")
print("PASS MultiCaseNotebook: learned-only grouping, isolation, namespaced IDs, and filtered links")
