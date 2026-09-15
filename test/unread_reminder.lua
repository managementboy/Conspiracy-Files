-- A repeating reminder while unread evidence is carried.
--
-- Owner, 2026-09-11, after carrying a fancy pen for an hour without realising
-- it was evidence: "can you please add a reminder on top of player that we have
-- not done that?" The pickup line fired once, as designed, and was missed.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path
local now = 0
getTimeInMillis = function() return now end
local halos, says = {}, {}
local function item(id)
    return { md = { cfGeneratedId = id }, getModData = function(self) return self.md end }
end
local carried = { item("doc-4"), item("pile-1"), item("pile-1"), item("pile-1") }
local read = {}
local player = {
    setHaloNote = function(_, t) halos[#halos + 1] = t end,
    Say = function(_, t) says[#says + 1] = t end,
    getInventory = function()
        return { getItems = function()
            return { size = function() return #carried end, get = function(_, i) return carried[i + 1] end }
        end }
    end,
}
getPlayer = function() return player end
Events = { OnTick = { Add = function() end }, OnGameStart = { Add = function() end } }
ConspiracyFiles = { GeneratedRuntime = {
    subject = function(it) return it.md.cfGeneratedId ~= nil end,
    isInspected = function(it) return read[it.md.cfGeneratedId] == true end,
} }
local E = dofile('mod/common/media/lua/client/ConspiracyFiles/EvidencePickupHint.lua')

-- A pile counts once: three identical items are one piece of evidence.
assert(E.unreadCarried(player) == 2, "a pile must count as one document, got " .. E.unreadCarried(player))

-- First reminder after the interval, halo only.
now = E.REMIND_EVERY_MS + 1
E.remindTick()
assert(#halos == 1 and halos[1] == "2 unread pieces of evidence", tostring(halos[1]))
assert(#says == 0, "the reminder must never speak; the survivor noticing once is enough")

-- Not again before the interval.
now = now + E.SCAN_EVERY_MS + 1
E.remindTick()
assert(#halos == 1, "the reminder must not repeat inside its interval")

-- And again after it, while still unread.
now = now + E.REMIND_EVERY_MS
E.remindTick()
assert(#halos == 2, "it must repeat while the evidence is still unread")

-- Silent once everything has been read.
read["doc-4"], read["pile-1"] = true, true
now = now + E.REMIND_EVERY_MS
E.remindTick()
assert(#halos == 2, "nothing unread, nothing said")
print("PASS unread reminder: repeats quietly while evidence goes unread, counts a pile once, never speaks")
