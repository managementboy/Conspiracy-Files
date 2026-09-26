-- Pure durable binding state for a future observed local-person/key adapter.
local M={MAX=3}
local fields={caseId=true,buildingId=true,sourceToken=true,observedName=true,assignedOccupation=true,keyToken=true,keyId=true,status=true}
local statuses={pending=true,placing=true,placed=true,unknown=true,conflict=true}
local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function text(v) return type(v)=="string" and #v>0 and #v<=180 and not v:find("[%c]") end
local function keyId(v) return type(v)=="number" and v==v and v~=math.huge and v~=-math.huge and v%1==0 and v>=0 end
local function copy(r) local n={};for k in pairs(fields) do n[k]=r[k] end;return n end
local function valid(r)
 if not plain(r) then return false end
 for k in pairs(r) do if not fields[k] then return false end end
 for _,k in ipairs({"caseId","buildingId","sourceToken","observedName","assignedOccupation","keyToken"}) do if not text(r[k]) then return false end end
 return keyId(r.keyId) and statuses[r.status]
end
function M.empty() return {schema=1,records={}} end
function M.validate(s)
 if not plain(s) or s.schema~=1 or not plain(s.records) then return false,"invalid local-person state" end
 for k in pairs(s) do if k~="schema" and k~="records" then return false,"unknown root field" end end
 local n,seen=0,{}
 for caseId,r in pairs(s.records) do
  n=n+1;if n>M.MAX or not text(caseId) or not valid(r) or caseId~=r.caseId or seen[caseId] then return false,"invalid binding" end
  seen[caseId]=true
 end
 return true
end
local function cloned(s)
 local n=M.empty();for caseId,r in pairs(s.records) do n.records[caseId]=copy(r) end;return n
end
function M.bind(s,r)
 local ok,why=M.validate(s);if not ok then return nil,why end
 if not valid(r) or r.status~="pending" then return nil,"invalid pending binding" end
 local old=s.records[r.caseId]
 if old then
  for k in pairs(fields) do if old[k]~=r[k] then return nil,"conflicting binding" end end
  return cloned(s),"duplicate"
 end
 local n=0;for _ in pairs(s.records) do n=n+1 end;if n>=M.MAX then return nil,"cap" end
 local next=cloned(s);next.records[r.caseId]=copy(r);return next,"bound"
end
function M.transition(s,caseId,status,confirmedPhysicalItem)
 local ok,why=M.validate(s);if not ok then return nil,why end
 if not text(caseId) or not statuses[status] then return nil,"invalid transition" end
 local old=s.records[caseId];if not old then return nil,"unknown case" end
 if old.status==status then return cloned(s),"duplicate" end
 local allowed=(old.status=="pending" and status=="placing")
  or (old.status=="placing" and (status=="placed" or status=="unknown" or status=="conflict"))
  or (old.status=="unknown" and status=="placed" and confirmedPhysicalItem==true)
  or ((old.status=="placed" or old.status=="unknown") and status=="conflict")
 if not allowed then return nil,"illegal transition" end
 local next=cloned(s);next.records[caseId].status=status;return next,"transitioned"
end
function M.snapshot(s) local ok=M.validate(s);if not ok then return nil end;return cloned(s) end
return M
