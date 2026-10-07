-- A readable object holds its text in pages the vanilla journal can show:
-- at most 13 estimated lines and 700 characters a page, whole words, no text
-- lost, and the writer enables, fills and then locks the item (T7 recipe).
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local M=require("OIShared/Generated/DocumentPages")
local H=require("OIShared/Headings")

local function body(text) return H.FOUND.."\nAn object.\n\n"..text end

-- Many short paragraphs would stay under 700 characters yet run past 15 lines.
local paras={}
for i=1,40 do paras[#paras+1]="Line "..i.." of a list." end
local pages=M.pages(body(table.concat(paras,"\n\n")),{locations={}},nil)
assert(#pages>1,"a long list must split into several pages")
local joined=table.concat(pages,"\n\n")
for i=1,40 do assert(joined:find("Line "..i.." of a list.",1,true),"line "..i.." lost") end
for i,p in ipairs(pages) do
    assert(M.lines(p)<=M.MAX_PAGE_LINES,"page "..i.." runs "..M.lines(p).." lines")
    assert(#p<=M.MAX_PAGE_CHARS,"page "..i.." is too long")
end

-- One long paragraph is cut on whitespace and loses nothing.
local words={}
for i=1,300 do words[#words+1]="word"..i end
local long=table.concat(words," ")
pages=M.pages(body(long),{locations={}},nil)
for i,p in ipairs(pages) do
    assert(M.lines(p)<=M.MAX_PAGE_LINES and #p<=M.MAX_PAGE_CHARS,"long page "..i.." over the limit")
end
assert(table.concat(pages," "):gsub("%s+"," ")==long,"words lost or changed")

-- A short text is one page.
pages=M.pages(body("Back at six."),{locations={}},nil)
assert(#pages==1 and pages[1]=="Back at six.","a short text is one page")
print("nohelp_document_pages: ok")
