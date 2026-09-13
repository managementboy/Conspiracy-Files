-- The shipped tree must actually package.
--
-- tools/package.sh refuses to build if any require() in the shipped tree
-- cannot be resolved inside the shipped tree - the check that would have
-- caught a module existing only on one machine. Nothing ran it until
-- publishing, so a tree that could not ship looked perfectly healthy.
--
-- It also has to get two things right about what a require IS, both of which
-- it got wrong:
--
--   * comments are not code. A comment in init.lua explaining that requiring
--     the package by name resolves to that file contained the call it was
--     describing, and the scanner tried to resolve it and refused to package
--     the mod (2026-09-13);
--   * a package resolves to its init.lua, by Lua's own convention, which is
--     how the two domain specs load the whole domain. The scanner only looked
--     for <module>.lua.
local tmp = os.getenv("TMPDIR") or "/tmp"
local stage = tmp .. "/cf-package-test-" .. tostring(os.time())
-- The exit status comes back through the output: io.popen's close() returns
-- only a boolean in Lua 5.1, not the status triple of later versions.
local cmd = "{ tools/package.sh --stage " .. stage .. " 2>&1; echo \"CF_EXIT=$?\"; }"
local pipe = assert(io.popen(cmd))
local output = pipe:read("*a")
pipe:close()
os.execute("rm -rf " .. stage)

local code = output:match("CF_EXIT=(%d+)")
assert(code == "0",
    "the shipped tree does not package (exit " .. tostring(code) .. "):\n" .. output)
assert(output:find("packaged", 1, true),
    "package.sh reported no package:\n" .. output)
assert(not output:find("MISSING from package", 1, true),
    "unresolved requires in the shipped tree:\n" .. output)

-- And it must have found a sane number of files: a scanner that silently
-- matched nothing would also print no failures.
local count = output:match("lua files%s+(%d+)")
assert(count and tonumber(count) > 50,
    "package.sh reported only " .. tostring(count) .. " lua files, which suggests it scanned nothing")

print("PASS packages: the shipped tree builds, every require resolves inside it, " ..
      count .. " lua files")
