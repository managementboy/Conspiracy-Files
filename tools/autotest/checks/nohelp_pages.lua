-- Harness for nohelp_pages.sh: one item of each readable type, written through
-- the mod's own writePages, then read back. Nothing here is a copy of the
-- mod's logic - NHShared.GeneratedRuntime.writePages is the real function.
CFNHPages = CFNHPages or {}
local K = CFNHPages
local H = require("NHShared/Headings")

K.TYPES = {"Base.Note","Base.Notebook","Base.LetterHandwritten","Base.Photo",
           "Base.Diary1","Base.Notepad","Base.Receipt","Base.Newspaper"}

local function lines(n)
    local t = {}
    for i = 1, n do t[#t + 1] = "Entry " .. i .. " of a synthetic list." end
    return table.concat(t, "\n\n")
end

function K.make()
    local p = getPlayer()
    local doc = {body = H.FOUND .. "\nA synthetic object.\n\n" .. lines(30)}
    local out = {}
    K.tokens = {}
    for _, t in ipairs(K.TYPES) do
        local item = instanceItem(t)
        if not item then out[#out + 1] = t .. ":nocreate"
        else
            NHShared.GeneratedRuntime.writePages(item, doc, {locations = {}})
            item:getModData().cfPagesProbe = t
            p:getInventory():AddItem(item)
            out[#out + 1] = t
        end
    end
    return table.concat(out, " ")
end

-- type|pages|lockedBy|canBeWrite for every probe item in the inventory
function K.read()
    local inv = getPlayer():getInventory():getItems()
    local out = {}
    for i = 0, inv:size() - 1 do
        local it = inv:get(i)
        local tag = it:getModData().cfPagesProbe
        if tag then
            local n = -1
            if it.getCustomPages and it:getCustomPages() then n = it:getCustomPages():size() end
            local first = (n > 0) and tostring(it:getCustomPages():get(0)):sub(1, 12) or ""
            local locked = it.getLockedBy and tostring(it:getLockedBy()) or "n/a"
            local cw = it.canBeWrite and tostring(it:canBeWrite()) or "n/a"
            out[#out + 1] = table.concat({tag, n, locked, cw, first}, "|")
        end
    end
    table.sort(out)
    return table.concat(out, " ; ")
end
