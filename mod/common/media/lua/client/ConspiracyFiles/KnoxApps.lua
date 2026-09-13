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

-- The two stores that live in the machine rather than in the world, named
-- here because the boot self-test measures them and it runs before either
-- program is defined. Organiser.lua clears exactly these when a cell goes
-- flat; if a third is ever added, it belongs in that list too.
local TAG="ConspiracyFiles.KnoxToDo"
local NOTES="ConspiracyFiles.KnoxNotes"

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
-- The survivor's own card. Owner, 2026-09-12: "the adress book should at least
-- have ourselfs in it." It is also the only entry in the book that is not a
-- lead: everything else is a name seen on a document, this one is a fact.
local ME="ConspiracyFiles.KnoxMe"
function A.rememberMe()
    local player=getPlayer and getPlayer()
    if not player then return end
    local root=ModData and ModData.getOrCreate(ME)
    if not root then return end
    if not root.woke then
        local address=ConspiracyFiles.AddressMap
        local place=address and address.nearest and safe(address.nearest,
            math.floor(player:getX()),math.floor(player:getY()),40)
        root.woke=type(place)=="string" and place or nil
        root.day=safe(function()
            local clock=getGameTime()
            return clock:getDay()+1 .. " " .. (MONTHS[clock:getMonth()+1] or "?") .. " " .. clock:getYear()
        end)
    end
    return root
end

function A.me()
    local player=getPlayer and getPlayer()
    if not player then return nil end
    local descriptor=safe(function() return player:getDescriptor() end)
    local forename=descriptor and safe(function() return descriptor:getForename() end)
    local surname=descriptor and safe(function() return descriptor:getSurname() end)
    local name=((forename or "").." "..(surname or "")):gsub("^%s+",""):gsub("%s+$","")
    if name=="" then return nil end
    local root=A.rememberMe() or {}
    local lines={"This is me."}
    -- getProfession() does not exist on a survivor in B42; the trade comes from
    -- getCharacterProfession():getName(). Verified
    -- against the installed jar rather than guessed (the guess threw three
    -- swallowed errors a run, 2026-09-12).
    -- The trade, as the game's own character screen resolves it:
    -- CharacterProfessionDefinition.getCharacterProfessionDefinition(prof)
    -- then getUIName() (ISCharacterScreen.loadProfession, installed game).
    --
    -- It used to build "IGUI_Occupation_"..getName() and hand that to
    -- getText. No such key exists in the game, and getText hands back the key
    -- it could not find, so the survivor's own card read
    -- "Work: IGUI_Occupation_fitnessinstructor" (owner screenshot,
    -- 2026-09-13). getName() is the lowercase id, never a translation key.
    local job=descriptor and safe(function()
        local profession=descriptor:getCharacterProfession()
        if not profession then return nil end
        local def=CharacterProfessionDefinition
            and CharacterProfessionDefinition.getCharacterProfessionDefinition(profession)
        local shown=def and def:getUIName()
        -- Never show a raw key. If the lookup fails, say nothing about the
        -- trade rather than printing plumbing at the player.
        if type(shown)=="string" and shown~="" and not shown:find("^%u+_") then
            return shown
        end
        return nil
    end)
    if type(job)=="string" and job~="" then
        lines[#lines+1]="Work: "..job
    end
    if root.woke then lines[#lines+1]="Woke up at "..root.woke.."." end
    if root.day then lines[#lines+1]="First day: "..root.day.."." end
    return {label=name,title=name,detail=table.concat(lines,"\n"),id="me",me=true}
end

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
        local me=A.me()
        if me then out[1]=me end
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
             detail="MENU  the program list. Wakes the machine.\nUP    the line or page above.\nDOWN  the line or page below.\nBACK  out of a record, then out to the programs.\n\nThere is no power switch. Hold MENU for the lamp. Left alone it switches itself off."},
            {label="Size",title="Size",
             detail="Point at the machine and press - to make it smaller, = to make it larger. Four sizes; it starts at whichever suits your screen.\n\nThose are the only keys it takes, and only while you are pointing at it: it never takes the map or the inventory off you.\n\nEvery size is a whole multiple, so a pixel stays square."},
            {label="The stylus",title="The stylus",
             detail="Tap a program to open it. Tap a record to read it. Tap the arrows in the right margin to page. Tap the name in the title bar to come back here."},
            {label="Files",title="Files",
             detail="Everything you have inspected, numbered in the order you found it. A number never changes."},
            {label="Names",title="Names",
             detail="Every name you have seen on a document, and where you saw it.\n\nA name on a paper is a lead. It does not say who anybody is."},
            {label="Dates",title="Dates",
             detail="What you found, by the day you found it. Built from your own movements; nothing is added."},
            {label="Notes",title="Notes",
             detail="Open NOTES and tap '+ write a note'. Type, then tap SEND; Enter does the same.\n\nA note goes into this machine and into the log, which reaches the people building this. It is how you tell them something without leaving the game."},
            {label="To do",title="To do",
             detail="Open a file and press REMIND to set yourself a reminder. Tap a reminder to tick it off."},
            {label="Battery",title="Battery",
             detail="The cell in the corner is real. A flat machine will not read, and your papers still will.\n\nBelow a fifth it says BATTERY LOW. The lamp needs more than a tenth to run at all.\n\nLeft alone for three minutes it switches itself off to save the cell. Any button wakes it."},
            {label="Memory",title="Memory",
             detail="A dead cell takes your notes and to-dos offline; it does not destroy them. Fit a fresh cell and the machine restores them on the next boot.\n\nWhat you have found is not kept in here. It is in the record, so any organiser reads it."},
        }
    end,
}

