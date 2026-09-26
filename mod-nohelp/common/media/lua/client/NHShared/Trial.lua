-- Manual development entry point. Loading this file never starts a new case.
NHShared=NHShared or {}
local T={};NHShared.Trial=T
function T.start(seed,options)
 if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer())
  or NHShared.T11Mode or NHShared.T12Mode then return false,"debug single-player only; disable T11/T12" end
 if not getPlayer() or not getWorld() then return false,"load a save first" end
 local markers=require("NHShared/ClueMarkers")
 local ok,why=markers.start();if not ok then return false,why or "marker initialization failed" end
 local addresses=require("NHShared/AddressMap")
 ok,why=addresses.start()
 if not ok and why~="address index already building" then return false,why end
 -- Source capture must be active before generating/looting a case. Runtime.start
 -- reuses an existing saved case; this entry point never clears or rerolls it.
 return require("NHShared/GeneratedRuntime").start(seed,options)
end
return T
