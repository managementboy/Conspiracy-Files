if type(ConspiracyFiles) ~= "table" then ConspiracyFiles = {} end
local namespace = ConspiracyFiles

if not namespace.runtime or namespace.runtime.enabled ~= true then return end

local ok, message = pcall(function()
    local PZPresentation = require("ConspiracyFiles/PZPresentation")
    if namespace.presentation and namespace.presentation.stop then namespace.presentation.stop() end
    namespace.presentation = PZPresentation.new({ namespace = namespace })
    namespace.presentation.start()
end)

if not ok then
    local text = tostring(message):gsub("[%c]+", " ")
    if string.len(text) > 180 then text = string.sub(text, 1, 177) .. "..." end
    print("Conspiracy-Files: presentation registration failed: " .. text)
end
