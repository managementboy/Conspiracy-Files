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
    start=true,ready=true,stop=true,error=true,skip=true,catalogue=true,force=true,stories=true,batch=true,drift=true,
    -- cases and evidence
    case=true,placed=true,relocated=true,conflict=true,found=true,inspected=true,
    retired=true,stale=true,recognised=true,
    -- A refusal to start a case, with its reason code, count, rung and the
    -- in-game time the next case is promised by (P4-R133). One line per
    -- refusal, so a whole run is auditable with one grep.
    defer=true,
    -- what the player is told
    voice=true,hint=true,marker=true,note=true,
    -- people, keys, places
    person=true,outfit=true,key=true,door=true,address=true,vehicle=true,
    -- diagnostics the owner turns on deliberately
    probe=true,scan=true,
    -- content-blind state dump for playtests and bug reports
    dump=true,dump_trigger=true,
    -- debug-only Shift+L: where the nearest clue is (ClueWhere)
    clue_where=true,
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
Log.REPEAT_EVERY=100
local SEEN_CAP=256
local seen_lines,seen_count={},0
function Log.resetRepeats() seen_lines,seen_count={},0 end -- for checks that boot the same state twice
function Log.write(level,event,fields)
    if not LEVELS[level] then level="i" end
    if not Log.enabled(level) then return end
    assert(EVENTS[event],"unknown log event "..tostring(event))
    local parts={Log.PREFIX,"v="..Log.FORMAT_VERSION,"t="..stamp(),"lvl="..level,"ev="..event}
    fields=fields or {}
    if OIShared.BlindLog then
        fields=Log.blind(fields)
        if fields.why then fields.why=Log.scrub(fields.why) end
    end
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
    -- The same line again inside the same in-game minute is the same news (a body still in reach
    -- is seen every few frames): print it once, then once more per REPEAT_EVERY, saying how many.
    local line=table.concat(parts," ")
    local n=(seen_lines[line] or 0)+1
    if seen_count>=SEEN_CAP and not seen_lines[line] then seen_lines,seen_count={},0 end
    if not seen_lines[line] then seen_count=seen_count+1 end
    seen_lines[line]=n
    if n>1 then
        if n%Log.REPEAT_EVERY~=0 then return end
        line=line.." repeated="..n
    end
    print(line)
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

-- WHY NOTHING HAPPENED.
--
-- Every player-facing bug found in the 2026-09-24 playtests was a SILENT
-- no-op: a path that declined to act and said nothing. heldKey returned nil
-- for a generated key; KeyObservations.observe returned early so a token could
-- never arrive; a read flyer saved a timestamp no consumer read; a clue's
-- search icon was never emitted. The suite was green throughout, because a
-- test can only check a claim somebody thought to make, and nobody asserts on
-- a decision they do not know is being taken.
--
-- Counted across the client modules at the time: MapMediaRuntime 74 early
-- returns against 13 log calls, LocalPersonIntegration 48 against 15,
-- ClueMarkers 40 against 11. Roughly five silent exits for every line that
-- says anything.
--
-- So a decision NOT to do something gets a name, and the name is available
-- without being printed:
--
--   local decline=Log.declines("keys")
--   if carrier and not token then return decline("carrier not stamped yet") end
--
--   OIShared.verbose.keys=true      -- print them from the console
--   Log.lastDecline("keys")                -- or ask afterwards
--
-- The reason is kept even while silent, so a playtest that ends in "nothing
-- happened" can be asked the question instead of being re-run. Cost while off
-- is one table read and one boolean test, which is what IdentityObserver's
-- bail() already pays in a render path and what Kahlua can afford there.
OIShared=OIShared or {}
-- Owner, 2026-10-01: while the GAME is in debug mode the log shows locations
-- (areas, coordinates, clue ids) so placement can be checked; a normal game is
-- still blind. Debug-only, log-only: nothing is drawn and no key is bound.
if OIShared.BlindLog==nil then
    OIShared.BlindLog=not (getDebug and getDebug() and true or false)
end
OIShared.verbose=OIShared.verbose or {}
local lastDecline={}

-- BLIND BY DEFAULT (checklist C5): the owner plays blind and quotes log lines.
-- Values under these keys can name or locate a clue, a scene, a place or a
-- person, so they print as "-" unless a developer sets OIShared.BlindLog=false
-- in the debug console. Event names, reasons, counts, modes, hours and
-- distances stay. Free-text messages (Log.message) are not rewritten.
local BLIND={area=true,case=true,kind=true,at=true,where=true,site=true,place=true,
    x=true,y=true,z=true,doc=true,id=true,item=true,person=true,vehicle=true,room=true,token=true}
function Log.blind(fields)
    if not fields then return nil end
    local out={}
    for k,v in pairs(fields) do out[k]=BLIND[k] and "-" or v end
    return out
end

-- Scrub free-text: redact clue/token IDs and coordinates in text.
function Log.scrub(text)
    if not text then return text end
    text=tostring(text)
    -- Redact IDs: cf-g2:[%w:%-_]+, nh:[%w:%-_]+, t3:[%w%-_]+, scene:[%w%-_]+
    text=text:gsub("cf%-g2:[%w:%-_]+","-")
    text=text:gsub("nh:[%w:%-_]+","-")
    text=text:gsub("t3:[%w%-_]+","-")
    text=text:gsub("scene:[%w%-_]+","-")
    -- Redact coordinates: x,y or x,y,z optionally :n:n
    text=text:gsub("%d+,%d+,%d+:[%d:]+","-")
    text=text:gsub("%d+,%d+,%d+","-")
    text=text:gsub("%d+,%d+:[%d:]+","-")
    text=text:gsub("%d+,%d+","-")
    return text
end

-- Modules that log place or person names (free text that no pattern can catch).
-- These modules replace the whole msg with "-" in blind mode.
local PLACE_PERSON_MODULES={places=true,visited=true,person=true,outfit=true,ledger=true,voice=true,
    address=true,key=true,mapread=true,mapmedia=true,nearby=true}

function Log.declines(name)
    return function(reason,fields)
        lastDecline[name]={reason=reason}
        if OIShared.verbose[name] then
            fields=fields or {}
            fields.mod=name; fields.why=reason
            if OIShared.BlindLog then fields.why=Log.scrub(fields.why) end
            Log.write("d","declined",fields)
        end
        return nil,reason
    end
end
function Log.lastDecline(name)
    if name then return lastDecline[name] and lastDecline[name].reason end
    local out={}
    for module,entry in pairs(lastDecline) do out[module]=entry.reason end
    return out
end

-- Migration path for the existing prose lines. Keeps a message readable while
-- giving it a time, a level and one prefix, so the twelve loggers can be
-- converted mechanically now and given real fields where they pay.
function Log.message(name,event,text,level)
    if OIShared.BlindLog then
        if PLACE_PERSON_MODULES[name] then
            text="-"  -- Modules logging places/people: replace whole message
        else
            text=Log.scrub(text)  -- Other modules: scrub IDs and coordinates
        end
    end
    Log.write(level or "i",event,{mod=name,msg=text})
end

function Log.events()
    local out={}
    for id in pairs(EVENTS) do out[#out+1]=id end
    table.sort(out)
    return out
end

return Log
