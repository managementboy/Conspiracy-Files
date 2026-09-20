-- Contract fixture for Claude to run; not evidence of a PZ hook working live.
package.path = "mod/common/media/lua/client/?.lua;" .. package.path
local function pack(...) return { n = select("#", ...), ... } end
local debugOn, client, server = true, false, false
function getDebug() return debugOn end
function isClient() return client end
function isServer() return server end
local player = { read = {} }
function player:hasReadMap(item) assert(self == player); return self.read[item] == true end
function getSpecificPlayer(n) assert(n == 0); return player end
local clock = {}
function clock:getWorldAgeHours() assert(self == clock); return 12.5 end
function getGameTime() return clock end
local core = {}
function core:getVersionNumber() assert(self == core); return "MOCK-NOT-PZ" end
function getCore() return core end
package.preload["ISUI/ISInventoryPaneContextMenu"] = function() return true end
package.preload["ISUI/Maps/ISMap"] = function() return true end

local function item(id)
    local it = { id = id }
    function it:getStashMap() assert(self == it); return "LouisvilleStashMap15" end
    function it:getMapID() assert(self == it); return "LouisvilleMap" end
    function it:getID() assert(self == it); return self.id end
    function it:getFullType() assert(self == it); return "Base.LouisvilleMap1" end
    return it
end
local nativeCalls, attachments, reveals, closes = 0, 0, 0, 0
local baseUI = {}
function baseUI:addToUIManager() assert(self.mapUI); attachments = attachments + 1 end
ISMapWrapper = setmetatable({}, { __index = baseUI })
function ISMapWrapper:close() closes = closes + 1 end
ISMap = {}
function ISMap:revealOnWorldMap() reveals = reveals + 1; return "reveal", nil, "tail" end
local mode = "open"
local failure = { reason = "native failure" }
local lastWrapper
ISInventoryPaneContextMenu = {}
function ISInventoryPaneContextMenu.onCheckMap(it, num)
    nativeCalls = nativeCalls + 1
    assert(num == 0)
    if mode == "transfer" then return "queued", nil, "tail" end
    if mode == "error" then error(failure, 0) end
    local ui = setmetatable({ mapObj = it, playerNum = num }, { __index = ISMap })
    lastWrapper = setmetatable({ mapUI = ui }, { __index = ISMapWrapper })
    lastWrapper:addToUIManager()
    if mode == "error-after-attach" then error(failure, 0) end
    player.read[it] = true
    return "native", nil, "tail"
end
local original = ISInventoryPaneContextMenu.onCheckMap
local O = require "ConspiracyFiles/MapReadObserver"
assert(ISInventoryPaneContextMenu.onCheckMap == original, "require must not install")
debugOn = false; assert(not O.start("denied")); debugOn = true
client = true; assert(not O.start("mp")); client = false
server = true; assert(not O.start("server")); server = false
assert(O.start("contract-fixture"))
assert(not O.start("duplicate-start"))

local first, second = item(1), item(2)
local function candidates()
    local _, _, _, n = O.status(); return n
end
mode = "transfer"
player.read[first] = true -- a queued reread is still NOT a new presentation
local result = pack(ISInventoryPaneContextMenu.onCheckMap(first, 0))
assert(result.n == 3 and result[1] == "queued" and result[2] == nil and result[3] == "tail")
assert(nativeCalls == 1 and attachments == 0 and candidates() == 0)
mode = "open"
player.read[first] = nil
result = pack(ISInventoryPaneContextMenu.onCheckMap(first, 0))
assert(result.n == 3 and result[1] == "native" and result[2] == nil and result[3] == "tail")
assert(nativeCalls == 2 and attachments == 1 and candidates() == 1)
local candidate = O.event(O.sequence)
assert(candidate.kind == "read-candidate" and candidate.readBefore == false and candidate.read == true)
assert(candidate.designBefore == "LouisvilleStashMap15")
local seq = candidate.seq
candidate.kind = "changed"
assert(O.event(seq).kind == "read-candidate", "event must return a copy")
ISInventoryPaneContextMenu.onCheckMap(first, 0)
ISInventoryPaneContextMenu.onCheckMap(second, 0)
assert(candidates() == 3, "observer reports rereads/copies; it does not activate or deduplicate trails")
result = pack(lastWrapper.mapUI:revealOnWorldMap())
lastWrapper:close()
assert(result.n == 3 and result[2] == nil and result[3] == "tail")
assert(reveals == 1 and closes == 1 and candidates() == 3)

mode = "error"
local ok, why = pcall(ISInventoryPaneContextMenu.onCheckMap, first, 0)
assert(not ok and why == failure and O.frame == nil and candidates() == 3)
mode = "error-after-attach"
ok, why = pcall(ISInventoryPaneContextMenu.onCheckMap, first, 0)
assert(not ok and why == failure and O.frame == nil and candidates() == 3)
mode = "open"

-- Another mod wraps us. stop must not replace that mod's callback. Restart
-- must not revive the buried disabled closure or produce doubled observations.
local ours = ISInventoryPaneContextMenu.onCheckMap
local outerCalls = 0
local outer = function(...)
    outerCalls = outerCalls + 1
    return ours(...)
end
ISInventoryPaneContextMenu.onCheckMap = outer
O.stop()
assert(ISInventoryPaneContextMenu.onCheckMap == outer)
assert(rawget(ISMapWrapper, "addToUIManager") == nil, "restore inherited method shape")
ISInventoryPaneContextMenu.onCheckMap(first, 0)
assert(candidates() == 3 and outerCalls == 1)
assert(O.start("restart"))
ISInventoryPaneContextMenu.onCheckMap(first, 0)
assert(candidates() == 1 and outerCalls == 2)

-- Observation failure must not prevent the native function returning.
local realPrint = print
print = function() error("observer logging failure") end
result = pack(ISInventoryPaneContextMenu.onCheckMap(first, 0))
assert(result.n == 3 and result[1] == "native" and result[3] == "tail")
result = pack(ISInventoryPaneContextMenu.onCheckMap(first, 0))
print = realPrint
assert(result.n == 3 and result[1] == "native" and result[3] == "tail")
local _, suspended, _, _, _, _, errors = O.status()
assert(suspended and errors >= 3 and O.frame == nil)
O.stop()
assert(ISInventoryPaneContextMenu.onCheckMap == outer)
print("PASS map read observer Lua contract (not native-engine acceptance)")
