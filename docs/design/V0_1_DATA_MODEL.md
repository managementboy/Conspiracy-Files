# V0.1 Data Model — Story-Derived Minimal Model

**Status:** v0.1 design for the single built-in Dead Air Narrative Thread.  
**Source story:** `test/fixtures/THREAD-001-DEAD-AIR.md`, content revision `dead-air-r1`.  
**Technical status:** logical/domain model only. T1 validated vanilla Lua Global ModData on Build 42.20.4 within the hard ≤500 KB/save canonical-state budget and established the mandatory validation constraints in P4-R32; this document still does not define the final Lua encoding or physical object references.

This document intentionally does **not** define a generic content-pack schema. It answers one question: what is the smallest practical model needed to implement Dead Air as currently authored?

## 1. Design result

Dead Air needs eight retained logical concepts:

1. `ThreadDefinition` — static wrapper for the one authored Narrative Thread.
2. `Asset` — static authored world content, including the six documents and the optional B-37 key.
3. `Identity` — static records for the three encountered identities.
4. `Organisation` — one static organisation whose displayed name can refine from generic to specific.
5. `Location` — two static story-location definitions plus later adapter bindings to exact curated PZ targets.
6. `Evidence` — persisted player encounters with authored assets or manually marked objects.
7. `JournalEntry` — persisted chronological event records whose prose is derived deterministically.
8. `ThreadState` — one persisted root containing only save-specific state.

`ThreadDefinition` is intentionally thin and static; it is retained because otherwise anchor/fallback and exact content membership have no single validation point.

Dead Air does **not** need:
- a standalone `Relationship` record/store in v0.1;
- a separate `WorldState` above `ThreadState`;
- a `Clue` entity;
- Fact entities;
- Theory entities;
- graph nodes/edges;
- runtime AI records;
- a map-wide location registry;
- content-pack manifests.

The longer-term architecture may still choose a central relationship store later. This v0.1 model does not pre-build it.

## 2. Static authored content vs canonical save state

The largest content in Dead Air is its document prose. None of that needs to be copied into the save.

### Static authored content — loaded from the mod
- complete document text;
- titles, dates, physical-form descriptions and preferred interactions;
- Identity labels/roles;
- Organisation generic/specific labels;
- Location labels and story requirements;
- Asset-to-entity references;
- authored contradiction/recontextualisation references;
- deterministic journal text/templates;
- anchor/fallback membership;
- major-discovery rule definitions.

### Save-specific canonical state — persisted
- which entry opportunity was used, if one has been committed;
- minimal per-Asset materialisation state required by T4;
- Evidence records actually created by discovery/Mark Interesting;
- confirmed story-location IDs;
- chronological JournalEntry event records.

Everything else should be reconstructed from the static Dead Air definition.

This follows the current architecture rule: if a value can be rebuilt without changing story truth, do not persist another copy.

## 3. Stable ID strategy

Authored IDs are deterministic strings:

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

Authored Evidence can also use deterministic IDs because each required authored Asset is intended to materialise/discover at most once:

```text
dead-air:evidence:service-ticket-93-0714
dead-air:evidence:property-record-4471
```

Player-created/manual Evidence uses a save-local generated suffix:

```text
dead-air:evidence:marked:0001
```

The exact runtime generator is an implementation detail. v0.1 only requires uniqueness inside one save/thread. Do not use a live Lua table, PZ object or Java object as identity.

Journal entries use append-order IDs:

```text
dead-air:journal:0001
dead-air:journal:0002
```

Because v0.1 never deletes/reorders canonical journal history, the next ordinal can be derived from the existing append-only sequence rather than persisting a second counter.

## 4. `ThreadDefinition` — retain, static only

### Purpose

Groups exactly the authored content that belongs to Dead Air and provides one validation point for the six-document count, three identities, one organisation, two locations, anchor and fallback.

### Required fields

| Field | Example | Persistence | Mutability |
|---|---|---|---|
| `threadId` | `dead-air:thread` | Static only | Immutable |
| `title` | `Dead Air` | Static only | Immutable for this content revision |
| `contentRevision` | `dead-air-r1` | Static; revision ID copied into `ThreadState` | Immutable |
| `documentAssetIds` | six D1–D6 IDs | Static only | Immutable |
| `optionalAssetIds` | `dead-air:asset:key-b37` | Static only | Immutable |
| `identityIds` | three Identity IDs | Static only | Immutable |
| `organisationId` | `dead-air:organisation:cumberland-signal-services` | Static only | Immutable |
| `locationIds` | two Location IDs | Static only | Immutable |
| `anchorAssetId` | D1 | Static only | Immutable |
| `fallbackAssetId` | D2 | Static only | Immutable |

