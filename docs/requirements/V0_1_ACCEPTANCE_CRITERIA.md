# V0.1 Vertical Slice — Acceptance Criteria

**Status:** Complete implementation input; acceptance has not yet been demonstrated.

**Scope:** the single built-in Dead Air vertical slice at content revision `dead-air-r1`.

**Content gate:** Dead Air remains a development-time AI-assisted candidate and is not canonical-shippable until the project owner records human approval under [`../design/AI_PROVENANCE.md`](../design/AI_PROVENANCE.md).

This specification turns the v0.1 product boundary in [`../../ROADMAP.md`](../../ROADMAP.md), the complete [`../../test/fixtures/THREAD-001-DEAD-AIR.md`](../../test/fixtures/THREAD-001-DEAD-AIR.md) candidate and the story-derived model in [`../design/V0_1_DATA_MODEL.md`](../design/V0_1_DATA_MODEL.md) into observable acceptance checks. It does not claim that an unrun Project Zomboid spike has succeeded.

## Verification vocabulary

Every criterion has exactly one classification:

- `plain-Lua automated test` — executable against the PZ-free domain core under Lua 5.1;
- `static content/design inspection` — review of authored data, source structure or scope;
- `live Project Zomboid test` — requires the supported Build 42 game runtime;
- `blocked pending a named spike` — its reliable live mechanism cannot be specified until the named spike reports observed behavior.

Readiness describes the criterion today, not whether the eventual implementation passes:

- `ready` — sufficiently specified to implement and verify;
- `blocked — human approval` — inspectable, but the shipping content gate remains open;
- `blocked — T# / Issue #N` — waits on the named authoritative spike;
- `awaiting implementation` — live method is specified, but no production slice exists to exercise;
- `location selection outstanding` — the two exact curated vanilla targets have not been chosen and verified.

[`T1`](../research/T1_MODDATA_PERSISTENCE.md) and [`T9`](../research/T9_NETWORK_EGRESS.md) are completed Build 42.20.4 facts. T4 is Issue #5, T5 is #6, T7 is #8, T8 is #9 and T10 is #10, per [`../../PROJECT_STATE.md`](../../PROJECT_STATE.md). T2 is not required by this curated-location slice. T3 may inform later automatic categorisation, but it does not replace manual selection and verification of the two v0.1 targets.

## Product acceptance

These criteria describe the intended story, state and PZ-independent behavior. Passing them does not validate engine hooks.

