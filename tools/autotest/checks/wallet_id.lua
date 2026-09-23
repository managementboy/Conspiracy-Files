-- Stages for tools/autotest/checks/wallet_id.sh. Loaded once through DevEval;
-- each stage is then called by name, with real game frames in between, because
-- the identity observer only sees what an inventory pane actually draws.
--
-- Everything is done the way a player does it, through the game's own UI
-- functions and timed actions: click a body's icon in the loot panel, carry
-- the wallet off with a transfer action, take it in hand, click its icon.
CFWallet = {}
local W = CFWallet

local function bodies()
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    local out = {}
    for _, b in ipairs(loot.backpacks) do
        local parent = b.inventory and b.inventory:getParent()
        if parent and instanceof(parent, "IsoDeadBody") then out[#out + 1] = b end
    end
    return loot, out
end

local function idIn(container)
    local items = container:getItems()
    for i = 0, items:size() - 1 do
        local it = items:get(i)
        if it:getFullType():find("IDcard", 1, true) then return it end
    end
end

-- The observer is off until a case is running (IdentityObserver.supported).
function W.caseActive()
    local R = ConspiracyFiles.GeneratedRuntime
    return R and R.metrics and R.metrics() ~= nil or false
end

-- Vanilla fills a body's pockets the first time its icon is clicked.
function W.spawnBodies(n)
    local p = getPlayer()
    local zs = addZombiesInOutfit(math.floor(p:getX()), math.floor(p:getY()), 0, n, nil, 50)
    for i = 0, zs:size() - 1 do zs:get(i):Kill(nil) end
    return zs:size()
end

-- Selecting a container is only half of what a player does: the loot window
-- has to be OPEN. The identity observer reads what an inventory pane actually
-- draws, and a hidden window draws nothing, so a check that only selects
-- proves nothing about the observer. This cost the 2026-09-23 run a false
-- FAIL: every row the observer wanted was in a container it was never given a
-- chance to see, because `getPlayerLoot(0):getIsVisible()` was false
-- throughout. Nothing about the observer is relaxed here; the check simply
-- stops testing it through a closed window.
local function show(button)
    local loot = getPlayerLoot(0)
    loot:selectContainer(button)
    loot:setVisible(true)
    return true
end

-- Is this item REALLY on screen? `selectContainer` does not repopulate
-- `pane.items`; the pane rebuilds them on a later render, so reading the pane
-- in the same frame still shows the previous container. Every wait below asks
-- this instead of sleeping a guessed number of seconds.
local function paneShows(pane, name)
    if not (pane and type(pane.items) == "table") then return false end
    for _, row in ipairs(pane.items) do
        local item = instanceof(row, "InventoryItem") and row
            or (type(row) == "table" and row.items and row.items[1])
        if item and item:getDisplayName() == name then return true end
    end
    return false
end

function W.onScreen(name)
    local loot = getPlayerLoot(0)
    if loot:getIsVisible() and paneShows(loot.inventoryPane, name) then return true end
    local inv = getPlayerInventory(0)
    if inv:getIsVisible() and paneShows(inv.inventoryPane, name) then return true end
    return false
end

function W.openBodies()
    local loot, list = bodies()
    for _, b in ipairs(list) do show(b) end
    return #list
end

-- Pick the fixtures from what the game itself put on the bodies.
function W.findFixtures()
    local _, list = bodies()
    W.loose, W.wallet = nil, nil
    for _, b in ipairs(list) do
        local id = idIn(b.inventory)
        if id and not W.loose then W.loose = { button = b, name = id:getDisplayName() } end
        local items = b.inventory:getItems()
        for i = 0, items:size() - 1 do
            local w = items:get(i)
            if not W.wallet and instanceof(w, "InventoryContainer") and w:getFullType():find("Wallet", 1, true) then
                local inner = idIn(w:getInventory())
                if inner then W.wallet = { button = b, item = w, name = inner:getDisplayName() } end
            end
        end
    end
    return W.loose and W.loose.name or "none", W.wallet and W.wallet.name or "none"
end

function W.showLooseBody()
    if not (W.loose and W.loose.button) then return false, "no loose body found" end
    show(W.loose.button)
    return W.loose.name
end

-- Every step below now REPORTS "no wallet" instead of throwing. The game
-- decides what a corpse carries, so a run where nobody had one is a normal
-- outcome, and a driver that errors on it fills the log with red that looks
-- like a fault in the mod (knox check, 2026-09-12).
function W.takeWallet()
    if not (W.wallet and W.wallet.item and W.wallet.button) then return false, "no wallet found" end
    local p = getPlayer()
    show(W.wallet.button)
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, W.wallet.item, W.wallet.button.inventory, p:getInventory()))
    return true
