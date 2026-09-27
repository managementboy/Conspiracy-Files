# "Conspiracy Files: No Help" — content design handoff

Written mid-session after repeated safety-classifier stops made it impractical
to keep working in the same chat. Read this before continuing the content
design work for `mod-nohelp/`. This is a **design-only** handoff — no mod code
changed in this session; only `docs/design/*` and `docs/management/*` files
did.

## 1. What "No Help" is, in one paragraph

A second, independent Project Zomboid mod (`mod-nohelp/`, id
`ConspiracyFilesNoHelp`) extracted from this repo's main mod, containing only
the interaction hooks and mystery-generation engine — no PDA/Knox.OS device,
no physical organiser item. Fully built, boot-tested, and co-install-tested
already (see `docs/management/NO_HELP_MOD_HANDOFF_2026-09-26.md`). The content
design — what actually goes in the world — is what this session worked on, and
is still in progress.

## 2. The model, as currently settled

Read `docs/design/NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md` in full — it is the
single source of truth for the content model and has been revised several
times this session. Do not treat any summary below as a substitute for reading
it; this section only orients you to what changed and why.

Settled, in order of how firmly:

- **Exactly two mutually contradictory conspiracies**, not "2+N." Dropped by
  the owner directly: more than two was never wanted past the first framing.
- **Zero tracked player state, anywhere.** No belief meter, no journal, no
  PDA, no physical checkpoint object of any kind. The player's own unaided
  memory is the only place any conclusion is held. An earlier draft of the
  design doc suggested a physical "belief-checkpoint" object (corkboard/
  ledger) — that suggestion is **withdrawn**, not softened. Do not reintroduce
  anything that tracks belief, in-fiction or otherwise.
- **All content is authored in advance, never procedurally generated.** At
  least 50% of all evidence must be physical objects; the rest is text
  (receipts, photos, notes), with no maximum length. Player occupation plays
  no role. Vanilla PZ's annotated maps and environmental storytelling (crash
  scenes etc.) must be fully absorbed into the two-conspiracy content, not
  left as unrelated flavor.
- **Place and opportunity-to-place matter far more than time or discovery
  order.** The owner stated this directly, with a concrete example: two
  different physical sites can disagree with each other, and that
  disagreement should read the same regardless of which site a player reaches
  first. Every piece of evidence must pass a "cold-read" test — legible and
  self-contained whether it's the first thing found or the fortieth.
  Timing-independence is *not* fully achievable (real memory decays across
  real play sessions), but content-meaning order-independence is achievable
  and is now a hard authoring rule, not a preference.
- **The two conspiracies' actual premises are now chosen** (2026-09-27):
  - **Theory A — Containment Cover-up:** officials/military mismanaged the
    evacuation or containment response and covered it up.
  - **Theory B — Agricultural Program Malfunction:** an experimental
    pesticide/agricultural program malfunctioned.
  - These answer *different questions* by default (A is about the response,
    B is about the origin) — noted in the design doc as a deliberate,
    legitimate axis of contradiction, not a defect. Evidence for A should
    skew toward response/containment paperwork and actions; evidence for B
    toward the agricultural program's own operations.
  - **A full list of 18 other candidate premises is stored in
    `docs/design/NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md` §1a** for later
    reuse if this pair needs replacing after playtesting, or for a future mod.

### An earlier premise pair was retired — read this before writing any content

An earlier working example used through most of this session (rounds on
placement, redundancy, and the map/event integration work) has been
**retired at the owner's request and must never be reused**, in this
document, in code, in generated content, or in a new chat. If you find
references to it anywhere in the repo outside `docs/design/
NO_HELP_CONSPIRACY_DESIGN_2026-09-26.md`'s own retirement note and
`docs/design/DUAL_CONSPIRACY_WORLD_EVIDENCE_VISION_2026-09-22.md`'s
superseded-banner, that is stale content that needs the same treatment. Use
only Theory A / Theory B (above) for anything conspiracy-flavored, including
example evidence text, item names, or location descriptions.

