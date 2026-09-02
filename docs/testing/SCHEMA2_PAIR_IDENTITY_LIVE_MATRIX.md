# Schema-2 Active-Pair Live Matrix

**Status:** Required live QA specification; not yet executed.

**Applies to:** CF-V01-E02, E04, E05, E06 and E08 on the supported Build 42 line.

## Authority and oracle

For each test save and authored Asset, record the production runtime's expected
save-scoped token before constructing a case. The only authorized item identity
is the active `(Asset ID, expected token)` pair verified through the production
world-runtime gateway. Parsed ModData, a token alone, an Asset ID alone, a flat
legacy claim or a caller-supplied scan classification is never authorization.

Run presentation, placement and scan/reconciliation cases for D1–D6 and B-37
at their accepted P2/R2 containers. At minimum, exercise cross-pairs in both
directions for D1↔D2 and D3↔D4; then rotate the remaining Assets so every
authored Asset appears once with another Asset's expected token.

## Carrier matrix

| Case | Constructed carrier | Required result |
|---|---|---|
| P1 | Exact current nested carrier and active pair; absent legacy fields | Verified; normal placement/scan/presentation path may proceed. |
| P2 | Exact active pair at `dead-air-r0-compatible` or `dead-air-r0-compatible-text` | Verify identity first; refresh display/revision fields in place; verify again; preserve item instance, Asset ID, token and exact legacy-mirror identity fields. |
| N1 | At the exact authored target, the expected PZ item type plus canonical authored display name but no valid readable `ConspiracyFiles` carrier/pair, including getter failure, nil/non-table return, hostile access or malformed nested/legacy data | Reject. An ordinary same-type/different-name or canonical-name/different-type item remains unrelated loot and does not block placement. |
| N2 | Nested Asset ID with no physical token | Reject. |
| N3 | Nested physical token with no Asset ID | Reject. |
| N4 | Complete-looking legacy flat fields with no nested carrier | Reject. |
| N5 | Unknown Asset ID with an active or fabricated token | Reject. |
| N6 | Incompatible or malformed item schema | Reject. |
| N7 | Missing, malformed, unknown or future content revision | Reject unless it is exactly one of P2's two supported older revisions. |
| N8 | Current revision with tampered title, description, body or reveal state | Reject. |
| N9 | Nested carrier plus partial or disagreeing legacy mirror | Reject; never choose or synchronize a side. |
| N10 | Known Asset A with expected token for Asset B | Reject in both directions; never rewrite to either Asset. |
| N11 | P1 at menu construction, then remove/partially mutate the carrier, substitute a complete coherent pair, downgrade to P2, mutate body/mirror/ownership, or pass another item to the callback | Activation's read-only revalidation rejects; no refresh, reader or domain intent. Run coherent D1→D2 and D2→D1 substitution explicitly. |
| N12 | Caller-supplied physical observation labels an N2/N3/N10 carrier as a match | Gateway revalidation rejects; no availability transition. |
| C1 | Two distinct items carrying the same verified active pair | Enter sticky `conflict`; retain both; do not create, delete, select, restamp or clear a winner. |

Every N-case must leave these counters at zero: item creation, replacement,
restamp/refresh, placement-ledger transition, availability transition, reader
open, document discovery and Mark intent. The canonical root and tested item
ModData must remain byte/logically identical. C1 is the sole exception: its
documented sticky availability/placement conflict transition is required, but
all world-repair and presentation/domain-intent counters remain zero.

## E02 / E04 — exact-once placement

For D1, run P1 through clean placement and the T4 before-intent, after-intent,
after-stamp, after-add, after-verify and after-ledger-commit interruptions. After
each valid case, stream the target out/in, save/reload three times and repeat
callbacks. Run P2 and every N/C case at the exact target. Repeat clean, P2,
N2, N3, N4, N9, N10 and C1 for D2–D6, with the remaining negatives distributed
so each Asset receives the complete matrix across the run.

P1/P2 end with one verified active pair and `placed`. N-cases have zero create
and zero ledger effect. C1 remains two items plus sticky `conflict`, with no
third add. Fallback selection must not suppress D3–D6.

## E05 — movement and physical observations

For each production document, move one P1 item through player inventory,
ordinary container, floor, occupied vehicle, inventory again and corpse where
the supported live lifecycle permits. Save/reload at every stage and verify the
same active pair plus canonical availability/location. Establish permanent loss
only with an explicitly complete covered observation; bounded zero coverage
remains `unknown`/`untracked`.

Run N12 through both the concrete PZ scan port and the placement adapter's
caller-supplied observation seam. Inject a copied C1 pair, reload, remove one
copy and prove conflict remains sticky. Immutable Evidence and journal history
must be unchanged by every availability outcome.

## E06 — persisted carrier and reader

For D1–D6, inspect the raw nested carrier, custom name and full rendered body
before save and after two reloads. Compare current text byte-for-byte with
`dead-air-r1`. Run P2 before and after reload and prove only presentation fields
changed. Attempt Inspect for every N-case and require zero reader/discovery.
Confirm ordinary inventory/container behavior remains available.

## E08 — cooperative actions and activation revalidation

For D1–D6 and B-37 in player and Ground/loot panes, run P1/P2, every N-case,
mixed selections, two-valid ambiguity, owned/unowned state, already-marked state,
foreign same-label actions and repeated menu construction. Run N11 separately
for carrier removal, Asset-only/token-only mutation, both directions of
coherent D1/D2 substitution, compatible-refresh abuse, presentation/mirror
mutation, ownership transition and callback-item substitution. Exercise
Inspect and both B-37 actions where applicable.

Only a P1/P2 subject whose active pair verifies at construction and activation
may open one reader or emit one idempotent domain intent. Rejected and mutated
subjects expose no private action or their callback is a no-op, as applicable.
Vanilla and foreign actions remain untouched and callback faults remain contained.

## Evidence record and promotion

Record the exact source commit, package checksum, PZ build, OS, enabled mods,
fresh/copied-save status and case ID. Preserve raw before/after carrier dumps,
canonical-root snapshots or deterministic hashes, target item counts, action
labels/ownership identities, reader-open and domain-intent counters, and the
sanitized Conspiracy-Files log. Inspect the raw artifacts in addition to the
summary.

Independent QA must execute this matrix against the exact candidate after the
offline gates pass. Any later production-code change invalidates that result.
PM-GOV-001 governs traceability and promotion. This checked-in specification is
not evidence that any case has run and makes no new live acceptance claim.
