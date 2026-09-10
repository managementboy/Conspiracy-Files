-- One log line format for the whole mod, so a play session can be READ.
--
-- Owner, 2026-09-10: "our logging for you to follow my play has become
-- unstructured... speed and reduced token usage on your side is also very
-- important."
--
-- It had. Twelve private log functions, twenty-two prefixes, two of them
-- duplicates under different names (CF-ID/CF-IDENTITY, CF-MARKERS/
-- CF-MARKER-TEST), no time, no case, and lines like "Marked=" that name
-- nothing. Each was the smallest change at the time; together they are
-- twenty-two vocabularies.
--
-- THE FORMAT is logfmt - space-separated key=value - which is the ordinary
-- convention for greppable logs (Go's slog, Heroku, Loki all emit it). It is
-- chosen for one reason: `grep 'ev=placed' console.txt` returns five lines
-- instead of a person reading five hundred. The log already reaches the
-- development machine through tools/fetch_logs.sh, so the reader's job is a
-- query, not a paste.
--
--     [CF] v=1 t=08:14 lvl=i ev=placed case=3 doc=d4 room=kitchen
--
-- ONE prefix, so one grep finds every line. The version field is there so a
-- future format change is detectable rather than silently misparsed. Fields
-- after the fixed four are free-form and appended in a stable order, so a grep
-- written today still works when a field is added tomorrow.
local Log={}
Log.FORMAT_VERSION=1
Log.PREFIX="[CF]"

-- Levels, shortest first because they are typed into greps. Default info:
-- debug is for a session someone is actively investigating, and leaving it on
-- is how a log becomes unreadable again.
local LEVELS={e=1,w=2,i=3,d=4}
Log.level="i"

-- The closed event vocabulary. An event id is what a reader greps for, so it
-- has to be stable and small; a typo would silently produce a line nobody ever
-- finds. Adding one is a deliberate act - the assert below refuses anything
-- not listed here.
local EVENTS={
    -- lifecycle
    start=true,ready=true,stop=true,error=true,skip=true,
    -- cases and evidence
    case=true,placed=true,relocated=true,conflict=true,found=true,inspected=true,
    retired=true,stale=true,
    -- what the player is told
    voice=true,hint=true,marker=true,note=true,
    -- people, keys, places
    person=true,outfit=true,key=true,door=true,address=true,vehicle=true,
    -- diagnostics the owner turns on deliberately
    probe=true,scan=true,
}

-- Field order. Fixed so lines column-align to the eye and so a grep for a
-- prefix of the line stays valid. Anything not listed is appended after these,
-- sorted, which keeps output deterministic without forbidding new fields.
local ORDER={"ev","case","doc","item","person","place","room","vehicle","why","n"}

local function clean(v)
    v=tostring(v)
    -- Newlines and quotes would break one-line-per-event, which is the whole
    -- basis of grepping this. Spaces are kept: a quoted value is still one
    -- field to a reader, and logfmt allows it.
    v=string.gsub(v,"[\r\n\t]"," ")
    v=string.gsub(v,'"',"'")
    if string.find(v," ",1,true) then v='"'..v..'"' end
    return v
end

-- Game time as HH:MM, or "-" before the world exists. The reader's first
-- question about any line is when, and a wall clock cannot answer it: a play
-- session is hours of game time in minutes of real time.
local function stamp()
    if not getGameTime then return "-" end
    local ok,gt=pcall(getGameTime)
    if not ok or not gt then return "-" end
    local okh,h=pcall(function() return gt:getHour() end)
    local okm,m=pcall(function() return gt:getMinutes() end)
    if not okh or not okm or type(h)~="number" or type(m)~="number" then return "-" end
    return string.format("%02d:%02d",h,m)
end

function Log.enabled(level)
    return (LEVELS[level] or 3)<=(LEVELS[Log.level] or 3)
end

-- Log.write("i","placed",{case="3",doc="d4",room="kitchen"})
function Log.write(level,event,fields)
    if not LEVELS[level] then level="i" end
    if not Log.enabled(level) then return end
    assert(EVENTS[event],"unknown log event "..tostring(event))
    local parts={Log.PREFIX,"v="..Log.FORMAT_VERSION,"t="..stamp(),"lvl="..level,"ev="..event}
    fields=fields or {}
    local seen={ev=true}
    for _,key in ipairs(ORDER) do
        if key~="ev" and fields[key]~=nil then
            parts[#parts+1]=key.."="..clean(fields[key]); seen[key]=true
        end
    end
    local rest={}
    for key in pairs(fields) do if not seen[key] then rest[#rest+1]=key end end
    table.sort(rest)
    for _,key in ipairs(rest) do parts[#parts+1]=key.."="..clean(fields[key]) end
    print(table.concat(parts," "))
end

function Log.error(event,fields) Log.write("e",event,fields) end
function Log.warn(event,fields) Log.write("w",event,fields) end
function Log.info(event,fields) Log.write("i",event,fields) end
function Log.debug(event,fields) Log.write("d",event,fields) end

-- A module's own logger, for the twelve files that each grew a private one.
-- `module` becomes a field rather than a prefix, so ONE grep still finds
-- everything and a reader can still narrow to one subsystem.
function Log.forModule(name)
    return function(level,event,fields)
        fields=fields or {}
        fields.mod=name
        Log.write(level,event,fields)
    end
end

-- Migration path for the existing prose lines. Keeps a message readable while
-- giving it a time, a level and one prefix, so the twelve loggers can be
-- converted mechanically now and given real fields where they pay.
function Log.message(name,event,text,level)
    Log.write(level or "i",event,{mod=name,msg=text})
end

function Log.events()
    local out={}
    for id in pairs(EVENTS) do out[#out+1]=id end
    table.sort(out)
    return out
end

return Log
