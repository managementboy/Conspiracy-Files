-- Additive reader/stager for later generated cases.  The schema-1 `canonical`
-- root is deliberately retained byte-for-byte as the legacy first case.
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Generator=require("ConspiracyFiles/Generated/Generator")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
-- MAX_CASES was a development-era number, not a budget one. Measured against
-- the generator on 2026-09-06, one validated session root costs 22.5-44.8 kB
-- (mean 29 kB) of the 500 kB canonical budget, so three cases used under a
-- tenth of it while silently ending automatic case progression forever. It
-- went to eight, still a ceiling: docs/design/CASE_RETIREMENT.md.
--
-- Case retirement (2026-09-07) replaces a fully-discovered root's assignments,
-- physical targets and now-redundant case envelope with just its discovered
-- rows -- see RetiredCase.lua. Measured over 300 synthetic seeds, that costs
-- 31.9 kB worst case against 45.6 kB for a live root (~30% smaller; body text
-- the player already read is immutable and stays, so this is not free).
-- Retirement alone does not bound total bytes -- nothing forces a case to
-- retire -- so MAX_ACTIVE bounds how many roots may be simultaneously live
-- (undiscovered/un-retired) at once, and MAX_CASES is re-derived from that
-- plus retired-root cost in test/case_budget_headroom.lua:
--   MAX_ACTIVE(2) x 45.6kB + (MAX_CASES-MAX_ACTIVE)(8) x 31.9kB = 346.3kB
-- comfortably under the 380kB left after the 120kB reserved for every other
-- canonical root. MAX_ACTIVE=2 keeps today's two-concurrent-case tests
-- (successive_cases.lua, g2_smoke.lua) passing unchanged.
-- MAX_ACTIVE was 2, which broke automatic progression: test/automatic_
-- investigations expects a third concurrent case, and a full active set made
-- preparation error and disable itself after three failures. Four preserves
-- documented behaviour with headroom and still fits the budget:
--   4 x 45.6kB live + 6 x 31.9kB retired = 373.8kB <= 380kB available.
-- The archive (P4-R111, built 2026-09-17): a finished case no longer counts
-- against the number of cases a save may still make. Three tiers now share the
-- store, and only the first two cost a case's worth of bytes:
--   live      (Session, schema 1)      -- at most MAX_ACTIVE at once
--   archived  (RetiredCase, schema 2)  -- at most MAX_FULL_ARCHIVED, the most
--                                         recently finished; keeps every row
--                                         FILES renders (P4-R118, P4-R104)
--   archived, bulk dropped (schema 3)  -- older than that: ids, questions and
--                                         answers only (RetiredCase.shrink)
-- MAX_CASES is now the whole store's cap, not a ceiling on unfinished cases.
-- Measured over 1,000 seeds (test/case_archive.lua), worst case per root:
--   live 42,024   archived 33,135   archived with bulk dropped 3,130
-- and the discovery ledger costs about 545 bytes for every document ever
-- found, whatever tier its case is in. So the whole save, worst case:
--   ten cases, as the old cap allowed  campaign 371,264 + ledger 38,169 = 482,433
--   sixteen cases with this archive    campaign 338,540 + ledger 60,975 = 472,515
-- both including 73,000 reserved for every other canonical root (the 120,000
-- the old claim reserved, less the ledger it hid inside that figure). Sixteen
-- cases therefore leave MORE headroom than ten did (27,485 against 17,567):
-- trading two full-size archived cases for eight stubs buys six more cases.
-- MAX_FULL_ARCHIVED is the one number to move if the owner wants a longer
-- campaign: each full-size archived case costs about eight stubbed ones.
-- LEGACY_MAX_CASES grandfathers a save written before the archive: it may hold
-- up to ten full-size roots, which is what the old cap allowed and still fits.
local M={SCHEMA=1,MAX_CASES=16,MAX_ACTIVE=4,MAX_FULL_ARCHIVED=4,LEGACY_MAX_CASES=10}
-- HONEST REFUSALS (P4-R133, docs/design/CASE_PACING.md). The closed set of
-- reasons a new case did not come. It lives here, in the domain module,
-- because the debt a refusal leaves behind is stored in the case store's own
-- `schedule` slot and must be validated before it is ever written - a count
-- and a rung that reset on every reload would make the ladder unreachable for
-- a player who saves and loads in the same crowded house.
--   no-reach       nothing eligible within the survivor's reach
--   no-containers  no two loaded sites could supply a clue each
--   cap            the store's own case cap (MAX_CASES) is reached
--   active-limit   MAX_ACTIVE unfinished cases already
--   cooldown       a refusal is still standing (P4-R125's wait)
--   disabled       generation is off, or gave up after repeated failures
--   busy           a case is being prepared or placed right now
--   gap            the ordinary wait between cases has not passed yet
--                  (AutomaticInvestigations.config.minGapHours, and the extra
--                  hour after a case finished, P4-R121)
--
-- `gap` was added on 2026-09-18, and it is the only code added since the set
-- was closed. The five silent early returns in AutomaticInvestigations.poll
-- needed codes (P4-R133's honesty stopped at the generator's door: the poller
-- never reached it), and four of them had one already - cap, active-limit,
-- disabled and busy. The ordinary wait between cases had none: `cooldown` is
-- P4-R125's "move on fifty tiles" wait, whose promise is half an hour, and
-- reusing it would have told a reader a case was due in half an hour when it
-- was twenty-three hours away - and the long campaign check fails on a broken
-- promise. Like cooldown and busy it is never counted, because it is our own
-- pacing rather than the world failing to supply a case.
M.DEFER_CODES={["no-reach"]=true,["no-containers"]=true,cap=true,["active-limit"]=true,
 cooldown=true,disabled=true,busy=true,gap=true}
-- The ladder: after this many refusals of the SAME code the generator lowers
-- its own standard by one rung. MAX_RUNG is the highest rung the code can
-- actually take (see docs/design/CASE_PACING.md on the fourth rung).
M.REFUSALS_PER_RUNG=3
M.MAX_RUNG=3
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,allowed) if type(t)~="table" then return false end for k in pairs(t) do if not allowed[k] then return false end end return true end
local function text(v) return type(v)=="string" and v~="" and #v<=160 end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
-- One root can be a live Session (schema 1) or a retired case (schema 2).
-- These helpers let every reader/validator treat both uniformly instead of
-- guessing at shape, without ever mutating either kind.
local function rootValid(root) if Retired.isRetired(root) then return Retired.validate(root) end return Session.validate(root) end
local function rootCaseId(root) if Retired.isRetired(root) then return root.caseId end return type(root)=="table" and type(root.case)=="table" and root.case.caseId end
local function rootDocumentIds(root)
 local out={}
 -- A deep-archived case kept no rows; its `known` list IS its document list
 -- (a case only archives fully discovered), so the ledger's references and the
 -- duplicate-id checks still see every document it ever placed.
 if Retired.isStub(root) then for _,id in ipairs(root.known) do out[#out+1]=id end return out end
 if Retired.isRetired(root) then for _,row in ipairs(root.rows) do out[#out+1]=row.id end return out end
 if type(root)=="table" and type(root.case)=="table" then for _,d in ipairs(root.case.documents) do out[#out+1]=d.id end end
 return out
end
-- Retired roots dropped their physical tokens with the rest of the placement
-- bookkeeping; nil here means "no token to collide", never "skip the check".
local function rootToken(root,id) if Retired.isRetired(root) then return nil end return root.assignments[id].physicalToken end
-- Keep the archive inside the budget (P4-R111): when more finished cases carry
-- their rows than MAX_FULL_ARCHIVED, the OLDEST of them - lowest index, which
-- is oldest because cases are only ever appended - loses its bulk. Called on a
-- freshly built copy inside retire/stage, before that copy is validated, so
-- compaction is part of the same validate-then-swap as the change that caused
-- it and the store is never observably over the cap. Positions never move: a
-- case is replaced in place by its stub, so every stored index, the schedule
-- and the discovery order all still mean what they meant.
local function compactArchive(out)
 local roots={out.canonical}
 if out.successive and out.successive.cases then for _,s in ipairs(out.successive.cases) do roots[#roots+1]=s end end
 local full={}
 for i,root in ipairs(roots) do if Retired.isRetired(root) and not Retired.isStub(root) then full[#full+1]=i end end
 for k=1,#full-M.MAX_FULL_ARCHIVED do
  local index=full[k]
  local stub=Retired.shrink(roots[index])
  -- A case that will not shrink stays as it is: the archive costing more than
  -- planned is survivable, a refused save is not.
  if stub then
   if index==1 then out.canonical=stub else out.successive.cases[index-1]=stub end
  end
 end
 return out
end
local function aggregateOK(a)
 if not fields(a,{schema=true,cases=true,discoveries=true}) or a.schema~=M.SCHEMA then return false,"invalid successive-case aggregate" end
 local ok,n=dense(a.cases,M.MAX_CASES-1); if not ok then return false,"invalid successive-case list" end
 local ids,docs,tokens={}, {},{}
 for i=1,n do
  local s=a.cases[i]; local valid,why=rootValid(s); if not valid then return false,"successive case "..i..": "..tostring(why) end
  local id=rootCaseId(s); if not text(id) or ids[id] then return false,"duplicate successive case ID" end; ids[id]=true
  for _,did in ipairs(rootDocumentIds(s)) do
   if docs[did] then return false,"duplicate document ID" end; docs[did]=true
   local token=rootToken(s,did); if token then if tokens[token] then return false,"duplicate physical token" end; tokens[token]=true end
  end
 end
 -- One clue per case beyond its story clues: the relay memo of the first case
 -- (P4-R96), or the radio transcript of a case steered to "Listen for it" (P4-R123).
 local ordered=dense(a.discoveries,M.MAX_CASES*(Generator.MAX_EVIDENCE+1)); if not ordered then return false,"invalid global discovery order" end
 return true
end
-- Global store compatibility: legacy canonical is fallback only.  Once a
-- campaign exists it is the single active replacement field.
function M.current(store)
 if type(store)~="table" then return nil,"generated store missing" end
 for k in pairs(store) do if k~="canonical" and k~="campaign" then return nil,"unsupported generated store field" end end
 if store.campaign~=nil then local ok,why=M.validate(store.campaign);if not ok then return nil,why end;return store.campaign end
 if store.canonical~=nil then local w={canonical=store.canonical};local ok,why=M.validate(w);if not ok then return nil,why end;return w end
 return nil,"no generated case"
end
-- Validation re-derives every case from its seed: about 20 ms on the Linux
-- test laptop. The map markers called M.current several times per rendered
-- frame and once a second in play - a 20 ms stall each time (Linux perf check,
-- 2026-09-11). Hot paths use this instead: it revalidates only when the stored
-- tables change (every write replaces them) or when the last validation is
-- older than ten minutes, as a backstop (only swap() writes the store). `now` is the caller's clock in ms, so
-- this module stays engine-free.
local memo={}
M.CACHE_MS=600000
function M.currentCached(store,now)
 if type(store)~="table" then return nil,"generated store missing" end
 if memo.store==store and memo.campaign==store.campaign and memo.canonical==store.canonical
  and type(now)=="number" and memo.at and now-memo.at<M.CACHE_MS and now>=memo.at then
  return memo.wrapper,memo.why
 end
 local wrapper,why=M.current(store)
 memo={store=store,campaign=store.campaign,canonical=store.canonical,at=now,wrapper=wrapper,why=why}
 return wrapper,why
end
-- A writer that has just validated what it stores says so, and the next
-- cached read does not validate the same tables again (22 ms after each write).
function M.remember(store,now)
 if type(store)~="table" then return end
 memo={store=store,campaign=store.campaign,canonical=store.canonical,at=now,
  wrapper=store.campaign or (store.canonical and {canonical=store.canonical}),why=nil}
end
function M.validate(wrapper)
 local safe=V.validateStructure(wrapper); if not safe or not fields(wrapper,{canonical=true,successive=true,schedule=true}) then return false,"unsupported generated wrapper" end
 if wrapper.canonical==nil then return false,"legacy canonical required" end
 local ok,why=rootValid(wrapper.canonical); if not ok then return false,"legacy canonical refused: "..tostring(why) end
 if wrapper.successive~=nil then local ok,why=aggregateOK(wrapper.successive); if not ok then return false,why end end
 local ids,docs,tokens,active={},{},{},0
 local full,roots=0,M.sessions(wrapper) or {}
 for _,root in ipairs(roots) do
  local id=rootCaseId(root); if ids[id] then return false,"duplicate case ID across generated roots" end; ids[id]=true
  if not Retired.isRetired(root) then active=active+1 elseif not Retired.isStub(root) then full=full+1 end
  for _,did in ipairs(rootDocumentIds(root)) do
   if docs[did] then return false,"duplicate document ID across generated roots" end; docs[did]=true
   local token=rootToken(root,did); if token then if tokens[token] then return false,"duplicate physical token across generated roots" end; tokens[token]=true end
  end
 end
 -- Retirement is what makes a larger MAX_CASES affordable: only MAX_ACTIVE
 -- roots may be live (full-size) at once, the rest must already be retired.
 if active>M.MAX_ACTIVE then return false,"too many concurrently active generated cases" end
 -- And the archive is what makes the store cap affordable (P4-R111): past the
 -- ten roots the old cap allowed, only MAX_FULL_ARCHIVED finished cases may
 -- still carry their rows. A save written before the archive is not refused
 -- for keeping what it was allowed to keep - it is compacted by the next
 -- retirement or the next staged case, not on load.
 if full>M.MAX_FULL_ARCHIVED and #roots>M.LEGACY_MAX_CASES then return false,"too many full-size archived cases" end
 if wrapper.schedule~=nil then
  if not fields(wrapper.schedule,{schema=true,createdHours=true,defer=true}) or wrapper.schedule.schema~=1 or type(wrapper.schedule.createdHours)~="table" then return false,"invalid case schedule" end
  local n=0;for k in pairs(wrapper.schedule.createdHours) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false,"invalid case schedule" end;n=n+1 end
  if n~=#M.sessions(wrapper) then return false,"case schedule count mismatch" end
  local previous=nil;for i=1,n do local h=wrapper.schedule.createdHours[i];if type(h)~="number" or h~=h or h==math.huge or h==-math.huge or h<0 or (previous and h<previous) then return false,"invalid case schedule" end;previous=h end
  -- The debt a refusal left behind (P4-R133). Optional, like the schedule
  -- itself, so a save written before it loads unchanged; every field is
  -- checked, because a hand-edited count or rung would silently lower the
  -- generator's standard.
  local d=wrapper.schedule.defer
  if d~=nil then
   if not fields(d,{code=true,count=true,sinceHours=true,dueHours=true,rung=true}) then return false,"invalid case defer record" end
   if not M.DEFER_CODES[d.code] then return false,"invalid case defer record" end
   if type(d.count)~="number" or d.count~=math.floor(d.count) or d.count<1 or d.count>1000000 then return false,"invalid case defer record" end
   if type(d.rung)~="number" or d.rung~=math.floor(d.rung) or d.rung<0 or d.rung>M.MAX_RUNG then return false,"invalid case defer record" end
   for _,k in ipairs({"sinceHours","dueHours"}) do
    local h=d[k]
    if type(h)~="number" or h~=h or h==math.huge or h==-math.huge or h<0 then return false,"invalid case defer record" end
   end
  end
 end
 local discoveries=M.discoveries(wrapper); local seen={}
 for _,id in ipairs(discoveries) do if not docs[id] or seen[id] then return false,"unknown or duplicate global discovery" end; seen[id]=true end
 local known={}
 for _,root in ipairs(M.sessions(wrapper)) do for _,id in ipairs(root.known) do if not seen[id] then return false,"session discovery missing from global order" end; known[id]=true end end
 for id in pairs(seen) do if not known[id] then return false,"global discovery is not known by its case" end end
 return true
end
-- What a refusal left owed, or nil when nothing is (P4-R133). A copy: a reader
-- must not be able to change a save by editing what it was handed.
function M.defer(wrapper)
 local s=type(wrapper)=="table" and wrapper.schedule
 local d=s and s.defer
 if not d then return nil end
 return copy(d)
end
-- Record (or, with nil, clear) that debt, copy-on-write like every other
-- canonical change. A case arrived means nothing is owed, so the caller clears
-- it in the same swap that stages the case. Refused when the store has no
-- schedule at all: a legacy single-case save has nowhere to keep it, and the
-- runtime then carries the debt in memory only, as it did before.
function M.setDefer(wrapper,record)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 if not wrapper.schedule then return nil,"schedule absent" end
 local out={canonical=wrapper.canonical,schedule=copy(wrapper.schedule)}
 if wrapper.successive then out.successive=copy(wrapper.successive) end
 if record==nil then out.schedule.defer=nil
 elseif type(record)~="table" then return nil,"invalid defer record"
 else
  out.schedule.defer={code=record.code,count=record.count,
   sinceHours=record.sinceHours,dueHours=record.dueHours,rung=record.rung}
 end
 ok,why=M.validate(out); if not ok then return nil,why end
 return out
end
-- Everything a reshuffle would have to clean up, captured BEFORE the store is
-- replaced: once the wrapper is swapped this list cannot be recovered from
-- anywhere, and the clues are already lying in drawers around Muldraugh.
--
-- Owner, 2026-09-12: every change to case rules costs a fresh game, several
-- times a day. A reshuffle builds new cases in the save the player is already
-- standing in; the world still holds the old documents, the map still holds
-- their marks, and both are keyed by the ids returned here.
--
-- Retired roots are included: their documents were placed in the world too.
-- A retired root keeps no assignments, so it contributes ids and no tokens.
function M.abandon(wrapper)
 local roots=M.sessions(wrapper); if not roots then return nil,"generated wrapper missing" end
 local out={documentIds={},physicalTokens={},caseIds={}}
 for _,root in ipairs(roots) do
  local caseId=rootCaseId(root)
  if caseId then out.caseIds[#out.caseIds+1]=caseId end
  for _,id in ipairs(rootDocumentIds(root) or {}) do
   out.documentIds[#out.documentIds+1]=id
   local token=rootToken(root,id)
   if token then out.physicalTokens[#out.physicalTokens+1]=token end
  end
 end
 return out
end
function M.sessions(wrapper)
 if type(wrapper)~="table" then return nil,"generated wrapper missing" end
 local out={}; if wrapper.canonical then out[#out+1]=wrapper.canonical end
 if wrapper.successive and wrapper.successive.cases then for _,root in ipairs(wrapper.successive.cases) do out[#out+1]=root end end
 return out
end
function M.find(wrapper,documentId)
 local roots=M.sessions(wrapper); if not roots then return nil end
 for _,root in ipairs(roots) do if root.assignments and root.assignments[documentId] then return root end end
end
function M.discoveries(wrapper)
 if wrapper.successive then return copy(wrapper.successive.discoveries) end
 return copy(wrapper.canonical and wrapper.canonical.known or {})
end
function M.replace(wrapper,index,root)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end; ok,why=Session.validate(root); if not ok then return nil,why end
 local roots=M.sessions(wrapper); if not roots[index] then return nil,"unknown generated case" end
 if Retired.isRetired(roots[index]) then return nil,"case already retired" end
 local out={canonical=index==1 and copy(root) or wrapper.canonical}; if wrapper.schedule then out.schedule=copy(wrapper.schedule) end; local cases={}
 for i=2,#roots do cases[i-1]=copy(i==index and root or roots[i]) end
 local discoveries=M.discoveries(wrapper); local seen={}; for _,id in ipairs(discoveries) do seen[id]=true end
 for _,id in ipairs(root.known) do if not seen[id] then discoveries[#discoveries+1]=id;seen[id]=true end end
 if #cases>0 or wrapper.successive then out.successive={schema=M.SCHEMA,cases=cases,discoveries=discoveries} end
 ok,why=M.validate(out); if not ok then return nil,why end; return out
end
-- Staging never mutates or reconstructs `canonical`; only a new companion
-- aggregate is added/replaced after full validation by the caller.
-- `usedIndex` ("What do I make of it?", P4-R113): when the new case was built
-- from a finished case's answers, those answers are marked used by it IN THE
-- SAME SWAP, so there is never a moment where a case exists built from
-- answers that could still be changed.
function M.stage(wrapper,root,createdHours,usedIndex)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 ok,why=Session.validate(root); if not ok then return nil,why end
 if wrapper.schedule and (type(createdHours)~="number" or createdHours~=createdHours or createdHours==math.huge or createdHours==-math.huge or createdHours<0) then return nil,"valid created hours required" end
 if not wrapper.schedule and createdHours~=nil then return nil,"schedule absent" end
 local source
 if usedIndex~=nil then
  source=M.sessions(wrapper)[usedIndex]
  if not Retired.isRetired(source) or not source.answers or source.answers.usedBy
   or not root.case.steer or root.case.steer.fromCase~=source.caseId then return nil,"steer source does not match" end
 end
 local out={canonical=wrapper.canonical}; if wrapper.schedule then out.schedule=copy(wrapper.schedule);local prior=out.schedule.createdHours[#out.schedule.createdHours];if prior and createdHours<prior then return nil,"schedule cannot move backwards" end;out.schedule.createdHours[#out.schedule.createdHours+1]=createdHours end; local cases={}
 if wrapper.successive then for i,s in ipairs(wrapper.successive.cases) do cases[i]=copy(s) end end
 if usedIndex==1 then out.canonical=copy(wrapper.canonical); out.canonical.answers.usedBy=root.case.caseId
 elseif usedIndex then cases[usedIndex-1].answers.usedBy=root.case.caseId end
 cases[#cases+1]=copy(root); out.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)}
 compactArchive(out)
 ok,why=M.validate(out); if not ok then return nil,why end
 return out
end
-- Retire a completed case in place: copy-on-write the whole wrapper, replace
-- only the root at `index` with RetiredCase.retire's smaller record, then
-- fully validate the replacement before it is ever handed back -- same
-- validate-then-swap discipline as every other canonical mutation, so there
-- is never an observable half-retired wrapper. Idempotent: retiring an
-- already-retired root is a recognised no-op, not an error and not a second
-- shrink. `lastSeen` (document id -> words) is where the runtime last saw
-- each clue; it is kept on the retired rows (P4-R104).
function M.retire(wrapper,index,lastSeen,completedHours)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 local roots=M.sessions(wrapper); local root=roots[index]; if not root then return nil,"unknown generated case" end
 if Retired.isRetired(root) then return wrapper,false end
 local retired,rwhy=Retired.retire(root,lastSeen,completedHours); if not retired then return nil,rwhy end
 local out={canonical=index==1 and retired or wrapper.canonical}; if wrapper.schedule then out.schedule=copy(wrapper.schedule) end; local cases={}
 for i=2,#roots do cases[i-1]=copy(i==index and retired or roots[i]) end
 if #cases>0 or wrapper.successive then out.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)} end
 compactArchive(out)
 ok,why=M.validate(out); if not ok then return nil,why end
 return out,true
end
-- Where a finished case's evidence was last seen, updated copy-on-write.
-- Owner, 2026-09-14: "I lost my files somewhere?" - a completed case had
-- dropped every placement detail. `updates` maps document id -> words; only
-- retired rows are touched (a live document has its own scan), unchanged or
-- unusable text is ignored, and nothing is returned changed unless a row
-- really changed. Same validate-then-swap discipline as retire.
function M.noteLastSeen(wrapper,updates)
 if type(updates)~="table" then return wrapper,false end
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 local roots=M.sessions(wrapper); local changed=false; local out={}
 for index,root in ipairs(roots) do
  local next=root
  -- A deep-archived case has no rows to write a last-seen line onto: its
  -- evidence is still marked in the world, the record just no longer has a
  -- line to put it on.
  if Retired.isRetired(root) and root.rows then
   for r,row in ipairs(root.rows) do
    local words=Retired.cleanLastSeen(updates[row.id])
    if words and words~=row.lastSeen then
     if next==root then next=copy(root) end
     next.rows[r].lastSeen=words; changed=true
    end
   end
  end
  out[index]=next
 end
 if not changed then return wrapper,false end
 local w={canonical=out[1]}; if wrapper.schedule then w.schedule=copy(wrapper.schedule) end; local cases={}
 for i=2,#out do cases[i-1]=copy(out[i]) end
 if #cases>0 or wrapper.successive then w.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)} end
 ok,why=M.validate(w); if not ok then return nil,why end
 return w,true
end
-- The answers that will steer the next case (P4-R113, P4-R121): of the finished
-- cases whose answers no case has used yet, the most recently changed. "I can't
-- tell" and "nobody, really" steer nothing. Returns the steer and the index of
-- the case it came from, or nil when nothing is answered.
function M.pendingSteer(wrapper)
 local G=require("ConspiracyFiles/Generated/Generator")
 local best,bestHours,bestIndex
 for i,root in ipairs(M.sessions(wrapper) or {}) do
  local a=Retired.isRetired(root) and root.offered and root.answers
  if a and not a.usedBy then
   local s={fromCase=root.caseId,way=a.way}
   if a.reading=="one" or a.reading=="two" then s.reading=a.reading end
   if a.matters=="person1" then s.person=root.offered.people[1]
   elseif a.matters=="person2" then s.person=root.offered.people[2]
   elseif a.matters=="organisation" then s.organisation=root.offered.organisation end
   local steer=G.steerFrom(s)
   -- A name the generator would not take (an unusual organisation name) costs
   -- only that part of the steer, not the survivor's other answers.
   if not steer and (s.person or s.organisation) then s.person,s.organisation=nil,nil; steer=G.steerFrom(s) end
   local hours=a.changedHours or 0
   if steer and (not best or hours>=bestHours) then best,bestHours,bestIndex=steer,hours,i end
  end
 end
 if best then return best,bestIndex end
 return nil
end
-- The survivor answers, changes or clears the questions about a finished case,
-- copy-on-write like every other change. Refused once a case has been built
-- from the answers. An empty answer set clears them.
local ANSWER_KEYS={"reading","matters","way"}
function M.setAnswers(wrapper,index,answers,hours)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 if type(answers)~="table" then return nil,"invalid answers" end
 local roots=M.sessions(wrapper); local root=roots[index]
 if not Retired.isRetired(root) or not root.offered then return nil,"no finished case to answer about" end
 if root.answers and root.answers.usedBy then return nil,"these answers already shaped a case" end
 local next=copy(root); local a={}; local any=false
 for _,k in ipairs(ANSWER_KEYS) do if answers[k]~=nil then a[k]=answers[k]; any=true end end
 if any then a.changedHours=hours; next.answers=a else next.answers=nil end
 local w={canonical=index==1 and next or wrapper.canonical}; if wrapper.schedule then w.schedule=copy(wrapper.schedule) end; local cases={}
 for i=2,#roots do cases[i-1]=copy(i==index and next or roots[i]) end
 if #cases>0 or wrapper.successive then w.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)} end
 ok,why=M.validate(w); if not ok then return nil,why end
 return w
end
return M
