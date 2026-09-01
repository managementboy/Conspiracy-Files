local path = "dev/dead-air-location-inspect/common/media/lua/client/ConspiracyFilesDeadAirLocationInspect.lua"
local file = assert(io.open(path, "rb"))
local source = file:read("*a")
file:close()

local checks = {
    { "save guard", "CF_dead_air_location_live" },
    { "sole-mod guard", "count == 1" },
    { "R2 bounds", "x = 13549, y = 1572, x2 = 13581, y2 = 1604" },
    { "P2 bounds", "x = 13206, y = 3073, x2 = 13238, y2 = 3101" },
    { "manual context boundary", "Events.OnFillInventoryObjectContextMenu.Add" },
    { "bounded scan", "processed < 32" },
    { "elapsed-time bound", "getTimeInMillis() - started < 1" },
    { "container type", "container:getType()" },
    { "room rectangles", "roomDef:getRects()" },
    { "pcall boundary", "pcall" },
    { "no noclip", "player:setGhostMode(false)" },
    { "zombie removal", "object:removeFromWorld()" },
    { "healing", "RestoreToFullHealth()" },
    { "disposable entry tool", "inventory:AddItem(\"Base.Crowbar\")" },
}

for _, check in ipairs(checks) do
    assert(source:find(check[2], 1, true), "missing " .. check[1])
end

assert(not source:find("os.execute", 1, true), "external execution is prohibited")
assert(not source:find("runner.exe", 1, true), "prohibited helper reference")
assert(not source:find("Events.OnKeyPressed.Add", 1, true), "keyboard shortcuts are prohibited")
print("Dead Air location inspection static checks passed")
