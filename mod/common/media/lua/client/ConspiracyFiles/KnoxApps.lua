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
-- A record is shown the way a Palm application showed one: the title, then the
-- few facts as labelled fields, then a rule, then what the survivor actually
-- wrote. The window's own filing furniture stays in the window.
--
-- The fields come out of the projection's own ALLCAPS blocks (FOUND, MAP,
-- PHYSICAL OBJECT ...), so nothing is invented here and any wording the
-- notebook improves arrives on the device with it.
local FIELD={FOUND="FOUND",["MAP"]="MAP",["PHYSICAL OBJECT"]="OBJECT",
             ["ATTACHED"]="NOTES",["ORIGINAL CONTEXT"]="CONTEXT"}

local function split(detail)
    local body,fields={},{}
    for block in (tostring(detail or "").."\n\n"):gmatch("(.-)\n\n") do
        local heading,rest=block:match("^(%u[%u%s]+)\n(.*)$")
        if heading and FIELD[heading] then
            fields[#fields+1]={label=FIELD[heading],value=rest:gsub("\n"," ")}
        elseif heading then
            body[#body+1]=rest
        elseif block:find("%S") then
            body[#body+1]=block
        end
    end
    return table.concat(body,"\n\n"),fields
end

A.files={
    id="FILES",title="FILES",icon="files",
    list=function()
        local ui=ConspiracyFiles.NotebookUI
        local rows=(ui and ui.generatedRows and safe(ui.generatedRows,"evidence")) or {}
        local log=ConspiracyFiles.DiscoveryLog
        local when={}
        for _,event in ipairs((log and log.events and safe(log.events)) or {}) do
            local date=A.dateOf(event.at)
            if date then when[event.ref]=string.format("%s, %02d:00",date.label,date.hour) end
        end
        local out={}
        for _,row in ipairs(rows) do
            if not row.cfHeading then
                local body,fields=split(row.detailText)
                if when[row.id] then table.insert(fields,1,{label="WHEN",value=when[row.id]}) end
                out[#out+1]={label=(row.ordinal and (row.ordinal..". ") or "")..(row.title or ""),
                             title=row.title,detail=body,fields=fields,id=row.id}
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
    id="NAMES",title="NAMES",icon="names",
    list=function()
        -- Ask the observer for its own rows rather than re-reading its store:
        -- it already joins the outfit and the address in, and a second reader
        -- guessing at the store's shape is how the address book came up empty
        -- with an ID in the player's pocket (knox check, 2026-09-12).
        local observer=ConspiracyFiles.IdentityObserver
        local rows=(observer and observer.rows and safe(observer.rows)) or {}
        local out={}
        for _,row in ipairs(rows) do
            -- The notebook says "Found Ines Kubiak's ID card" because it is a
            -- list of findings. An address book is a list of PEOPLE, so the
            -- name leads and the document is the detail.
            local label=tostring(row.title or ""):gsub("^Found ","")
            out[#out+1]={label=label,title=label,detail=tostring(row.detailText or ""),id=row.id}
        end
        return out
    end,
}

-- DATES ----------------------------------------------------------------------
-- The date book. Every discovery carries the world hour it was made at, so
-- this is a timeline the player wrote with their own feet.
A.dates={
    id="DATES",title="DATES",icon="dates",
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
    id="TODO",title="TO DO",icon="todo",
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

-- HELP -----------------------------------------------------------------------
-- Written for this device, not inherited from the window: the old help was
-- about tabs, a filter box and a contrast toggle, none of which exist here.
A.help={
    id="HELP",title="HELP",icon="help",
    list=function()
        return {
            {label="Survive first",title="Survive first",
             detail="This machine records what you find. It sets no objectives and promises no answer.\n\nReading it takes your main hand. Something can reach you while you read."},
            {label="The keys",title="The keys",
             detail="VIEW  the program list.\nPREV  the record before.\nNEXT  the record after.\nLIST  open a record, or back out.\nROCKER  page through a record.\n\nThe power key at the top switches the screen off. Hold it for the lamp."},
            {label="The stylus",title="The stylus",
             detail="Tap a program to open it. Tap a record to read it. Tap the arrows in the right margin to page. Tap the name in the title bar to come back here."},
            {label="Files",title="Files",
             detail="Everything you have inspected, numbered in the order you found it. A number never changes."},
            {label="Names",title="Names",
             detail="Every name you have seen on a document, and where you saw it.\n\nA name on a paper is a lead. It does not say who anybody is."},
            {label="Dates",title="Dates",
             detail="What you found, by the day you found it. Built from your own movements; nothing is added."},
            {label="To do",title="To do",
             detail="Open a file and press REMIND to set yourself a reminder. Tap a reminder to tick it off."},
            {label="Battery",title="Battery",
             detail="The cell in the corner is real. A flat machine will not read, and your papers still will."},
        }
    end,
}

A.programs={A.files,A.names,A.dates,A.todo,A.help}

return A
