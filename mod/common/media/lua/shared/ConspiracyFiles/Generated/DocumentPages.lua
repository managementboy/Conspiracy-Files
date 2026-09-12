-- The words that are actually on the paper, split into pages an item can hold.
--
-- A notebook entry is three things: a description of the object, the text
-- written on it, and what the survivor makes of it. Only the middle one
-- belongs on the object. "WHAT YOU FOUND" describes what a player can see by
-- looking at it, and "WHAT IT MIGHT MEAN" is their own reasoning - a document
-- carrying its own interpretation would be a very strange document.
--
-- Pure: no PZ dependency, so the split is testable without launching a game.
local M={MAX_PAGE_CHARS=700,MAX_PAGES=8}
-- Headings the mod adds around the document's own text. Everything from the
-- first of these onwards is ours.
local OURS={"WHAT IT MIGHT MEAN","MAP NOTE","PHYSICAL OBJECT","CONNECTED"}

function M.text(body)
    if type(body)~="string" or body=="" then return nil end
    local cut=#body+1
    for _,heading in ipairs(OURS) do
        local at=body:find(heading,1,true)
        if at and at<cut then cut=at end
    end
    local text=body:sub(1,cut-1)
    -- Drop the leading object description, which is the paragraph after the
    -- WHAT YOU FOUND heading.
    local found=text:find("WHAT YOU FOUND",1,true)
    if found then
        local blank=text:find("\n\n",found,true)
        text=blank and text:sub(blank+2) or ""
    end
    text=text:gsub("^%s+",""):gsub("%s+$","")
    if text=="" then return nil end
    return text
end

function M.pages(body)
    local text=M.text(body)
    if not text then return {} end
    local paragraphs={}
    for p in (text.."\n\n"):gmatch("(.-)\n\n") do
        if p:find("%S") then paragraphs[#paragraphs+1]=p end
    end
    local pages,current={},""
    local function flush() if current~="" then pages[#pages+1]=current; current="" end end
    for _,para in ipairs(paragraphs) do
        if #pages>=M.MAX_PAGES then break end
        if current=="" then current=para
        elseif #current+#para+2<=M.MAX_PAGE_CHARS then current=current.."\n\n"..para
        else flush(); current=para end
        -- A paragraph longer than a page is cut on whitespace, never mid-word.
        while #current>M.MAX_PAGE_CHARS and #pages<M.MAX_PAGES do
            local head=current:sub(1,M.MAX_PAGE_CHARS)
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