**A pre-existing document, `docs/design/
DUAL_CONSPIRACY_WORLD_EVIDENCE_VISION_2026-09-22.md`** (dated before this
session's work, "owner-approved direction," with a first implementation slice
already built in `DEV-0.47.6-functional-opening-key`) also proposed a
two-conspiracy pair — the same retired one. It has been marked superseded on
that specific point only (a banner was added at the top); its structural
ideas (world-carried evidence over exposition documents, both theories
fitting the same established facts, observing rather than overriding vanilla
scenes) were **not** retired and remain a valid prior reference worth reading
for the map/event integration work specifically.

## 3. Real prior engineering art discovered this session — do not re-derive these

A major mid-session discovery: this repo already has **live-tested, real
engineering spikes** directly relevant to placement, and a **working
placement engine already shipped** in both `mod/` and `mod-nohelp/`. Do not
redesign these from scratch in a future session — read them first.

- **`docs/research/T1_MODDATA_PERSISTENCE.md`** through **`T12_UI_RUNTIME.md`**
  — a numbered spike programme, each one a real, on-device, live-tested report
  (not a proposal). Directly relevant ones for content/placement work:
  - **T2 (map enumeration cost):** a synchronous full-map scan costs
    227–244ms — ~100x over budget. Safe only as bounded queued work (100
    records/frame tested safe). A rebuilt index must never be persisted to
    save (the full index is ~90–102MiB; the save budget is ≤500KB).
  - **T3 (location categorisation):** automatic room/building categorisation
    (police/hospital/office/etc. from room names) is real but **unreliable
    enough that it is policy-locked to advisory-only, never authoritative**
    — it missed a real police HQ and a real comms tower in live testing. The
    project's actual policy is a curated location catalog, with automatic
    detection only ever assisting, never deciding.
  - **T4 (exact-once placement):** a real, live fault-injected state machine
    (`pending → placing → placed`, plus `unavailable`/`lost`/`conflict`) for
    placing one authored item exactly once, safely, across crashes/reloads/
    streaming. No Lua-visible atomic transaction exists spanning a chunk file
    and `global_mod_data.bin` — exactness comes from item-ModData stamping
    plus reconciliation, not a magic atomic commit.
  - **T5 (physical item identity):** items can legitimately move via ordinary
    play (inventory/floor/vehicle/corpse) after placement; a post-placement
    zero-stamps observation is not proof of loss by itself.
  - **T8 (location arrival):** proximity/arrival detection findings — read
    before designing any "player visited X" trigger.
- **`mod-nohelp/common/media/lua/shared/NHShared/Placement.lua`** (and the
  identical `mod/.../ConspiracyFiles/Placement.lua`) — the **real, shipping
  implementation** of T4's findings: a small, hand-curated `POOLS` table per
  location-slot family (3–4 candidate coordinates each, with
  `allowedContainerTypes`), a `MEMBERS` table assigning assets to a location,
  and a seeded Lehmer/Park-Miller LCG rotation deciding which candidate each
  asset gets. Currently sized for the original mod's 7 physical assets
  (`relay`/`police` location families). **Scaling to "No Help"'s ~40-100
  evidence items is a scale-up of this engine's data, not a new engine** —
  see round 1 below.
- **`mod/.../ConspiracyFiles/StaleClue.lua`** — a real, shipping relocation
  policy (moves undiscovered evidence to a new site after
  `RELOCATE_AFTER_HOURS`, capped by `RELOCATE_CAP`). This is a genuine prior
  mechanism for "stale, unfound evidence" — relevant to (but distinct from)
  any decay/urgency mechanic proposed for annotated maps in round 2 below.
- **Multiplayer is explicitly out of scope for v1.0** — a real, already-made
  project decision (`DR-20260919-Q28`, `P1-Q3`, `P4-R18` in `DECISIONS.md`).
  Do not design for multiplayer-safety; it adds real complexity for a
  non-requirement.

