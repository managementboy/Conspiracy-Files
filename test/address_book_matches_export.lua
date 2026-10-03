-- The shipped address book (6,796 house numbers) was computed from the reference building export made on the real
-- game (dev/addresses/world1.tsv). Every address must name a building that is in that export with the same footprint.
-- Pure files, no game. (Whether the INSTALLED game still matches the export is tools/realmap/check.sh.)
local export = {}
for line in io.lines("dev/addresses/world1.tsv") do
    if line:sub(1, 1) ~= "#" and line:find("%S") then
        local id, x, y, x2, y2 = line:match("^(%d+)\t(-?%d+)\t(-?%d+)\t(-?%d+)\t(-?%d+)")
        export[id] = {x, y, x2, y2}
    end
end
local n, bad = 0, {}
for line in io.lines("mod-nohelp/common/media/lua/shared/NHShared/Generated/AddressBook.lua") do
    local id, x, y, x2, y2 = line:match('^"(%d+)|(-?%d+)|(-?%d+)|(-?%d+)|(-?%d+)|%d+|%d+|%d+",?$')
    if id then
        n = n + 1
        local e = export[id]
        if not e then bad[#bad + 1] = id .. " is not in the reference export"
        elseif e[1] ~= x or e[2] ~= y or e[3] ~= x2 or e[4] ~= y2 then bad[#bad + 1] = id .. " footprint differs from the export" end
    end
end
assert(n > 6000, "found only " .. n .. " address rows; the file format changed?")
assert(#bad == 0, #bad .. " address row(s) do not match the export, first: " .. tostring(bad[1]))
print("PASS address book: all " .. n .. " house numbers match a building in the reference export")
