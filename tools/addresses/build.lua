-- Whole-map address book builder (AD-10 steps B and C). Plain Lua 5.1, offline.
--
--   lua5.1 tools/addresses/build.lua --export <export.tsv> \
--       --streets "<PZ>/media/maps/Muldraugh, KY/streets.xml" \
--       --regions "<PZ>/media/maps/Muldraugh, KY/regions.lua" \
--       --out <AddressBook.lua> --report <report.md>
--
-- Same inputs give a byte-identical book and report. All rules: lib.lua.
local here=(arg and arg[0] or ""):match("^(.*)[/\\]") or "."
local L=dofile(here.."/lib.lua")

local opts={}
local i=1
while arg[i] do
    local k=arg[i]:match("^%-%-(.+)$")
    if not k or not arg[i+1] then io.stderr:write("bad argument: "..tostring(arg[i]).."\n"); os.exit(2) end
    opts[k]=arg[i+1]; i=i+2
end
for _,k in ipairs({"export","streets","regions","out","report"}) do
    if not opts[k] then
        io.stderr:write("usage: lua5.1 tools/addresses/build.lua --export <file> --streets <streets.xml> --regions <regions.lua> --out <AddressBook.lua> --report <report.md>\n")
        os.exit(2)
    end
end

local function sha256(path)
    local p=io.popen("sha256sum '"..path:gsub("'","'\\''").."'")
    local line=p and p:read("*l"); if p then p:close() end
    local h=line and line:match("^(%x+)")
    if not h or #h~=64 then error("sha256sum failed for "..path) end
    return h
end
local function write(path,text)
    local f=assert(io.open(path,"wb")); f:write(text); f:close()
end

local header,buildings=L.parseExport(L.readAll(opts.export))
if header.count and tonumber(header.count)~=#buildings then
    error("export header says count "..header.count.." but has "..#buildings.." rows")
end
local streets=L.parseStreets(L.readAll(opts.streets))
local regions=L.parseRegions(L.readAll(opts.regions))
local result=L.number(streets,regions,buildings)
local meta={game=header.game,map=header.map,streetsSha=sha256(opts.streets),
    regionsSha=sha256(opts.regions),exportSha=sha256(opts.export)}
local book=L.render(result,meta)
write(opts.out,book)
write(opts.report,L.report(result,meta))
local numbered=0
for _,a in ipairs(result.areas) do numbered=numbered+a.numbered end
print(string.format("%d buildings read, %d considered, %d numbered in %d areas; %s (%d bytes); report %s",
    #buildings,result.stats.considered,numbered,#result.areas,opts.out,#book,opts.report))
