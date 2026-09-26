-- CFEngine's one PublicAPI table (module B, per docs/design/
-- MODULE_SEPARATION_2026-09-26.md sections 2.2 and 3 step 3). A or C may
-- call into B only through CFEngine.PublicAPI, never through B's own
-- internal files directly.
--
-- Per the ADHD re-evaluation before this stage started (5 frames,
-- independently convergent): this table is grown from real straddler
-- call sites as they're resolved, not designed upfront from a guess at
-- what B "should" expose. Each entry below is the exact object or
-- function a real straddler already called before this file existed;
-- resolving a straddler means redirecting its one remaining global reach
-- here, not inventing a new interface.
ConspiracyFiles=ConspiracyFiles or {}
CFEngine=CFEngine or {}
local PublicAPI=CFEngine.PublicAPI or {}
CFEngine.PublicAPI=PublicAPI

-- GeneratedMenu.lua (straddler, resolved to module A) picks whichever of
-- these two claims a given item and calls the same duck-typed methods
-- (subject/metrics/retiredPaper/isRecognised) on whichever one won - a
-- real, working dispatch rule, kept exactly as it already was.
--
-- require(), not a read off the CFEngine global: PZ's own file-load order
-- across a directory is not something this file can rely on, but
-- require() returns the same cached, real, already-initialized table
-- regardless of load order, executing the target module synchronously if
-- it hasn't run yet.
PublicAPI.MapMediaRuntime=require("ConspiracyFiles/MapMediaRuntime")
PublicAPI.GeneratedRuntime=require("ConspiracyFiles/GeneratedRuntime")

-- KnoxApps.lua and OrganiserScreen.lua (module C) read these four directly
-- today to build the NAMES/DATES/FILES/PLACES programs - the same
-- relocate-don't-redesign treatment as the two above.
PublicAPI.DiscoveryLog=require("ConspiracyFiles/DiscoveryLog")
PublicAPI.AddressMap=require("ConspiracyFiles/AddressMap")
PublicAPI.PersonNameLog=require("ConspiracyFiles/PersonNameLog")
PublicAPI.IdentityObserver=require("ConspiracyFiles/IdentityObserver")

-- KnoxApps.lua and OrganiserScreen.lua (module C) also require
-- Generated/Questions.lua directly today, to build and answer the FILES
-- list's "what do I make of it?" question rows - the one Generated/*
-- content-generation module resolved this increment. The higher-risk
-- ones (EvidenceRows.lua's four Generated/* requires, which build every
-- real FILES row's title/fields/body/kind) are deliberately not done yet
-- - see docs/design/MODULE_SEPARATION_2026-09-26.md section 3a for why.
PublicAPI.Questions=require("ConspiracyFiles/Generated/Questions")
PublicAPI.SuccessiveCases=require("ConspiracyFiles/Generated/SuccessiveCases")

return PublicAPI
