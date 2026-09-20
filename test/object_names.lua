-- Player-facing names made from item ids (Generator.words), and the photograph
-- carrier. Found by the Linux core-loop run, 2026-09-11: an evidence object was
-- named "C dplayer, marked Curtis Vance", and a staff photograph was listed as
-- a "Handwritten cover letter" and placed as a letter.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local cases={
    CDplayer="CD player", IDcard="ID card", IDcard_Stolen="stolen ID card", IDcard_Female="ID card",
    RPGmanual="RPG manual", TVDinner="TV dinner", BBQSauce="BBQ sauce", SCBA="SCBA",
    CreditCard_Stolen="stolen credit card", Kneepad_Right_Leather="leather kneepad", Diary1="diary",
    BandageDirty="dirty bandage",
}
for id,want in pairs(cases) do
    local got=G.words(id)
    assert(got==want, id.." -> "..tostring(got)..", wanted "..want)
end
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local photo=assert(Kinds.get("photograph"))
assert(photo.fullType=="Base.Photo" and photo.label=="Photograph" and photo.capacity=="prose")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
for variant=1,2 do
    local scenario=assert(Ordinary.get("photograph-without-a-name",variant))
    assert(scenario.anchors.claim.kind=="photograph","authored photograph must use the photograph carrier")
end
print("PASS object names: acronyms stay whole, variants drop, a photograph is a photograph")
assert(G.words("PressID")=="press ID", G.words("PressID"))
assert(G.words("LighterBBQ")=="lighter BBQ", G.words("LighterBBQ"))
-- Developer and placeholder items are never evidence.
local Rules=require("ConspiracyFiles/Generated/ObjectRules")
for _,rule in ipairs(Rules.list()) do
    for _,id in ipairs(Rules.candidates(rule)) do
        assert(not (id:find("Debug") or id:find("DEBUG") or id:sub(1,4)=="Test" or id:find("Unusable") or id:find("_DEV_")),
            "rule "..rule.." can choose the developer/placeholder item "..id)
    end
end
print("PASS object names: trailing acronyms, and no debug/test/placeholder item is ever evidence")
