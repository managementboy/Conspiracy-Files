-- The words that are actually on the paper, split into pages an item can hold.
--
-- A noted-evidence entry is three things: a description of the object, the text
-- written on it, and what the survivor makes of it. Only the middle one
-- belongs on the object. The survivor's own headings (Headings.lua) describe
-- what they can see and what they make of it - and a document
-- carrying its own interpretation would be a very strange document.
--
-- Pure: no PZ dependency, so the split is testable without launching a game.
local PlaceNames=require("NHShared/Generated/PlaceNames")
local H=require("NHShared/Headings")
-- A hundred pages: texts have no maximum (owner, 2026-09-29); the item is
-- given as many pages as its text needs (GeneratedRuntime.writePages).
-- The vanilla journal that opens a locked page holds at most 15 lines of 80
-- characters (T7, installed ISUIWriteJournal). A page is kept to 13 lines at an
-- assumed 70 characters each, so a page of short paragraphs cannot run past it.
local M={MAX_PAGE_CHARS=700,MAX_PAGES=100,MAX_PAGE_LINES=13,LINE_CHARS=70}

-- Lines a block of text takes on the page: each paragraph wraps at LINE_CHARS.
function M.lines(text)
    local n=0
    for line in (text.."\n"):gmatch("(.-)\n") do
        n=n+math.max(1,math.ceil(#line/M.LINE_CHARS))
    end
    return n
end
-- Headings the mod adds around the document's own text. Everything from the
-- first of these onwards is ours.
local OURS=H.OURS

function M.text(body)
    if type(body)~="string" or body=="" then return nil end
    local cut=#body+1
    for _,heading in ipairs(OURS) do
        local at=body:find(heading,1,true)
        if at and at<cut then cut=at end
    end
    local text=body:sub(1,cut-1)
    -- Drop the leading object description, which is the paragraph after the
    -- "what I think I found" heading.
    local found=text:find(H.FOUND,1,true)
    if found then
        local blank=text:find("\n\n",found,true)
        text=blank and text:sub(blank+2) or ""
    end
    text=text:gsub("^%s+",""):gsub("%s+$","")
    if text=="" then return nil end
    return text
end

-- Same saved sites as the journal. The adapter may supply the observed street
-- address resolver; this pure module never reads live world state itself.
function M.resolve(body,case,describe)
    if type(case)~="table" or type(case.locations)~="table" then return body end
    local source=body
    if type(describe)=="function" then body=describe(body,case) or body end
    return PlaceNames.render(body,case,source,describe)
end

function M.pages(body,case,describe)
    local text=M.text(body)
    if not text then return {} end
    text=M.resolve(text,case,describe)
    local paragraphs={}
    for p in (text.."\n\n"):gmatch("(.-)\n\n") do
        if p:find("%S") then paragraphs[#paragraphs+1]=p end
    end
    local pages,current={},""
    local function flush() if current~="" then pages[#pages+1]=current; current="" end end
    for _,para in ipairs(paragraphs) do
        if #pages>=M.MAX_PAGES then break end
        if current=="" then current=para
        elseif #current+#para+2<=M.MAX_PAGE_CHARS and M.lines(current.."\n\n"..para)<=M.MAX_PAGE_LINES then current=current.."\n\n"..para
        else flush(); current=para end
        -- A paragraph longer than a page is cut on whitespace, never mid-word.
        while (#current>M.MAX_PAGE_CHARS or M.lines(current)>M.MAX_PAGE_LINES) and #pages<M.MAX_PAGES do
            local head=current:sub(1,math.min(M.MAX_PAGE_CHARS,M.MAX_PAGE_LINES*M.LINE_CHARS))
            local cut=head:match("^.*%s")
            if not cut or #cut<M.MAX_PAGE_CHARS/2 then cut=head end
            pages[#pages+1]=(cut:gsub("%s+$",""))
            current=(current:sub(#cut+1):gsub("^%s+",""))
        end
    end
    if #pages<M.MAX_PAGES then flush() end
    return pages
end

return M
