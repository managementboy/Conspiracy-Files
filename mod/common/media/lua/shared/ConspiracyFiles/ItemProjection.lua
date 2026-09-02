local Content = require("ConspiracyFiles/Content")
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

function ItemProjection.refresh(item, itemPort)
    local modData = modDataFor(item, itemPort)
    if not modData then return false, "item ModData is unavailable" end
    local inspected, message = ItemPresentation.inspectModData(modData)
    if not inspected then return false, message end
    if not inspected.physicalToken then return false, "physical-token" end
    local current, currentMessage = ItemPresentation.definition(inspected.assetId, {
        revealed = true,
        physicalToken = inspected.physicalToken
    })
    if not current then return false, currentMessage end
    local displayed, displayMessage = setDisplay(item, itemPort, current.resolvedTitle)
    if not displayed then return false, displayMessage end
    local refreshed, refreshDetail, changed = ItemPresentation.refreshModData(modData)
    if not refreshed then return false, refreshDetail end
    return true, refreshDetail, changed
end

function ItemProjection.token(item, itemPort)
    local modData = modDataFor(item, itemPort)
    if not modData then return nil end
    local identity, message = ItemPresentation.identityFromModData(modData)
    if not identity then return nil, message end
    return identity.physicalToken
end

-- Collision detection is deliberately broader than acceptance. Placement uses
-- this only to stop before creating another item when malformed data claims the
-- expected token; it never treats the malformed carrier as authoritative.
function ItemProjection.claimsToken(item, expectedToken, itemPort)
    local modData = modDataFor(item, itemPort)
    if not modData then return false end
    local nested = modData[ItemPresentation.MOD_DATA_KEY]
    if type(nested) == "table" and nested.physicalToken == expectedToken then return true end
    return modData[ItemProjection.fields.physicalItemId] == expectedToken
end

return ItemProjection