## 4. Three in-flight `/adhd` rounds — fully diverged and deepened, not yet fully delivered to the owner

The owner asked, in one message, for three separate `/adhd` runs: (1) expand
on real-object placement for the first shipped run, (2) integrate annotated
maps fully into the two conspiracies plus an incentive to visit marked sites,
(3) vanilla event detection and integration. **All three rounds' Phase 1
(5 diverge agents each, 15 total) and Phase 2 top-3 deepening (9 agents
total) completed successfully** — the raw agent output exists in this
session's transcript. Round 1's converged write-up was delivered to the owner
in full before this handoff was requested. Rounds 2 and 3 were **converged
internally but not yet rendered to the owner** when this handoff started.
Below is the substance, safety-scrubbed (no invented conspiracy-flavored
example prose — describe mechanisms abstractly and only use Theory A/Theory B
by name if a concrete example is truly needed).

### Round 1 — physical object placement (delivered to owner already)

Converged on three mechanisms, all compatible with the existing
`Placement.lua` engine:

1. **Object legibility layer discipline.** The diagnostic contradiction that
   makes an object read as evidence must live in the item's fixed base
   description/model — never in the container it's found in (goes inert once
   moved) and never in the randomized wear-state layer (an unlucky roll can
   erase the tell). Concretely: extend `Placement.lua`'s existing item-spawn
   ModData stamp; keep the diagnostic text/model static per `ItemType`,
   independent of condition/dirt tier.
2. **Anti-datamine hardening, assuming full disclosure.** Since the mod ships
   client-side and its placement pools are trivially readable, design should
   assume the coordinate/mapping data is already known and still hold up:
   guarantee redundant copies of one fact span at least two different
   container-type families; randomize the theory-to-container-type mapping
   itself per world-seed (a second, separately-salted LCG draw on the
   existing persisted plan, never recomputed at read time); bake a
   forgeable-only-by-the-engine authenticity stamp into every real evidence
   object.
