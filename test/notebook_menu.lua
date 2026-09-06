package.path="mod/common/media/lua/client/?.lua;"..package.path
local actualUI={open=function() end}
local normalize=function(items) return items,false end
local menu={normalize=normalize}
local inspected=0
local inv={};local item={getOutermostContainer=function() return inv end,getModData=function() return {cfGeneratedId="a"} end}
local R={metrics=function() return {} end,subject=function(v) return v==item end,inspect=function() inspected=inspected+1;return true end}
package.loaded["ConspiracyFiles/GeneratedRuntime"]=R
package.loaded["ConspiracyFiles/ContextMenu"]=menu
package.loaded["ConspiracyFiles/Notebook"]=actualUI
Events={OnFillInventoryObjectContextMenu={Add=function() end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
getSpecificPlayer=function() return {getInventory=function() return inv end} end
ConspiracyFiles={}
local M=require("ConspiracyFiles/GeneratedMenu")
local options={};local context={addOption=function(_,label,_,callback) local o={label=label,callback=callback};options[#options+1]=o;return o end}
M.fill(0,context,{}) assert(#options==0,"generic journal option removed")
M.fill(0,context,{item}) assert(#options==1 and options[1].label=="Inspect Investigation Evidence")
options[1].callback();assert(inspected==1,"clue inspection retained")
print("PASS generated inventory menu: generic journal removed, inspection retained")
