-- Derived, bounded relation awareness; generated documents are never rewritten.
local V=require("ConspiracyFiles/Validator")
local U={}
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function exact(t) if type(t)~="table" or t.at==nil or t.affected==nil then return false end for k in pairs(t) do if k~="at" and k~="affected" then return false end end return true end
function U.id(source,link) return source.."\31"..link.kind.."\31"..link.target end
function U.derive(case,known)
 local seen,events={},{}; for _,id in ipairs(known) do seen[id]=true end
 -- A COMPARISON IS A PROPERTY OF THE PROJECTION, NOT OF THE STORED CASE.
 -- This read doc.links, which Generated/Story.lua correctly leaves empty:
 -- a comparison only exists once every source it requires is known, so it
 -- cannot be a field on a document. Measured 2026-09-21 against generated
 -- cases: 0 events derived here against 3-4 projected connections each, so no
 -- update was ever recorded and test/investigation_flow failed because nothing
 -- was marked - not because the wrong thing was.
 --
 -- The authored comparisons carry their own `requires`, and a finding counts
 -- only when ALL of them are known. That is the same gate Story.project
 -- applies when it decides whether to show the sentence.
 local story=case.story
 for _,finding in ipairs(story and story.comparisons or {}) do
  local supported=true
  for _,id in ipairs(finding.requires or {}) do if not seen[id] then supported=false; break end end
  if supported and seen[finding.from] and seen[finding.to] and finding.from~=finding.to then
   -- `requires` travels with the relation so a caller can ask WHEN it became
   -- supported. For a three-source finding that is the third document's hour,
   -- not the later endpoint's.
   local needs={}; for i,id in ipairs(finding.requires or {}) do needs[i]=id end
   events[U.id(finding.from,{kind=finding.kind,target=finding.to})]={source=finding.from,target=finding.to,requires=needs}
  end
 end
 -- A case that does carry links is still read, so a hand-built fixture and an
 -- older save keep working.
 for _,doc in ipairs(case.documents) do if seen[doc.id] then for _,link in ipairs(doc.links or {}) do if seen[link.target] then events[U.id(doc.id,link)]={source=doc.id,target=link.target} end end end end
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