-- PLACES ----------------------------------------------------------------------
-- The place index, which until now lived only in the old window: the same
-- records, grouped under the places the survivor kept going back to. A heading
-- is earned by a return, never printed for every address (P4-R81).
A.places={
    id="PLACES",title="PLACES",icon="places",
    list=function()
        local ui=ConspiracyFiles.NotebookUI
        local rows=(ui and ui.generatedRows and safe(ui.generatedRows,"places")) or {}
        local out={}
        for _,row in ipairs(rows) do
            if row.cfHeading then
                out[#out+1]={label="- "..tostring(row.title or ""),title=tostring(row.title or ""),
                             detail=tostring(row.detailText or "A place you came back to."),
                             id="place-"..#out,heading=true}
            else
                out[#out+1]={label="  "..(row.title or ""),title=row.title,
                             detail=row.detailText,id=row.id}
            end
        end
        return out
    end,
}

-- BOOT ------------------------------------------------------------------------
-- What the machine says while the mod is still waking up. Owner, 2026-09-12:
-- "The PDA will show a boot screen telling the player to wait. for now we could
-- even show real information of what we are doing."
--
-- So every line here is a real state, never a fake progress bar: whether the
-- address book has been built, whether a case is being prepared, and how many
-- of its documents have reached the world.
function A.bootLines()
    -- Hardware by Lectromax, the game's own manufacturer; the software is
    -- ours. A boot screen is where a machine says who made it.
    local out={"LECTROMAX DATALINE 160","KNOX.OS 1.0","(c) 1993 Knox Systems",""}
    local address=ConspiracyFiles.AddressMap
    local ready=address and address.ready and safe(address.ready)
    out[#out+1]=ready and "Address book .... ready" or "Address book .... reading"
    local runtime=ConspiracyFiles.GeneratedRuntime
    local status=runtime and runtime.automaticStatus and safe(runtime.automaticStatus)
    if not status then
        out[#out+1]="Case ............ waiting"
    elseif status.preparing then
        out[#out+1]="Case ............ preparing"
    elseif (status.count or 0)>0 then
        out[#out+1]="Case ............ "..status.count.." open"
    else
        out[#out+1]="Case ............ none yet"
    end
    -- Count from the ledger, not from runtime.known(): that one resolves an
    -- address for every record, and the boot screen asks once a second, which
    -- the fault check caught as an address lookup retrying forever (suite,
    -- 2026-09-12). A count needs no addresses.
    local log=ConspiracyFiles.DiscoveryLog
    local events=(log and log.events and safe(log.events)) or {}
    out[#out+1]="Records ......... "..#events
    -- The self-test a machine of this age ran on every boot. The figure is
    -- real: 128K of RAM less what the stores actually hold, so it falls as the
    -- case grows, which is the only reason to print it at all.
    local notes=safe(function() return #((ModData.get(NOTES) or {}).items or {}) end) or 0
    local todos=safe(function() return #((ModData.get(TAG) or {}).items or {}) end) or 0
    local used=#events*96+notes*208+todos*128
    local free=math.max(0,128*1024-used)
    out[#out+1]=string.format("Memory .......... %dK free",math.floor(free/1024))
    -- A dead cell takes the machine's RAM offline; a fresh one brings it back.
    -- The player is told either way, because notes that quietly vanish and
    -- notes that quietly return are both a machine behaving like a bug.
    local organiser=ConspiracyFiles.Organiser
    local item=organiser and organiser.held and safe(organiser.held)
    if item and organiser.memoryRestored and safe(organiser.memoryRestored,item) then
        out[#out+1]="Restoring from backup ..."
        out[#out+1]="Notes and to-dos restored."
    elseif item and organiser.memoryAsleep and safe(organiser.memoryAsleep,item) then
        out[#out+1]="** MEMORY OFFLINE **"
        out[#out+1]="fit a cell to restore"
    end
    out[#out+1]=""
    if ready and status and not status.preparing and (status.count or 0)>0 then
        out[#out+1]="Ready."
    else
        out[#out+1]="Working. You can play;"
        out[#out+1]="this finishes by itself."
    end
    return out
end

-- SITES -----------------------------------------------------------------------
-- The hidden program: where the case's papers actually are. Owner's idea, and
-- it only exists in debug - a player must never be handed the answers.
A.sites={
    id="SITES",title="SITES",icon="sites",hidden=true,
    list=function()
        local runtime=ConspiracyFiles.GeneratedRuntime
        local text=runtime and runtime.devLocations and safe(runtime.devLocations)
        local out={}
        for line in (tostring(text or "").."\n"):gmatch("([^\n]*)\n") do
            if line:find("%S") then
                local id,place,rest=line:match("^(%S+)%s+(.-)%s+(%-?%d+,%-?%d+ floor.*)$")
                out[#out+1]={label=place or line,title=place or line,
                             detail=(id or "").."\n"..(rest or line),id="site-"..#out}
            end
        end
        if #out==0 then out[1]={label="No case placed.",title="No case placed.",detail="",id="site-none"} end
        return out
    end,
}

-- NOTES -----------------------------------------------------------------------
-- Feedback, typed in the game. Owner, 2026-09-12: "if you want we can also give
-- you feed back directly from there on things we notice. That way I dont have
-- to leave the game to type for you."
--
-- A note goes into the log, which is already streamed to the development
-- machine, so it arrives where the rest of the evidence about a session is.
function A.addNote(text)
    if type(text)~="string" or not text:find("%S") then return false end
    text=text:gsub("[\r\n]"," "):sub(1,200)
    local root=ModData and ModData.getOrCreate(NOTES)
    if root then
        if type(root.items)~="table" then root.items={} end
        root.items[#root.items+1]={text=text,at=safe(function() return getGameTime():getWorldAgeHours() end)}
    end
    local CFLog=require("ConspiracyFiles/Log")
    CFLog.write("i","note",{mod="owner",msg=text})
    return true
end

A.notes={
    id="NOTES",title="NOTES",icon="notes",
    list=function()
        local root=ModData and ModData.get(NOTES)
        local out={}
        for i,item in ipairs((root and root.items) or {}) do
            out[#out+1]={label=item.text,title="Note "..i,detail=item.text,id="note-"..i}
        end
        out[#out+1]={label="+ write a note",title="Write a note",
                     detail="Type what you noticed, then tap SEND. It reaches the development machine with the log.\n\nCANCEL throws it away, and so does leaving the program.",
                     id="note-new",write=true}
        return out
    end,
}

A.programs={A.files,A.names,A.places,A.dates,A.todo,A.notes,A.help,A.sites}

-- What a player may see. SITES hands out the answers, so it exists only while
-- the game is in debug, and the question is asked EVERY time the launcher is
-- drawn - asking once when this file loaded would decide it before the game
-- knew (owner, 2026-09-12: "the cheating app shall only open when in debug
-- mode :-)").
function A.visible()
    local debug=getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
    local out={}
    for _,program in ipairs(A.programs) do
        if not program.hidden or debug then out[#out+1]=program end
    end
    return out
end

return A
