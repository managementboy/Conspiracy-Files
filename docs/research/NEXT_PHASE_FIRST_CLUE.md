# Natural first-clue proposal (offline)

`dev/next-phase/FirstClue.lua` is a pure selection policy for a future natural introduction. The caller supplies a new-case anchor, map/build identity, and survival hours. The policy derives the approved `Reach.radius` tier, filters through `Catalog.eligible`, and chooses the nearest candidate that has a distinct eligible partner inside the same radius. Distance and stable ID break ties deterministically.

Excluded sites, unknown/absent paper storage, map/build mismatches, and synthetic sources are rejected. Synthetic sites require explicit `allowSynthetic=true`. Scarcity returns no proposal; the policy never widens reach, grants discovery, mutates input, persists a case, or interacts with the live mod.

This deliberately does not pin the generated case's first document. `Generated/Generator.lua` currently selects and orders its two sites independently. A later integration must pass this proposal into case generation and persist the selected ordering before any evidence is exposed. P4-R62 now selects the current player position at creation for later cases; existing case anchors remain unchanged.
