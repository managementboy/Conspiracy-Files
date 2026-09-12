local V=require("ConspiracyFiles/Validator")
local B={}
local tags={generated="ConspiracyFiles.Generated.G2",addresses="ConspiracyFiles.AddressBook.Muldraugh",legacy="ConspiracyFiles.DeadAir",identities="ConspiracyFiles.IdentityObservations",keyConnections="ConspiracyFiles.KeyConnections",localPeople="ConspiracyFiles.LocalPeople",discoveries="ConspiracyFiles.DiscoveryLedger",visitedBuildings="ConspiracyFiles.VisitedBuildings",observedKeyLeads="ConspiracyFiles.ObservedKeyLeads",personNames="ConspiracyFiles.PersonNameObservations",bodyOutfits="ConspiracyFiles.BodyOutfitObservations"}
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
 -- A root with neither child is a flat store of its own (the marker records
 -- live under the player, not under a canonical/campaign wrapper). It was the
 -- one root this cache never covered, so every write of every kind re-walked
 -- it; its writer is copy-on-write like the rest, so the table's identity is
 -- enough. (writecost check, 2026-09-12.)
 if c and c.root==root and c.a==a and c.b==b then return c.ok,c.why,c.bytes end
 local ok,why=V.validateStructure(root)
 local bytes=ok and V.estimateEncodedBytes(root) or 0
 cache[name]={root=root,a=a,b=b,ok=ok,why=why,bytes=bytes}
 return ok,why,bytes
end
function B.check(kind,staged)
 local roots={}
 for name,tag in pairs(tags) do
  local wrapper=ModData.get(tag)
  if wrapper and (wrapper.canonical or wrapper.campaign) then roots[name]=wrapper end
 end
 local player=getPlayer()
 if player then roots.markers=player:getModData()["ConspiracyFiles.ClueMarkers"] end
 if kind=="generatedCampaign" then
  local store=ModData.get(tags.generated)
  roots.generated={canonical=store and store.canonical,campaign=staged}
 else roots[kind]=staged end
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
return B
