-- B1 offline coordinator. It only returns candidates; adapters own all writes.
local First=require("FirstClue")
local G=require("ConspiracyFiles/Generated/Generator")
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local V=require("ConspiracyFiles/Validator")
local Reach=require("ConspiracyFiles/Reach")
local Campaign=require("CampaignPolicy")
local Notebook=require("MultiCaseNotebook")
local Encounter=require("EncounterContext")
local Updates=require("InterpretationUpdates")
local Archive=require("EvidenceArchive")
local Bookmarks=require("ObjectBookmarks")
local F={MAX_BYTES=500000,SCHEMA=1}
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,a) if type(t)~="table" then return false end for k in pairs(t) do if not a[k] then return false end end return true end
local function text(v,n) return type(v)=="string" and v~="" and #v<=n end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
local function rootOK(state)
 local safe=V.validateStructure(state); if not safe or not fields(state,{schema=true,ledger=true,cases=true,known=true,encounters=true,updates=true,learned=true,relevance=true,bookmarks=true}) or state.schema~=F.SCHEMA then return false,"invalid flow root" end
 local ok,why=Campaign.validate(state.ledger); if not ok then return false,why end
 if type(state.cases)~="table" or type(state.known)~="table" or type(state.encounters)~="table" or type(state.updates)~="table" or type(state.learned)~="table" or type(state.relevance)~="table" then return false,"invalid case roots" end
 local bookmarksOK,bookmarksWhy=Bookmarks.validate(state.bookmarks); if not bookmarksOK then return false,bookmarksWhy end
 local records={}; for _,r in ipairs(state.ledger.records) do records[r.caseId]=r end
 for id,case in pairs(state.cases) do if not text(id,160) or not records[id] then return false,"case root does not match ledger" end local valid,err=G.validate(case); if not valid or case.caseId~=id then return false,err or "invalid generated case" end end
 for id,list in pairs(state.known) do
  if not text(id,160) or not records[id] or not state.cases[id] then return false,"known root does not match case" end
  local valid,n=dense(list,3); if not valid then return false,"invalid known documents" end
  local docs,seen={},{}; for _,d in ipairs(state.cases[id].documents) do docs[d.id]=true end
  for i=1,n do if not docs[list[i]] or seen[list[i]] then return false,"unknown or duplicate known document" end seen[list[i]]=true end
  local times=state.learned[id]; if type(times)~="table" then return false,"case lacks learned times" end local previous=-1; for i=1,n do local at=times[list[i]]; if type(at)~="number" or at~=at or at==math.huge or at==-math.huge or at<0 or at>1000000 or at<previous then return false,"invalid learned time" end previous=at end for docId in pairs(times) do if not seen[docId] then return false,"learned time lacks known document" end end
  local relevant=state.relevance[id]; if type(relevant)~="table" then return false,"case lacks relevance root" end
  local expected=Archive.rebuild(state.cases[id],list,times)
  for docId,at in pairs(expected) do if relevant[docId]~=at then return false,"relevance does not match known events" end end
  for docId in pairs(relevant) do if expected[docId]==nil then return false,"unknown relevance record" end end
 end
 for id,byDoc in pairs(state.encounters) do
  local case=state.cases[id]; if not text(id,160) or not case or type(byDoc)~="table" then return false,"encounter root does not match case" end
  local docs={}; for _,d in ipairs(case.documents) do docs[d.id]=true end
  for docId,context in pairs(byDoc) do if not text(docId,160) or not docs[docId] then return false,"encounter document does not match case" end local valid,why=Encounter.validate(context,case.locations[1].mapId); if not valid then return false,why end end
 end
 for id in pairs(state.cases) do if type(state.updates[id])~="table" then return false,"case lacks update root" end local valid,why=Updates.validate(state.updates[id],state.cases[id],state.known[id]); if not valid then return false,why end for relationId,event in pairs(state.updates[id]) do local relation=Updates.derive(state.cases[id],state.known[id])[relationId]; local expected=math.max(state.learned[id][relation.source],state.learned[id][relation.target]); if event.at~=expected then return false,"update timestamp does not match learned relation" end end end
 for id in pairs(state.cases) do if type(state.learned[id])~="table" then return false,"case lacks learned root" end end
 for id in pairs(state.cases) do if type(state.relevance[id])~="table" then return false,"case lacks relevance root" end end
 for _,collection in ipairs({state.learned,state.relevance}) do for id in pairs(collection) do if not state.cases[id] then return false,"foreign evidence timing root" end end end
 for id in pairs(state.updates) do if not state.cases[id] then return false,"update root does not match case" end end
 for id,r in pairs(records) do local case=state.cases[id]; if not case or not state.known[id] then return false,"ledger case lacks roots" end if case.locations[1].id~=r.siteIds[1] or case.locations[2].id~=r.siteIds[2] then return false,"ledger sites do not match case" end for _,site in ipairs(case.locations) do if not Reach.contains(site.bounds,r.anchor,r.radius) then return false,"saved case lies outside approved reach" end end end
 for id in pairs(state.cases) do if not state.known[id] then return false,"case lacks known root" end end
 return true
