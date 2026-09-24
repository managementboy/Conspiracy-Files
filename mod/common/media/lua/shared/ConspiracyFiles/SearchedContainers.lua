-- WHAT "ALREADY SEARCHED" MEANS.
--
-- Nothing may be inserted into a place the player already searched. Until
-- 2026-09-24 that was read from ItemContainer:isExplored(), which does not
-- mean what its name suggests. Measured in a live game at Building 10675,10266
-- (Muldraugh, 42.20), a house the survivor had never entered: 23 of its 24
-- fixed containers answered explored=true, hasBeenLooted=false, with loot
-- inside. The engine sets `explored` when it GENERATES loot, and it generates
-- a building's loot as the chunk loads - before the survivor can reach any of
-- it. So the guard refused nearly every container a survivor could ever walk
-- up to: the filler's instalments found "no containers" at their own sites,
-- and every indexed plan was unplanned the moment its building loaded.
--
-- Two signals mean the player actually looked, and either is enough:
--   * ItemContainer:isHasBeenLooted() - set by the engine when the player
--     takes something out (ISInventoryTransferAction, 42.20 line 656).
--     Opening a container does NOT set it; measured live, the same day.
--   * our own mark on the container's parent object, written the moment the
--     loot panel shows that container's contents (ISInventoryPage:selectContainer,
--     wrapped by client/ConspiracyFiles/SearchedContainerWatch.lua). Object
--     ModData is saved with its chunk, so the mark survives a reload; a
--     corpse's container has a parent too.
-- isExplored is not consulted here at all: loot having been generated is not
-- the player having looked.
local M={}

M.MARK="cfSearched"

-- The engine throws on the INDEX of a missing method, not the call, so the
-- index is inside the protected closure (Kahlua, AGENTS.md).
local function read(object,method)
    if object==nil then return nil end
    local ok,value=pcall(function() return object[method](object) end)
    if not ok then return nil end
    return value
end
M.read=read

function M.parent(container) return read(container,"getParent") end

-- Record that the player has looked into this container. True when a mark
-- was written; false when the container has no parent that keeps ModData
-- (a vehicle part, a test double), in which case only isHasBeenLooted can
-- ever say it was searched.
function M.mark(container)
    local md=read(M.parent(container),"getModData")
    if type(md)~="table" then return false end
    md[M.MARK]=true
    return true
end

function M.marked(container)
    local md=read(M.parent(container),"getModData")
    return type(md)=="table" and md[M.MARK]==true
end

-- true: the player looked (took something, or the panel showed it).
-- false: neither signal says so.
-- nil: the engine's read is unavailable; callers stay fail-closed on nil.
function M.searched(container)
    local looted=read(container,"isHasBeenLooted")
    if looted==true then return true end
    if M.marked(container) then return true end
    if looted==false then return false end
    return nil
end

return M
