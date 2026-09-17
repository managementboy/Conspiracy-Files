-- Clues are found by searching (P4-R132, docs/design/SEARCH_TO_FIND.md).
--
-- Stage 1: SEARCH and RECOGNISE. With the game's Search Mode on, every clue
-- nobody has recognised yet gets an icon of our own class at its container's
-- square, the way the game marks a stash. The game's own spotting runs it:
-- the timer that fills while the spot is in view, sneaking and aiming, light,
-- weather, traits. When it is spotted the game's pin bounces over the spot and
-- the runtime recognises the clue, which turns the plain item into evidence.
-- Nothing is written over the survivor's head.
--
-- The Investigate Area window gains a Search Focus entry, "Clues". The game's
-- focus only changes its own forage icons, so our icons read the choice
-- themselves: spotted twice as fast and from half as far again.
--
-- Foraging internals belong to the game and a game update can change them, so
-- every contact with them is in this one file and guarded.
require "Foraging/forageSystem"
require "Foraging/ISBaseIcon"
local Rules=require("ConspiracyFiles/ClueSearchRules")
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local C=ConspiracyFiles.ClueSearch or {}
ConspiracyFiles.ClueSearch=C
C.Rules=Rules
local function log(message) CFLog.message("search","note",message) end

-- The Search Focus entry, registered as the file loads: before the forage
-- system imports its categories when the map zones load.
if not C.registered then
    local ok,how,why=pcall(Rules.register,forageSystem)
    C.registered=ok and how or false
    if not (ok and how) then log("Clues focus not registered: "..tostring(ok and why or how)) end
end

-- Spotted clues this game session: docId -> {at=ms, recognised=bool, why}.
C.spotted=C.spotted or {}
C.counters=C.counters or {added=0,dropped=0,spotted=0,recognised=0}

local function now() return getTimestampMs and getTimestampMs() or 0 end
local function focusOf(character)
    local window=ISSearchWindow and ISSearchWindow.players and ISSearchWindow.players[character]
    return window and window.searchFocusCategory or nil
end
C.focusOf=focusOf
local function iconIdFor(docId) return "cf-clue:"..tostring(docId) end
C.iconIdFor=iconIdFor

