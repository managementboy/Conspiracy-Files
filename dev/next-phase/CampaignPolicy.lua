-- Offline metadata ledger for future case scheduling. Existing case roots remain authoritative elsewhere.
local V=require("ConspiracyFiles/Validator")
local Reach=require("ConspiracyFiles/Reach")
local C={SCHEMA=1,MAX_BYTES=500000}
local function copy(v) if type(v)~="table" then return v end local o={} for k,c in pairs(v) do o[k]=copy(c) end return o end
local function text(v,n) return type(v)=="string" and v~="" and #v<=n end
local function number(v,min,max) return type(v)=="number" and v==v and v~=math.huge and v~=-math.huge and v>=min and v<=max end
local function integer(v,min,max) return number(v,min,max) and v==math.floor(v) end
local function fields(t,a) if type(t)~="table" then return false end for k in pairs(t) do if not a[k] then return false end end return true end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
function C.config(config)
 local safe=V.validateStructure(config); if not safe then return false,"unsafe campaign config" end
 if not fields(config,{minGapHours=true,maxConcurrent=true,maxRetained=true}) or not number(config.minGapHours,0,100000) or not integer(config.maxConcurrent,1,16) or not integer(config.maxRetained,1,64) then return false,"invalid campaign config" end return true
end
local function recordOK(r)
 if not fields(r,{caseId=true,createdHours=true,survivalHours=true,anchor=true,radius=true,siteIds=true}) or not text(r.caseId,160) or not number(r.createdHours,0,1000000) or not number(r.survivalHours,0,1000000) then return false end
 local radius=Reach.radius(r.survivalHours); if not radius or r.radius~=radius or not fields(r.anchor,{x=true,y=true}) or not Reach.validAnchor(r.anchor) then return false end
 local ok,n=dense(r.siteIds,2); if not ok or n~=2 or not text(r.siteIds[1],160) or not text(r.siteIds[2],160) or r.siteIds[1]==r.siteIds[2] then return false end return true
end
function C.validate(state)
 local safe=V.validateStructure(state); if not safe then return false,"unsafe campaign ledger" end
 if not fields(state,{schema=true,records=true}) or state.schema~=C.SCHEMA then return false,"invalid campaign ledger" end
 local ok,n=dense(state.records,64); if not ok then return false,"invalid campaign records" end local cases,sites={},{ }
 local previous=nil
 for i=1,n do local r=state.records[i]; if not recordOK(r) or cases[r.caseId] or (previous and r.createdHours<previous) then return false,"invalid, unordered, or duplicate campaign record" end previous=r.createdHours; cases[r.caseId]=true; for _,site in ipairs(r.siteIds) do if sites[site] then return false,"reused site in ledger" end sites[site]=true end end
 return true
end
function C.new() return {schema=C.SCHEMA,records={}} end
local function requestOK(request)
 local safe=V.validateStructure(request); if not safe then return false,"unsafe campaign request" end
 if not fields(request,{caseId=true,createdHours=true,survivalHours=true,anchor=true,radius=true,siteIds=true,activeIds=true,activeCount=true}) or not recordOK({caseId=request.caseId,createdHours=request.createdHours,survivalHours=request.survivalHours,anchor=request.anchor,radius=request.radius,siteIds=request.siteIds}) or not integer(request.activeCount,0,16) then return false,"invalid campaign request" end
 local ok,n=dense(request.activeIds,16); if not ok or n~=request.activeCount then return false,"invalid active case list" end local ids={}; for i=1,n do if not text(request.activeIds[i],160) or ids[request.activeIds[i]] then return false,"invalid active case list" end ids[request.activeIds[i]]=true end return true
end
function C.availability(state,config,request)
 local ok,why=C.validate(state); if not ok then return false,why end ok,why=C.config(config); if not ok then return false,why end ok,why=requestOK(request); if not ok then return false,why end
 if #state.records>=config.maxRetained then return false,"deferred: retained-case cap reached" end
 if request.activeCount>=config.maxConcurrent then return false,"deferred: concurrent-case cap reached" end
 local used,cases={},{}; local latest=nil
 for _,r in ipairs(state.records) do cases[r.caseId]=true; if not latest or r.createdHours>latest then latest=r.createdHours end for _,site in ipairs(r.siteIds) do used[site]=true end end
 if cases[request.caseId] then return false,"duplicate case ID" end
 for _,active in ipairs(request.activeIds) do if not cases[active] then return false,"active case ID is not retained" end end
 if latest and request.createdHours<latest+config.minGapHours then return false,"deferred: minimum in-game gap not reached" end
 for _,site in ipairs(request.siteIds) do if used[site] then return false,"deferred: candidate repeats a retained site" end end
 return true
end
local function budget(staged,peers)
 if type(peers)~="table" then return false,"explicit peer roots required" end local safe=V.validateStructure(peers); if not safe or peers.ledger~=nil then return false,"unsafe peers or reserved ledger key" end
 local ledgerBytes=V.estimateEncodedBytes(staged); if not ledgerBytes or ledgerBytes>C.MAX_BYTES then return false,"ledger budget exceeded" end
 local ok,why=V.validateCombined(peers,C.MAX_BYTES-ledgerBytes); if not ok then return false,why end return true,ledgerBytes
end
function C.stage(state,config,request,peers)
 local ok,why=C.availability(state,config,request); if not ok then return nil,why end local next=copy(state); next.records[#next.records+1]={caseId=request.caseId,createdHours=request.createdHours,survivalHours=request.survivalHours,anchor=copy(request.anchor),radius=request.radius,siteIds=copy(request.siteIds)}
 ok,why=C.validate(next); if not ok then return nil,why end ok,why=budget(next,peers); if not ok then return nil,why end return next
end
return C
