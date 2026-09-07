# Retained live fixture — Sandbox/2026-09-07_11-51-30

**Owner is preserving this save deliberately.** Do not modify, reset or delete
it, and do not ask the owner to overwrite it. The owner keeps their own copy;
this file records what makes it worth keeping.

- **Save:** `C:\Users\elkin.fricke\Zomboid\Saves\Sandbox\2026-09-07_11-51-30`
- **Mod build in play:** `DEV-0.8.6-discovery-ledger`, repo at `e1d2035`
- **Game:** Build 42.20.4, revision `b0bbce05d5`
- **Case id:** `1177813649`, four documents, record `R-340`

## Why it is valuable

It is the first save in which the discovery ledger was verified live, and it
holds a corpse that is close to an ideal fixture for the person/key strand.

### The corpse

Standing position roughly `10695, 9956, floor 0`. It carries, all vanilla loot:

- **`ID Card: Norman Valle`** — loose in the corpse container, already observed
  and recorded as ledger `#5` (`Base.IDcard_Male:2063428190`, hour 6.74).
- **`Key - Residence`** — a real key bound by `keyId` to a real residence.
  **Nothing in the mod looks at this yet.** It is the concrete argument for the
  open question in `docs/design/CORPSE_KEYS_AND_IDS.md`: a named body, a real
  key, a real house, and the current design fabricating its own key instead.
- **An unopened wallet containing a second ID** — never observed, so it is
  still available as a clean test of the wallet transfer flow and would produce
  a fresh identity event.

A second ID (`ID Card: Frances Dowdy`) and `Frances Dowdy's Key Ring` are in the
player's own inventory. `IdentityObserver` deliberately ignores the player's
inventory, so these are not recorded and should not be expected to be.

### Case state

All four documents discovered and inspected:

    #1 evidence document-1 hour 3.30   Dispatch copy   10716, 9988, z=0 livingroom
    #2 evidence document-3 hour 4.72   File review     10687, 9955, z=0 livingroom
    #3 evidence document-4 hour 5.46   Press clipping  10693, 9959, z=0 bathroom
    #4 evidence document-2 hour 5.58   Receiving copy  10687, 9953, z=0 livingroom
    #5 identity IDcard_Male hour 6.74  Found ID Card: Norman Valle

Note the documents were found out of generation order, which is exactly what
makes this save proof that the notebook renders true discovery order.

## What it can still test

- The wallet transfer flow, using the unopened wallet, for a sixth ledger entry
  interleaved after existing ones.
- The person chain past `anonymousClue` once `LocalPersonIntegration` is running
  again — `bound`, `nameDocument`, `keySource`, `keyDoorMatch` have never fired.
- A `keyId` to building lookup prototype against a real vanilla residence key.
- Notebook window position and open/closed state across a quit and reload.

## What it cannot test

- Reachability gating or basement placement: every target here is `z=0`, and
  ground level short-circuits before the predicate is consulted.
- Stale clue relocation: all four documents are already discovered, so nothing
  is eligible to move.
- Automatic successive cases, unless `nextCase` is invoked or 24 game hours
  pass.

## Compatibility warning

Under **P4-R63** a pre-1.0 schema change may make this save's generated case
unloadable. `Session.assignments` already gained `placedHours` and
`relocations` on 2026-09-06. If a later change breaks it, that is expected and
allowed; the fixture's value is then historical only. Record any such break
here rather than silently discarding the save.
