-- NAMES holds the names written on the case's own papers (owner, Windows,
-- 2026-09-15: "the pencil and key are marked with a name, but we did not create
-- an entry in the contacts").
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text) return text end}
end
getTexture=function(path) return {path=path} end
ConspiracyFiles={}
local G=require("ConspiracyFiles/Generated/Generator")
local A=require("ConspiracyFiles/KnoxApps")
assert(type(G.INVENTED_NAMES)=="table" and #G.INVENTED_NAMES==8,"the generator's names are readable")

local rows={
    {id="d1",title="Tagged key / LD-527",
     detailText="WHAT YOU FOUND\nA small worn key. The tag carries LD-527 and a name, Marion Ellis."},
    {id="d2",title="Pencil spiffo, marked Marion Ellis",detailText="A pencil."},
    {id="d3",title="Delivery docket / LD-527",detailText="Signed Roy Haley for Knox County Supply Office."},
    {id="d4",title="Receipt / LD-527",detailText="Received from Delia Mercer. Countersigned Joanne Vossberg."},
    {id="d5",title="Note",detailText="Left for Jarvis Harding."},
}
ConspiracyFiles.NotebookUI={generatedRows=function() return rows end}
ConspiracyFiles.PersonNameLog={names=function() return {"Jarvis Harding"} end}
ConspiracyFiles.IdentityObserver={rows=function()
    return {{title="Found Ines Kubiak's ID card",detailText="An ID card.",id="id1",person="Ines Kubiak"}}
end}

local list=A.names.list("All")
local labels={}
for _,r in ipairs(list) do labels[#labels+1]=r.label end
local function entry(name) for _,r in ipairs(list) do if r.label==name then return r end end end

local marion=assert(entry("Marion Ellis"),"a name on the case's own papers is in the book: "..table.concat(labels,", "))
assert(marion.detail:find("Tagged key / LD-527",1,true) and marion.detail:find("Pencil spiffo, marked Marion Ellis",1,true),
    "every paper carrying the name is listed: "..marion.detail)
assert(select(2,marion.detail:gsub("Tagged key",""))==1,"each paper once: "..marion.detail)
assert(marion.detail:find("A name on a paper is a lead",1,true),"a name stays a lead")
assert(entry("Delia Mercer"),"a name in a paper's text counts")
assert(entry("Jarvis Harding"),"a name met on a body and written on a case paper counts")
assert(not entry("Roy Hale"),"Roy Haley is not Roy Hale")
assert(not entry("Joanne Voss"),"Joanne Vossberg is not Joanne Voss")
assert(entry("Ines Kubiak's ID card"),"identity documents stay in the book")

assert(#A.names.list("Named")==#list,"a name from a paper is Named")
assert(#A.names.list("Unnamed")==0,"and never Unnamed")
assert(#A.names.list("Linked")==0,"Linked stays what the player connected")

ConspiracyFiles.NotebookUI={generatedRows=function() return {} end}
assert(#A.names.list("All")==1,"no papers inspected, no names from papers")

print("PASS knox case names: names on inspected case papers reach NAMES, whole names only, identity rows kept, filters honest")
