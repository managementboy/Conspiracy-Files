-- Stages for checks/oi_cue.sh (loaded after oi_scene.lua). Ids, counts and LENGTHS only.
CFCUE = CFCUE or {}
function CFCUE.state()
    local s = OIShared.ClueCue.state()
    local last = s.last
    local spoken = OIShared.ClueCue.lastSpoken
    return s.said, s.suppressed, tostring(last ~= nil and last.id == CFSCENE.id),
        last and #tostring(last.line) or 0, spoken and #tostring(spoken) or 0
end
