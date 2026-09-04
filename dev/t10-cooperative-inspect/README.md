# T10 cooperative Inspect probe

Disposable Project Zomboid Build 42 code for GitHub Issue #10. This is an auditable spike, not production Conspiracy-Files code.

This directory contains the historical approved pure-Lua/manual-GUI probe, its
static test, and evidence. The earlier injected-helper route was abandoned after
a security alert whose `runner.exe` provenance remains unknown. That route and
its helper/auto-continue artifacts are prohibited: do not restore, rebuild,
copy, or run them; do not alter security controls or attempt alternate
injection. ADR-0006 permits only the separately bounded and currently unrun
`../t10-zombiebuddy-helper/` contract, never this historical route. See
`evidence/SECURITY_STOP.md` for the factual incident record.

The probe activates only when it is the sole enabled mod and the current disposable Sandbox save begins `T10_cooperative_inspect`.

It creates disposable stamped items and exercises the exact installed inventory
and world-object context-menu events. Its startup matrix constructs mock menus
inside the running Kahlua environment but deliberately invokes no action and
opens no real menu. Live activation evidence can therefore come only from the
project owner's genuine context-menu clicks. `Mark Interesting` persists a
probe-only marker in the validated item ModData so its disabled/idempotent state
can be checked after reopening a menu and after a save/reload.

The inventory receives six clearly named T10 items: two revealed Notes, one
revealed B-37 Key, one hidden Note, one invalid Paperclip, and one fault-injection
Letter. A revealed Photo is dropped on the player's square. A second additive
listener contributes `T10 Companion Action`; private option keys let the probe
prove that it preserves that listener and all pre-existing vanilla options.

Safety rules:

- copy an already disposable save; never point this probe at a user save or character;
- enable only `ConspiracyFiles_T10_Probe`;
- never copy files into the game installation or replace vanilla Lua;
- hash and back up `latestSave.ini`, `mods/default.txt`, `options.ini`, and `debuglog.ini` before setup;
- archive every disposable save, installed probe copy, log, and screenshot rather than deleting it; never restore prohibited helper artifacts;
- restore control files byte-for-byte, remove the active probe copy, and leave Project Zomboid closed.

## Manual matrix

After the log prints `READY_FOR_MANUAL_UI`, use only ordinary mouse/controller
input in Project Zomboid:

1. Right-click `T10 revealed-note` twice. Confirm exactly one `Inspect`, one
   `Mark Interesting`, one `T10 Companion Action`, and ordinary vanilla actions
   on both constructions. Click `Inspect` once on the second menu.
2. Expand/right-click the grouped Note stack. Confirm the ambiguous multi-item
   selection shows one disabled `Inspect Conspiracy-Files item`, no Mark action,
   one companion action, and vanilla actions.
3. Multi-select one revealed T10 item plus `T10 invalid`, then right-click.
   Confirm the valid item alone gets exactly one Inspect and one Mark action.
4. Multi-select both revealed T10 items, then right-click. Confirm one disabled
   ambiguous Inspect hint and no Mark action.
5. Right-click the hidden Note and invalid Paperclip separately. Confirm neither
   exposes a Conspiracy-Files action.
6. Right-click `T10 key-b37`, click `Mark Interesting` once, reopen its menu,
   and confirm Mark is disabled as already marked. Save and return to the main
   menu, reload this same disposable save, then reopen the key's menu and confirm
   Mark remains disabled.
7. Right-click the fault-injection Letter and click `Inspect`. Confirm the game
   continues normally; the log must contain exactly one `BOUNDARY_ERROR` and no
   `DOMAIN_INSPECT` for that item.
8. Right-click the dropped `T10 unowned-photo` in the Ground inventory pane.
   Confirm Inspect is enabled, Mark is disabled as unowned, and vanilla/companion
   actions remain. A direct-world right-click may be observed only as a negative
   capability check: the completed run received zero inventory subjects there,
   so no Conspiracy-Files action is expected. Perform controller activation only
   if a controller is already connected and the path is straightforward;
   otherwise record it as an explicit limitation.

The historical manual matrix used no F-keys, console commands, macros,
synthetic input, computer control or external helper. A future run may instead
use only ADR-0006's separately reviewed, checksum-pinned contract; it must not
reuse this section as broad automation authority. Stop immediately on any
identity, provenance, focus, process, cleanup or security failure.

## Completed result

The 2026-09-01 manual run completed without a security alert. Player inventory
and Ground/loot inventory panes passed the activation/coexistence matrix;
direct-world-item right-click is explicitly unsupported. The run also exposed a
probe-only reload fixture duplication, corrected in the final source through a
separate `cfT10CaseId`. See `docs/research/T10_COOPERATIVE_INSPECT.md` and
`evidence/manual-gui-run.txt`.
