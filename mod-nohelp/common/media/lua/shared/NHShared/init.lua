-- The package entry point: require("NHShared") resolves to this file by
-- Lua's own convention, and test/domain_core_spec.lua and
-- test/placement_spec.lua both do exactly that to get the domain in one piece.
--
-- Nothing else requires it and nothing references it by name, so it reads as
-- dead code and was very nearly deleted on 2026-09-13 for looking like an
-- unused aggregator. The suite caught it - "no file
-- NHShared/init.lua" - which is the only reason this comment exists.
-- It is load-bearing. Leave it.
return {
    Content = require("NHShared/Content"),
    Ids = require("NHShared/Ids"),
    Placement = require("NHShared/Placement"),
    Renderer = require("NHShared/Renderer"),
    ThreadState = require("NHShared/ThreadState"),
    Validator = require("NHShared/Validator")
}
