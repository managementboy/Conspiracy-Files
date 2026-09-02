local Content = require("ConspiracyFiles/Content")

local ItemPresentation = {}

ItemPresentation.MOD_DATA_KEY = "ConspiracyFiles"
ItemPresentation.SCHEMA_VERSION = 1
ItemPresentation.MAX_TOKEN_LENGTH = 160
ItemPresentation.MAX_TITLE_LENGTH = 512
ItemPresentation.MAX_DESCRIPTION_LENGTH = 4096
ItemPresentation.MAX_BODY_LENGTH = 64 * 1024

-- These are the only pre-r1 presentation carriers that schema 2 knows how to
-- refresh safely. A non-empty string is not evidence of backward
-- compatibility; unknown and future revisions must remain untouched.
ItemPresentation.COMPATIBLE_OLDER_REVISIONS = {
    ["dead-air-r0-compatible"] = true,
    ["dead-air-r0-compatible-text"] = true
}

-- The nested table above is canonical. These fields were emitted by the first
-- schema-2 candidate and remain a compatibility mirror only when every field is
-- present and exactly agrees with the nested carrier.
ItemPresentation.LEGACY_FIELDS = {
    schema = "ConspiracyFilesPhysicalIdentitySchema",
    physicalItemId = "ConspiracyFilesPhysicalItemId",
    assetId = "ConspiracyFilesAssetId",
    title = "ConspiracyFilesTitle",
    description = "ConspiracyFilesDescription",
    body = "ConspiracyFilesBody"
}

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

local function validRequiredString(value, maximum)
    return type(value) == "string" and value ~= "" and string.len(value) <= maximum
end

local function validateNestedShape(value)
    if type(value) ~= "table" or getmetatable(value) ~= nil then return false, "moddata-shape" end
    for key, child in pairs(value) do
        if type(key) ~= "string" or not MOD_DATA_FIELDS[key] or type(child) == "table"
            or type(child) == "function" or type(child) == "userdata" or type(child) == "thread" then
            return false, "moddata-shape"
        end
    end
    return true
end

local function legacyState(modData)
    local fields = ItemPresentation.LEGACY_FIELDS
    local present = false
    for _, key in pairs(fields) do if modData[key] ~= nil then present = true end end
    if not present then return false end
    for _, key in pairs(fields) do if modData[key] == nil then return nil, "legacy-mirror-incomplete" end end
    return true
end

-- Quarantined compatibility inspection. No other module reads the legacy flat
-- field names directly; callers receive claims only for collision detection,
-- never as an authoritative carrier.
function ItemPresentation.carrierClaims(modData)
    if type(modData) ~= "table" then return { hasCarrier = false } end
    local nested = modData[ItemPresentation.MOD_DATA_KEY]
    local fields = ItemPresentation.LEGACY_FIELDS
    local hasLegacy = false
    for _, key in pairs(fields) do if modData[key] ~= nil then hasLegacy = true end end
    return {
        hasCarrier = nested ~= nil or hasLegacy,
        hasNested = nested ~= nil,
        hasLegacy = hasLegacy,
        nestedAssetId = type(nested) == "table" and nested.assetId or nil,
        nestedPhysicalToken = type(nested) == "table" and nested.physicalToken or nil,
        legacyAssetId = hasLegacy and modData[fields.assetId] or nil,
        legacyPhysicalToken = hasLegacy and modData[fields.physicalItemId] or nil
    }
end

local function readIdentity(modData)
    if type(modData) ~= "table" then return nil, "missing-moddata" end
    local value = modData[ItemPresentation.MOD_DATA_KEY]
    local shapeOk, shapeMessage = validateNestedShape(value)
    if not shapeOk then
        if type(value) ~= "table" then return nil, "missing-conspiracy-files-data" end
        return nil, shapeMessage
    end
    if value.schemaVersion ~= ItemPresentation.SCHEMA_VERSION then return nil, "schema" end
    if type(value.assetId) ~= "string" or string.len(value.assetId) > 160 then return nil, "asset-id" end
    local asset = Content.assets[value.assetId]
    if not asset then return nil, "unknown-asset" end
    if not validOptionalString(value.physicalToken, ItemPresentation.MAX_TOKEN_LENGTH) then return nil, "physical-token" end

    local hasLegacy, legacyMessage = legacyState(modData)
    if hasLegacy == nil then return nil, legacyMessage end
    if hasLegacy then
        local fields = ItemPresentation.LEGACY_FIELDS
        if modData[fields.schema] ~= value.schemaVersion then return nil, "legacy-schema-mismatch" end
        if modData[fields.assetId] ~= value.assetId then return nil, "legacy-asset-mismatch" end
        if modData[fields.physicalItemId] ~= value.physicalToken then return nil, "legacy-token-mismatch" end
        if modData[fields.title] ~= value.resolvedTitle then return nil, "legacy-title-mismatch" end
        if modData[fields.description] ~= value.resolvedDescription then return nil, "legacy-description-mismatch" end
        if modData[fields.body] ~= value.resolvedBody then return nil, "legacy-body-mismatch" end
    end
    return {
        value = value,
        asset = asset,
        assetId = value.assetId,
        physicalToken = value.physicalToken,
        hasLegacy = hasLegacy == true
    }
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
        resolvedBody = asset.bodyText or asset.inspectText,
        physicalToken = options.physicalToken
    }
