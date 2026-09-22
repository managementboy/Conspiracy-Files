## DR-20260922-UNKNOWN-CLUE-KEEPS-THE-CASE-OPEN — owner, 2026-09-22

**An interrupted placement leaves its clue at `unknown`, and the case stays
OPEN.** It does not complete with a gap, and the mod does not replace the clue
(`GeneratedRuntime`: *"Interrupted placement is uncertain; no automatic
replacement"*).

Asked directly after the campaign gate wedged on exactly this
(`evidence/linux-autotest/20260921T202027-campaign.txt`, source `2324499`): one
clue of case 1 was parked at `unknown`, `Session.completion` requires every
document to be either known or `dropped`, so the case could never finish. The
alternative put to the owner was to count such a clue as a gap so the case
would reach `complete-with-gaps`. **The owner chose to keep it open.**

Consequences, recorded so nobody re-derives them:

- `Session.completion` is unchanged. A case with an `unknown` clue is
  `unfinished`, permanently, and that is intended.
- A campaign in such a world cannot progress past that case, because the
  closing questions, the answers, the steer and the archive all need a
  finished case.
- **The campaign gate therefore treats it as NOT EXERCISED, not as a failure**,
  and stops with `COULD NOT RUN` rather than failing every stage behind it. The
  2026-09-21 run reported 27 product failures for this one owner-sanctioned
  state; `test/campaign_harness.lua` now prevents that.
- A re-run draws a fresh world, the same remedy already used for a case 1 with
  no document in the relay memo's week.

Open, and not decided here: how often an interrupted placement happens in
ordinary play, and what interrupts it. Neither is established.

# Conspiracy-Files — Current Decision Index

## DR-20260920-WRITING-PLACEMENT — incorporate the placement review

Owner relayed the placement findings while the writing rebuild was in progress:
the six furniture kinds were not an authored difficulty decision, discovery uses
Investigate Area/foraging, and retaining the first eight containers biases the
result toward kitchens. The referenced `CLUE_PLACEMENT_VARIETY.md` arrived on
remote main at `087a1fb` and was merged locally as `10154ba`. Its census is
reported game evidence; this implementation pass has not repeated that run.

Carry the agreed first step into the full rebuild: eligible non-floor containers,
with bounded selection that preserves different container kinds instead of
filling all slots with the first repeated kind. Keep placement descriptions tied
to the actual hiding place. Current source inspection confirms both the six-kind
filter and the early eight-candidate cutoff. The subsequent implementation
replaces them with eight observed kinds, up to eight targets per kind, and
seeded selection between equally suitable kinds; game verification is pending.
Account for movable/dismantled containers without asserting that unseen evidence
is lost, and preserve loot parity without creating better loot or prioritising
valuable contents. Do not treat the note's proposed loot-tier exclusion as an
already chosen rule. Floor placement, static environmental clues, empty stashes,
rarity weighting and above-eye-level discovery remain parked ideas, not approved
implementation requirements. Complete implementation before Claude's test/build
handoff still governs the sequence.

## DR-20260920-WRITING-MAIN — integrate now that Claude has stopped

Owner: “claude stopped working. you can integrate your work into main now”.
This supersedes the separate-branch-only working restriction below. Fetched
Claude's map branch through `ba917eb`, fast-forwarded local main to include it,
and merged writing checkpoint `d4a0ff4` as `2137cac`. Continue development in
the main checkout. Existing independent worktrees and uncommitted worker work
are preserved. This is an unfinished implementation merge, not a tested build
or Workshop release; Claude still owns testing after full implementation.

## DR-20260920-WRITING-GROUNDING-TONE — actual businesses; sustained dark comedy

Owner feedback on the fresh-game example: the mysteries show little meaningful
involvement of named businesses or lore, and the writing is not funny despite
the agreed direction. This reinforces **DR-20260919-Q24**, which selected
fatalistic, bureaucratic dark comedy throughout; the alternative of occasional
humour was not adopted. Both requirements apply throughout the current rebuild.

Use verified vanilla entities for relevant activities, with the mod's invented
events identified as authored fiction in development documentation. Do not
turn a randomly selected house into a canonical business or invent involvement
by a named lore figure just to mention them. Comic consequences should arise
from the event, the institution's priorities and the survivor's personal stake.
Neither generic suspicious paperwork nor a witty final sentence is sufficient.

The isolated writing implementation remains incomplete and untested. This
decision is an authoring requirement, not owner approval of the new passages.

## DR-20260920-WRITING-REBUILD — events, evidence and personal voice

Owner goal after reviewing a fresh game's collection slip, tagged key and
payment slip: audit the entire writing system before editing passages; give
every mystery an underlying event; make evidence reveal different parts;
separate documentary and survivor voices; generate variations within coherent
scenarios; establish one complete example and apply the standard everywhere.

This supersedes older authoring guidance that forbids all local conclusions,
requires every ordinary explanation to have a sinister twin, or treats linked
reference numbers and mismatching records as sufficient story. It does not
authorise a definitive explanation of Knox, invented survivor memories or
turning player interpretations into immutable facts.

The owner explicitly requires avoiding collisions with Claude's ongoing fixes
and builds. Implementation uses the separate `codex/mystery-writing` branch and
worktree, based on current map development commit `a65ce46`. Claude's branch,
working files, release tags and test execution remain independent. Reconcile
new fixes before handing over the completed rewrite. No new build is requested
at this audit checkpoint.

The source audit and full reference example live in
`docs/design/WRITING_SYSTEM_AUDIT_2026-09-20.md` and
`docs/design/WRITING_REFERENCE_PERSONAL_COLLECTION_2026-09-20.md`. The example
is an implementation reference under the owner's direction, not a claimed
owner playtest approval or existing published story. The full goal remains
incomplete until the standard is implemented throughout and verified.

## DR-20260920-FULL-IMPLEMENTATION — one development handoff; plain storage

Owner instructions in the development conversation, 20 September 2026:

- Complete the map-media implementation before asking Claude to build or test.
  Claude owns all test execution, native verification and builds. This supersedes
  the intermediate build-checkpoint sequence below; no unverified release.
- Fresh saves are the baseline. No compatibility/migration work and no protective
  opt-in feature switch. Map-media activates automatically in single-player.
- Use straightforward plain-table storage. The unfinished compression rewrite
  has been removed. Preserve evidence, source wording and discovery chronology.
- The recommendation accepted with this direction uses 1,000,000 estimated bytes
  as a **provisional development allowance**, pending Claude's real-data 600 kB,
  800 kB and 1 MB measurements. This supersedes the 500,000-byte development
  constraint in P4-R17, not the staged structural validation in P4-R32.

The engine limit was never shown to be 500 kB. T1 measured 4,432,276 file bytes
at 512 ms synchronous save and 1,012 ms probe validation; two-second responsiveness
sampling cannot establish absence of short frame stalls. Estimator bytes differ
from actual file bytes. See `docs/research/T1_MODDATA_PERSISTENCE.md` and upstream
commit `266093c`, `docs/design/WHY_500KB_2026-09-20.md`. No higher production
performance limit is claimed as verified.

Implementation policy: three logical fragment records may be offered again on a
later journey if missed, without moving/deleting old copies. Unknown insertion
blocks a new offer. There is no three-missed-opportunities exhaustion or maximum
number of concurrent map designs. A placed destination record is never replaced
because its carrier/item disappeared. Refused insertion may try another eligible
carrier; all unavailable candidates leave the record unplaced. These are explicit
implementation choices retaining the owner's full-coverage and duplicate-copy
direction, not claims that arbitrary destruction is recoverable.

Review/build entry point: `docs/management/MAP_MEDIA_FULL_HANDOFF_2026-09-20.md`.

## DR-20260920-DEVELOPMENT-OWNERSHIP — Codex develops; Claude tests and builds

Owner instruction, 20 September 2026: Codex implements the map-media work; Claude
owns test execution and game builds. Codex hands over bounded build checkpoints
with exact branch, commands, expected evidence and limitations. Do not treat
unexecuted fixtures or source inspection as passing checks. Development commits
on the handoff branch are explicitly pending Claude verification; this does not
authorise publishing an unverified build or promoting it to main.

The first checkpoint is the Phase 0 diagnostic observer, not a playable trail.
Full coverage, storage and native-engine gates remain as recorded below. The
finite-following and destruction-policy proposals have not become owner rulings
merely because development responsibility changed.

## DR-20260920-MAP-PLAN — the plan is accepted for feasibility and a gated pilot, 2026-09-20

`docs/design/MAP_MECHANISM_PLAN_2026-09-20.md` **revision 4 is the final plan**
for feasibility work and a gated pilot. No further broad rewrite. A few targeted
corrections remain outstanding.

**What this authorises:** Phase 0 (read-hook verification in a running game) and
the Gate A placement diagnostics, plus the hook-independent work — extending the
budget fixture and the authored pilot content.

**What it does not authorise.** Full rollout depends on two things that are not
settled: a **storage model** that can meet the coverage requirement (the measured
budget funds nine to fifteen destinations of 125, and compressing what exists
buys about twenty more - `P4-R144`), and **engine verification** that the read
hook exists, names the actual annotated design, and that vanilla stash
preparation survives our insertion. Either can send the plan back.

**Still the owner's** (§14.1): full coverage remains the **objective**, and the
storage gap is an implementation constraint to solve, not permission to ration.
Shrinking how the campaign store is *represented* is engineering; retaining fewer
cases or dropping evidence is the product tradeoff, and only that is the owner's.
Not decided here.

**Explicitly NOT owner-approved.** Two narrower readings are carried in the plan
as **pilot proposals**, and neither is recorded as a ruling:

- **the finite following promise** — three local opportunities that may all be
  missed, after which nothing further is placed. This is not a demonstration that
  the original "the trail follows the player" requirement survived. If continued
  following is required after all opportunities are missed, re-offering becomes
  necessary work rather than optional polish.
- **the pilot payoff contract** — no time-based expiry, authored carriers only,
  `PENDING` when none is available, and ordinary world destruction applies after
  successful placement. Revision 3's "evidence is waiting whenever you arrive, no
  failure state" was a stronger promise than the design keeps.

Measured alongside this (`test/map_feature_budget.lua`): the **bounded pilot
fits** — two designs sharing one destination, dearest payoff, fragments retained
as full discoveries, 4,846 bytes of the 7,826 available. The pilot being
affordable is not evidence the catalogue is.

## P4-R144 — the map feature has 7,826 bytes, not 88,460, 2026-09-20

Measured by `test/map_feature_budget.lua`, which builds the worst-case 16-case
save from a thousand real seeds rather than deriving a figure by subtraction.

    campaign 339,764 + ordinary ledger 61,843 (112 events) + reserved 73,000
      = 474,607 of 500,000
    less the 17,567-byte reserve test/case_archive.lua asserts
      = 7,826 spendable

**Two plan revisions got this wrong in the same way**: both subtracted from a
budget the campaign store had already been measured against, so both
double-counted the ordinary ledger, and both ignored the reserve. Revision 1
said 487 events "fit, barely"; revision 2 said 162 affordable with 50 spare.
The register records the measurement so the next revision cannot re-derive it.

**What it settles.** Per-event cost is a property of the reference text, not of
the ledger: 903 bytes for a prose ref, 553 for a case document, 411 short, 225
coded with no place. Trail state costs 206 bytes a trail, entry state 68 a
destination. **Nine to fifteen destinations are fundable** — not 125. Making
local fragments free does not rescue it: the cheapest representation measured
is still over by 54,447, because the binding cost is one ledger event per
destination times the catalogue.

**What it does not settle.** Which destinations get funded, and whether to buy
more by shrinking the campaign store or spending the reserve, is the owner's
(MAP_MECHANISM_ANSWERS_2026-09-20.md §7).

## DR-20260920-BULK-PREMISES — the premise count is not a ceiling, 2026-09-20

**The twenty premises are an authoring artefact, not a technical limit**, and
under DR-20260920-NO-CONCLUSION the limit is actively harmful. Bulk premise
authoring is the strategy that decision requires: with no conclusion to arrive
at, the only thing sustaining a long save is that the next document says
something the player has not read.

**Why the number is twenty.** It is roughly where a person's patience for
inventing distinct paperwork stories runs out. `PREMISES.md` records them as
AI-drafted, shipping without a separate approval step (P4-R97). Twenty is one
drafting session, not a design decision — and it was never chosen as a cap.

### Why it is counterproductive

- **It attacks variety, which is now the product.** Twenty premises by two
  readings is forty case shapes. A sixteen-case save burns roughly forty per
  cent of the whole space, and a second playthrough repeats heavily. "Every
  playthrough has to be different" is structurally impossible at twenty.
- **It caps the contradiction space, which grows quadratically.** Contradiction
  is pairwise (DR-20260920-NO-CONCLUSION). Twenty premises offer few interesting
  disagreements; two hundred offer orders of magnitude more. The texture the mod
  exists to produce is limited by the count more than by anything else.
- **It strangles DR-20260920-Q33.** One hundred and twenty-five destinations
  drawing tie-ins from twenty stories means six destinations per story — exactly
  the rhyming the owner dissolved with "use bulk", reintroduced through the
  premise count.

### The costs, in proportion

Measured, and stated in proportion because the assistant previously
over-dramatised both. **Neither is a constraint.**

| | now (22 premises) | at 200 | at 500 |
|---|---|---|---|
| `Premises.lua` | 68 kB | ~620 kB | ~1.5 MB |
| consistency test | 8 s | ~70 s | ~3 min |

For scale: **the whole mod is 4.3 MB** and the published build 4.2 MB. The
largest single file already shipped is `ObjectCatalogue.lua` at **579 kB**, with
`AddressBook.lua` at 362 kB behind it — so two hundred premises is the size of a
file we ship today, and five hundred takes a 4.3 MB mod to 5.8 MB. **These are
kilobytes, not megabytes.**

And the consistency test's 8 seconds sit inside a **67-second** full suite. At
two hundred premises the suite becomes about two minutes. **These are seconds,
not minutes.** The assistant called test runtime "the one real constraint"; it
is not a constraint at any size being contemplated.

**Load time is a non-issue, and for a reason worth recording.** A new world
takes about sixty seconds to load before the player is anywhere, and when they
arrive they have water, food, a weapon and a door on their mind — not the first
clue. The first case already waits for the survivor to be indoors (P4-R139), and
the address book builds in ~130 ms. Whatever a larger premise file costs at
parse is invisible against what the player is actually doing in their first
minutes. **The first case has slack; it does not need to be fast.**

If a single file ever does become awkward to work with, the fix is to split
`Premises.lua` by family. That is a convenience, not a performance measure.

### The one real gap: nothing measures distinctness

`test/premise_consistency.lua` makes bulk **safe**: every premise is rendered
across 305 calendars in both readings — 40,260 renders today — and checked for
impossible dates, relative phrases that contradict their own calendar, spans no
case can support, branch leakage, unsubstituted placeholders and any document
asserting a conclusion. It exists because an audit found six defect classes
twenty times over, none caught because nothing compared the words with the dates
and the branch they printed in. It works on the assistant too: adding two
premises carelessly produced 2,440 reported problems.

**But it cannot measure whether a premise is INTERESTING, or whether it rhymes
with three others.** A premise can be perfectly dated, branch-clean and
conclusion-free and still be the fourth telling of one story. Nothing in the
project measures distinctness.

That is the actual risk in the bulk strategy — not size, not runtime — and it
is much cheaper to address now than at premise 150. It is also the one place
where a tool would genuinely help: something that reports how close a new
premise sits to the existing set, so rhyming is visible while it is still cheap
to fix. **Not built, and not specified here.**


## DR-20260920-NO-CONCLUSION — contradiction is the product, 2026-09-20

**Owner, 2026-09-20:** "each mini mystery can contradict each other. Each
annotated map visit can contradict each other. That makes a conspiracy. That's
the goal of the mod. We don't want the player to reach a final conclusion. Every
play through has to be different."

This governs the whole mod, not only annotated maps. It supersedes any reading
of earlier decisions that treats cross-case contradiction as a defect to be
designed out.

- **Mysteries may contradict one another.** Not only two readings inside one
  case — separate cases, and separate map destinations, may disagree.
- **There is no final conclusion, by design.** Not withheld, not deferred: absent.
- **Every playthrough differs**, which is a requirement on variety rather than a
  consequence of it.

### Reconciling this with DR-20260919-CONSISTENT-EVENTS

Read carelessly these collide: one says the events are consistent, the other
says the mysteries may contradict. The distinction that holds both:

**RECORDS contradict. EVENTS are never arbitrated.**

Two cases' paperwork may disagree about what happened — one says the rounds
ended on the third, another that they ran to the twentieth — and the mod never
says which is right. That is ordinary bureaucratic contradiction and needs no
inconsistency in the world: one of the records is simply wrong, and nothing
identifies which. The event record therefore holds what is known to have
happened and is **allowed to stay silent** rather than adjudicating between
sources. Its job is to keep us from writing nonsense, not to be a truth the
clues point at.

### Two consequences that would otherwise break quietly

**1. The consistency harness must not police cross-case contradiction.**
`test/premise_consistency.lua` checks each premise against its own calendar and
branch — a date that contradicts its own text, a phrase matching no asserted
gap, a disputing marker in a corroborating reading. Those are defects and stay
defects. It has never compared one premise with another, so cross-case
contradiction is currently unchecked rather than forbidden: no false failures
today, but no support either. **Internal consistency is enforced; external
contradiction is intended.** Anyone extending that harness must not "fix" the
second.

**2. Nothing may imply a total.** No progress counter, no "3 of 12 found" for
the central question, no completion percentage, no achievement, no ending
screen. **A counter implies a denominator, and a denominator implies an answer**
— it would tell the player a finite truth exists and they are partway to it,
which is the one thing that cannot be true here. Counts *within* a single case
are fine: a case is finite and its clues are countable. The central question has
no denominator and must never be given one.

### What it demands of us

Variety is the whole burden. With no conclusion to arrive at, the only thing
keeping a long save interesting is that the next document says something the
player has not read — which is why bulk is the strategy (DR-20260920-Q33,
constraint 1) and why 125 contradicting destinations are worth more than a
smaller number of agreeing ones.

It also means **the connected pair is already the right shape**: "Still filing"
makes the opening's conclusion *less* settled rather than more
(DR-20260919-STILL-FILING-NARROW). That was written as a continuity requirement;
it is also the first instance of this principle in code.


## DR-20260920-Q33 — annotated maps are the pull to travel, 2026-09-20

**The mechanism.** The player finds a vanilla annotated map and reads it. From
then on, clues **about that distant place** begin appearing **near where the
player currently is**, sporadically, tied to the central question. Whenever the
player eventually reaches the marked destination — on their own schedule, with
no timer and no failure state — satisfying evidence is waiting there.

**Why this and not something else.** The vanilla developers built annotated maps
as non-time-sensitive place-mysteries, and the project has ignored that. A map is
a reason to travel that the **player chooses**, which is what every previous
attempt at motivating travel lacked: travel was proven to work mechanically
(Irvington to Muldraugh, four cases, no errors) and had no purpose. What vanilla's
maps lack is any tie to Knox. That tie is our part.

**The part that is not obvious, recorded because it is the design's real
insight:** the clue trail is laid **where the player already is**, not along the
route and not only at the destination. The reward therefore starts immediately,
the destination accumulates weight before the player sets out, and the journey
becomes anticipation rather than a chore paid off afterwards. It also needs no
new machinery: clues are already placed near the player.

### Four constraints

**1. Every annotated map ties in.** No rationing. The assistant argued for
tie-ins on only a few maps, on the grounds that many fragments pointing at one
question would answer it by accumulation. **Rejected, on two owner grounds:**

- *There is nothing to accumulate towards.* No canonical explanation exists, in
  the project or in anyone's head (DR-20260919-CENTRAL-PREMISE,
  DR-20260919-CONSISTENT-EVENTS). Facts about something nobody explains make the
  absence louder, not quieter; you cannot converge on a target that is not there.
  The assistant has now drifted toward a hidden answer three times — the "sealed
  answer" proposal, "the fragments agree with each other", and "accumulated
  toward" — and it is recorded here because it will recur.
- *Variety is cheap in this project and is not a design constraint.* Hundreds of
  distinct fragments can be written at negligible cost, which is what makes this
  mechanism viable at all where it would be prohibitive for a person. The real
  economics: **authored content costs mod size, not save size.** The save holds
  only what was found (about 545 bytes a document in the discovery ledger,
  itself capped), and the mod already ships a 370 kB generated address book. So
  the answer to repetition is volume, not restraint.

**2. Each trail fragment is independently ambiguous — never a piece of a larger
shape.** A fragment is a small unresolved thing, complete in itself and readable
more than one way. Five hundred such fragments are texture, and the player
assembles meaning from them, which is the point: conspiracies work because the
player fills the gap, and Project Zomboid is good precisely because it gives
little and lets the player invent the reasons. Five hundred **puzzle pieces**
would instead be a jigsaw, and a jigsaw has a picture — the failure the
assistant kept circling without naming.

*This does not contradict DR-20260919-CONSISTENT-EVENTS, which allows several
independent clues to illuminate ONE event.* Corroborating a single event is
allowed and wanted; what is excluded is fragments that jointly assemble an
**explanation**. Informative together about what happened: yes. Adding up to a
why: no.

*Nor does it override DR-20260919-MAP-PAYOFF's allowance that a destination may
resolve its local mystery "clearly or ambiguously".* The constraint is on the
**trail fragments**. A destination may still deliver a clear local payoff while
the central question stays open — the same shape as the opening pair.

**3. No maximum, and maps may disagree with each other.** Owner, 2026-09-20:
there is no cap on how many annotated maps can pull the player at once. "They
might even disagree. That is perfect."

*No cap.* The player may have any number of maps read, trails running and
destinations outstanding. The mod imposes no designed limit — how many they have
is a fact about their luck and their curiosity, not a rule.

