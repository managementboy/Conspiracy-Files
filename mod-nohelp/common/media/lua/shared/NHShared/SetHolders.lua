-- Object-set HOLDERS (owner decision 2026-10-03, docs/design/SET_HOLDERS.md).
--
-- A set of 2-4 pieces is found as ONE thing: a vanilla bag, box or case with
-- the pieces inside. Pure Lua; the engine-facing part (creating the items) is
-- in GeneratedRuntime. Which holders exist comes from Generated/HolderData
-- (parsed from the game's own container.txt); nothing here names a bag.
--
-- The pick is a pure function of (world seed, clue id, the pieces), so it is
-- the same after a reload, after a relocation and on every machine.
local Pick=require("NHShared/Generated/Pick")
local Data=require("NHShared/Generated/HolderData")
local Objects=require("NHShared/Generated/ObjectCatalogue")
local H={}
H.MIN_PIECES=2        -- a single-piece set gets no holder
H.data=Data

-- The set's pieces, one row per physical item (a member of quantity 2 is two
-- rows), with the weight the game's item script gives it.
function H.pieces(doc)
    local out={}
    if type(doc)~="table" or type(doc.members)~="table" then return out end
    for _,m in ipairs(doc.members) do
        local obj=Objects.get(m.kind)
        for _=1,(tonumber(m.quantity) or 1) do
            out[#out+1]={kind=m.kind,fullType=obj and obj.fullType or nil,weight=obj and obj.weight or nil}
        end
    end
    return out
end

-- Holders a given set physically fits in: capacity at least the pieces' total
-- weight, no piece larger than the holder's MaxItemSize, and not the very same
-- kind of item as a piece (two identical bags in one clue would only confuse).
-- No other preselection. nil weight (unknown piece) fits nothing.
function H.fitting(pieces)
    local total=0
    for _,p in ipairs(pieces) do
        if type(p.weight)~="number" then return {} end
        total=total+p.weight
    end
    local out={}
    for _,h in ipairs(Data.holders) do
        local ok=h.capacity>=total
        if ok and h.maxItemSize then
            for _,p in ipairs(pieces) do if p.weight>h.maxItemSize then ok=false; break end end
        end
        if ok then for _,p in ipairs(pieces) do if p.fullType==h.fullType then ok=false; break end end end
        if ok then out[#out+1]=h end
    end
    return out
end

-- The holder of one set clue, or nil when it has none (a single piece, or no
-- holder fits). Same inputs, same answer, always.
function H.pick(seed,id,pieces)
    if #pieces<H.MIN_PIECES then return nil end
    local fit=H.fitting(pieces)
    if #fit==0 then return nil end
    return fit[1+Pick.hash(Pick.key({tonumber(seed) or 0,tostring(id),"holder"}))%#fit]
end

-- Markers on the items. The holder carries the clue's id and token like a
-- piece (so inspecting, recognising, relocation and pickup hints all find the
-- clue from it) and is marked cfHolder so counting still counts PIECES only.
function H.isHolderMd(md) return type(md)=="table" and md.cfHolder==true end
function H.isHolder(item)
    local ok,md=pcall(function() return item:getModData() end)
    return ok and H.isHolderMd(md)
end

-- What lies in `container` (anything with getItems) for one token:
--   holder  the holder item, or nil (an old-save set has none)
--   inside  pieces found in the holder
--   loose   pieces found directly in the container
-- Duck-typed so the tests can use plain tables.
function H.shape(container,token)
    local shape={holder=nil,inside=0,loose=0,holders=0}
    local items=container:getItems()
    for i=0,items:size()-1 do
        local it=items:get(i)
        local md=it and it:getModData()
        if type(md)=="table" and md.cfPhysicalToken==token then
            if md.cfHolder==true then
                shape.holders=shape.holders+1
                shape.holder=shape.holder or it
            else shape.loose=shape.loose+1 end
        end
    end
    if shape.holder then
        local inner=shape.holder:getInventory():getItems()
        for i=0,inner:size()-1 do
            local md=inner:get(i):getModData()
            if type(md)=="table" and md.cfPhysicalToken==token and md.cfHolder~=true then shape.inside=shape.inside+1 end
        end
    end
    return shape
end

-- May a set move? With a holder: exactly one holder, every piece inside it,
-- none loose. Without one (an old save): the plain rule, every piece loose.
function H.movesWhole(shape,expected)
    if shape.holders>1 then return false end
    if shape.holder then return shape.loose==0 and shape.inside==expected end
    return shape.loose==expected
end

-- What an item is within its set: "holder", "inside" (a piece lying in its own
-- holder) or "plain" (a loose piece, or a piece of a set that has no holder).
function H.roleOf(item)
    local ok,md=pcall(function() return item:getModData() end)
    if not ok or type(md)~="table" then return "plain" end
    if md.cfHolder==true then return "holder" end
    local okC,holder=pcall(function() return item:getContainer():getContainingItem() end)
    if okC and holder then
        local okM,hmd=pcall(function() return holder:getModData() end)
        if okM and type(hmd)=="table" and hmd.cfHolder==true and hmd.cfGeneratedId==md.cfGeneratedId then return "inside" end
    end
    return "plain"
end

-- The caption of a set plays once: on every Inspect of its holder, for a loose
-- piece as before, and for a piece lying in its holder only when the set's
-- words have not been said yet this session.
function H.shouldSpeak(role,alreadySpoken)
    if role=="inside" then return not alreadySpoken end
    return true
end
return H
