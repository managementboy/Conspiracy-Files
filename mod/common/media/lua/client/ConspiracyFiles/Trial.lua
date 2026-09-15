-- Manual development entry point. Loading this file never starts a new case.
ConspiracyFiles=ConspiracyFiles or {}
local T={};ConspiracyFiles.Trial=T
function T.start(seed,options)
 if not getDebug or not getDebug() or (isClient and isClient()) or (isServer and isServer())
  or ConspiracyFiles.T11Mode or ConspiracyFiles.T12Mode then return false,"debug single-player only; disable T11/T12" end
 if not getPlayer() or not getWorld() then return false,"load a save first" end
 local markers=require("ConspiracyFiles/ClueMarkers")
 local ok,why=markers.start();if not ok then return false,why or "marker initialization failed" end
 local addresses=require("ConspiracyFiles/AddressMap")
 ok,why=addresses.start()
 if not ok and why~="address index already building" then return false,why end
 -- Source capture must be active before generating/looting a case. Runtime.start
 -- reuses an existing saved case; this entry point never clears or rerolls it.
 return require("ConspiracyFiles/GeneratedRuntime").start(seed,options)
end
return T
