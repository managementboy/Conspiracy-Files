-- "ALREADY SEARCHED" MEANS THE PLAYER LOOKED, NOT THAT THE ENGINE MADE LOOT.
--
-- Found by the Fitness Instructor first-mystery audit (20260924T183959, real
-- game): the survivor stood outside a house never entered, and 23 of its 24
-- indexed containers were refused as "already-searched". ItemContainer:
-- isExplored() is set when loot is generated, which happens for a whole
-- building as its chunk loads. Every guard that read it as "the player
-- searched this" refused nearly every reachable container: instalments found
-- "no containers" at their own sites, indexed plans were unplanned the moment
-- their building loaded, and object clues waited until they expired.
--
-- What this holds:
--   * loot generated + nobody looked      -> not searched (the defect)
--   * the player took something            -> searched (isHasBeenLooted)
--   * the loot panel showed its contents   -> searched (our mark)
--   * the engine's read unavailable        -> nil, callers stay fail-closed
--   * the watch marks on selectContainer, after the original, and never
--     lets a marking fault reach the click
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local Searched=require("ConspiracyFiles/SearchedContainers")

local function container(opts)
    local parent={md=opts.md}
    function parent:getModData() return self.md end
    local c={parent=opts.parent==false and nil or parent}
    function c:isExplored() return true end -- loot generated: always, in a loaded building
    if opts.looted~=nil then function c:isHasBeenLooted() return opts.looted end end
    function c:getParent() return self.parent end
    return c,parent
end

-- 1. The defect: loot generated, nobody looked.
local c=container({looted=false,md={}})
assert(Searched.searched(c)==false,"loot having been generated is not the player having looked")
assert(c:isExplored()==true,"(the fixture really does answer explored=true, as the engine did)")

-- 2. The two real signals.
assert(Searched.searched(container({looted=true,md={}}))==true,"taking something out of it is searching it")
assert(Searched.searched(container({looted=false,md={cfSearched=true}}))==true,"the panel having shown it is searching it")

-- 3. Unreadable stays unknown, so callers stay fail-closed.
assert(Searched.searched(container({looted=nil,md={}}))==nil,"no engine read and no mark is unknown, not false")
assert(Searched.searched(container({looted=nil,md={cfSearched=true}}))==true,"but a mark alone is still an answer")
assert(Searched.searched(nil)==nil,"nothing is not a container")

-- 4. Marking writes the parent's ModData and says so; no parent, no mark.
local c2,parent=container({looted=false,md={}})
assert(Searched.mark(c2)==true and parent.md.cfSearched==true,"mark writes the parent object's ModData")
assert(Searched.searched(c2)==true,"and is read back as searched")
assert(Searched.mark(container({looted=false,parent=false}))==false,"a container with no parent cannot be marked")

-- 5. The watch: after the original, tolerant of faults, installed once.
ConspiracyFiles=nil
Events=nil
package.loaded["ConspiracyFiles/SearchedContainerWatch"]=nil
local W=require("ConspiracyFiles/SearchedContainerWatch")
local calls={}
local page={selectContainer=function(self,button) calls[#calls+1]=button; return "original-result" end}
assert(W.install(page)==true,"the watch installs on a page that has selectContainer")
local c3,parent3=container({looted=false,md={}})
local r=page:selectContainer({inventory=c3})
assert(r=="original-result" and #calls==1,"the original still runs and its result still returns")
assert(parent3.md.cfSearched==true,"selecting a container marks it")
assert(select(1,page:selectContainer({}))=="original-result","a button with no inventory is harmless")
assert(select(1,page:selectContainer(nil))=="original-result","so is no button at all")
local before=page.selectContainer
assert(W.install(page)==true and page.selectContainer==before,"installing twice wraps once")
assert(W.install({})==false,"a page with no selectContainer is refused, not wrapped")

-- 6. Every guard that used to read isExplored now asks SearchedContainers.
local function source(path) local f=assert(io.open(path,"rb")); local s=f:read("*a"); f:close(); return s end
for _,path in ipairs({"mod/common/media/lua/shared/ConspiracyFiles/Generated/FixedContainerRuntime.lua",
                      "mod/common/media/lua/shared/ConspiracyFiles/Generated/Storage.lua",
                      "mod/common/media/lua/shared/ConspiracyFiles/Carriers.lua"}) do
    local s=source(path)
    assert(s:find('require("ConspiracyFiles/SearchedContainers")',1,true),path..": does not consult SearchedContainers")
    assert(not s:find("isExplored",1,true),path..": still reads isExplored as searched")
end

print("PASS searched: loot generated is not searched; taking from it or the panel showing it is; every guard reads that")