| ID | Requirement | Classification | Evidence / test method | Pass condition | Current readiness | Owning spike |
|---|---|---|---|---|---|---|
| CF-V01-P01 | Dead Air contains exactly one ThreadDefinition, six required document Assets, three Identities, one Organisation, two Locations, one anchor and one fallback; the optional B-37 key is a seventh Asset but not a seventh document clue. | static content/design inspection | Parse/review the fixture and static definition against the count table in the data model. | Counts are exactly `1/6/3/1/2/1/1`; the key is optional and `autoRecordEvidence=false`. | ready | None |
| CF-V01-P02 | All authored records use the stable IDs in the canonical ID inventory below, with no duplicates or object/table identity standing in for an ID. | static content/design inspection | Compare authored definition keys and all static references to the inventory; reject missing, extra or duplicate IDs. | The exact inventory is present once, every reference resolves, and all IDs are strings. | ready | None |
| CF-V01-P03 | The six full Dead Air documents remain human-review candidates until explicit project-owner approval is recorded. | static content/design inspection | Inspect the fixture status and provenance policy plus the approval record/review artifact. | Shipping acceptance is impossible without explicit human approval; approval does not add per-item immersion-breaking labels. | blocked — human approval | None |
| CF-V01-P04 | Discovery of either D1 or D2 first introduces `dead-air:thread`, records that actual document and discovery context, and exposes only an ordinary-text lead toward the other location. | plain-Lua automated test | Feed D1-first and D2-first discovery events into a fresh domain state. | Each path creates one thread-introduced event, one Evidence record for the discovered Asset, and a non-quest lead; it creates no hidden facts, objective, map marker or completion state. | ready | None |
| CF-V01-P05 | Selecting/activating the fallback never suppresses either location's complete supporting set: relay D1/D3/D4 and police D2/D5/D6 remain authored and eligible. | static content/design inspection | Validate both `entryOpportunityUsed` variants against placement membership. | Anchor and fallback change only the guaranteed introduction opportunity; all six document Assets remain assigned to their authored locations and none is disabled. | ready | None |
| CF-V01-P06 | Domain materialisation and discovery commands are idempotent: each required Asset can reach materialised once and create at most one authored Evidence record and one asset-discovered JournalEntry. | plain-Lua automated test | Replay duplicate and reordered domain commands, including state reconstructed from a save-shaped fixture. | Repetition produces no duplicate Evidence/JournalEntry, no ordinal reuse and no regression of a committed state. | ready | T4 owns the engine commit sequence, not this invariant. |
| CF-V01-P07 | Evidence discovery facts are immutable after creation. | plain-Lua automated test | Create authored and marked-object Evidence, then attempt to change `evidenceId`, `kind`, `assetId`, `discoveryOrdinal`, `contextText`, `foundLocationId` and creation intent. | Mutations are rejected or leave the original record byte-for-byte/logically unchanged; later interpretation is represented by new journal events or derived views. | ready | None |
| CF-V01-P08 | JournalEntry history is append-only and chronological by discovery/event order, not authored document date. | plain-Lua automated test | Exercise multiple discovery orders plus later location/update/contradiction events; attempt delete, insert, reorder and overwrite operations. | IDs and ordinals are unique, contiguous and increasing; prior entries never move or change; later events append at the end. | ready | None |
| CF-V01-P09 | The no-AI renderer deterministically produces the six approved discovery summaries and fixed event text from event kind, stable IDs, static definitions and immutable context. | plain-Lua automated test | Render identical canonical histories repeatedly and after save-shaped round trips with runtime AI unavailable. | Output and major-marker classification are identical for identical input; rendered prose is not required in canonical state and no network/provider data is read. | ready | None |
| CF-V01-P10 | The D5/D6 contradiction surfaces exactly once and only after the survivor knows sufficient source material; both sources remain visible and neither is selected as truth. | plain-Lua automated test | Test all D5/D6 discovery orders, repeated events and incomplete prerequisite sets. | No early/hidden-knowledge entry appears; completion of the authored prerequisites appends one deterministic contradiction entry/major marker; evidence is unchanged. | ready | None |
| CF-V01-P11 | Discovering D6 after a previously Marked Interesting B-37 key recontextualises that Evidence exactly once without claiming proven physical identity. | plain-Lua automated test | Test key-before-D6, D6-before-key, unmarked-key and repeated-D6 paths. | Only a prior marked-key Evidence receives the authored update event; wording uses a contextual match, retains original discovery context and does not assert token identity. | ready | T5 only owns optional physical tracking. |
| CF-V01-P12 | Major discovery markers occur only for: first D1/D2 introduction, referenced Relay Site 31 confirmation, and the authored contradiction; each occurs at most once. | plain-Lua automated test | Enumerate discovery/location event orders and replay them. | Exactly the eligible event is marked major once; D3/D4/D5 alone are not major, and no final/solved marker is produced. | ready | None |
| CF-V01-P13 | Dead Air has no case-complete, quest-complete, objective-stage, truth-reveal or world-reaction state. | static content/design inspection | Search static definitions, domain schema, journal rules and normal-play UI strings. | No such field, event, banner, marker or reaction exists; ignored leads remain optional. | ready | None |
| CF-V01-P14 | Mark Interesting creates Evidence from an acquired/inspectable object with immutable context and appends the corresponding chronology event. | plain-Lua automated test | Mark a generic object and the authored B-37 key; repeat the command. | One unique save-local Evidence record is created per mark intent with `playerMarkedInteresting=true`; repeat invocation does not duplicate it. | ready | T10 owns the live action surface. |
| CF-V01-P15 | B-37 remains optional: an unmarked key creates no Evidence, and every required Dead Air discovery/contradiction path works without it. | plain-Lua automated test | Complete the six-document state with the key absent/unmarked, then compare required journal and evidence outcomes. | Six required document Evidence records and all non-key major events remain attainable; no missing-key error or blocked thread state occurs. | ready | None |
| CF-V01-P16 | The Organisation label is derived: D2-only knowledge shows the generic contractor/C.S.S. wording; discovery of D1, D3 or D5 refines it to `Cumberland Signal Services`. | plain-Lua automated test | Evaluate the projection for all relevant discovered-Asset subsets. | Generic wording is used before a reveal Asset; the specific name is used afterward without mutating or persisting an Organisation copy. | ready | None |
| CF-V01-P17 | Location labels are derived from static definitions plus `confirmedLocationIds`: pre-arrival labels remain vague and confirmation refines only the confirmed location. | plain-Lua automated test | Project zero, one and two confirmed-location states, including duplicate confirmation events. | `Relay Site 31` / `police property desk` resolve to their confirmed labels only after their stable ID is confirmed; confirmation is idempotent and append-only in the journal. | ready | T8 owns the live arrival signal. |
| CF-V01-P18 | Every proposed canonical replacement is recursively validated under P4-R32 before the last known-good root is swapped. | plain-Lua automated test | Cover valid scalar/plain-table states and invalid key/value types, cycles, aliases, metatables, functions, userdata, threads, exposed Java-object stand-ins, depth 65, schema errors and staged failure. | Only string/number keys and string/number/boolean/plain-table values pass; nil means absence; depth is at most 64; aliases are rejected or normalized; any failure preserves the prior root and emits one concise diagnostic. | ready | T1 complete / Issue #1 |
| CF-V01-P19 | The encoded canonical state estimator enforces the hard P4-R17 ceiling of `≤500 KB/save`; static document prose and reconstructable indexes are excluded. | plain-Lua automated test | Measure representative maximal Dead Air state and boundary payloads immediately below/above 500 KB. | Conforming state at or below the ceiling may stage; oversized state is rejected before swap; the maximal slice contains only root metadata, six materialisation states, 6–7 Evidence, 0–2 confirmations and append-only JournalEntries. | ready | T1 complete / Issue #1 |
| CF-V01-P20 | Core play and all journal output work with no runtime AI, network, API key, provider, prompt or response record. | static content/design inspection | Inspect dependencies, schema and default feature path; cross-check the T9 verdict. | The slice has no runtime-AI dependency or credential/state field and invokes no network path; deterministic behavior is complete offline. | ready | T9 complete / Issue #2 |
| CF-V01-P21 | v0.1 explicitly contains no graph, theories, content packs, retrofit, migrations or multiplayer support. | static content/design inspection | Search production/static schema, UI navigation and initialization paths for these capabilities. | No feature implementation or persisted state for any excluded capability exists; multiplayer contains disablement only. | ready | None |
| CF-V01-P22 | Normal play never exposes hidden truth or full diagnostics, and system-derived contradiction/recontextualisation wording is explainable from discovered sources. | static content/design inspection | Review journal/UI copy and provenance links for every derived v0.1 event. | Each derived statement names or links only known supporting evidence; no omniscient truth dump is reachable in normal play. | ready | None |
| CF-V01-P23 | Dead Air uses static stable-ID arrays for references, leads, contradiction and recontextualisation; it has no standalone Relationship records/store. | static content/design inspection | Inspect the static model and canonical state schema. | Relationships are reconstructable from Asset arrays, zero Relationship records are instantiated/persisted, and no graph-era schema is introduced. | ready | None |
| CF-V01-P24 | Evidence resolves document title/body/entity references from static content and never copies the six full document bodies into canonical save state. | plain-Lua automated test | Build Evidence projections before/after save-shaped reconstruction and inspect the canonical root. | All discovered documents render in full via `assetId`; canonical Evidence contains no duplicate body text and a missing static ID fails validation clearly. | ready | None |
| CF-V01-P25 | The domain core runs under plain Lua 5.1 with zero PZ imports/globals and treats engine events only as adapter inputs. | plain-Lua automated test | Run the entire domain suite in a plain Lua 5.1 process with PZ globals absent. | All product criteria classified as plain-Lua pass without launching PZ or loading Java/PZ objects. | ready | None |

