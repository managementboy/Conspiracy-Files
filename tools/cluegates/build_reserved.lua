-- WRITER / ENGINEER ONLY. Builds the reserved-name list for the No Help clue
-- gates (content-writer handoff, sections 3.9 and 7): the names of vanilla
-- named characters and of people named in vanilla flyers and map annotations,
-- which no clue may reuse or echo (exact, sound-alike, one letter away:
-- Mystery/ClueGates). The list and this script's scene selection are
-- spoiler-level: never quote either in an owner-facing file or message.
--
--   lua5.1 tools/cluegates/build_reserved.lua          (writes the file)
--   lua5.1 tools/cluegates/build_reserved.lua --check  (exit 1 if stale)
--
-- Plain Lua 5.1, offline, deterministic. Sources, all already in the repo:
--   1. NHShared/MapMediaCatalogue.lua: every flyer's title and text and every
--      map annotation - a capitalised possessive ("<Name>'s"), "name is
--      <Name>" and "appelle <Name...>";
--   2. docs/writer-only/nohelp-adhd-inputs/vanilla-scene-kinds.txt: the scene
--      kinds built around a vanilla named character (NAMED_SCENES below, each
--      checked to exist in that list), split on their capitals.
-- Words that are places or ordinary words (STOP, plus every word of the
-- address book's road names) are never names.
package.path="mod-nohelp/common/media/lua/shared/?.lua;"..package.path
local M={}
M.OUT="mod-nohelp/common/media/lua/shared/NHShared/Generated/ReservedNames.lua"
M.SCENES="docs/writer-only/nohelp-adhd-inputs/vanilla-scene-kinds.txt"

-- Scene kinds whose story is a vanilla named character (from the scene
-- table's notes). Prefix and connective parts are dropped when splitting.
M.NAMED_SCENES={"RBJackieJaye","RZJackieJaye","RBJoanHartford","RBKateAndBaldspot","RBTwiggy",
    "RZSSirTwiggy","RZSDean","RZSDuke","RZSFrankHemingway","RZSKirstyKormick","RZSRangerSmith","RBNolans"}
M.PREFIXES={"RBTS","RDS","RVS","RZS","RB","RZ"}
M.STOP={["and"]=true,sir=true,ranger=true,kentucky=true,louisville=true,muldraugh=true,
    america=true,american=true,knox=true,god=true,mom=true,dad=true,grandpappy=true,
    today=true,world=true,nature=true,everyone=true,["the"]=true,
    riverside=true,rosewood=true,ekron=true,irvington=true,brandenburg=true,westpoint=true,
    west=true,point=true,march=true,ridge=true,valley=true,station=true,mall=true,crossroads=true,
    let=true,that=true,there=true,here=true,what=true,who=true,ton=true,oak=true,honey=true,
    children=true,chief=true,butcher=true,herald=true,lawman=true,wizard=true,suspension=true,
    fiddler=true,monday=true,tuesday=true,wednesday=true,thursday=true,friday=true,saturday=true,sunday=true}

local function words(camel)
    local out={}
    for w in camel:gmatch("%u%l+") do out[#out+1]=w end
    return out
end

function M.collect()
    local Cat=require("NHShared/MapMediaCatalogue")
    local stop={}
    for k in pairs(M.STOP) do stop[k]=true end
    local okRoads,Roads=pcall(require,"NHShared/Generated/AddressRoads")
    if okRoads and type(Roads)=="table" then
        local function walk(t,depth)
            if depth>3 then return end
            for _,v in pairs(t) do
                if type(v)=="string" then for w in v:gmatch("%a+") do stop[w:lower()]=true end
                elseif type(v)=="table" then walk(v,depth+1) end
            end
        end
        walk(Roads,0)
    end
    local names={}
    local function add(w)
        w=w:lower():gsub("[^a-z]","")
        if #w>=3 and not stop[w] then names[w]=true end
    end
    local function scan(t)
        if type(t)~="string" then return end
        for w in t:gmatch("(%u%a+)'s") do add(w) end
        for w in t:gmatch("[Nn]ame is (%u%a+)") do add(w) end
        for run in t:gmatch("appelle (%u[%a%.]*[ %u%a%.]*)") do
            for w in run:gmatch("%u%a+") do if #w>=3 then add(w) end end
        end
    end
    for _,id in ipairs(Cat.printList) do local p=Cat.print(id); scan(p.title); scan(p.text) end
    for _,id in ipairs(Cat.list) do scan(Cat.get(id).sourceText) end
    local kinds={}
    local f=io.open(M.SCENES,"r")
    if f then for line in f:lines() do kinds[line:gsub("%s","")]=true end; f:close() end
    for _,k in ipairs(M.NAMED_SCENES) do
        if f and not kinds[k] then error("named scene "..k.." is not a vanilla scene kind") end
        local rest=k
        for _,p in ipairs(M.PREFIXES) do
            if rest:sub(1,#p)==p and rest:sub(#p+1,#p+1):find("%u") then rest=rest:sub(#p+1); break end
        end
        for _,w in ipairs(words(rest)) do
            if w:sub(-1)=="s" and names[w:lower():sub(1,-2)] then w=w:sub(1,-2) end
            add(w)
        end
    end
    local list={}
    for n in pairs(names) do list[#list+1]=n end
    table.sort(list)
    return list
end

function M.render(list)
    local out={
        "-- DERIVED FILE - do not edit by hand. WRITER / ENGINEER ONLY: spoiler-level.",
        "--   lua5.1 tools/cluegates/build_reserved.lua",
        "-- Vanilla named characters and people named in vanilla flyers and map",
        "-- annotations, which no No Help clue may reuse or echo (Mystery/ClueGates).",
        "-- Never quote this list in an owner-facing file or message.",
        "return {names={",
    }
    for _,n in ipairs(list) do out[#out+1]='    "'..n..'",' end
    out[#out+1]="}}"
    return table.concat(out,"\n").."\n"
end

if arg and arg[0] and arg[0]:find("cluegates[/\\]build_reserved%.lua$") then
    local text=M.render(M.collect())
    if arg[1]=="--check" then
        local f=io.open(M.OUT,"r")
        local old=f and f:read("*a"); if f then f:close() end
        if old~=text then io.stderr:write("ReservedNames.lua is stale: rebuild it\n"); os.exit(1) end
        print("ReservedNames.lua is current")
    else
        local f=assert(io.open(M.OUT,"w")); f:write(text); f:close()
        local n=0; for _ in text:gmatch('\n    "') do n=n+1 end
        print("wrote "..M.OUT.." ("..n.." names)")
    end
end
return M
