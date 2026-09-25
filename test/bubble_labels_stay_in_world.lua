-- EVERY BUBBLE LABEL IS A FACT IN THE SURVIVOR'S WORLD.
--
-- The coloured Say bubble carries "the fact, in as few words as will fit"
-- (PlayerVoice). Twelve labels did; the thirteenth said "Opening clue" - the
-- mod's own name for a mechanism - and the owner read it above the survivor's
-- head (Windows, 2026-09-25). Like "Not checked since you loaded this save"
-- the day before, it is vocabulary from outside the world. This holds every
-- label against a short list of words that belong to the mod, not the
-- survivor.
local f=assert(io.open("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua","rb"))
local s=f:read("*a"); f:close()
local labels={}
for label in s:gmatch('speak%(p,[^,]-,"([^"]+)"') do labels[#labels+1]=label end
assert(#labels>=13,"expected the bubble labels, found "..#labels)
local foreign={"clue","opening","mod","save","case file","document","evidence id","generated","runtime","debug"}
for _,label in ipairs(labels) do
    for _,word in ipairs(foreign) do
        assert(not label:lower():find(word,1,true),
            "bubble label '"..label.."' speaks from outside the world: '"..word.."'")
    end
end
print("PASS bubble labels: "..#labels.." labels, none in the mod's own vocabulary")
