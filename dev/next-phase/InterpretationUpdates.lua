-- Derived, bounded relation awareness; generated documents are never rewritten.
local V=require("ConspiracyFiles/Validator")
local U={}
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function exact(t) if type(t)~="table" or t.at==nil or t.affected==nil then return false end for k in pairs(t) do if k~="at" and k~="affected" then return false end end return true end
function U.id(source,link) return source.."\31"..link.kind.."\31"..link.target end
function U.derive(case,known)
 local seen,events={},{}; for _,id in ipairs(known) do seen[id]=true end
 for _,doc in ipairs(case.documents) do if seen[doc.id] then for _,link in ipairs(doc.links) do if seen[link.target] then events[U.id(doc.id,link)]={source=doc.id,target=link.target} end end end end
 return events
end
function U.validate(events,case,known)
 local safe=V.validateStructure(events); if not safe or type(events)~="table" then return false,"invalid interpretation updates" end
 local allowed=U.derive(case,known); local order={}; for i,id in ipairs(known) do order[id]=i end
 for id,relation in pairs(allowed) do local event=events[id]; local expected=order[relation.source]<order[relation.target] and relation.source or relation.target; if not exact(event) or not finite(event.at) or event.at<0 or event.at>1000000 or event.affected~=expected then return false,"invalid interpretation update" end end
 for id in pairs(events) do if type(id)~="string" or not allowed[id] then return false,"invalid interpretation update" end end return true
end
function U.visible(events,now,ttl)
 if not finite(now) or not finite(ttl) or now<0 or now>1000000 or ttl<0 or ttl>1000000 then return nil,"invalid update clock" end local changed={}; for id,event in pairs(events) do if now<event.at then return nil,"update clock precedes saved event" end if now<event.at+ttl then changed[id]=event.affected end end return changed
end
return U