## Engine validation

These criteria validate PZ-facing behavior. A blocked criterion is not a license to assume the expected API; its pass condition becomes executable only after the named spike records the mechanism.

| ID | Requirement | Classification | Evidence / test method | Pass condition | Current readiness | Owning spike |
|---|---|---|---|---|---|---|
| CF-V01-E01 | Two exact, plausible vanilla targets are selected and statically bound: a relay/communications service location and a police property/records location. | live Project Zomboid test | On the supported Build 42 minor line, visit and document coordinates/building/room or radius bindings, containers and story plausibility; verify bindings from a clean world. | Both stable Location IDs resolve to reachable, distinct curated targets with plausible containers/context for D1/D3/D4 and D2/D5/D6. | location selection outstanding | None; T2 is unnecessary and T3 / Issue #4 does not gate curated selection. |
| CF-V01-E02 | The anchor D1 materialises exactly once across repeated target availability callbacks, save/reload and interrupted placement. | blocked pending a named spike | After T4 defines the durable commit/reconcile sequence, execute its fault-injection matrix at the selected relay target. | One D1 exists and one committed state survives every replay; no duplicate, loss or false committed state occurs. | blocked — T4 / Issue #5 | T4 |
| CF-V01-E03 | Fallback D2 activates only when D1 cannot safely materialise, commits exactly once, and does not create a duplicate introduction if D1 was already safely committed/discovered. | blocked pending a named spike | After T4, exercise anchor success, anchor unsafe/unavailable, interruption before/after commit and repeated reload paths. | Exactly one guaranteed introduction opportunity wins; D2 is used only on the defined failure path and introduction is recorded once. | blocked — T4 / Issue #5 | T4 |
| CF-V01-E04 | All six documents materialise at most once while fallback use leaves both locations' complete supporting content available. | blocked pending a named spike | After T4, load/unload both targets repeatedly, activate fallback, save/reload at each transition and inventory all authored stamped Assets. | Exactly one each of D1–D6 exists; relay retains D1/D3/D4 and police retains D2/D5/D6 regardless of entry opportunity. | blocked — T4 / Issue #5 | T4 |
| CF-V01-E05 | Physical item tracking is optional and truthful across inventory/container moves, drops, reload and destruction/loss. | blocked pending a named spike | After T5, run the proven token matrix for the receiver/key and a no-token fallback path. | If a safe stamped token exists, availability tracks only that token; if identity is lost, Evidence remains and becomes unavailable/untracked; the slice still passes with no token. | blocked — T5 / Issue #6 | T5 |
| CF-V01-E06 | Each D1–D6 body is readable in full through the mechanism proven safe for static/runtime text while normal inventory/container behavior remains intact. | blocked pending a named spike | After T7, test name/body/page persistence and reader behavior before/after save/reload for all six preferred interaction types. | Full approved text and correct title display without leaking hidden data, replacing vanilla Lua or corrupting normal item behavior. | blocked — T7 / Issue #8 | T7 |
| CF-V01-E07 | Arrival at each curated target confirms only its matching Location once, including the relay site's potentially non-standard building/room geometry. | blocked pending a named spike | After T8, exercise boundary entry/exit, room/building/radius variants, reload while inside and nearby false-positive positions. | Exactly one confirmation event is appended per matching location after it has been referenced; nearby/unrelated travel does not confirm it. | blocked — T8 / Issue #9 | T8 |
| CF-V01-E08 | `Inspect` and `Mark Interesting` integrate cooperatively with the live context menu and never replace or suppress another handler. | blocked pending a named spike | After T10, test supported object contexts with vanilla and another additive test listener, repeated menu construction and unavailable/invalid subjects. | One appropriate action appears, existing actions/listeners remain, activation reaches the domain once, and invalid contexts fail cleanly. | blocked — T10 / Issue #10 | T10 |
| CF-V01-E09 | A valid staged canonical root round-trips through Global ModData, while rejected replacements preserve the last known-good root. | live Project Zomboid test | On the supported Build 42 line, execute clean save/reload, repeated reload and invalid-replacement cases using the production adapter; measure encoded delta. | Every accepted field and ordinal survives exactly, derived views rebuild identically, invalid state never replaces good state, and encoded canonical state is ≤500 KB. | awaiting implementation | T1 complete / Issue #1 |
| CF-V01-E10 | Death and reload do not duplicate, reorder or erase discoveries; deterministic recap generation uses only the last valid canonical knowledge and never reveals hidden truth. | live Project Zomboid test | Exercise death before/after discoveries, save/reload around death handling, abrupt interruption at supported lifecycle points, and no-AI operation. | Canonical pre-death knowledge remains internally consistent, recap is deterministic/knowledge-bounded, and no pending AI/network operation can lose or replace it. | awaiting implementation | None assigned; exact lifecycle probe/owner is not yet named. |
| CF-V01-E11 | In multiplayer the mod detects the mode and disables cleanly before canonical initialization or world mutation. | live Project Zomboid test | Start host/client and dedicated-server smoke cases with logging and inspect ModData/world/container state. | One concise disable notice/log occurs, no Dead Air state/assets/hooks continue, no errors spam, and vanilla/other-mod behavior remains available. | awaiting implementation | None; multiplayer support is out of scope. |
| CF-V01-E12 | Outside explicit initialization, Conspiracy-Files work remains within the provisional ≤2 ms/frame target and uses bounded queued work. | live Project Zomboid test | Profile representative discovery, notebook open, repeated callbacks, save-adjacent work and idle play; include worst-case complete Dead Air state. | Normal-play CF work is ≤2 ms per frame in the acceptance runs, queues have a fixed per-frame bound, and no full-map scan/all-pairs loop/synchronous network call occurs. | awaiting implementation | None; P4-R16 remains provisional until measured. |
| CF-V01-E13 | Every PZ adapter contains errors and repeated subsystem failures without corrupting canonical state or spamming each frame. | live Project Zomboid test | Inject deterministic faults at each adapter boundary and during staged multi-step changes; continue normal play afterward. | `pcall` contains each boundary failure, staged state is not partially committed, one concise report is emitted, and the failing subsystem auto-disables after a bounded documented threshold while unrelated subsystems continue. | awaiting implementation | None |

