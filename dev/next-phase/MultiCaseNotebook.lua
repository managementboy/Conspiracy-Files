-- Offline learned-only notebook grouping. Inputs must already be authoritative projections.
local V=require("ConspiracyFiles/Validator")
local Campaign=require("CampaignPolicy")
local M={}
local function copy(v) if type(v)~="table" then return v end local o={} for k,c in pairs(v) do o[k]=copy(c) end return o end
local function text(v,n) return type(v)=="string" and v~="" and #v<=n end
local function fields(t,a) if type(t)~="table" then return false end for k in pairs(t) do if not a[k] then return false end end return true end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if not t[i] then return false end end return true,n end
local function key(caseId,docId) return "case:"..#caseId..":"..caseId..":doc:"..#docId..":"..docId end
local function rowsOK(rows)
 local ok,n=dense(rows,3); if not ok then return false end local ids={}
 for i=1,n do local r=rows[i]; if not fields(r,{id=true,kind=true,title=true,body=true,locationId=true,leads=true,connections=true}) or not text(r.id,160) or not text(r.title,300) or not text(r.body,2000) or not text(r.locationId,160) or (r.kind~=nil and not text(r.kind,80)) then return false end local leads,le=dense(r.leads,3); local links,ln=dense(r.connections,3); if not leads or not links or ids[r.id] then return false end ids[r.id]=true for j=1,le do if not text(r.leads[j],160) then return false end end for j=1,ln do if not fields(r.connections[j],{target=true,kind=true}) or not text(r.connections[j].target,160) or not text(r.connections[j].kind,80) then return false end end end
 return true
end
function M.project(ledger,projections)
 local safe=V.validateStructure({ledger=ledger,projections=projections}); if not safe then return nil,"unsafe notebook input" end
 local ok,why=Campaign.validate(ledger); if not ok then return nil,why end if type(projections)~="table" then return nil,"invalid projections" end
 local records={}; for _,r in ipairs(ledger.records) do records[r.caseId]=true end for caseId,rows in pairs(projections) do if not records[caseId] or not text(caseId,160) or not rowsOK(rows) then return nil,"invalid case projection" end end
 local groups={}; local ordinal=0
 for _,record in ipairs(ledger.records) do local rows=projections[record.caseId]; if rows and #rows>0 then ordinal=ordinal+1; local known={}; for _,r in ipairs(rows) do known[r.id]=true end local visible={}
   for i,r in ipairs(rows) do local links={} for _,link in ipairs(r.connections) do if known[link.target] then links[#links+1]=copy(link) end end visible[i]={id=r.id,title=r.title,body=r.body,links=links,evidenceKey=key(record.caseId,r.id),markerKey=key(record.caseId,r.id)} end
   groups[#groups+1]={name="Investigation "..ordinal,caseKey="case:"..#record.caseId..":"..record.caseId,rows=visible}
 end end
 return copy(groups)
end
return M
