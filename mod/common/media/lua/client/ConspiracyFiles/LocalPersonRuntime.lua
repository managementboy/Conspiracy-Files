-- Explicit-call adapter.  Primary wires this only after a native row is visible.
local L=require("ConspiracyFiles/LocalPerson")
local A=require("ConspiracyFiles/HouseKeyAdapter")
local R={MAX_ITEMS=200,UNRECORDED_OCCUPATION="unrecorded"}
ConspiracyFiles=ConspiracyFiles or {};ConspiracyFiles.LocalPersonRuntime=R
local function text(v) return type(v)=="string" and v~="" and not v:find("[%c]") end
local function copy(t) local o={};for k,v in pairs(t)do o[k]=v end;return o end
-- This does no container traversal.  The caller supplies one already-visible
-- identity row plus its proven corpse source token and generated-house facts.
function R.bindVisible(state,visible)
 if type(visible)~="table" or not text(visible.caseId) or not text(visible.buildingId) or not text(visible.sourceToken)
  or not text(visible.name) or not text(visible.keyToken) or type(visible.keyId)~="number" then return nil,"invalid visible observation" end
 -- The occupation must be observed, not invented.  Asserting a trade the
 -- corpse never showed is a fabricated world fact and breaks the standing
 -- rule that a document found on a body is a lead, never proof.
 -- Whitespace-only text is not an observation; storing it would put a blank
 -- trade in the journal where it reads as a fact.
 local seen=visible.occupation
 local occupation=(text(seen) and #seen<=60 and seen:find("%S")) and seen or R.UNRECORDED_OCCUPATION
 return L.bind(state,{caseId=visible.caseId,buildingId=visible.buildingId,sourceToken=visible.sourceToken,
  observedName=visible.name,assignedOccupation=occupation,keyToken=visible.keyToken,keyId=visible.keyId,status="pending"})
end
function R.intent(state,caseId) return L.transition(state,caseId,"placing") end
function R.reconcile(state,caseId,count,confirmed)
 if type(count)~="number" or count~=math.floor(count) or count<0 or count>R.MAX_ITEMS then return nil,"invalid bounded count" end
 if count>1 then return L.transition(state,caseId,"conflict") end
 if count==1 then return L.transition(state,caseId,"placed",confirmed==true) end
 return L.transition(state,caseId,"unknown")
end
-- Factory is intentionally separate from intent persistence; callers persist
-- placing before calling it, then stamp the detached item before AddItem.
function R.createKey(building,record)
 if type(record)~="table" or record.status~="placing" then return nil,"not placing" end
 local key,why=A.createForBuilding(building);if not key then return nil,why end
 if key:getKeyId()~=record.keyId then return nil,"building key changed" end
 local md=key:getModData();md.cfLocalPersonCase=record.caseId;md.cfLocalPersonToken=record.keyToken
 -- A neutral name: the key was found among a body's belongings, which does
 -- not establish the person's trade or that they lived there.
 key:setName("Worn house key");key:setCustomName(true);return key,"detached"
end
return R