### Optional fields

A small static `majorDiscoveryRules` list is justified because Dead Air has exactly three non-quest reward events:
- first of D1/D2 discovered;
- Relay Site 31 confirmed after being referenced;
- D5/D6 contradiction prerequisites satisfied.

The rule definitions remain authored data; only the resulting journal event is persisted.

## 5. `Asset` — retain, static only

### Purpose

Represents an authored world content definition. For Dead Air that is:
- six document Assets;
- one optional ordinary B-37 key Asset used to demonstrate Mark Interesting.

The key is an Asset because it is deliberately authored world content, but it is **not** a formal document clue and does not automatically become Evidence.

### Required fields for every Asset

| Field | Example | Persistence | Mutability |
|---|---|---|---|
| `assetId` | `dead-air:asset:service-ticket-93-0714` | Static only | Immutable |
| `threadId` | `dead-air:thread` | Static only | Immutable |
| `displayName` | `CSS Field Service Ticket 93-0714` | Static only | Immutable within revision |
| `assetKind` | `document` or `ordinary-object` | Static only | Immutable |
| `placementLocationId` | `dead-air:location:relay-office` | Static only | Immutable once exact content is approved |
| `references` | Identity/Organisation/Location IDs mentioned by the Asset | Static only | Immutable within revision |

`references` is a simple list of stable IDs. Its member types are already visible from the stable ID prefix; no runtime object references are needed.

### Optional Asset fields

| Field | Example / reason |
|---|---|
| `bodyText` | Full D1 text. Required for document Assets; absent for the key. |
| `approxDate` | `1993-07-01/02` for D1. |
| `physicalForm` | `three-part carbon service ticket`. |
| `interactionHint` | `Read`, `Inspect`, `Examine`, or `Open`; engine mapping deferred to T7/T10. |
| `entryRole` | `anchor` for D1, `fallback` for D2, absent otherwise. |
| `leadLocationIds` | D1 → police property; D2 → relay office. |
| `contradictsAssetIds` | D5 ↔ D6; optionally D5 → D2 where the paperwork conflicts. |
| `recontextualisesAssetIds` | D6 → `dead-air:asset:key-b37`. |
| `journalText` | Deterministic discovery text for the six documents. |
| `autoRecordEvidence` | `true` for D1–D6, `false` for B-37 key. |

### Why no separate Fact type

Dead Air does not need machine-addressable atomic facts in v0.1. The notebook/evidence list only needs:
- document text;
- deterministic journal summaries;
- simple authored references/contradictions.

A Fact entity would add normalization, IDs and persistence pressure without enabling a v0.1 feature.

## 6. `Identity` — retain, static only

### Purpose

Provides stable IDs for the three encountered identities so multiple documents can refer to the same encountered identity without string matching.

### Required fields

| Field | Dead Air example | Persistence | Mutability |
|---|---|---|---|
| `identityId` | `dead-air:identity:m-rourke` | Static only | Immutable |
| `displayLabel` | `M. Rourke` | Static only | Immutable within revision |
| `roleDescriptor` | `CSS field technician` | Static only | Immutable within revision |

Other examples:

```text
dead-air:identity:dana-pike
displayLabel = "Sgt. Dana Pike"
roleDescriptor = "police property/evidence supervisor"

dead-air:identity:h-vale
displayLabel = "H. Vale"
roleDescriptor = "approval / coordination identity; exact nature unresolved"
```

### What is persisted

No Identity object is copied into the save.

Whether an Identity has been encountered is **derived**:
1. inspect discovered authored Evidence;
2. resolve each Evidence's `assetId`;
3. union the static Asset `references`.

That is enough for v0.1. There is no Identity detail screen or graph requiring a second mutable knowledge record.

### Identity immutability

Do not rewrite `H. Vale` into a biological-person record later. If future content proves a same-person link, that is a later relationship concern. v0.1 preserves the encountered identity exactly as authored.

## 7. `Organisation` — retain, static only

### Purpose

Represents the one Organisation while allowing the player-facing label to refine from generic to specific.