end
function F.validate(state) return rootOK(state) end
function F.new() return {schema=F.SCHEMA,ledger=Campaign.new(),cases={},known={},encounters={},updates={},learned={},relevance={},bookmarks={}} end
function F.begin(state,catalog,seed,context)
 local ok,why=rootOK(state); if not ok then return nil,why end
 local safe=V.validateStructure({catalog=catalog,context=context,seed=seed}); if not safe then return nil,"unsafe generation input" end
 local retained={}; for _,r in ipairs(state.ledger.records) do for _,id in ipairs(r.siteIds) do retained[id]=true end end
 local valid,err=Catalog.validate(catalog); if not valid then return nil,err end
 local filtered={revision=catalog.revision,locations={}}; for _,site in ipairs(catalog.locations) do if not retained[site.id] then filtered.locations[#filtered.locations+1]=site end end
 local proposal; proposal,why=First.select(filtered,context); if not proposal then return nil,why end
 local selected={proposal.introductorySite.id,proposal.partnerSite.id}; local case; case,err=G.generateSelected(filtered,seed,{mapId=context.mapId,buildLine=context.buildLine,allowSynthetic=context.allowSynthetic},selected); if not case then return nil,err end
 return {case=case,anchor=copy(proposal.anchor),radius=proposal.radius,siteIds=selected,allowSynthetic=context.allowSynthetic,freeze={anchor=copy(proposal.anchor),radius=proposal.radius,hoursSurvived=context.hoursSurvived}}
end
local function planOK(plan)
 local safe=V.validateStructure(plan); if not safe or not fields(plan,{case=true,anchor=true,radius=true,siteIds=true,allowSynthetic=true,freeze=true}) then return false,"invalid flow plan" end
 local valid,why=G.validate(plan.case); if not valid then return false,why end
 local a,n=dense(plan.siteIds,2); if not a or n~=2 or plan.siteIds[1]~=plan.case.locations[1].id or plan.siteIds[2]~=plan.case.locations[2].id then return false,"plan sites do not match generated case" end
 if type(plan.allowSynthetic)~="boolean" and plan.allowSynthetic~=nil then return false,"invalid synthetic flag" end
 if not fields(plan.anchor,{x=true,y=true}) or not Reach.validAnchor(plan.anchor) or type(plan.radius)~="number" then return false,"invalid plan anchor or radius" end
 if type(plan.freeze)~="table" or not fields(plan.freeze,{anchor=true,radius=true,hoursSurvived=true}) or not Reach.validAnchor(plan.freeze.anchor) or type(plan.freeze.radius)~="number" then return false,"plan freeze mismatch" end
 local radius=Reach.radius(plan.freeze.hoursSurvived); if not radius or radius~=plan.radius or plan.freeze.radius~=plan.radius or plan.anchor.x~=plan.freeze.anchor.x or plan.anchor.y~=plan.freeze.anchor.y then return false,"plan freeze mismatch" end return true
end
local function ready(readiness,sites)
 if type(readiness)~="table" or type(readiness.authorized)~="function" or type(readiness.snapshot)~="function" then return false end
 local called,authorized=pcall(readiness.authorized,readiness); if not called or authorized~=true then return false end
 local snapped,snap=pcall(readiness.snapshot,readiness); if not snapped or type(snap)~="table" or snap.committed or type(snap.sites)~="table" then return false end local count=0; for id,s in pairs(snap.sites) do if type(id)~="string" or type(s)~="table" then return false end count=count+1 end
 if count~=2 then return false end for _,id in ipairs(sites) do local s=snap.sites[id]; if not s or not s.loaded or s.status~="ready" or s.verifiedEpoch~=s.epoch then return false end end return true
end
local function peersOK(peers)
 if type(peers)~="table" or peers.flow~=nil or not V.validateStructure(peers) then return false,"explicit plain peers without reserved flow key required" end return true
end
local function budget(state,peers)
 local ok,why=peersOK(peers); if not ok then return false,why end local all=copy(peers); all.flow=state; return V.validateCombined(all,F.MAX_BYTES)
end
function F.commit(state,plan,readiness,config,request,peers,revalidate)
 local ok,why=rootOK(state); if not ok then return nil,why end; ok,why=planOK(plan); if not ok then return nil,why end
 ok,why=peersOK(peers); if not ok then return nil,why end
 if type(revalidate)~="function" then return nil,"synchronous revalidation callback required" end
 if not ready(readiness,plan.siteIds) then return nil,"current positive target verification required" end
 if not V.validateStructure(config) or not V.validateStructure(request) or type(request)~="table" or request.caseId~=plan.case.caseId or request.survivalHours~=plan.freeze.hoursSurvived or request.radius~=plan.radius or type(request.anchor)~="table" or request.anchor.x~=plan.anchor.x or request.anchor.y~=plan.anchor.y or type(request.siteIds)~="table" or request.siteIds[1]~=plan.siteIds[1] or request.siteIds[2]~=plan.siteIds[2] then return nil,"campaign record does not match generated case plan" end
 local candidate=copy(state); candidate.cases[plan.case.caseId]=copy(plan.case); candidate.known[plan.case.caseId]={}; candidate.encounters[plan.case.caseId]={}; candidate.updates[plan.case.caseId]={}; candidate.learned[plan.case.caseId]={}; candidate.relevance[plan.case.caseId]={}; local stagePeers=copy(peers); stagePeers.cases=candidate.cases; stagePeers.known=candidate.known; stagePeers.encounters=candidate.encounters; stagePeers.updates=candidate.updates; stagePeers.learned=candidate.learned; stagePeers.relevance=candidate.relevance
 local ledger; ledger,why=Campaign.stage(candidate.ledger,config,request,stagePeers); if not ledger then return nil,why end; candidate.ledger=ledger; ok,why=rootOK(candidate); if not ok then return nil,why end
 ok,why=budget(candidate,peers); if not ok then return nil,why end
 local called,result=pcall(revalidate,copy(candidate)); if not called or result~=true then return nil,"commit revalidation refused" end
 if not ready(readiness,plan.siteIds) then return nil,"current positive target verification required" end return candidate
end
function F.discover(state,caseId,docId,nowHours,peers)
 local ok,why=rootOK(state); if not ok then return nil,why end; if not text(caseId,160) or not text(docId,160) or not state.cases[caseId] then return nil,"unknown case or document" end
 if type(nowHours)~="number" or nowHours~=nowHours or nowHours==math.huge or nowHours==-math.huge or nowHours<0 or nowHours>1000000 then return nil,"invalid discovery time" end
 local next=copy(state); for _,event in pairs(next.updates[caseId]) do if nowHours<event.at then return nil,"discovery clock precedes saved event" end end; local known=next.known[caseId]; for _,id in ipairs(known) do if id==docId then ok,why=budget(next,peers); if not ok then return nil,why end return next end end local exists=false; for _,d in ipairs(next.cases[caseId].documents) do if d.id==docId then exists=true end end; if not exists then return nil,"unknown case or document" end
 if #known>=3 then return nil,"known-document limit reached" end; local prior={}; for _,id in ipairs(known) do prior[id]=true end; known[#known+1]=docId; next.learned[caseId][docId]=nowHours; next.updates[caseId]=next.updates[caseId] or {}; next.relevance[caseId]=next.relevance[caseId] or {}; next.relevance[caseId][docId]=nowHours; for _,oldId in ipairs(Archive.relevant(next.cases[caseId],known,docId)) do next.relevance[caseId][oldId]=nowHours end; local relations=Updates.derive(next.cases[caseId],known); for id,relation in pairs(relations) do if not next.updates[caseId][id] then local affected=relation.source==docId and relation.target or relation.target==docId and relation.source or nil; if affected and prior[affected] then next.updates[caseId][id]={at=nowHours,affected=affected} end end end; ok,why=rootOK(next); if not ok then return nil,why end; ok,why=budget(next,peers); if not ok then return nil,why end return next
end
function F.capture(state,caseId,docId,context,peers)
 local ok,why=rootOK(state); if not ok then return nil,why end
 if not text(caseId,160) or not text(docId,160) or not state.cases[caseId] then return nil,"unknown case or document" end
 local case=state.cases[caseId]; local exists=false; for _,doc in ipairs(case.documents) do if doc.id==docId then exists=true end end; if not exists then return nil,"unknown case or document" end
 for _,known in ipairs(state.known[caseId]) do if known==docId and not (state.encounters[caseId] and state.encounters[caseId][docId]) then return nil,"historical known document has no original encounter" end end
 ok,why=Encounter.validate(context,case.locations[1].mapId); if not ok then return nil,why end
 local next=copy(state); next.encounters[caseId]=next.encounters[caseId] or {}
 if next.encounters[caseId][docId] then ok,why=budget(next,peers); if not ok then return nil,why end return next end
 next.encounters[caseId][docId]=copy(context); ok,why=rootOK(next); if not ok then return nil,why end; ok,why=budget(next,peers); if not ok then return nil,why end return next
end
function F.markObject(state,input,peers)
 local ok,why=rootOK(state); if not ok then return nil,why end
 local next; next,why=Bookmarks.mark(state.bookmarks,input); if not next then return nil,why end
 local candidate=copy(state); candidate.bookmarks=next; ok,why=rootOK(candidate); if not ok then return nil,why end; ok,why=budget(candidate,peers); if not ok then return nil,why end; return candidate
end
function F.editObjectNote(state,intentId,note,peers)
 local ok,why=rootOK(state); if not ok then return nil,why end
 local next; next,why=Bookmarks.editNote(state.bookmarks,intentId,note); if not next then return nil,why end
 local candidate=copy(state); candidate.bookmarks=next; ok,why=rootOK(candidate); if not ok then return nil,why end; ok,why=budget(candidate,peers); if not ok then return nil,why end; return candidate
end
function F.restore(saved,peers,nowHours,ttlHours,archiveAgeHours)
 local ok,why=rootOK(saved); if not ok then return nil,why end; local clock,clockWhy=Updates.visible({},nowHours,ttlHours); if not clock then return nil,clockWhy end; ok,why=Archive.project({}, {},nowHours,archiveAgeHours); if not ok then return nil,why end; ok,why=budget(saved,peers); if not ok then return nil,why end; local state=copy(saved); local projections={}
 for _,bookmark in ipairs(state.bookmarks) do if nowHours<bookmark.markedHours then return nil,"restore clock precedes bookmark" end end
 for id,case in pairs(state.cases) do local rows,err=G.project(case,state.known[id]); if not rows then return nil,err end projections[id]=rows end
 local notebook; notebook,why=Notebook.project(state.ledger,projections); if not notebook then return nil,why end
 local group=1; for _,record in ipairs(state.ledger.records) do local rows=projections[record.caseId]; if rows and #rows>0 then local visible=notebook[group]; local active,err=Updates.visible(state.updates[record.caseId] or {},nowHours,ttlHours); if not active then return nil,err end; local ages=copy(state.learned[record.caseId]); for id,at in pairs(state.relevance[record.caseId]) do ages[id]=at end; local archived; archived,err=Archive.project(visible.rows,ages,nowHours,archiveAgeHours); if not archived then return nil,err end; visible.rows=archived; for i,row in ipairs(visible.rows) do row.context=Encounter.display(state.encounters[record.caseId] and state.encounters[record.caseId][rows[i].id]); for _,affected in pairs(active) do if affected==rows[i].id then row.updated=true end end end; group=group+1 end end
 if #state.bookmarks>0 then
  local rows={}; for i,record in ipairs(state.bookmarks) do rows[i]=Bookmarks.display(record) end
  notebook[#notebook+1]={name="Personal notes",rows=rows,personal=true}
 end
 return {state=state,notebook=notebook}
end
return F
