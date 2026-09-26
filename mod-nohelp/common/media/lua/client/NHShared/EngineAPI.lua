-- NHEngine's one PublicAPI table (module B, per docs/design/
-- MODULE_SEPARATION_2026-09-26.md sections 2.2 and 3 step 3). A or C may
-- call into B only through NHEngine.PublicAPI, never through B's own
-- internal files directly.
--
-- Per the ADHD re-evaluation before this stage started (5 frames,
-- independently convergent): this table is grown from real straddler
-- call sites as they're resolved, not designed upfront from a guess at
-- what B "should" expose. Each entry below is the exact object or
-- function a real straddler already called before this file existed;
-- resolving a straddler means redirecting its one remaining global reach
-- here, not inventing a new interface.
NHShared=NHShared or {}
NHEngine=NHEngine or {}
local PublicAPI=NHEngine.PublicAPI or {}
NHEngine.PublicAPI=PublicAPI

-- GeneratedMenu.lua (straddler, resolved to module A) picks whichever of
-- these two claims a given item and calls the same duck-typed methods
-- (subject/metrics/retiredPaper/isRecognised) on whichever one won - a
-- real, working dispatch rule, kept exactly as it already was.
--
-- require(), not a read off the NHEngine global: PZ's own file-load order
-- across a directory is not something this file can rely on, but
-- require() returns the same cached, real, already-initialized table
-- regardless of load order, executing the target module synchronously if
-- it hasn't run yet.
PublicAPI.MapMediaRuntime=require("NHShared/MapMediaRuntime")
PublicAPI.GeneratedRuntime=require("NHShared/GeneratedRuntime")

-- KnoxApps.lua and OrganiserScreen.lua (module C) read these four directly
-- today to build the NAMES/DATES/FILES/PLACES programs - the same
-- relocate-don't-redesign treatment as the two above.
PublicAPI.DiscoveryLog=require("NHShared/DiscoveryLog")
PublicAPI.AddressMap=require("NHShared/AddressMap")
PublicAPI.PersonNameLog=require("NHShared/PersonNameLog")
-- Found by the stage-5 boundary check: LocalPersonIntegration.lua
-- (module A) reaches these two directly too.
PublicAPI.KeyJournal=require("NHShared/KeyJournal")
PublicAPI.BodyOutfitLog=require("NHShared/BodyOutfitLog")
PublicAPI.IdentityObserver=require("NHShared/IdentityObserver")

-- KnoxApps.lua and OrganiserScreen.lua (module C) also require
-- Generated/Questions.lua directly today, to build and answer the FILES
-- list's "what do I make of it?" question rows - the one Generated/*
-- content-generation module resolved this increment. The higher-risk
-- ones (EvidenceRows.lua's four Generated/* requires, which build every
-- real FILES row's title/fields/body/kind) are deliberately not done yet
-- - see docs/design/MODULE_SEPARATION_2026-09-26.md section 3a for why.
PublicAPI.Questions=require("NHShared/Generated/Questions")
PublicAPI.SuccessiveCases=require("NHShared/Generated/SuccessiveCases")

-- EvidenceRows.lua reclassified from unclear to module B this increment
-- (docs/design/MODULE_SEPARATION_2026-09-26.md section 3a): "the
-- projection from what the survivor has actually found to the rows the
-- organiser shows" is content-assembly (it requires 4 Generated/*
-- modules directly to build FILES/NAMES/PLACES row text), not PDA
-- rendering. KnoxApps.lua (module C) now reaches it through here instead
-- of requiring it directly - the real fix for the finding that aliasing
-- alone can't invert a plain require() dependency.
PublicAPI.EvidenceRows=require("NHShared/EvidenceRows")

return PublicAPI
