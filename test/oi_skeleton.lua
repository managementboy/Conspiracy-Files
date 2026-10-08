-- Of Interest skeleton: the copy is separate from No Help and the older mod, the Java helper and
-- Lua prefix are renamed, our written clue content is gone, and no dependency content was copied.
local function read(p) local f=assert(io.open(p,"rb"),p); local s=f:read("*a"); f:close(); return s end
local function list(dir) -- relative file paths under dir, via find
    local out={}; local p=io.popen('cd "'..dir..'" && find . -type f | sort')
    for l in p:lines() do out[#out+1]=l:gsub("^%./","") end; p:close(); return out
end
local OI,NH,DA="mod-ofinterest","mod-nohelp","mod"

-- mod.info: ids, requires, incompatibles, java names, own version
local info=read(OI.."/42/mod.info")
local function key(s,k) return s:match("\n"..k.."=([^\r\n]*)") or s:match("^"..k.."=([^\r\n]*)") end
assert(key(info,"id")=="ConspiracyFilesOfInterest","mod id")
assert(key(info,"name")=="Conspiracy Files: Of Interest","mod name")
assert(key(info,"modversion")=="0.0.1-dev","own version")
assert(key(info,"require")=="\\ZombieBuddy,\\ItIsOfInterestToMe","mod.info requires ZombieBuddy and the dependency")
assert(key(info,"javaJarFile")=="media/java/OfInterestScenes.jar" and key(info,"javaPkgName")=="conspiracyfiles.ofinterest","java names renamed")
local ids={key(read(NH.."/42/mod.info"),"id"),key(read(DA.."/42/mod.info"),"id")}
assert(ids[1]=="ConspiracyFilesNoHelp" and ids[2]=="ConspiracyFiles","the other mods' ids")
local inc=key(info,"incompatible"); assert(inc,"incompatible= line exists")
assert(inc=="\\"..ids[1]..",\\"..ids[2],"incompatible lists No Help and the older mod by their real ids: "..tostring(inc))
local f=io.open(OI.."/42/media/java/OfInterestScenes.jar","rb"); assert(f,"jar ships"); f:close()
f=io.open(OI.."/42/media/java/OfInterestScenes.jar.zbs","rb"); assert(f,"jar signature ships"); f:close()
assert(not io.open(OI.."/42/media/java/NoHelpScenes.jar","rb"),"no old jar")

-- no module-name collisions: identical require paths and identical global names across trees
local function luaFiles(root) local m={}
    for _,p in ipairs(list(root.."/common/media/lua")) do
        local rel=p:match("^[^/]+/(.+)%.lua$"); if rel then m[rel]=p end end
    return m end
local function globals(root)
    local g={}
    for _,p in ipairs(list(root.."/common/media/lua")) do
        if p:match("%.lua$") then
            local src=read(root.."/common/media/lua/"..p).."\n"
            local declared={} -- forward-declared locals ("local a,b") are not globals
            for line in src:gmatch("([^\n]*)\n") do
                local names=line:match("^local%s+([%w_,%s]+)$")
                if names then for n in names:gmatch("[%a_][%w_]*") do declared[n]=true end end
            end
            for line in src:gmatch("([^\n]*)\n") do
                local n=line:match("^([%a_][%w_]*)%s*=[^=]") or line:match("^function%s+([%a_][%w_]*)[%s%(]")
                if n and not declared[n] then g[n]=p end
            end
        end
    end
    return g end
local mo=luaFiles(OI)
for _,other in ipairs({NH,DA}) do
    local mother=luaFiles(other)
    for rel,p in pairs(mo) do
        if mother[rel] then error("module path collision with "..other..": "..rel) end
    end
end
for rel in pairs(mo) do
    assert(not rel:match("^NHShared") ,"old prefix left: "..rel)
end
local go=globals(OI)
for _,other in ipairs({NH,DA}) do
    local g=globals(other)
    local bad={}
    for n,p in pairs(go) do if g[n] then bad[#bad+1]=n.." ("..p..")" end end
    table.sort(bad); assert(#bad==0,"global name collision with "..other..": "..table.concat(bad,", "))
end
-- text-level: no old prefix, old item stamps, or old global tables anywhere in the tree
for _,p in ipairs(list(OI)) do
    if p:match("%.lua$") or p:match("%.json$") or p:match("%.info$") then
        local s=read(OI.."/"..p)
        for _,bad in ipairs({"NHShared","NHEngine","NHInteract","NHScene","ISNHClue"}) do
            assert(not s:find(bad,1,true),p.." still names "..bad) end
        assert(not s:find("%f[%w]cf[A-Z]"),p.." still uses a cf* item key")
    end
end
-- modData world tags and the journal file name are all in the new prefix
local tags=0
for _,p in ipairs(list(OI.."/common/media/lua/client")) do
    local s=read(OI.."/common/media/lua/client/"..p)
    for tag in s:gmatch('TAG%s*=%s*"([^"]+)"') do assert(tag:match("^OIShared%."),"tag "..tag); tags=tags+1 end
end
assert(tags>=10,"world tags found: "..tags)

-- the manifest is empty but valid
package.path=OI.."/common/media/lua/shared/?.lua;"..package.path
local Manifest=require("OIShared/Mystery/Manifest")
assert(type(Manifest.clues)=="table" and #Manifest.clues==0,"manifest has zero clues")
assert(os.execute("test ! -e "..OI.."/common/media/lua/shared/OIShared/Mystery/Content"),"Mystery/Content removed")
-- the Java helper project is renamed too
assert(os.execute("test -f tools/ofinterest-scenes/src/conspiracyfiles/ofinterest/SceneListener.java"),"renamed java source")
local jv=read("tools/ofinterest-scenes/src/conspiracyfiles/ofinterest/SceneListener.java")
assert(jv:find('name = "OISceneListener"',1,true) and jv:find('name = "OISceneDrain"',1,true) and not jv:find("NHScene"),"Lua globals of the listener renamed")
-- nothing of the dependency was copied: no files of its mod, no definition of its registry
for _,p in ipairs(list(OI)) do
    assert(not p:find("ItIsOfInterestToMe",1,true) and not p:find("NoteContent",1,true),"dependency file copied: "..p)
    if p:match("%.lua$") then
        local s=read(OI.."/"..p)
        assert(not s:match("\nReadableItemRegistry%s*="),"dependency registry defined in "..p)
        assert(not s:match("\nNoteContentPool%s*="),"dependency pool defined in "..p)
    end
end
print("oi skeleton: separate ids, both requires, incompatible, renamed prefix/java, "..tags.." world tags, zero clues, no dependency content")
