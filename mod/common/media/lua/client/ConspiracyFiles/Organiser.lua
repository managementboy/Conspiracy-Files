-- The pocket organiser: the thing the survivor reads the investigation on.
--
-- Owner, 2026-09-12: "why not drop the notebook completely and replace it with
-- a PalmPilot kind of device that our survivor has on him?" The PalmPilot is
-- 1996 and this is July 1993, so the object is a pocket electronic organiser -
-- the kind sold in every mall in Kentucky that summer. The item script
-- (media/scripts/conspiracyfiles_organiser.txt) declares it as a radio, which
-- is what buys the battery, the on/off state and the save round-trip from the
-- game rather than from us.
--
-- It is a Lectromax Dataline 160: Lectromax Manufacturing makes the appliances
-- in this world, so the hardware is theirs and only Knox.OS is ours.
--
-- WHAT THIS IS NOT, and must never become: the record. Owner decision P4-R80 -
-- the ledger stays the record and the device is a reader. Lose it, burn it,
-- leave it in a car, and you lose a convenience, never a case. Reading also
-- never depends on it alone: the Papers are still issued and still readable,
-- so there is always a way back (the obligation P4-R80 left open). The
-- organiser is the better surface, not the only one.
--
-- Every engine call is colon syntax on an explicit receiver and pcall-guarded:
-- this runs from game-start events where a throw is silent and permanent.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local O=ConspiracyFiles.Organiser or {}
ConspiracyFiles.Organiser=O
O.TYPE="ConspiracyFiles.Organiser"
-- On the item, not in a saved flag of ours, so "already issued" survives a
-- reload exactly as the Papers' mark does.
local MARK="cfOrganiser"

local function log(message) CFLog.message("casefile","note",message) end
local function safe(fn,...)
    local ok,value=pcall(fn,...)
    if ok then return value end
    return nil
end

-- ANY organiser the player is carrying reads the case. Owner, 2026-09-12: a
-- survivor who dies and starts again finds a machine - their own, on their own
-- corpse, or one from a desk - and knows the investigation again, because the
-- record was never kept in the character. Ours is marked only so it is issued
-- once and kept favourite; a found one is just as good a reader.
function O.held(player)
    player=player or (getPlayer and getPlayer())
    local inventory=player and safe(function() return player:getInventory() end)
    local items=inventory and inventory.getItems and inventory:getItems()
    if not items then return nil end
    local found
    for i=0,items:size()-1 do
        local item=items:get(i)
        local ok,full=pcall(function() return item:getFullType() end)
        if ok and full==O.TYPE then
            local md=item.getModData and item:getModData()
            if md and md[MARK] then return item end   -- ours, if we have it
            found=found or item                       -- otherwise whatever we found
        end
    end
    return found
end

-- Ours specifically: the one that was issued, for deciding whether to issue
-- another. A found machine must not stop a new survivor being given one, and
-- must not be renamed or claimed either.
function O.issued(player)
    player=player or (getPlayer and getPlayer())
    local inventory=player and safe(function() return player:getInventory() end)
    local items=inventory and inventory.getItems and inventory:getItems()
    if not items then return nil end
    for i=0,items:size()-1 do
        local item=items:get(i)
        local md=item and item.getModData and item:getModData()
        if md and md[MARK] then return item end
    end
    return nil
end

-- Power, through the game's own device data. Returns nil when the item is not
-- a radio at all (a future reskin onto something else must not crash reading),
-- which callers treat as "no battery model, always readable".
function O.power(item)
    local data=item and safe(function() return item:getDeviceData() end)
    if not data then return nil end
    local battery=safe(function() return data:getIsBatteryPowered() end)
    if battery==false then return nil end
    return safe(function() return data:getPower() end)
end

function O.readable(item)
    if not item then return false,"no organiser" end
    local power=O.power(item)
    if power==nil then return true end
    if power<=0 then return false,"flat battery" end
    return true
end

