package.path="mod/common/media/lua/client/?.lua;"..package.path
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
getPlayer=function() return {} end;getWorld=function() return {} end
local calls={};local running=false
package.preload['ConspiracyFiles/ClueMarkers']=function() return {start=function() calls[#calls+1]='markers';return true end} end
package.preload['ConspiracyFiles/AddressMap']=function() return {start=function() calls[#calls+1]='addresses';if running then return false,'address index already building' end;return true end} end
package.preload['ConspiracyFiles/GeneratedRuntime']=function() return {start=function(seed) calls[#calls+1]='case';assert(seed==123);return true end} end
local T=require('ConspiracyFiles/Trial');assert(#calls==0,'loading is passive')
assert(T.start(123));assert(table.concat(calls,',')=='markers,addresses,case')
running=true;assert(T.start(123))
isClient=function() return true end;local n=#calls;assert(not T.start(123) and #calls==n,'multiplayer refuses before any mutation')
print('PASS manual trial entry: passive load, source hooks before case, running index reuse, multiplayer refusal')
