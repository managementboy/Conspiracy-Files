-- Closing interpretations are authored with a case, then frozen on its
-- retirement record. Premise metadata must not recreate them.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Q=require("ConspiracyFiles/Generated/Questions")
local Premises=require("ConspiracyFiles/Generated/Premises")
local Personal=require("ConspiracyFiles/Generated/PersonalScenarios")
local Ordinary=require("ConspiracyFiles/Generated/OrdinaryScenarios")
local function labels(list) local out={} for i,o in ipairs(list) do out[i]=o.label end return table.concat(out," | ") end
local function scenario(id,variant) return Personal.get(id,variant) or Ordinary.get(id,variant) end

assert(Q.TITLE=="What do I make of it?")
assert(Q.QUESTIONS[1].key=="reading" and Q.QUESTIONS[1].text=="Which reading do I believe?")
assert(Q.QUESTIONS[2].key=="matters" and Q.QUESTIONS[2].text=="Who do I think matters here?")
assert(Q.QUESTIONS[3].key=="way" and Q.QUESTIONS[3].text=="What would I check next?")
assert(Q.rowLabel(3)=="What do I make of it? - Case 3")
assert(#Premises.list()==22,"the metadata registry has all twenty-two authored families")

local covered=0
for _,id in ipairs(Premises.list()) do
    for variant=1,2 do
        local authored=assert(scenario(id,variant),id.." variant "..variant.." must carry authored readings")
        local offered={premiseId=id,readings=authored.readings,people={"Delia Mercer","Roy Hale"},organisation="County Personnel Office"}
        assert(#authored.readings==2 and Q.readings(offered)==authored.readings)
        local reading=Q.options("reading",offered)
        assert(labels(reading)==authored.readings[1].." | "..authored.readings[2].." | I can't tell. | Clear my answer.")
        assert(Q.note({reading="one"},offered)=="My reading: "..authored.readings[1])
        assert(Q.note({reading="two"},offered)=="My reading: "..authored.readings[2])
        covered=covered+1
    end
    -- The registry is allowed to name a family, but no longer carries an
    -- ending or a reading that can leak into an old/incomplete archive.
    local metadataOnly={premiseId=id,people={"Ann Bell","Carl Dunn"},organisation="Some Office"}
    local unknown=Q.options("reading",metadataOnly)
    assert(#unknown==2 and unknown[1].value=="unsure" and unknown[2].value==false)
    assert(Q.note({reading="one"},metadataOnly)==nil,"metadata leaked a reading for "..id)
end
assert(covered==44,"every authored family variant supplies saved readings")

local offered={readings={"The first reading.","The second reading."},people={"Delia Mercer","Roy Hale"},organisation="County Personnel Office"}
assert(labels(Q.options("matters",offered))=="Delia Mercer | Roy Hale | County Personnel Office | Nobody, really. | Clear my answer.")
assert(Q.answerLabel("reading",nil,offered)=="(not yet)")
assert(Q.answerLabel("matters",{matters="person1"},offered)=="Delia Mercer")
assert(Q.answerLabel("way",{way="listen"},offered)=="Listen for it.")
assert(Q.note(nil,offered)==nil and Q.note({},offered)==nil,"nothing answered, no note")
assert(Q.note({reading="two",matters="person1",way="person"},offered)==
    "My reading: The second reading. Delia Mercer matters here. Next I would follow the person.")
local used=Q.note({reading="unsure",matters="nobody",way="listen",usedBy="generated:9:case"},offered)
assert(used=="I haven't settled on a reading. Nobody really matters here. Next I would listen for it. I've gone on from here.")
local noPeople=Q.options("matters",{readings=offered.readings,people="bad"})
assert(labels(noPeople)=="Nobody, really. | Clear my answer.","missing or malformed people cannot invent actors")
assert(Q.options("cold",offered)==nil,"there is no fourth question")
print("PASS questions: all authored readings are frozen on offered records and metadata cannot leak an ending")
