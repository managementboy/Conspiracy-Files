package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local handlers={};Events={OnTick={Add=function(f) handlers.tick=f end,Remove=function(f) if handlers.tick==f then handlers.tick=nil end end},OnFillInventoryObjectContextMenu={Add=function(f) handlers.menu=f end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
local tool=false;local inv={};local saved={ ["ConspiracyFiles.ClueMarkers"]={untouched=true} };local player={getInventory=function() return inv end,getCurrentSquare=function() return square end,getModData=function() return saved end}
getPlayer=function() return player end;getSpecificPlayer=function() return player end
local spawned={};square={getX=function() return 10 end,getY=function() return 20 end,getZ=function() return 0 end,AddWorldInventoryItem=function(_,kind,x,y,z)
 local item={md={},outer=nil,name=kind,getModData=function(self) return self.md end,getName=function(self) return self.name end,setName=function(self,n) self.name=n end,setCustomName=function() end,getOutermostContainer=function(self) return self.outer end}
 spawned[#spawned+1]=item;return item
end}
local clock=0;getTimeInMillis=function() clock=clock+1000;return clock end
getWorld=function() return {getMap=function() return "Muldraugh, KY" end} end
local canonical={untouched=true};ConspiracyFiles={Generated={canonical=canonical},ContextMenu={normalize=function(values) return values,false end},ClueMarkers={writingTool=function() return tool and tool or false end,drawRecords=function(_,c,r) _G.drawn={c=c,r=r} end}}
ISWorldMap={render=function() end};package.preload["ISUI/Maps/ISWorldMap"]=function() return {} end
local T=require("ConspiracyFiles/MarkerColourTest");assert(T.start() and #spawned==2,"exactly two physical notes")
assert(T.start() and #spawned==2,"repeat start does not duplicate")
handlers.tick();assert(not _G.drawn,"no tool does not queue annotations")
spawned[1].outer=inv;local menu={options={},addOption=function(self,label,_,callback) local o={label=label,callback=callback};self.options[#self.options+1]=o;return o end}
handlers.menu(0,menu,{spawned[1]});assert(#menu.options==1);menu.options[1].callback();handlers.tick();T.draw({})
assert(not drawn.r.records["temporary-marker-colour-1"].written,'inspected note waits for a tool')
tool="RedPen";handlers.tick();T.draw({})
assert(drawn.r.records["temporary-marker-colour-1"].ink=="RedPen","red freezes at inspection")
spawned[2].outer=inv;local second={options={},addOption=menu.addOption};handlers.menu(0,second,{spawned[2]});second.options[1].callback();tool="BluePen";handlers.tick();T.draw({})
assert(drawn.r.records["temporary-marker-colour-1"].ink=="RedPen" and drawn.r.records["temporary-marker-colour-2"].ink=="BluePen","prior red remains red")
local guarded={options={},addOption=menu.addOption};spawned[1].outer=nil;handlers.menu(0,guarded,{spawned[1]});assert(#guarded.options==1 and guarded.options[1].notAvailable,"context menu requires current inventory")
assert(ConspiracyFiles.Generated.canonical==canonical and saved["ConspiracyFiles.ClueMarkers"].untouched,"fixture never touches canonical or marker player data")
package.loaded["ConspiracyFiles/MarkerColourTest"]=nil
assert(require("ConspiracyFiles/MarkerColourTest")==T and T.start() and #spawned==2,'module reload preserves bounded fixture')
print("PASS temporary marker colour fixture: bounded spawn, frozen inks, isolated state, inventory guard")
