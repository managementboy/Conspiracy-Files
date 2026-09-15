-- Where a clue lies reads as words (owner screenshot, Windows, 2026-09-15:
-- "In a shelves at 105 Pattern St.").
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local W=require("ConspiracyFiles/ContainerWords")

local function is(kind,title,want)
    local got=W.phrase(kind,title)
    assert(got==want,kind.." read as "..tostring(got)..", not "..want)
end
assert(W.phrase("shelves")=="On shelves","shelves read as "..tostring(W.phrase("shelves")))
is("metal_shelves",nil,"On metal shelves")
is("desk",nil,"In a desk")
is("counter","Cupboard","In a cupboard")
is("dresser","Drawer","In a chest of drawers")
is("filingcabinet","File Cabinet","In a filing cabinet")
is("officedrawers","Drawer","In an office drawer")
-- Anything not written out: the game's own title, with a or an, and a plural
-- takes no article.
is("oven","Oven","In an oven")
is("displaycase","Display Case","In a display case")
is("seedbags","Seed Bags","In seed bags")
is("postbox",nil,"In a postbox")
assert(W.phrase(nil)==nil and W.phrase("")==nil,"no kind, no phrase")

-- No written phrase puts "a" or "an" before a plural.
for kind,phrase in pairs(W.PHRASES) do
    local noun=phrase:match("^%a+ an? (.+)$")
    if noun and noun:sub(-1)=="s" then
        assert(noun:find("drawers",1,true),kind..": an article before a plural: "..phrase)
    end
end

-- The runtime words its containers through this, not the raw id after "In a".
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua","r"))
local src=f:read("*a"); f:close()
assert(src:find('require("ConspiracyFiles/ContainerWords")',1,true),"GeneratedRuntime must word containers through ContainerWords")
assert(not src:find('("In a "..tostring(kind).." at "',1,true),"GeneratedRuntime still prints the raw container id after 'In a'")

print("PASS container words: shelves are on, not in a; the game's own title otherwise; no article before a plural")
