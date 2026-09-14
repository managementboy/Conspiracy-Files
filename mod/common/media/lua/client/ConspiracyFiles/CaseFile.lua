-- The survivor's case file: a physical thing the paperwork lives in.
--
-- Owner, 2026-09-10, from a screenshot of a vanilla photo album: "it seems
-- like a Photoalbum can contain many photos but also text... we could provide
-- at game start such a Photoalbum and call it Survivor Notebook. Set it to
-- favorite so it does not get lost easily."
--
-- Base.PhotoAlbum is a container whose AcceptItemFunction is Wallet, which
-- takes maps, literature and anything tagged as fitting a wallet - almost
-- exactly this mod's paperwork: notes, receipts, letters, diaries, cards,
-- tickets, keys. The game already treats it as a folder for paper, and it
-- looks like a notebook on the icon.
--
-- WHAT IT IS NOT. Capacity 5, MaxItemSize 0.2, so it holds a case rather than
-- a career, and it will never hold the object evidence - a worn hammer, a pile
-- of bleach, a body are not literature. It is a home for the half of the
-- evidence that is paper.
--
-- It can also be dropped, burned, or looted off a corpse. That is the point of
-- giving the player a real object rather than a window they cannot lose:
-- setFavorite only stops it being discarded by accident.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local F=ConspiracyFiles.CaseFile or {}
ConspiracyFiles.CaseFile=F
F.TYPE="Base.PhotoAlbum"
-- Written into the item's own ModData, so "have they already been given one"
-- survives a reload without any saved state of ours.
local MARK="cfCaseFile"

local function log(message) CFLog.message("casefile","note",message) end

-- The survivor's own forename, guarded the way the notebook title guards it:
-- a descriptor can be absent mid-load, and a missing name must fall back
-- rather than stop the file being issued.
local function forename(player)
    local ok,name=pcall(function()
        local d=player:getDescriptor()
        return d and d:getForename() or nil
    end)
    if not ok or type(name)~="string" then return nil end
    name=name:gsub("[\r\n]"," "):gsub("^%s+",""):gsub("%s+$","")
    if name=="" then return nil end
    return name:sub(1,24)
end

-- "Case File" made the survivor sound like an investigator. Owner, 2026-09-10:
-- "he/she is a survivor. other name?" They are someone who kept some papers.
function F.titleFor(player)
    local name=player and forename(player)
    if name then return name.."'s Papers" end
    return "Papers"
end

