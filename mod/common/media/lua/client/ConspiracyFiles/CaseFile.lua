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
function F.held(player)
    local ok,inventory=pcall(function() return player:getInventory() end)
    if not ok or not inventory then return nil end
    local items=inventory.getItems and inventory:getItems()
    if not items then return nil end
    for i=0,items:size()-1 do
        local item=items:get(i)
        local md=item and item.getModData and item:getModData()
        if md and md[MARK] then return item end
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
    log("papers issued: "..tostring(F.titleFor(player)))
    -- Open it in the inventory panel, so the survivor starts with their papers
    -- in front of them rather than having to find the icon. Guarded all the way
    -- down: the panel may not exist yet on the first tick, and a failure here
    -- must not cost the player the item.
    pcall(function()
        local page=getPlayerInventory and getPlayerInventory(0)
        local inventory=item.getInventory and item:getInventory()
        if page and inventory and page.selectButtonForContainer then
            page:selectButtonForContainer(inventory)
        end
    end)
    return item
end

-- One attempt, on the first tick after a game starts. A new character gets a
-- file; an existing save gets one too, once, the first time it loads under a
-- build that has this - which is why the mark is on the item rather than in a
-- flag of ours.
local tried=false
function F.onTick()
    if tried then return end
    if not getPlayer or not getPlayer() then return end
    tried=true
    local item,why=F.give()
    if not item then log("case file not issued: "..tostring(why)) end
end

if Events and not F.tickHandler then
    F.tickHandler=function() F.onTick() end
    Events.OnTick.Add(F.tickHandler)
    F.startHandler=function() tried=false end
    Events.OnGameStart.Add(F.startHandler)
end

return F