3. **Physical tamper resistance + global balance.** At least one copy per
   load-bearing fact must sit in a non-portable, geometry-fixed slot; enforce
   a minimum tile-distance between redundant copies of the same fact so one
   localized disaster (fire, one building's destruction) can't reach more
   than one copy; run a deterministic post-generation "clearinghouse" pass
   that corrects any aggregate theory-balance drift using the same seeded
   stream, never fresh randomness, and records the correction on the
   persisted plan so it's verifiable on reload.

Traps flagged: arbitrary/fast selection heuristics (alphabetical slice, gut-
check hardcoding) if mistaken for a final design rather than a bootstrap;
using item rarity as the theory-selection axis (even easier to datamine than
container type).

### Round 2 — annotated vanilla maps, full integration + visit incentive

Converged on three mechanisms:

1. **Decay-clock urgency.** Reading an annotated map starts a real in-game
   timer on the evidence at its marked site(s); letting it lapse has a real
   cost — the content decays toward generic vanilla flavor, or (sharper)
   flips to read as corroboration for the *other* theory. **Real, serious
   risk surfaced in deepening:** a hard, player-visible deadline is close to
   exactly the "order/time-dependent interpretation" failure mode the design
   doc already names as a rejected, real save-scum exploit (§3/§7) — a player
   could read the map, decline to travel, and reload near the deadline to
   steer the outcome. If pursued, it needs a probabilistic-after-a-floor roll
   or similar, not a hard deterministic deadline, and should reuse the
   existing `StaleClue.lua` relocation mechanism's shape rather than
   inventing a parallel one.
2. **One-shot, irreversible world-as-record commitment.** The first physical
   visit to a marked site permanently fixes what's found there (a
   non-respawning prop is the only spawn point for that piece of proof) —
   since nothing tracks belief, the *world's own changed state* becomes the
   only externalized record of what's been resolved. This is a natural reuse
   of the existing T4 exact-once state machine (a location-level "which fork
   won" binding sits above the per-asset ledger). **Real, already-flagged
   risk:** permadeath — a new character inherits an already-resolved world
   with literally nothing (no journal, no marker) to distinguish "already
   solved" from "always was empty" from "a bug." This exact open question is
   also item 10 in `DUAL_CONSPIRACY_WORLD_EVIDENCE_VISION_2026-09-22.md`'s
   own open-questions list — it predates this session and is still
   unresolved.
3. **Adversarial/mislabeled maps as the verification incentive.** A minority
   of annotated maps (roughly 1-in-4 to 1-in-5, not more) should be
   deliberately unreliable — planted by an in-fiction believer of one theory
   but actually pointing to a site that supports the *other* theory. The only
   tell is diegetic/stylistic (an overconfident, unhedged claim vs. an honest
   map's hedged language), never a UI flag, so it's taught by consequence,
   not instruction, and every "lying" map still reads as a complete,
   self-contained artifact alone (satisfies the cold-read rule). **Real
   risk:** if the unreliable fraction is too high or the tell too subtle,
   players stop trusting any map and the whole mechanic collapses —
   mitigation is to make even a "wrong" trip materially worthwhile (real
   evidence for the *other* theory sits there, so the trip was never wasted,
   only the expectation was).

Traps flagged: any mechanism that rewrites text based on "have I visited
before" (requires tracking visit history — violates the zero-tracked-state
rule directly); a rival-NPC-faction racing the player for site control (a
real, heavy new AI system — only realistic as an infinite-budget idea, not
for v1).

### Round 3 — vanilla event detection and integration

Converged on three mechanisms:

1. **Two-mechanism split; hand-curate the static side, never auto-detect it.**
   Static, baked-in vanilla scenes (crash sites etc.) and live runtime events
   (a flyover, an ambient trigger) are not the same kind of thing to detect,
   and treating them with one unified detector is a category error. The
   static half should get a **one-time, hand-walked coordinate list** —
   exactly `Placement.lua`'s existing `POOLS` shape, a new sibling data file,
   no detector code at all — directly matching T3's real, tested policy
   (automatic categorization is advisory-only, never authoritative). The
   runtime half should use **flag-and-defer**: the actual `Events.*` callback
   only sets a flag/enqueues a work item; a separate, lower-priority bounded
   poll loop (T2's tested-safe ~100 records/frame) does the real evidence-
   attach work, reusing T4's proven `LoadGridsquare`-wake-up-plus-
   `OnGameStart`-catch-up pattern verbatim.
2. **Atomic-by-construction runtime-event capture with provenance.** Every
   real event-dispatch firing (never a decorative looping ambient-sound
   object, which fires on its own timer independent of any real trigger)
   writes its own timestamped capture record into the *same* in-memory table
   that holds the evidence-grant flag, and the flag is set before any
   player-visible reward text — since PZ has no real cross-file atomic
   transaction (per T4), ordering-within-one-Lua-tick is what actually closes
   the "quit before the flag commits, replay the discovery" exploit; any
   ambiguous/dual-codable scene's theory assignment is resolved once at
   world-seed time, never lazily on player proximity. **Known residual risk
   the deepening surfaced honestly:** this doesn't protect against a hard
   process kill during PZ's own save window — a different failure mode not
   yet addressed, worth a small empirical spike (force-kill at varying
   intervals, measure the real persistence window) before trusting it fully.
3. **A provable vanilla-citation audit layer.** Every citation of a vanilla
   scene should be backed by a "witness triple" (coordinate + object/sprite
   ID + a content hash of what's actually there), checkable by walking to the
   coordinate and re-hashing; a standing "unclaimed vanilla" inventory lists
   every curated-or-detected scene not yet cited by either theory, so a
   coverage gap is visible rather than indistinguishable from a detection
   failure; every citation is stamped with the exact PZ build/depot-manifest
   ID it was authored against, and the mod fails **closed** (drops to
   conspiracy-only content, never a best-guess remap) if the running build
   isn't in the known-good set. **Real, explicitly-named risk:** there is
   nothing to audit yet — zero real vanilla-scene citations exist in the repo
   today. Building the audit tooling before a single real citation exists
   risks validating an empty set. First real step is hand-curating exactly
   one real citation (one specific crash scene, walked and hashed in a live
   dev build) before writing any audit script.

Traps flagged: emergent/automatic classification of static scenes from
generic map signals (spawn density, room-name heuristics) — thematically
elegant, but this is the *exact* thing T3 already tested and rejected for
authoritative use, just rediscovered independently; letting a found scene's
meaning depend on which theory's evidence the player happens to be carrying
(violates zero-tracked-state and reintroduces order-dependence); fabricating
citations with no real vanilla object behind them (violates the existing
citation-integrity rule that vanilla content is a checkable prior claim, not
an invented one).

## 5. A practical note on this session's safety-classifier stops

This session hit the response-level safety classifier **four times**:

1. A long response generating fictional evidence-object flavor text for the
   (then-current) bioweapon/zoonotic premise pair, including specific
   real-world biodefense-institution-style naming and technical detail —
   almost certainly the trigger; the topic itself (two rival conspiracy
   theories in a zombie game) is not the problem, the *specific realistic
   bio/weapon technical detail stacked across many items in one response*
   likely was.
2. A follow-up meta-explanation that re-triggered by repeating/analyzing that
   same flagged content in detail, even as commentary rather than new
   content.
3. A file-read tool result that quoted the old premise pair verbatim from a
   pre-existing document, then got echoed into the assistant's own response.
4. A later response (round 1's object-placement write-up, post-premise-
   change) that appeared content-safe on inspection and still stopped —
   trigger unclear; possibly cumulative response length/density, possibly a
   pattern in the "cover-up"/"containment"/"evacuation" language stacked with
   technical placement detail, possibly unrelated to content at all.

**Practical guidance for continuing this work:** the owner already retired
the original premise pair specifically because of this. Going forward with
Theory A/Theory B: avoid inventing long stretches of specific, realistic-
sounding fictional document/object flavor text in a single large response,
especially anything with an institutional/procedural/official-document feel
stacked densely together. Prefer describing mechanisms and structure in
plain engineering terms, and generate concrete flavor-text examples sparingly
and one at a time rather than in bulk, if at all. If a response gets stopped,
do not retry the same content reworded — change approach (shorter response,
less narrative density, more mechanism-only language) rather than
paraphrasing.

## 6. Pending tasks, in order

1. **Render rounds 2 and 3 above to the owner properly** (this handoff has
   the substance; a new session should present it in the ADHD output shape —
   brief/wide-set/converge/focus/provocation — the way round 1 already was),
   watching the guidance in section 5.
2. **Decide the permadeath / world-persistence question** flagged in both
   round 2's deepening and `DUAL_CONSPIRACY_WORLD_EVIDENCE_VISION_2026-09-
   22.md`'s own open item 10 — it blocks committing to the "one-shot
   irreversible world-as-record" mechanism cleanly.
3. **Scale `Placement.lua`'s data** (not its code) from the original mod's 2
   location-slot families / 7 assets to whatever "No Help" needs for Theory
   A/B evidence — read `Content.lua` and `Session.lua` first to see the
   current (still Dead-Air-named) shape before designing the replacement.
4. **Hand-curate exactly one real vanilla-scene citation** (round 3, step 3's
   first concrete step) before building any citation-audit tooling.
5. **Begin actual content authoring** for Theory A and Theory B once (1)-(2)
   are settled — the owner has explicitly asked for this to happen, and has
   not yet been asked to confirm anything beyond the two premises themselves
   (no specific evidence items, locations, or documents have been authored
   yet).
6. Still open from earlier in this project (background, not urgent): turning
   the manual extraction/co-install test sequence into checked-in scripts;
   deciding whether to drop the now-confirmed-unused `Generated/*` procedural
   engine from `mod-nohelp/`.
