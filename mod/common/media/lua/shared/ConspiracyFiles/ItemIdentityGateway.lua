local Content = require("ConspiracyFiles/Content")
local ItemPresentation = require("ConspiracyFiles/ItemPresentation")

local ItemIdentityGateway = {}

local function modDataFor(item, itemPort)
    local ok, value
    if itemPort and type(itemPort.modData) == "function" then
        ok, value = pcall(itemPort.modData, item)
    else
        ok, value = pcall(function() return item:getModData() end)
    end
    if not ok or type(value) ~= "table" then return nil, "missing-moddata" end
    return value
end

local function setDisplay(item, itemPort, title)
    local ok, message = pcall(function()
        if itemPort and type(itemPort.setName) == "function" then itemPort.setName(item, title)
        else item:setName(title) end
        if itemPort and type(itemPort.setCustomName) == "function" then itemPort.setCustomName(item, true)
        else item:setCustomName(true) end
    end)
    if not ok then return false, tostring(message) end
    return true
end

local function claimMatches(claims, assetId, token)
    return claims.nestedAssetId == assetId or claims.legacyAssetId == assetId
        or claims.nestedPhysicalToken == token or claims.legacyPhysicalToken == token
end

function ItemIdentityGateway.new(options)
    options = options or {}
    local tokenFor = assert(options.tokenFor, "canonical token provider is required")
    local itemPort = options.itemPort
    local api = {}

    function api.expectedToken(assetId)
        if type(assetId) ~= "string" or not Content.assets[assetId] then return nil, "unknown-asset" end
        local token = tokenFor(assetId)
        if type(token) ~= "string" or token == "" then return nil, "identity-not-initialized" end
        return token
    end

    function api.verify(item, expectedAssetId)
        local modData, modDataMessage = modDataFor(item, itemPort)
        if not modData then return { status = "other", reason = modDataMessage, hasCarrier = false } end
        local inspected, inspectMessage = ItemPresentation.inspectModData(modData)
        local assetId = expectedAssetId or (inspected and inspected.assetId or nil)
        local expectedToken, tokenMessage = nil, nil
        if assetId then expectedToken, tokenMessage = api.expectedToken(assetId) end

        if inspected and expectedToken then
            local assetMatches = inspected.assetId == assetId
            local tokenMatches = inspected.physicalToken == expectedToken
            local identity = {
                assetId = inspected.assetId,
                physicalToken = inspected.physicalToken,
                hasLegacy = inspected.hasLegacy,
                presentationState = inspected.presentationState
            }
            if assetMatches and tokenMatches then
                return { status = "verified", identity = identity, inspected = inspected, expectedToken = expectedToken }
            end
            if assetMatches or tokenMatches then
                return { status = "collision", identity = identity, reason = "asset-token-mismatch", hasCarrier = true }
            end
            return { status = "other", identity = identity, reason = "different-canonical-pair", hasCarrier = true }
        end

        local claims = ItemPresentation.carrierClaims(modData)
        if claims.hasCarrier then
            local status = expectedToken and claimMatches(claims, assetId, expectedToken) and "collision" or "rejected"
            return {
                status = status,
                reason = inspectMessage or tokenMessage or "rejected-carrier",
                claims = claims,
                hasCarrier = true
            }
        end
        return { status = "other", reason = inspectMessage or tokenMessage, hasCarrier = false }
    end

    function api.refresh(item, expectedAssetId)
        local result = api.verify(item, expectedAssetId)
        if result.status ~= "verified" then return false, result.reason, false, result end
        local displayed, displayMessage = setDisplay(item, itemPort, result.inspected.asset.displayName)
        if not displayed then return false, displayMessage, false, result end
        local modData, modDataMessage = modDataFor(item, itemPort)
        if not modData then return false, modDataMessage, false, result end
        local refreshed, refreshDetail, changed = ItemPresentation.refreshModData(modData)
        if not refreshed then return false, refreshDetail, false, result end
        local verified = api.verify(item, expectedAssetId)
        if verified.status ~= "verified" then return false, verified.reason or "post-refresh-verification", false, verified end
        return true, refreshDetail, changed, verified
    end

    function api.resolvePresentation(item, isInventoryItem)
        if type(isInventoryItem) ~= "function" or not isInventoryItem(item) then return nil, "not-inventory-item" end
        local first = api.verify(item)
        if first.status ~= "verified" then return nil, first.reason or first.status end
        local refreshed, refreshMessage = api.refresh(item, first.identity.assetId)
        if not refreshed then return nil, refreshMessage end
        local subject, subjectMessage = ItemPresentation.validate(item, isInventoryItem)
        if not subject then return nil, subjectMessage end
        local final = api.verify(item, subject.assetId)
        if final.status ~= "verified" then return nil, final.reason or final.status end
        return subject
    end

    function api.verifyObservation(assetId, observation)
        observation = observation or {}
        local verified = {
            matches = {}, collisions = {},
            coverage = observation.coverage,
            lossConfirmed = observation.lossConfirmed == true
        }
        local seen = {}
        local function classify(record, suppliedKind)
            local item = record and (record.item or record) or nil
            if item == nil or seen[item] then return end
            seen[item] = true
            local result = api.verify(item, assetId)
            local normalized = {
                item = item,
                identity = result.identity,
                reason = result.reason,
                location = type(record) == "table" and record.location or nil
            }
            if result.status == "verified" then
                verified.matches[#verified.matches + 1] = normalized
            elseif result.status == "collision" or result.status == "rejected" or suppliedKind == "match" then
                if not normalized.reason then normalized.reason = "supplied observation is not the canonical pair" end
                verified.collisions[#verified.collisions + 1] = normalized
            end
        end
        for _, record in ipairs(observation.items or {}) do classify(record, "item") end
        for _, record in ipairs(observation.matches or {}) do classify(record, "match") end
        for _, record in ipairs(observation.collisions or {}) do classify(record, "collision") end
        return verified
    end

    return api
end

return ItemIdentityGateway