## Canonical stable-ID inventory

The exact authored IDs accepted by CF-V01-P02 are:

```text
dead-air:thread

dead-air:asset:service-ticket-93-0714
dead-air:asset:property-record-4471
dead-air:asset:invoice-9327
dead-air:asset:rourke-notebook-0703
dead-air:asset:access-memo-7c
dead-air:asset:pike-shift-note-0705
dead-air:asset:key-b37

dead-air:identity:m-rourke
dead-air:identity:dana-pike
dead-air:identity:h-vale

dead-air:organisation:cumberland-signal-services

dead-air:location:relay-office
dead-air:location:police-property
```

Generated per-save Evidence and append-order JournalEntry IDs are deliberately outside this authored inventory; their uniqueness and format are domain-test concerns.

## Acceptance sequence

1. Static inspection may approve structure, scope and eventually the human content gate.
2. Plain-Lua tests prove the PZ-free domain invariants and persistence validator/estimator.
3. T4/T5/T7/T8/T10 must report observed mechanisms before their blocked criteria can be converted into executable live matrices. Spike conclusions may require this document to change.
4. The two curated targets are selected and verified directly; neither T2 nor successful automatic categorisation is required.
5. Live Build 42 tests validate adapters, full save/reload, death/reload, multiplayer disablement, performance and error containment.

The slice is accepted only when every criterion passes, including human approval of Dead Air. Passing this document never makes an unresolved design assumption into a Build 42 fact.
