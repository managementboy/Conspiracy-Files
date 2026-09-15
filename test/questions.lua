-- "What do I make of it?" (P4-R113): the questions, the options a finished case
-- offers, and the survivor's own note, exactly as the owner approved them
-- (P4-R122). Pure text; the organiser only draws what this returns.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Q=require("ConspiracyFiles/Generated/Questions")
local Premises=require("ConspiracyFiles/Generated/Premises")

local function labels(list) local out={} for i,o in ipairs(list) do out[i]=o.label end return table.concat(out," | ") end

-- The approved wording.
assert(Q.TITLE=="What do I make of it?")
assert(Q.QUESTIONS[1].key=="reading" and Q.QUESTIONS[1].text=="Which reading do I believe?")
assert(Q.QUESTIONS[2].key=="matters" and Q.QUESTIONS[2].text=="Who do I think matters here?")
assert(Q.QUESTIONS[3].key=="way" and Q.QUESTIONS[3].text=="What would I check next?")
assert(Q.rowLabel(3)=="What do I make of it? - Case 3")

local premise=Premises.get("transfer-nobody-arranged")
local offered={premiseId=premise.id,outline="corroboration",people={"Delia Mercer","Roy Hale"},organisation="County Personnel Office"}

-- Options for each question, each list ending with "Clear my answer.".
local reading=Q.options("reading",offered)
assert(labels(reading)==premise.readings[1].." | "..premise.readings[2].." | I can't tell. | Clear my answer.",labels(reading))
assert(reading[1].value=="one" and reading[2].value=="two" and reading[3].value=="unsure" and reading[4].value==false)
assert(labels(Q.options("matters",offered))=="Delia Mercer | Roy Hale | County Personnel Office | Nobody, really. | Clear my answer.")
local way=Q.options("way",offered)
assert(way[1].label=="Follow the person." and way[3].label=="Listen for it." and way[4].label=="Clear my answer.")
assert(way[1].value=="person" and way[2].value=="records" and way[3].value=="listen")
assert(Q.options("cold",offered)==nil,"there is no fourth question")
-- No length limit (P4-R122, owner: "the wording can be as long as necessary"):
-- the pick list wraps, so an option only has to be non-empty text.
for _,q in ipairs(Q.QUESTIONS) do
    for _,o in ipairs(Q.options(q.key,offered)) do
        assert(type(o.label)=="string" and o.label~="","every option has words")
    end
end

-- What each question shows.
assert(Q.answerLabel("reading",nil,offered)=="(not yet)")
assert(Q.answerLabel("matters",{matters="person1"},offered)=="Delia Mercer")
assert(Q.answerLabel("way",{way="listen"},offered)=="Listen for it.")

-- The survivor's note: only what is answered, never a verdict.
assert(Q.note(nil,offered)==nil and Q.note({},offered)==nil,"nothing answered, no note")
assert(Q.note({reading="two",matters="person1",way="person"},offered)==
    "I think it was a move nobody would sign for. Delia Mercer matters here. Next I would follow the person.")
assert(Q.note({matters="organisation"},offered)=="County Personnel Office matters here.")
local used=Q.note({reading="unsure",matters="nobody",way="listen",usedBy="generated:9:case"},offered)
assert(used=="I can't tell which it was. Nobody really matters here. Next I would listen for it. I've gone on from here.",used)

-- Every premise's two readings read naturally in the note.
for _,id in ipairs(Premises.list()) do
    for _,v in ipairs({"one","two"}) do
        local n=Q.note({reading=v},{premiseId=id,people={"Ann Bell","Carl Dunn"},organisation="Some Office"})
        assert(n and n:match("^I think it was [a-z]"),id.." "..v..": "..tostring(n))
        assert(not n:find("%.%.") and not n:find("  ") and not n:find("it was it ",1,true),id.." "..v..": "..n)
    end
end

-- A case whose premise is unknown still offers "I can't tell." rather than nothing.
local unknown=Q.options("reading",{premiseId="no-such-premise",people={"Ann Bell","Carl Dunn"},organisation="X"})
assert(#unknown==2 and unknown[1].value=="unsure" and unknown[2].value==false)
print("PASS the three questions, their options and the survivor's note read as approved")
