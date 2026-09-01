local Content = require("ConspiracyFiles.Content")

local Presentation = {}

local HELP = {
    title = "A Note to Myself",
    paragraphs = {
        "Survival comes first. This notebook only records what I actually learn.",
        "Right-click a revealed Dead Air item in my inventory or the Ground/loot pane and choose Inspect. A document enters the chronology only when I inspect it.",
        "I can Mark Interesting on an owned ordinary object when it seems worth remembering. That is suspicion, not proof.",
        "The Journal stays in discovery order. Evidence lists what I have actually recorded. Vague place names become more precise only after I confirm them.",
        "There is no solved stamp, objective list, or hidden-truth page. If two records disagree, both remain in the notebook.",
        "The notebook key can be changed under the game's Key Bindings options."
    }
}

local function copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    for key, child in pairs(value) do result[copy(key)] = copy(child) end
    return result
end

function Presentation.reader(subject)
    if type(subject) ~= "table" then return nil, "reader subject is required" end
    local asset = Content.assets[subject.assetId]
    if not asset then return nil, "unknown reader Asset ID" end
    local description = asset.assetKind == "document" and asset.descriptionText or asset.inspectText
    if subject.title ~= asset.displayName or subject.description ~= description or subject.body ~= asset.bodyText then
        return nil, "reader subject does not match authoritative content"
    end
    return {
        title = asset.displayName,
        description = description,
        body = asset.bodyText or description,
        assetKind = asset.assetKind
    }
end

function Presentation.notebook(domain)
    assert(type(domain) == "table", "notebook domain is required")
    local snapshot = domain.snapshot()
    local renderedJournal = domain.renderJournal()
    local journal = {}
    for index, row in ipairs(renderedJournal) do
        journal[index] = {
            ordinal = row.ordinal,
            text = row.text,
            major = row.major == true,
            kind = row.kind
        }
    end
    local evidence = {}
    for index, fact in ipairs(snapshot.evidence) do
        local resolved, message = domain.resolveEvidence(fact.evidenceId)
        if not resolved then error(message) end
        evidence[index] = {
            evidenceId = fact.evidenceId,
            discoveryOrdinal = fact.discoveryOrdinal,
            title = resolved.displayName,
            contextText = fact.contextText,
            playerMarkedInteresting = fact.playerMarkedInteresting == true,
            evidenceKind = fact.kind,
            hasDocumentBody = type(resolved.bodyText) == "string"
        }
    end
    return {
        title = Content.thread.title,
        journal = journal,
        evidence = evidence,
        help = copy(HELP)
    }
end

function Presentation.help()
    return copy(HELP)
end

return Presentation
