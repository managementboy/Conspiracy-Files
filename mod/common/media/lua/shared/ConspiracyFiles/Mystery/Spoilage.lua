-- READABILITY, PULLED LAZILY, NEVER A RUNNING TIMER.
--
-- Design v3, iteration 2's deepened hub-and-spoilage branch, refined by
-- iteration 3's on-call/attacker frames on Interpreter.lua: an author
-- declares only `kind` and `where`; a finding's tier is computed at the
-- moment something asks for it, from (kind, placedAtHour, nowHour,
-- outdoor) - never a scheduled tick, never a stored countdown a save could
-- freeze. `site.outdoor` is a static property the mystery's site tag
-- carries, not a live weather query, so this adds no new simulation.
--
-- One correction from the attacker frame: a finding not yet actually
-- placed (still an instalment) has no `placedAt`. Coercing that nil into
-- zero elapsed hours would report an unplaced finding as freshest-possible
-- - readable before it exists. This module refuses that coercion outright
-- and returns the explicit tier "unplaced" instead.
--
-- Pure. No PZ dependency, no clock of its own: `nowHour` is the caller's
-- own in-game hour, supplied once per evaluation (10-year-old frame,
-- iteration 3: spoilage must never be SHOWN as a countdown; this module
-- does not even keep one to show).
local M={}

-- Per-kind fade curves, in elapsed in-game hours, outdoors. Indoor sites
-- fade at a quarter the outdoor rate (a floor, not a simulation - a cellar
-- is not weathered, but it is not a vault either). `nil` for a stage means
-- that kind never reaches it: metal and keys never fade at all.
M.CURVES={
    paper={worn=12,faded=24},
    photo={worn=24,faded=48},
    corpse={worn=24,faded=72}, -- the game's own decay is the real clock; this is a floor when no live signal is threaded through
    metal=nil,
    key=nil,
}
M.INDOOR_FACTOR=4 -- indoor hours-to-fade are curve values times this factor

-- kind: a Spoilage.CURVES key ("paper", "metal", ...); placedAtHour: the
-- hour the finding actually entered the world, or nil if it is still
-- waiting (an instalment); nowHour: the caller's current in-game hour;
-- outdoor: whether the site is outdoors (nil/false = indoors).
--
-- Returns "unplaced" | "fresh" | "worn" | "faded".
function M.tier(kind,placedAtHour,nowHour,outdoor)
    if type(placedAtHour)~="number" or placedAtHour~=placedAtHour then return "unplaced" end
    if type(nowHour)~="number" or nowHour~=nowHour or nowHour<placedAtHour then return "unplaced" end
    local curve=M.CURVES[kind]
    if not curve then return "fresh" end -- never fades: metal, keys
    local elapsed=nowHour-placedAtHour
    local factor=outdoor and 1 or M.INDOOR_FACTOR
    if curve.faded and elapsed>=curve.faded*factor then return "faded" end
    if curve.worn and elapsed>=curve.worn*factor then return "worn" end
    return "fresh"
end

return M
