# B5 offline ordinary-object bookmarks

`ObjectBookmarks` stores up to 64 private player marks for ordinary objects. A mark requires an explicit, stable caller `intentId`; the intent produces a namespaced `bookmark:` ID and can be retried only with the same immutable title, item token, source context, and marked-survival-hours. Retrying does not overwrite the existing note. Reusing an intent for another object or context refuses.

The immutable source context is either unavailable, or an adapter-supplied map ID, bounded integer tile position, and optional label. Coordinates and item-identity tokens remain internal. The separately editable note is bounded to 1,000 characters. Inputs and persisted records use strict plain-table schemas, reject aliases/cycles, extra fields, non-finite numbers, duplicate IDs, and over-limit arrays.

The unreleased offline `InvestigationFlow` root now includes a top-level `bookmarks` array. `markObject` and `editObjectNote` copy the complete candidate, validate the root, and run the same explicit-peer 500 KB aggregate preflight as the rest of the flow. They neither discover generated documents nor add authoritative case roles or graph connections.

`restore` refuses a clock before a recorded mark, then appends a `Personal notes` group only when bookmarks exist. Its rows are typed `Marked object`, use labels or an unknown-place message rather than coordinates, and state that they are not authored documents. The group is outside campaign case projections, so it does not consume the active-case cap or reveal facts from unknown cases.
