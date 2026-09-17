-- Clues are found by searching (P4-R132, stage 1): the Search Focus entry, what
-- the focus does to spotting, and when a clue has an icon. The rules are plain
-- Lua; the client module is driven against doubles of the game's foraging
-- classes shaped like the real ones (ISBaseIcon:derive, ISBaseIcon:new, the
-- manager's iconCategories and removeIcon).
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Rules=require("ConspiracyFiles/ClueSearchRules")

-- The category itself: shaped like the game's "Tracks", nothing to spawn.
local def=Rules.catDef({"Forest","TownZone"})
assert(def.name=="Clues" and Rules.CATEGORY=="Clues")
assert(def.categoryHidden==false,"the focus is listed")
assert(def.identifyCategoryPerk=="PlantScavenging" and def.identifyCategoryLevel==0,"available from the first day")
assert(def.zones.Forest==0 and def.zones.TownZone==0,"zero rolls in every zone it is asked about")
assert(def.chanceToCreateIcon==0 and def.chanceToMoveIcon==0,"never creates or moves a forage icon")
assert(def.focusChanceMin==0 and def.focusChanceMax==0,"choosing it never converts a forage find")
assert(#def.spriteAffinities==0)

-- Every zone the forage system knows is listed with zero rolls.
local forage={isInitialised=false,categoryDefinitions={Tracks={name="Tracks",zones={Forest=0,DeepForest=0}}},
    zoneDefinitions={{name="Farm"},{name="TownZone"}},
    defaultDefinitions={defaultCatDef={zones={Forest=0,Vegitation=0}}}}
local names=table.concat(Rules.zoneNames(forage),",")
assert(names=="DeepForest,Farm,Forest,TownZone,Vegitation","zone names: "..names)

-- Registration before the forage system starts joins the game's own list;
-- after, it is added through addCatDef, once.
assert(Rules.register(forage)=="listed")
assert(forage.categoryDefinitions.Clues and forage.categoryDefinitions.Clues.zones.Farm==0)
local added={}
local live={isInitialised=true,catDefs={},addCatDef=function(d,overwrite) added[#added+1]={d=d,overwrite=overwrite}; end}
live.addCatDef=function(d,overwrite) added[#added+1]={d=d,overwrite=overwrite}; live.catDefs[d.name]=d end
assert(Rules.register(live)=="added" and #added==1 and added[1].overwrite==false)
assert(Rules.register(live)=="present" and #added==1,"never added twice")
assert(Rules.register(nil)==nil)

-- The focus: faster and further with Clues, the game's own spotting otherwise.
assert(Rules.spotRate("Clues")==Rules.FOCUS_SPOT_RATE and Rules.FOCUS_SPOT_RATE>1)
assert(Rules.spotRate("None")==1 and Rules.spotRate(nil)==1 and Rules.spotRate("Stones")==1)
assert(Rules.reach("Clues",4)==4*Rules.FOCUS_REACH and Rules.reach("None",4)==4)
assert(Rules.reach("Clues",12,15)==15,"never past the game's vision cap")
Rules.debugSpotScale=10; assert(Rules.spotRate("None")==10); Rules.debugSpotScale=1

-- Icons: only in Search Mode, only placed and unrecognised clues, only near.
local clue={id="d1",x=10,y=10,z=0,status="placed",recognised=false}
assert(Rules.wantsIcon(clue,12,12,true))
assert(not Rules.wantsIcon(clue,12,12,false),"no icon without Search Mode")
assert(not Rules.wantsIcon({id="d1",x=10,y=10,z=0,status="pending"},12,12,true),"not before it is placed")
assert(not Rules.wantsIcon({id="d1",x=10,y=10,z=0,status="placed",recognised=true},12,12,true),"not once recognised")
assert(not Rules.wantsIcon(clue,10+Rules.ADD_RADIUS+1,10,true),"not from across the map")
-- Dropped: search off, gone, walked away, recognised after lingering.
assert(Rules.dropIcon(clue,12,12,false))
assert(Rules.dropIcon(nil,12,12,true),"a clue gone from the record")
assert(not Rules.dropIcon(clue,10+Rules.REMOVE_RADIUS-1,10,true),"between add and remove radius the icon stays")
assert(Rules.dropIcon(clue,10+Rules.REMOVE_RADIUS+1,10,true))
local seen={id="d1",x=10,y=10,z=0,status="placed",recognised=true}
assert(not Rules.dropIcon(seen,12,12,true,1000,1000+Rules.LINGER_MS-1),"the pin lingers after a spot")
assert(Rules.dropIcon(seen,12,12,true,1000,1000+Rules.LINGER_MS))
assert(Rules.dropIcon(seen,12,12,true,nil,5),"recognised some other way: dropped at once")
local add,drop=Rules.plan({clue,{id="d2",x=90,y=90,z=0,status="placed"},{id="d3",x=11,y=11,z=0,status="placed"}},
    {d3={},gone={}},12,12,true,0)
assert(table.concat(add,",")=="d1" and table.concat(drop,",")=="gone","plan: "..table.concat(add,",").." / "..table.concat(drop,","))
-- A car with a clue in it has been driven (stage 2): the icon on the old
-- square is dropped, and the clue (now at the car) gets one on the next pass.
local car={id="v1",x=30,y=10,z=0,status="placed",recognised=false,vehicle=true}
assert(Rules.dropIcon(car,30,12,true,nil,0,20,10),"the icon is not where the car is")
assert(not Rules.dropIcon(car,30,12,true,nil,0,30,10),"the icon is where the car is")
add,drop=Rules.plan({car},{v1={x=20,y=10}},30,12,true,0)
assert(table.concat(drop,",")=="v1" and #add==0,"moved: dropped this pass")
add,drop=Rules.plan({car},{},30,12,true,0)
assert(table.concat(add,",")=="v1","and added again at the car")
print("PASS clue search rules: focus entry, registration, spot rate and reach, icon add/remove, an icon follows a driven car")

-- The client module against doubles of the game's classes.
Events={OnTick={Add=function(f) Events.tick=f end,Remove=function() end}}
getDebug=function() return true end
local clock=0; getTimestampMs=function() return clock end
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
function ISBaseIcon:updateTimestamp() self.timeDelta=100 end
function ISBaseIcon:doVisionCheck() return 4 end
function ISBaseIcon:getIsSeen() return self.isSeen end
function ISBaseIcon:spotIcon() if not self.isSeen then self.isSeen=true; self.manager:spotIcon(self) end end
function ISBaseIcon:doUpdateEvents() end
function ISBaseIcon:addToUIManager() self.inUI=true end
function ISBaseIcon:removeFromUIManager() self.inUI=false end
function ISBaseIcon:findTextureCenter() end
function ISBaseIcon:reset() end
function ISBaseIcon:isInRangeOfPlayer() return true end
local px,py=12,12
local player={getX=function() return px end,getY=function() return py end}
getPlayer=function() return player end
local manager={character=player,isSearchMode=true,iconCategories={forageIcons="forageIcons"},forageIcons={},
    spotIcon=function() end}
function manager:removeIcon(icon)
    icon:reset()
    for category in pairs(self.iconCategories) do self[category][icon.iconID]=nil end
    icon:removeFromUIManager()
end
ISSearchManager={players={[player]=manager}}
local window={searchFocusCategory="None"}
ISSearchWindow={players={[player]=window}}
local clues={{id="d1",x=10,y=10,z=0,status="placed",recognised=false},{id="d2",x=80,y=80,z=0,status="placed",recognised=false}}
local recognisedCalls={}
ConspiracyFiles={GeneratedRuntime={
    clueTargets=function() return clues end,
    recognise=function(id,how) recognisedCalls[#recognisedCalls+1]=id..":"..how; clues[1].recognised=true; return true,true end,
}}
local C=require("ConspiracyFiles/ClueSearch")
assert(C.registered=="listed" and forageSystem.categoryDefinitions.Clues,"registered as the file loads")

assert(C.sync()==1,"one icon for the one clue in reach")
local icon=manager.clueIcons["cf-clue:d1"]
assert(icon and getmetatable(icon)==C.Icon and icon.clueId=="d1","our own class, keyed by the clue")
assert(manager.iconCategories.clueIcons=="clueIcons","managed by the game's manager, so its reset clears them")
assert(icon.inUI and icon.renderItemTexture==false,"on screen as a bare pin, never a picture of the item")
assert(icon.xCoord==10.5 and icon.yCoord==10.5 and icon.zCoord==0,"centred on the container square")

-- The focus changes the spot timer and the reach, through the class.
icon:updateTimestamp(); assert(icon.timeDelta==100,"no focus: the game's own timer")
assert(icon:doVisionCheck()==4)
window.searchFocusCategory="Clues"
icon:updateTimestamp(); assert(icon.timeDelta==100*Rules.FOCUS_SPOT_RATE,"Clues focus: faster")
assert(icon:doVisionCheck()==4*Rules.FOCUS_REACH,"Clues focus: further")
window.searchFocusCategory="Stones"
icon:updateTimestamp(); assert(icon.timeDelta==100,"another focus is no focus for clues")

-- Spotting recognises, once; the pin lingers, then goes.
clock=1000
icon:spotIcon(); icon:spotIcon()
assert(#recognisedCalls==1 and recognisedCalls[1]=="d1:search","spotting recognises the clue by search, once")
assert(C.spotted.d1 and C.spotted.d1.recognised==true)
C.sync(); assert(manager.clueIcons["cf-clue:d1"],"lingers right after the spot")
clock=1000+Rules.LINGER_MS
C.sync(); assert(not manager.clueIcons["cf-clue:d1"] and not icon.inUI,"dropped after lingering")
C.sync(); assert(not manager.clueIcons["cf-clue:d1"],"a recognised clue never gets a new icon")

-- Search Mode off drops every icon; the far clue appears when approached.
px,py=80,80; clues[2].recognised=false
assert(C.sync()==1 and manager.clueIcons["cf-clue:d2"])
manager.isSearchMode=false
assert(C.sync()==0,"no icons without Search Mode")
manager.isSearchMode=true
assert(C.sync()==1)
clues[2]=nil
assert(C.sync()==0,"a clue gone from the record loses its icon")

-- No manager yet (the game creates it with the player): nothing happens.
ISSearchManager.players={}
assert(C.sync()==0)
-- The tick handler is guarded and throttled.
for _=1,C.EVERY_TICKS*2 do Events.tick() end

-- Furniture blocks its own square; a clue in a counter is still seen from a
-- side with no wall that the survivor stands on or can see and reach.
function ISBaseIcon:getCanSeeThisUpdate() return false end
forageSystem.getLightLevelPenalty=function() return 1 end
forageSystem.lightPenaltyCutoff=50
local current={}
local function squareDouble(t)
    local sq={z=0,visible=true,walls={},blocked=false}
    for k,v in pairs(t or {}) do sq[k]=v end
    function sq:getZ() return self.z end
    function sq:isCanSee() return self.visible end
    function sq:getDarkMulti() return 3 end
    function sq:isBlockedTo() return self.blocked end
    function sq:isWallTo(side) return self.walls[side]==true end
    return sq
end
player.getZ=function() return 0 end
player.getCurrentSquare=function() return current end
local furniture=squareDouble()
local seeIcon=C.Icon:new(manager,{id="cf-clue:see",clueId="see",x=1,y=1,z=0})
seeIcon.square=furniture; seeIcon.player=0
seeIcon.adjacentSquares={north=current}
assert(seeIcon:getCanSeeThisUpdate(),"seen from the square next to it")
furniture.walls[current]=true
assert(not seeIcon:getCanSeeThisUpdate(),"never through a wall")
furniture.walls={}
furniture.visible=false
assert(seeIcon:getCanSeeThisUpdate(),"the shelf's own square need not be seen: its front is")
local across=squareDouble(); seeIcon.adjacentSquares={south=across}
assert(seeIcon:getCanSeeThisUpdate(),"seen from across the room")
across.visible=false
assert(not seeIcon:getCanSeeThisUpdate(),"never when no side of it is seen")
across.visible=true
across.blocked=true
assert(not seeIcon:getCanSeeThisUpdate(),"not when that side is blocked from the survivor")

-- ---------------------------------------------------------------------------
-- A clue in a car is pinned where the clue IS: the part, not the middle of the
-- car. The game's spot timer only fills while the survivor is inside the
-- icon's viewDistance (ISBaseIcon:updateSpotTimer), and at Foraging 0 in
-- daylight that is exactly minVisionRadius, 3.0 tiles - doVisionCheck clamps
-- the radius back up to it. A car's body blocks the squares it stands on, so
-- the middle of a car is further from any square the survivor can stand on at
-- its front or its back than the game will ever reach: a clue 3.54 tiles away
-- was not spotted in 156 s of real searching, with the icon on the car's
-- square, the sight test passing and the timer stuck at 0 of 2500
-- (20260917T215847-clue-field.txt).
local REACH=3.0     -- forageSystem.minVisionRadius: the reach at Foraging 0
local function gridSquare(x,y,z)
    local sq={}
    function sq:getX() return x end
    function sq:getY() return y end
    function sq:getZ() return z end
    return sq
end
local cell={}
function cell:getGridSquare(x,y,z) return gridSquare(math.floor(x),math.floor(y),math.floor(z)) end
getCell=function() return cell end
-- A pickup at 10767,10125 whose bed is two tiles behind its middle, as the
-- game's own area geometry puts it (vehicle:getAreaCenter(part:getArea())).
local bedCentre={}
function bedCentre:getX() return 10767.5 end
function bedCentre:getY() return 10123.4 end
local truck={}
function truck:getSquare() return gridSquare(10767,10125,0) end
function truck:getZ() return 0 end
function truck:getAreaCenter(area) if area=="TruckBed" then return bedCentre end end
local bedPart={area="TruckBed"}
function bedPart:getArea() return self.area end
function bedPart:getVehicle() return truck end
local bedContainer={}
function bedContainer:getVehiclePart() return bedPart end
package.loaded["ConspiracyFiles/WorldAccess"]={resolveVehicle=function() return bedContainer end}

local truckClue={id="v-bed",x=10767,y=10125,z=0,status="placed",recognised=false,
    vehicle=true,token="cf-v-bed",part="TruckBed"}
local sx,sy,sz=C.vehicleSpot(truckClue,player)
assert(sx==10767 and sy==10123 and sz==0,
    "the pin belongs on the bed of the truck, not in the middle of it: "..tostring(sx)..","..tostring(sy))
local function distance(ax,ay,bx,by) local dx,dy=ax-bx,ay-by; return math.sqrt(dx*dx+dy*dy) end
assert(distance(10767.5,10121.5,sx+0.5,sy+0.5)<=REACH,
    "the survivor at the tailgate is inside the game's reach of the bed")
assert(distance(10767.5,10121.5,10767.5,10125.5)>REACH,
    "and outside it of the car's middle, which is why the middle of a car is the wrong pin")
-- A part with no area to be at (an engine part, or a car script without one)
-- keeps the car's own square: a clue is never pinned nowhere.
bedPart.area=nil
clock=clock+C.VEHICLE_SPOT_MS
sx,sy,sz=C.vehicleSpot(truckClue,player)
assert(sx==10767 and sy==10125 and sz==0,"no area: the car's own square stands")
bedPart.area="TruckBed"
-- A car the game cannot find moves nothing, and the placement square stands.
package.loaded["ConspiracyFiles/WorldAccess"]={resolveVehicle=function() return nil,"vehicle-not-found" end}
clock=clock+C.VEHICLE_SPOT_MS
assert(C.vehicleSpot(truckClue,player)==nil,"a car that is not there moves nothing")
-- End to end: the icon goes up on the part's square.
package.loaded["ConspiracyFiles/WorldAccess"]={resolveVehicle=function() return bedContainer end}
clock=clock+C.VEHICLE_SPOT_MS
clues[1],clues[2]=truckClue,nil
px,py=10767,10121
ISSearchManager.players={[player]=manager}
assert(C.sync()==1,"the clue in the car gets an icon")
local bedIcon=manager.clueIcons["cf-clue:v-bed"]
assert(bedIcon and bedIcon.xCoord==10767.5 and bedIcon.yCoord==10123.5,
    "and it is centred on the bed's square, within reach of the tailgate")

-- The check helper goes through the runtime, debug only.
assert(C.debugRecognise("d9")==true and recognisedCalls[#recognisedCalls]=="d9:debug")
getDebug=function() return false end
assert(C.debugRecognise("d9")==false)
print("PASS clue search client: icons of our own class follow Search Mode, focus speeds and extends spotting, a spot recognises once")