-- Issue one, the same way the Papers are issued. A new character gets an
-- organiser; an existing save gets one the first time it loads under a build
-- that has this.
function O.give(player)
    player=player or (getPlayer and getPlayer())
    if not player then return nil,"no player" end
    local existing=O.issued(player)
    if existing then return existing end
    local item=safe(function() return player:getInventory():AddItem(O.TYPE) end)
    if not item then return nil,"could not create "..O.TYPE end
    safe(function()
        item:getModData()[MARK]=true
        -- Favourite for the same reason as the Papers: the game then warns
        -- before it is discarded with a bag. It is not indestructible, and
        -- nothing here pretends otherwise.
        item:setFavorite(true)
    end)
    -- Switched on, so the first read does not begin with a puzzle. The battery
    -- the game gives it is the battery it has; when that runs out the survivor
    -- says so and the Papers still read.
    safe(function()
        local data=item:getDeviceData()
        if data then data:setIsTurnedOn(true) end
    end)
    log("organiser issued")
    return item
end

-- Reading takes the MAIN hand. Owner, 2026-09-12, on giving the device a
-- stylus: "it requires the device to be held in the main hand (making it also
-- dangerous to read, and therefore part of the PZ philosophy)". So opening
-- Knox.OS equips the organiser through the game's own action - the survivor
-- puts down whatever they were holding - and a player who is jumped while
-- reading pays for it exactly as they would for reading a book.
function O.read(player)
    player=player or (getPlayer and getPlayer())
    local item=O.held(player)
    local ok,why=O.readable(item)
    if not ok then
        local voice=ConspiracyFiles.PlayerVoice
        if item and why=="flat battery" and voice and voice.speak then
            safe(voice.speak,player,"The screen is dead. It needs a battery.","Flat battery")
        end
        log("organiser not read: "..tostring(why))
        return false,why
    end
    local screen=ConspiracyFiles.OrganiserScreen
    if not screen or not screen.open then return false,"no reading surface loaded" end
    -- Already in the hand: open at once.
    local primary=safe(function() return player:getPrimaryHandItem() end)
    if primary==item then safe(screen.open); log("organiser read"); return true end
    -- Otherwise take it in hand first, the way the game equips anything, and
    -- open when the survivor actually has it. Never force the item into the
    -- slot: an equip that the player interrupts must leave them holding what
    -- they chose, not a computer.
    -- require() on a timed action returns the module's own value, which for
    -- these files is not the class - the class arrives as a GLOBAL. Indexing
    -- the return value threw "attempted index: new of non-table" every time
    -- the device was opened (knox check, 2026-09-12).
    local queued=safe(function()
        require("TimedActions/ISEquipWeaponAction")
        ISTimedActionQueue.add(ISEquipWeaponAction:new(player,item,50,true,false))
        return true
    end)
    if not queued then
        safe(function() player:setPrimaryHandItem(item) end)
    end
    O.pendingOpen={player=player,item=item,tries=0}
    log("organiser: taking it in hand")
    return true
end

-- The machine is either in your hand and readable, or away and not.
--
-- Owner, 2026-09-12: "equipping it in your main hand opens it, and unequipping
-- closes it. Inspecting an object does not open it." So the hand IS the switch:
-- no menu item to read, no window that appears over a document you just picked
-- up. Take it out to read; put it away to stop.
function O.handTick()
    local player=getPlayer and getPlayer()
    if not player then return end
    local screen=ConspiracyFiles.OrganiserScreen
    if not screen then return end
    local primary=safe(function() return player:getPrimaryHandItem() end)
    local ours=false
    if primary then
        local full=safe(function() return primary:getFullType() end)
        ours=full==O.TYPE
    end
    if ours and not screen.window then
        safe(screen.open)
        log("organiser in hand: Knox.OS opened")
    elseif not ours and screen.window and not screen.window.booting then
        safe(screen.close)
        log("organiser put away: Knox.OS closed")
    end
end

-- One tick watcher: open Knox.OS the moment the organiser is really in the
-- main hand, and give up quietly if the player cancelled the equip.
function O.tick()
    O.handTick()
    local pending=O.pendingOpen
    if not pending then return end
    pending.tries=pending.tries+1
    local player=pending.player
    local primary=player and safe(function() return player:getPrimaryHandItem() end)
    if primary==pending.item then
        O.pendingOpen=nil
        local screen=ConspiracyFiles.OrganiserScreen
        if screen and screen.open then safe(screen.open); log("organiser read") end
    elseif pending.tries>600 then
        O.pendingOpen=nil
        log("organiser: never reached the hand")
    end
