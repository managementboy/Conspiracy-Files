local separator = package.config:sub(1, 1)
local source = arg and arg[0] or "tools/validate_content.lua"
local root = source:gsub("[\\/]tools[\\/]validate_content%.lua$", "")
if root == source then root = "." end

package.path = root .. separator .. "mod" .. separator .. "common" .. separator
    .. "media" .. separator .. "lua" .. separator .. "shared" .. separator .. "?.lua;"
    .. package.path

local Content = require("ConspiracyFiles/Content")
local Ids = require("ConspiracyFiles/Ids")

local ok, message = Content.validate()
assert(ok, message)

local fixturePath = root .. separator .. "test" .. separator .. "fixtures"
    .. separator .. "THREAD-001-DEAD-AIR.md"
local fixtureFile = assert(io.open(fixturePath, "rb"))
local fixture = fixtureFile:read("*a")
fixtureFile:close()
fixture = string.gsub(fixture, "\r\n", "\n")

local function patternEscape(value)
    return (string.gsub(value, "(%W)", "%%%1"))
end

for _, assetId in ipairs(Content.thread.documentAssetIds) do
    local body = string.match(
        fixture,
        "Document ID:%*%* `" .. patternEscape(assetId) .. "`.-```text\n(.-)\n```"
    )
    assert(body, "fixture body missing for " .. assetId)
    assert(body == Content.assets[assetId].bodyText, "fixture body differs for " .. assetId)
    assert(Ids.authoredEvidence(assetId), "Evidence ID failed for " .. assetId)
end

print("Dead Air content validation passed")
