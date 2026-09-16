-- Clicking a TV opens the game's own panel, and a world object is never asked
-- for a method it does not have. Owner, Windows, 2026-09-16: every click on a
-- TV raised a Lua error. The organiser wraps ISRadioWindow.activate so it can
-- refuse the frequency dial on itself, and its "is this ours?" test called
-- getFullType on the TV. That throw was caught, but a debug game still reports
-- a caught throw as an error.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local opened={}
package.preload["RadioCom/ISRadioWindow"]=function()
    ISRadioWindow={activate=function(_,device) opened[#opened+1]=device end}
    return ISRadioWindow
end
local items={}
instanceof=function(object,kind) return kind=="InventoryItem" and items[object]==true end
ConspiracyFiles={}
local O=require("ConspiracyFiles/Organiser")
assert(O.panelBlocked,"the radio panel is wrapped when the organiser loads")

-- A TV standing in a room: a world object, with no getFullType of its own.
local asked=0
local tv={getFullType=function() asked=asked+1; error("an IsoTelevision has no getFullType") end,
          getModData=function() return {} end}
ISRadioWindow.activate("player",tv)
assert(#opened==1 and opened[1]==tv,"a TV opens the game's own panel")
assert(asked==0,"a world object is never asked for a method it lacks")
assert(O.isOurs(tv)==false,"a TV is not the organiser")

-- The survivor's organiser still opens Knox.OS, never the dial.
local ours={getFullType=function() return O.TYPE end,getModData=function() return {} end}
items[ours]=true
local read=0
O.read=function() read=read+1 end
ISRadioWindow.activate("player",ours)
assert(read==1 and #opened==1,"the organiser opens Knox.OS, not the frequency dial")

-- A vanilla radio in the survivor's hands keeps its panel.
local radio={getFullType=function() return "Base.RadioRed" end,getModData=function() return {} end}
items[radio]=true
ISRadioWindow.activate("player",radio)
assert(#opened==2 and opened[2]==radio,"a carried radio still gets its panel")

print("PASS organiser TV click: a TV opens its own panel without an error, the organiser still opens Knox.OS")
