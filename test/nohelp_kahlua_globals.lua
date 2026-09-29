-- The game's Kahlua has no global next() (native run, 2026-09-29: the state
-- dump called it and failed with "Object tried to call nil" every time, while
-- plain-Lua tests passed). No shipped No Help file may call it.
local p=io.popen('find mod-nohelp -name "*.lua"')
local bad={}
for path in p:lines() do
    local f=assert(io.open(path,"rb")); local src=f:read("*a"); f:close()
    local n=0
    for line in src:gmatch("[^\n]*") do
        n=n+1
        local code=line:gsub("%-%-.*$","")
        if code:find("[^%w_%.:]next%(") or code:find("^next%(") then
            if not src:find("local%s+next%s*=") and not src:find("local%s+next%s*$") then bad[#bad+1]=path..":"..n end
        end
    end
end
p:close()
assert(#bad==0,"global next() is not available in the game: "..table.concat(bad,", "))
print("nohelp kahlua globals: no shipped file calls next()")