### Required fields

| Field | Dead Air example | Persistence | Mutability |
|---|---|---|---|
| `organisationId` | `dead-air:organisation:cumberland-signal-services` | Static only | Immutable |
| `genericLabel` | `communications maintenance contractor` | Static only | Immutable within revision |
| `specificLabel` | `Cumberland Signal Services` | Static only | Immutable within revision |
| `specificNameRevealAssetIds` | D1, D3, D5 | Static only | Immutable within revision |

### Derived current label

If the player has only D2, the UI may use the generic description plus `C.S.S.` as encountered text. Once any `specificNameRevealAssetIds` Asset is discovered, the current display label can resolve to `Cumberland Signal Services`.

No mutable Organisation label needs to be persisted because the result is fully derivable from discovered Evidence.

Only CSS is a modeled `Organisation` in v0.1. Generic local police, unnamed state callers and the unknown customer are contextual institutions in the authored documents, not additional Organisation records.

## 8. `Location` — retain, static definition + derived confirmation state

### Purpose

Represents the two authored story places without creating a map-wide registry.

### Required fields

| Field | Relay example | Persistence | Mutability |
|---|---|---|---|
| `locationId` | `dead-air:location:relay-office` | Static ID; confirmation ID may appear in state | Immutable |
| `preArrivalLabel` | `Relay Site 31` | Static only | Immutable within revision |
| `confirmedLabel` | `Relay Site 31 service office` | Static only | Immutable within revision |
| `storyRequirement` | `hand-curated transmission/utility communications service location` | Static only | Immutable within revision |

Police example:

```text
locationId = "dead-air:location:police-property"
preArrivalLabel = "police property desk"
confirmedLabel = "police property / records area"
storyRequirement = "hand-curated vanilla police station with plausible property/records context"
```

### Exact PZ binding

An adapter-side binding to a real vanilla map target is required before implementation, but it is intentionally **not filled in here** because the development PC still has to select/verify the targets.

That future binding may contain coordinates/building/room/radius information depending on T8 and manual map inspection. It is static implementation configuration, not player save state.

### Persisted location state

`ThreadState.confirmedLocationIds` stores only IDs the player actually confirmed. Current display wording is derived from membership in that collection.

## 9. `Relationship` — do not retain as a standalone v0.1 type

Dead Air needs relationships, but it does not need relationship **records**.

The complete v0.1 relationship pressure is:
- document references Identity/Organisation/Location;
- D1 points toward police location;
- D2 points toward relay location;
- D5 conflicts with D6 and with D2's custody paperwork;
- D6 recontextualises the optional B-37 key.

Represent those as simple static ID arrays on `Asset`:

```text
references
leadLocationIds
contradictsAssetIds
recontextualisesAssetIds
```

Why this is smaller than a central table for Dead Air:
- only six required documents;
- no relationship graph in v0.1;
- no user-authored theory edges;
- no relationship creation/deletion during play;
- no need to persist authored links at all;
- contradiction/recontextualisation logic is fully deterministic from discovered Asset IDs.

If a second real content set or the v2 graph demonstrates that a central relationship store is materially simpler, introduce it then. Do not pre-pay that complexity in v0.1.

**Cross-thread-reference tripwire:** when a second authored thread exists, reconsider these per-Asset arrays if it introduces references to identities or organisations owned by another thread, shares assets across threads, or requires queries/updates that traverse multiple threads. That review trigger does not design or commit to a graph or standalone relationship store now.

## 10. `Evidence` — retain and persist

### Purpose

Records the player's encounter with an Asset/object in a specific discovery context. This is the core mutable save data.

### Required fields

| Field | Example | Persisted? | Immutable after creation? |
|---|---|---|---|
| `evidenceId` | `dead-air:evidence:property-record-4471` | Yes | Yes |
| `kind` | `authored-asset` or `marked-object` | Yes | Yes |
| `assetId` | `dead-air:asset:property-record-4471` | Yes when known | Yes |
| `discoveryOrdinal` | `4` | Yes | Yes |
| `contextText` | `Found in police property records.` | Yes | Yes |
| `playerMarkedInteresting` | `false` for D2; `true` for B-37 key | Yes | Treat as immutable creation intent in v0.1 |

### Optional fields

