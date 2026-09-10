-- The build string, in one place.
--
-- It was in two: Notebook's UI.VERSION named the title bar and the packaged
-- archive, while Runtime.VERSION stamped every [CF-DEAD-AIR] log line. Both
-- were maintained by hand and drifted six releases apart, so a log collected
-- on 2026-09-08 from a DEV-0.8.12 build reported DEV-0.6-transactional-
-- candidate. A version that lies in the logs is worse than no version: the
-- logs are where a problem gets diagnosed.
--
-- Nothing else may define a build string. tools/package.sh and
-- tools/publish_workshop.sh read this file, and test/version_single_source.lua
-- fails if a second literal appears.
--
-- This module deliberately requires nothing, so anything can read it without
-- dragging in a dependency chain.
ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.VERSION = "DEV-0.21.0-wallet"
return ConspiracyFiles.VERSION
