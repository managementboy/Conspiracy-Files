-- The organiser's radio is never on. It is declared as a radio only to borrow
-- the game's battery model; switched on it received the game's emergency
-- broadcast and printed its static over the survivor ("<szzt>", owner, Windows,
-- 2026-09-18). Knox.OS has its own on/off, and the cell is read and drained by
-- the mod itself.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local turnedOn=true
local device={getIsTurnedOn=function() return turnedOn end,
              setIsTurnedOn=function(_,v) turnedOn=v end,
              getPower=function() return 0.8 end}
local item={getDeviceData=function() return device end,getFullType=function() return "ConspiracyFiles.Organiser" end,
            getModData=function() return {} end,setFavorite=function() end}
ConspiracyFiles={}
Events={OnTick={Add=function() end},OnGameStart={Add=function() end},OnCreatePlayer={Add=function() end},
        OnFillInventoryObjectContextMenu={Add=function() end}}
isClient=function() return false end; isServer=function() return false end
getPlayer=function() return nil end
local O=dofile("mod/common/media/lua/client/ConspiracyFiles/Organiser.lua")

assert(O.silence(item)==true,"an organiser that is on is silenced")
assert(turnedOn==false,"the radio is off")
assert(O.silence(item)==false,"one already silent needs nothing done")
assert(O.power(item)==0.8,"the cell still reads with the radio off")
assert(O.silence(nil)==false,"no item, nothing to do")
print("PASS organiser radio silent: the device listens to nothing, and its cell still reads")
