local V=require("ConspiracyFiles/Validator")
local M={MAX=128}
local types={['Base.IDcard']=true,['Base.IDcard_Stolen']=true,['Base.IDcard_Female']=true,
 ['Base.IDcard_Male']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true,['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.BusinessCard_Nolans']=true,['Base.Passport']=true,['Base.PressID']=true,['Base.Badge']=true,['Base.Diary1']=true,['Base.Diary2']=true}
local fields={id=true,fullType=true,label=true,source=true,container=true,x=true,y=true,z=true,observedAt=true,token=true}
local function finite(v) return type(v)=="number" and v==v and v~=math.huge and v~=-math.huge end
local function text(v,n) return type(v)=="string" and #v<=n and v:find("%S") and not v:find("[%c]") end
local function copyRecord(r) local o={};for k in pairs(fields) do o[k]=r[k] end;return o end
local function validRecord(r)
 if type(r)~="table" or getmetatable(r) then return false end
 for k in pairs(r) do if not fields[k] then return false end end
 return types[r.fullType] and text(r.id,240) and r.id:sub(1,#r.fullType+1)==r.fullType..":"
  and #r.id>#r.fullType+1 and text(r.label,180) and (r.source=="corpse" or r.source=="container")
  and text(r.container,120) and finite(r.x) and finite(r.y) and finite(r.z)
  and finite(r.observedAt) and r.observedAt>=0
  and (r.token==nil or text(r.token,160))
end
function M.empty() return {schema=1,records={}} end
function M.validate(root)
 if type(root)~="table" or getmetatable(root) or root.schema~=1 or type(root.records)~="table" or getmetatable(root.records) then return false,"invalid observation root" end
 for k in pairs(root) do if k~="schema" and k~="records" then return false,"unknown root field" end end
 local n=0
 for k in pairs(root.records) do
  n=n+1;if n>M.MAX or type(k)~="number" or k<1 or k%1~=0 or k>M.MAX then return false,"invalid record index/count" end
 end
 local seen={}
 for i=1,n do
  local r=root.records[i]
  if not validRecord(r) or seen[r.id] then return false,"invalid/duplicate identity record" end
  seen[r.id]=true
 end
 return V.validateStructure(root)
end
function M.add(root,r)
 local ok,e=M.validate(root);if not ok then return nil,false,e end
 if not validRecord(r) then return nil,false,"invalid observation" end
 local candidate=M.empty();local duplicate=false
 for i,old in ipairs(root.records) do candidate.records[i]=copyRecord(old);if old.id==r.id then duplicate=true end end
 -- A record observed before its body was stamped has no token, and the outfit
 -- lead can never attach without one. Take the token when it finally exists
 -- rather than treating the second sighting as a duplicate with nothing to add.
 -- Nothing else about a stored record is ever rewritten: an observation is a
 -- record of what was seen, not a mutable row.
 if duplicate then
  if r.token~=nil then
   for i,old in ipairs(candidate.records) do
    if old.id==r.id and old.token==nil then
     candidate.records[i].token=r.token
     local okBackfill,eBackfill=M.validate(candidate)
     if not okBackfill then return nil,false,eBackfill end
     return candidate,true
    end
   end
  end
  return candidate,false
 end
 candidate.records[#candidate.records+1]=copyRecord(r)
 ok,e=M.validate(candidate);if not ok then return nil,false,e end
 return candidate,true
end
-- outfitFor is an optional function(token) -> outfit name or nil, supplied
-- by the client (ConspiracyFiles.BodyOutfitLog.outfitFor). This module stays
-- a pure domain with zero PZ dependencies: it only ever calls what it was
-- given, and only when this record actually carries a body's token. A
-- missing outfitFor, a missing token, or an outfit lookup that returns
-- nothing all mean the same thing here -- say nothing about clothing.
function M.rows(root,outfitFor)
 if not M.validate(root) then return {} end
 local rows={}
 for i,r in ipairs(root.records) do
  local where=r.source=="corpse" and "among a corpse's belongings" or ("inside "..r.container)
  local detail="I saw a document labelled \""..r.label.."\" "..where..".\n\nThe name on a document is a lead. It does not establish who owned the container or identify the body."
  if r.token and outfitFor then
   local ok,outfit=pcall(outfitFor,r.token)
   if ok and text(outfit,120) then
    detail=detail.."\n\nThe body itself wore a "..outfit..". A worn outfit and a labelled document are two separate observations from the same body; this record does not decide which one, if either, describes who the body is."
   end
  end
  detail=detail.."\n\nObserved near "..math.floor(r.x)..", "..math.floor(r.y).." (floor "..r.z..")."
  rows[i]={id="identity:"..r.id,ordinal=i,title="Found "..r.label,summary="Identity document - "..r.source,
   detailText=detail}
 end
 return rows
end
return M
