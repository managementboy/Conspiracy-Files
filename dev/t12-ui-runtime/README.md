# T12 shared UI probe — DEV-0.6

Status: prepared replacement for the unresolved earlier UI; no archived live pass.

Enable ConspiracyFiles plus ConspiracyFiles_T12_Probe in a disposable debug session. The dependency is explicit in mod.info. Do not enable T11 at the same time. The shared T12Mode bootstrap disables the world runtime before ModData access.

The owner manually enters ConspiracyFiles.T12Probe.open() in the normal debug console. It builds 86 synthetic evidence rows in memory, then opens the production Notebook.lua using the production DocumentPane.lua. It does not create items, save canonical state, trigger real Inspect, or claim a visual verdict. No separate divergent scrollbar implementation remains.

## Required observations

Start with the prior failure: 3200×2000, font setting 3. Verify ordinary ink, high contrast, a visible scrollbar, wheel, track paging and thumb drag at both ends. Titles and actions must stay fixed. Then check long titles, compact/wide layout, Help, native X, the configurable toggle, Escape remaining with the game, keyboard focus, lower resolutions, font changes and repeated resize/open/close.

Controller navigation is unimplemented; record unsupported/unavailable rather than implying keyboard bindings prove controller support. T12 geometry is retained in the running synthetic session only; actual player ModData geometry persistence belongs to the production/T11 or full acceptance run.

## Evidence

Record exact build/revision, mod list, save identity, source hashes, version marker, resolution/font setting, actions, visible outcome and console errors in evidence/live-run-template.md. The source manifest is in docs/management/evidence/2026-09-05-correction/. Keep DEV-0.4 failures and DEV-0.5 unverified history separate.

A console READY line proves preparation only. No synthetic input, injected helper, UI automation or security changes. The owner performs GUI actions.