| Field | Why |
|---|---|
| `foundLocationId` | Store a stable story Location ID when the discovery occurs at one of the two known locations. |
| `physicalItemToken` | **Only if T5 proves a safe stable token.** String ID only; never a direct PZ/Lua/Java object reference. |
| `physicalAvailability` | Optional `available` / `unavailable` / `untracked` state if T5-supported tracking exists. This is mutable. |

### Authored document example

```text
evidenceId = "dead-air:evidence:service-ticket-93-0714"
kind = "authored-asset"
assetId = "dead-air:asset:service-ticket-93-0714"
discoveryOrdinal = 3
foundLocationId = "dead-air:location:relay-office"
contextText = "Found in the relay maintenance file."
playerMarkedInteresting = false
```

### Mark Interesting example

```text
evidenceId = "dead-air:evidence:marked:0001"
kind = "marked-object"
assetId = "dead-air:asset:key-b37"
discoveryOrdinal = 1
foundLocationId = "dead-air:location:police-property"
contextText = "Small key with red B-37 tag in the property drawer."
playerMarkedInteresting = true
physicalItemToken = absent unless T5 validates one
```

### Derived fields — do not persist

For any Evidence record, derive:
- display title;
- document body;
- entity references;
- provenance (`authored` vs `player-marked`) from kind/static data;
- contradiction/relevance links;
- current Organisation label;
- whether the B-37 key has gained authored significance.

Do not store a second copy of D1–D6 text inside Evidence.

## 11. `JournalEntry` — retain and persist, but not its prose

### Purpose

Preserves survivor chronology including discovery, Mark Interesting, later recontextualisation and location confirmation.

Evidence alone is not sufficient because a later update must appear at the point it happened, not be retroactively inserted beside the original discovery.

### Required fields

| Field | Example | Persisted? | Mutability |
|---|---|---|---|
| `entryId` | `dead-air:journal:0008` | Yes | Immutable |
| `ordinal` | `8` | Yes | Immutable |
| `kind` | `asset-discovered` | Yes | Immutable |
| `subjectId` | `dead-air:asset:access-memo-7c` | Yes | Immutable |

### Optional field

`relatedId` is used when one event connects two records:

```text
kind = "evidence-updated"
subjectId = "dead-air:evidence:marked:0001"
relatedId = "dead-air:asset:pike-shift-note-0705"
```

### Deterministic prose

For D1–D6, `subjectId` resolves to the static Asset `journalText`.

For other event kinds, a small fixed v0.1 renderer produces deterministic text from:
- event kind;
- static Asset/Location definitions;
- the immutable Evidence context.

The rendered prose itself is not persisted.

### Major discovery marker

Do not persist a separate `major=true` flag when the condition is derivable. The journal renderer can classify an event as major from static `majorDiscoveryRules` plus the known preceding entries.

There is no `caseComplete` or equivalent state.

## 12. `ThreadState` — retain as the single persisted root

### Purpose

Contains the complete canonical save state for the one built-in Narrative Thread.

v0.1 does not need a separate `WorldState` wrapper because:
- there is exactly one Narrative Thread;
- no content packs exist;
- no multiple-thread registry exists;
- no migration framework exists;
- multiplayer is disabled.

### Required logical fields

```text
schemaVersion
threadId
contentRevision
entryOpportunityUsed
assetMaterialisation
confirmedLocationIds
evidence
journal
```

Concrete example:

```text
schemaVersion = 1
threadId = "dead-air:thread"
contentRevision = "dead-air-r1"

entryOpportunityUsed = "anchor"

assetMaterialisation = {
  "dead-air:asset:service-ticket-93-0714" = "materialised",
  "dead-air:asset:property-record-4471" = "materialised",
  "dead-air:asset:invoice-9327" = "materialised",
  "dead-air:asset:rourke-notebook-0703" = "materialised",
  "dead-air:asset:access-memo-7c" = "materialised",
  "dead-air:asset:pike-shift-note-0705" = "materialised"
}

confirmedLocationIds = {
  "dead-air:location:police-property",
  "dead-air:location:relay-office"
}

evidence = { ... Evidence records ... }
journal = { ... JournalEntry records ... }
```

The braces above describe the **logical model**, not a T1-approved Lua serialization shape.

### Field mutability

