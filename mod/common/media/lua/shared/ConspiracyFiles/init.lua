-- The package entry point: require("ConspiracyFiles") resolves to this file by
-- Lua's own convention, and test/domain_core_spec.lua and
-- test/placement_spec.lua both do exactly that to get the domain in one piece.
--
-- Nothing else requires it and nothing references it by name, so it reads as
-- dead code and was very nearly deleted on 2026-09-13 for looking like an
-- unused aggregator. The suite caught it - "no file
-- ConspiracyFiles/init.lua" - which is the only reason this comment exists.
-- It is load-bearing. Leave it.
return {
    Content = require("ConspiracyFiles/Content"),
    Ids = require("ConspiracyFiles/Ids"),
    Placement = require("ConspiracyFiles/Placement"),
    Renderer = require("ConspiracyFiles/Renderer"),
    ThreadState = require("ConspiracyFiles/ThreadState"),
    Validator = require("ConspiracyFiles/Validator")
}
