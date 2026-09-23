-- The wallet-ID check must drive the observer through an OPEN window.
--
-- 2026-09-23: wallet_id.sh reported FAIL - "'ID Card: Laura Grantham' was on
-- screen and not recorded". It was not on screen. The check called
-- `loot:selectContainer(body)` and never made the loot window visible, so
-- `ISInventoryPane.render` never ran, so `IdentityObserver.afterRender` was
-- never called, so nothing could be recorded. The observer was healthy: once
-- the window was made visible in a live session the same corpse credit card
-- recorded immediately, with its corpse provenance and the body still
-- unidentified.
--
-- Two separate mistakes made that failure look like a product defect, and
-- this contract pins both:
--
--  1. selecting a container without opening its window;
--  2. asserting after a fixed sleep. `selectContainer` does not repopulate
--     `pane.items` in the same frame - the pane rebuilds them on a later
--     render - so a slept-through assertion reads whatever container happened
--     to be showing, which during the failing run was a different corpse
--     entirely.
--
-- This is a harness contract, not a licence to weaken the observer. Nothing
-- here asserts that a row must be produced; it asserts only that the check
-- gives the observer the same visible pane a player gives it.
local function read(path)
    local f=assert(io.open(path,"rb"),"missing "..path)
    local s=f:read("*a"); f:close(); return s
end
local lua=read("tools/autotest/checks/wallet_id.lua")
local sh=read("tools/autotest/checks/wallet_id.sh")

-- 1. Every window the check selects into is made visible.
assert(lua:find("loot:setVisible(true)",1,true),
    "the check must open the loot window it selects bodies into")
assert(lua:find("inv:setVisible(true)",1,true),
    "the check must open the player inventory window it selects the wallet into")

-- The raw call must not survive outside the one helper that also opens the
-- window. Counting is the point: a second, bare `selectContainer` elsewhere is
-- exactly how this defect returns.
local bare=0
for line in lua:gmatch("[^\n]+") do
    if not line:match("^%s*%-%-") and line:find("selectContainer",1,true) then bare=bare+1 end
end
assert(bare<=2, "selectContainer appears "..bare.." times; it belongs in the "
    .."helpers that also make the window visible")

-- 2. An on-screen predicate exists and really inspects drawn rows.
assert(lua:find("function W.onScreen",1,true),
    "the check must be able to ask whether an item is actually drawn")
assert(lua:find("getIsVisible()",1,true) and lua:find("pane.items",1,true),
    "onScreen must read window visibility and the pane's drawn rows, not assume them")

-- 3. The driver waits on that predicate before asserting a row, for BOTH
--    fixtures: the loose ID on a body and the ID inside the carried wallet.
local waits=0
for line in sh:gmatch("[^\n]+") do
    if line:find("wait_true",1,true) and line:find("CFWallet.onScreen",1,true) then waits=waits+1 end
end
assert(waits>=2, "the driver waits for a drawn row "..waits.." time(s); both the "
    .."loose ID and the wallet ID must be waited for, not slept through")

-- 4. The wallet's claim is made about the wallet's OWN card.
--
-- A by-name lookup is ambiguous, and ambiguously so in the normal case: PZ
-- names a body's documents after that body's identity, so a corpse carrying a
-- loose ID card and a wallet with an ID card yields two different items whose
-- display names are identical. On 2026-09-23 this check reported "recorded,
-- but without its corpse provenance" because the wallet assertion landed on
-- the LOOSE row, whose wording - "among a corpse's belongings" - is exactly
-- right for an item lying on a body rather than inside a container. The
-- product was correct; the lookup picked the wrong row.
--
-- IdentityObservations keys a record fullType..":"..itemID and publishes it as
-- "identity:"..that, so an item in hand can be addressed with no guessing.
assert(lua:find("function W.rowFor",1,true),
    "the check must be able to address a row by the item's own identity")
assert(lua:find('"identity:" .. tostring(item:getFullType()) .. ":"',1,true),
    "rowFor must build the published record key, not match on a display name")
assert(lua:find("function W.walletCardRow",1,true),
    "the wallet leg must resolve the card inside the carried wallet")
assert(sh:find("CFWallet.walletCardRow()",1,true),
    "the driver must assert provenance against the wallet's own card")

print("PASS wallet id: the check opens the windows it selects into and waits for a drawn row")
