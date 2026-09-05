# G1 offline preparation result

49 tests pass; 41 Lua files in mod/dev/test parse. The separately executed tools/generate_sample.lua also ran successfully. The unchanged six Dead Air bodies still match their checkpoint and fixture.

The 100-seed synthetic sample produces 66 distinct unordered location pairs, 50 corroboration outlines and 50 conflicting-account outlines. See seed-sample.txt and example-seed-1.md/example-seed-2.md. Each case contains three documents, two locations, two identities and one organisation. All output prose is a development draft, not approved new content.

Tests cover stable input-order-independent generation, no input/output aliasing, seed variation, explicit eligibility, same-area/overlap exclusion, malformed catalogs, no fixed-site fallback, altered text/reference/revision rejection, restoration independent of the current catalog, and partial/reordered discovery projection.

Source hashes: generator-sha256.json. The generic candidate-sha256.json remains the existing mod/probe manifest; it does not identify the generator.

Limits: only invented test locations exist. Their map/build names explicitly say SYNTHETIC/TEST-ONLY, and generation excludes synthetic sources unless explicitly enabled. No real storage, route, room predicate, item placement or ModData persistence was exercised. Resolved case snapshots are save-shaped objects, not engine save acceptance. G1 is not complete against the real catalog until the owner's 12 places are received and technically enriched. G2 still needs a case-definition adapter boundary and the existing recovery gap resolved.

The live game folder was not changed. No new owner location-inspection itinerary or automatic GUI input was introduced.
