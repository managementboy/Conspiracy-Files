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
local Premises=require("ConspiracyFiles/Generated/Premises")
local found=false
for _,id in ipairs(Premises.list()) do local p=Premises.get(id)
    if p.claim and p.claim.title and p.claim.title:find("Staff photograph",1,true) then
        assert(p.claim.kind=="photograph","the staff photograph is a photograph, not a "..tostring(p.claim.kind)); found=true
    end
end
assert(found,"the staff photograph premise exists")
print("PASS object names: acronyms stay whole, variants drop, a photograph is a photograph")
