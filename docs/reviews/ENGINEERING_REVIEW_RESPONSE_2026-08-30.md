# Engineering Review Response — 2026-08-30

Source review: `ENGINEERING_REVIEW_2026-08-30.md`.

## Accepted without reservation
- Keep canonical model + derived projections.
- Keep “If rebuilding a cache can change story truth, it is not a cache.”
- Keep immutable evidence facts / mutable interpretation.
- Keep hybrid deterministic/generated IDs.
- Keep the technical-risk list and Lua-first/narrow-Java boundary.
- Define v0.1 vertical slice.
- Hand-author a complete fixture before generic schema work.
- Make no-AI primary.
- Cut retrofit/migration/content packs from v1.
- Demote graph to v2.
- Debug-gate hidden diagnostics.
- Add main-thread/save-size budgets, MP guard, error containment, compatibility rules, PZ-free domain core, glossary, decision IDs/rationales, and death/reload state preservation.
- One normal-play keybind; in-fiction onboarding.
- Create spike issues and ADRs.

## Modified acceptance
- **Asset text model:** adopt the review's expected hybrid model as the working hypothesis, but T7 remains the authority.
- **Versioning:** exact pack/core matching is retired; compatibility will be based on explicit schema/API compatibility and PZ minor-line support. Exact semantics await future pack work, which is out of v1.
- **Localisation:** keep localisation for UI/static strings, not for procedurally composed story prose in v1.
- **Graph cap:** provisional 250 visible nodes only; final value must come from the v2 graph prototype.
- **Replay:** accept same authored conspiracy with varied entry points/placements/details.

## Deferred because only a spike can answer it
T1–T10 are tracked as GitHub issues. Decisions depending on them are marked provisional, not settled by argument.

## Contradiction rulings
- C1 defaults: usable defaults, not sacred.
- C2 content revisions: decouple content revision from schema/API migration.
- C3 retrofit config: moot in v1; future retrofit config occurs at retrofit initialization.
- C4 redundant anchors: only one anchor/fallback path is materialised at a time; fallback candidates are valid story content but not simultaneously spawned red herrings.
- C5 diagnostics vs hidden rules: diagnostics are dev/debug only.
- C6 provenance: optional provenance toggle for runtime/system/player interpretation; approved authored assets remain in-fiction.
- C7 archive rescore: event-scoped to affected metadata/entities.
- C8 graph growth: graph is v2; provisional 250 visible nodes.
- C9 organisations vs identities: asymmetry is deliberate and documented in glossary/P4-R15.
- C10 notebook pause: setting moves to mod options.
- C11 localisation: UI/static localisation only in v1.
- C12 migration history: keep minimal audit line.

## Section 8 answers
1. No-AI primary.
2. Three good moments: see `docs/requirements/PLAYER_MOMENTS.md`.
3. Project owner writes/approves content; AI may assist development drafting. First fixture is hand-authored.
4. Graph is v2.
5. Replay is the same authored conspiracy with different entry points/placements/details.
6. Accept the proposed v0.1 slice.
7. Retrofit and migration cut from v1.
8. Content packs cut from v1; one built-in content set first.
9. Defaults: usable, not sacred.
10. Typo fixes: backwards-compatible content revisions do not force migration.
11. Retrofit config: future initialization-time concern, not v1.
12. Diagnostics: dev/debug gated.
13. Runtime AI provenance: optionally visible; approved authored assets not marked in-fiction.
14. Graph cap: provisional 250 visible, v2 only.
15. Localisation: UI/static yes; dynamic story prose not guaranteed.
16–20. Pending the appropriate spikes except that future retrofit uses per-candidate eligibility and the expected asset text model is hybrid pending T7.