| Field | Changes during play? |
|---|---|
| `schemaVersion` | No within v0.1; migrations are out of scope. |
| `threadId` | No. |
| `contentRevision` | No for a given initialized save; typo/content handling follows existing revision policy. |
| `entryOpportunityUsed` | `nil` → `anchor` or `fallback` once the T4-approved commit point is reached. Exact transition is T4-owned. |
| `assetMaterialisation` | Yes, through T4-defined states. Exact state names/commit sequence remain provisional until T4. |
| `confirmedLocationIds` | Append/add when T8-approved arrival logic confirms one of the two locations. |
| `evidence` | Append/add only for immutable discovery facts; optional physical availability may change if T5 supports it. |
| `journal` | Append-only. |

### What is deliberately absent

No:
- document prose;
- Identity copies;
- Organisation copies;
- Location geometry/registry;
- derived known-entity lists;
- relationship table;
- graph cache;
- theory state;
- AI output;
- final-truth flag;
- completed-case flag.

## 13. No separate `WorldState`

### Evaluation

A `WorldState` type adds one wrapper around one `ThreadState` and no v0.1 behavior.

### Decision

Do not retain it in v0.1.

The persistence adapter may need a namespaced ModData root for technical reasons, but that namespace/container is not a domain `WorldState` entity. If future versions support multiple built-in Narrative Threads or content packs, re-evaluate then.

## 14. Dead Air relationship examples

The model can answer every v0.1 relationship question without a central Relationship table.

### D1

```text
references = {
  "dead-air:identity:m-rourke",
  "dead-air:organisation:cumberland-signal-services",
  "dead-air:location:relay-office"
}
leadLocationIds = {
  "dead-air:location:police-property"
}
```

### D2

```text
references = {
  "dead-air:identity:dana-pike",
  "dead-air:organisation:cumberland-signal-services",
  "dead-air:location:relay-office",
  "dead-air:location:police-property"
}
leadLocationIds = {
  "dead-air:location:relay-office"
}
```

### D5

```text
references = {
  "dead-air:identity:h-vale",
  "dead-air:organisation:cumberland-signal-services",
  "dead-air:location:relay-office",
  "dead-air:location:police-property"
}
contradictsAssetIds = {
  "dead-air:asset:property-record-4471",
  "dead-air:asset:pike-shift-note-0705"
}
```

### D6

```text
references = {
  "dead-air:identity:dana-pike",
  "dead-air:identity:m-rourke",
  "dead-air:identity:h-vale",
  "dead-air:organisation:cumberland-signal-services",
  "dead-air:location:police-property"
}
contradictsAssetIds = {
  "dead-air:asset:access-memo-7c"
}
recontextualisesAssetIds = {
  "dead-air:asset:key-b37"
}
```

These are authored static arrays. Discovering D6 does not create a new edge record; it creates Evidence and a JournalEntry. The UI then derives the contradiction/recontextualisation from static content plus the set of discovered Asset IDs.

## 15. Complete-save record counts

A maximally explored Dead Air run is tiny.

### Static authored records — not save data

| Record | Count |
|---|---:|
| ThreadDefinition | 1 |
| Asset | 7 (6 documents + optional B-37 key) |
| Identity | 3 |
| Organisation | 1 |
| Location | 2 |
| Standalone Relationship | 0 |

### Canonical save records — approximate maximum for this slice

| Record/state | Approximate count |
|---|---:|
| ThreadState root | 1 |
| required Asset materialisation statuses | 6 |
| Evidence from six documents | 6 |
| optional marked B-37 Evidence | 0–1 |
| confirmed Location IDs | 0–2 |
| JournalEntry records | roughly 6–10, depending on entry path, key update, location confirmation and contradiction event |

There is no need for thousands of records in v0.1.

## 16. Serialized-size estimate — not a measurement of this model in Project Zomboid

T1 measured representative payloads rather than this exact logical model. Its live Build 42.20.4 result established the hard ≤500 KB/save canonical-state budget and the required P4-R32 validation rules.

For a rough scale check only, an illustrative JSON-shaped representation containing:
- six document Evidence records;
- one marked-key Evidence record;
- nine JournalEntry records;
- two confirmed Location IDs;
- six materialisation statuses;
- root metadata;

is approximately:
- **3.7 KB** in compact UTF-8 JSON;
- **4.7 KB** when pretty-printed.

JSON is not the PZ serializer. Using a deliberately pessimistic 4× representation overhead would still put this example around **15–20 KB**, far below the hard **≤500 KB/save** canonical-state budget.

