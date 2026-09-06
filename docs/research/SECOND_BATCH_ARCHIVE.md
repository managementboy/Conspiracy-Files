# B4 offline evidence archive

Known generated documents retain immutable learned timestamps. Restore receives an explicit archive-age threshold and derives an archived flag once the age since the latest relevant knowledge event reaches that threshold. Evidence is never removed, reordered, marked solved, or used to release a campaign slot.

On a newly learned document, reference buckets contain only prior known documents. Only buckets matching that document's explicit references are visited to find affected old evidence. Each genuinely new related discovery can reset age; repeat inspection cannot. Unknown documents never enter the relevance index. This is per-case, bounded to the current three-document format; it does not claim a cross-case relevance engine.

The saved relevance map includes every known document and is checked against deterministic replay of known discovery order/times. Missing, extra or invented relevance times refuse restoration. Interpretation update timestamps must likewise match the time at which both endpoints became known. Learned/relevance roots reject foreign case IDs. Index construction happens on knowledge changes or validation, never in a per-frame loop.

Primary review added test/evidence_archive.lua for affected-bucket visit counts, unrelated/unknown exclusion, exact age boundary, resurfacing and deep-copy isolation. test/investigation_flow.lua exercises integrated restore, budget and timing behavior, including complete-root tamper fixtures. Both pass offline; native UI, profiling and persistence remain untested.
