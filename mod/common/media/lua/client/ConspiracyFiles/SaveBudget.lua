local V=require("ConspiracyFiles/Validator")
local B={}
-- The roots this module budgets, published so nothing has to keep a second
-- copy of the list. A copy is what CFReload.bytes kept: eleven of the fourteen
-- there were then, under a comment saying "the same roots SaveBudget.check
-- measures", missing mapMedia, placeVisits and casePeople. Every save size in
-- the campaign evidence was therefore an undercount, and the 500 kB assertion
-- was being made against the wrong number - the same shape of mistake as
-- measuring one root and calling it the save (2026-09-21 retraction).
local tags={generated="ConspiracyFiles.Generated.G2",addresses="ConspiracyFiles.AddressBook.Muldraugh",legacy="ConspiracyFiles.DeadAir",identities="ConspiracyFiles.IdentityObservations",keyConnections="ConspiracyFiles.KeyConnections",localPeople="ConspiracyFiles.LocalPeople",discoveries="ConspiracyFiles.DiscoveryLedger",visitedBuildings="ConspiracyFiles.VisitedBuildings",observedKeyLeads="ConspiracyFiles.ObservedKeyLeads",personNames="ConspiracyFiles.PersonNameObservations",bodyOutfits="ConspiracyFiles.BodyOutfitObservations",placeVisits="ConspiracyFiles.PlaceVisits",casePeople="ConspiracyFiles.CasePeople",mapMedia="ConspiracyFiles.MapMedia",threads="ConspiracyFiles.Threads"}
-- Measuring every saved root on every write cost 20-50 ms on the Linux test
-- laptop (perf check, 2026-09-11): the whole ~170 KB was walked to record one
-- map mark or one ID. A store keeps its identity while each write replaces its
-- `canonical`/`campaign` (every writer is copy-on-write), so a store whose two
-- children are the same tables as last time has not changed and its result is
-- reused. What is being written now is always a new table and is always
-- validated in full, exactly as before (P4-R32).
local cache={}
local function measure(name,root)
 local a=type(root)=="table" and root.canonical or nil
 local b=type(root)=="table" and root.campaign or nil
 local c=cache[name]
 if c and c.root==root and c.a==a and c.b==b and (a~=nil or b~=nil) then return c.ok,c.why,c.bytes end
 local ok,why=V.validateStructure(root)
 local bytes=ok and V.estimateEncodedBytes(root) or 0
 cache[name]={root=root,a=a,b=b,ok=ok,why=why,bytes=bytes}
 return ok,why,bytes
end
function B.checkMany(replacements)
 local roots={}
 for name,tag in pairs(tags) do
  local wrapper=ModData.get(tag)
  if wrapper and (wrapper.canonical or wrapper.campaign) then roots[name]=wrapper end
 end
 local player=getPlayer()
 if player then roots.markers=player:getModData()["ConspiracyFiles.ClueMarkers"] end
 for kind,staged in pairs(replacements) do
  if not tags[kind] and kind~="markers" then return false,"unknown budget root: "..tostring(kind) end
  roots[kind]=staged
 end
 -- Same result as V.validateCombined(roots), without re-walking unchanged roots.
 local total=0
 for name,root in pairs(roots) do
  local ok,why,bytes=measure(name,root)
  if not ok then return false,tostring(name)..": "..tostring(why) end
  total=total+bytes
 end
 if total>V.MAX_ENCODED_BYTES then
  return false,"combined canonical save budget exceeded ("..total.." bytes)"
 end
 return true,total
end
function B.check(kind,staged)
 if kind=="generatedCampaign" then
  local store=ModData.get(tags.generated)
  return B.checkMany({generated={canonical=store and store.canonical,campaign=staged}})
 end
 return B.checkMany({[kind]=staged})
end
B.tags=tags
return B
