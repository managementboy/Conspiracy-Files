-- Both mods ship the same whole-map address data (AD-10): the book, the roads and the numbering rules.
-- Pure files, no game. A regenerated book copied into one mod only would give two different towns.
local function read(p) local f=assert(io.open(p,"rb")); local s=f:read("*a"); f:close(); return s end
local a="mod/common/media/lua/shared/ConspiracyFiles/Generated/"
local b="mod-nohelp/common/media/lua/shared/NHShared/Generated/"
for _,n in ipairs({"AddressBook","AddressRoads","AddressIndex"}) do
    assert(read(a..n..".lua")==read(b..n..".lua"), n..".lua differs between mod/ and mod-nohelp/")
end
print("PASS address data: mod/ and mod-nohelp/ ship identical book, roads and index")
