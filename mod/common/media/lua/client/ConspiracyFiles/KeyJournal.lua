-- Durable player observations only. Engine event adapters supply observed facts.
local Connections = require("ConspiracyFiles/KeyConnection")
local Budget = require("ConspiracyFiles/SaveBudget")
local J = {}
ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.KeyJournal = J
local TAG = "ConspiracyFiles.KeyConnections"

local function current()
    local store = ModData.get(TAG)
    if store == nil then return Connections.new() end
    if type(store) ~= "table" or getmetatable(store) then error("invalid connection store") end
    for key in pairs(store) do
        if key ~= "canonical" then error("unknown connection store field") end
    end
    if not store.canonical or not Connections.connections(store.canonical) then
        error("invalid connection state")
    end
    return store.canonical
end

function J.observe(fact)
    local ok, accepted, reason = pcall(function()
        local staged, status = Connections.observe(current(), fact)
        if not staged then return false, status end
        if status == "duplicate" then return true, status end
        local allowed, why = Budget.check("keyConnections", {canonical=staged})
        if not allowed then return false, why end
        local store = ModData.getOrCreate(TAG)
        store.canonical = staged
        local ui = ConspiracyFiles and ConspiracyFiles.NotebookUI
        if ui and ui.refresh then pcall(ui.refresh) end
        return true, "recorded"
    end)
    if not ok then return false, tostring(accepted) end
    return accepted, reason
end

function J.rows()
    local ok, rows = pcall(function()
        local connections = assert(Connections.connections(current()))
        local titles = {}
        local runtime = ConspiracyFiles and ConspiracyFiles.GeneratedRuntime
        if runtime and runtime.known then
            for _, row in ipairs(runtime.known()) do titles[row.id] = row.title end
        end
        local result = {}
        for _, connection in ipairs(connections) do
            result[#result+1] = {
                id="connection:"..connection.id,
                ordinal=#result+1,
                title="Possible connection: "..connection.name,
                summary="Interpretation - key and building",
                detailText="A key observed with a document naming "..connection.name..
                    " matches the building where I found "..(titles[connection.clueId] or "the earlier clue")..
                    ". This suggests a connection between those belongings and that place. "..
                    "It does not establish who lived there or wrote the clue. The original clue remains unchanged.",
            }
        end
        return result
    end)
    return ok and rows or {}
end

return J
