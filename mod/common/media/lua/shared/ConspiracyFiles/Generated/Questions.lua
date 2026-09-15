-- "What do I make of it?" (P4-R113; wording P4-R122). Pure data and text, zero
-- engine dependencies, plain Lua 5.1: the three questions, the options one
-- finished case offers for each, and the survivor's own note built from the
-- answers. Nothing here ever says whether an answer is right.
local Premises=require("ConspiracyFiles/Generated/Premises")
local M={}
M.TITLE="What do I make of it?"
M.NOT_YET="(not yet)"
M.CLEAR="Clear my answer."
M.GONE_ON="I've gone on from here."
M.QUESTIONS={
    {key="reading",text="Which reading do I believe?"},
    {key="matters",text="Who do I think matters here?"},
    {key="way",text="What would I check next?"},
}
local WAYS={
    {value="person",label="Follow the person.",note="follow the person"},
    {value="records",label="Check the place against its records.",note="check the place against its records"},
    {value="listen",label="Listen for it.",note="listen for it"},
}

-- The case's two readings, ordinary first, from its premise.
function M.readings(offered)
    local premise=type(offered)=="table" and Premises.get(offered.premiseId)
    local r=premise and premise.readings
    if type(r)=="table" and #r==2 then return r end
    return nil
end

-- The options for one question, in order, as {value=..., label=...}. The last
-- is always "Clear my answer." with value false.
function M.options(key,offered)
    local out={}
    if key=="reading" then
        local r=M.readings(offered)
        if r then out[1]={value="one",label=r[1]}; out[2]={value="two",label=r[2]} end
        out[#out+1]={value="unsure",label="I can't tell."}
    elseif key=="matters" then
        local people=type(offered)=="table" and offered.people or {}
        if people[1] then out[#out+1]={value="person1",label=people[1]} end
        if people[2] then out[#out+1]={value="person2",label=people[2]} end
        if type(offered)=="table" and offered.organisation then out[#out+1]={value="organisation",label=offered.organisation} end
        out[#out+1]={value="nobody",label="Nobody, really."}
    elseif key=="way" then
        for _,w in ipairs(WAYS) do out[#out+1]={value=w.value,label=w.label} end
    else
        return nil
    end
    out[#out+1]={value=false,label=M.CLEAR}
    return out
end

-- What a question currently shows: the chosen option, or "(not yet)".
function M.answerLabel(key,answers,offered)
    local v=type(answers)=="table" and answers[key] or nil
    if v==nil then return M.NOT_YET end
    for _,o in ipairs(M.options(key,offered) or {}) do if o.value==v then return o.label end end
    return M.NOT_YET
end

local function lowerFirst(s) return s:sub(1,1):lower()..s:sub(2) end
local function noStop(s) return (s:gsub("%.$","")) end

-- The survivor's own note from whatever is answered, or nil when nothing is.
-- Once a case has been built from the answers it adds "I've gone on from here."
function M.note(answers,offered)
    if type(answers)~="table" then return nil end
    local parts={}
    if answers.reading=="unsure" then
        parts[#parts+1]="I can't tell which it was."
    elseif answers.reading=="one" or answers.reading=="two" then
        local r=M.readings(offered)
        if r then parts[#parts+1]="I think it was "..lowerFirst(noStop(r[answers.reading=="one" and 1 or 2]))..". " end
    end
    local people=type(offered)=="table" and offered.people or {}
    if answers.matters=="nobody" then parts[#parts+1]="Nobody really matters here."
    elseif answers.matters=="person1" and people[1] then parts[#parts+1]=people[1].." matters here."
    elseif answers.matters=="person2" and people[2] then parts[#parts+1]=people[2].." matters here."
    elseif answers.matters=="organisation" and offered.organisation then parts[#parts+1]=offered.organisation.." matters here." end
    for _,w in ipairs(WAYS) do if answers.way==w.value then parts[#parts+1]="Next I would "..w.note.."." end end
    if #parts==0 then return nil end
    local text=table.concat(parts," "):gsub("  +"," ")
    if answers.usedBy then text=text.." "..M.GONE_ON end
    return text
end

-- The FILES row for a finished case, marked with its place in the campaign.
function M.rowLabel(caseNumber) return M.TITLE.." - Case "..tostring(caseNumber) end

return M
