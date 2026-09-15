-- Pocket organisers exist in the world, so a survivor can find one.
--
-- Owner, 2026-09-12: "our survivor can keep saving his evidence into the
-- evidence photobook we have on us and can be reread into the PDA when we find
-- it again (or another one?) ... it makes continuity after death and new
-- character very easy: we find the pda and we know about all misteries."
--
-- That is the whole reason this file exists. The case record is not kept in a
-- character - it is kept in the world - so a new survivor who finds ANY
-- organiser can read everything the last one learned. Your own machine is
-- usually on your own corpse; one from a desk drawer works just as well.
--
-- Rare on purpose: an office desk, an electronics shop, a lab. Finding one
-- should feel like finding a working radio, not like finding a nail.
local list=ProceduralDistributions and ProceduralDistributions.list
if list then
    local WHERE={
        {name="OfficeDesk",weight=0.6},
        {name="DeskGeneric",weight=0.4},
        {name="ElectronicStoreMisc",weight=1.2},
        {name="ElectronicStoreCounter",weight=1.0},
        {name="MedicalOfficeDesk",weight=0.5},
        {name="PoliceDesk",weight=0.5},
    }
    for _,where in ipairs(WHERE) do
        local entry=list[where.name]
        if entry and entry.items then
            entry.items[#entry.items+1]="ConspiracyFiles.Organiser"
            entry.items[#entry.items+1]=where.weight
        end
    end
end
