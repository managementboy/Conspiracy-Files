-- Takes the dependency snapshot once per game, after every mod's Lua has loaded.
local Adapter = require("OIShared/DependencyAdapter")
require("OIShared/Events/EngineEvents").on("OnGameStart", function() pcall(Adapter.snapshot, false) end)
