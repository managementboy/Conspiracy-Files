-- Knox.OS: the programs.
--
-- Each is a view over something the mod already knows (docs/design/KNOX_OS.md).
-- None of them invent knowledge and none state what the player has not earned;
-- a smarter screen does not change that rule.
--
--   FILES    the evidence, with record numbers        (the notebook's own rows)
--   NAMES    every identity seen, and where           (IdentityObservations)
--   DATES    what was found on which day              (DiscoveryLedger hours)
--   TO DO    leads the survivor set for themselves    (written here, by tapping)
--
-- A program is a table with `title`, `list(state)` returning rows, and
-- optionally `open(row)` for what a tap on a row does. Everything else - the
-- title bar, the scrolling, the arrows - belongs to the shell.
local K=require("ConspiracyFiles/KnoxUI")
ConspiracyFiles=ConspiracyFiles or {}
local A=ConspiracyFiles.KnoxApps or {}
ConspiracyFiles.KnoxApps=A

local function safe(fn,...) local ok,v=pcall(fn,...) if ok then return v end end

-- The in-game date an event happened, from the world hours stamped on it.
-- getGameTime() knows today; the ledger knows how many world hours ago a thing
-- was found; the difference is the date. Nothing is stored for this.
local MONTHS={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
function A.dateOf(atHours)
    local clock=getGameTime and getGameTime()
    if not clock or type(atHours)~="number" then return nil end
    local now=safe(function() return clock:getWorldAgeHours() end)
    if type(now)~="number" then return nil end
    local daysAgo=math.floor((now-atHours)/24)
    local day=safe(function() return clock:getDay() end) or 0
    local month=safe(function() return clock:getMonth() end) or 0
    local year=safe(function() return clock:getYear() end) or 1993
    -- Walk back day by day; a case is days old, not years, so this is cheap
    -- and avoids a calendar library for a game with 30-day months.
    local lengths={31,28,31,30,31,30,31,31,30,31,30,31}
    day=day+1; month=month+1
    for _=1,daysAgo do
        day=day-1
        if day<1 then
            month=month-1
            if month<1 then month=12; year=year-1 end
            day=lengths[month]
        end
    end
    return {day=day,month=month,year=year,
            label=day.." "..(MONTHS[month] or "?").." "..year,
            key=year*10000+month*100+day,
            hour=math.floor(atHours%24)}
end

-- FILES ----------------------------------------------------------------------
A.files={
    id="FILES",title="FILES",
    list=function()
        local ui=ConspiracyFiles.NotebookUI
        local rows=(ui and ui.generatedRows and safe(ui.generatedRows,"evidence")) or {}
        local out={}
        for _,row in ipairs(rows) do
            if not row.cfHeading then
                out[#out+1]={label=(row.ordinal and (row.ordinal..". ") or "")..(row.title or ""),
                             title=row.title,detail=row.detailText,id=row.id}
            end
        end
        return out
    end,
}

-- NAMES ----------------------------------------------------------------------
-- The address book. Every name the player has actually seen on a document, in
-- the order they were seen, with where it was found underneath. A name is a
-- lead: the book says where a name was written, never who anybody is.
A.names={
    id="NAMES",title="NAMES",
    list=function()
        local log=ConspiracyFiles.IdentityObserver or ConspiracyFiles.LocalPersonRuntime
        local rows=safe(function()
            local Identity=require("ConspiracyFiles/IdentityObservations")
            local store=ModData and ModData.get("ConspiracyFiles.IdentityObservations")
            local root=store and store.canonical
            if not root then return nil end
            return Identity.rows(root)
        end) or {}
        local out={}
        for _,row in ipairs(rows) do
            local name=row.name or row.title
            if name then
                out[#out+1]={label=tostring(name),title=tostring(name),
                             detail=tostring(row.detail or row.summary or ""),id=row.id}
            end
        end
        return out
    end,
}

-- DATES ----------------------------------------------------------------------
-- The date book. Every discovery carries the world hour it was made at, so
-- this is a timeline the player wrote with their own feet.
A.dates={
    id="DATES",title="DATES",
    list=function()
        local log=ConspiracyFiles.DiscoveryLog
        local events=(log and log.events and safe(log.events)) or {}
        local ui=ConspiracyFiles.NotebookUI
        local rows=(ui and ui.generatedRows and safe(ui.generatedRows,"evidence")) or {}
        local titles={}
        for _,row in ipairs(rows) do if row.id then titles[row.id]=row.title end end
        local byDay,order={},{}
        for _,event in ipairs(events) do
            local when=A.dateOf(event.at)
            if when then
                if not byDay[when.key] then byDay[when.key]={label=when.label,items={}}; order[#order+1]=when.key end
                local what=titles[event.ref] or event.kind
                local items=byDay[when.key].items
                items[#items+1]=string.format("%02d:00  %s",when.hour,tostring(what))
            end
        end
        table.sort(order)
        local out={}
        for _,key in ipairs(order) do
            local day=byDay[key]
            out[#out+1]={label=day.label.."  ("..#day.items..")",title=day.label,
                         detail=table.concat(day.items,"\n"),id="day-"..key}
        end
        return out
    end,
}

-- TO DO ----------------------------------------------------------------------
-- The one program the survivor writes rather than reads, and it takes no
-- typing: a to-do is made by tapping a record's "REMIND" command, so the text
-- is always something the player has already found. Ticked off by tapping.
local TAG="ConspiracyFiles.KnoxToDo"
local function store()
    local root=ModData and ModData.getOrCreate(TAG)
    if root and type(root.items)~="table" then root.items={} end
    return root
end

function A.addToDo(text)
    local root=store(); if not root then return false end
    if type(text)~="string" or text=="" or #text>120 then return false end
    for _,item in ipairs(root.items) do if item.text==text then return false end end
    root.items[#root.items+1]={text=text,done=false}
    return true
end

function A.tickToDo(index)
    local root=store(); if not root then return false end
    local item=root.items[index]
    if not item then return false end
    item.done=not item.done
    return true
end

A.todo={
    id="TODO",title="TO DO",
    list=function()
        local root=store()
        local out={}
        for i,item in ipairs((root and root.items) or {}) do
            out[#out+1]={label=(item.done and "[x] " or "[ ] ")..item.text,title=item.text,
                         detail=item.done and "Done." or "Still open.",id="todo-"..i,index=i,todo=true}
        end
        if #out==0 then
            out[1]={label="Nothing set.",title="Nothing set.",
                    detail="Open a file and press REMIND to set yourself a reminder.",id="todo-none"}
        end
        return out
    end,
}

A.programs={A.files,A.names,A.dates,A.todo}

return A
