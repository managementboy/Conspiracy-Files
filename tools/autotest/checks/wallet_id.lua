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

function W.openBodies()
    local loot, list = bodies()
    for _, b in ipairs(list) do loot:selectContainer(b) end
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
    getPlayerLoot(0):selectContainer(W.loose.button)
    return W.loose.name
end

function W.takeWallet()
    local p = getPlayer()
    getPlayerLoot(0):selectContainer(W.wallet.button)
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, W.wallet.item, W.wallet.button.inventory, p:getInventory()))
    return true
end

function W.walletCarried()
    local w = W.wallet.item
    return w:getContainer() == getPlayer():getInventory(), tostring(w:getModData().cfObservedSource)
end

-- A carried container only gets an icon while it is held.
function W.holdWallet()
    ISTimedActionQueue.add(ISEquipWeaponAction:new(getPlayer(), W.wallet.item, 50, false))
    return true
end

function W.openWallet()
    local inv = getPlayerInventory(0)
    inv:refreshBackpacks()
    local target = W.wallet.item:getInventory()
    for _, b in ipairs(inv.backpacks) do
        if b.inventory == target then inv:selectContainer(b); return true end
    end
    return false
end

-- The notebook row for a name, if the observer recorded one.
function W.row(name)
    for _, r in ipairs(ConspiracyFiles.IdentityObserver.rows()) do
        if r.title == "Found " .. name then return r.summary, (r.detailText:gsub("\n+", " \\n ")) end
    end
    return nil
end
