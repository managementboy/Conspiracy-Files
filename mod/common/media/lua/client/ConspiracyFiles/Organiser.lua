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

-- SINGLE PLAYER ONLY, like everything else in this mod. Runtime.initialize
-- sets Runtime.disabled and returns on isClient()/isServer(), and every other
-- client feature guards the same way - but the organiser did not, and it was
-- the mod's only unguarded feature. In multiplayer it would have been issued
-- on OnCreatePlayer, force-equipped on OnGameStart and opened Knox.OS with no
-- runtime behind it: an empty device that writes notes and to-dos into
-- client-side ModData nothing reconciles. The mod sends no commands and
-- transmits no table anywhere, so there is nothing to synchronise and nothing
-- to be gained by pretending; it stays out of the way instead.
--
-- A device that refuses to appear is the honest failure here. An empty one
-- that takes the survivor's hand and shows a case that does not exist is not.
-- Asked every time, deliberately. Caching it looks free - the answer cannot
-- change inside a session - but the FIRST call happens when this file loads,
-- before there is a world, and a wrong answer cached then disables the device
-- for the whole session with no way back. The saving was two engine calls per
-- tick against a handler that measures 0.0033 ms; not worth a cliff.
local function multiplayer() return (isClient and isClient()) or (isServer and isServer()) end
O.multiplayer=multiplayer

local function safe(fn,...)
    local ok,value=pcall(fn,...)
    if ok then return value end
    return nil
end

