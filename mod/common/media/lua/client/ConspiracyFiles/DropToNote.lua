-- Papers dropped on the open organiser are noted, all of them (P4-R116; owner,
-- 2026-09-15: "being able to inspect several evidences by marking them and
-- dragging them onto the pda on top of right click inspect"). Right-click
-- Inspect stays as it was and takes one item.
--
-- The counting and the words live here; OrganiserScreen takes the drop. A
-- module of its own so the rules are testable without the game.
ConspiracyFiles=ConspiracyFiles or {}
local M=ConspiracyFiles.DropToNote or {}
ConspiracyFiles.DropToNote=M

M.MAX=64

local function isItem(value)
    if not value or not instanceof then return false end
    local ok,yes=pcall(instanceof,value,"InventoryItem")
    return ok and yes==true
end

-- The items in a drag, in the shape the inventory pane builds it
-- (ISInventoryPane:onMouseDown): a loose item, or a stack whose items[1] is
-- the row's header copy and items[2..] the things themselves - the reading
-- ISInventoryPane.getActualItems and the radio's drop box both use.
function M.items(dragging)
    local out,seen={},{}
    local function add(item)
        if isItem(item) and not seen[item] and #out<M.MAX then
            seen[item]=true
            out[#out+1]=item
        end
    end
    if type(dragging)~="table" then return out end
    for _,value in ipairs(dragging) do
        if isItem(value) then
            add(value)
        elseif type(value)=="table" and type(value.items)=="table" then
            for i=2,#value.items do add(value.items[i]) end
        end
    end
    return out
end

-- Note each case item: a carried one the ordinary way, the rest where they
-- lie. Nothing that is not case evidence is touched, and a paper already noted
-- is not inspected again. What happened comes back counted.
function M.note(items,runtime,inventory)
    local r={noted=0,known=0,failed=0,other=0}
    if type(runtime)~="table" then r.other=#items; return r end
    for _,item in ipairs(items) do
        -- Known first. A finished case's papers are no longer placement
        -- subjects - retiring a case drops that bookkeeping - but they are
        -- still noted, and dropping them again said NOT CASE EVIDENCE
        -- (drop_note check, 20260915T111000: a whole case noted in one drop).
        local okK,known=pcall(runtime.isInspected,item)
        if okK and known then
            r.known=r.known+1
        else
            local okS,subject=pcall(runtime.subject,item)
            if not okS or not subject then
                r.other=r.other+1
            else
                local okC,outer=pcall(function() return item:getOutermostContainer() end)
                local carried=okC and inventory~=nil and outer==inventory
                pcall(runtime.inspect,item,not carried)
                local okN,now=pcall(runtime.isInspected,item)
                if okN and now then r.noted=r.noted+1 else r.failed=r.failed+1 end
            end
        end
    end
    return r
end

-- The footer line, in the machine's own status voice (BATTERY LOW), short
-- enough for the largest text size.
function M.footer(r)
    if r.noted+r.known+r.failed==0 then return "NOT CASE EVIDENCE" end
    local tried=r.noted+r.failed
    if tried==0 then return "ALREADY NOTED" end
    if r.failed==0 then return "NOTED "..r.noted end
    return "NOTED "..r.noted.." OF "..tried
end

function M.describe(r)
    return "noted="..r.noted.." known="..r.known.." failed="..r.failed.." other="..r.other
end

return M
