local V=require("ConspiracyFiles/Validator")
local B={}
local tags={generated="ConspiracyFiles.Generated.G2",addresses="ConspiracyFiles.AddressBook.Muldraugh",legacy="ConspiracyFiles.DeadAir",identities="ConspiracyFiles.IdentityObservations",keyConnections="ConspiracyFiles.KeyConnections",localPeople="ConspiracyFiles.LocalPeople",discoveries="ConspiracyFiles.DiscoveryLedger",visitedBuildings="ConspiracyFiles.VisitedBuildings",observedKeyLeads="ConspiracyFiles.ObservedKeyLeads",personNames="ConspiracyFiles.PersonNameObservations",bodyOutfits="ConspiracyFiles.BodyOutfitObservations"}
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
 return V.validateCombined(roots)
end
return B
