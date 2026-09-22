-- The Investigate Area marker's LIFE, in a real game. Loaded after
-- clue_search.lua, whose CFClue picks a real placed clue and drives Search
-- Mode; this adds only the three questions that check does not ask.
--
-- The contract changed on 2026-09-21 (e35ad6d, "Keep unresolved clue markers
-- searchable"): ClueSearchRules.wantsIcon now keys on `resolved` rather than
-- `recognised`, and S.LINGER_MS is gone. Recognition names the evidence but
-- must NOT erase its locator - the player may still have to search the room
-- to find the thing. Only inspecting it resolves it.
--
-- Offline, test/clue_search_rules covers the rule. This asks the game.
CFMark = CFMark or {}
local M = CFMark
local R = ConspiracyFiles.GeneratedRuntime
local C = ConspiracyFiles.ClueSearch
local Rules = require("ConspiracyFiles/ClueSearchRules")

-- Whether the picked clue currently has an icon, said plainly.
function M.hasIcon()
    local t = CFClue and CFClue.target
    if not t then return "false", "no clue picked" end
    local m = ISSearchManager.getManager(getPlayer())
    local icon = m.clueIcons and m.clueIcons[C.iconIdFor(t.id)]
    return tostring(icon ~= nil), tostring(m.isSearchMode)
end

-- The rule's own opinion, ON THE PRODUCT'S OWN ROW. GeneratedRuntime builds
-- each clue row with `resolved=known[id]==true`, and ClueSearch.liveClues
-- feeds exactly that to the rule; recomputing "resolved" here would be asking
-- a different question and could agree by luck while the product disagreed.
function M.wants()
    local t = CFClue and CFClue.target
    if not t then return "false", "no clue picked" end
    local row
    for _, c in ipairs(R.clueTargets() or {}) do if c.id == t.id then row = c end end
    if not row then return "false", "the runtime no longer lists this clue" end
    local p = getPlayer()
    local m = ISSearchManager.getManager(p)
    return tostring(Rules.wantsIcon(row, p:getX(), p:getY(), m.isSearchMode == true)),
        tostring(row.status), tostring(row.recognised == true), tostring(row.resolved == true)
end

-- Is the linger timer really gone? It used to drop the icon eight seconds
-- after recognition, which is exactly the behaviour the change removed.
function M.noLinger()
    return tostring(Rules.LINGER_MS == nil)
end
return true
