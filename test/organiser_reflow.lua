-- A record keeps the line breaks it was written with, and a document is written
-- to about sixty characters. Wrapping each stored line on its own put a long
-- line beside a stub on the organiser at 1.5x (owner, Windows, 2026-09-18:
-- "on 1,5x the linebreaks dont work"), e.g. "under standing" followed by
-- "emergency-maintenance procedure." A paragraph is reflowed first: a line
-- joins the one before it only when it begins in lower case.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/KnoxUI"]=function() return {} end
package.preload["ConspiracyFiles/KnoxApps"]=function() return {} end
package.preload["ConspiracyFiles/Generated/OrganiserFont"]=function() return {glyphs={}} end
package.preload["ConspiracyFiles/Generated/OrganiserFont24"]=function() return {glyphs={}} end
package.preload["Fieldnote/Geometry"]=function()
    return {device={w=100,h=200},lcd={x=0,y=0,w=80,h=120},controls={},components={}}
end
package.preload["Fieldnote/Panel"]=function() return {} end
package.preload["ISUI/ISPanel"]=function() return {} end
ISPanel={derive=function() return {} end}
ConspiracyFiles={}
Events={OnTick={Add=function() end},OnGameStart={Add=function() end},OnKeyPressed={Add=function() end},
        OnPostUIDraw={Add=function() end},OnRenderTick={Add=function() end}}
getCore=function() return {getScreenWidth=function() return 1280 end,getScreenHeight=function() return 800 end,
    getOptionFontSize=function() return 1 end} end
getTextManager=function() return {getFontHeight=function() return 12 end,MeasureStringX=function() return 10 end} end
getPlayer=function() return nil end
getTimeInMillis=function() return 0 end
local ok,S=pcall(dofile,"mod/common/media/lua/client/ConspiracyFiles/OrganiserScreen.lua")
assert(ok,"OrganiserScreen loads under fakes: "..tostring(S))
local reflow=(ConspiracyFiles.OrganiserScreen or {}).reflow
assert(type(reflow)=="function","the screen exposes its reflow")

-- A sentence broken by the writer's own sixty-character wrap becomes one line.
local memo=table.concat({
    "1. After-hours access at Relay Site 31 is authorized under standing",
    "emergency-maintenance procedure.",
    "",
    "2. Carrier tests on the reserve equipment are scheduled activity and do",
    "not, by themselves, require an incident report.",
},"\n")
local out=reflow(memo)
assert(out:find("under standing emergency%-maintenance procedure%."),out)
assert(out:find("scheduled activity and do not, by themselves"),out)
assert(select(2,out:gsub("\n",""))==2,"the blank line between the items stays: "..out)

-- Deliberate breaks stay: a numbered item, a letterhead, a heading in capitals.
local letterhead=reflow("CUMBERLAND SIGNAL SERVICES\n123 Main Street\nMuldraugh, KY")
assert(letterhead=="CUMBERLAND SIGNAL SERVICES\n123 Main Street\nMuldraugh, KY","a letterhead keeps its lines")
local items=reflow("1. First item\n2. Second item")
assert(items=="1. First item\n2. Second item","numbered items keep their lines")
local heading=reflow("WHAT IT MIGHT MEAN\nSomebody kept this here.")
assert(heading=="WHAT IT MIGHT MEAN\nSomebody kept this here.","a heading keeps its line")

-- Nothing odd on the edges.
assert(reflow("")=="" or reflow("")=="\n","empty text survives")
assert(reflow("one line")=="one line")
print("PASS organiser reflow: a wrapped sentence joins up, headings and numbered items keep their breaks")