This estimate does **not** validate:
- the eventual Lua encoding of this logical model;
- save/load timing;
- actual `global_mod_data.bin` delta;
- the encoded size of the implementation.

T1 and P4-R32 remain authoritative for allowed key/value shapes, cycle/alias/metatable rejection, maximum depth 64, staged replacement validation and the hard budget.

## 17. T1 persistence guardrails

The eventual persistence adapter must follow the completed T1 result and P4-R32:

- stable string IDs rather than direct object/table references;
- only string/number keys and string/number/boolean/plain-table values, with nil meaning absence;
- reject cycles and multiply referenced tables, or normalize/copy aliases so meaning cannot depend on reference identity;
- reject metatables, functions, userdata, threads and exposed Java objects;
- enforce maximum depth 64 and estimated serialized size ≤500 KB/save;
- stage and validate the full replacement before swapping the last known-good canonical root;
- derived indexes rebuilt from static content and canonical IDs.

T1 validated these persistence constraints on stable Build 42.20.4, revision `b0bbce05d5`, Steam build ID `24909800`. It did not select the final application encoding for this model.

## 18. Spike boundaries

### T1 — persistence
Complete. Validated vanilla Lua Global ModData within the hard ≤500 KB/save budget and established P4-R32. The persistence adapter still owns the final conforming Lua/ModData encoding.

### T3 — location categorisation
Does not gate the v0.1 story because locations are curated manually. It may affect later automatic discovery only.

### T4 — exact-once placement
Owns when/how `entryOpportunityUsed` and `assetMaterialisation` become durable and how interrupted placement reconciles. This document intentionally does not invent the commit sequence.

### T5 — physical item identity
Owns whether `physicalItemToken` is usable. Dead Air must still work with it absent.

### T7 — asset text/reader
Owns whether `bodyText` is presented through native PZ reading, static item text, ModData-backed custom reading or a hybrid.

### T8 — arrival detection
Owns how a PZ-facing adapter decides to add one of the two `confirmedLocationIds`.

### T10 — Inspect integration
Owns the cooperative context-menu mechanism for `Inspect` / `Mark Interesting`.

## 19. Asset interaction mapping

| Dead Air Asset | Content preference | Data-model representation | Engine mechanism |
|---|---|---|---|
| D1 service ticket | Read / Inspect | `Asset.bodyText` | T7/T10 pending |
| D2 property record | Examine / Read | `Asset.bodyText` | T7/T10 pending |
| D3 invoice | Examine | `Asset.bodyText` | T7/T10 pending |
| D4 notebook page | Read | `Asset.bodyText` | T7/T10 pending |
| D5 memo | Read | `Asset.bodyText` | T7/T10 pending |
| D6 shift note | Examine | `Asset.bodyText` | T7/T10 pending |
| B-37 key | Examine / Mark Interesting | ordinary-object Asset; no document body | T5/T7/T10 pending |

The model deliberately stores the authored content independently of the eventual reader implementation.

## 20. Content provenance

The Dead Air fixture is development-time AI-assisted. Under `docs/design/AI_PROVENANCE.md`:
- the text may be drafted/edited with AI during development;
- it requires human approval before canonical shipping;
- once approved, it is normal authored in-fiction content;
- no runtime AI field, provider, prompt, response or credential belongs in this v0.1 model.

## 21. Self-review

### Story pressure
- Six document Assets represented: yes.
- Three Identities represented without auto-merging: yes.
- One Organisation represented with generic→specific label refinement: yes.
- Two curated Locations represented without a map registry: yes.
- Anchor/fallback represented: yes.
- B-37 Mark Interesting example represented without becoming a seventh required document clue: yes.
- Contradiction preserved without a truth resolver: yes.

### Minimality
- Standalone Relationship type removed from v0.1: yes.
- Separate WorldState removed: yes.
- No Fact/Theory/Graph/content-pack model: yes.
- Static prose/entities stay outside save state: yes.
- Journal text is derived rather than duplicated: yes.
- Organisation/Identity discovery state is derived from discovered Asset IDs: yes.

### Persistence awareness
- No direct Lua/PZ/Java object reference required: yes.
- Canonical logical state is tiny by estimate relative to the hard 500 KB/save budget: yes; the implementation must still measure its encoded state.
- Completed T1 constraints are incorporated; T4/T5/T7/T8/T10 assumptions remain labeled unverified/deferred: yes.
