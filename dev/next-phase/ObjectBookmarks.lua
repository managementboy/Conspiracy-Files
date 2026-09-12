-- Private, player-authored ordinary-object bookmarks.  They are deliberately
-- separate from generated cases and documents.
local V=require("ConspiracyFiles/Validator")
local B={MAX=64}
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,a) if type(t)~="table" then return false end for k in pairs(t) do if not a[k] then return false end end return true end
local function text(v,n,empty) return type(v)=="string" and (empty or v~="") and #v<=n end
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function dense(t,max) if type(t)~="table" then return false end local n=0 for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end if n>max then return false end for i=1,n do if t[i]==nil then return false end end return true,n end
local function sourceOK(s)
 if s==nil then return true end
 if not V.validateStructure(s) or not fields(s,{mapId=true,x=true,y=true,z=true,sourceLabel=true}) then return false end
 return text(s.mapId,160) and finite(s.x) and finite(s.y) and finite(s.z) and s.x==math.floor(s.x) and s.y==math.floor(s.y) and s.z==math.floor(s.z) and s.x>=-1000000 and s.x<=1000000 and s.y>=-1000000 and s.y<=1000000 and s.z>=-32 and s.z<=32 and (s.sourceLabel==nil or text(s.sourceLabel,300))
end
local function id(intent) return "bookmark:"..#intent..":"..intent end
local function sameSource(a,b) if a==nil or b==nil then return a==b end return a.mapId==b.mapId and a.x==b.x and a.y==b.y and a.z==b.z and a.sourceLabel==b.sourceLabel end
function B.validate(list)
 if not V.validateStructure(list) then return false,"unsafe bookmarks" end
 local ok,n=dense(list,B.MAX); if not ok then return false,"invalid bookmarks" end local intents,ids={},{ }
 for i=1,n do local r=list[i]
  if not fields(r,{id=true,intentId=true,title=true,itemIdentity=true,sourceContext=true,markedHours=true,note=true}) or not text(r.id,340) or not text(r.intentId,160) or r.id~=id(r.intentId) or not text(r.title,300) or not text(r.itemIdentity,160) or not sourceOK(r.sourceContext) or not finite(r.markedHours) or r.markedHours<0 or r.markedHours>1000000 or not text(r.note,1000,true) or intents[r.intentId] or ids[r.id] then return false,"invalid bookmark record" end
  intents[r.intentId]=true; ids[r.id]=true
 end
 return true
end
function B.mark(list,input)
 local ok,why=B.validate(list); if not ok then return nil,why end
 if not V.validateStructure(input) or not fields(input,{intentId=true,title=true,itemIdentity=true,sourceContext=true,markedHours=true,note=true}) or not text(input.intentId,160) or not text(input.title,300) or not text(input.itemIdentity,160) or not sourceOK(input.sourceContext) or not finite(input.markedHours) or input.markedHours<0 or input.markedHours>1000000 or not text(input.note,1000,true) then return nil,"invalid bookmark input" end
 for _,r in ipairs(list) do if r.intentId==input.intentId then
   if r.title==input.title and r.itemIdentity==input.itemIdentity and r.markedHours==input.markedHours and sameSource(r.sourceContext,input.sourceContext) then return copy(list) end
   return nil,"bookmark intent conflicts with immutable facts"
 end end
 if #list>=B.MAX then return nil,"bookmark limit reached" end
 local next=copy(list); next[#next+1]={id=id(input.intentId),intentId=input.intentId,title=input.title,itemIdentity=input.itemIdentity,sourceContext=copy(input.sourceContext),markedHours=input.markedHours,note=input.note}; return next
end
function B.editNote(list,intent,note)
 local ok,why=B.validate(list); if not ok then return nil,why end
 if not text(intent,160) or not text(note,1000,true) then return nil,"invalid bookmark note" end
 local next=copy(list); for _,r in ipairs(next) do if r.intentId==intent then r.note=note; return next end end return nil,"unknown bookmark intent"
end
function B.display(record)
 return {id=record.id,type="Marked object",title=record.title,context=(record.sourceContext and (record.sourceContext.sourceLabel or "Finding place recorded; label unavailable") or "Location not recorded"),note=record.note,markedHours=record.markedHours,authoredDocument=false}
end
return B
