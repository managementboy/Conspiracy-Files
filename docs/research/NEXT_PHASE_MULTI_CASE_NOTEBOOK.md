# Multi-case notebook projection (offline)

`MultiCaseNotebook.lua` accepts a validated campaign metadata ledger and a map of already learned-only case projections. Callers must obtain those rows from authoritative generated-case projection APIs such as `G.project` or `Session.project`; this module accepts no raw documents, placement targets, anchors, radii, or site IDs and is not proof of a live binding.

Cases with no learned rows are absent. Visible groups receive neutral ordered labels such as “Investigation 1”; no hidden case metadata is used as a display name. Known row order is retained, while links survive only when their target is also known in the same visible case. Marker and evidence keys use length-delimited case/document IDs to prevent cross-case collisions. The returned grouped view is copied and makes no canonical mutation, discovery, completion, or runtime UI change.