end

-- The menu on the item itself. Only on our own organiser, and only in the
-- player's own inventory, so a stranger's organiser on a corpse offers nothing
-- until the mod has something honest to say about somebody else's notes.
function O.fill(playerNum,context,items)
    if not context or playerNum~=0 then return end
    local subject
    for _,entry in ipairs(items or {}) do
        local item=entry
        if type(entry)=="table" and entry.items then item=entry.items[1] end
        local md=item and item.getModData and item:getModData()
        if md and md[MARK] then subject=item; break end
    end
    if not subject then return end
    local player=getSpecificPlayer and getSpecificPlayer(playerNum)
    if not player or subject:getOutermostContainer()~=player:getInventory() then return end
    -- The item is declared as a radio so the game handles its battery, which
    -- also makes the game offer its radio panel - a frequency dial and a volume
    -- slider on a pocket organiser (owner, 2026-09-12: "it is also showing the
    -- interface to a radio when opening it... not pretty"). Take that option
    -- away for this item, and leave the battery one, which is real.
    safe(function()
        local name=getText("IGUI_DeviceOptions")
        if name and context.removeOptionByName then context:removeOptionByName(name) end
    end)
    local option=context:addOption("Read the Investigation",nil,function() O.read(player) end)
    -- Kept because it is the discoverable way in; all it does is put the
    -- machine in your hand, which is what actually opens it.
    if option then
        local ok,readable=true,O.readable(subject)
        option.notAvailable=not (ok and readable)
        if not readable then option.toolTip=nil end
    end
end

-- The radio panel is refused at the door, not just left off the menu.
--
-- The game offers "Device Options" for any radio held in a hand - and this one
-- is always in a hand, because reading it equips it - so removing the menu
-- entry was never enough: anything else that opens the panel would still get
-- there (owner, 2026-09-12: "the radio menu is still open"). So the opener
-- itself is wrapped: asked to show a frequency dial for a Lectromax Dataline,
-- it opens Knox.OS instead, which is what the player wanted anyway.
function O.blockRadioPanel()
    if O.panelBlocked then return true end
    local ok=pcall(require,"ISUI/ISRadioAndTvMenu")
    if not ok or not ISRadioAndTvMenu or type(ISRadioAndTvMenu.openRadioPanel)~="function" then return false end
    O.panelBlocked=true
    local original=ISRadioAndTvMenu.openRadioPanel
    ISRadioAndTvMenu.openRadioPanel=function(player,item,...)
        local md=item and item.getModData and safe(function() return item:getModData() end)
        local full=item and safe(function() return item:getFullType() end)
        if full==O.TYPE or (type(md)=="table" and md[MARK]) then
            log("radio panel refused; opening Knox.OS")
            O.read(player)
            return
        end
        return original(player,item,...)
    end
    return true
end

function O.install()
    O.blockRadioPanel()
    if Events and Events.OnFillInventoryObjectContextMenu and not O.menuHooked then
        O.menuHooked=true
        Events.OnFillInventoryObjectContextMenu.Add(function(...) safe(O.fill,...) end)
    end
end

if Events and Events.OnTick and not O.tickHooked then
    O.tickHooked=true
    Events.OnTick.Add(function() safe(O.tick) end)
end

-- The machine boots with the game, so the player sees the mod start rather than
-- wondering whether it is there (owner has asked for this since 2026-09-11).
if Events and Events.OnGameStart and not O.bootHooked then
    O.bootHooked=true
    Events.OnGameStart.Add(function()
        safe(function()
            local apps=ConspiracyFiles.KnoxApps
            if apps and apps.rememberMe then apps.rememberMe() end
            local screen=ConspiracyFiles.OrganiserScreen
            if screen and screen.boot then screen.boot() end
        end)
    end)
end

if Events and not O.startHooked then
    O.startHooked=true
    local function issue() safe(O.give) end
    if Events.OnCreatePlayer then Events.OnCreatePlayer.Add(function() issue() end) end
    if Events.OnGameStart then Events.OnGameStart.Add(function() issue(); safe(O.install) end) end
end
O.install()

return O
