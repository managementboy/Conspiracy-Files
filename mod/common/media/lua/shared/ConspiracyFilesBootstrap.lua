if type(ConspiracyFiles) ~= "table" then ConspiracyFiles = {} end
local namespace = ConspiracyFiles

if not namespace._integrationStarted then
    namespace._integrationStarted = true
    local IntegrationRuntime = require("ConspiracyFiles/IntegrationRuntime")
    local PZ = require("ConspiracyFiles/Adapters.PZ")
    namespace.runtime = IntegrationRuntime.start(PZ.environment())
end
