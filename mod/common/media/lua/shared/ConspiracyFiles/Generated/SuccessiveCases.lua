-- Additive reader/stager for later generated cases.  The schema-1 `canonical`
-- root is deliberately retained byte-for-byte as the legacy first case.
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Generator=require("ConspiracyFiles/Generated/Generator")
-- MAX_CASES was a development-era number, not a budget one. Measured against
-- the generator on 2026-09-06, one validated session root costs 22.5-44.8 kB
-- (mean 29 kB) of the 500 kB canonical budget, so three cases used under a
-- tenth of it while silently ending automatic case progression forever.
-- Eight worst-case roots is ~358 kB, leaving room for the identity, key,
-- people, marker, address, ledger and visited-building roots. The combined
-- SaveBudget check still refuses a case that would not fit, so this is a
-- ceiling, not a promise. Unlimited cases need retirement of completed ones;
-- see docs/design/CASE_RETIREMENT.md.
local M={SCHEMA=1,MAX_CASES=8}
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,allowed) if type(t)~="table" then return false end for k in pairs(t) do if not allowed[k] then return false end end return true end
local function text(v) return type(v)=="string" and v~="" and #v<=160 end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
local function aggregateOK(a)
 if not fields(a,{schema=true,cases=true,discoveries=true}) or a.schema~=M.SCHEMA then return false,"invalid successive-case aggregate" end
 local ok,n=dense(a.cases,M.MAX_CASES-1); if not ok then return false,"invalid successive-case list" end
 local ids,docs,tokens={}, {},{}
 for i=1,n do
  local s=a.cases[i]; local valid,why=Session.validate(s); if not valid then return false,"successive case "..i..": "..tostring(why) end
  local id=s.case.caseId; if not text(id) or ids[id] then return false,"duplicate successive case ID" end; ids[id]=true
  for _,d in ipairs(s.case.documents) do if docs[d.id] then return false,"duplicate document ID" end; docs[d.id]=true; local token=s.assignments[d.id].physicalToken; if tokens[token] then return false,"duplicate physical token" end; tokens[token]=true end
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
 local ok,why=Session.validate(wrapper.canonical); if not ok then return false,"legacy canonical refused: "..tostring(why) end
 if wrapper.successive~=nil then local ok,why=aggregateOK(wrapper.successive); if not ok then return false,why end end
 local ids,docs,tokens={},{},{}
 for _,root in ipairs(M.sessions(wrapper) or {}) do
  local id=root.case.caseId; if ids[id] then return false,"duplicate case ID across generated roots" end; ids[id]=true
 for _,d in ipairs(root.case.documents) do if docs[d.id] then return false,"duplicate document ID across generated roots" end; docs[d.id]=true; local token=root.assignments[d.id].physicalToken; if tokens[token] then return false,"duplicate physical token across generated roots" end; tokens[token]=true end
 end
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
 for _,root in ipairs(roots) do if root.assignments[documentId] then return root end end
end
function M.discoveries(wrapper)
 if wrapper.successive then return copy(wrapper.successive.discoveries) end
 return copy(wrapper.canonical and wrapper.canonical.known or {})
end
function M.replace(wrapper,index,root)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end; ok,why=Session.validate(root); if not ok then return nil,why end
 local roots=M.sessions(wrapper); if not roots[index] then return nil,"unknown generated case" end
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
return M