end

function ItemPresentation.identityFromModData(modData)
    local identity, message = readIdentity(modData)
    if not identity then return nil, message end
    return {
        assetId = identity.assetId,
        physicalToken = identity.physicalToken,
        hasLegacy = identity.hasLegacy
    }
end

function ItemPresentation.inspectModData(modData)
    local identity, message = readIdentity(modData)
    if not identity then return nil, message end
    local value, asset = identity.value, identity.asset
    if value.revealed ~= true then return nil, "hidden" end
    if not validRequiredString(value.contentRevision, 128) then return nil, "content-revision" end
    if not validRequiredString(value.resolvedTitle, ItemPresentation.MAX_TITLE_LENGTH) then return nil, "title" end
    if not validRequiredString(value.resolvedDescription, ItemPresentation.MAX_DESCRIPTION_LENGTH) then return nil, "description" end
    if not validRequiredString(value.resolvedBody, ItemPresentation.MAX_BODY_LENGTH) then return nil, "body" end
    local state = "current"
    if value.contentRevision == Content.thread.contentRevision then
        if value.resolvedTitle ~= asset.displayName then return nil, "title" end
        if value.resolvedDescription ~= assetDescription(asset) then return nil, "description" end
        if value.resolvedBody ~= (asset.bodyText or asset.inspectText) then return nil, "body" end
    elseif ItemPresentation.COMPATIBLE_OLDER_REVISIONS[value.contentRevision] then
        state = "stale-compatible"
    else
        return nil, "content-revision"
    end
    return {
        assetId = identity.assetId,
        asset = asset,
        physicalToken = identity.physicalToken,
        hasLegacy = identity.hasLegacy,
        presentationState = state,
        value = value
    }
end

function ItemPresentation.isCompatibleOlderRevision(revision)
    return ItemPresentation.COMPATIBLE_OLDER_REVISIONS[revision] == true
end

function ItemPresentation.refreshModData(modData)
    local inspected, message = ItemPresentation.inspectModData(modData)
    if not inspected then return false, message end
    if inspected.presentationState == "current" then return true, copy(inspected.value), false end
    local current, definitionMessage = ItemPresentation.definition(inspected.assetId, {
        revealed = true,
        physicalToken = inspected.physicalToken
    })
    if not current then return false, definitionMessage end
    modData[ItemPresentation.MOD_DATA_KEY] = copy(current)
    if inspected.hasLegacy then
        local fields = ItemPresentation.LEGACY_FIELDS
        modData[fields.schema] = current.schemaVersion
        modData[fields.physicalItemId] = current.physicalToken
        modData[fields.assetId] = current.assetId
        modData[fields.title] = current.resolvedTitle
        modData[fields.description] = current.resolvedDescription
        modData[fields.body] = current.resolvedBody
    end
    return true, copy(current), true
end

function ItemPresentation.stamp(item, assetId, options)
    if type(item) ~= "table" and type(item) ~= "userdata" then return false, "item" end
    local definition, message = ItemPresentation.definition(assetId, options)
    if not definition then return false, message end
    local ok, modData = pcall(function() return item:getModData() end)
    if not ok or type(modData) ~= "table" then return false, "missing-moddata" end
    ok, message = pcall(function()
        item:setName(definition.resolvedTitle)
        item:setCustomName(true)
        modData[ItemPresentation.MOD_DATA_KEY] = copy(definition)
    end)
    if not ok then return false, tostring(message) end
    return true, copy(definition)
end

function ItemPresentation.validate(item, isInventoryItem)
    if type(isInventoryItem) ~= "function" or not isInventoryItem(item) then return nil, "not-inventory-item" end
    local ok, modData = pcall(function() return item:getModData() end)
    if not ok or type(modData) ~= "table" then return nil, "missing-moddata" end
    local inspected, message = ItemPresentation.inspectModData(modData)
    if not inspected then return nil, message end
    if inspected.presentationState ~= "current" then return nil, "content-revision" end
    local displayOk, displayName = pcall(function() return item:getDisplayName() end)
    if not displayOk or displayName ~= inspected.asset.displayName then return nil, "display-name" end
    return {
        item = item,
        assetId = inspected.assetId,
        assetKind = inspected.asset.assetKind,
        title = inspected.value.resolvedTitle,
        description = inspected.value.resolvedDescription,
        body = inspected.value.resolvedBody,
        physicalToken = inspected.physicalToken
    }
end

return ItemPresentation
