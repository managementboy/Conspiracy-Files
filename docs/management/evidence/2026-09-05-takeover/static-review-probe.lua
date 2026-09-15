-- Review reproduction only. Run from the repository root with plain Lua 5.1.
-- Uses mocks; never launches PZ or simulates manual GUI acceptance.
package.path = "mod/common/media/lua/shared/?.lua;mod/common/media/lua/shared/?/init.lua;" .. package.path
local Content = require("ConspiracyFiles/Content")
local ThreadState = require("ConspiracyFiles/ThreadState")
local Projection = require("ConspiracyFiles/NotebookProjection")
assert(#Content.thread.locationIds == 3)
print("OBSERVED: 3 story Location IDs; CF-V01-P01 requires 2")
local state = assert(ThreadState.new())
assert(state.discover(Content.ids.d2, "review mock", Content.ids.police))
local row = Projection.evidence(state)[1]
assert(string.find(row.whatThisIs, "Cumberland Signal Services", 1, true))
assert(state.organisationLabel() ~= "Cumberland Signal Services")
print("OBSERVED: D2-only context reveals full organisation name while canonical label remains generic")
local menuHandler, readerContext, readerCalled
package.loaded["ConspiracyFiles/Notebook"] = {
    refresh = function() end, open = function() end,
    openReader = function(_, _, context) readerCalled = true; readerContext = context end
}
ConspiracyFiles = { Runtime = { state = state, persist = function() end } }
Events = { OnFillInventoryObjectContextMenu = { Add = function(fn) menuHandler = fn end } }
instanceof = function() return true end
local asset = Content.assets[Content.ids.d1]
local md = { cfAssetId = Content.ids.d1, cfAssetKind = "document", cfResolvedTitle = asset.displayName,
    cfResolvedBody = asset.bodyText, cfFoundLocationId = Content.ids.relay }
local item = { getModData = function() return md end, getName = function() return asset.displayName end }
local action
local menu = { options = {}, addOption = function(_, title, target, callback, playerNum, subject)
    if title == "Inspect Document" then action = function() callback(target, playerNum, subject) end end
    return {}
end }
local originalPrint = print
print = function() end
dofile("mod/common/media/lua/client/ConspiracyFiles/ContextMenu.lua")
menuHandler(0, menu, { item })
assert(action); action()
print = originalPrint
assert(readerCalled and readerContext == nil)
print("OBSERVED: Inspect reader receives nil context despite authored D1 context; asset is out of scope")
print("3 review findings reproduced using mocks; no live acceptance inferred")
