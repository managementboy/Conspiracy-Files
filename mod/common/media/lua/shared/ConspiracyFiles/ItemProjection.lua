local Content = require("ConspiracyFiles/Content")
local ItemPresentation = require("ConspiracyFiles/ItemPresentation")

local ItemProjection = {}

ItemProjection.fields = {
    schema = "ConspiracyFilesPhysicalIdentitySchema",
    physicalItemId = "ConspiracyFilesPhysicalItemId",
    assetId = "ConspiracyFilesAssetId",
    title = "ConspiracyFilesTitle",
    description = "ConspiracyFilesDescription",
    body = "ConspiracyFilesBody"
}

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
        schema = 1,
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
    local modData = itemPort.modData(item)
    if type(modData) ~= "table" then return false, "item ModData is unavailable" end
    local fields = ItemProjection.fields
    modData[fields.schema] = payload.schema
    modData[fields.physicalItemId] = payload.physicalItemId
    modData[fields.assetId] = payload.assetId
    modData[fields.title] = payload.title
    modData[fields.description] = payload.description
    modData[fields.body] = payload.body
    modData[ItemPresentation.MOD_DATA_KEY] = presentation
    itemPort.setName(item, payload.title)
    itemPort.setCustomName(item, true)
    if modData[fields.schema] ~= 1 or modData[fields.physicalItemId] ~= physicalItemId
        or modData[fields.assetId] ~= assetId or modData[fields.title] ~= payload.title
        or modData[fields.description] ~= payload.description or modData[fields.body] ~= payload.body
        or modData[ItemPresentation.MOD_DATA_KEY].physicalToken ~= physicalItemId
        or modData[ItemPresentation.MOD_DATA_KEY].resolvedDescription ~= payload.description then
        return false, "detached item projection did not validate"
    end
    return true, payload
end

function ItemProjection.token(item, itemPort)
    local modData = itemPort.modData(item)
    if type(modData) ~= "table" then return nil end
    return modData[ItemProjection.fields.physicalItemId]
end

return ItemProjection
