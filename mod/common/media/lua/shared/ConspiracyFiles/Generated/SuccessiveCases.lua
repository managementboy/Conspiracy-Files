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
local M={SCHEMA=1,MAX_CASES=10,MAX_ACTIVE=4}
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
 if Retired.isRetired(root) then for _,row in ipairs(root.rows) do out[#out+1]=row.id end return out end
 if type(root)=="table" and type(root.case)=="table" then for _,d in ipairs(root.case.documents) do out[#out+1]=d.id end end
 return out
end
-- Retired roots dropped their physical tokens with the rest of the placement
-- bookkeeping; nil here means "no token to collide", never "skip the check".
local function rootToken(root,id) if Retired.isRetired(root) then return nil end return root.assignments[id].physicalToken end
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
 local ordered=dense(a.discoveries,M.MAX_CASES*Generator.MAX_EVIDENCE); if not ordered then return false,"invalid global discovery order" end
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
function M.validate(wrapper)
 local safe=V.validateStructure(wrapper); if not safe or not fields(wrapper,{canonical=true,successive=true,schedule=true}) then return false,"unsupported generated wrapper" end
 if wrapper.canonical==nil then return false,"legacy canonical required" end
 local ok,why=rootValid(wrapper.canonical); if not ok then return false,"legacy canonical refused: "..tostring(why) end
 if wrapper.successive~=nil then local ok,why=aggregateOK(wrapper.successive); if not ok then return false,why end end
 local ids,docs,tokens,active={},{},{},0
 for _,root in ipairs(M.sessions(wrapper) or {}) do
  local id=rootCaseId(root); if ids[id] then return false,"duplicate case ID across generated roots" end; ids[id]=true
  if not Retired.isRetired(root) then active=active+1 end
  for _,did in ipairs(rootDocumentIds(root)) do
   if docs[did] then return false,"duplicate document ID across generated roots" end; docs[did]=true
   local token=rootToken(root,did); if token then if tokens[token] then return false,"duplicate physical token across generated roots" end; tokens[token]=true end
  end
 end
 -- Retirement is what makes a larger MAX_CASES affordable: only MAX_ACTIVE
 -- roots may be live (full-size) at once, the rest must already be retired.
 if active>M.MAX_ACTIVE then return false,"too many concurrently active generated cases" end
 if wrapper.schedule~=nil then
  if not fields(wrapper.schedule,{schema=true,createdHours=true}) or wrapper.schedule.schema~=1 or type(wrapper.schedule.createdHours)~="table" then return false,"invalid case schedule" end
  local n=0;for k in pairs(wrapper.schedule.createdHours) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false,"invalid case schedule" end;n=n+1 end
  if n~=#M.sessions(wrapper) then return false,"case schedule count mismatch" end
  local previous=nil;for i=1,n do local h=wrapper.schedule.createdHours[i];if type(h)~="number" or h~=h or h==math.huge or h==-math.huge or h<0 or (previous and h<previous) then return false,"invalid case schedule" end;previous=h end
 end
 local discoveries=M.discoveries(wrapper); local seen={}
 for _,id in ipairs(discoveries) do if not docs[id] or seen[id] then return false,"unknown or duplicate global discovery" end; seen[id]=true end
 local known={}
 for _,root in ipairs(M.sessions(wrapper)) do for _,id in ipairs(root.known) do if not seen[id] then return false,"session discovery missing from global order" end; known[id]=true end end
 for id in pairs(seen) do if not known[id] then return false,"global discovery is not known by its case" end end
 return true
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
function M.stage(wrapper,root,createdHours)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 ok,why=Session.validate(root); if not ok then return nil,why end
 if wrapper.schedule and (type(createdHours)~="number" or createdHours~=createdHours or createdHours==math.huge or createdHours==-math.huge or createdHours<0) then return nil,"valid created hours required" end
 if not wrapper.schedule and createdHours~=nil then return nil,"schedule absent" end
 local out={canonical=wrapper.canonical}; if wrapper.schedule then out.schedule=copy(wrapper.schedule);local prior=out.schedule.createdHours[#out.schedule.createdHours];if prior and createdHours<prior then return nil,"schedule cannot move backwards" end;out.schedule.createdHours[#out.schedule.createdHours+1]=createdHours end; local cases={}
 if wrapper.successive then for i,s in ipairs(wrapper.successive.cases) do cases[i]=copy(s) end end
 cases[#cases+1]=copy(root); out.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)}
 ok,why=M.validate(out); if not ok then return nil,why end
 return out
end
-- Retire a completed case in place: copy-on-write the whole wrapper, replace
-- only the root at `index` with RetiredCase.retire's smaller record, then
-- fully validate the replacement before it is ever handed back -- same
-- validate-then-swap discipline as every other canonical mutation, so there
-- is never an observable half-retired wrapper. Idempotent: retiring an
-- already-retired root is a recognised no-op, not an error and not a second
-- shrink.
function M.retire(wrapper,index)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end
 local roots=M.sessions(wrapper); local root=roots[index]; if not root then return nil,"unknown generated case" end
 if Retired.isRetired(root) then return wrapper,false end
 local retired,rwhy=Retired.retire(root); if not retired then return nil,rwhy end
 local out={canonical=index==1 and retired or wrapper.canonical}; if wrapper.schedule then out.schedule=copy(wrapper.schedule) end; local cases={}
 for i=2,#roots do cases[i-1]=copy(i==index and retired or roots[i]) end
 if #cases>0 or wrapper.successive then out.successive={schema=M.SCHEMA,cases=cases,discoveries=M.discoveries(wrapper)} end
 ok,why=M.validate(out); if not ok then return nil,why end
 return out,true
end
return M
