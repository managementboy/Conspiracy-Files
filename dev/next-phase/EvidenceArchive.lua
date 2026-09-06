-- Bounded derived archive view; never removes evidence or changes campaign slots.
local V=require("ConspiracyFiles/Validator")
local A={}
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
function A.project(rows,learnedAt,now,age)
 if not V.validateStructure({rows=rows,learnedAt=learnedAt}) or type(rows)~="table" or type(learnedAt)~="table" then return nil,"invalid archive input" end
 if not finite(now) or not finite(age) or now<0 or now>1000000 or age<0 or age>1000000 then return nil,"invalid archive clock" end
 local out={}; for i,row in ipairs(rows) do local at=learnedAt[row.id]; if not finite(at) or at<0 or at>now then return nil,"unknown or future evidence age" end local item=copy(row); item.archived=now>=at+age; out[i]=item end return out
end
function A.relevant(case,known,newId)
 local index,byId={},{}; for _,doc in ipairs(case.documents) do byId[doc.id]=doc end
 for _,id in ipairs(known) do if id~=newId then for _,ref in ipairs(byId[id].references) do index[ref]=index[ref] or {}; index[ref][#index[ref]+1]=id end end end
 local touched,seen,visited={},{},0; for _,ref in ipairs(byId[newId].references) do for _,id in ipairs(index[ref] or {}) do visited=visited+1; if not seen[id] then seen[id]=true; touched[#touched+1]=id end end end
 return touched,{visited=visited,touched=#touched}
end
-- Replay is bounded to the three documents per case; only known references enter buckets.
function A.rebuild(case,known,times)
 local result,prefix={},{}
 for _,id in ipairs(known) do
  prefix[#prefix+1]=id; result[id]=times[id]
  for _,prior in ipairs(A.relevant(case,prefix,id)) do result[prior]=times[id] end
 end
 return result
end
return A
