package.path="dev/next-phase/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local F=require("InvestigationFlow")
local R=require("LocationReadiness")
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function ready(ids)
 local r=assert(R.new(ids)); for _,id in ipairs(ids) do assert(r:observe({kind="loaded",siteId=id,epoch=1})); assert(r:observe({kind="verification",siteId=id,epoch=1,result="positive"})) end return r
end
local function request(plan,h,active)
 return {caseId=plan.case.caseId,createdHours=h,survivalHours=h,anchor={x=plan.anchor.x,y=plan.anchor.y},radius=plan.radius,siteIds={plan.siteIds[1],plan.siteIds[2]},activeIds=active or {},activeCount=#(active or {})}
end
local cfg={minGapHours=0,maxConcurrent=3,maxRetained=3}
local context={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",anchor={x=0,y=0},hoursSurvived=0,allowSynthetic=true}
local state=F.new(); assert(F.validate(state))
local mark={intentId="desk-key",title="Bent brass key",itemIdentity="key:brass:17",sourceContext={mapId="SYNTHETIC-MAP",x=7,y=8,z=0,sourceLabel="Found in a desk"},markedHours=1,note="Try later"}
local bookmarked=assert(F.markObject(state,mark,{})); local markedAgain=assert(F.markObject(bookmarked,{intentId="desk-key",title="Bent brass key",itemIdentity="key:brass:17",sourceContext={mapId="SYNTHETIC-MAP",x=7,y=8,z=0,sourceLabel="Found in a desk"},markedHours=1,note="must not replace"},{})); assert(markedAgain.bookmarks[1].note=="Try later")
assert(not F.markObject(bookmarked,{intentId="desk-key",title="Other",itemIdentity="key:brass:17",sourceContext={mapId="SYNTHETIC-MAP",x=7,y=8,z=0,sourceLabel="Found in a desk"},markedHours=1,note=""},{}))
bookmarked=assert(F.editObjectNote(bookmarked,"desk-key","Basement?",{})); assert(bookmarked.bookmarks[1].note=="Basement?" and bookmarked.bookmarks[1].markedHours==1)
mark.title="changed"; mark.sourceContext.x=99; assert(bookmarked.bookmarks[1].title=="Bent brass key" and bookmarked.bookmarks[1].sourceContext.x==7,"mark input copied")
local personal=assert(F.restore(bookmarked,{},1,24,24)); assert(#personal.notebook==1 and personal.notebook[1].name=="Personal notes" and personal.notebook[1].rows[1].type=="Marked object" and personal.notebook[1].rows[1].context=="Found in a desk" and not personal.notebook[1].rows[1].authoredDocument,"only explicit mark restores as private note")
personal.state.bookmarks[1].note="copy change"; assert(bookmarked.bookmarks[1].note=="Basement?","restore returns copies")
assert(not F.restore(bookmarked,{},0,24,24),"restore cannot precede bookmark")
local unknownBookmark=assert(F.markObject(F.new(),{intentId="unknown-source",title="Loose switch",itemIdentity="switch:42",sourceContext=nil,markedHours=0,note=""},{})); local unknownView=assert(F.restore(unknownBookmark,{},0,24,24)).notebook[1].rows[1]; assert(unknownView.context=="Location not recorded" and unknownView.itemIdentity==nil,"restore omits unavailable source and internal token")
assert(not F.markObject(bookmarked,{intentId="budget",title="t",itemIdentity="o",sourceContext={mapId="SYNTHETIC-MAP",x=0,y=0,z=0},markedHours=2,note=""},{peer=string.rep("x",500000)}) and #bookmarked.bookmarks==1,"bookmark shared budget is atomic")
local capped=F.new(); for i=1,64 do capped=assert(F.markObject(capped,{intentId="cap"..i,title="t",itemIdentity="o"..i,sourceContext={mapId="SYNTHETIC-MAP",x=i,y=0,z=0},markedHours=i,note=""},{})) end; assert(not F.markObject(capped,{intentId="cap-over",title="t",itemIdentity="o",sourceContext={mapId="SYNTHETIC-MAP",x=0,y=0,z=0},markedHours=1,note=""},{}) and #capped.bookmarks==64,"flow bookmark cap is atomic")
local p1=assert(F.begin(state,catalog(),17,context)); assert(p1.case.locations[1].id==p1.siteIds[1],"intro ordering must remain generated location one")
local r1=ready(p1.siteIds); state=assert(F.commit(state,p1,r1,cfg,request(p1,0),{},function() return true end)); assert(F.validate(state))
local p2=assert(F.begin(state,catalog(),18,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",anchor={x=1000,y=0},hoursSurvived=96,allowSynthetic=true})); assert(p2.siteIds[1]~=p1.siteIds[1] and p2.siteIds[1]~=p1.siteIds[2] and p2.siteIds[2]~=p1.siteIds[1] and p2.siteIds[2]~=p1.siteIds[2],"retained sites must be filtered before first clue")
local r2=ready(p2.siteIds); state=assert(F.commit(state,p2,r2,cfg,request(p2,96),{},function() return true end)); assert(F.validate(state))
local d1=state.cases[p1.case.caseId].documents[1].id; local d2=state.cases[p2.case.caseId].documents[2].id
local source={mapId="SYNTHETIC-MAP",x=10,y=20,z=0,foundHours=1,sourceLabel="Found in a desk"}
state=assert(F.capture(state,p1.case.caseId,d1,source,{})); assert(#(assert(F.restore(state,{},0,24,24)).notebook)==0,"pickup before inspection must not leak")
source.sourceLabel="changed after capture"; assert(state.encounters[p1.case.caseId][d1].sourceLabel=="Found in a desk","capture copies source facts")
local moved={mapId="SYNTHETIC-MAP",x=99,y=99,z=0,foundHours=2,sourceLabel="Moved later"}; state=assert(F.capture(state,p1.case.caseId,d1,moved,{})); assert(state.encounters[p1.case.caseId][d1].x==10,"first pickup source remains immutable")
state=assert(F.discover(state,p1.case.caseId,d1,1,{})); state=assert(F.discover(state,p2.case.caseId,d2,2,{})); local again=assert(F.discover(state,p1.case.caseId,d1,3,{})); assert(#again.known[p1.case.caseId]==1,"discover is idempotent")
assert(not F.discover(state,p1.case.caseId,"bad",4,{}) and not F.discover(state,"bad",d1,4,{}),"unknown document IDs reject")
local restored=assert(F.restore(state,{},3,24,24)); assert(#restored.notebook==2 and #restored.notebook[1].rows==1 and #restored.notebook[2].rows==1 and restored.notebook[1].rows[1].context=="Found in a desk","restore projects known source label without coordinates")
local hidden=F.new(); local empty=assert(F.commit(hidden,p1,ready(p1.siteIds),cfg,request(p1,0),{},function() return true end)); assert(#assert(F.restore(empty,{},0,24,24)).notebook==0,"empty known case omitted")
local stale=ready(p2.siteIds); assert(stale:observe({kind="unloaded",siteId=p2.siteIds[1]})); assert(not F.commit(F.new(),p2,stale,cfg,request(p2,0),{},function() return true end),"unloaded readiness refuses")
local base=F.new(); assert(not F.commit(base,p1,ready(p1.siteIds),cfg,request(p1,0),{},function() return false end)); assert(#base.ledger.records==0,"callback false is atomic")
assert(not F.commit(base,p1,ready(p1.siteIds),cfg,request(p1,0),{},function() error("no") end)); assert(#base.ledger.records==0,"callback error is atomic")
local changes=ready(p1.siteIds); assert(not F.commit(base,p1,changes,cfg,request(p1,0),{},function() changes:observe({kind="unloaded",siteId=p1.siteIds[1]}); return true end),"post-callback unload refuses")
assert(not F.commit(base,p1,ready(p1.siteIds),cfg,request(p1,0),{flow={}},function() return true end),"reserved flow peer rejects")
local huge={peer=string.rep("x",500000)}; assert(not F.commit(base,p1,ready(p1.siteIds),cfg,request(p1,0),huge,function() return true end)); assert(#base.ledger.records==0,"budget refusal is atomic")
assert(not F.discover(state,p1.case.caseId,d1,4,huge),"discover accounts for peer budget")
assert(not F.restore(state,huge,4,24,24),"restore accounts for peer budget")
local badfreeze={}; for k,v in pairs(p1) do badfreeze[k]=v end; badfreeze.freeze={anchor=nil,radius=p1.radius,hoursSurvived=0}; assert(not F.commit(F.new(),badfreeze,ready(p1.siteIds),cfg,request(p1,0),{},function() return true end),"malformed freeze rejects without throwing")
local mismatch={}; for k,v in pairs(p1) do mismatch[k]=v end; mismatch.freeze={anchor={x=p1.anchor.x,y=p1.anchor.y},radius=p1.radius,hoursSurvived=96}; assert(not F.commit(F.new(),mismatch,ready(p1.siteIds),cfg,request(p1,0),{},function() return true end),"frozen hours/radius mismatch rejects")
local throws={authorized=function() error("adapter") end,snapshot=function() return {} end}; assert(not F.commit(F.new(),p1,throws,cfg,request(p1,0),{},function() return true end),"readiness exceptions refuse")
local outside=assert(F.restore(state,{},3,24,24)).state; outside.ledger.records[1].anchor={x=99999,y=99999}; assert(not F.validate(outside),"saved cases cannot widen or reanchor beyond reach")
local historical=assert(F.commit(F.new(),p1,ready(p1.siteIds),cfg,request(p1,0),{},function() return true end)); historical=assert(F.discover(historical,p1.case.caseId,d1,1,{})); assert(assert(F.restore(historical,{},1,24,24)).notebook[1].rows[1].context=="Location not recorded","historical unknown source is not guessed")
assert(not F.capture(historical,p1.case.caseId,d1,{mapId="SYNTHETIC-MAP",x=1,y=1,z=0,foundHours=2,sourceLabel="Later pickup"},{}),"historical reloot cannot invent original source")
for _,bad in ipairs({{mapId="SYNTHETIC-MAP",x=0/0,y=1,z=0,foundHours=1},{mapId="SYNTHETIC-MAP",x=1,y=1,z=0,foundHours=1,extra=true},{mapId="WRONG",x=1,y=1,z=0,foundHours=1}}) do assert(not F.capture(state,p1.case.caseId,d1,bad,{}),"invalid capture context rejects") end
local cyclic={mapId="SYNTHETIC-MAP",x=1,y=1,z=0,foundHours=1}; cyclic.loop=cyclic; assert(not F.capture(state,p1.case.caseId,d1,cyclic,{}),"cyclic capture rejects")
assert(not F.capture(state,p2.case.caseId,d2,{mapId="SYNTHETIC-MAP",x=1,y=1,z=0,foundHours=1},huge),"capture accounts for shared budget")
local function updated(order)
 local s=assert(F.commit(F.new(),p1,ready(p1.siteIds),cfg,request(p1,0),{},function() return true end)); for i,n in ipairs(order) do s=assert(F.discover(s,p1.case.caseId,p1.case.documents[n].id,i,{})) end return s,assert(F.restore(s,{},#order,10,24)).notebook[1].rows
end
for _,order in ipairs({{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}}) do local s,rows=updated(order); assert(F.validate(s) and #rows==3,"all discovery orders retain generated bodies") end
local forward,rows=updated({1,2}); assert(rows[1].updated and not rows[2].updated,"old dispatch is updated when receipt becomes known")
local reverse,reverseRows=updated({2,1}); assert(reverseRows[1].updated and not reverseRows[2].updated,"old receipt is updated when dispatch becomes known")
local after=assert(F.restore(forward,{},2,10,24)); assert(after.notebook[1].rows[1].updated); assert(not assert(F.restore(forward,{},12,10,24)).notebook[1].rows[1].updated,"update expires at exact boundary")
assert(not assert(F.restore(forward,{},25,10,24)).notebook[1].rows[1].archived and assert(F.restore(forward,{},26,10,24)).notebook[1].rows[1].archived,"related evidence resurface resets archive age once")
assert(not F.restore(forward,{},0,10,24) and not F.discover(forward,p1.case.caseId,p1.case.documents[3].id,0/0,{}),"future and invalid clocks refuse")
local repeated=assert(F.discover(forward,p1.case.caseId,p1.case.documents[2].id,99,{})); for id,event in pairs(forward.updates[p1.case.caseId]) do assert(repeated.updates[p1.case.caseId][id].at==event.at and repeated.updates[p1.case.caseId][id].affected==event.affected,"repeat inspection does not extend update") end
local deleted=assert(F.restore(forward,{},3,24,24)).state; deleted.updates[p1.case.caseId]=nil; assert(not F.validate(deleted),"every case requires an update root")
local missingRelevant=assert(F.restore(forward,{},3,24,24)).state; missingRelevant.relevance[p1.case.caseId][p1.case.documents[1].id]=nil; assert(not F.validate(missingRelevant),"missing relevance rejects")
local tamperedRelevant=assert(F.restore(forward,{},3,24,24)).state; tamperedRelevant.relevance[p1.case.caseId][p1.case.documents[1].id]=100; assert(not F.validate(tamperedRelevant),"invented relevance rejects")
local foreignLearned=assert(F.restore(forward,{},3,24,24)).state; foreignLearned.learned.ghost={}; assert(not F.validate(foreignLearned),"foreign timing root rejects")
assert(not F.restore(F.new(),{},-1,1,1) and not F.restore(F.new(),{},0,1000001,1),"empty roots still require bounded archive/update clock")
assert(not F.discover(forward,p1.case.caseId,p1.case.documents[2].id,0,{}),"discovery clock cannot move backwards")
print("PASS InvestigationFlow: two-case ordering, bounded commit, readiness revalidation, discovery, restore, and aggregate budget")
