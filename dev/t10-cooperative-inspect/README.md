# T10 cooperative Inspect probe

Disposable Project Zomboid Build 42 code for GitHub Issue #10. This is an auditable spike, not production Conspiracy-Files code.

**Security stop — do not run this harness or rebuild/relaunch its JNI helper.** The attempted live matrix ended after a security product reported `runner.exe` quarantined as `Win64:MalwareX-gen [Cryp]` and the game reported `Fatal Error`. Provenance was not established. Resume only after user/security review selects a manual-GUI route that does not restore the flagged binary, add exclusions, bypass protection, or use alternate injection. See `evidence/SECURITY_STOP.md`.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T10_cooperative_inspect`.

It creates disposable stamped items and exercises the exact installed inventory and world-object context-menu events. The automated matrix covers raw items, grouped/stack rows with the dummy first entry, mixed and ambiguous multi-selection, valid/revealed, hidden, invalid and unowned subjects, repeated construction, idempotent listener registration, a second additive listener, option-key duplicate suppression, action activation count, exception containment, and T7-shaped custom-name/ModData validation. Genuine right-click observations are logged separately.

`ConspiracyFilesT10AutoContinue.lua` is a separate navigation-only harness for automation environments whose synthesized input is not exposed through the game's raw-input path. It waits for the main menu, calls the same `MainScreen.continueLatestSave` function as the vanilla Continue option, then unregisters itself. It cannot reach the probe's items, callbacks, domain state, or assertions.

The source remains only to make the stopped attempt auditable. It did not produce live T10 activation evidence and is covered by the do-not-run warning above.

Safety rules:

- copy an already disposable save; never point this probe at a user save or character;
- enable only `ConspiracyFiles_T10_Probe`;
- never copy files into the game installation or replace vanilla Lua;
- hash and back up `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before setup;
- archive every disposable save, installed probe copy, helper, log, and screenshot rather than deleting it;
- restore control files byte-for-byte, remove the active probe copy, and leave Project Zomboid closed.