-- Already carrying one? Searched by our own mark rather than by type, so a
-- photo album the player looted stays an ordinary photo album.
--
-- Inside bags too, three deep (as GeneratedRuntime's restampEvidence walks).
-- Found in play, 2026-09-14 (P4-R104): Papers put in a backpack were not found,
-- so filing stopped and the papers seemed gone. Level by level, so the album
-- at hand is preferred over one at the bottom of a bag. Only ever the player's
-- own inventory tree: an album on a shelf is not "held".
F.HELD_DEPTH=3
function F.held(player)
    local ok,inventory=pcall(function() return player:getInventory() end)
    if not ok or not inventory then return nil end
    local level={inventory}
    for _=0,F.HELD_DEPTH do
        local deeper={}
        for _,container in ipairs(level) do
            local items=container.getItems and container:getItems()
            for i=0,(items and items:size() or 0)-1 do
                local item=items:get(i)
                local md=item and item.getModData and item:getModData()
                if md and md[MARK] then return item end
                local inner=item and item.getInventory and item:getInventory()
                if inner and #deeper<64 then deeper[#deeper+1]=inner end
            end
        end
        if #deeper==0 then return nil end
        level=deeper
    end
    return nil
end

-- Issue one. Returns the item, or nil and a reason - never throws, because
-- this runs from a game-start event where an error would be silent and
-- permanent.
function F.give(player)
    player=player or (getPlayer and getPlayer())
    if not player then return nil,"no player" end
    local existing=F.held(player)
    if existing then return existing end
    local ok,item=pcall(function() return player:getInventory():AddItem(F.TYPE) end)
    if not ok or not item then return nil,"could not create "..F.TYPE end
    pcall(function()
        local md=item:getModData()
        md[MARK]=true
        item:setName(F.titleFor(player))
        item:setCustomName(true)
        -- Favourite: the game then refuses to drop it with the rest of a bag
        -- and warns before it is discarded. It does not make it indestructible,
        -- and nothing here pretends otherwise.
        item:setFavorite(true)
    end)
    -- Hold them. The inventory panel gives a carried container a button only
    -- while it is equipped (vanilla ISInventoryPage:refreshBackpacks: equipped,
    -- or a key ring), so papers loose in the main inventory could never be
    -- opened automatically: 370c1d6 waited for a button that never comes (Linux
    -- run, 2026-09-11: "2 buttons: Inventory, Key Ring"). Only into a FREE off
    -- hand - never take something out of the player's hand for this.
    pcall(function()
        if player:getSecondaryHandItem()==nil then player:setSecondaryHandItem(item) end
    end)
    log("papers issued: "..tostring(F.titleFor(player)))
    -- Open it in the inventory panel. Not immediately: the item is added this
    -- very tick, and the panel only builds a button for a new container on a
    -- later update, so a selection now finds nothing and silently does nothing
    -- - which is exactly what happened in play on 2026-09-11. It is retried on
    -- later ticks until the button exists, and given up on after a few seconds.
    F.pendingOpen=item.getInventory and item:getInventory() or nil
    F.openTries=0
    return item
end

-- One attempt, on the first tick after a game starts. A new character gets a
-- file; an existing save gets one too, once, the first time it loads under a
-- build that has this - which is why the mark is on the item rather than in a
-- flag of ours.
-- How long to keep trying once the panel exists: about thirty seconds.
--
-- The first version gave up after five seconds counted from the FIRST TICK. On
-- a new game the inventory panel can appear well after that, so the whole
-- budget was spent waiting for a panel rather than for a button, and the papers
-- never opened (2026-09-11, twice). Attempts now count only once the panel is
-- there to be asked.
F.OPEN_ATTEMPTS=1800

-- "opened", "no-panel" or "no-button". Reported rather than guessed at: two
-- fixes for this were built on readings of vanilla that turned out to be
-- incomplete.
local function tryOpen(inventory)
    local ok,state=pcall(function()
        local page=getPlayerInventory and getPlayerInventory(0)
        if not page or not page.backpacks or not page.selectButtonForContainer then return "no-panel" end
        for _,button in ipairs(page.backpacks) do
            if button.inventory==inventory then
                page:selectButtonForContainer(inventory)
                return "opened"
            end
        end
        return "no-button"
    end)
    return ok and state or "no-panel"
end

-- What the panel offered, for the log line when this gives up.
local function describePanel()
    local ok,text=pcall(function()
        local page=getPlayerInventory and getPlayerInventory(0)
        if not page or not page.backpacks then return "no inventory panel" end
        local names={}
        for _,button in ipairs(page.backpacks) do
            names[#names+1]=tostring(button.name or button.title or "?")
        end
        return #page.backpacks.." buttons: "..table.concat(names,", ")
    end)
    return ok and text or "unreadable panel"
end

local tried=false
-- Filing evidence away by itself -----------------------------------------------
--
-- Documents you pick up go into the Papers, so the survivor's pockets do not
-- fill with paper (owner, 2026-09-13). Only while the organiser is CLOSED: with
-- it in hand you are reading, and things moving under you while you read is the
-- kind of help nobody asked for.
--
-- Once every few seconds, not every tick. A per-tick inventory walk is the cost
-- five retry loops were stripped out for on 2026-09-12, and a document does not
-- appear in your pocket sixty times a second.
F.FILE_EVERY_MS=3000
function F.fileEvidence()
    local now=getTimeInMillis and getTimeInMillis() or 0
    if F.filedAt and now-F.filedAt<F.FILE_EVERY_MS then return 0 end
    F.filedAt=now
    local screen=ConspiracyFiles.OrganiserScreen
    if screen and screen.window and screen.window.on then return 0 end
    local player=getPlayer and getPlayer()
    if not player then return 0 end
    local papers=F.held(player)
    local into=papers and papers.getInventory and papers:getInventory()
    if not into then return 0 end
    local ok,inventory=pcall(function() return player:getInventory() end)
    if not ok or not inventory then return 0 end
    -- Never file INTO an album outside the player's inventory tree: a document
    -- moved onto a shelf would leave the survivor's hands without them asking.
    if papers.getOutermostContainer then
        local okOuter,outer=pcall(function() return papers:getOutermostContainer() end)
        if not okOuter or outer~=inventory then return 0 end
    end
    local items=inventory.getItems and inventory:getItems()
    if not items then return 0 end
    -- Collect first, move second: moving while walking the list it came from
    -- skips items.
    local moving={}
    for i=0,items:size()-1 do
        local item=items:get(i)
        local md=item and item.getModData and item:getModData()
        if type(md)=="table" and md.cfGeneratedId and item~=papers then
            moving[#moving+1]=item
        end
    end
    local moved=0
    for _,item in ipairs(moving) do
        -- Room, and only room the papers actually have: silently vanishing a
        -- document because a container was full would be far worse than
        -- leaving it in a pocket.
        local fits=pcall(function()
            return into:hasRoomFor(player,item)
        end)
        if fits~=false then
            local done=pcall(function()
                inventory:Remove(item)
                into:AddItem(item)
            end)
            if done then moved=moved+1 end
        end
    end
    if moved>0 then log("filed "..moved.." document(s) into the papers") end
    return moved
end

function F.onTick()
    pcall(F.fileEvidence)
    if F.pendingOpen then
        local state=tryOpen(F.pendingOpen)
        if state=="opened" then
            log("papers opened in the inventory panel after "..tostring(F.openTries or 0).." ticks")
            F.pendingOpen=nil
        elseif state=="no-button" then
            F.openTries=(F.openTries or 0)+1
            if F.openTries>=F.OPEN_ATTEMPTS then
                log("papers not opened: the panel never offered them a button - "..describePanel())
                F.pendingOpen=nil
            end
        end
        -- "no-panel" costs nothing: the panel is not there to be asked yet.
    end
    if tried then return end
    if not getPlayer or not getPlayer() then return end
    tried=true
    local item,why=F.give()
    if not item then log("papers not issued: "..tostring(why)) end
end

if Events and not F.tickHandler then
    F.tickHandler=function() F.onTick() end
    Events.OnTick.Add(F.tickHandler)
    F.startHandler=function() tried=false end
    Events.OnGameStart.Add(F.startHandler)
    -- A survivor who respawns after a death is a new character, and OnGameStart
    -- does not fire for them: the new survivor got no papers at all (Linux death
    -- check, 2026-09-11). OnCreatePlayer does. give() skips anyone who already
    -- holds a file, so the first survivor is never given two.
    if Events.OnCreatePlayer then
        F.createHandler=function() tried=false end
        Events.OnCreatePlayer.Add(F.createHandler)
    end
end

return F
