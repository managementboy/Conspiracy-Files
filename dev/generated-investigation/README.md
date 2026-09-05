# G1 offline generator

This is prototype logic, outside the automatically loaded mod folders. It does not place anything or change the live installation. The player's real 12-place Muldraugh list is pending; only synthetic test locations exist here.

Catalog.lua validates provenance, applicability, explicit paper-storage evidence, container constraints and bounds. Generator.lua selects a distinct pair, assembles one of two draft outlines with shared facts, validates the entire case, restores saved case snapshots and projects only discovered documents/connections. Synthetic candidates are rejected by default and require allowSynthetic=true in offline tests.

Catalog input is capped at 64 records. It deterministically enumerates eligible pairs instead of unbounded random retries. This is an offline subset implementation, not the eventual large-database index or live map scanner. Storage marked observed is still a catalog claim; G2 must validate actual loaded containers before exposure. Missing/uncertain data cannot be promoted merely because a place is interesting.

Generation output contains complete selected-site metadata, facts, template revision and resolved text. Restoration validates against that pinned generator revision and saved sites, independent of a changed external catalog. Future unsupported generator revisions refuse safely; there is no migration. This module is not yet integrated with Session/ModData or immutable discovery persistence.

New draft prose is development-time AI-assisted and unapproved. Existing Dead Air documents are unchanged. The examples demonstrate coherent assembly, not final narrative quality or approved new lore.

## Run

From the repository root, run test/run.lua under PUC Lua 5.1.5. To archive seed examples, run tools/generate_sample.lua with an existing output directory argument. Evidence for this increment is in docs/management/evidence/2026-09-05-g1/.

## Next boundary

Receive the owner's places, normalize stable IDs and source references, then independently enrich technical metadata. Do not fabricate coordinates, storage or map applicability. Records with unverified required capabilities remain excluded from eligible generation. No owner container-inspection itinerary is required. The current milestone is G1 preparation; real-catalog validation, new-content review and live G2 composition remain outstanding.