end

function W.walletCarried()
    local w = W.wallet and W.wallet.item
    if not w then return false, "no wallet found" end
    return w:getContainer() == getPlayer():getInventory(), tostring(w:getModData().cfObservedSource)
end

-- A carried container only gets an icon while it is held.
function W.holdWallet()
    if not (W.wallet and W.wallet.item) then return false, "no wallet found" end
    ISTimedActionQueue.add(ISEquipWeaponAction:new(getPlayer(), W.wallet.item, 50, false))
    return true
end

function W.openWallet()
    if not (W.wallet and W.wallet.item) then return false, "no wallet found" end
    local inv = getPlayerInventory(0)
    inv:setVisible(true)
    inv:refreshBackpacks()
    local target = W.wallet.item:getInventory()
    for _, b in ipairs(inv.backpacks) do
        if b.inventory == target then inv:selectContainer(b); return true end
    end
    return false
end

-- The evidence row for a name, if the observer recorded one.
--
-- BY NAME IS AMBIGUOUS, and the ambiguity is the normal case rather than a
-- freak one: PZ names a body's documents after that body's identity, so a
-- corpse carrying a loose ID card AND a wallet with an ID card produces two
-- different items reading exactly the same. On 2026-09-23 this check reported
-- "recorded, but without its corpse provenance" because the wallet assertion
-- was applied to the LOOSE row, whose wording - "among a corpse's belongings"
-- - is correct for an item lying on a body rather than inside a container.
-- The product was right and the lookup was wrong.
--
-- Kept for the loose fixture, where a name is all there is to go on.
function W.row(name)
    for _, r in ipairs(ConspiracyFiles.IdentityObserver.rows()) do
        if r.title == "Found " .. name then return r.summary, (r.detailText:gsub("\n+", " \\n ")) end
    end
    return nil
end

-- The row for THIS EXACT ITEM. IdentityObservations keys a record
-- fullType..":"..itemID and publishes it as "identity:"..that, so an item the
-- check is holding can be addressed directly with no guessing.
function W.rowFor(item)
    if not item then return nil end
    local ok, id = pcall(function() return item:getID() end)
    if not ok or type(id) ~= "number" then return nil end
    local key = "identity:" .. tostring(item:getFullType()) .. ":" .. tostring(id)
    for _, r in ipairs(ConspiracyFiles.IdentityObserver.rows()) do
        if r.id == key then return r.summary, (r.detailText:gsub("\n+", " \\n ")) end
    end
    return nil
end

-- The ID card inside the carried wallet, which is the item the wallet leg is
-- actually making a claim about.
function W.walletCardRow()
    if not (W.wallet and W.wallet.item) then return nil end
    local inner = W.wallet.item:getInventory()
    local items = inner and inner:getItems()
    for i = 0, (items and items:size() or 0) - 1 do
        local it = items:get(i)
        if it:getFullType():find("IDcard", 1, true) then return W.rowFor(it) end
    end
    return nil
end

-- EVERY row, in one comparable string: the exact wording the player reads,
-- in the order the organiser lists it. Gate 2 expected result 10 asks that a
-- save and a reload preserve the facts and the provenance "without changing
-- wording or creating duplicates", and all three of those are visible here at
-- once - a dropped token changes "taken off a corpse" to nothing, a reworded
-- line changes the text, and a duplicate changes the count.
--
-- Deliberately not a hash. When this differs, the report should be able to
-- show WHICH line moved, not just that something did.
function W.digest()
    local rows = ConspiracyFiles.IdentityObserver.rows()
    local out = { tostring(#rows) .. " row(s)" }
    for _, r in ipairs(rows) do
        out[#out + 1] = tostring(r.title) .. " | " .. tostring(r.summary)
            .. " | " .. tostring(r.detailText):gsub("\n+", " \\n ")
    end
    return table.concat(out, "\t")
end
