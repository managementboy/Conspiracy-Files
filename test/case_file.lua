-- The survivor starts with something to keep the paperwork in.
--
-- Owner, 2026-09-10, from a screenshot of a vanilla photo album: "we could
-- provide at game start such a Photoalbum and call it Survivor Notebook. Set
-- it to favorite so it does not get lost easily." And then: "I would rather
-- the player starts with it in his/her inventory."
--
-- Base.PhotoAlbum accepts maps, literature and wallet-tagged items, which is
-- almost exactly this mod's paperwork. It is not a magic box: capacity 5,
-- MaxItemSize 0.2, and it will never hold the object evidence.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path

local added = {}
local function makeItem(fullType)
    local md = {}
    return { fullType = fullType, md = md, name = nil, custom = false, fav = false,
        getModData = function(self) return self.md end,
        setName = function(self, n) self.name = n end,
        setCustomName = function(self, v) self.custom = v end,
        setFavorite = function(self, v) self.fav = v end }
end
local inventory = {
    items = {},
    AddItem = function(self, fullType)
        local item = makeItem(fullType)
        self.items[#self.items + 1] = item
        added[#added + 1] = item
        return item
    end,
    getItems = function(self)
        local list = self.items
        return { size = function() return #list end, get = function(_, i) return list[i + 1] end }
    end,
}
local player = {
    getInventory = function() return inventory end,
    getDescriptor = function() return { getForename = function() return "Una" end } end,
}
getPlayer = function() return player end
Events = { OnTick = { Add = function() end }, OnGameStart = { Add = function() end } }
ConspiracyFiles = ConspiracyFiles or {}
local F = dofile('mod/common/media/lua/client/ConspiracyFiles/CaseFile.lua')

-- It is a photo album, because that is the container the game already treats
-- as a folder for paper.
local item = assert(F.give(player), "a case file must be issued")
assert(item.fullType == "Base.PhotoAlbum", item.fullType)

-- Named for the survivor, and NOT "Case File": that made them sound like an
-- investigator, and they are a person who kept some papers (owner,
-- 2026-09-10).
assert(item.name == "Una's Papers", item.name)
assert(item.custom, "the name must persist, which needs setCustomName")

-- Favourite, so it is not dropped with the rest of a bag by accident. It does
-- NOT make it safe: it can still burn, or be looted off a corpse, and nothing
-- in the mod pretends otherwise.
assert(item.fav, "the case file must be marked favourite")

-- Exactly one. A second call finds the one already held rather than issuing
-- another, or a player would accumulate albums every time they loaded.
local again = F.give(player)
assert(again == item, "a second issue must return the existing file")
assert(#added == 1, "issued " .. #added .. " case files; expected one")

-- Recognised by our own mark, not by type: a photo album the player looted is
-- an ordinary photo album and must not be mistaken for theirs.
local looted = inventory:AddItem("Base.PhotoAlbum")
looted.md.cfCaseFile = nil
assert(F.held(player) == item, "a looted album must not be taken for the case file")

-- A missing name must fall back rather than stop the file being issued: a
-- descriptor can be absent mid-load.
local nameless = { getInventory = function() return { AddItem = inventory.AddItem, getItems = function() return { size = function() return 0 end, get = function() end } end, items = {} } end,
                   getDescriptor = function() return nil end }
assert(F.titleFor(nameless) == "Papers", F.titleFor(nameless))

-- And it never throws: this runs from a game-start event, where an error would
-- be silent and permanent.
local broken = { getInventory = function() error("no inventory") end,
                 getDescriptor = function() return nil end }
local ok, why = F.give(broken)
assert(ok == nil and type(why) == "string", "a failure must be returned, not raised")

-- The module must be in the game-start self-check, or a file that silently
-- fails to load looks exactly like a feature that does not work.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua', 'r'))
local observer = f:read('*a'); f:close()
assert(observer:find('"CaseFile"', 1, true), 'CaseFile must appear in the module self-check')

print("PASS case file: one photo album, named for the survivor, favourited, "
    .. "issued once, and never mistaken for a looted one")

-- Four polish items from a playtest screenshot (owner, 2026-09-10). Checked at
-- the source: all four are engine calls with no plain-Lua behaviour to observe.
local function source(path)
    local f = assert(io.open(path, 'r')); local s = f:read('*a'); f:close(); return s
end
local caseFile = source('mod/common/media/lua/client/ConspiracyFiles/CaseFile.lua')
local runtime = source('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua')
local menu = source('mod/common/media/lua/client/ConspiracyFiles/GeneratedMenu.lua')

-- (a) Open in the inventory panel at the start, rather than making the player
-- hunt for the icon. Guarded: the panel may not exist on the first tick, and a
-- failure must not cost them the item.
assert(caseFile:find('selectButtonForContainer', 1, true), 'the papers must open in the inventory panel')
assert(caseFile:find('pcall(function()', 1, true), 'and must not throw if the panel is not there yet')

-- (b) The item's own icon on the context options.
assert(menu:find('item:getTexture()', 1, true), 'menu options should carry the item icon')
assert(menu:find('option.iconTexture=icon', 1, true))
assert(menu:find('here.iconTexture=icon', 1, true), 'both options, not just one')

-- (c) Not "Case File": the survivor is not an investigator.
assert(not caseFile:find('Case File', 1, true), 'the name must not make them an investigator')

-- (d) Evidence sorts as Evidence, not as Junk.
assert(runtime:find('item:setDisplayCategory("Evidence")', 1, true),
    'placed evidence must carry its own category so it can be sorted')
print('PASS case file: opens on start, carries icons, is not a "case file", and sorts as Evidence')
