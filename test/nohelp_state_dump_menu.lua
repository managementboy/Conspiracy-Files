-- The "Dump State" world context-menu entry takes vanilla's real argument
-- order, OnFillWorldObjectContextMenu(playerNum, context, worldObjects, test).
-- Taking (context, worldObject) made every right-click on the world throw
-- "tried to call nil" on the player number (owner playtest, 2026-09-30).
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"..package.path
NHShared={}
local registered
package.preload["NHShared/StateDump"]=function() return {run=function() end} end
package.preload["NHShared/Log"]=function() return {write=function() end} end
package.preload["NHShared/Events/EngineEvents"]=function()
    return {on=function(name,fn) if name=="OnFillWorldObjectContextMenu" then registered=fn end end}
end
local M=require("NHShared/StateDumpTrigger")
assert(registered==M.fillContextMenu,"the handler is registered for the world context menu")

-- An ISContextMenu-like table whose addOption comes through a metatable.
local Menu={}; Menu.__index=Menu
function Menu:addOption(name,target,fn) self.options[#self.options+1]={name=name,target=target,fn=fn} end
local function menu() return setmetatable({options={}},Menu) end

local objects={"a world object"}
local context=menu()
registered(0,context,objects,false)
assert(#context.options==1 and context.options[1].name=="Dump State","the entry is added")
assert(context.options[1].target==objects and context.options[1].fn==M.trigger)

local tested=menu()
registered(0,tested,objects,true)
assert(#tested.options==0,"a test pass adds nothing")

-- Anything that is not a menu is ignored rather than thrown on.
registered(0,nil,objects,false)
registered(context,0,objects,false)

isClient=function() return true end
local mp=menu()
registered(0,mp,objects,false)
assert(#mp.options==0,"multiplayer adds nothing")
print("PASS nohelp state dump menu: vanilla argument order, no error on right-click")