-- A clue is in furniture, and furniture blocks its own square: the game's
-- test (the square is not blocked to the survivor's) failed for a clue on a
-- shelf from the very next square, and the game did not even count the shelf's
-- own square as seen (Linux check, 2026-09-16). So the spot also counts as seen
-- when it is lit as the game requires and one of its sides, with no wall
-- between, is the survivor's square or a square the survivor can see and
-- reach: seeing the front of the furniture is seeing it.
local function tooDark(character,square,playerNum)
    local lightPenalty=1-forageSystem.getLightLevelPenalty(character,square,true)
    return lightPenalty>=(forageSystem.lightPenaltyCutoff/100) and square:getDarkMulti(playerNum)<=2.0
end
function C.seenFromSide(character,square,playerNum,sides)
    if not (square and character) or square:getZ()~=character:getZ() then return false end
    if tooDark(character,square,playerNum) then return false end
    local current=character:getCurrentSquare()
    if not current then return false end
    sides=sides or {square:getN(),square:getS(),square:getE(),square:getW()}
    for _,side in pairs(sides) do
        if side==current or (side:isCanSee(playerNum) and not side:isBlockedTo(current)) then
            if not square:isWallTo(side) then return true end
        end
    end
    return false
end
-- Could the survivor see this spot now, as the wordless cue needs it (stage 2):
-- same floor; same room, or both out of doors; lit as the game requires; and in
-- view the game's way or from a side as above. Returns true, or false and why.
function C.seesSpot(character,square)
    if not (square and character) then return false,"no square" end
    if square:getZ()~=character:getZ() then return false,"other floor" end
    local current=character:getCurrentSquare()
    if not current then return false,"no square" end
    local playerNum=character:getPlayerNum()
    if square~=current then
        local here,there=current:getRoom(),square:getRoom()
        if (here or there) and here~=there then return false,"other room" end
    end
    if tooDark(character,square,playerNum) then return false,"too dark" end
    if square==current then return true end
    if square:isCanSee(playerNum) and not square:isBlockedTo(current) then return true end
    if C.seenFromSide(character,square,playerNum) then return true end
    return false,"not in view"
end

-- Where a clue in a car is now. A car is found by the mark on its part, near
-- the survivor, so a driven car takes its clue's icon (and cue) with it. Only a
-- car the game has loaded can be found; otherwise nil and the placement square
-- stands. Cached briefly: this walks the cell's vehicles.
C.vehicleSpots=C.vehicleSpots or {}
C.VEHICLE_SPOT_MS=2000
function C.vehicleSpot(clue,player)
    if not (clue and clue.vehicle and clue.token and clue.part and player) then return nil end
    local t=now()
    local cached=C.vehicleSpots[clue.id]
    if cached and t-cached.at<C.VEHICLE_SPOT_MS then return cached.x,cached.y,cached.z end
    local x,y,z
    local World=require("ConspiracyFiles/WorldAccess")
    local here={vehiclePart=clue.part,x=math.floor(player:getX()),y=math.floor(player:getY()),z=math.floor(player:getZ())}
    local ok,container=pcall(World.resolveVehicle,here,clue.token,Rules.REMOVE_RADIUS)
    if ok and container then
        pcall(function()
            local square=container:getVehiclePart():getVehicle():getSquare()
            x,y,z=square:getX(),square:getY(),square:getZ()
        end)
    end
    C.vehicleSpots[clue.id]={at=t,x=x,y=y,z=z}
    return x,y,z
end
-- The clue rows with each car's clue moved to where its car is now.
function C.liveClues(player)
    local R=ConspiracyFiles.GeneratedRuntime
    local clues=(R and R.clueTargets) and R.clueTargets() or {}
    for i,clue in ipairs(clues) do
        if clue.vehicle and clue.status=="placed" and not clue.recognised then
            local x,y,z=C.vehicleSpot(clue,player)
            if x then
                local moved={}
                for k,v in pairs(clue) do moved[k]=v end
                moved.x,moved.y,moved.z=x,y,z
                clues[i]=moved
            end
        end
    end
    return clues
end

-- The icon class. Only ever built while the game's ISBaseIcon exists, and kept
-- on our own table rather than as a global.
if ISBaseIcon and not C.Icon then
    C.Icon=ISBaseIcon:derive("ISClueIcon")
end
local ISClueIcon=C.Icon
if ISClueIcon then
    function ISClueIcon:isValid() return self:isInRangeOfPlayer(40) end
    -- The spot timer fills faster with the Clues focus.
    function ISClueIcon:updateTimestamp()
        ISBaseIcon.updateTimestamp(self)
        self.timeDelta=self.timeDelta*Rules.spotRate(focusOf(self.character))
    end
    -- And the spot is seen from further away.
    function ISClueIcon:doVisionCheck()
        local distance=ISBaseIcon.doVisionCheck(self)
        return Rules.reach(focusOf(self.character),distance,forageSystem.visionRadiusCap)
    end
    -- A clue is in furniture, and furniture blocks its own square: the game's
    -- test (the square is not blocked to the survivor's) failed for a clue on
    -- a shelf from the very next square, and the game did not even count the
    -- shelf's own square as seen (Linux check, 2026-09-16). So the spot also
    -- counts as seen when it is lit as the game requires and one of its sides,
    -- with no wall between, is the survivor's square or a square the survivor
    -- can see and reach: seeing the front of the furniture is seeing it.
    function ISClueIcon:getCanSeeThisUpdate()
        if ISBaseIcon.getCanSeeThisUpdate(self) then return true end
        return C.seenFromSide(self.character,self.square,self.player,self.adjacentSquares)
    end
    -- The base class reads an item list a clue icon never has.
    function ISClueIcon:checkForPoison() self.isKnownPoison=false end
    function ISClueIcon:spotIcon()
        local was=self:getIsSeen()
        ISBaseIcon.spotIcon(self)
        if not was and self:getIsSeen() then
            local ok,why=pcall(C.onSpotted,self)
            if not ok then log("spot handler failed: "..tostring(why)) end
        end
    end
    function ISClueIcon:new(manager,icon)
        local o=ISBaseIcon.new(self,manager,icon)
        o.iconClass="clueObject"
        o.isValidSquare=true
        o.clueId=icon.clueId
        return o
    end
end

-- The game's own manager for this survivor, if it exists. Never created here.
local function managerFor(player)
    return ISSearchManager and ISSearchManager.players and ISSearchManager.players[player] or nil
end
C.managerFor=managerFor

local function iconsOf(manager)
    if not manager.clueIcons then
        manager.clueIcons={}
        manager.iconCategories.clueIcons="clueIcons"
    end
    return manager.clueIcons
end

local function addIcon(manager,clue)
    local icons=iconsOf(manager)
    local id=iconIdFor(clue.id)
    if icons[id] then return icons[id] end
    local itemObj=instanceItem("Base.Plank")
    local icon=ISClueIcon:new(manager,{
        id=id,clueId=clue.id,
        x=clue.x+0.5,y=clue.y+0.5,z=clue.z,
        itemObj=itemObj,itemType=itemObj:getFullType(),isBonusIcon=false,
    })
    icons[id]=icon
    icon:doUpdateEvents(true)
    icon:addToUIManager()
    icon:findTextureCenter()
    -- The pin, never a picture of the thing: a clue is not named until it is
    -- recognised, and the pin says only "here".
    icon.renderItemTexture=false
    C.counters.added=C.counters.added+1
    return icon
end

function C.onSpotted(icon)
    local id=icon and icon.clueId
    if not id then return end
    local entry=C.spotted[id] or {}
    entry.at=entry.at or now()
    C.spotted[id]=entry
    C.counters.spotted=C.counters.spotted+1
    local R=ConspiracyFiles.GeneratedRuntime
    if R and R.recognise then
        local ok,done,why=pcall(R.recognise,id,"search")
        entry.recognised=ok and done==true
        entry.why=ok and why or done
        if entry.recognised then C.counters.recognised=C.counters.recognised+1 end
    end
end

-- One pass: bring the icons in line with the record and the survivor.
function C.sync()
    local player=getPlayer and getPlayer()
    local manager=player and managerFor(player)
    if not manager or not ISClueIcon then return 0 end
    local clues=C.liveClues(player)
    local icons=manager.clueIcons or {}
    local byDoc={}
    for _,icon in pairs(icons) do
        if icon.clueId then
            local spot=C.spotted[icon.clueId]
            byDoc[icon.clueId]={icon=icon,spottedAt=(icon:getIsSeen() and spot and spot.at) or nil,
                x=icon.xCoord and math.floor(icon.xCoord),y=icon.yCoord and math.floor(icon.yCoord)}
        end
    end
    local searching=manager.isSearchMode==true
    local add,drop=Rules.plan(clues,byDoc,player:getX(),player:getY(),searching,now())
    for _,id in ipairs(drop) do
        local entry=byDoc[id]
        if entry then
            pcall(function() manager:removeIcon(entry.icon) end)
            C.counters.dropped=C.counters.dropped+1
        end
    end
    if searching then
        local byId={}
        for _,clue in ipairs(clues) do byId[clue.id]=clue end
        for _,id in ipairs(add) do
            local ok,why=pcall(addIcon,manager,byId[id])
            if not ok then log("could not add a clue icon: "..tostring(why)) end
        end
    end
    local n=0
    for _ in pairs(manager.clueIcons or {}) do n=n+1 end
    return n
end

-- For checks (stage 3) and development: recognise a clue without searching.
function C.debugRecognise(docId)
    local R=ConspiracyFiles.GeneratedRuntime
    if not (getDebug and getDebug()) or not R or not R.recognise then return false,"unavailable" end
    return R.recognise(docId,"debug")
end

-- What a check needs to read: is the focus there, which icons exist.
function C.state()
    local player=getPlayer and getPlayer()
    local manager=player and managerFor(player)
    local ids={}
    for _,icon in pairs(manager and manager.clueIcons or {}) do
        ids[#ids+1]=tostring(icon.clueId)..(icon:getIsSeen() and "*" or "")
    end
    table.sort(ids)
    return {
        registered=C.registered,
        focusDefined=forageSystem.catDefs and forageSystem.catDefs[Rules.CATEGORY]~=nil,
        searching=manager and manager.isSearchMode==true or false,
        icons=ids,
        counters=C.counters,
    }
end

local ticks=0
C.EVERY_TICKS=15
if C.handler then Events.OnTick.Remove(C.handler) end
C.handler=function()
    ticks=ticks+1
    if ticks%C.EVERY_TICKS~=0 then return end
    local ok,why=pcall(C.sync)
    if not ok then
        C.failures=(C.failures or 0)+1
        if C.failures<=3 then log("sync failed: "..tostring(why)) end
    end
end
Events.OnTick.Add(C.handler)
return C
