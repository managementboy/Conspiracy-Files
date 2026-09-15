-- The organiser shows a file with the survivor's own headings on it, as the
-- notebook does (P4-R114, owner 2026-09-15). FILES used to strip every heading
-- that was not one of its labelled fields, so WHAT IT MIGHT MEAN and the relay
-- memo's DATE NOTE ran straight on from the document's own words, and what a
-- document says could not be told from what the survivor makes of it.
-- Asserted through the real projection (EvidenceRows) into the real program.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text) return text end}
end
getTexture=function(path) return {path=path} end
ConspiracyFiles={}
local Memo=require("ConspiracyFiles/Generated/RelayMemo")
local Rows=require("ConspiracyFiles/EvidenceRows")
local A=require("ConspiracyFiles/KnoxApps")

local paper={id="d1",title="Dispatch copy / R-482",kind="dispatch",
    body="WHAT YOU FOUND\nA carbon copy, folded into quarters.\n\nRef R-482\nReceived July 5, 1993\n\n"
       .."WHAT IT MIGHT MEAN\nIt could be routine paperwork, filed late."}
local memo={id="m1",title=Memo.TITLE,kind=Memo.KIND,body=Memo.body()}
local runtime=function() return {known=function() return {paper,memo} end} end
ConspiracyFiles.NotebookUI={generatedRows=function(section)
    local rows=Rows.build(section,runtime)
    -- Where it was found, as the notebook's place index adds it: a field.
    rows[1].detailText=rows[1].detailText.."\n\nFOUND\nIn a kitchen drawer"
    return rows
end}

local files=A.files.list()
assert(#files==2,"both documents are files: "..#files)
local d=files[1].detail
local function at(text)
    local i=d:find(text,1,true)
    assert(i,"the organiser keeps "..text:gsub("\n"," / ")..": "..d)
    return i
end
local found=at("WHAT YOU FOUND\nA carbon copy")
local words=at("Ref R-482")
local meaning=at("WHAT IT MIGHT MEAN\nIt could be routine")
local note=at("DATE NOTE\nDated inside the nine days")
assert(found<words and words<meaning and meaning<note,"the blocks stay in the order the notebook reads them")

-- The labelled fields are unchanged: FOUND is a field, not a heading in the writing.
local fields=files[1].fields
assert(fields[1] and fields[1].label=="FOUND" and fields[1].value=="In a kitchen drawer",
    "FOUND is still a field: "..tostring(fields[1] and fields[1].label))
assert(not d:find("In a kitchen drawer",1,true),"a field is not repeated in the writing")
assert(not d:find("\nFOUND\n",1,true),"a field's heading is not repeated in the writing")

-- The memo keeps its own headings and letterhead, and carries no note against itself.
local m=files[2].detail
assert(m:find("WHAT IT MIGHT MEAN",1,true),"the memo keeps its headings: "..m)
assert(m:find("CUMBERLAND SIGNAL SERVICES",1,true),"the memo keeps its letterhead: "..m)
assert(not m:find("DATE NOTE",1,true),"the memo is not noted against itself")

print("PASS knox files labels: headings kept in order on the organiser, fields unchanged, memo letterhead kept")
