local Content = require("ConspiracyFiles/Content")

local ItemPresentation = {}

ItemPresentation.MOD_DATA_KEY = "ConspiracyFiles"
ItemPresentation.SCHEMA_VERSION = 1
ItemPresentation.MAX_TOKEN_LENGTH = 160

local MOD_DATA_FIELDS = {
    schemaVersion = true,
    contentRevision = true,
    assetId = true,
    revealed = true,
    resolvedTitle = true,
    resolvedDescription = true,
    resolvedBody = true,
    physicalToken = true
}

local DEFINITION_OPTIONS = { revealed = true, physicalToken = true }

local function copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[copy(key)] = copy(child) end
    return result
end

local function assetDescription(asset)
    if asset.assetKind == "document" then return asset.descriptionText end
    return asset.inspectText
end

local function validOptionalString(value, maximum)
    return value == nil or (type(value) == "string" and value ~= "" and string.len(value) <= maximum)
end

function ItemPresentation.definition(assetId, options)
    options = options or {}
    if type(options) ~= "table" then return nil, "options" end
    for key, _ in pairs(options) do if not DEFINITION_OPTIONS[key] then return nil, "unsupported-option" end end
    local asset = Content.assets[assetId]
    if not asset then return nil, "unknown-asset" end
    if options.physicalToken ~= nil and not validOptionalString(options.physicalToken, ItemPresentation.MAX_TOKEN_LENGTH) then
        return nil, "physical-token"
    end
    return {
        schemaVersion = ItemPresentation.SCHEMA_VERSION,
        contentRevision = Content.thread.contentRevision,
        assetId = assetId,
        revealed = options.revealed == true,
        resolvedTitle = asset.displayName,
        resolvedDescription = assetDescription(asset),
        resolvedBody = asset.bodyText,
        physicalToken = options.physicalToken
    }
end

function ItemPresentation.stamp(item, assetId, options)
    if type(item) ~= "table" and type(item) ~= "userdata" then return false, "item" end
    local definition, message = ItemPresentation.definition(assetId, options)
    if not definition then return false, message end
    local ok, modData = pcall(function() return item:getModData() end)
    if not ok or type(modData) ~= "table" then return false, "missing-moddata" end
    ok, message = pcall(function()
        modData[ItemPresentation.MOD_DATA_KEY] = copy(definition)
        item:setName(definition.resolvedTitle)
        item:setCustomName(true)
    end)
    if not ok then return false, tostring(message) end
    return true, copy(definition)
end

function ItemPresentation.validate(item, isInventoryItem)
    if type(isInventoryItem) ~= "function" or not isInventoryItem(item) then return nil, "not-inventory-item" end
    local ok, modData = pcall(function() return item:getModData() end)
    if not ok or type(modData) ~= "table" then return nil, "missing-moddata" end
    local value = modData[ItemPresentation.MOD_DATA_KEY]
    if type(value) ~= "table" then return nil, "missing-conspiracy-files-data" end
    if getmetatable(value) ~= nil then return nil, "moddata-shape" end
    for key, child in pairs(value) do
        if type(key) ~= "string" or not MOD_DATA_FIELDS[key] or type(child) == "table"
            or type(child) == "function" or type(child) == "userdata" or type(child) == "thread" then
            return nil, "moddata-shape"
        end
    end
    if value.schemaVersion ~= ItemPresentation.SCHEMA_VERSION then return nil, "schema" end
    if value.contentRevision ~= Content.thread.contentRevision then return nil, "content-revision" end
    if value.revealed ~= true then return nil, "hidden" end
    if type(value.assetId) ~= "string" or string.len(value.assetId) > 160 then return nil, "asset-id" end
    local asset = Content.assets[value.assetId]
    if not asset then return nil, "unknown-asset" end
    if value.resolvedTitle ~= asset.displayName then return nil, "title" end
    if value.resolvedDescription ~= assetDescription(asset) then return nil, "description" end
    if value.resolvedBody ~= asset.bodyText then return nil, "body" end
    if not validOptionalString(value.physicalToken, ItemPresentation.MAX_TOKEN_LENGTH) then return nil, "physical-token" end
    local displayOk, displayName = pcall(function() return item:getDisplayName() end)
    if not displayOk or displayName ~= asset.displayName then return nil, "display-name" end
    return {
        item = item,
        assetId = value.assetId,
        assetKind = asset.assetKind,
        title = value.resolvedTitle,
        description = value.resolvedDescription,
        body = value.resolvedBody,
        physicalToken = value.physicalToken
    }
end

return ItemPresentation