-- Every organiser the survivor is carrying, INCLUDING the ones inside bags.
--
-- getItems() returns only what is directly in the main inventory: a worn
-- backpack is one item in that list and its contents are in the bag's own
-- container, not in this one. So an organiser stashed in a bag was invisible
-- to O.issued, which meant O.give - called on every OnGameStart - concluded
-- the survivor had never been issued one and added ANOTHER. Every reload with
-- the device in a bag produced one more organiser.
--
-- Reachable in ordinary play: it is a pocket device and players put things in
-- bags. setFavorite only warns before DISCARDING it with a bag, which is a
-- different act.
--
-- WALKED BY HAND, deliberately. The first version of this used the engine's
-- getAllTypeRecurse and found nothing at all: that call matches an item's
-- short type, not its fullType, so "ConspiracyFiles.Organiser" matched
-- nothing and came back as a valid EMPTY list - which a nil-check cannot
-- catch. The organiser stopped being issued entirely, and only running the
-- real game said so (checks/pdagame.sh, 2026-09-13). Comparing getFullType
-- ourselves is the same test the flat scan always used, so the only thing
-- that changed is that bags are now looked inside.
local function collectOrganisers(container,out,depth)
    if not container or depth>4 then return out end
    local items=container.getItems and container:getItems()
    if not items then return out end
    for i=0,items:size()-1 do
        local item=items:get(i)
        if item then
            local ok,full=pcall(item.getFullType,item)
            if ok and full==O.TYPE then out[#out+1]=item end
            -- Anything with an inventory of its own is a bag; look inside.
            -- Depth-capped rather than cycle-tracked: four is deeper than the
            -- game lets a survivor nest containers.
            --
            -- The whole descent is inside a pcall because a plain
            -- InventoryItem has no getInventory at all, and merely REACHING
            -- for a method a Java object does not have can throw through this
            -- bridge rather than yielding nil. An unguarded `item.getInventory
            -- and ...` therefore threw on the first ordinary item in the
            -- survivor's pockets, took the whole walk with it, and stopped the
            -- organiser being found or issued at all.
            local ok2,inner=pcall(function()
                return item.getInventory and item:getInventory() or nil
            end)
            if ok2 and inner and inner~=container then
                collectOrganisers(inner,out,depth+1)
            end
        end
    end
    return out
end
local function carriedOrganisers(player)
    local inventory=player and safe(player.getInventory,player)
    if not inventory then return {} end
    return collectOrganisers(inventory,{},0)
end

-- ANY organiser the player is carrying reads the case. Owner, 2026-09-12: a
-- survivor who dies and starts again finds a machine - their own, on their own
-- corpse, or one from a desk - and knows the investigation again, because the
-- record was never kept in the character. Ours is marked only so it is issued
-- once and kept favourite; a found one is just as good a reader.
-- Walks the survivor's inventory, so it is not free and must not be called
-- per frame. It used to allocate a fresh closure for EVERY ITEM on the way
-- past - a pcall wrapping a closure, per item, per call - and the screen's
-- powerCheck called it sixty times a second. `safe` and `pcall` both take the
-- receiver as an argument, so none of that allocation was ever needed.
function O.held(player)
    player=player or (getPlayer and getPlayer())
    local found
    for _,item in ipairs(carriedOrganisers(player)) do
        local md=item.getModData and item:getModData()
        if md and md[MARK] then return item end   -- ours, if we have it
        found=found or item                       -- otherwise whatever we found
    end
    return found
end

-- Ours specifically: the one that was issued, for deciding whether to issue
-- another. A found machine must not stop a new survivor being given one, and
-- must not be renamed or claimed either.
function O.issued(player)
    player=player or (getPlayer and getPlayer())
    for _,item in ipairs(carriedOrganisers(player)) do
        local md=item.getModData and item:getModData()
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

-- The hardware, as a 1993 pocket machine actually behaved -----------------
--
-- Everything here is a property of the DEVICE, not of the case. P4-R80 is the
-- line that must not be crossed: losing or flattening the machine costs
-- convenience, never the investigation. The ledger lives in the world, so a
-- dead organiser is an inconvenience and a found one reads the case again.

O.LOW_POWER=0.20   -- below this the machine says so, as a Palm's warning did
O.LAMP_MIN=0.10    -- a backlight will not run a dying cell

-- The stores that live in the machine's RAM rather than in the world: the
-- survivor's own notes and to-dos. The discovery ledger is NOT here and must
-- never be, because that is the case.
local VOLATILE={"ConspiracyFiles.KnoxNotes","ConspiracyFiles.KnoxToDo"}
local ASLEEP="cfMemoryAsleep"     -- the cell died; the stores are set aside
local RESTORED="cfMemoryRestored" -- and came back, for the boot screen to say

function O.low(item)
    local power=O.power(item)
    return power~=nil and power>0 and power<O.LOW_POWER
end

-- A dead cell costs ACCESS, never the data (owner, 2026-09-13). The stores are
-- moved aside rather than cleared, so a flat machine shows you nothing and a
-- fresh cell gives you everything back. The realism is in the interruption,
-- not in punishing the player for a battery.
--
-- The destructive version - a real Palm losing battery-backed RAM for good -
-- is the future hard mode, and it needs the PC sync to exist first so there is
-- something to have failed to back up to. See docs/design/KNOX_OS.md.
function O.suspendMemory(item)
    if not item then return false end
    local md=safe(function() return item:getModData() end)
    if not md or md[ASLEEP] then return false end
    local moved=0
    for _,tag in ipairs(VOLATILE) do
        safe(function()
            local root=ModData and ModData.getOrCreate(tag)
            if not root then return end
            if type(root.items)=="table" and #root.items>0 then
                root.backup=root.items
                moved=moved+#root.items
            end
            root.items={}
        end)
    end
    md[ASLEEP]=true
    log("organiser memory offline: flat cell set aside "..moved.." entries")
    return true
end

-- A fresh cell. Everything comes back.
function O.restoreMemory(item)
    if not item then return false end
    local md=safe(function() return item:getModData() end)
    if not md or not md[ASLEEP] then return false end
    if (O.power(item) or 0)<=0 then return false end
    local back=0
    for _,tag in ipairs(VOLATILE) do
        safe(function()
            local root=ModData and ModData.getOrCreate(tag)
            if not root then return end
            if type(root.backup)=="table" then
                root.items=root.backup
                back=back+#root.backup
                root.backup=nil
            end
        end)
    end
    md[ASLEEP]=nil
    md[RESTORED]=true
    log("organiser memory restored: "..back.." entries back from backup")
    return true
end

function O.memoryAsleep(item)
    local md=item and safe(function() return item:getModData() end)
    return (md and md[ASLEEP]) and true or false
end

function O.memoryRestored(item)
    local md=item and safe(function() return item:getModData() end)
    return (md and md[RESTORED]) and true or false
end

-- Cleared once the player has seen the boot screen carrying the notice, so the
-- message is not lost in the same instant it appears.
function O.clearMemoryNotice(item)
    local md=item and safe(function() return item:getModData() end)
    if md and md[RESTORED] then md[RESTORED]=nil; return true end
    return false
end

-- Checked where it is cheap and where it matters: when the machine is picked
-- up, when it is switched on, and when the lamp finishes a cell off. NOT every
-- tick - a per-tick battery poll is the class of cost that was stripped out of
-- this file on 2026-09-12.
function O.checkPower(item)
    item=item or O.held()
    local power=O.power(item)
    if power==nil then return power end
    if power<=0 then O.suspendMemory(item) else O.restoreMemory(item) end
    return power
end

-- Is there a cell in it at all? getPower() alone does not answer that: a
-- device with the battery pulled out can still report a power figure, so the
-- machine stayed lit in the owner's hand with no battery in it (2026-09-13).
function O.hasCell(item)
    if not item then return false end
    local data=safe(function() return item:getDeviceData() end)
    if not data then return true end          -- no battery model: always on
    local fitted=safe(function() return data:getHasBattery() end)
    if fitted==false then return false end
    local power=O.power(item)
    return power==nil or power>0
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
    if multiplayer() then return nil,"multiplayer" end
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
-- MEASURED, 2026-09-13, in a real game on real hardware: this handler cost
-- 0.0750 ms per call against 0.0017 for the mod's other two per-tick handlers.
-- Forty-four times the price, sixty times a second, for the whole life of
-- every save, whether or not the device is anywhere near the player's hand.
--
-- Two causes, both of them the same mistake. `safe(function() ... end)`
-- allocates a fresh closure on every call, and `safe` already takes varargs -
-- so `safe(player.getPrimaryHandItem, player)` does the identical job with no
-- allocation at all. And the full type of an item that has not changed since
-- the last tick cannot have changed either, so asking the engine for it sixty
-- times a second answers the same question over and over.
--
-- Behaviour is deliberately identical: the window comparison below still runs
-- every tick, because the screen can be closed by something other than the
-- hand and this handler is what notices.
function O.handTick()
    local player=getPlayer and getPlayer()
    if not player then return end
    local screen=ConspiracyFiles.OrganiserScreen
    if not screen then return end
    local primary=safe(player.getPrimaryHandItem,player)
    local ours
    if primary==nil then
        ours=false
    elseif primary==O.lastPrimary then
        ours=O.lastOurs                      -- same item, same answer
    else
        ours=safe(primary.getFullType,primary)==O.TYPE
    end
    O.lastPrimary,O.lastOurs=primary,ours
    if ours and not screen.window then
        if O.booting and screen.boot then
            O.booting=false
            safe(screen.boot)
            log("organiser in hand: Knox.OS booting")
        else
            safe(screen.open)
            log("organiser in hand: Knox.OS opened")
        end
    elseif not ours and screen.window and not screen.window.booting then
        safe(screen.close)
        log("organiser put away: Knox.OS closed")
    end
end

-- One tick watcher: open Knox.OS the moment the organiser is really in the
-- main hand, and give up quietly if the player cancelled the equip.
-- The lamp is not free. It is the backlight of a 1993 machine, and the owner
-- ruled (2026-09-13) that reading in the dark should cost something rather
-- than be a toggle with no downside. A full cell, lamp alone, lasts
-- O.LAMP_HOURS in-game hours; that is ON TOP of the drain the engine already
-- applies for the device being switched on.
--
-- Charged against in-game time, not ticks, so it does not depend on frame
-- rate, and only while the lamp is actually lit - the whole function returns
-- immediately otherwise, because per-tick work in normal play is exactly what
-- was stripped out of this file on 2026-09-12.
O.LAMP_HOURS=10
function O.lampTick()
    local screen=ConspiracyFiles.OrganiserScreen
    local window=screen and screen.window
    if not window or not window.on or not window.lamp then
        O.lampAt=nil
        return
    end
    local clock=getGameTime and getGameTime()
    -- No closure: safe takes varargs, and this is on the per-tick path.
    local now=clock and safe(clock.getWorldAgeHours,clock)
    if not now then return end
    local since=O.lampAt
    O.lampAt=now
    -- First lit tick, or the clock went backwards on a load: start the meter.
    if not since or now<=since then return end
    local item=O.held()
    local power=item and O.power(item)
    if power==nil or power<=0 then return end
    local drained=power-((now-since)/O.LAMP_HOURS)
    if drained<0 then drained=0 end
    safe(function() item:getDeviceData():setPower(drained) end)
    if drained<=0 then
        window.lamp=false
        log("organiser lamp off: flat battery")
        -- The cell the lamp just finished off is the cell that was holding
        -- the machine's RAM. This is the one path that flattens a battery
        -- while we are watching, so it is the one path that must notice.
        O.checkPower(item)
    elseif drained<O.LAMP_MIN then
        -- A backlight is the first thing to go on a dying cell.
        window.lamp=false
        log("organiser lamp off: too little charge to run it")
    end
end

function O.tick()
    if multiplayer() then return end
    O.handTick()
    safe(O.lampTick)
    local pending=O.pendingOpen
    if not pending then return end
    pending.tries=pending.tries+1
    local player=pending.player
    local primary=player and safe(player.getPrimaryHandItem,player)
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
-- there (owner, 2026-09-12: "the radio menu is still open").
--
-- The first attempt wrapped ISRadioAndTvMenu.openRadioPanel, and the owner
-- still saw a frequency dial on his organiser (2026-09-13). That function was
-- a branch, not the trunk: its whole body is one call to
-- ISRadioWindow.activate, and EIGHT other places in the installed game call
-- activate directly. The one that bites here is ISButtonPrompt:openDeviceOptions,
-- the on-screen prompt for a held device - and this device is always held.
--
-- So the wrap goes on activate, which every route passes through. Verified
-- against the installed game's own Lua, not from memory
-- (media/lua/client/RadioCom/ISRadioWindow.lua:9).
function O.isOurs(item)
    if not item then return false end
    local full=safe(function() return item:getFullType() end)
    if full==O.TYPE then return true end
    local md=item.getModData and safe(function() return item:getModData() end)
    return type(md)=="table" and md[MARK]==true
end

function O.blockRadioPanel()
    if O.panelBlocked then return true end
    local ok=pcall(require,"RadioCom/ISRadioWindow")
    if not ok or not ISRadioWindow or type(ISRadioWindow.activate)~="function" then return false end
    O.panelBlocked=true
    local original=ISRadioWindow.activate
    ISRadioWindow.activate=function(player,device,...)
        if O.isOurs(device) then
            log("radio panel refused; opening Knox.OS")
            O.read(player)
            return
        end
        return original(player,device,...)
    end
    return true
end

function O.install()
    if multiplayer() then return end
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

-- The machine boots with the game, and the survivor is HOLDING it while it
-- does. Owner, 2026-09-12: "Boot screen is no exception. You equip our PDA as
-- the first action." So the first thing a survivor does is take the machine
-- out and watch it start - which is also the rule everywhere else: the hand is
-- the switch, and nothing appears on screen that is not in a hand.
if Events and Events.OnGameStart and not O.bootHooked then
    O.bootHooked=true
    Events.OnGameStart.Add(function()
        if multiplayer() then log("organiser: multiplayer, not issued"); return end
        safe(function()
            local apps=ConspiracyFiles.KnoxApps
            if apps and apps.rememberMe then apps.rememberMe() end
            local player=getPlayer and getPlayer()
            local item=O.held(player)
            if not player or not item then return end
            -- Into the hand through the game's own action, like any other
            -- equip; handTick opens Knox.OS when it lands, and O.booting makes
            -- that first screen the boot screen.
            O.booting=true
            local queued=safe(function()
                require("TimedActions/ISEquipWeaponAction")
                ISTimedActionQueue.add(ISEquipWeaponAction:new(player,item,50,true,false))
                return true
            end)
            if not queued then safe(function() player:setPrimaryHandItem(item) end) end
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
