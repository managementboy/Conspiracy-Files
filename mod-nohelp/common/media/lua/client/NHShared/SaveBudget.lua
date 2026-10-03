local V=require("NHShared/Validator")
local B={}
-- The roots this module budgets, published so nothing has to keep a second
-- copy of the list. A copy is what CFReload.bytes kept: eleven of the fourteen
-- there were then, under a comment saying "the same roots SaveBudget.check
-- measures", missing mapMedia, placeVisits and casePeople. Every save size in
-- the campaign evidence was therefore an undercount, and the 500 kB assertion
-- was being made against the wrong number - the same shape of mistake as
-- measuring one root and calling it the save (2026-09-21 retraction).
local tags={generated="NHShared.Generated.G2",addresses="NHShared.AddressBook.Muldraugh",identities="NHShared.IdentityObservations",keyConnections="NHShared.KeyConnections",localPeople="NHShared.LocalPeople",discoveries="NHShared.DiscoveryLedger",visitedBuildings="NHShared.VisitedBuildings",observedKeyLeads="NHShared.ObservedKeyLeads",personNames="NHShared.PersonNameObservations",bodyOutfits="NHShared.BodyOutfitObservations",placeVisits="NHShared.PlaceVisits",mapMedia="NHShared.MapMedia"}
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
 if player then roots.markers=player:getModData()["NHShared.ClueMarkers"] end
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
 -- NO SIZE CEILING in No Help (owner, 2026-09-27: "No limit at all"; DECISIONS.md,
 -- DR-20260927-NOHELP-RULE-PLACEMENT). Every root is still validated for
 -- structure - a cycle or a bad value loses the whole save (spike T1) - and
 -- the total is still returned, so a slow save can be traced to its size.
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
