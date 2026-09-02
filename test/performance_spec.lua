local CF = require("ConspiracyFiles")
local Content = CF.Content

test("complete Dead Air domain mutations and rendering stay below the plain-Lua characterization budget", function()
    local iterations = 250
    local prepared = {}
    for index = 1, iterations do
        local state = assert(CF.ThreadState.new())
        for _, assetId in ipairs(Content.thread.documentAssetIds) do
            local ok = state.discover(assetId, "performance fixture", Content.assets[assetId].placementLocationId)
            assertTrue(ok)
        end
        prepared[index] = state
    end

    local started = os.clock()
    for index = 1, iterations do
        local ok = prepared[index].confirmLocation(Content.ids.relay)
        assertTrue(ok)
    end
    local mutationAverageMs = ((os.clock() - started) * 1000) / iterations

    started = os.clock()
    for index = 1, iterations do
        assertEqual(9, #prepared[index].renderJournal())
    end
    local renderAverageMs = ((os.clock() - started) * 1000) / iterations

    assertTrue(mutationAverageMs <= 2, "complete-state mutation average exceeded 2 ms: " .. mutationAverageMs)
    assertTrue(renderAverageMs <= 2, "complete journal render average exceeded 2 ms: " .. renderAverageMs)
end)
