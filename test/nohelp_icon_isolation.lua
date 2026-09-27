-- The two mods' search icons never touch each other (first visible playtest,
-- 2026-09-27). Both used the id prefix "cf-clue:" and the manager's one
-- `clueIcons` table, so the original mod's sync, which knows none of No
-- Help's clues, removed No Help's icon every 15 ticks and No Help added it
-- back; the spot timer never filled. Both modules are loaded here against the
-- same doubles of the game's foraging classes (shaped like test/
-- clue_search_rules.lua's) and synced in turn.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;"
    .."mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
Events=setmetatable({},{__index=function(t,name)
    local ev={Add=function() end,Remove=function() end}; rawset(t,name,ev); return ev end})
getDebug=function() return false end
getTimestampMs=function() return 0 end
getTimeInMillis=function() return 0 end
package.preload["Foraging/forageSystem"]=function() return true end
package.preload["Foraging/ISBaseIcon"]=function() return true end
forageSystem={isInitialised=false,categoryDefinitions={},catDefs={},visionRadiusCap=15,zoneDefinitions={{name="Forest"}}}
instanceItem=function() return {getFullType=function() return "Base.Plank" end} end
ISBaseIcon={}
ISBaseIcon.__index=ISBaseIcon
function ISBaseIcon:derive(name) local c=setmetatable({},{__index=self}); c.__index=c; c.Type=name; return c end
function ISBaseIcon:new(manager,icon)
    local o={manager=manager,character=manager.character,icon=icon,iconID=icon.id,xCoord=icon.x,yCoord=icon.y,zCoord=icon.z,isSeen=false}
    setmetatable(o,self); self.__index=self
    return o
end
function ISBaseIcon:getIsSeen() return self.isSeen end
function ISBaseIcon:doUpdateEvents() end
function ISBaseIcon:addToUIManager() self.inUI=true end
function ISBaseIcon:removeFromUIManager() self.inUI=false end
function ISBaseIcon:findTextureCenter() end
function ISBaseIcon:reset() end
local player={getX=function() return 12 end,getY=function() return 12 end,getZ=function() return 0 end}
getPlayer=function() return player end
-- The game's own manager: removeIcon clears the icon's id from every category.
local manager={character=player,isSearchMode=true,iconCategories={forageIcons="forageIcons"},forageIcons={}}
function manager:removeIcon(icon)
    icon:reset()
    for category in pairs(self.iconCategories) do self[category][icon.iconID]=nil end
    icon:removeFromUIManager()
end
ISSearchManager={players={[player]=manager}}
ISSearchWindow={players={[player]={searchFocusCategory="None"}}}

-- One clue of each mod, both in reach, both placed.
local nhClues={{id="nh1",x=10,y=10,z=0,status="placed",recognised=false}}
local cfClues={{id="cf1",x=11,y=11,z=0,status="placed",recognised=false}}
package.loaded["NHShared/EngineAPI"]={GeneratedRuntime={clueTargets=function() return {nhClues[1]} end}}
package.loaded["ConspiracyFiles/EngineAPI"]={GeneratedRuntime={clueTargets=function() return {cfClues[1]} end}}
local NH=require("NHShared/ClueSearch")
local CF=require("ConspiracyFiles/ClueSearch")
assert(NH~=CF and NH.Icon~=CF.Icon,"two modules, two icon classes")

assert(NH.iconIdFor("x")~=CF.iconIdFor("x"),"No Help's icon ids are its own")
assert(NH.iconIdFor("x"):sub(1,8)=="nh-clue:","under No Help's own prefix")
assert(NH.ICON_TABLE~="clueIcons","and in No Help's own table")

for round=1,10 do
    NH.sync(); CF.sync()
    local nh=manager[NH.ICON_TABLE] and manager[NH.ICON_TABLE][NH.iconIdFor("nh1")]
    local cf=manager.clueIcons and manager.clueIcons[CF.iconIdFor("cf1")]
    assert(nh and nh.inUI,"No Help's icon survives the original mod's sync (round "..round..")")
    assert(cf and cf.inUI,"the original's icon survives No Help's sync (round "..round..")")
end
assert(NH.counters.added==1 and NH.counters.dropped==0,"No Help's icon was added once and never dropped")
assert(CF.counters.added==1 and CF.counters.dropped==0,"the original's icon likewise")
local ids=NH.state().icons
assert(#ids==1 and ids[1]=="nh1","No Help's state lists only its own icon")

-- The original's own table holds only its own icon, so its sync never sees
-- No Help's: nothing to drop, nothing to fight over.
for id in pairs(manager.clueIcons) do assert(id:sub(1,8)=="cf-clue:","only the original's ids in its table") end
-- Leaving search mode still clears No Help's icon through the game's manager.
manager.isSearchMode=false
NH.sync()
assert(not manager[NH.ICON_TABLE][NH.iconIdFor("nh1")],"search off removes No Help's icon")
print("nohelp icon isolation: own prefix and table; the two mods' syncs leave each other's icons alone")
