-- One build string, defined once.
--
-- Notebook's UI.VERSION and Runtime.VERSION were both maintained by hand and
-- drifted six releases apart. On 2026-09-08 a log pulled from a DEV-0.8.12
-- build reported "version=DEV-0.6-transactional-candidate" on every
-- [CF-DEAD-AIR] line, because only the notebook constant had ever been bumped.
-- A version that lies in the logs is worse than none: the logs are where a
-- problem gets diagnosed, and the packaging scripts name the archive from it.
--
-- So Version.lua is the only place a build string may be written literally.
local function read(path)
    local f = assert(io.open(path, 'r'), 'cannot open ' .. path)
    local s = f:read('*a')
    f:close()
    return s
end

local VERSION_FILE = 'mod/common/media/lua/shared/ConspiracyFiles/Version.lua'
local version = read(VERSION_FILE):match('ConspiracyFiles%.VERSION%s*=%s*"([^"]+)"')
assert(version, 'Version.lua must define ConspiracyFiles.VERSION as a literal string')
assert(#version > 0, 'the version must not be empty')

-- The packaging scripts parse this file with grep and sed. If the assignment
-- stops matching their pattern the archive silently loses its name, so hold
-- the exact shape they expect rather than only the Lua semantics.
assert(read(VERSION_FILE):find('ConspiracyFiles.VERSION = "' .. version .. '"', 1, true),
    'the assignment must stay in the exact form tools/package.sh greps for')

-- Every shipped Lua file, walked without shelling out so this runs anywhere.
local function shippedFiles()
    local files = {}
    local pipe = assert(io.popen("find mod/common -name '*.lua' | sort"))
    for line in pipe:lines() do files[#files + 1] = line end
    pipe:close()
    return files
end

local offenders = {}
for _, path in ipairs(shippedFiles()) do
    if path ~= VERSION_FILE then
        local body = read(path)
        -- A DEV-shaped literal anywhere else is a second source of truth.
        for literal in body:gmatch('"(DEV%-[%w%.%-]+)"') do
            offenders[#offenders + 1] = path .. ' defines ' .. literal
        end
    end
end

if #offenders > 0 then
    error('build strings must live only in Version.lua:\n  ' .. table.concat(offenders, '\n  '), 0)
end

-- Both consumers must read the shared module rather than restate the string.
local notebook = read('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua')
assert(notebook:find('UI.VERSION=require("ConspiracyFiles/Version")', 1, true),
    'Notebook must take its version from the shared module')

local runtime = read('mod/common/media/lua/shared/ConspiracyFiles/Runtime.lua')
assert(runtime:find('Runtime.VERSION = require("ConspiracyFiles/Version")', 1, true),
    'Runtime must take its version from the shared module')

print('PASS version single source: ' .. version .. ', no second literal in ' ..
    #shippedFiles() .. ' shipped files, both consumers require it')
