-- FILES opens with "What do I make of it?" for every finished case (P4-R113,
-- wording P4-R122): newest case first, above the evidence, carrying the
-- survivor's own note once anything is answered.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
getTexture=function(path) return {path=path} end
package.preload["ConspiracyFiles/EvidenceRows"]=function()
    return {list=function() return {{id="d1",ordinal=1,title="Dispatch copy / R-482",detailText="Some words."}} end,where=function() return nil end}
end
ConspiracyFiles={}
local A=require("ConspiracyFiles/KnoxApps")
-- The real offered table carries the case's two readings (RetiredCase builds
-- them from the story). Without them Questions.note silently drops the
-- survivor's chosen reading, so the fixture must supply them or this row
-- stops testing the reading at all.
local offered={premiseId="transfer-nobody-arranged",outline="corroboration",people={"Delia Mercer","Roy Hale"},organisation="County Personnel Office",
    readings={"It was a filing mistake nobody caught.","It was a move nobody would sign for."}}
local questions={
    {caseId="generated:9:case",number=3,offered=offered,answers={reading="two",matters="person1",way="person",changedHours=5}},
    {caseId="generated:4:case",number=1,offered=offered},
}
ConspiracyFiles.GeneratedRuntime={questions=function() return questions end,whereabouts=function() return nil end}

local files=A.files.list()
assert(#files==3,"two question rows and one piece of evidence: "..#files)
assert(files[1].label=="What do I make of it? - Case 3" and files[1].questions.caseId=="generated:9:case","the newest case's questions come first")
assert(files[1].detail=="My reading: It was a move nobody would sign for. Delia Mercer matters here. Next I would follow the person.",
    "an answered case carries the survivor's note: "..tostring(files[1].detail))
assert(files[2].label=="What do I make of it? - Case 1" and files[2].detail=="","an unanswered case has no note yet")
assert(files[3].title=="Dispatch copy / R-482","the evidence follows")

ConspiracyFiles.GeneratedRuntime.questions=function() return {} end
assert(#A.files.list()==1,"no finished case, no question row")
print("PASS FILES shows 'What do I make of it?' for each finished case, newest first, above the evidence")
