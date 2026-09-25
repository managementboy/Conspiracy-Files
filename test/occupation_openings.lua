-- THE OCCUPATION FAMILIES ARE WITHDRAWN FROM ROUTING.
--
-- Built 2026-09-25 as one family per Build 42 occupation on the Fitness five-
-- finding grammar, and withdrawn the same day. Owner: "repetitions break the
-- illusion of a true mystery. Every mystery has to be different by design. No
-- one can be like the other." One mystery in twenty-four coats is what they
-- were (DR-20260925-OCCUPATION-OPENINGS-WITHDRAWN).
--
-- Held: no profession but the Fitness Instructor routes to a family; the
-- authored errands stay on disk as material and still validate, so they can
-- be quarried for starts designed one at a time; and the routing switch is
-- off in the source, not merely unreachable.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Story=require("ConspiracyFiles/Generated/Story")
local Occupations=require("ConspiracyFiles/Generated/OccupationOpeningScenarios")

local PROFESSIONS={"burglar","burgerflipper","carpenter","chef","constructionworker","doctor","electrician",
 "engineer","farmer","fireofficer","fisherman","lumberjack","mechanics","metalworker",
 "nurse","parkranger","policeofficer","rancher","repairman","securityguard","smither","tailor","unemployed","veteran"}
for _,p in ipairs(PROFESSIONS) do
    assert(Premises.forProfession(p)==nil,p.." still routes to a family")
    assert(Personal.get(p.."-start",1)==nil,p..": a withdrawn family is still selectable by id")
    -- The material is intact, and honest, for later use.
    for i,s in ipairs(Occupations.get(p)) do
        local ok,why=Story.validate(s)
        assert(ok,p.." start "..i.." no longer validates: "..tostring(why))
    end
end
assert(Occupations.ROUTED==false,"the routing switch must be off in the source")
assert(#Premises.professions()==1 and Premises.professions()[1]=="fitnessinstructor",
    "only the Fitness Instructor keeps a routed opening family")
print("PASS occupation openings: withdrawn from routing; 24 families' material kept and valid")