*Disagreement is wanted, not tolerated.* Two maps' evidence may contradict each
other. This is the project's existing grammar — every premise has two honest
readings and nothing chooses between them — extended across destinations.

**And disagreement is what makes constraint 2 self-enforcing, which is the
stronger reason to want it.** Fragments that contradict each other cannot be
assembled into a single explanation: the contradiction blocks it structurally,
rather than depending on each fragment being written carefully enough to avoid
becoming a puzzle piece. It also gives the player a reason to visit *both*
destinations, which serves the travel pull directly.

**Where "no maximum" meets a real limit, recorded so it is not discovered
later.** There is no design cap, but storage is finite, and the binding
constraint is the **discovery ledger**: about 545 bytes for every document ever
found, capped at 512 entries (measured, `test/case_archive.lua`). Illustrative
arithmetic only, since no trail exists to measure yet: 125 catalogued
destinations at roughly three trail clues each is ~375 entries, and sixteen
ordinary cases at seven documents is ~112 — about 487 of 512. It fits, but
barely, and the ledger rather than any case cap is what will bite first.

Two consequences follow, and neither is settled here:
- a map trail must **not** consume one of the four active case slots
  (`MAX_ACTIVE`), or the second map read would block every later case;
- trail length is a **storage** decision, not only a pacing one.

**4. An unfunded destination stays inert vanilla.** Until a destination has
authored evidence at it, its map does nothing and the mod says nothing: a trail
that ends in nothing is worse than no trail, because the player walked on a
promise. This is DR-20260919-COVERAGE-HONESTY made load-bearing rather than a
footnote, and it is why the one-town pilot approach matters. Vanilla map
functionality stays intact throughout.

### Consistency with existing decisions

- **DR-20260919-MEDIA-SEPARATION** — already states that naturally discovered
  media support *subsequent* mysteries while our own clues establish the
  personal opening. Q33 is the implementation of that, not a change to it. The
  opening remains independent of any printed item.
- **DR-20260919-MAP-PAYOFF** — Q33 satisfies "every discovered annotated map
  generates a mystery" and "a meaningful local payoff must coexist with
  relevance to the central search". It also respects "extra intermediate trips
  are not universally required": the local trail requires **no travel at all**,
  because it appears where the player is.
- **DR-20260919-MAP-DESTINATION** — reaffirmed. A map is honoured by where its
  marks point, wherever it was found.
- **DR-20260919-Q15** — reaffirmed: "finding an annotated map gives purpose".

### Scope

**Annotated maps only.** Flyers and brochures are not included by this answer;
DR-20260919-MAP-PAYOFF already records that universal flyer/brochure coverage is
unconfirmed. The catalogued inventory (125 annotated maps, 594 marks resolved to
coordinates, in `docs/research/vanilla-print-2026-09-19/`) is the asset this
mechanism spends.

### Owner rulings, 2026-09-20

**1. Trigger: READING.** Not acquiring, not the marks appearing. Acquiring is a
lucky drop; reading is a choice the player makes, and it is the moment the owner
described ("player finds map, opens map, thinks that's interesting"). Settles
part of DR-20260919-MAP-PAYOFF's open "seen/read/recorded" item for annotated
maps.

**2. Trail anchoring: THE TRAIL FOLLOWS THE PLAYER.** Not one placement near
where the map was read. A rolling thread, so a survivor who reads a map and then
relocates cannot outrun their own trail. This is the harder of the two and it is
a real mechanism change: placement currently anchors to where the survivor was
when a case was created, so following them is new work rather than a parameter.

**4. A destination counts as already visited ONLY IF THE PLAYER ACTUALLY ENTERED
THE BUILDINGS ON THE MAP.** Passing through the area, or walking down the
street, does not count. So a player who has been near a marked place but never
gone inside still gets the trail and still finds evidence when they go in.

The granularity already exists: `VisitedBuildingLog` records buildings ENTERED,
which is the same source StaleClue.destinations uses. No new tracking is needed
— and the distinction matters more than it looks, because in a game where the
player crosses the same streets repeatedly, "has been nearby" would disqualify
almost every destination within a day or two of play.

**3. Duplicates: LEAVE IT TO LUCK, AND LET THE PLAYER WONDER.** Owner,
2026-09-20: "let's leave it to luck and let the player wonder why there is a
second copy of the same map."

So there is **no duplicate rule**: vanilla loot is untouched, nothing is
suppressed, no explanation is offered, and trails do not stack. One trail per
destination means a second copy simply has no further effect — it is just paper.

This is the design working as intended rather than a gap in it. A second copy of
the same map is itself a small unexplained thing, which is precisely the texture
Q33 exists to produce; engineering it away would remove exactly what the
mechanism is for (see constraint 2, and the owner's point that conspiracies work
because the player fills the gap).

*Checked for interaction with ruling 2:* because the trail follows the player,
reading a second copy in another town changes nothing — the trail is already
with them. And a destination whose trail has already been completed does not
restart, since a duplicate has no effect either way.

### Still open

**5. Sequencing against DR-20260919-Q31.** Q31 orders the work personal opening
→ survival connection → loop improvements, and the map mechanism was not in that
list, so it currently sits behind all three. The question is only WHEN this is
built, not whether. Assistant's view: it **is** the survival connection — a
multi-day journey to a marked building is what that slot was reaching for, and
it is the largest researched-but-unused asset in the project — so it belongs in
slot 2 rather than fourth. **Not reordered here;** Q31 stands until the owner
says otherwise, because moving it forward delays the discovery-loop fixes the
owner also wants.

**Caution on readiness, not on the design:** the mechanism depends on clue
placement being reliable over time, and Phase A's placement mismatch is still
unreproduced. A trail of several clues laid over a week of play is exactly where
that fault would hurt most.


## Open question — essential-evidence recovery, 2026-09-19 (overnight)

**Q: when a case loses evidence its conclusion rests on, should it retire at
once as incomplete, or stay open while the clue is offered another home?**

Implemented tonight (commit `08e5876`): the mod now DETECTS an essential gap and
refuses to claim a payoff for it — a fifth completion state
(`incomplete-essential`), no closing words, no "What do I make of it?", and the
state survives retirement and the deep archive so the record never looks solved.

**Not implemented: the recovery route.** `OPENING_PAIR_COMPLETION.md` says such
a case "keeps a recovery opportunity open", and `DR-20260919-Q23` chose renewed
physical discovery for unfound clues as the mechanism. Neither exists yet, so
what happens today is:

- the case **retires immediately**, marked incomplete. Its active slot is freed.

I chose that deliberately over holding the case open, because holding it open is
exactly the progression stall `P4-R142` was written to prevent: a case that can
never complete would occupy one of four active slots for the rest of the save,
and no ladder rung can free a slot a live case is holding. Between two honest
failures I took the one that does not break the game.

**The alternative, which needs your ruling:** keep the case live and re-defer
the essential clue so the filler tries again, bounded by a retry count, and only
retire as incomplete once those are exhausted. That delivers the recovery the
design document promises, at the cost of a case holding a slot for up to three
in-game days per retry.

Both are defensible; they differ in what the player experiences when a
neighbourhood simply has nowhere to put the slip. Left unimplemented pending
your answer, and the opening pair works either way — this only decides what
happens on the unlucky save.


## The guard is reporting, not progression — 2026-09-19 (late)

**DR-20260919-GAP-NOT-PROGRESSION — honest reporting does not satisfy the
recovery requirement.** The closing-line change (commit `669afdc`) fixes
**misleading reporting** only. "That's all I could get hold of" is more honest
than "That's all of it, I think", but if the missing clue supported an
**essential link**, the case still lacks its promised payoff. Required, and
**not** delivered by that commit:
1. **Record the case as incomplete**, distinctly from a case that delivered its
   chain.
2. **Preserve a recovery opportunity** for the missing link, rather than closing
   the case over it.
The revised voice line must not be treated as completing
`DR-20260919-SOLVABLE-WITHDRAWN`. That requirement stays open, and needs the
notion of an essential link (`DR-20260919-OPENING-CHAIN`) before it can be
built, since today every clue in a case is equal.

**P4-R141 — a dropped clue has two histories, and they were
indistinguishable.** Correction to my own comment and to what a run could
report. `drop` gives up on a clue that never found a container, so it was never
in the world; `dropMissing` gives up on one that **was** placed, on a body,
zombie or car that then went away (P4-R134) — and it nils the target, erasing
the only remaining trace, so after the fact the two paths looked identical. My
comment claiming every dropped clue was never placed was false for half of them.
Assignments now carry `droppedFrom` (`"deferred"` or `"carrier"`, valid only on
a dropped clue, in the strict field set), `Session.gaps` returns a history map
beside the id list, and a save predating the field reads as `"unrecorded"`
rather than being guessed at. Avoiding invented fates is still right for **both**
paths — nothing knows where any document went — so the closing wording is
unchanged and remains about the survivor's reach.

## Case two's inference corrected — 2026-09-19 (late)

**DR-20260919-STILL-FILING-NARROW — case two's payoff is continued paperwork,
not absent visits.** My draft concluded that entries closed after the last round
had stopped were therefore written **without visits**. That does not follow:
staff could have processed records **late, after genuine earlier visits**. The
dates support **continued paperwork after collections stopped** and nothing more
— which is meaningful on its own and is now the payoff. The case establishes
nothing about whether any entry lacked a visit, which entries are affected, or
the survivor's own, which **stays uncertain**. This challenges confidence in the
cancellation record without erasing what case one established. Corrects
`DR-20260919-SECOND-CASE`.

