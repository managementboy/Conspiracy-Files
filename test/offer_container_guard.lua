-- NOT EVERY "CONTAINER" THE ENGINE HANDS US IS AN ItemContainer.
--
-- Events.OnFillContainer passes a zombie.inventory.ItemPickerJava$
-- ItemPickerContainer. MapMediaRuntime.offerContainer called getParent() on it
-- as its first act, and Kahlua threw every single time:
--
--   attempted index: getParent of non-table:
--     zombie.inventory.ItemPickerJava$ItemPickerContainer@6f40df87
--
-- 24 error blocks in one run (20260921T171400-map-coverage), which failed the
-- run's zero-mod-errors assertion. The call is inside a pcall so nothing
-- crashed - and that is what made it survive: the native loot path bailed on
-- its first line for every container the game ever filled, so the "native loot
-- completion contributes candidates to the same diverse scan" behaviour its
-- own comment describes never happened once.
--
-- The trap that makes this hard to guard: Kahlua throws on the INDEX, not on
-- the call. `container.getParent and container:getParent()` throws too. Only
-- a pcall around a colon call can ask the question.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local logged={}
local realPrint=print
print=function(s) logged[#logged+1]=tostring(s) end

Events=setmetatable({},{__index=function(t,k)
    local e={Add=function() end,Remove=function() end}
    rawset(t,k,e); return e
end})
ModData={get=function() return nil end,getOrCreate=function() return {} end}
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
getPlayer=function() return nil end
getCell=function() return nil end
getGameTime=function() return {getWorldAgeHours=function() return 1 end} end
getTimeInMillis=function() return 0 end

local R=dofile("mod/common/media/lua/client/ConspiracyFiles/MapMediaRuntime.lua")
assert(type(R.offerContainer)=="function","offerContainer must exist")

-- A double that behaves like the real ItemPickerContainer: indexing getParent
-- raises, exactly as Kahlua does on a Java object without that method.
local picker=setmetatable({},{
    __index=function(_,k)
        error("attempted index: "..tostring(k)
            .." of non-table: zombie.inventory.ItemPickerJava$ItemPickerContainer@6f40df87",2)
    end,
    __tostring=function() return "zombie.inventory.ItemPickerJava$ItemPickerContainer@6f40df87" end,
})

-- `ready` is false on a fresh module, and the guard must be reached anyway, so
-- drive the function directly and require that it does not propagate.
local ok,err=pcall(R.offerContainer,picker,true)
assert(ok,"offerContainer must not raise on a container without getParent, but did: "..tostring(err))
assert(err==false,"it must refuse, returning false; got "..tostring(err))

-- And it must be possible to say so once, not once per container filled.
local body=io.open("mod/common/media/lua/client/ConspiracyFiles/MapMediaRuntime.lua","rb")
local src=body:read("*a"); body:close()
assert(src:find("local unparented={}",1,true),
    "the refusal must be remembered per class, or it repeats for every container "
    .."the game fills - which is how one run logged 24 identical errors")
assert(src:find("pcall(function() return container:getParent() end)",1,true),
    "the presence of getParent must be asked with a pcall around a COLON call: "
    .."Kahlua throws on the index, so `container.getParent` throws too")
-- The old shape must not come back IN offerContainer. Scoped deliberately:
-- selectStep also calls container:getParent(), and there it is correct - its
-- container comes from World.resolve(target), a real ItemContainer read out of
-- the world's own objects, not from an engine event handing us whatever class
-- it likes. A blanket search flagged that one too, and breaking correct code to
-- satisfy a pattern match would be the wrong trade.
local offer=src:match("function R%.offerContainer%(container,filled%)(.-)\nend")
assert(offer,"offerContainer must be readable")
for line in offer:gmatch("[^\n]+") do
    if not line:match("^%s*%-%-") and line:find("container:getParent()",1,true)
       and not line:find("pcall",1,true) then
        error("the unguarded getParent call is back in offerContainer: "..line)
    end
end

print=realPrint
print("PASS offer_container_guard: a container with no getParent is refused, not "
    .."thrown on, and the refusal is logged once per class")
