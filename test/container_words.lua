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
assert(W.phrase(nil)==nil and W.phrase("")==nil,"no kind, no phrase")

-- THE MAILBOX (P4-R134, fault found in a real game 2026-09-18). The engine
-- calls it "postbox" and a survivor calls it a mailbox; the record uses the
-- survivor's word, and "In a postbox" was the fallback that gave the guess
-- away. Generated/Storage.MAILBOX holds the engine's string, and the phrase is
-- keyed on it, so the two can never drift apart again.
local Storage=require("ConspiracyFiles/Generated/Storage")
assert(Storage.MAILBOX=="postbox","the engine's word for a mailbox is postbox")
is(Storage.MAILBOX,nil,"In a mailbox")
assert(W.phrase("postbox","Mailbox")=="In a mailbox","the game's own title cannot override it either")

-- A CARRIER (P4-R134). A body's and a zombie's inventory both answer "none",
-- so "In a none at 102 Dewey St." reached the record (campaign
-- 20260917T234706). "none" is not a container type worth saying, and a corpse
-- and a walker are not the same news.
assert(W.phrase("none")==nil and W.phrase("none","Inventory")==nil,
    "a type of none must never be worded as a container")
assert(W.NO_KIND.none and W.NO_KIND.floor,"the types that say nothing are named")
assert(W.carrier("corpse","102 Dewey St")=="On a body at 102 Dewey St.",
    "a body lies at an address: "..tostring(W.carrier("corpse","102 Dewey St")))
assert(W.carrier("zombie","102 Dewey St")=="On a zombie near 102 Dewey St.",
    "a zombie only walks near one: "..tostring(W.carrier("zombie","102 Dewey St")))
assert(W.carrier("corpse")=="On a body close by." and W.carrier("zombie")=="On a zombie close by.",
    "and an unnamed building still says where, without claiming an address")
assert(W.carrier("cupboard","x")==nil and W.carrier(nil)==nil,
    "nothing but a carrier kind may be worded as a carrier")
for _,words in ipairs({W.carrier("corpse","x"),W.carrier("zombie","x"),W.carrier("corpse")}) do
    local low=words:lower()
    assert(not low:find("lost") and not low:find("gone") and not low:find("none"),
        "a carrier line never says a clue is lost (P4-R104): "..words)
end
-- The kinds the carrier code knows are exactly the kinds there are words for.
local Carriers=require("ConspiracyFiles/Carriers")
for kind in pairs(Carriers.KINDS) do
    assert(W.CARRIER_PHRASES[kind],"no words for carrier kind "..kind)
end

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

print("PASS container words: shelves are on, not in a; the game's own title otherwise; no article before a "
    .."plural; the engine's postbox reads as a mailbox; a body and a zombie each have their own words")