**DR-20260919-NO-ATTEMPT-EVIDENCE — the stronger claim needs its own
evidence.** To establish that some entries were closed with no visit behind
them requires evidence specifically supporting it: **an instruction** to close
outstanding entries without further attempts, **together with records showing it
was applied** (entries closed carrying that instruction's reference). Together
those support that some entries were closed without further attempts — still not
which, and **never** the survivor's own. Both are an **extension**, not part of
the essential chain, so the case completes on the narrow payoff; what they change
is the size of what it leaves open.

**DR-20260919-SUITABLE-SITE — "suitable office" is two tests and a site must
pass both.** A **narrative rule**: why would this place hold collection records?
It must plausibly handle routing, posting or civil administration — a post
office counter, a warden's or civil-defence table, a depot office; never a
house, a shop back room, or any desk that merely has a container. And an
**engine check**: the particular carrier must exist, be openable, sit inside the
site, and not be behind an impassable route — verified per save against the real
world, never assumed from the building's type. **Reachability alone does not make
a placement believable, and plausibility alone does not make it reachable.** A
site failing either test is rejected; if none passes, the case says so rather
than placing the record somewhere unbelievable.

## Build the opening pair — 2026-09-19 (late)

**DR-20260919-BUILD-PAIR — "No contact at premises" is approved as the first
opening, and the first playable target is the connected pair.** Premise agreed
under `DR-20260919-Q27`, so writing within its boundaries may proceed. The
target is **not the opening alone**: it includes **evidence persistence** (the
first case's finding survives into the second and survives the first case's
retirement) and **recovery when a necessary clue becomes unavailable** (the case
says so plainly rather than completing silently or stranding the player). This
demonstrates the intended experience better than expanding to more occupations,
so the other twenty-four premises stay parked.

**DR-20260919-SITING — six siting choices for the opening.**
1. **Local, no fixed town.** Two verified nearby addresses with reachable
   containers; where numbers are unavailable, verified building descriptions or
   landmarks. This settles the earlier open question about spawning where nothing
   is numbered: the opening degrades to descriptions rather than refusing.
2. **The matching record sits where it would sit** — a returned notice near the
   destination, or a desk copy in a suitable office. Never an arbitrary
   container.
3. **The first trip is short** — same neighbourhood. Longer travel belongs to
   later mysteries; the travel machinery is already proven, so nothing is lost.
4. **The reference code reuses the existing format** — one of the twelve
   meaningless prefixes plus three digits (`PS-289`, `R-482`), exactly as
   `Generator` already builds them. The code connects documents and must not
   become a puzzle; the generator's own comment already forbids a reference that
   encodes its premise.
5. **"How did I arrive here?" waits for a later connected case.** The opening
   establishes the missed collection record, which is itself a personal reason
   to investigate. Qualifies `DR-20260919-OPENING-QUESTION`: the arrival
   question is deferred, not dropped.
6. **No expansion to more occupations yet.**

**DR-20260919-SECOND-CASE — the follow-up is "Still filing".** It follows the
first case's own open question (did the visit happen at all?) by tracing who
maintained the collection list and where cancellation reports went. Its payoff:
**cancellation entries were being closed after the last collection round had
stopped running, so at least some "no contact" entries were written without a
visit behind them.** It deliberately does **not** establish which ones,
including whether the survivor's own was among them — the follow-up makes the
first conclusion *less* settled, challenging the earlier reading without erasing
the finding that earned it. Its three-link chain turns on two records that are
unremarkable alone and together establish what neither claims, which is the
shape worth proving in a pair. Open and unanswered: why entries were closed with
no round behind them, and on whose authority.

## The progression stall, in two parts — 2026-09-19 (late)

**P4-R142 — a case completed by a drop now retires, and the drop paths check.**
`Session.accounted` was consulted in exactly one place, the inspection path.
Both drop paths — a deferred clue that waited three in-game days, and a clue
whose carrier is gone — dropped the clue and never re-checked. So a survivor who
inspected everything available and whose last clue later expired left a case
that **was** accounted for with nothing that would ever look again: it held an
active slot for the rest of the save, and no ladder rung can free a slot a
finished case still holds. `retireIfAccounted` is now called from both paths.
Three faults in the fix itself were caught by tests, not by me: a forward
reference (called before its `local` declaration, which in Lua reaches a nil
global — caught by `local_before_use`), a missing nil-wrapper guard that threw
`ipairs(nil)` inside a scheduler job, and gap **history** as well as gap ids
needing to survive retirement.

**P4-R143 — a short case may retire when its gaps explain the shortfall.**
The second half of the stall, found by the owner reproducing it against a
one-container fixture: `known=1 valid=true accounted=true retired=nil
reason=invalid retired rows`. A dropped clue projects no row, and both archive
tiers required at least `MIN_EVIDENCE` rows, so P4-R142 reached retirement and
retirement **refused** — the slot stayed held. The minimum is now **explained
rather than removed**: a case with fewer rows must carry gaps accounting for the
shortfall, so a short record cannot be short for any other reason. A short case
with no gaps is still refused. Same rule for the deep archive's `known`, or a
case would be stranded one tier down.

**Verified:** the owner's reproduction now gives `retired=ok rows=1 gaps=3` and
deep-archives. `test/retire_frees_slot.lua` drives the real runtime with a saved
campaign and asserts the live count falls to zero, read back from the store
rather than from the test's own variable.

**An existing test was pinning the carrier-timer bug in place.**
`clues_on_the_move` asserted the literal buggy expression
`api.missing(d.id,found and nil or hours)` under the message "and the hour is
cleared the moment the carrier turns up again" — asserting the bug while
describing the fix, so anyone correcting the code would have been told they broke
a test. Replaced. The first replacement then asserted the idiom was *absent* and
matched the comment explaining it; dropped, because absence of a string is not a
behaviour. The lesson is recorded because it recurs: a source-text assertion can
only confirm that a file says what it says.

**Test tiers, adopted after a 77-minute campaign run could not reach the path it
was started for.** `DEFER_EXPIRE_HOURS` is 72 in-game hours and the run
accumulated about eight, so the expiry path was unreachable by construction. It
is **not** true that the run produced nothing: it exercised case one, a reload,
case two end to end, case three, the save sizes per stage, and the
`active-limit` refusals with their stated reasons — and its record of one clue
failing to reach a container across five neighbourhood moves is real evidence
about placement. What it could not do was test expiry. Both bugs were provable in milliseconds. Tier 1 pure Lua for
decisions and state machines; tier 2 mocked runtime for control flow — what gets
called; tier 3 one short real-game check for one thing in a real world; tier 4
the campaign, run rarely and only when 1–3 are green. Tier 4 needs an
**injectable clock** before it can reach any expiry path at all, and should
**abort on first failure** — this run continued past four failures producing
text that was then over-read.

**CLOSED 2026-09-19 (late): the integration gap.**
`test/expiry_to_retirement.lua` drives the **real scheduler** on a clock the
test owns, for both drop paths: inspect every available clue leaving one
deferred, advance past expiry, let the actual filler job perform the drop, and
verify retirement, slot release and the gap ids and history kept — then the same
for a carrier that goes missing, across a save and reload. Nothing calls
`retireIfAccounted` directly. Before expiry it asserts that **nothing** is
dropped, so the check cannot pass by dropping everything always.

Four fixture faults had to be found first, each of which made the test prove
nothing while appearing to run:
1. a **nil player inventory** — the identity job runs on the same tick round as
   the filler and calls methods on it, so the tick threw and the filler never
   ran;
2. a **millisecond clock advancing 1 per call** — the scheduler's 1 ms budget
   was spent by its own first clock read, so it stepped **zero** jobs, silently
   and without error;
3. **`package.preload` ignored for an already-loaded module** — the second
   runtime kept the first one's resolver, so flipping the carrier to "gone" had
   no effect at all;
4. a **hand-built WorldAccess stub** missing `identityScan`, for the same reason
   as (1).
Recorded because of what they have in common: each stopped the **intended path
from running at all**, while the surrounding machinery carried on without error.
They were **not false passes** — the final assertions exposed every one of them.
The cost was diagnostic distance: the failure surfaced at the last assertion
rather than at its cause, and (2) in particular produced no error and no log
line, so the first reading was "the fix does not work" rather than "the
scheduler never stepped".

**Still open:** the original placement mismatch — a clue the record calls
`placed` that is not in its container — remains separate and unreproduced. A
broad campaign run waits until the focused checks above are the baseline.

## The opening premise narrowed — 2026-09-19 (late)

**DR-20260919-OPENING-QUESTION — the opening answers "why was I left?", not
"why did I wake up here?".** Recorded explicitly rather than treated as though
both were covered. The substitution is deliberate: the abandonment question
connects to the central mystery, and the arrival question invites amnesia, which
the survivor does not have. If an arrival question is wanted, it is a separate
premise chosen knowingly.

**DR-20260919-VISITOR-SEPARATE — the visitor is not part of the first
payoff.** My first draft claimed someone with official access had been at the
house and offered two observations as equivalent roads to it. **Neither
establishes it:** a supply disconnected at the box identifies neither who nor
when relative to the grid failing, and an undamaged door proves neither key use
nor official access nor any visit. Both are demoted to optional observations
that establish nothing. Establishing a visitor requires something attributable —
a service record naming a party and a date, its claims kept distinct from
verified fact — and belongs to a later case. This was an unsupported inference
made inside the document that introduced `DR-20260919-SUPPORT`.

**DR-20260919-OPENING-PAYOFF — the first payoff is narrowed, and worded to
distinguish the record from the event.** It reads: *a collection was scheduled
in my name; the record puts it at a different address from the one I am at; the
record reports that visit as unsuccessful, and the entry cancelled.* An unsigned
annotation establishes **what the record says**, never that the visit happened
as described — and that distinction appears in the payoff itself, not only in
the checks.

**DR-20260919-OPENING-CHAIN — completion is defined by an essential chain of
findings, not "three of five" clues.** Three links must be established: a
collection was scheduled for the survivor; its destination differs from the
survivor's established location; a matching record reports an unsuccessful visit
and cancellation. Where a link has two routes, **each route must support that
link on its own**. The first draft failed this by offering a counterfoil at the
other address as an alternative to the desk copy: a completed counterfoil
supports only that a round ran on that street, a different claim, so it is
corroboration and never a route. Link 3's two real routes are the desk copy and
a returned undelivered notice.

**DR-20260919-NO-RESIDENCE — a spawn building is not the survivor's home, and
an adjacent building is not the next number.** The address book identifies
buildings and numbers; it does not establish residence, and the opening must not
imply the survivor owns or lives where they woke. Both addresses must be
verified world addresses with **accessible carriers**, checked rather than
assumed. The placed personal slip is what makes an address matter, without
inventing home ownership.

## The opening's requirements settled — 2026-09-19 (late)

**DR-20260919-OPENING-SCOPE — the opening explains more than the player's
skills.** A skills-grounded opening was the wrong target: it would allow an
electrician to investigate an electrical fault while never addressing "why did I
wake up here?". The opening must establish **four** things: a personal
connection to the starting place; a question about how or why the survivor came
to be here; a local payoff contributing to the wider search; and skill-specific
observations as an **additional layer**, not the spine. Avoiding an invented
biography does not forbid the **modest personal facts** required — a name, an
address, belongings that are the survivor's. This corrects
`DR-20260919-PILOT-POLICY`, whose "no invented employment history" was read too
far.

**DR-20260919-FALLBACK — a non-specialist route is retained, and the refusal
recommendation is dropped.** This closes the open question in
`DR-20260919-PILOT-POLICY`. Everyone can find an appointment slip, recognise
their own belongings, or compare two addresses. **Missing the relevant skill
changes the approach, never access to the opening**, so the mod does not refuse
an opening for want of a matching skill and no unemployed special case is
needed. My recommendation that the mod refuse outright is withdrawn.

**DR-20260919-PLACED-CLUES — "no printed item" means no dependency on randomly
spawned vanilla media.** The opening never waits on a flyer, map or brochure to
drop. It may freely use a note the mod places itself. Earlier wording conflated
our own authored clue with vanilla loot.

**DR-20260919-BADLY-PLAYED — recovery has limits.** "Pays off even when played
badly" is bounded: **interruption and missed clues must be recoverable**, by
more than one route to the same supported conclusion, while **deliberate refusal
to investigate need not force an ending** — an unpursued lead simply stays open,
and a player who never investigates is not handed a conclusion.

**Plan revision closed.** Owner direction: stop revising the overall plan and
move to the opening premise and its evidence sequence. Drafted in
[OPENING_PREMISE.md](docs/design/OPENING_PREMISE.md) — a premise for review, not
approved content under `DR-20260919-Q27`.

## Plan revision after review — 2026-09-19 (late)

*Six corrections to the first development plan, all of them narrowing claims I
had overreached on. Recorded as the agreed direction; the owner has not
separately ruled on each line.*

**DR-20260919-INCREMENT — the groundwork is built around the first pair of
cases, not ahead of all content.** The evidence rules and the retention change
are sized to the personal opening and its follow-up, and only generalised once
that concrete pair works. One committed increment: reproduce and fix the
placement fault, then the opening, then the follow-up. **No durations are
given** — the earlier three-week figure was an estimate presented as a
necessity, and estimates for later work are revised after this increment lands.
See [the plan](docs/management/DEVELOPMENT_TIMELINE_2026-09-19.md).

**DR-20260919-RETENTION-BOUND — retention is bounded and unproven, not
permanent.** A measured 26,617-byte reserve in a sixteen-case save cannot
establish that findings survive an indefinitely growing investigation. The
commitment is to preserve source context and the player's own notes, then
**measure growth across many cases** before fixing any retention limit. The
figures now carry their source revision and conditions (`7a63ed8`, re-run at
`34ecdb4`, 1,000 seeds, worst case per tier, the synthetic location fixture,
seven documents a case), and three stated limits: the 73,000-byte reserve inside
them is an allowance rather than a measurement; synthetic locations are not real
ones; and the discovery ledger's 512-entry cap has never been tested at its
limit. Qualifies P4-R140, which stated the figures without these conditions.

**DR-20260919-SOLVABLE-WITHDRAWN — "a mystery is always solvable" is withdrawn
as a guarantee.** One clean long run cannot establish it. Fixing the reported
placement mismatch requires **reproduction**, a **targeted regression check**,
and a check that **essential evidence which cannot be reached never silently
counts as a delivered ending** — a separate and more dangerous failure, since a
case that quietly completes without its evidence hides the fault instead of
reporting it. The three-in-nine failure rate is my own report from Linux runs
and is not independently verified.

**DR-20260919-FOLLOWUP-CRITERIA — the follow-up's completion criteria are
objective.** "Feels like one investigation" is withdrawn; it restored a
subjective gate after DR-20260919-GATE-UNCHANGED had settled the matter. What
must hold: a **sourced connection** (a specific finding cited with its source,
not a repeated name), **consistent chronology** against the event record and
between the two cases, **meaningful new evidence** rather than a restatement,
and **persistence** across save and reload and across the opening's retirement.
Play feedback remains a source of requirements, not the criterion.

**DR-20260919-PILOT-POLICY — the occupation pilot uses actual starting skills,
and the refusal policy is open.** The opening is built on the survivor's real
starting skills and skill levels; **no employment history is invented**, since
the game supplies occupations and skills rather than a biography. The electrician
is the pilot. Whether the mod should refuse an opening outright when the
starting skills give it nothing to work with — my recommendation, replacing the
proposed unemployed fallback — is **an open question awaiting an owner ruling**,
not an agreed decision, and is not built either way until ruled on.

**DR-20260919-MAP-DESTINATION — a map is honoured by its destination, not by
where it dropped.** The pilot town supports every annotated map **whose marks
point into that town**, wherever the map itself was found. Corrects a plan goal
that read "a map found in that town", which would have missed maps found
elsewhere pointing inward. Reaffirms DR-20260919-MAP-PAYOFF and
DR-20260919-COVERAGE-HONESTY.

## Reconciled development direction — 2026-09-19 (evening)

*Reached by review between the Linux development side and the owner's Windows
review session. Recorded as the agreed direction; the owner has not separately
ruled on each line and may correct any of them.*

**DR-20260919-NUMBERING — the two decision registers are not rival numbering
schemes, and neither renumbers.** Flagged as a discrepancy earlier today and
withdrawn on inspection: `DR-<date>-<topic>` records **what the product must
be** (the wishlist and review answers, made on the Windows side), and
`P4-R###` records **what a build settled** (implementation decisions, quoted by
name in code comments and tests, now at R139). They are two registers in one
file, not two conventions for one thing. No entry is renumbered and no parallel
trial run is needed. Cross-reference between registers where a build decision
implements a product decision.

**DR-20260919-CONSISTENT-EVENTS — consistent events, no canonical
explanation.** Replaces the "sealed answer" proposal, which was rejected for
manufacturing a canonical truth that clues would converge on even if no
document stated it. What is fixed is a record of **specific events** — a pickup
cancelled, a radio desk receiving a message, an official concealing a decision —
with the ultimate explanation left genuinely open. Several independent clues may
illuminate one event; events are not allocated one per clue. The event record is
a readable, version-controlled document carrying source references and explicit
uncertainty. Reaffirms DR-20260919-CENTRAL-PREMISE. The earlier proposals of a
minimum count of hidden details, and of forbidding whole subjects (agency,
order, helicopter), are both rejected: the count was arbitrary, and a subject
ban would block worthwhile local discoveries.

**DR-20260919-SUPPORT — cited evidence is not the same as a justified
conclusion.** An organiser record can cite three found objects and still draw an
unsupported inference, so the record and its checks must keep three things
apart: **what was observed**, **what a document claims**, and **what those
sources actually support**. The event record preserves the same distinction: an
unsigned memo's allegation is recorded as an allegation that was found, and
never graduates into an established event by having been written down.
Supersedes the "receipts" proposal, which only required that objects be listed.
Extends two existing instincts into a rule — the survivor's "probably refers to
another list?" being a question that may be wrong, and the relay-memo week
being stored as a maybe and never a finding.

**DR-20260919-CONTINUITY — continuity carries discovered evidence, not selected
opinions.** A later case follows a finding the player actually made and the
question a case ended on, and may challenge an earlier interpretation. The three
closing questions are **not** restored as the steering mechanism; the discarded
hunch system stays discarded. Serves DR-20260919-Q18's retention goal.

**DR-20260919-PAYOFF-SCOPE — each mystery's payoff is designed before its
clues, at mystery scale.** Accepted for individual mysteries, including each
annotated map's destination. The proposal of one final building with four
required objects is **rejected**: it makes a campaign with a collection
checklist, where the agreed direction is an investigation layer that enriches
survival. A full campaign remains a future possibility, not this scope.

**DR-20260919-COVERAGE-HONESTY — incomplete map coverage is communicated
outside the fiction.** A pilot town may be wired first, but an unfunded
annotated map must not draw an in-character reaction: "can't make anything of
this yet" would read as a clue needing more skill or evidence, which is a
falsehood in the survivor's voice. Coverage is a development fact and belongs in
release notes and clearly labelled development feedback. Vanilla map
functionality stays intact. Universal coverage per DR-20260919-MAP-PAYOFF
remains acknowledged unfinished work.

**DR-20260919-ORDER-KEEP — the personal opening stays first, and the
continuity demonstration is built to keep.** The personal opening mystery is the
first case (DR-20260919-Q31); a follow-up case then demonstrates genuine
continuity from it. The proposal to prove continuity on a throwaway case first
is rejected in favour of combining them, which preserves the development order
and produces reusable work.

**DR-20260919-GATE-UNCHANGED — passing technical checks remains the milestone
gate; playtesting is a source of requirements.** DR-20260919-Q30 stands
unchanged and the proposed "I felt clever" acceptance grade is withdrawn.
Recorded because every fault the owner caught on 2026-09-18/19 — a badge called
a document, line breaks at 1.5x, page-at-a-time scrolling, the organiser's radio
audible, map marks not recorded in place, Inspect unavailable — passed the
technical checks. Play is where we learn what to write checks for; it is not a
second gate.

**P4-R140 — the archive's measurements are re-verified, and the stub does not
yet meet the retention goal.** Checked before letting them set policy, as
requested. `test/case_archive.lua` passes on current code and reproduces its
figures exactly: worst case per root, live 42,024 bytes, archived with rows
33,135, stubbed 3,130; shrink 12,914 → 1,821 bytes (−86%); a sixteen-case save
at campaign 338,540 + ledger 61,843 + 73,000 reserved = 473,383 of 500,000,
**26,617 spare**. What "retained" means per tier is the table in
[CASE_RETIREMENT.md](docs/design/CASE_RETIREMENT.md): a stub keeps the case id,
its document ids in discovery order, and the questions and answers — and drops
titles, text, leads, connections, the site and where evidence was last seen.
Two consequences:
1. **The stub fails DR-20260919-Q18** ("concise summaries, important
   connections and the player's own notes", and anything still needed for an
   unresolved or inherited investigation). The gap is measured, not argued.
2. **Sixteen cases is a storage ceiling, not a playthrough length.** The real
   wall is the discovery ledger: 545 bytes for every document ever found, capped
   at `MAX=512` events — about seventy cases' worth at seven documents a case,
   whatever the case store does. Content budgets must be set against that, never
   against the case count. The earlier "roughly eighty clue slots a save" figure
   is withdrawn as unsound.
The spare 26,617 bytes is what a retention rule may spend. A stub gaining its
sourced findings and open question costs a few hundred bytes a case, so eight
stubs fit inside the spare with room left; restoring full rows costs about
30,000 a case and does not fit. Design for variety and continuity, then measure
repetition in play.

## Audit before development handoff — 2026-09-19

**DR-20260919-EXISTING-AUDIT — review current evidence and generator here before handing off.** Owner explicitly requested a deep audit of existing texts and mystery-creation logic against arrival, apparent isolation, absent help and related central questions. [The audit](docs/design/EXISTING_EVIDENCE_AUDIT_2026-09-19.md) covers all 20 runtime premise families, shared templates, Dead Air and continuity/completion/archive logic at `edf55d3`. Findings distinguish source behavior from proposed repairs. The audit is completed planning work; none of its new fictional examples is automatically approved or implemented. [The development handoff](docs/management/CENTRAL_MYSTERY_DEVELOPMENT_HANDOFF_2026-09-19.md) now carries concrete repair scope rather than delegating the audit itself.


## Latest clarification — central mystery and naturally discovered maps, 2026-09-19

**DR-20260919-CENTRAL-PREMISE — the unanswered question drives the game.** Owner reaffirmed: there is no definitive Knox Event explanation, but trying to find one is the whole premise. Questions about isolation, other survivors, responsibility, absent help and the helicopter motivate investigation. Local answers contribute to that search; preserving uncertainty does not mean excluding the central question. No canonical culprit/cause or proof of sole-survivor status is established. This clarifies Q01/Q04/Q06, without committing a full scripted campaign. [All 32 answers reviewed](docs/design/CENTRAL_MYSTERY_REVIEW_2026-09-19.md).

**DR-20260919-MEDIA-SEPARATION — authored opening; natural media discovery.** Owner rejected depending on occupation-specific vanilla flyers/maps for the start. Our own clues establish the personal opening. Naturally discovered media support subsequent mysteries; occupation influences selection/observations without requiring matching flyers. Earlier occupation-to-media pairings are optional later references, not opening dependencies.

**DR-20260919-MAP-PAYOFF — every discovered annotated map generates a mystery.** Owner explicitly requires every naturally discovered annotated map to motivate travel and provide evidence at its destination that resolves the local mystery clearly or ambiguously. A meaningful local payoff must coexist with relevance to the central search. Extra intermediate trips are not universally required. Exact seen/read/recorded trigger, duplicate policy, exceptional maps and pacing remain open. Universal flyer/brochure coverage is not confirmed. Source inventory and candidate engine hooks are not live verification.

The [revised development handoff](docs/management/CENTRAL_MYSTERY_DEVELOPMENT_HANDOFF_2026-09-19.md) supersedes incompatible sequencing/media assumptions in the first handover. Specific story examples and proposed contracts remain design guidance for review, not newly shipped features.


This file contains the **current** project decisions. The complete original discovery record is preserved in [`DECISIONS_BASELINE.md`](DECISIONS_BASELINE.md). Engineering-review corrections are also preserved in [`DECISIONS_SUPERSESSIONS_2026-08-30.md`](DECISIONS_SUPERSESSIONS_2026-08-30.md).

If a spike disproves a decision, technical reality wins: supersede the decision explicitly and link the spike result.

## Direction review — 2026-09-19

**DR-20260919-OCCUPATION-PLAN — plan on Windows; develop and verify separately on Linux.** Owner requested premises for every occupation, gameplay mechanics, media identity, seen/read/recorded distinctions, reachable carriers and vanilla stash timing using the completed inventory. Explicit boundary: “You ar planing, nod developing. We will develop it separately on the Linux laptop”. [The planning package](docs/design/OCCUPATION_MYSTERIES_LINUX_PLAN_2026-09-19.md) covers the 25 installed profession definitions and concrete Linux verification tickets. Premises and detailed mechanics are proposals for review under Q27. No new hook, destination carrier or stash-timing behavior is claimed live-verified. This turn changes documentation only; implementation and engine checks belong to the separate Linux work.

**DR-20260919-PRINT-RESEARCH — inspect vanilla media offline before selecting a mystery integration.** Owner requested inspecting maps, flyers and brochures in the local Zomboid folder, reading each, locating its Knox destinations, categorising the collection and then proposing a plausible way forward. This replaces choosing an integration from the earlier brainstorm without source inspection. Completed findings and proposals are in [the offline inspection report](docs/research/vanilla-print-2026-09-19/README.md): 125 annotated maps, 111 flyers, 22 brochures, plus 15 ordinary map item definitions. Source coordinates, original artwork and plain-text reader differences are distinguished from live-world verification. The electrician, gallery and bunker proposals are recommendations awaiting story-scope agreement, not approved new connections or implemented mechanics. Today's other work remains queued.

**DR-20260919-Q32 — review direction at every completed playable milestone.** Owner selected A: briefly review which design decisions still fit before choosing the next development focus. This establishes the review cadence for the new wishlist. Q30 still defines milestone acceptance as passing technical checks. The detailed agent-authority proposal in the questionnaire was not presented in chat and is not adopted wholesale by this answer. All 32 main questions are now answered; explicitly unresolved details remain open rather than inheriting old commitments by default.

**DR-20260919-Q31 — development order: personal opening, survival connection, current-loop improvements.** Owner answered “b then c then a”. First build the personal opening mystery, prioritising mysteries that fit starting skills (Q03). Then develop a survival connection; the presented examples were a journey involving the player's base or a skill/tool interaction, and the exact first connection remains to be chosen. Then improve the current investigation loop, including believable discoveries, clearer clues and pacing. This is an ordered sequence of development focuses, not a single milestone containing all three. Q30's passing technical checks apply to milestone acceptance. Today's settings work, maps/flyers brainstorm, bulk-discovery redesign to-do and final vanilla-scene research remain on the agenda; this answer does not cancel them. Necessary fixes to deliver an earlier focus can accompany it.

**DR-20260919-Q30 — technical checks passing is the milestone acceptance criterion.** Owner added and selected D: “Technical checks pass”. A completed owner investigation, multi-session owner playtest or invited playtest is not an additional milestone acceptance requirement. This supersedes the questionnaire's proposed combined technical-and-playtest gate. Required technical checks must actually pass; this answer does not turn archived results into verification of new changes or waive unavailable checks. Play feedback remains useful, and Q29 still gives the owner control over when the feature set is ready for long-term play. No particular test suite or immediate release was selected by this answer.

**DR-20260919-Q29 — allow breaking changes until the owner judges the feature set playable long term.** Owner selected Q29 A: “we will break untill I feel the feature set it playable long term”. Development may require fresh games, with clear notices identifying affected updates. The owner decides when the feature set is ready for long-term play and this policy should be revisited; do not infer that threshold from a date, technical pass or version number alone. This reaffirms development freedom in P4-R63/R77 with an explicit owner-controlled transition. It does not require every update to break saves or authorize deleting existing saves. Stable playtest periods and migration-first development were not selected. Adding the mod to an already-running vanilla save remains an unanswered separate question.

**DR-20260919-Q28 — version 1.0 supports single-player on the vanilla Build 42 map.** Owner selected A with explicit scope: “version 1 will be A”. This sets the version 1.0 compatibility target, rather than only the next development milestone. Reaffirms single-player and Build 42 direction (P1-Q3/P1-Q19) and narrows P1-Q18's broad map/mod compatibility ambition for 1.0. Exact supported Build 42 revisions require verification before release. Broad custom-map or multiplayer support is not a 1.0 commitment; this does not assert incompatibility with every other mod. Q19's future PC-mod integration remains on the wishlist. External story/content packs were not asked about in chat and remain open.

**DR-20260919-Q27 — approve story premise, tone and boundaries before publishing within scope.** Owner selected Q27 B: agree the premise, tone and boundaries first; tested writing within that approved scope can then be published for evaluation in play without individual approval of every text. A new direction or content outside those boundaries needs agreement. Q24 supplies the confirmed overall tone. This qualifies P4-R97's content approval workflow. The separate question about the older P4-R107 content freeze was not presented in chat and remains unresolved; the assistant's proposed replacement of that freeze is not approved by this answer. This records the story-content workflow, not authorization for an immediate Git push or release.

**DR-20260919-Q26 — detailed player settings, work requested today.** Owner selected B: broad individual controls with sensible defaults, and asked to tackle this today, reporting it has not yet been put into the game. This confirms the broad-configuration direction of P2-Q47–Q52; it does not reaffirm world-creation-only configuration. Identify the useful settings and existing implementation before building them. Exact controls, ranges, defaults and which may change mid-save remain open. Add settings work after the questionnaire and maps/flyers brainstorm, before the scene research requested last.

**DR-20260919-SEARCH — rethink implausible bulk discoveries in previously checked places.** During Q26, the owner reported finding many dust masks in a place already examined without Investigate Area. The screenshot shows ten evidence entries labelled dust mask (1 of 10) through (10 of 10). A paper or key overlooked on a shelf or in a cupboard can plausibly emerge through detailed searching; this bulk discovery did not work for the owner. Add a discovery/placement redesign to the to-do list. Investigate the trigger, quantity and prior-visit/container knowledge before choosing a fix; the screenshot alone does not establish a duplication bug or the precise spawn mechanism. This qualifies Q07's positive assessment of the search loop and must inform Q12/Q23 relocation: unfound evidence still needs a believable physical discovery. No blanket removal of Investigate Area or specific item-count cap was requested.

**DR-20260919-Q25 — keep gameplay offline with authored content and local generation.** Owner selected Q25 A and reported that this approach “has proved to be very good.” Keep gameplay entirely offline using authored content and local generation rules. Runtime AI is not part of the revised product direction; this supersedes the runtime-AI capability expectation in P2-Q1/Q2. AI assistance used to develop the mod is a separate matter. The owner's positive play experience supports retaining this approach; it is not a claim of additional technical testing.

**DR-20260919-Q24 — fatalistic bureaucratic dark comedy throughout.** Owner selected Q24 B. Fatalistic, bureaucratic dark comedy is the ongoing tone of the mysteries. This reaffirms the tone direction of P1-Q21/P2-Q59 in the new wishlist. The assistant's recommendation to lead with unease and use humour only when appropriate was not adopted. Specific writing examples and implementation timing were not selected by this answer.

**DR-20260919-Q23 — help through fresh opportunities to find missed clues.** Owner selected Q23 D: “place clues never found, in new locations. or do you suggest something different.” Use renewed physical discovery opportunities for unfound clues as the chosen assistance direction, consistent with Q12's delayed relocation. The proposed recap or stronger navigation UI is not selected by this answer. Relocation timing, knowledge boundaries and handling of old copies remain the design questions recorded under Q12.

**DR-20260919-RELAY — named destinations should support actual investigation.** During Q23 the owner supplied a screenshot of an access memo naming Relay Site 31 and proposed using it as a place the player travels to for more clues. Add this example to today's maps/flyers brainstorm as a concrete text → destination → further-discovery opportunity. The owner supplied [radio relay station examples](https://pzwiki.net/wiki/Radio_relay_station) and [1635x5764](https://map.projectzomboid.com/?1635x5764) as one candidate among many, not a binding identification of fictional Site 31.

Reference check on 19 September: the wiki lists 1635x5764 as a Brandenburg relay station and lists other station locations; this is secondary location evidence, not verification of target-build storage, access or suitability. The linked interactive map could not be inspected with the web reader. The screenshot's access authorisation is fictional evidence, not permission to take actions outside the game. Exact Site 31 binding, how the player locates it and what they discover there need design and engine verification.

Assistant refinement, not yet a separate owner decision: use relocation for unfound connecting clues that help the survivor locate a named destination, while keeping an already-established destination consistent. This would reconcile Q23 assistance with Q05's later required travel. Do not automatically move the destination's entire discovery payoff close to the player or treat the supplied coordinates as the final choice.

**DR-20260919-Q22 — remove ordinary-object suspicion capture from the requirements.** After questioning what recording an ordinary-object suspicion would accomplish beyond a note, the owner instructed: “remove that requirement”. Remove the proposed requirement to bookmark ordinary objects or turn arbitrary observations into formal investigation leads. Do not retain it as an automatic later commitment from P2-Q4/Q5/Q17 or Player Moment 1's broad ordinary-item promise.

This is a scope decision, not a request to delete existing free notes or remove current code. Q09a's bounded prototype for following a concrete lead from evidence remains confirmed; it does not require arbitrary-object suspicion capture. No new bookmark, comparison or ordinary-item integration system is authorised by Q22.

**DR-20260919-Q21 — a separate relationship graph remains a future option.** Owner selected Q21 B: first assess how well the organiser and the planned map connections support understanding relationships; keep a separate graph as a future option rather than a committed feature. Q10's later map lines connecting clues to meaningful conclusions remain confirmed independently. This replaces any mandatory separate-graph commitment inherited from P2-Q20–Q25 or its old v2 allocation. Graph layout, interaction and persistence choices do not carry forward automatically. The development Graphify graph is unrelated to this player-facing feature.

**DR-20260919-Q20 — retain the organiser's physical costs without battery-related data loss.** Owner answered “keep that way” to keeping all three proposed behaviors: reading occupies an available hand; battery power matters but ordinary reading should not drain it excessively; a lost organiser must be recovered or replaced. A dead battery never erases evidence or notes. This reaffirms the physical-device direction and P4-R86's protection against battery-related writing loss in the new wishlist.

Exact power-consumption tuning remains to be measured; no new drain rate was selected. Recovery/replacement concerns device access and must preserve Q17's separate requirement for a new survivor to recover the predecessor's investigation. A generic replacement device must not automatically grant another character's knowledge. No optional realism mode or broader loss-of-device data policy was selected by this answer.

**DR-20260919-Q19 — keep the organiser; add PC-based discoveries in future versions.** Owner selected Q19 A: the organiser remains the main investigation interface alongside physical evidence. The owner also requested a future extension using an existing PC mod that reportedly allows booting a computer and using CD-ROMs. Mysterious CDs could contain government software, spreadsheets or similar material that deepens investigations and immersion. These examples define the desired experience, not mandatory application types or a final content list.

This reaffirms the organiser-first direction of P4-R79/R128 and adds PC integration to the revised wishlist for future versions. The PC is an additional investigation surface; no replacement of the organiser or equally capable paper interface was selected. The referenced PC mod has not been identified or its interoperability verified in this review. Before implementation, establish its identity, supported game version, media and UI extension mechanisms, dependency/distribution requirements and relevant permissions. Do not assume access to an actual spreadsheet engine, arbitrary executable software, PC-organiser synchronisation or internet connectivity. The proposed government applications are in-game fiction. Hardware/media authenticity and any exceptions to earlier period constraints remain design questions under the ongoing commitment review.

**DR-20260919-Q07a — include vanilla burned-out and survivor houses.** Owner expanded Q07: “add burned out houses (vannila) and survivor houses (vanilla) to our places to add to our misteries”. Add these existing vanilla locations to the mystery-location wishlist and to the detailed detection/prioritisation research already scheduled last today, alongside game-placed indoor corpses and car wrecks. Research how each can be identified reliably and used before implementing selection. Do not equate a vanilla survivor house with the player's base, assume a particular engine flag, or infer permission to burn houses or create new survivor houses.

**DR-20260919-Q18 — full recent cases, useful permanent summaries of older ones.** Owner selected Q18 B: keep recent cases fully readable; retain concise summaries, important connections and the player's own notes for older cases. Material still needed for an unresolved mystery or an inherited investigation must remain available. This establishes the retention goal rather than reaffirming the current four-full-case limit or the current format of reduced records.

This revises the archive requirements around P2-Q74–Q78 and P4-R135 for the new wishlist. Exact recency rules, what constitutes an important connection, summary format and storage limits need design and measurement. Do not silently discard player-authored notes or promise unlimited storage without evidence. Retention and access are separate: Q17 still requires a new survivor to recover evidence or the organiser before inheriting the investigation. Timing is pending.

**DR-20260919-Q17 — inherit an investigation through physical recovery.** Owner selected Q17 B with “b exactly”: a new survivor must recover the previous survivor's evidence or organiser to inherit that investigation. The investigation can survive its investigator, but the replacement character does not automatically know it. Acquiring a generic organiser is not itself recovery of the previous survivor's record.

This changes P4-R128's automatic world-record access for a new survivor and revises the original P1-Q6/P2-Q28 assumption that the investigation necessarily ends with the character. Existing discovered facts remain historical facts; the new character's access to them must follow recovery. Whether particular recovered evidence grants partial knowledge or an entire record, how provenance is identified, and how the predecessor's personal missing-past mystery is attributed remain to be designed. No death recap was selected by this answer. Development timing is pending.

**DR-20260919-Q16 — skills affect observations and understanding.** Owner selected Q16 B: provide skill-specific observations and interpretations while exploring, in addition to Q03's starting-skill influence on mystery selection and Q14's later skill/tool requirements. The example of an electrician recognising an altered circuit illustrates expertise affecting what the survivor can notice or understand; it is not a mandatory scenario or a verified engine mechanic.

This reaffirms the skill-specific observation aspect of P1-Q14 in the new wishlist. It does not require separate story paths for every profession, approve specific skill thresholds, or imply that every Q14 requirement must have an alternative route. Profession and trait effects beyond the confirmed skill behavior, the exact observations and their implementation order remain to be designed. Observations must be supported by the world/story facts; expertise is not permission to invent a conclusion.

**DR-20260919-Q15 — allow designed world changes that give mysteries purpose.** Owner selected Q15 C and linked it to Q14: “Findind an Annotated map gives purpose. As well as finding flyers. remind me of this in the brainstorming session”. Carefully designed events, objects or rewards may be introduced when a mystery needs them, including skill/tool interactions that reveal something new. This expands the new wishlist beyond only using existing survival opportunities (P4-R110) or the assistant's former bounded-existing-objects recommendation. It does not select any particular reward, quantity, event, alteration of player belongings or balancing rule; these remain design choices to settle.

For today's annotated-map brainstorm, explicitly bring back the owner's principle: finding an annotated map or flyer gives the player a purpose and reason to act. Include flyers alongside maps, and explore how their leads can connect to Q14's later skill/tool interactions and Q15's world changes. This is a reminder within the already-planned discussion, not a request for a separate scheduled notification. The map/flyer implementation is not selected by this answer.

**DR-20260919-Q14 — later mysteries may require skills or tools and concrete object interactions.** Owner specified: “solutions to misteries in the later game will require a particular skill or a specific tool. The Idea was like the old Monkey Island games: use X on Y will make something appear. This is a mechanic for developent later.” Add a later-development mechanic where solving some later-game mysteries requires a particular skill or specific tool, including deliberate interactions with an object that reveal something new. This adopts Q14 C rather than the assistant's recommendation of universally interchangeable routes. Q03's initial skill-matched themes remain a separate, earlier priority.

Do not reinterpret these requirements as cosmetic flavour or guarantee an alternative route that bypasses every requirement. Exact skills, thresholds, tools, targets, results, feedback and protection against impossible combinations still require design and verified engine capabilities. Monkey Island is the gameplay reference for object interaction, not a request to copy its content. No specific recipe, tool or engine hook has been approved. Timing: later development, not implementation during this review.

**DR-20260919-MAPS — brainstorm use of existing annotated maps after the questionnaire.** During a parallel play session, the owner requested a quick brainstorm today about using vanilla annotated maps and their written leads. Schedule it after the decision questions and before the corpse/wreck research, which remains last. The supplied screenshot shows a named writer's final request concerning treasures at an art gallery and a marked location: a concrete reference for how text and geography can suggest an investigation. Treat the map's in-world request as reference content, not an instruction to perform it. The source, availability and technical behavior of the wider vanilla annotated-map corpus must be verified before implementation claims. This adds a brainstorming task, not permission to overwrite vanilla maps or a selected integration design.

**DR-20260919-Q13a — base tracking supports outbound and return journeys.** Owner answered “yes” to assigning base tracking the specific purpose of planning outbound and return journeys and implementing it alongside travel progression. This resolves Q13's open gameplay-purpose question. Retain the request to locate, verify and reuse pz-narrator's existing feature. The port belongs with the travel mechanics, not as standalone information collection during this review. Q12's nearer-player relocation does not itself require a base.

The owner has not yet selected manual versus automatic base designation, multiple-base support or precise route/distance rules. Those remain design details for the travel increment. The current local narrator checkout has not established the remembered feature's implementation; locating it is still required before porting.

**DR-20260919-Q13 — reuse the earlier base feature, with its purpose still under discussion.** Owner selected Q13 B and requested: “In our previouse mod, pz-narrator we had this feature finished... or at least working. Take from there and implement here. but I am questioning why we need to know the base of a player...”. Record the selection and instruction to reuse the prior implementation rather than inventing a duplicate. The owner also explicitly questions its gameplay purpose; explain and settle its use before choosing the port's behavior. No detailed base-dependent mechanic, detection method or implementation timing has been agreed.

Initial source check: the local `ProjectZomboidStories/step1-pzstory-narrator` checkout points to `managementboy/pzstory-narrator` and is at `15ac5dc` (2026-08-24). Its `StateReader.java` observes room conditions and `Delta.java` detects shelter changes, but this inspection did not verify a persistent player-base feature. The feature may be in a later revision or other source; absence from this bounded inspection does not disprove the owner's recollection. Locate and verify the actual feature before porting, and assess its Java implementation boundary against this mod's Lua architecture. No source or game behavior was changed by this inspection.

Purpose assessment, not an owner decision: Q12's closer-to-player relocation can use current position. A known home adds a stable reference for measuring Q05's outward travel and later return journeys; it is useful only if we choose behavior that consumes it. Merely storing a home coordinate does not make a return meaningful. The owner has not approved a home-protection zone, story items inserted at home, automatic home detection, or a prescribed return route by selecting B.

**DR-20260919-Q12 — bring unfound evidence closer after a delay.** Owner added Q12 D: “after a time we can place the Evidence not found in new containers closer to the player. What the player doesnt know never happened.” After a delay, the mod may place still-undiscovered evidence in new containers nearer the player, keeping an unfinished mystery discoverable as the survivor moves. Unknown placement is allowed to change; facts already learned by the player must remain consistent.

This replaces automatic acceptance of P2-Q218's indefinitely untouched leads as the sole policy and reopens the earlier expiry/relocation rules for this behavior. It does not automatically approve the existing three-game-day timing, deletion of discovered evidence, duplicate copies, or a claim that the mystery was solved. The delay, proximity, eligible containers, relocation frequency, handling of the previous physical copy, and definition of player knowledge remain to be designed and tested. In particular, a location named in an already-read clue or an item previously seen but not yet formally noted may already be known; do not equate “not in the organiser” with “unknown”. This question remains open at that boundary.

Q05 still requires later mysteries to involve travel. How closer replacement opportunities preserve meaningful travel must be resolved rather than silently making every distant lead local. The owner selected relocation, not the assistant's proposed voluntary shelving system; shelving is not approved by this answer. Implementation order is pending.

**DR-20260919-Q11 — focus attention on one principal mystery.** Owner selected Q11 A: one principal mystery, with incidental discoveries saved for later. This sets the desired player experience alongside ordinary survival and supports keeping the personal opening understandable. It does not require discarding incidental evidence or removing the continuing web confirmed in Q06.

No numerical spawn interval, session-length target or internal active-case limit was approved. In particular, one principal mystery is not automatically an instruction to set the storage/runtime active-case cap to one; how background discoveries and future mysteries are retained needs design. The current 24-hour gap and four-active-case implementation are not reaffirmed merely by this answer. Timing and detailed pacing remain open.

**DR-20260919-Q10 — recognisable cases and conclusions; later connect clues on the map.** Owner selected Q10 A and added: “the goal would be later paint lines on the Map between the clues that lead to a meaningfull conclusion”. Keep recognisable cases and meaningful conclusions without revealing how many hidden clues remain. Add a later goal of drawing lines on the map between clues that lead to a meaningful conclusion, connecting the investigation's reasoning to its geography.

This permits visible conclusions consistently with Q04 and revises any blanket prohibition on case closure in P2-Q82. It does not approve a hidden-clue checklist. The map-line goal is distinct from the separate player-facing relationship graph still awaiting Q21. Whether lines are drawn manually or automatically, how they distinguish supported connections from tentative ones, how co-located or moved clues are represented, and what writing tools they require remain open. Do not infer those interface rules from the request. Timing is later; implementation is not requested during the questionnaire.

**DR-20260919-Q09a — add a concrete-lead prototype to the new wishlist.** Owner accepted the replacement proposal with “good feedback. add as such”. While reading evidence, the player can record a concrete lead involving a known place, person or reference, optionally adding their own note. They pursue it through normal travel, search and inspection. When subsequently discovered evidence has a supported matching reference, the organiser links the records and states the observed connection. No relevant find leaves the lead unresolved; the player can revise or shelve it.

The game tracks selected subjects and supported relationships rather than interpreting arbitrary free text. It must not manufacture confirmation or change established facts to satisfy a suspicion. The radio/workshop/serial example illustrates the proposed interaction, not a mandatory scenario or a verified engine capability. First prototype one complete interaction and judge whether it helps the player choose an action and notice its result before committing to a general hunch system. This adds the proposal to the wishlist, not immediate implementation or reinstatement of the discarded end-of-case steering system. Its development order remains to be chosen; the explicitly queued corpse/wreck research stays at the end of today's list. This resolves the pending replacement proposal in DR-20260919-Q09.

**DR-20260919-Q09 — the previous hunch system was discarded; a replacement needs a gameplay proposal.** Owner added Q09 D: “the hunch system has been discarded in the current development. I was too difficult to react to. Or do you have a good game play system where we can reccord a hunch and react to it?” Treat the former hunch system as discarded in the reviewed product direction; P4-R113/R119–R123 are not reaffirmed requirements. The owner invited a replacement proposal, not reinstatement or implementation. Q06's connected mysteries do not depend on retaining the former hunch questionnaire.

Checkout discrepancy: the locally fetched source baseline `73e6b62` still includes the question rows in `KnoxApps.lua` and steering in `Generated/Generator.lua`. This shows remaining code in this checkout; it does not establish current live behavior or override the owner's correction. Reconcile retained code with the intended state before any related development. No code removal was requested or performed in this review. The proposed replacement and its inclusion in the wishlist remain undecided.

**DR-20260919-Q08 — reward understanding and worthwhile discovery.** Owner selected Q08 “a and b”: investigation should reward noticing a connection and working something out, and following it somewhere useful or memorable. Both are desired player rewards; the owner did not rank them. The assistant's proposed A-first/B-second ordering is not an approved priority. These rewards guide content and playtest criteria; they do not by themselves approve new loot rewards, guaranteed supplies or a particular destination. Q03's personal-opening priority and Q06's continuity remain intact; not selecting C here does not repeal them.

**DR-20260919-Q07 — keep the discovery loop; research existing corpses and wrecks next.** Owner selected Q07 A and reported “it is very good playing it!” Keep sense → search → recognise → note as the standard discovery loop, including Look it over for a clue already carried. This reaffirms the player-experience direction of P4-R132; it is positive owner playtest feedback, not a blanket technical test result.

The owner also requested improved detection and prioritisation of vanilla corpses already left by the game in houses, explicitly not living zombies, and prioritisation of car wrecks and similar existing scenes. Detailed research must precede development. Add that research to today's work list, at the end after the decision review. The meaning of “and such”, the available corpse/wreck APIs, how to distinguish game-placed corpses from other bodies, usable storage and the eventual selection priorities require investigation; no API or implementation is assumed. This is a request to research and then scope the improvement, not to alter placement immediately.

**DR-20260919-Q06 — mysteries form a continuing web.** Owner selected Q06 B: “yes the mod has developed well into this direction”. Recurring people, organisations and discoveries should connect mysteries into a continuing web, while individual mysteries can have their own answers under Q04. This reaffirms the developed direction of inter-case continuity, including the shared connections and returning entities associated with P4-R91/R96/R113, at the product level. It does not automatically reaffirm every detailed rule of those older decisions: Q09 still reviews how player hunches steer later cases. No single central chapter-based storyline is required by this answer. The owner's positive assessment records confidence in the direction, not a claim that every associated feature has passed testing.

**DR-20260919-Q05 — begin with exploration-led mysteries; require travel later.** Owner selected a staged combination of Q05 A and C: “as placement of new misteries require new locations we can start with A, in the later sections of the game we need to generate misteries that require travel, so also C”. Early mysteries develop around the places the player chooses to explore. Later mysteries must require travel to other locations, proactively giving the player reasons to move. This is part of the version 1.0 investigation direction, not conditional on implementing the possible future full campaign.

The owner cited the need for new placement locations as a reason for progression; this is not a new technical rule that all locations must remain permanently unused. How to determine “later”, travel distances, eligible destinations and the form of navigation remain open. Do not silently substitute fixed survival-hour thresholds, a prescribed town route, exact map waypoints, or voluntary “request a direction” mechanics. Q05 B was not selected as a requirement. This revises the assistant's A-only 1.0 baseline and any reading of Q01 that excludes proactive travel from ordinary-survival investigations. The player remains free to ignore a lead; following a later mystery entails travel.

**DR-20260919-Q04 — local mysteries may have answers; the Knox Event's cause remains unexplained.** Owner selected Q04 B: allow local mysteries, including parts of the survivor's past, to have discoverable answers while leaving the cause of the Knox Event unexplained. This permits supported conclusions about local people and motives as well as objects and places. It does not require every mystery to be solved or every question to receive an answer.

This broadens P4-R109's previous limit of settled facts to objects and places and revises the blanket ambiguity of P1-Q15 for local mysteries. It reaffirms P1-Q22's protection of the Knox Event's cause in the new review. A hunch alone is not proof: discoverable answers must be supported by evidence rather than by the player selecting an interpretation. Details of how evidence establishes a conclusion remain to be designed; this records the permitted narrative outcome.

**DR-20260919-Q03 — prioritise a missing-past opening and mysteries suited to starting skills.** Owner chose Q03 A (every survivor starts with a mystery about how they arrived), then specified: “would be one of the priorities for next development, including prioritising misteries that match the skills at game start (electrician: mistery on things with power or radio etc as an example)”. The personal opening is a priority for the next development work. Early mystery selection should prioritise themes that fit the survivor's skills at game start. An electrician encountering power- or radio-related mysteries illustrates that fit; it is not a required fixed template or an exclusive profession-to-case mapping.

This adopts a personal opening within Q01's investigation layer for ordinary survival; it does not commit version 1.0 to the full future campaign. It replaces the assistant's recommendation to defer the opening. It also establishes the starting-skill relevance requested in Q16; detailed rules about profession versus actual skill levels, alternative routes and skill gates remain to be discussed. Theme prioritisation alone does not imply that other mysteries are forbidden or that solving a mystery requires a particular skill. How much personal history the opening may establish remains unresolved; do not invent a profession, personality or biography beyond this decision. Priority is confirmed; implementation details and acceptance criteria are pending.

**DR-20260919-Q02 — build a new wishlist; review all existing commitments today.** Owner, answering Q02: “D: we are building a new wishlist. all commitments are being revised today”. The review establishes a new wishlist rather than retaining the original feature list as a commitment or merely choosing its implementation order. All prior product and delivery commitments are candidates for revision in this review; none carries forward solely because it was previously approved. Q01 remains the first confirmed answer in the new review. Unanswered topics are pending, not reaffirmed or automatically rejected.

This replaces P1-Q24's blanket promise that every listed capability must eventually be delivered. The old decision history and current implementation remain evidence for discussion, not automatic commitments in the new wishlist. This authorizes revising requirements; it does not by itself authorize removing implemented features or changing game behavior. Further decisions are recorded as the owner answers. If the questionnaire omits an old commitment, that omission does not preserve it by default: add it to the review before treating it as a requirement.

**DR-20260919-Q01 — version 1.0 enriches ordinary survival; a personal campaign is a future option.** Owner, answering Q01 of the [direction questionnaire](docs/design/DIRECTION_REVIEW_2026-09-19.md): “a in version 1.0. b can be an option for the future”. Version 1.0 is an investigation layer that enriches ordinary survival. A survivor-centered campaign through connected investigations across Knox is a possible future option, not a committed follow-on release or a 1.0 acceptance requirement.

This reaffirms the ordinary-survival focus of P1-Q2 and P2-Q208 and qualifies P1-Q1's broad product fantasy for version 1.0. It supersedes any reading of `CAMPAIGN_VISION.md` that makes its full personal campaign the required 1.0 destination. Existing case connections are not removed by this scope decision. Detailed choices about continuity, guidance and pacing remain open in the questionnaire. The assistant's prior Q01 recommendation of a campaign destination was not adopted.

## Product decisions

| ID | Current decision | Rationale |
|---|---|---|
| P1-Q1 | Conspiracy-Files combines investigation/mystery, emergent objectives, roleplay/narrative and a hidden-world conspiracy layer. | Defines the product fantasy. |
| P1-Q2 | The main gap addressed is lack of mystery in normal survival play. | Keeps the module focused. |
| P1-Q3 | Solo is the only designed-for player mode today. | Multiplayer architecture is deferred. |
| P1-Q5 | Entry should be early, escalation gradual, investigation open-ended, with multiple entry points. | Avoids a linear quest structure. |
| P1-Q6 | There is no conventional final completion; the character usually dies without learning the full truth. | Matches Project Zomboid's core philosophy. |
| P1-Q7 | Integrate systemically with vanilla survival rather than replace it. | The conspiracy is an overlay on survival. |
| P1-Q9 | Minimal intrusion: do not rewrite core vanilla mechanics unless a proven requirement forces it. | Compatibility and maintainability. |
| P1-Q15 / P4-R06 | Replay variation means different entry points, placements, timing and details into the same authored conspiracy, not different core truths. | Reconciles low randomness with replay value. |
| P1-Q19 | Target Project Zomboid Build 42. Exact supported minor line must follow verified research. | Build 42 is the development target; patch-exact assumptions are retired. |
| P1-Q20 / P4-R12 | UI/static strings are localisation-ready; dynamic/template-composed story prose is English-first in v1. | Full localisation conflicts with runtime composition. |
| P1-Q21 | Tone: grounded government/military/scientific conspiracy with substantial dark bureaucratic humour. | Core voice. |
| P1-Q22 | Remain canon-compatible, never confirm the Knox Event's true cause, and respect the 1990s setting. | Protects PZ lore and ambiguity. |
| P1-Q23 / P4-R01 | The project may be creatively “never finished,” but development uses finishable milestones beginning with a concrete v0.1 vertical slice. | Prevents permanent pre-production. |
| P1-Q26 | The project owner is the sole final arbiter of whether the experience is good. | No market-fit/community approval requirement. |

## Player-experience decisions

| ID | Current decision | Rationale |
|---|---|---|
| P2-Q4 | The player can manually mark acquired objects/facts as interesting. | Player curiosity is a core input. |
| P2-Q6 / P4-R24 | Track physical evidence with a mod-owned per-instance token where available. Physical availability is mutable and separate from immutable Evidence; unavailable/untracked/conflict states never erase the evidence record. Tracking may resume only when the same uncompromised token is observed exactly once. | T5 proved ModData persistence through normal transitions and confirmed that copied ModData can compromise uniqueness. |
| P2-Q7 | Evidence records may capture rich discovery context, bounded by proven persistence/performance limits. | Context is part of the clue. |
| P2-Q16 | Critical paths use anchor + fallback opportunities; do not intentionally materialise duplicate backup clues as red herrings. | Reliability without clutter/false leads. |
| P2-Q19 | System-derived relevance must be explainable. | Avoid opaque “the system says it matters.” |
| P2-Q20 / P4-R05 | Journal + evidence list are primary through v1. Relationship graph is a v2 feature and must be prototyped separately. | Graph scope is disproportionate for v1. |
| P2-Q26 | No deliberately meaningless authored false leads. | Player time should not be wasted by fake content. |
| P2-Q27 | Discovering evidence does not directly make the world react to player knowledge. | The module observes/interprets more than it scripts reactions. |
| P2-Q31 | Generated/narrated text respects known facts, character knowledge, canon and the 1990s boundary; speculation remains speculation. | Preserves trust. |
| P2-Q36 | Journal chronology is discovery order. | Keeps the survivor's investigation history legible. |
| P2-Q42 / P4-R07 | Timing/system rules remain hidden in normal play; full hidden-state diagnostics are development/debug only. | Diagnostics must not defeat the mystery. |
| P2-Q51/Q52 | Save-affecting gameplay configuration is selected at world creation and stays fixed for that save. | Prevents mid-save story inconsistency. |
| P2-Q54 / P4-R03 | **No-AI is the primary experience.** Runtime AI is optional enhancement only. | Core play cannot depend on API keys/network/cost. |
| P2-Q58/Q59 | Optional AI narrative voice is in-character, funny, irreverent and fatalistic; humour remains present even in grim moments. | Defines the optional narration tone. |
| P2-Q62/Q63 / P4-R13 / P4-R46 | Onboarding remains quiet, in-fiction guidance rather than a quest tutorial, but Help is a separate dark utility window opened from a labeled control on the evidence window's frame; it is not a page or tab of the case record. No objective popup is introduced. | The owner-approved 2026-09-01 UI direction found that instructional copy inside the survivor-authored record breaks immersion. This supersedes only the earlier record-page placement, while preserving the non-quest onboarding intent. See [Issue #30](https://github.com/managementboy/Conspiracy-Files/issues/30). |
| P2-Q69 / P4-R11 | Provenance is stored internally and may be shown with an optional toggle; approved AI-assisted authored assets are normal in-fiction content. | Makes interpretation auditable without cluttering default presentation. |
| P2-Q74-Q78 / P4-R14 | Old material may archive by in-game time and resurface when relevant; re-scoring is event-scoped using affected indexes, never all-pairs polling. | Keeps long investigations usable within the runtime budget. |
| P2-Q81/Q82 | Progression is emergent; the module never announces case/mystery completion. | Avoids turning PZ into a quest game. |
| P2-Q97-Q101 / P4-R39 | Location knowledge may begin as nearby-landmark context and become more precise through physical exploration. Confirmation refines a vague description only when the player satisfies the exact curated binding's room/building/floor/basement/radius/rectangle/zone predicate; entering a building is not a universal confirmation rule. | Preserves P2-Q97-Q99 and P2-Q101's compatible progressive-precision intent while [T8 / Issue #9](https://github.com/managementboy/Conspiracy-Files/issues/9) supersedes P2-Q100's universal building-entry trigger. See `docs/research/T8_LOCATION_ARRIVAL.md`. |
| P2-Q108/Q109 | Preserve conflicting evidence and do not automatically reconcile it. | Contradiction is part of the conspiracy. |
| P2-Q113 / P4-R15 | Identity nodes remain separate even when confirmed as the same person; organisation labels may refine in place. | Alias encounter history is valuable; organisation naming is a different problem. |
| P2-Q118 | Original evidence facts remain immutable when interpretation changes. | Core integrity invariant. |
| P2-Q142 / P4-R29 / P4-R46 | One normal-play global keybind opens the evidence window. A labeled control on the window's frame opens the separate Help utility window (the window, its keybind and its Help were removed, P4-R128); diagnostics use debug tooling. | Minimises mod key conflicts while keeping system instructions outside the survivor-authored record fiction. |
| P2-Q152-Q159 / P4-R08 | **T7 resolves the asset-text model as hybrid:** preserve vanilla inventory/container behaviour and persistent per-instance custom names, keep the authoritative world-specific title/description/body in item ModData, and render the body through the cooperative custom `Inspect` reader. Locked `Literature.customPages` may present deliberately short plain-text page artifacts, but are not the universal store. Never rely on `InventoryItem.description`, raw runtime `printMedia` keys, or key/map/generic native UI for body text. | T7 on Build 42.20.4 proved names, ModData and custom pages persist; descriptions do not, journal markup is literal/size-limited, runtime-shaped print media is unsafe, and non-literature native UIs do not consume the body. See `docs/research/T7_RUNTIME_ITEM_TEXT.md`. |
| P2-Q161-Q163 | Randomness is low and never changes core conspiracy logic, canon-critical facts, major anchor relationships or tone. | Coherence over procedural novelty. |
| P2-Q180/Q181 / P4-R07 | Normal play has no truth-dump diagnostics. Development/debug diagnostics may expose everything read-only. | Protects the central mystery. |
| P2-Q190/Q191 / P4-R10 | Future compatibility separates PZ minor-line support, CF schema/API compatibility and authored content revision. Typo/text-only fixes must not require migrations. | Exact-match versioning is untenable. |
| P2-Q198 / P4-R30 | If migrations return later, keep a minimal migration audit line. | Supportability. |
| P2-Q205-Q207 / P4-R23 | The global >90% retrofit rule is retired. Retrofit is out of v1; any future model is per-candidate and reachability-based. | Global chunk percentage measures the wrong thing. |

## Architecture decisions

| ID | Current decision | Rationale |
|---|---|---|
| P3-Q1 / ADR-0001 | Vanilla Lua first. | Use the platform's normal extension path unless evidence says otherwise. |
| P3-Q2 | Java/ZombieBuddy requires missing API access, measured performance bottleneck, or persistence/data-processing complexity. | Keep the dependency boundary narrow. |
| P3-Q3 | One authoritative core model; UI/diagnostics are projections. | Prevents competing truths. |
| P3-Q4 | Persist minimal canonical state; rebuild caches/indexes. | Controls save size and state drift. |
| P3-Q6 | Typed entity collections + a central relationship store. | Long-term direction for richer domain linkage; see P4-R31 for the v0.1 Dead Air exception. |
| P3-Q7 | Deterministic IDs for authored entities; generated IDs for player/runtime entities. | Stable references without predeclaring player content. |
| P3-Q8 | Central relationship table is canonical; per-entity adjacency is a rebuildable index. | Long-term direction once relationship lifecycle is justified; see P4-R31 for v0.1. |
| P3-Q9 | Domain events propagate meaningful model changes; views can rebuild on open as a safety net. | Event-driven without fragile UI coupling. |
| P3-Q10 | PZ events are boundary inputs translated into internal CF domain events. | Keeps engine code outside the domain core. |
| P4-R16 | Provisional runtime budget ≤2 ms/frame outside explicit initialization; use bounded queued work. | PZ Lua is main-thread constrained. |
| P4-R17 | **Hard v0.1 canonical-state budget: ≤500 KB/save.** | T1's live Build 42.20.4 results retained the target as an evidence-based production ceiling; technically serialisable larger states caused unacceptable synchronous stalls. |
| P4-R18 | Detect multiplayer and disable cleanly until MP support is designed. | Avoid half-running/corrupt state. |
| P4-R19 | Every PZ adapter uses `pcall`; repeated subsystem failures auto-disable that subsystem with concise reporting. | Error containment. |
| P4-R20 | Domain core has zero PZ runtime dependencies and runs in plain Lua 5.1 tests. | Testability. |
| P4-R21 | No vanilla Lua replacement; one `ConspiracyFiles` namespace; cooperative context-menu/event hooks. | Mod compatibility. |
| P4-R31 | **v0.1 Dead Air uses static stable-ID references on authored Assets instead of instantiating or persisting standalone Relationship records.** Re-evaluate a central relationship store only when a second real content set or the v2 graph creates an actual need. | The complete v0.1 story needs references, leads, contradictions and recontextualisation, but none of those relationships have runtime lifecycle in the slice. Content-first minimality wins over pre-building graph-era structure. |
| P4-R32 | Before swapping canonical ModData, recursively validate a staged full replacement: allow only string/number keys and string/number/boolean/plain-table values (nil means absence); reject cycles; reject multiply referenced tables or normalize/copy them so meaning cannot depend on alias identity; reject metatables, functions, userdata, threads and exposed Java objects; enforce maximum depth 64; validate schema and estimated serialized size against P4-R17; swap only after the complete replacement passes, preserving the last known-good canonical root on rejection. | T1 found silent dropping of unsupported values and keys, loss of shared-reference identity, and catastrophic whole-tag loss from a cycle even when `saveGame()` returned; pre-save validation is therefore mandatory. |
| P4-R33 | **Any future general runtime-AI network transport must cross a Java/ZombieBuddy or external-companion boundary and remains outside v0.1.** Vanilla Lua may use DNS and fixed engine services, but it must not be treated as an arbitrary HTTP client. | T9 on Build 42.20.4 found no callable general GET, POST, TLS-control, timeout-control or asynchronous HTTP surface; the sole fixed HTTPS helper blocked `OnTick` for 312 ms and returned no usable response. See `docs/research/T9_NETWORK_EGRESS.md`. |
| P4-R34 | **Future map-wide discovery is a rebuildable, non-persistent, filtered session process. Never synchronously scan the full map in normal play; queue work behind both a conservative record cap below the tested 100-record/frame boundary and an elapsed-time deadline under P4-R16, and retain only candidate facts needed downstream.** v0.1 continues to use curated locations. | T2 on Build 42.20.4 counted 96,414 building/room records; synchronous scans occupied 227–244 ms, 100 records/frame peaked at 2 ms, and a generic rich full-map Lua index retained an observed 90–102 MiB of JVM heap. Persisting or retaining the unfiltered registry is unjustified. See `docs/research/T2_MAP_ENUMERATION_COST.md`. |
| P4-R35 — catalog policy revised by P4-R53; technical findings retained | **Automatic location categorisation is advisory candidate discovery, not authoritative story truth. v0.1 and v1 use curated location catalogs. Future automation is room/area-first, preserves the exact matched-property/rule provenance, supports explicit per-map aliases/overrides, and remains filtered, rebuildable, non-persistent, and dual-bounded under P4-R34. Non-building landmarks require curated/object-specific handling.** | T3 on Build 42.20.4 found strong exact room labels for sampled bookstores and clinics/hospitals, but generic office/medical/communications labels were context-sensitive, a conservative 55-row matrix missed a large police HQ and communications-tower building, and no semantic non-building transmission zone existed. See `docs/research/T3_LOCATION_CATEGORISATION.md`. |
| P4-R36 | **Deferred placement uses `LoadGridsquare` only to enqueue relevant curated bindings plus an `OnGameStart` catch-up; reconciliation scans the exact target for a deterministic item stamp before any add. Stage `placing` under P4-R32, create and stamp the item while detached, add that exact instance, verify count one, then stage `placed`. One target stamp repairs stale intent; more than one becomes `conflict`. Terminal pre-placement target loss becomes `unavailable`; mere unloading remains pending. After `placed`, zero in the original container triggers P4-R37 physical-identity reconciliation, not immediate loss.** | T4 proved exact-once pre-placement behavior; T5 proved a normally moved item is legitimately absent from that container while remaining available elsewhere. See `docs/research/T4_EXACT_ONCE_PLACEMENT.md` and `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`. |
| P4-R37 | **Physical evidence identity is a save-scoped mod-owned string token, unique per intended physical instance and stamped in item ModData before exposure. Engine item IDs are diagnostics only. Placement outcome and physical availability are separate. One token match is `available`; confirmed destruction/complete covered absence is `unavailable`; unknown/unloaded coverage is `unknown`/`untracked`; two or more distinct items with one token are sticky `conflict`. Never automatically delete, choose, restamp or clear a conflict, and copy/transform paths must omit or deliberately replace the token.** | T5 on Build 42.20.4 preserved one token across inventory/container/floor/vehicle/reload and real corpse transfer, while both ModData copy methods created persistent duplicate identities on different engine items. See `docs/research/T5_PHYSICAL_ITEM_IDENTITY.md`. |
| P4-R38 | **The PZ-facing asset adapter writes a persistent custom item name and validated plain ModData fields for resolved title/description/body. The domain/authored body remains authoritative and is never derived back from presentation pages. The custom `Inspect` reader is the default world-specific body surface; optional locked Literature pages are generated projections for short plain-text artifacts only.** | T7 separated durable storage from presentation and found no safe universal native body carrier. See `docs/research/T7_RUNTIME_ITEM_TEXT.md`. |
| P4-R39 | **Curated location arrival uses bounded, debounced state sampling as its authority, not `OnPlayerMove` alone. At approximately 4 Hz, evaluate only referenced bindings, require two consecutive samples for the same logical square, apply exact binding-specific room/building/floor/basement/radius/rectangle/zone predicates, and persist a sticky confirmed location ID before emitting one domain event.** `OnPlayerMove` may only be an opportunistic wake-up. | T8 observed zero `OnPlayerMove` callbacks for scripted teleports, while 15-tick sampling confirmed the reached room/building/floor/outdoor/zone matrix in 248–344 ms with no false positives in the clean core and no duplicates on leave/re-entry. See `docs/research/T8_LOCATION_ARRIVAL.md`. |
| P4-R40 — superseded as specified by P4-R48/R49 | **If D1 was durably placed but remained undiscovered and later becomes conclusively `unavailable` only after T5/P4-R37 reconciliation, D2 may activate once as the fallback introduction.** Mere unloading, absence from D1's original container, `unknown`, `untracked` or `conflict` does not qualify. D1 never respawns. | Preserves a viable introduction after confirmed physical loss without turning incomplete identity coverage into a duplicate-clue trigger. |
| P4-R41 — superseded as specified by P4-R48/R49 | **Dead Air targets a regional journey of roughly 1,000–1,600 straight-line tiles between its two curated story locations, subject to live route and access verification.** | The two-sided investigation should require meaningful travel while remaining a regional survival journey rather than a map-spanning expedition. |
| P4-R42 — superseded as specified by P4-R48/R49 | **Prefer a medium local police station over the large headquarters. Candidate P2 at `(13206,3073)` is the first police site to inspect; the headquarters remains fallback if P2 lacks credible property/records containers.** This is a verification priority, not a final binding. | The local-station scale better fits the story, but physical container and access plausibility must decide the binding in live Build 42. |
| P4-R43 — superseded as specified by P4-R48/R49 | **Candidate R2 at `(13549,1572)`, the compact communications/news facility with a service garage, is the first relay site to inspect. It is provisionally paired with P2 at roughly 1,538 straight-line tiles and must pass live newsroom-character, access, boundary and container-plausibility checks.** This is not a final binding. | T3's checked-in live candidate matrix supplies enough provenance to prioritize inspection, but not enough evidence to bind either story Location. |
| P4-R44 | **T10 and any rerun use only the manual-GUI procedure.** No helper/injected agent, quarantine restoration, antivirus exclusion or bypass, alternate injection, synthetic input or computer control is permitted. The project owner manually launches/enters the disposable save and performs right-clicks while the pure-Lua probe only logs callbacks/assertions. | The completed manual run produced no security alert and did not reintroduce the abandoned injected-helper route; the earlier `runner.exe` alert provenance remains unknown. |
| P4-R45 | **The supported cooperative asset-action surface is `OnFillInventoryObjectContextMenu` for player inventory and Ground/loot inventory panes.** Add privately keyed `Inspect`/`Mark Interesting` actions after vanilla construction, remove only stored mod callback identities, normalize/deduplicate selection, revalidate at activation, disable ambiguous/unowned/already-marked intent and wrap the boundary in `pcall`. Do not promise direct-world-item right-click actions. | T10's live manual matrix preserved vanilla and another additive listener, reached Inspect once and Mark intent once, persisted the disabled Mark state across reload, and contained injected faults. Direct photo-sprite right-click fired the world event with zero inventory subjects, while the Ground pane worked. See `docs/research/T10_COOPERATIVE_INSPECT.md`. |

## Delivery/scope decisions

| ID | Current decision | Rationale |
|---|---|---|
| P4-R01 — historical fixture scope; see P4-R53 | v0.1 = one hand-authored thread, 6 documents, 3 identities, 1 organisation, 2 curated locations, 1 anchor + 1 fallback, journal + evidence list, manual Mark Interesting. | Smallest end-to-end proof of the experience. |
| P4-R02 / P4-R26 | Content precedes generic schema; project owner writes/approves canonical content, with AI only assisting drafts. **Approval part removed by P4-R97 (2026-09-14):** AI-written text ships without a separate approval step. | Avoid schema-first design. |
| P4-R04 | Retrofit, migration and external content packs are not in v1. | De-risk core first. |
| P4-R05/P4-R25 | Graph is v2; prototype separately with provisional 250 visible-node cap. | Biggest UI risk. |
| P4-R22 | Death recap has a deterministic no-AI fallback; optional AI may enhance it later. | Death payoff cannot depend on network success. |
| P4-R27 | Three concrete reward moments are defined in `docs/requirements/PLAYER_MOMENTS.md`. | Ensures the mod rewards the player without completion banners. |
| P4-R28 | “Long inactivity” means a real-world gap between play sessions. | It is a return-player memory aid, not an in-world timer. |

## Takeover reconciliation — 2026-09-05

- **P4-R47 — evidence window input:** (window and binding removed, P4-R128) the owner directed native X close controls and one configurable open/close binding for the window, with Escape reserved for the game's options flow. Do not assign a fixed function key. This supersedes the Escape-close expectation in earlier T12/browser material; controller mapping remains unverified. Direct owner instruction: 2026-09-05 11:18:36 UTC, archived in [owner provenance](docs/management/evidence/2026-09-05-takeover/owner-provenance.json).
- **Content approval record:** `dead-air-r1` was owner-approved on 2026-09-05 with explanatory context, followed by a required D1/D4 timing correction. Approval is not pending; delivery/disclosure inconsistencies are tracked under Issue #26 and the [takeover audit](docs/management/PM_TAKEOVER_AUDIT_2026-09-05.md).
- **Historical scope reconciliation (resolved by P4-R48 below):** the owner explicitly selected a Muldraugh test route and bounded per-save randomized placement on 2026-09-04. The current takeover still specifies two locations and P2/R2. Preserve both records; do not infer a final three-location shipping approval or silently supersede P4-R01/R40/R41–R43. Issue #28/#30 must settle route, motel membership and the relationship between order-independent evidence and fallback opportunity.

## Remaining conditional spike

- **T6:** never-loaded chunk detection, only if retrofit returns.

See GitHub issues #1–#10 and `docs/research/SPIKE_TEMPLATE.md`.

## Approved correction decisions — 2026-09-05

The owner directed “I want to follow all your recommendations” after the takeover audit and explicitly answered “Use those three recommendations” for the police-arrival, availability-language and death-recap choices in this task. Prior Muldraugh direction is archived in the takeover owner-provenance record.

- **P4-R48 — two-site Muldraugh candidate:** retain exactly two story locations, use the owner-selected Muldraugh electronics/relay site and police station, and return D4 to the relay location. The motel is excluded. This supersedes P4-R42/R43's P2/R2 inspection priority and P4-R41's 1,000–1,600-tile target for this candidate. The provisional centres are approximately 806 tiles apart; route/access plausibility and exact container/arrival predicates still require owner observation. P4-R01's two-location limit stands. Preserve the older P2/R2 checkpoint as history; do not resume it by default.
- **P4-R49 — entry opportunity and physical eligibility:** all six distinct documents and the optional key are eligible at their own locations regardless of discovery order. D2 is not a duplicate copy of D1 and is not withheld until D1 is lost. Either can introduce the thread once; the first eligible D1/D2 discovery records anchor/fallback selection. Conclusive undiscovered D1 loss can select the fallback opportunity; mere absence, unknown coverage or conflict cannot. No D1 respawn. This narrows P4-R40 to fallback introduction bookkeeping, superseding any implied delayed D2 materialisation.
- **P4-R50 — ordinary police arrival:** police-property confirmation is an ordinary journal entry. Only the existing eligible Major event classes remain.
- **P4-R51 — availability copy:** normal players see plain-language consequences; internal available/unknown/untracked/unavailable/conflict identifiers remain diagnostic state. Immutable Evidence survives physical loss or conflict.
- **P4-R52 — death recap deferred:** no death recap in v0.1. Actual death/corpse/save/reload integrity under E10 remains required; deferring prose does not waive lifecycle acceptance.
- **Implementation boundary:** the corrected aggregate schema uses one validated canonical root. Incompatible development saves are refused without migration or overwrite. T11 and T12 wrappers exercise shared candidate modules with explicit differences recorded in their runbooks. Offline tests and source inspection do not accept their live gates.

## Product direction restored — 2026-09-05

**P4-R53 — dynamic investigations and automatic location selection.** The owner clarified that the intended mod uses a large database of possible locations and dynamically generates conspiracies. Manual owner approval of individual places is not a product requirement. The owner approved a bounded roadmap/prototype-specification increment; this does not authorize claiming that generation already exists.

- Dead Air and its fixed Muldraugh bindings remain regression/test fixtures, not the final product model. P4-R01 and P4-R48's prescribed-location scope no longer define the active delivery destination or require an owner plausibility tour.
- This supersedes P4-R35's curated-only v1 catalog policy, not T3's measured limitations. Catalog entries may come from filtered map metadata and explicit capability rules. Uncertain categories remain uncertain; automation cannot invent a police station or radio mast from a generic office label.
- An automatically selected, technically eligible candidate does not require per-place owner approval. Automated predicates must validate location/container suitability for the template; the owner evaluates the generated investigation through play. Runtime placement, boundaries, persistence and performance still require technical verification.
- Authored building blocks and constraints may generate different case facts, people, documents and connections for different new saves. Facts are consistent and fixed within a committed case. This extends earlier low-randomness/static-story rulings for the new prototype; it does not permit changing established evidence or contradicting PZ canon.
- No-AI remains the complete primary experience. No graph, external content-pack platform, retrofit, migrations or multiplayer is added by this correction.
- The next work increment is the specification in docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md. Implementation follows separately in bounded steps; the existing hard-coded registries cannot be relabeled as a generator.

**CPU clarification:** the owner reported that the observed CPU strain was unrelated to the mod. Remove that incident as a project blocker. This is an owner clarification, not a measured performance pass; the existing runtime budget and live performance criterion remain.

## Initial location sources — 2026-09-05

**P4-R54 — owner nominations plus technical enrichment:** the owner will supply 12 interesting places in Muldraugh. Use those as the prototype's real candidate set, with stable provenance, supplemented/enriched by existing map research as needed. This updates P4-R53's initial research-only catalog assumption, not its automatic-selection goal. Nominations do not establish observed storage or require owner inspection of containers. Synthetic test records remain separate and are ineligible by default. See docs/design/MULDRAUGH_LOCATION_INTAKE.md.

## Investigation reach progression — 2026-09-05

**P4-R55 — new conspiracy range grows with character survival time.** Owner approved these initial playtest defaults to keep early investigations close while the player establishes survival:

| Completed days survived by the character | Maximum radius for newly generated conspiracies |
|---|---:|
| 0–3 | 250 tiles |
| 4–10 | 500 tiles |
| 11–20 | 1,000 tiles |
| 21+ | 1,500 tiles |

- Use character survival duration, not real-world time or the world's calendar age. Tier boundaries are 4, 11 and 21 completed days survived.
- Apply the radius when generating a new case. Existing conspiracies retain their committed locations and facts as time advances.
- If the allowed area has few suitable buildings, accept less category variety. Never silently expand beyond the early-game limit. Required technical suitability and distinct-site constraints still apply; if no valid case can be formed, defer generation.
- These values are approved starting defaults, subject to playtesting, not proven travel or difficulty measurements.
- The current manual T3 probe's explicit radius argument remains a development control; this decision records intended gameplay behavior and does not claim runtime progression is implemented.
- The radius anchor for later cases (original spawn, current position or another reference) remains an implementation/design choice to resolve separately; this decision approves the distance progression only.

See [Generated investigation prototype](docs/design/GENERATED_INVESTIGATION_PROTOTYPE.md#investigation-reach-progression).

**P4-R55 implementation follow-up:** pure reach policy, `Generator.generateNew` filtering and automatic survival-based T3 default implemented. Boundary/scarcity/restoration tests pass (51 suite tests plus focused probe checks). Live automatic-radius verification and full gameplay integration remain pending; see generator design.

## Nearby clue assistance — 2026-09-05

**P4-R56 — proximity text:** owner requested varied overhead text when one tile from a clue. Implemented five tentative phrases using native Say text, same-floor one-tile proximity including diagonals, only for undiscovered physically present generated documents. Implementation defaults: 60-second global cooldown, one hint per container visit, rearm after moving more than three tiles away. No discovery is granted and no clue facts are revealed. Missing, duplicate or conflicted items remain silent. Tests pass; live display awaits owner check.

## Player-facing location references — 2026-09-05

**P4-R57 — addresses and recognizable place names, not debug coordinates.** Owner identified that ordinary players cannot use coordinate-based document leads. Player-facing generated documents, journal entries and leads must identify destinations through verified place names or real available addresses. Raw coordinates remain internal placement data and development diagnostics only.

- T3 currently supplies room labels and geometry; the current extraction does not establish street names, house numbers or business signage. Do not invent an address or promote a generic office label into a named institution.
- Prefer a verified place name/address. Where those are unavailable, a grounded landmark/directional description may provide a fallback only if it distinguishes the destination sufficiently for normal play. Generic descriptions shared by several nearby buildings are not a solved lead.
- Naming requires provenance and must remain consistent across all documents referencing the same location. Technical IDs and exact container coordinates stay separate from presentation.
- Existing saved case facts/text remain immutable. Any presentation correction for the active prototype must preserve the referenced location and case identity; do not silently regenerate the case or rewrite canonical evidence.
- The current coordinate-heavy G2 prose is an acknowledged prototype defect. A naming/resolution layer and owner navigation check are required before ordinary-player playability can be accepted. This decision records the requirement; no real-address database or naming implementation is claimed.

## Town addressing baseline and player Help — 2026-09-05

**P4-R58 — stable town baselines with player-visible addressing rules.** Owner approved using Main Street and/or First Street as town numbering baselines where suitable, and a fixed named alternative baseline where they are absent or unsuitable. The selected baseline must be documented for each town and explained in player Help. Do not infer that every town has those streets from the preliminary spawn-proximity check.

- Implement the agreed fictional mod address system: fixed town baselines, increasing block ranges away from the baseline, hundred-number ranges for successive defined street blocks, odd/even numbers on opposite sides, stable building addresses independent of case seed and candidate selection. Detached sheds/garages share their main property's address where that relationship is established.
- Adopt the previously researched Louisville parity as the mod convention: north side odd/south side even on east-west roads; east side odd/west side even on north-south roads. Curved roads and ambiguous frontage need explicit deterministic rules before assignment.
- This supersedes P4-R57's prohibition on fictional house numbers only for the explicitly labelled, consistent mod addressing system. Do not claim these are real-world or original vanilla addresses. Street names continue to require map provenance.
- Numbers must be visible to ordinary players at buildings or on their map; a number in a document alone is insufficient. Help must explain how to read them and identify the chosen baseline for supported towns.
- Town baseline choices, full building/frontage indexing and visible address display remain to be implemented. The current Help describes this as planned, rather than pretending numbered buildings already exist. Existing case identities and discoveries remain unchanged.

## Discovery markers and knowledge-limited house labels — 2026-09-05

**P4-R59 — map annotations follow player knowledge.** Owner requests a map marker for each found clue at its finding location, plus house-number labels only for buildings already exposed by the game's map knowledge. Reading a town map should allow labels throughout the area that map actually reveals.

- Capture the actual finding/source location; do not substitute the player's later reading position. Do not automatically mark all placement targets or disclose unfound evidence. Where original finding location is unavailable, do not invent it.
- Clue markers and journal knowledge persist after dropping the physical item and across save/reload. Repeated inspection does not duplicate markers. Multiple clues at one location remain individually identifiable without unreadable stacked labels.
- Assign house addresses independently of exploration and conspiracy selection; reveal their labels according to native map knowledge. House labels do not reveal clue presence.
- Follow the area actually revealed by opening/reading a paper map, not merely possessing an item named Muldraugh Map. Do not reveal additional terrain or buildings to make numbering easier. Player annotations must be preserved.
- Installed ISMap:initMapData calls MapUtils.revealKnownArea, which uses WorldMapVisited:setKnownInSquares for the map's bounds. Map symbol APIs are present. Exact known-area read/masking granularity and annotation persistence still require implementation and live verification; these capabilities are not accepted from source inspection alone.
- This is an approved requirement, not a claim that house numbering or map annotations are already implemented. P4-R58 baseline/address assignment work remains prerequisite for house labels.

## Writing tools gate clue-map annotations — 2026-09-05

**P4-R60 — record knowledge immediately; annotate the map only with a writing tool.** Owner requires automatic clue markers to depend on a suitable pen/pencil in the player's inventory. Implementation may follow with the clue-marker increment; this is not implemented in the address trial.

- Journal discovery and captured actual finding location persist independently of writing-tool possession. Existing map marks remain when the tool is removed.
- Without a qualifying tool, queue known clues for map annotation; never lose or relocate their original finding positions.
- On acquiring a qualifying tool, catch up all known, unmarked clues with valid recorded finding locations. Removing the tool pauses further writing; acquiring one again resumes the backlog.
- Catch-up is idempotent across repeated inventory changes and save/reload. No duplicate markers and no disclosure of undiscovered clues. Missing historical finding locations are not guessed from the current player position.
- Match the installed vanilla game's writing-tool eligibility/inventory handling after source verification; do not assume an exhaustive item list yet. Use bounded updates rather than continuous full inventory/world scans.
- This requirement concerns clue annotations. Knowledge-limited house-address labels remain map information governed by P4-R59.
- Explain the writing-tool requirement and deferred catch-up in player Help when implemented.

## Economical task delegation — 2026-09-05

**P4-R61 — owner-approved focused worker strategy.** Primary handles PM, integration and difficult bugs; routine independent work goes to one short-context worker at a time, normally Terra Low (Luna for simpler scopes). Higher Astra effort is reserved for demanding reviews; Astra Low is preferred for routine primary work when explicitly set through the app. Do not claim self-reconfiguration. Delegate compact scopes without full-history forks, share authoritative project files, test once at the proper level, and review before integration. All tasks consume the shared allowance; no guaranteed savings. See AGENTS.md for operating instructions. Owner authorized recording and immediately applying this strategy.


## Successive investigations and story tone — 2026-09-05

**P4-R62 — owner accepted all three offered recommendations.** Later investigations use the player's current position at creation as their reach anchor. Availability uses a minimum in-game time gap and a small concurrent-case cap, without requiring completion of a previous case. Authored conspiracies keep a grounded, ambiguous cover-up tone. Existing cases keep their committed anchors, reach, places and facts.

The owner accepted the policy directions, not specific numerical gap/cap values or individual draft prose. Offline prototypes may take explicit tunable policy inputs; do not claim an unoffered number is owner-approved. Retention must not silently erase learned evidence. Native integration and individual new story drafts retain their existing review/playtest gates.

## Pre-1.0 save compatibility — 2026-09-06

**P4-R63 — no backwards compatibility obligation before version 1.0.** Owner explicitly removes old-save compatibility from the design requirements until the mod reaches 1.0. Breaking data/schema changes may require a fresh save. Do not build or retain fallback readers, upgrade adapters, migrations or compatibility tests solely to support saves created by older mod versions. Prefer one current authoritative schema and simpler current-build paths.

This supersedes earlier requirements to preserve cross-version generated saves or retain a legacy canonical fallback in the successive-case design. Historical work and its test evidence remain history; existing code need not be ripped out merely to record this policy, but subsequent storage changes may remove the compatibility scaffolding. Cross-version preservation is no longer a delivery gate.

Save/reload integrity within the current supported build, failed-write protection, immutable evidence within an ongoing supported save, validation, bounded save budgets and duplicate prevention still apply. State plainly when a build requires a fresh save. Do not silently reset, erase or reinterpret user saves. This decision is not authorization to delete saves, and does not itself define the eventual 1.0 compatibility contract.

## Development allowance reserve update — 2026-09-06
Owner lowers the reserve from 30% to 25% weekly allowance remaining. Checkpoint and stop development at 75% used. This overrides previous reserve thresholds in task handoffs; economical sequential development continues. No authorization to consume reset credits or resume paused automations.
## Richer story and varied physical evidence — 2026-09-06

**P4-R64 — owner requests the next playable expansion.** Evidence descriptions must be more substantive: explain what was found, add story and context, and offer what the survivor could infer. Keep observations separate from tentative interpretation; preserve grounded ambiguity and avoid spoilers from undiscovered evidence. This extends prose and content, not authoritative inference of an unproven conspiracy.

The next playable test must include keys, diaries, notebooks and newspaper clippings, expanding beyond dispatch copies/files toward further conspiracy-related evidence. Use distinct appropriate physical item forms and story roles; maintain established inspection, discovery/source capture, case record and map-marker behavior. Proposed additional forms are photos, receipts, annotated maps, letters, logs and recordings, subject to verified engine support and story usefulness. Working locks or audio playback are not automatically promised by adding keys or recordings. Implementation/testing plan: docs/management/NEXT_PLAYABLE_MILESTONE.md. These are requirements, not a claim of completed development.

## Development allowance reserve update — 2026-09-06, latest
Owner now sets the stop threshold to 5% weekly allowance remaining (95% used), superseding the previous 25% reserve and all earlier thresholds. Continue economical sequential development and checkpoint at this threshold. No reset credits or paused automation use is authorized.

## Corpse identities and observed cards — 2026-09-06

**P4-R65 — owner-approved identity/story direction.** For the first conspiracy, a story may assign a spawned character an occupation independently of clothing; an electrician need not wear work clothes. Assigned occupation is authored world data, not a claim that a probe discovered a reliable native occupation. Commit story facts consistently; do not overwrite established case facts when sampling characters again.

Corpses are candidate locations for planting conspiracy evidence and can provide the opening discovery. Track/revalidate suitable loaded corpse candidates internally before any future placement; no automatic journal revelation from candidate enumeration. The current known probe candidate is at10792,10287,0 (descriptor name Shauna Strickland); this is an encounter location, not a home address or proof of card ownership. Corpse placement itself remains a separate implementation slice.

Generate a journal observation when the player actually sees an ID or credit card on a corpse or inside an opened container, including a wallet. Seeing a closed wallet or merely approaching a corpse does not reveal the cards inside it. No pickup or right-click is required if the card is visibly listed. Record only information exposed by the observed item and its source; a card's name does not by itself establish the corpse's identity. Reopening, transferring and save/reload must not duplicate the same observation. Hidden descriptor names/occupations and unopened nested contents must not leak into journal knowledge. Current-build validation and shared save budget still apply.

## Automatic start and named tickets — 2026-09-06

**P4-R66 — owner requests automatic successive investigations now.** The first investigation's opening evidence must be placed inside the house the player currently occupies, not a random nearby building. If indoors/eligible storage is unavailable, wait rather than silently choosing another building. Later cases appear automatically near the player's current position under P4-R62 timing/reach/cap policy; no console commands required for the gameplay flow. Keep learned cases intact and persist timing with case creation. Numeric test pacing remains a configurable implementation choice, not a previously approved owner number.

Owner notes parking and speeding tickets also carry names associated with zombies/corpses. Include visible named tickets as identity-document observations under P4-R65's same knowledge gate; capture displayed labels, not unseen descriptor facts. Installed item scripts verify Base.ParkingTicket and Base.SpeedingTicket; actual owner-name behavior remains subject to native item testing.

Owner adds business cards as another possible name source. Installed literature.txt declares Base.BusinessCard, Base.BusinessCard_Personal and Base.BusinessCard_Nolans. Include these in visible-document observations; the card label is evidence of what was seen, not automatic proof of the corpse's name or profession.

Owner requests native-like evidence window memory (the window was removed, P4-R128; the organiser remembers its own size, P4-R94): remember placement/size and whether left open or closed. Implement per-save player UI preferences, including active Journal/Evidence tab. Capture layout while open, restore after runtime readiness, and do not carry another save's window state across loads.

**P4-R67 — spread clues across containers.** Owner rejects discovering several investigation clues together in one container. Newly generated investigations assign each clue to a different physical container, retaining the required first-house opening. If there are insufficient suitable containers, defer creation instead of silently stacking clues. Already committed placements are not reshuffled or duplicated. Native acceptance remains required.

**P4-R68 — variable evidence and local people.** Owner explicitly rejects seven fixed clues and fixed evidence types. Earlier object examples were suggestions, not a mandatory checklist. Audit installed game objects for mystery roles and actual usable mechanics; choose evidence count/types around each coherent mystery, required connections and available placements. No new numerical min/max approved yet. The three/four building split is an implementation limitation to remove with this change, not a design requirement.

Nearby zombie/corpse names and occupations should participate in generated mysteries. Reuse available existing names; occupations may be authored consistently per P4-R65 where native profession is default/unknown. Keep chosen world facts stable and reveal them only through observed evidence. Clues may begin without a known person and acquire inferred connections later. Owner example: unnamed clue in101 Main St; later a key found on a named zombie actually opens that house, providing a connection from person to place and earlier clue. Record observed key provenance, verified key/lock relationship, and derived interpretation separately. Access supports association, not necessarily residence, ownership or authorship. Preserve original clue text and discovery context; add new journal interpretation rather than retrospectively inventing a name on the original object. Implement/test functioning native key relationship before claiming it works.

## The mod may change what the world already contains — 2026-09-11

**Decision (owner):** "we have broken that rule a lot since we started
developing this mod. So remove that constraint from our project."

**Withdrawn:** "never rewrite what a player's world already contains" - the rule
that the mod only ever placed its own evidence and left vanilla loot alone.

**Why it no longer held.** It had already been broken, deliberately, several
times: a nearby zombie is given the case person's name and an ID card
(CasePerson), placed evidence sets its own display category, and the survivor's
evidence album (called Papers until P4-R127) is a vanilla photo album renamed. Each was the right call for the
investigation, and a rule that is routinely broken for good reasons is not a
rule; it is a trap for whoever reads it next.

**What this allows.** Filling an empty vanilla diary with a looted person's
story; naming and equipping zombies; changing vanilla items where that serves a
case.

**What still holds, and is a different rule.** Never delete, reset or rewrite a
player's SAVE, and never do it for them. That concerns their save file and is
unaffected by this decision.

**The cost, stated so it is chosen rather than forgotten.** Once the mod edits
vanilla items, a player can no longer assume that anything they find is simply
the game's. For an investigation mod that ambiguity is arguably a feature. It
does mean the case record's own restraint matters more, not less: an edited item
may still only ever say what it says, never what it proves.

## Linux auto-testing, commits and where decisions live — 2026-09-11

**P4-R69 — Claude tests in the real game on the Linux development machine.**
Owner: "auto-testing by you (claude) can be done on the machine", and asked
whether those runs count as evidence: "absolutely". Claude may launch and drive
the game unattended there with `tools/autotest/` (see
`docs/management/LINUX_AUTOTEST.md`), and the reports in
`docs/management/evidence/linux-autotest/` are evidence. This narrows "no live
game interaction while the owner is away" to the Windows play machine. Attended
Windows sessions keep their role: how the game feels, Workshop delivery, and
owner acceptance.

**P4-R70 — the Linux PC is dedicated to this mod.** Owner: "this PC is only for
development of this mod. I could not care less if you use the display." Claude
may use its screen, pointer and focus during test runs, and tune its game
settings for testing (speed and screenshot readability over frame rate; owner:
"fps should not be as important to you as for a real player"). The original
settings are kept in `~/Zomboid/options.ini.before-autotest`.

**P4-R71 — commit without asking.** Owner: "always auto commit when you think it
is appropriate." Claude commits finished, verified work on the current branch
without asking first. Pushing, merging and publishing keep their existing rules.

**P4-R72 — owner decisions are stored in the project.** Owner: "store my
decisions in our project." Decisions go into this file (and a pointer into
`AGENTS.md` where agents must see them), so every agent and session reads the
same record, not one assistant's private memory.

## Weekend autonomy — 2026-09-11

**P4-R73 — keep working until the task list is done.** Owner: "always continue
with tasks until you finish them", "dont wait for my confirmation on continuing
testing", "you have the whole weekend to work through all possible scenarios".
Claude works through the test catalogue (`docs/management/TEST_CATALOGUE.md`)
without asking between steps, minds token usage, and splits work into
subagents/threads where that is cheaper or faster.

**P4-R74 — defects found by tests are fixed.** Owner chose: fix, re-test with
the same test, commit. Questions of game design or tone are not decided by
Claude; they are written up for the owner.

**P4-R75 — push the branch.** Claude pushes `integration/v0.1-corrected-candidate`
after each verified batch. No merges to `main`. *(Replaced 2026-09-15 by
P4-R117: all work goes into `main`.)*

**P4-R76 — publish passing builds.** A build that passes the Linux boot check
may be published to the unlisted Workshop item (version bumped each time), so
the Windows play machine has the latest build.

## Old cases after a rules change — 2026-09-11

**P4-R77 — no compatibility for cases made under older rules.** Every change
to how cases are built bumps the generator revision, and a save's case made
under an earlier revision is set aside on load (not deleted). Claude proposed
keeping old cases playable; owner: "no, all new". A playtest after a rules
change starts a fresh game. Do not build revision compatibility, and do not
offer it again; say plainly when an update needs a new game.

## Evidence for a settled fact — 2026-09-12

**P4-R78 — a settled fact cites a command or an archived log, never a
recollection.** Anything written down as established about the engine, a build
or a live result must carry a citation that another session can check: a
command that can be re-run (`tools/autotest/...`, `tools/kahlua/run.sh`,
`lua5.1 test/...`), or a file under `docs/management/evidence/` or
`dev/playtest-logs/`. Attribution to a person is not a citation. If only a
recollection exists, write it as a claim to test and say what would settle it;
do not build on it. Owner endorsed the rule as stated after a task handoff
asserted an in-game confirmation the owner did not recall giving — the claim
happened to be true, which is exactly why it went unchallenged.

## Reading surfaces — 2026-09-12

Answers to the three open calls at the foot of
`docs/design/READING_SURFACES.md`, asked and answered in one sitting.

**P4-R79 — the device replaces the window.** Owner chose "device replaces the
window" over the handoff's own assumption that the window becomes a desk. There
is one reading surface and the survivor carries it. The desk/board surface in
that document's Step 3 is therefore **not** to be built, and the staging drops
to: projection surface argument, the evidence album (then Papers) as the surface, then the device as a
real item. Consequence to hold onto: a single surface can never lay the case out
larger than what the survivor is holding, so anything the old window could only
show at 1000x680 must survive the move or be dropped on purpose, not by
accident.

**P4-R80 — losing the device costs convenience, never the case.** The ledger
stays the record; the device is a reader. Combined with P4-R79 this creates an
obligation, because with one surface a lost device is a mod the player cannot
read: **there must always be a way back to reading.** Whatever form that takes
(a replaceable common item, a craftable, a spawn guarantee) is unsettled and is
flagged for the owner before the device becomes a real item. Not built on the
assumption that it resolves itself.

**P4-R81 — a heading is earned by a return, not by a count.** WP6 wins over
WP2 where they disagree. A place earns a heading only when the player comes
back to it having learned something since the last visit; two finds in one
sweep earn nothing. Consequence accepted deliberately: the place view is flat
for the first hour of a save, so it must say so in the survivor's voice rather
than render as an empty panel.

## Knox.OS, the four open calls — 2026-09-13

The four decisions left for the owner at the foot of
`docs/management/HANDOFF_2026-09-13.md`, asked and answered in one sitting.
Two changed nothing; two changed the build.

**P4-R82 — the type stays at 23 rows.** The device screen is 225 x 297 and the
type is sized for the original 160-wide canvas, so it renders at roughly 71% of
the proportion the design intends and reads small. Three ways out were put to
the owner — redraw the glass to 320 wide so doubled type lands pixel-perfect,
double the type inside the current art (23 rows falls to 10), or scale by ~1.4
to fit exactly and accept a soft pixel font. Owner chose **none of them: keep
23 rows**. Information density beats legibility here. Consequence to hold onto:
this is a known, accepted readability cost, not an oversight — do not "fix" it
in a later pass, and if the case art is ever redrawn for another reason, the
320-wide option becomes free and should be raised again.

**P4-R83 — a new survivor is still issued an organiser.** Considered too
generous now that finding one is the continuity mechanic, and it was put to the
owner alongside stopping the issue outright, or issuing it switched off and
flat. Owner chose to **keep issuing at spawn, unchanged**. A survivor who can
never read the mod in their first hour is the worse failure. `O.give` is already
idempotent per player, so this stays exactly as built.

**P4-R84 — the lamp stays, and now costs battery.** Held POWER lights the glass
as a real Palm's backlight did. Owner kept it but rejected it being a free
toggle: it now drains the cell **on top of** the engine's own drain for the
device being on. A full charge, lamp alone, lasts `O.LAMP_HOURS` = 10 in-game
hours, and the lamp switches itself off when the cell goes flat. Charged
against in-game time rather than ticks, and the drain function returns
immediately when the lamp is not lit, so this does not reintroduce the
per-tick cost stripped out on 2026-09-12.

**P4-R85 — the clock is removed.** This reverses the 2026-09-12 ruling recorded
in `OrganiserScreen.lua`, which argued a digital organiser plausibly has a
clock. Owner ruled the vanilla rule wins: knowing the time costs you a watch,
and a reading device must not quietly buy that slot back. The launcher header
now carries only the battery and the category. `K.status` keeps its `time`
parameter and skips it when nil, so the header can carry a clock again if this
is ever reversed.

## A dead battery costs access, never data — 2026-09-13

**P4-R86 — the organiser never loses the survivor's writing.** The first cut
of volatile memory did what the hardware really did: a flat cell cleared the
machine's notes and to-dos for good, because a Palm's RAM was battery-backed
and a dead cell was a dead cell. The owner reversed it on sight. A dead battery
now takes the stores **offline** — a flat machine shows you nothing — and a
fresh cell brings every entry back, with the boot screen saying "Restoring from
backup ...".

The reasoning is that the realism worth having is the interruption, not the
punishment. Losing an evening's notes to a battery is the kind of authenticity
that makes people stop playing, and it buys nothing the temporary blackout does
not already buy.

Consequence, and the reason this is written down rather than just fixed: the
destructive version is **not cancelled, it is deferred**. It becomes a hard
mode once the mod has a PC to sync the organiser to, because only then is
losing your data the consequence of a choice — you did not sync — rather than
of a battery the player never saw coming. See `docs/design/KNOX_OS.md`.

This extends P4-R80 rather than replacing it. That decision said losing the
device costs convenience, never the case. This says flattening the device does
not even cost the convenience permanently.

## The Fieldnote keys, and the wear — 2026-09-13

**P4-R87 — two keys do the work, two stay blank on purpose.** The Fieldnote
housing puts two big keys left of the rocker and two right of it. The design
package named all four (NOTE / TASK / ADDR / FIND) and the handoff asked which
two should become program keys now that the rocker takes up and down. Owner
ruled: the **far left key is HOME** and the **far right key is BACK** — the two
ends of the bank, the two verbs the device cannot work without — and the **two
inner keys stay blank** until play shows what they are for. Both end keys get
new icons: a house for HOME (a Palm's own Home silkscreen was a house) and a
left arrow for BACK.

The point of the rebuild, in the owner's words, was to make the buttons
flexible for development, and that is what the blank pair buys. They keep their
moulded faces and still depress, but they print nothing and do nothing. They do
dispatch `unassigned`, so a press lands in the play log while the owner works
out what he keeps reaching for.

Consequence to hold onto: this reverses nothing, but it does retire the design
package's own four words. The symbol layers C15 and C16 are gone from the
manifest and `DESIGN.md` carries a divergence note, because the manifest is
authoritative and the package's tables now describe a device that does not
exist. The reason a blank key beats a labelled one here is the same reason the
program-jump mapping was dropped earlier the same day: a key that prints a word
and does something else is worse than a key that prints nothing.

**P4-R88 — the wear scuffs stay.** Six sparse one-pixel scuffs on the exposed
housing, on by default per the manifest. Owner kept them, and flagged that
**blood is wanted on the device later** — not now. Recorded so that arrives as
a deliberate addition to a housing that already admits wear, rather than as a
surprise on a pristine case.

## Size is two controls, not one — 2026-09-13

**P4-R89 — the device resizes and the type resizes, independently.** This
**supersedes P4-R82**, which kept 23 rows because the choice was framed as
rows-versus-legibility at one fixed size. The premise was wrong. The handoff
then re-raised it as 52-versus-36 characters, which was the same mistake in
new clothes; the owner rejected the framing outright.

A real PalmPilot had a **font size selector with three sizes**, and a physical
device has a physical size. So the device gets both: the PDA can be **pulled
bigger and smaller like a window**, and the player picks their **own font
size** inside it. Asked whether dragging should magnify the text or fit more
of it, the owner's answer was **both** — they are two separate controls and
neither substitutes for the other.

What makes this work is that the two are genuinely independent: the glyph set
drawn is the product of the two, so how much text fits depends **only** on the
font setting, and the device size only changes how big the whole thing is.

| font size | characters/line | rows | glyph set at device 1x / 2x / 3x |
|---|---|---|---|
| small | 78 | 35 | 1x / 2x / 3x |
| medium | 38 | 16 | 2x / 4x / 6x |
| large | 25 | 9 | 3x / 6x / 9x |

Medium is the size the face was actually cut for. Small is the dense setting
and is only comfortable once the device is drawn large; that is the player's
business, not ours.

**Both controls step in whole numbers, and that is not negotiable.** Every
rectangle and every glyph on this device is pixel-exact at integer scales. A
freely-dragged 1.4x would soften the pixel face and misalign the housing
geometry — which is precisely the blurry-upscale problem the Fieldnote rebuild
was built to escape. A drag handle therefore **snaps** to 1x / 2x / 3x. On a
3200x1894 screen those are the three that fit; 4x would need a 2480-pixel-tall
screen.

Consequence, and the reason this is written down rather than just built: it
enlarges WP1. Knox.OS's drawing context currently uses one number for both the
device scale and the glyph set, so those have to come apart; a font-size
preference has to be stored per player and given somewhere to be changed; and
the auto-fit that opens the device has to stop rounding 1.52 down to 1x. The
font itself is already done — `build_palm_font.py` now emits all six scales the
grid needs.

## The words on the plastic — 2026-09-13

**P4-R90 — the silkscreen legends use the device's own typeface, not the
game's.** The design package specified built-in UI Small for the key legends,
and that made them the only thing on the entire device whose size came from the
player's machine rather than from us. The symptom was the unresolved label bug:
on the owner's 3200x1894 machine the labels drew on top of their icons, while
the same code on the development machine measured them 3-4px clear. A UI
font-size setting was the leading hypothesis and was never proven; a metrics
script was staged to read the owner's real font metrics out of his own session.

Put the choice to the owner and he took it: the legends are drawn in the pixel
face the mod already ships, at every scale the device can be drawn at.

This does not work around the bug, it removes the category. There is nothing
left to measure: the face has a fixed 11px cell with its baseline at `ascent`,
every capital inks rows 2..8, so a legend's position is arithmetic and every
machine draws it identically — 5px clear of its icon, everywhere. It also
retires the `MeasureStringYOffset` + `MeasureStringYReal` baseline rule that
cost most of a day to derive from `AngelCodeFont.getHeight`'s bytecode, and the
staged metrics script with it. **The owner's numbers are no longer needed and
that eval slot is free.**

Consequence to hold onto: real silkscreen lettering was printed sans, not a
screen face, so this is a small deliberate loss of fidelity bought with total
machine independence. It is also a divergence from the design package's text
contract, recorded in `DESIGN.md` alongside the key changes. And it means the
legends scale with the DEVICE, not with the player's font size — they are on
the plastic, not on the screen.

## Five calls on the device and the story — 2026-09-14

**P4-R91 — the shared week is real.** Every generated case is dated inside the
same days of early July 1993, and the same few names recur across cases. That
was an artefact of a single-case design reused for a ten-case campaign, and it
made attentive players see one operation behind all of it with no payoff. Put
to the owner as "keep them separate" or "make it real"; owner: **make it
real.** The coincidence becomes the connecting thread. How visible that thread
is to the player is still to be settled with the owner before content is
written. The owner also restated the standing rule: while the mod is below 1.0,
every rules change means a new game (P4-R77).

**P4-R92 — the editorial pass is approved.** The corrected key help, the
footers, the two voice lines and the tooltip wording may ship.

**P4-R93 — the fallback window's button is renamed.** The device replaced the
old evidence window (P4-R79), so that window's button no longer named the old
reading surface. (The window and its button were removed, P4-R128.)

**P4-R94 — the organiser always opens small, then remembers.** The first open
is the smallest size on every screen. Once the player changes the size, that
size is kept.

**P4-R95 — the drag corner gets a visible grip.** Resizing by dragging the
bottom-right corner existed but nothing showed it. A grip is drawn there, as
part of the design manifest like every other piece of the housing.

**P4-R96 — the thread is the relay memo, and the records point it out.**
Settles the visibility question P4-R91 left open. The owner chose that the
records point the week out, then — told the relay memo could not be found
while generated cases run — chose to put the memo in. The approved Dead Air
memo (Relay 31, "EFFECTIVE 30 JUNE THROUGH 08 JULY") is placed as one extra
clue in the **first** case of a game, at that case's second site, taking no
story role. Once it has been found, any record dated inside those nine days
gets a short note saying so, as a maybe; the memo is never noted against
itself and nothing is said before it is found. Its words are read from
`Content.lua`, not copied. Later cases are unchanged, so games already under
way keep their cases but never see the memo — **the memo needs a new game.**
The memo's description, its two readings and the note are new prose, reviewed
by the owner in play (P4-R97).

**P4-R97 — the approval rule for AI-written text is removed.** ADR-0002 said
development-time AI may draft but a human must approve canonical assets
before they ship. Owner, 2026-09-14: "that is a very old rule. remove it."
AI-written text now ships with the build like any other change, and the owner
reviews it in play. Removed from ADR-0002, `AI_PROVENANCE.md`,
`AI_BOUNDARIES.md`, the glossary and the premise notes; the rest of ADR-0002
(no-AI play is primary, runtime AI optional) stands. Dated approval records
elsewhere are history and stay as written. The `contentStatus` labels inside
saved cases are left alone: they are part of each case's byte-for-byte
rebuild, so changing them would set aside every case in play for a label.

## Live Windows test — 2026-09-14

**P4-R98 — no free window resize.** Dragging the corner zooms the organiser in
whole steps. The owner had pictured pulling the window freely, into a wide
shape; seeing it, the owner called that a bad idea. Dropped.

**P4-R99 — machine size decides how much fits; text has four sizes.** Owner
feedback in play: 1x is already big on a 4K screen, a 0.5x size is needed for
smaller screens, and the jump from Small to Medium text is too big. Offered a
picture of the options, the owner chose to **keep Small and add a size between
Small and Medium** (four text sizes), and that the **machine size controls how
much fits** while the text keeps the size the player picked — which is what
makes a 0.5x machine possible with every text size. This **amends P4-R89**:
both controls stay, but machine size no longer magnifies the text.

**P4-R100 — DATES opens a day as the Date Book did, and the launcher has a
clock for a survivor with a watch.** The owner sent photos of the real Palm
home screen and Date Book day view and approved both. A day now shows the date
and its week across the top (tap a day to open it) and a line per hour, eight to
six widened to take in earlier or later finds, each find on its hour's line and
opening its record. The clock returns to the launcher, which reopens P4-R85 only
as far as P4-R85 allows: **it shows only while the survivor carries a watch or
an alarm clock**, the vanilla clock's own rule, so the organiser still never
buys back what the game charges a watch for. Say so if the clock should show
without one.

**P4-R101 — a case has one person, and her body carries one card.** Found in
play: the first case named its person Roy Hale and gave a nearby zombie that
name and an ID card, but a second system bound the case to the first named
card seen on any corpse (Abbie Tidwell) and gave that body the house key; and
the game, which empties a zombie's pockets as it dies and rolls a body's loot
from its name when first opened, put "Roy Hale" on two of its own ID cards.
Owner approved the fix. **Only a card carrying the case's own person's name
binds the case to a body.** When that person's body appears it is **marked
searched** and holds **exactly one card with her name** — the clothes she wore
and nothing the game rolls. Still open: the name is given to whichever zombie
is nearest, so a body can wear clothes that do not match it.

**P4-R103 — the case person survives a reload.** The game never saves an
ordinary zombie: on load it builds a new one from a position and an outfit id,
with no name, no mark and empty pockets, so the named zombie vanished at every
save (CN-01). A dead body is saved whole. So each case now keeps **one small
record in the world save** (`ConspiracyFiles.CasePeople`): her name, where she
was last seen (refreshed every few seconds while she is loaded, only once she
has moved), the outfit id and sex of the zombie carrying her, and whether she
is dead. After a load, a sweep of the loaded zombies finds none carrying her and
**dresses the zombie nearest her last position as her again** — name, mark and
exactly one card — preferring the same outfit id, then the same sex. A case
never binds a second person, and once she is **dead no zombie is dressed as her
again**; her body carries her. **Name and body now match:** every invented name
has a sex, and she is given the nearest zombie of that sex, the nearest of any
only when none is in reach (logged). A name met on a corpse takes any body.
Accepted limit: the outfit is preferred, not guaranteed, so after a load she
can look different — the game may not recreate a zombie in her clothes near
that spot.

**P4-R102 — the survivor's words in white, the tag in the coloured bubble.**
Owner in play: "switch arround the speach text. colored and white. it makes more
sence." The white halo now carries the survivor's line and holds the longer
display; the coloured speech bubble carries the short fact (`Noted`,
`Two records disagree`, `Something nearby`). Clue hints follow the same split. A
player object with no halo gets the words in the bubble, so a line is never
lost. Lines that fire together are shown one after another.

Found alongside it, not decided: a named case zombie does not survive a save and
reload. CN-01 (`case_person.sh`) fails at that step on the code before P4-R101
and after it alike, so it is older than that fix and still open.

**P4-R99, as built.** Four text sizes: Small (11 px), Normal (17 px, the face
re-cut at 24 pt so it stays sharp), Medium (22 px) and Large (33 px). Machine
sizes 0.5x, 1x, 1.5x, 2x and 3x; a bigger machine shows more of the text and
the type keeps the size chosen. SETUP's Text and Machine lines open Palm popup
lists, as in the owner's photo: tap a line to choose, tap outside to leave it,
the rocker steps through it. A saved text size is kept by name; saves from
before keep Small, Medium and Large. **A save first opens the machine at 1x,
and from then on at the size it was last left at** - owner, 2026-09-14: "We
load at 1x and remember the last close size in the save." This settles P4-R94
for the new sizes: 1x rather than the new half size, because at 0.5x only Small
or Normal text leaves a readable page. The size is written to the save's own
ModData the moment it changes, so a crash does not lose it either.

## Answering the outside design review — 2026-09-15

An outside reviewer judged that the mod risks replacing repetitive looting with
repetitive evidence collection. Each criticism was checked against the code and
answered in a plan (artifact "Answering the Monotony Review"). The owner chose:

**P4-R107 — fix the stories first, then freeze the pool.** The audit found 30
defects in the twenty premises and the shared documents: dates and durations
that do not add up, and above all "agreeing" cases whose response still reasons
as if the records disagree. All 30 are fixed, a consistency test renders every
premise in both versions for every possible set of dates, and no new premise or
new organiser program is added until the first new-style case ships. Changes
case text, so a new game.

**P4-R108 — case dates are spread across the calendar.** Every case used to be
dated 2-6 July 1993, which put every dated clue inside the relay memo's nine
days and made its date note say nothing. Dates now spread across the weeks
before the outbreak, so a clue landing in the memo's week is a real signal.
New game.

**P4-R109 — one settled fact per case, about objects and places.** Amends "a
lead is never proof" for exactly one kind of statement: a fact the game itself
confirms - a found key opening a door, a count the player took from an open
container. People, motives, which record is true, and the Knox Event stay open,
and the row says what it does not establish. Conflicting records are still
never reconciled (P2-Q108/109).

**P4-R110 — cases may point at survival opportunities that already exist.** A
case may lead to a locked building, a vehicle or a generator the world already
holds. The mod still creates no loot and evidence is still never better than
loot; condition, fuel and access are the game's.

**P4-R111 — finished cases are archived, so the tenth case is not the last.**
A finished case shrinks to its evidence rows and last-seen lines outside the
live case budget, so a save keeps getting new cases after ten.

**P4-R112 — the survivor asks themself, in the first person.** Owner,
2026-09-15, on the proposed end-of-case questions: "We should use the player's
voice when writing: What do you make of it? Should be What do I make of it?"
Questions the organiser puts to the player, and the answers it writes back into
the journal, are the survivor thinking - "What do I make of it?", "Which reading
do I believe?", "Who do I think matters here?", "What would I check next?", "I
can't tell" - never a narrator or a quiz master addressing "you".

**P4-R113 — "What do I make of it?" steers the next case.** Owner's own idea
for ending a case, 2026-09-15: give the player a set of questions about how
they see the mystery, "and we run from there". The organiser offers a short
first-person set when a case's clues are all found - which reading I believe
(the case's two readings, or "I can't tell"), who I think matters (the case's
people and organisation, or nobody), what I would check next (follow the
person, check the place against its records, listen for it, leave it cold).
Owner: **"It should steer"** - the answers shape the next case: that person or
organisation returns, that way of investigating is used, and the evidence leans
toward testing the reading chosen, never toward confirming it. Nothing is ever
marked right or wrong. **Changing one's mind: yes** - answers stay revisable
until the next case has been built from them. This amends P2-Q27 for case
generation only: what the mod generates next may follow the player's theory;
the world itself still does not react to what the player knows. The answers are
saved inside the case they shape, as met names are, so a case still rebuilds
from its seed. Not built yet; when it is offered (only at a case's end, or
also at any time) is still open.

**P4-R114 — the organiser keeps the survivor's headings.** Owner, 2026-09-15
("Fix loose ends", on the recommendation to keep them). FILES on the organiser
dropped every heading that was not one of its labelled fields, for the look of
a Palm record, so WHAT IT MIGHT MEAN and the relay memo's DATE NOTE ran straight
on from the document's own words and what a document says could not be told from
what the survivor makes of it. The organiser now shows the same headings as the
case record projection; the labelled fields (WHEN, FOUND, WHERE, OBJECT, NOTES) are unchanged.
No new game.

**P4-R115 — a body's clothes may disagree with the clues on it.** Owner,
2026-09-15, asked whether the unbuilt half of USING_GAME_ASSETS Phase 1 is still
wanted: "yes that would hint toward a mistery. Why does a firefighter have a
police badge?" Where the trade a corpse is dressed for and the trade a document
on the same body names are both known and differ, the organiser says so - as the
survivor's question, never an answer: not stolen, not a disguise, not a second
job. Both trades come from closed, hand-written tables (outfit id to trade,
document type to trade); anything not listed stays silent, as outfit lines
already do (WP3). Agreement is not remarked on. Not built yet.

**P4-R116 — several clues are noted at once by dropping them on the
organiser.** Owner, 2026-09-15, in play: "being able to inspect several
evidences by marking them and dragging them onto the pda on top of right click
inspect." Items selected in any inventory pane and let go on the open organiser
are noted together: carried clues the ordinary way, clues in a container
where they lie (as right-click Inspect already does with the organiser open),
ordinary items ignored, evidence already noted left alone. The footer says what
happened (NOTED 3, ALREADY NOTED, NOT CASE EVIDENCE). Right-click Inspect is
unchanged.

**P4-R117 — all work goes into main.** Owner, 2026-09-15, accepting the
recommendation to stop using separate branches: "follow all your
recomendations". Verified work is committed and pushed straight to `main`; the
Linux test run, not a branch, is the gate. Each build published to the Workshop
gets a git tag so any build can be found again. The integration branch
(`integration/v0.1-corrected-candidate`, last commit merged as PR #36) and
`work/wp3-wp5` are retired; `~/cf-wp345` stays as a detached spare checkout for
`tools/autotest/prove.py`. Branches fully contained in `main` are deleted;
branches holding files found nowhere in `main` (the Dead Air location
inspection, the location shortlist, the T10 probe extras) and the
`preservation/` and `engineering/` archives are kept. Replaces P4-R75.

**P4-R118 — a finished case's evidence is marked Old.** Owner, 2026-09-15, after
the Windows playtest of DEV-0.36.0: two clues of a completed case were found
in the house and had no Investigation option at all, which read as broken. "We
should change the category to Evidence / Old." When a case retires, its clues'
inventory category changes from Evidence to **Evidence / Old**, so the loot list
itself says the clue belongs to a closed case. The mark survives save and
reload the same way the Evidence stamp does, and clues of cases retired in
existing saves get it too. Secondary: right-clicking such a clue shows a
greyed "Already in the organiser" instead of nothing. An item from no case gets
neither.

**P4-R119 — first cut of "What do I make of it?" (P4-R113).** Owner,
2026-09-15, answering the three open questions: the survivor is asked **only at
a case's end**; **"leave it cold" is left out** of the first cut until the cold
trail state of COLD_TRAIL_AND_PULL.md exists; the next case **keeps the
24-hour timer** (`minGapHours`) and uses whatever has been answered by then.

**P4-R120 — whole-map house numbers apply to new saves (AD-10).** Owner,
2026-09-15: when addresses for the whole Build 42.20 map ship with the mod,
**new saves use the shipped numbers; existing saves keep the address book they
already froze**, so nothing already written in the case record changes. Design:
docs/design/WHOLE_MAP_ADDRESSES.md.

**P4-R121 — the four open points of "What do I make of it?".** Owner,
2026-09-15, answering the plan (docs/design/WHAT_DO_I_MAKE_OF_IT.md):
- **"Listen for it" stays, through a new broadcast clue** (a transcript or
  scanner-log kind of document) that the next case leans on when that answer
  is chosen. It is a new document kind, not a new premise or organiser
  program, so the P4-R107 freeze as written is not broken.
- **Several finished cases with unused answers:** the most recently changed
  answers steer the next case; older unused answers are not used.
- **The next case waits a little after a case ends**, so answers given right
  away can steer it (a short delay after completion, on top of the 24-hour
  timer).
- **A returning person never gets a second body.** Someone who already has a
  body in an earlier case returns through clues and mentions only.

**P4-R122 — the words of "What do I make of it?".** Owner, 2026-09-15,
approving the draft in docs/design/WHAT_DO_I_MAKE_OF_IT.md section 1 as written:
- The three questions: **"Which reading do I believe?"**, **"Who do I think
  matters here?"**, **"What would I check next?"**, each shown with its answer or
  "(not yet)". Options: the case's two readings or "I can't tell."; the two
  people, the organisation or "Nobody, really."; "Follow the person.", "Check
  the place against its records.", "Listen for it."; every list ends with
  "Clear my answer.". **No length limit** (owner, same day: "the wording can be
  as long as necessary, change our limit"): a pick list wraps a long option
  onto more lines instead of cutting it off.
- **The invitation:** after "That's all of it", a second thought "What do I
  make of it?" appears, and FILES gains a row at the top. The organiser never
  opens by itself.
- **Read-back:** once answered the row reads as the survivor's own note ("I
  think it was a move nobody would sign for. Delia Mercer matters here. Next I
  would follow the person."), adding "I've gone on from here." once a case is
  built from it. Nothing ever says right or wrong.

**P4-R123 — "Listen for it" brings a radio call-in transcript.** Owner,
2026-09-15, choosing between a scanner log and a call-in transcript for the
broadcast clue of P4-R121: **a typed page from a local radio station's evening
call-in show**, filed against the case's reference. Like every clue it raises a
question and never answers it. It is placed only in a case steered to "Listen
for it", after every random draw (as the relay memo is), so no existing case
changes. Text: docs/design/WHAT_DO_I_MAKE_OF_IT.md, step 11.

**P4-R124 — the keyed read helper is a measured exception to the call rule.**
Owner, 2026-09-15, on the audit finding that CasePerson.lua and four other files
read engine objects through `o[k](o,...)`: "probe, then decide". The probe
(`tools/autotest/checks/call_form.sh`, real game) compared that helper with plain
colon calls on the same object for `AddItem`, `setExplored` and `isExplored`;
both did the same thing (PASS, 20260915T180358). So that one shape - the method
called inside a Lua closure with the object passed - is allowed and recorded in
AGENTS.md; `pcall(obj.method, obj, ...)` stays banned, and any other helper
shape needs its own live comparison. The case-person test's mocks now demand
their receiver, so a call without the object fails offline.

**P4-R125 — a refused new case waits for the survivor to move on.** Owner,
2026-09-15, choosing option A. When a new case finds no unused, loaded buildings
with enough containers near the survivor, the game used to scan the same
neighbourhood again every 10-20 seconds (61 refused scans in about 25 minutes in
the campaign check). Now it does not try again until the survivor has moved about
50 tiles or half an in-game hour has passed. What the player sees is unchanged:
the case still comes once they move on. A case created, or loading the save,
clears the wait. Placing cases in unloaded areas was not chosen.

**P4-R126 — the long campaign check exercises the relay memo's date note.**
Owner, 2026-09-15, choosing option A. In four campaign runs no clue of case 1
fell inside the memo's nine days, so the date note passed on "0 of 0". The check
now starts fresh worlds (at most eight) until case 1 has a clue dated in that
week, and then requires every such clue to carry the note. Test only: the game
does not force any case into that week (P4-R108 stands).

*Amended 2026-09-17, test only, by the agent running the overnight soak: the cap
is now THREE fresh worlds (`CF_MEMO_WORLDS`), not eight. Eight cost more than
the run could spare - 20260917T160453 spent seven worlds, about twenty minutes
of a thirty-minute check, before play could start, and a world costs a game
launch, an address index and a first case. Past three the run carries on in the
world it has and reports "the date note was not exercised" as a finding instead
of restarting. What the check requires when the week IS hit is unchanged: every
record dated inside it must carry the note. Over a five-run soak the note is
still exercised most nights, which is what P4-R126 asked for.*

**P4-R127 — clues, evidence and hunches; never "papers".** Owner, 2026-09-15:
"Clues evidence.hunches. But papers not." A case hides keys, cards, photographs,
objects and piles as well as documents, so "papers" was wrong. From now on:
- **Clue** - something a case has hidden that the survivor has not found yet.
- **Evidence** - a clue the survivor has found and noted (what the loot list
  already labels Evidence, and Evidence / Old once its case is finished).
- **Hunch** - what the survivor makes of it: leads, readings and the answers to
  "What do I make of it?". A hunch is never proof.
"Paper" stays only where the thing really is paper (a newspaper clipping, a
paper map, story text about paperwork). Corrected: living docs, decisions
(outside quoted owner words), code comments and test and check messages. Not
rewritten: dated evidence reports and handoffs, which record what was said at
the time, and the imported reference libraries. In game, the survivor's filing
item "Papers" is renamed (e.g. "Una's Evidence").

**P4-R128 — there is no notebook; the organiser is the one reading surface.**
Owner, 2026-09-15: "There is no notebook anymore" and "Let's remove all mentions
of notebook. If we can all the code that still do a notebook". Removed: the old
evidence window (its Journal, Evidence and Places views, reader, help, filter,
contrast toggle, unread marks, key bind and window memory), its toolbar button,
the legacy notebook projection and the tests that existed only for them.

What only the window did moved into the shared projection (EvidenceRows.list),
so the organiser now receives it: true discovery order across every source, the
FOUND field, whereabouts words for every state, PLACES headings earned by a
return (P4-R81), and the key findings (what a key fits, keys off a body, key
leads), which now appear in FILES. Dropped on purpose (P4-R79): the filter, the
contrast toggle and the unread marks.

The way back to reading (P4-R80; owner: "You have to find it"): the case record
lives in the world, not in the character, so any organiser reads every case.
One is issued to every new character, a dead survivor's is on their corpse, and
organisers are found in office, police and medical desks and electronics shops.
The evidence album still holds the paper evidence, readable in the game's own
reader. A survivor with no working machine says "I need something to read this
on."

Kept (owner: "In-game notebooks those we keep"): notebooks as things in the
world, such as the field notebook a clue can be, "Shift notebook" documents and
Rourke's notebook page. No new game.

**P4-R129 — whole-map house numbers: go ahead (AD-10).** Owner, 2026-09-16,
after a Windows game outside Muldraugh showed no numbers: "its a go ahead!".
Built as docs/design/WHOLE_MAP_ADDRESSES.md sets out: every building on the map
is exported once from the real game on the Linux machine, numbered offline per
town, and shipped with the mod; nothing is scanned or saved per game. Existing
saves keep their frozen Muldraugh book (P4-R120). The design's two open calls
take its defaults, and the owner reviews the result:
- each town's starting street is chosen automatically (a Main St, else 1st
  St / First St, else the town's longest named street that is not a highway or
  railway), listed in a report for the owner to check;
- buildings outside the named towns are numbered too when a named street is
  within 60 tiles; they never carry an invented town name.

**P4-R130 — the survivor says what they are noting.** Owner, Windows,
2026-09-16, over "I should note this before I forget." for a key on the road:
"can we describe what we are noting? we have the data to do it". When a plain
noun can be read from the record, the journal line names it ("I should note
this tagged key before I forget.") and the coloured tag carries the record's
title ("Noted: Tagged key / AV-197"). An identity names the document, never
the person. Objects, several keys and unknown records keep the original ten
lines. Wording and rules: docs/design/PLAYER_VOICE.md, Set A. *(Moot since
2026-09-17: P4-R132 stage 2 removed Set A - noting is a timed action and
says nothing.)*

**P4-R131 — an old save stays Muldraugh-only; the whole map is for new games.**
Owner, Windows, 2026-09-16: an Irvington save started under DEV-0.40 reopened
on DEV-0.41.0 showed no house numbers, because its first case had frozen the
Muldraugh trial book (352 addresses) and P4-R120 keeps it. Offered filling in
the shipped numbers outside the old trial area, the owner chose "Keep it;
start a new game". P4-R120 stands unchanged.

**P4-R132 — clues are found by searching (design; not built).** Owner,
2026-09-16, unhappy with how announcements over the survivor are ordered and
asking for a new idea rather than a reshuffle: "I would love to mix both", then
"perfect!" with a screenshot of the game's Investigate Area window, "the
investigate area dropdown would need another entry". The shape:
- Passing near an unrecognised clue may give a wordless cue ("Hm?", later
  "...again?"): once per place, only when the survivor could see the spot,
  weaker in the dark, never a direction or distance.
- Only the game's own Search Mode actually spots a clue, through its own
  spotting timer, light, weather and traits. "If you don't search you don't
  find."
- A clue is an ordinary game item until recognised: no title, no Evidence
  category, no Inspect option. Recognition happens when it is spotted, or
  through "Look it over", a short timed action on something already carried, so
  a clue picked up without searching is never lost to the case.
- Noting is a timed action with the game's progress bar, then the item changes.
- The survivor's voice is kept for realisations that happen in the head:
  records that disagree, a body's key fitting a door, nothing left to find,
  "What do I make of it?".
- The Investigate Area window's Search Focus list gains an entry (proposed:
  "Clues"); with it chosen, clues are spotted faster and further.
Design: docs/design/SEARCH_TO_FIND.md. Rules change, so a new game (P4-R77).

Built in three stages and published as DEV-0.42.0-search-to-find-3 on
2026-09-17. Owner's first feedback in play: "this is the best decisison we have
done". Kept as the shape to follow: hand a job to a system the game already
has, rather than arranging our own announcements differently.

**P4-R133 — a case may arrive in instalments, and a refusal must be honest.**
Owner, 2026-09-17, on cases quietly stopping for a player who stays in one
house: "decide alone", then "I agree with all you wrote". The cause: a case is
thrown away whole unless the loaded area can supply every distinct container it
needs (P4-R67), and the refusal then waits for the survivor to move (P4-R125).
One long run refused 17 times and never delivered a second case.

Decided:
1. **Instalments.** A case goes live with the clues that fit now; the rest wait
   as an open order and place themselves as the survivor moves about. A waiting
   clue names its intended site and has no target yet, and costs less to store
   than a placed one. The record still shows only what was found, never a total.
2. **Honest refusals.** Every refusal carries a reason (no reach, no
   containers, cap, cooldown, disabled), a count and the in-game time by which
   the next case is expected. After three refusals of the same reason the
   generator lowers its own standard in a fixed order: a smaller case, a wider
   reach, then releasing an old finished case's sites. Reachability is never
   traded: an unreachable clue is not a clue.
3. **The checks stop forgiving it.** A passed deadline with no case, and a
   refusal count that grows while the standard never lowers, are FAILURES in
   the long campaign check, not findings.
4. **Waiting clues expire.** A clue that cannot be placed within three in-game
   days is dropped and the case completes on the clues it got. A four-clue case
   is still a case. Without this, half-placed cases would squat the four active
   slots and block new cases worse than the original fault.
5. **Rejected: reserving sites and writing the clue later.** It would allow
   preparation in unloaded areas, but a container is identified by its position
   in the engine's object list, which shifts as the world changes; resolving a
   reservation later would weaken "one clue per container" (P4-R67) to one per
   room. Not worth the guarantee.

Design: docs/design/CASE_PACING.md. Built after the P4-R111 archive work.

*Built 2026-09-17 (steps 1-5 of the design's build order): typed refusals with
the count and rung kept in the save, instalments, the filler, three-day expiry
and the ladder's first three rungs. The checks (step 6) are separate. Two things
the code forced, both recorded in the design doc: **the ladder's fourth rung, a
single-site case, is not built** - a case is re-derived from its seed and the
schema requires two distinct buildings, so a one-location case is a generator
revision and therefore a fresh game, and the owner has not been asked for that;
and **a case still needs one container at each of its two sites**, because a
case with a single clue could never finish and would squat an active slot for
ever. Rules change, so a new game (P4-R77).*

**P4-R134 — clues may arrive on things that move.** Owner, 2026-09-17,
approving the whole queue ("implement 1 to 11") including the candidate raised
under P4-R133. A clue may be carried by a fresh corpse, a wandering zombie, a
car part or a mailbox, not only by a fixed container. Fixed containers run out
near a settled player; carriers that move do not, and a note in a dead man's
jacket at the fence is a better find than the twelfth cupboard.

Two carriers already exist in the code: CasePerson binds a case's person to a
nearby zombie or corpse and puts an item in its inventory, and a clue in a car
is already found by its mark wherever the car has been driven. Mailboxes are
the only new container kind.

Rules kept: never two clues on one carrier (the register keys on the carrier's
mark); the mod never spawns the carrier, only uses what the world put there;
searching is still how a clue is found (P4-R132), with the icon following a
carrier that moves; a body holding a clue looks like any other body until it is
searched; at most one mobile clue per case by default; a carrier gone for three
in-game days is dropped like any other unplaceable clue (P4-R133).

Design: docs/design/CLUES_ON_THE_MOVE.md.

**P4-R135 — four decisions taken while building the overnight queue.** Owner,
2026-09-17: "implement 1 to 11", with the standing instruction to decide alone
where the code forces a choice. Recorded so they can be overruled:
1. **The archive keeps four finished cases fully readable, not all of them**
   (P4-R111). The 500 KB budget cannot hold rows for every case: each fully
   readable archived case costs about eight stubbed ones. Sixteen cases now fit
   in 472 kB, where ten used to take 482 kB. The dial is one constant
   (MAX_FULL_ARCHIVED = 4): six readable gives about twelve cases, two gives
   about twenty-two. Past sixteen the binding constraint is the discovery
   ledger (about 545 bytes per clue ever found), not the case store.
2. **The ladder's fourth rung is not built** (P4-R133). "Accept a single-site
   case" needs a generator revision and a fresh game: a case is rebuilt from
   its seed and the schema requires two buildings with observed storage. Rungs
   1 to 3 (a smaller case, a wider reach, an old site released) carry the
   guarantee; the status reports "out of rungs" so a check can tell that from
   being stuck.
3. **At most one mobile clue per case** (P4-R134), counting a carrier and a car
   part alike. A side effect: a case near several cars can no longer scatter
   clues across all of them, as it could before.
4. **The mailbox container type is a guess and is labelled as one.** The string
   the engine uses was not verified; it is named once (Storage.MAILBOX), listed
   as unverified, and fails closed - a wrong string means no mailbox is ever
   chosen, never a broken case.

**P4-R136 — a corpse carries a clue; a walking zombie does not.** Decided
2026-09-18 from the real-game verification of P4-R134. The game turns Search
Mode off when a zombie is near, which is exactly where a zombie-carried clue
would have to be searched for, and a walker that wandered off stranded a case
for three in-game days while holding one of the four active slots. A corpse
cannot walk away, and "a note in a dead man's jacket" was the point of the
feature. Cars and mailboxes are unaffected. A clue is therefore placed only on
a body that is already dead; a zombie the survivor kills later is an ordinary
body like any other.

Also corrected: the promise a refusal makes (P4-R133) was computed as
`max(now, last + gap)` and the generator is only asked once the gap has
passed, so every promise was already overdue and the rule meant nothing. A
refusal now promises a time in the future, which is what the campaign check
asserts against.

**P4-R137 — the survivor names what they picked up.** Owner, Windows,
2026-09-18, reading "I saw a document labelled \"Badge: Roger Whitfield\"": "a
badge is not a document". An identity record now says what the thing is - a
badge, an ID card, a credit card, a passport, a press card, a diary, a parking
or speeding ticket, a business card - and only something unrecognised is still
called a document. Where the label carries a name, the line reads "I saw a
badge with the name \"Roger Whitfield\" on it" instead of repeating the label.
The same wording carries into the lead sentence ("The name on a badge is a
lead"), the outfit sentence and the row's own summary. Also: a container reads
as a survivor would write it - "inside a wallet", not "inside Wallet" - while a
name that already possesses ("Una's Evidence") is left alone. No new game.

**P4-R138 — one Inspect, and a record scrolls by the line.** Owner, Windows,
2026-09-18, on a greyed menu entry: "I cant access the inspect evidence
button... don't remember why?", and on reading a record: "scrolling also only
works page for page, making reading uneccessary dififcult".
- The menu offered one act twice: "Inspect Investigation Evidence", greyed
  unless the clue was carried or the organiser already open, beside "Note in
  the Investigation", which did identical work in place. There is now one
  entry, always available; it records in place when the clue is not in hand,
  marks the map the same way (P4-R137), and takes the organiser in hand itself.
  The icon follows the act: the glass for a clue in hand, the note for one
  where it lies.
- Inside a record the view's position was a page number, so reading jumped a
  screenful at a time. It is the top line now: one press, one line, clamped at
  the last full screen. Lists are unchanged (one press, one entry).
- Added the same day, on "hold and drag works too?": the stylus drags the page
  on the glass (after four pixels, so a tap still picks a record, and a drag
  that moved never opens one), and the mouse wheel turns it - a line inside a
  record, an entry in a list. **The wheel was taken straight back out the same
  day**: owner, "Careful. Scroll wheel is zoom in zoom out in vanilla". A panel
  that answers the wheel stops the world's zoom wherever it sits, which is a
  worse fault than the one it solved. Reading is served by the stylus drag and
  the rocker; the machine never takes a control the player expects the world to
  have.

**P4-R139 — an unnumbered building costs only its own address, and waiting
indoors says so.** Two faults a travel run from Irvington to Muldraugh found
(2026-09-18/19, evidence 20260918T230942 and 20260919T001915-travel.txt):
1. The address writer refused a whole case when any one of its sites had no
   number in the shipped book, so a case like that showed no address for any of
   its clues - about one case in five, since the book numbers 5,932 of the
   6,663 buildings with two or more rooms. It now names the sites it can and
   leaves the rest reading as they did ("the receiving building near
   Schoolhouse St"). A case the book can name nothing of reads exactly as
   before AD-10; no number is ever invented.
2. The first case of a save waits for the survivor to be indoors, and that
   silence had no reason, so the mod could not say why a player who spawned on
   a street had no case. A ninth refusal code, `outdoors`, was added to the
   closed set: none of the eight fitted, and it is uncounted like our other
   self-imposed waits, so it never walks the ladder up for a standard no rung
   can lower. When the first case is created is unchanged.
No new game.

*Built 2026-09-17 (the design's build order 1-5; the real-game checks of step 6
are separate). The carrier target shape, corpse and zombie carriers, mailboxes
as a container kind, the deliberate car part, one mobile clue per case
(`Session.MOBILE_PER_CASE`), the clue icon following a carrier, and a carrier
gone for three in-game days dropped like any other unplaceable clue. Seven
things the code settled are recorded at the foot of the design doc; none needed
an owner decision. Two engine facts are still UNVERIFIED and are named in the
design doc and in the code: the mailbox's own container type string on Build
42.20 (`Generated/Storage.MAILBOX`, listed in `Generated/Storage.UNVERIFIED`)
and `IsoGridSquare:getDeadBodys()`. Both fail closed - no candidate at all, the
same state as before this existed. Rules change, so a new game (P4-R77).*

**P4-R106 — how a car's containers are reached.** Owner, 2026-09-14: "The globe
box only opens when sitting in the front of the car", and a truck bed or trunk
is reached from outside, "only if they are open". Placement may still put a
clue in either; the checks now reach them exactly that way (vehicle_reach:
truck bed refused while its door is shut, allowed once open, from outside;
glove box from a front seat).

**P4-R105 — the organiser reads in either hand.** Owner: "the left hand should
leave the PDA open." Held in the off hand it stays open beside a one-handed
weapon; a two-handed weapon fills both hands and puts it away. HELP says so.

**P4-R104 — a finished case's evidence can still be found.** Owner in play: "I
lost my files somewhere?" A case completed, retirement dropped its placement
details, and nothing could say where its evidence was any more. A finished
case's documents now keep **where they were last seen** in the save (one short
line per document, in the words the case record already used). While a case is
finished, the mod still looks for its evidence in the survivor's inventory and
bags and in the containers the loot panel is showing, every ten seconds, and
updates that line at most once a minute per document. The old evidence window showed it as
"Last seen: …" (removed, P4-R128) and PDA FILES shows a WHERE line for every document, live or
finished. Neither ever says a document is lost. The evidence album (called Papers until P4-R127) is now found
inside bags too, so filing keeps working with it in a backpack.
