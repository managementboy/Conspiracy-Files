-- Appended after tools/autotest/checks/address_export.lua when the server mod is assembled.
-- Runs ONCE when the dedicated server has loaded the real map: writes the same building export the
-- in-game address_export.sh writes (that takes ~30 minutes on a real display), then tells the shell.
Events.OnServerStarted.Add(function()
    local ok, total = CFAddr.start("cf_buildings_server.txt")
    if not ok then print("CFREALMAP FAIL " .. tostring(total)); return end
    local done
    repeat done = CFAddr.step(5000) until done
    print("CFREALMAP DONE " .. tostring(CFAddr.n))
end)
