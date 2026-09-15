-- Several clues noted at once by dropping them on the open organiser
-- (P4-R116, owner 2026-09-15). The rules, without the game: what a drag holds,
-- which items are inspected and how, and what the footer says.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local contract=dofile("test/fixtures/contract.lua")
instanceof=function(value,class) return type(value)=="table" and value.isItem==true and class=="InventoryItem" end
ConspiracyFiles={}
local Drop=require("ConspiracyFiles/DropToNote")

local inventory,drawer={},{}
local function item(name,where,case)
    return {isItem=true,name=name,case=case,where=where,
            getOutermostContainer=function(self) return self.where end}
end
local docket=item("docket",inventory,true)
local key=item("key",inventory,true)
local pencil=item("pencil",drawer,true)
local hoodie=item("hoodie",inventory,false)
local memo=item("memo",inventory,true)

local inspected={[memo]=true}
local calls={}
local runtime=contract.pin({
    subject=function(it) return it.case==true end,
    isInspected=function(it) return inspected[it]==true end,
    inspect=function(it,inPlace) calls[#calls+1]={it=it,inPlace=inPlace}; inspected[it]=true; return true end,
},"mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua",{"subject","isInspected","inspect"})

-- The pane's shape: loose items, and a stack whose items[1] is the header copy.
local items=Drop.items({docket,{items={key,key,pencil}},hoodie,memo,"not an item",docket})
assert(#items==5,"a drag reads loose items and a stack's own items, once each, header skipped: "..#items)

local r=Drop.note(items,runtime,inventory)
assert(r.noted==3 and r.known==1 and r.other==1 and r.failed==0,Drop.describe(r))
local how={}
for _,c in ipairs(calls) do how[c.it.name]=c.inPlace end
assert(how.docket==false and how.key==false,"carried clues are inspected the ordinary way")
assert(how.pencil==true,"a clue in a drawer is noted where it lies")
assert(how.hoodie==nil,"an ordinary item is never inspected")
assert(how.memo==nil,"evidence already noted is not inspected again")
assert(Drop.footer(r)=="NOTED 3",Drop.footer(r))

calls={}
local again=Drop.note(items,runtime,inventory)
assert(#calls==0,"a second drop inspects nothing")
assert(Drop.footer(again)=="ALREADY NOTED",Drop.footer(again))
assert(Drop.footer(Drop.note({hoodie},runtime,inventory))=="NOT CASE EVIDENCE")

-- A refused inspection is counted as refused, never claimed.
local torn,fresh=item("torn",inventory,true),item("fresh",drawer,true)
runtime.inspect=function(it) if it~=torn then inspected[it]=true end; return it~=torn end
local partial=Drop.note({torn,fresh},runtime,inventory)
assert(partial.noted==1 and partial.failed==1,Drop.describe(partial))
assert(Drop.footer(partial)=="NOTED 1 OF 2",Drop.footer(partial))

local many={}
for i=1,80 do many[i]=item("p"..i,inventory,true) end
assert(#Drop.items(many)==Drop.MAX,"a drag is capped at "..Drop.MAX)
for _,line in ipairs({"NOT CASE EVIDENCE","ALREADY NOTED","NOTED 64 OF 64"}) do
    assert(#line<=17,"the footer must fit the largest text size: "..line)
end

-- A finished case's evidence is no longer placement subjects - retiring the
-- case drops that bookkeeping - but they are still noted. Dropping them again
-- must say so, not call them ordinary items (drop_note check 20260915T111000:
-- a whole case noted in one drop, then "NOT CASE EVIDENCE").
local retired=item("retired",inventory,true)
inspected[retired]=true
runtime.subject=function(it) return it~=retired and it.case==true end
local done=Drop.note({retired},runtime,inventory)
assert(done.known==1 and done.other==0,"noted evidence from a finished case is known, not ordinary: "..Drop.describe(done))
assert(Drop.footer(done)=="ALREADY NOTED","a finished case's evidence dropped again: "..Drop.footer(done))

-- The organiser takes a drop before handing the mouse-up to its panel.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/OrganiserScreen.lua","r"))
local src=f:read("*a"); f:close()
local up=src:match("function Screen:onMouseUp%(x,y%)(.-)\nend")
assert(up and up:find("self:dropPapers()",1,true),"the organiser's mouse-up must take a drop")

print("PASS drop to note: stacks and loose items read once, carried inspected, lying noted in place, ordinary and known untouched, footer honest")
