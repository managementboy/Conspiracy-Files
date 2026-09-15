# B2 offline encounter context

`EncounterContext` accepts only an adapter-supplied pickup event: map ID, integer tile coordinates, found survival hours, and an optional bounded source label. It does not inspect player state, placement targets, reader state, or broad world data. The values remain internal to the flow root and are intended for later marker work.

The unreleased offline flow root now includes `encounters`, keyed by case ID and generated document ID. `capture` validates case/document membership and map identity, copies the first valid event, and never replaces it. A later move, drop, or reread therefore cannot rewrite the original pickup source. Capture does not add a document to `known`.

`restore` only adds a textual `context` field to rows already projected as known through `Generator.project` and `MultiCaseNotebook`. It exposes the supplied label, or `Location not recorded` when no source was captured. Coordinates are never rendered. Capture, discovery, and restore all include explicit peer roots in the 500 KB aggregate preflight.

This remains offline and does not claim a Build 42 pickup hook, persistence adapter, marker, item mutation, or reader integration.
