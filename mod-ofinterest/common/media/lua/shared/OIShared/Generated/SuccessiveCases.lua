-- The reader and validator of the No Help case store: one `canonical` world
-- record (Generated/Session over an AreaCase), with the successive-case
-- aggregate still read so the store's shape is unchanged.
local V=require("OIShared/Validator")
local Session=require("OIShared/Generated/Session")
local M={SCHEMA=1,MAX_CASES=16}
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,allowed) if type(t)~="table" then return false end for k in pairs(t) do if not allowed[k] then return false end end return true end
local function text(v) return type(v)=="string" and v~="" and #v<=160 end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
local function rootCaseId(root) return type(root)=="table" and type(root.case)=="table" and root.case.caseId end
local function rootDocumentIds(root)
 local out={}
 if type(root)=="table" and type(root.case)=="table" then for _,d in ipairs(root.case.documents) do out[#out+1]=d.id end end
 return out
end
local function rootToken(root,id) return root.assignments[id].physicalToken end
local function aggregateOK(a)
 if not fields(a,{schema=true,cases=true,discoveries=true}) or a.schema~=M.SCHEMA then return false,"invalid successive-case aggregate" end
 local ok,n=dense(a.cases,M.MAX_CASES-1); if not ok then return false,"invalid successive-case list" end
 local ids,docs,tokens={}, {},{}
 for i=1,n do
  local s=a.cases[i]; local valid,why=Session.validate(s); if not valid then return false,"successive case "..i..": "..tostring(why) end
  local id=rootCaseId(s); if not text(id) or ids[id] then return false,"duplicate successive case ID" end; ids[id]=true
  for _,did in ipairs(rootDocumentIds(s)) do
   if docs[did] then return false,"duplicate document ID" end; docs[did]=true
   local token=rootToken(s,did); if token then if tokens[token] then return false,"duplicate physical token" end; tokens[token]=true end
  end
 end
 -- No maximum on the number of discoveries (owner, 2026-09-27).
 local ordered=dense(a.discoveries,math.huge); if not ordered then return false,"invalid global discovery order" end
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
 local safe=V.validateStructure(wrapper); if not safe or not fields(wrapper,{canonical=true,successive=true}) then return false,"unsupported generated wrapper" end
 if wrapper.canonical==nil then return false,"legacy canonical required" end
 local ok,why=Session.validate(wrapper.canonical); if not ok then return false,"legacy canonical refused: "..tostring(why) end
 if wrapper.successive~=nil then local ok,why=aggregateOK(wrapper.successive); if not ok then return false,why end end
 local ids,docs,tokens={},{},{}
 for _,root in ipairs(M.sessions(wrapper) or {}) do
  local id=rootCaseId(root); if ids[id] then return false,"duplicate case ID across generated roots" end; ids[id]=true
  for _,did in ipairs(rootDocumentIds(root)) do
   if docs[did] then return false,"duplicate document ID across generated roots" end; docs[did]=true
   local token=rootToken(root,did); if token then if tokens[token] then return false,"duplicate physical token across generated roots" end; tokens[token]=true end
  end
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
  for _,root in ipairs(roots) do
   if root.assignments and root.assignments[documentId] then return root end
  end
end
function M.discoveries(wrapper)
 if wrapper.successive then return copy(wrapper.successive.discoveries) end
 return copy(wrapper.canonical and wrapper.canonical.known or {})
end
function M.replace(wrapper,index,root)
 local ok,why=M.validate(wrapper); if not ok then return nil,why end; ok,why=Session.validate(root); if not ok then return nil,why end
 local roots=M.sessions(wrapper); if not roots[index] then return nil,"unknown generated case" end
 local out={canonical=index==1 and copy(root) or wrapper.canonical}; local cases={}
 for i=2,#roots do cases[i-1]=copy(i==index and root or roots[i]) end
 local discoveries=M.discoveries(wrapper); local seen={}; for _,id in ipairs(discoveries) do seen[id]=true end
 for _,id in ipairs(root.known) do if not seen[id] then discoveries[#discoveries+1]=id;seen[id]=true end end
 if #cases>0 or wrapper.successive then out.successive={schema=M.SCHEMA,cases=cases,discoveries=discoveries} end
 ok,why=M.validate(out); if not ok then return nil,why end; return out
end
return M
