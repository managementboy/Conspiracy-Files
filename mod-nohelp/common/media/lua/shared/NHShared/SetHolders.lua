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

-- Holders a given set physically fits in (the only preselection): capacity at
-- least the pieces' total weight, no piece larger than the holder's MaxItemSize,
-- and not the very same kind of item as a piece. Ordered smallest first by
-- capacity, then weight, then id. nil weight (unknown piece) fits nothing.
function H.fitting(pieces)
    local total=0
    for _,p in ipairs(pieces) do
        if type(p.weight)~="number" then return {},0 end
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
    table.sort(out,function(x,y)
        if x.capacity~=y.capacity then return x.capacity<y.capacity end
        if x.weight~=y.weight then return x.weight<y.weight end
        return x.id<y.id
    end)
    return out,total
end

-- Owner algorithm (2026-10-03): draw one candidate at random, deterministically
-- from hash(world seed, clue id, attempt). If it fits the TARGET, use it. If not,
-- draw again from only the candidates smaller than the one that failed. If even
-- the smallest does not fit, nil (pieces are placed loose). `fits(holder,total)`
-- answers for the target; nil means a target with no limit (open ground).
-- Every retry pool is strictly smaller, so the loop ends. Same inputs, same answer.
function H.pick(seed,id,pieces,fits)
    if #pieces<H.MIN_PIECES then return nil end
    local pool,total=H.fitting(pieces)
    local size=#pool
    local attempt=0
    while size>0 do
        local i=1+Pick.hash(Pick.key({tonumber(seed) or 0,tostring(id),"holder",attempt}))%size
        local h=pool[i]
        if not fits or fits(h,total) then return h,attempt end
        size=i-1
        attempt=attempt+1
    end
    return nil
end

-- Free weight in a target container, read from the real container (its own
-- capacity less what is in it), or nil when it has no limit (open ground) or
-- cannot be read. World containers define no MaxItemSize of their own; that
-- limit exists only on carried container items (HolderData.maxItemSize).
function H.roomOf(container)
    if type(container)~="table" and type(container)~="userdata" then return nil end
    if container.ground==true then return nil end
    local ok,cap,used=pcall(function() return container:getCapacity(),container:getContentsWeight() end)
    if not ok or type(cap)~="number" or type(used)~="number" then return nil end
    return cap-used,cap
end
-- The target test for H.pick: the holder with its contents (full weight, no
-- reduction credited) must fit the free weight, and, as a size proxy, a bag that
-- could hold more than the whole target does is too big to sit in it. Open
-- ground (or a limit that cannot be read) accepts the first draw.
function H.targetFits(container)
    local room,cap=H.roomOf(container)
    if not room then return nil end
    return function(h,total)
        return h.weight+total<=room and h.capacity<=cap
    end
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
