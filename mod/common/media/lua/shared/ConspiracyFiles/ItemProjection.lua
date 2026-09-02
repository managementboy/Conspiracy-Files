local Content = require("ConspiracyFiles/Content")
local ItemIdentityGateway = require("ConspiracyFiles/ItemIdentityGateway")
local ItemPresentation = require("ConspiracyFiles/ItemPresentation")

local ItemProjection = {}

-- Retained only to recognize the rejected candidate's exact legacy mirror.
ItemProjection.fields = ItemPresentation.LEGACY_FIELDS

local function modDataFor(item, itemPort)
    local ok, value
    if itemPort and type(itemPort.modData) == "function" then
        ok, value = pcall(itemPort.modData, item)
    else
        ok, value = pcall(function() return item:getModData() end)
    end
    if not ok or type(value) ~= "table" then return nil end
    return value
end

local function setDisplay(item, itemPort, title)
    local ok, message = pcall(function()
        itemPort.setName(item, title)
        itemPort.setCustomName(item, true)
    end)
    if not ok then return false, tostring(message) end
    return true
end

function ItemProjection.payload(assetId, physicalItemId)
    local asset = Content.assets[assetId]
    if not asset then return nil, "unknown Asset" end
    if type(asset.displayName) ~= "string" or asset.displayName == "" then return nil, "document title is invalid" end
    local description = asset.descriptionText or asset.inspectText
    local body = asset.bodyText or asset.inspectText
    if type(description) ~= "string" or description == "" then return nil, "asset description is invalid" end
    if type(body) ~= "string" or body == "" then return nil, "asset body is invalid" end
    if type(physicalItemId) ~= "string" or physicalItemId == "" then return nil, "physical item identity is invalid" end
    return {
        schema = ItemPresentation.SCHEMA_VERSION,
        physicalItemId = physicalItemId,
        assetId = assetId,
        title = asset.displayName,
        description = description,
        body = body,
        itemType = asset.pzItemType
    }
end

function ItemProjection.apply(item, assetId, physicalItemId, itemPort)
    local payload, message = ItemProjection.payload(assetId, physicalItemId)
    if not payload then return false, message end
    local presentation, presentationMessage = ItemPresentation.definition(assetId, {
        revealed = true,
        physicalToken = physicalItemId
    })
    if not presentation then return false, presentationMessage end
    local modData = modDataFor(item, itemPort)
    if not modData then return false, "item ModData is unavailable" end
    local displayed, displayMessage = setDisplay(item, itemPort, payload.title)
    if not displayed then return false, displayMessage end
    for _, legacyKey in pairs(ItemProjection.fields) do modData[legacyKey] = nil end
    modData[ItemPresentation.MOD_DATA_KEY] = presentation
    local inspected, inspectMessage = ItemPresentation.inspectModData(modData)
    if not inspected or inspected.assetId ~= assetId or inspected.physicalToken ~= physicalItemId
        or inspected.presentationState ~= "current" then
        return false, inspectMessage or "detached item projection did not validate"
    end
    return true, payload
end

function ItemProjection.identity(item, itemPort)
    local modData = modDataFor(item, itemPort)
    if not modData then return nil end
    local inspected, message = ItemPresentation.inspectModData(modData)
    if not inspected then return nil, message end
    if not inspected.physicalToken then return nil, "physical-token" end
    return {
        assetId = inspected.assetId,
        physicalToken = inspected.physicalToken,
        hasLegacy = inspected.hasLegacy
    }
end

function ItemProjection.token(item, itemPort)
    local identity, message = ItemProjection.identity(item, itemPort)
    if not identity then return nil, message end
    return identity.physicalToken
end

-- Compatibility wrapper for QA/diagnostics. Production placement, physical
-- scans and presentation share one long-lived ItemIdentityGateway instance.
function ItemProjection.classifyIdentity(item, expectedAssetId, expectedToken, itemPort)
    local gateway = ItemIdentityGateway.new({
        itemPort = itemPort,
        tokenFor = function(assetId)
            if assetId == expectedAssetId then return expectedToken end
            return nil
        end
    })
    local result = gateway.verify(item, expectedAssetId)
    if result.status == "verified" then return "match", result.identity end
    if result.status == "collision" or result.status == "rejected" then
        return "collision", result.identity, result.reason
    end
    return "other", result.identity, result.reason
end

return ItemProjection
