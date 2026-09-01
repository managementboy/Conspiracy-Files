# Project Maintenance Review — 2026-09-01

## Verdict

Conspiracy-Files is on target in scope and technical direction, but v0.1 is not yet a playable accepted vertical slice. Engineering Gates A and B, approved Dead Air content, the plain-Lua domain core, exact P2/R2 bindings and the offline production shell are complete. The remaining critical path is production feature integration and live acceptance, followed by deterministic packaging and cross-device testing.

There is no dated delivery baseline in the repository, so schedule performance cannot be rated objectively. Current health is:

| Dimension | Health | Review finding |
|---|---|---|
| Scope control | Green | v0.1 remains limited to Dead Air; graph, AI, packs, retrofit, migration and MP support have not leaked in. |
| Technical evidence | Green | Required T1/T2/T3/T4/T5/T7/T8/T9/T10 work and CF-V01-E01 are recorded on Build 42.20.4 with limitations. |
| Content/domain | Green | `dead-air-r1` is owner-approved; all 16 plain-Lua criteria pass. |
| Static bindings | Green | P2/R2 and all six target containers are live-evidenced and protected by a drift test. |
| Production shell | Amber | Package/bootstrap, persistence, scheduler, MP guard and error budgets exist and pass fake-backed tests; live E09/E11/E12/E13 remain open. |
| Playable integration | Amber/red | Placement, item identity, reader/Inspect, arrival, notebook/evidence UI and death/reload integration are not implemented end to end. |
| Release readiness | Amber/red | Distribution policy exists, but deterministic packaging and another-device smoke testing do not. |
| Schedule | Unrated | No milestone dates or target release date are recorded. |

## Repository and commit audit

The maintenance pass integrated and retained these local `main` milestones:

| Commit | Deliverable |
|---|---|
| `5451964` | reusable live-inspection harness under `dev/live-inspection/` |
| `2cf96fe` | approved Dead Air content, P2/R2 evidence/bindings, drift guard and distribution policy |
| `7ec2f97` | Build 42 production integration shell and fake-backed tests |

The completed code is documented at its operating boundary:

- domain and static bindings: `docs/testing/V0_1_DOMAIN_CORE_TRACEABILITY.md`;
- live binding evidence: `docs/research/CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md`;
- production shell and remaining live matrices: `docs/testing/V0_1_PRODUCTION_SHELL_HANDOFF.md`;
- reusable development harness: `dev/live-inspection/README.md`;
- distribution contract: `docs/design/RELEASE_AND_DISTRIBUTION.md` and ADR-0003.

At review time the combined Lua suite passes 26 tests: 16 domain acceptance tests, eight integration-shell tests, the binding/evidence drift guard and the traceability guard. The reusable harness independently passes 12 offline tests. All production/test Lua files parse under Lua 5.1 and repository diff checks pass.

Local `main` is ahead of `origin/main`; these commits are durable locally but are not yet published to the remote by this review.

## Acceptance reconciliation

Static product inspections P01, P02, P05, P13 and P20–P23 pass. P03 has explicit owner approval. The 16 plain-Lua criteria pass. CF-V01-E01 passes its live binding matrix.

The production shell moves E09 and E11–E13 from “awaiting implementation” to “implemented offline — live acceptance pending.” It does not pass those live criteria. E02–E08 still require integrated production adapters, and E10 still lacks an assigned lifecycle implementation. This review adds E14 because the roadmap-required notebook/evidence/help/keybind surface previously had no explicit live acceptance criterion.

## Critical path

1. Integrate T4/T5/T7/T8/T10 mechanisms with the production shell and accepted P2/R2 bindings.
2. Implement the notebook journal, evidence list, in-fiction help and single notebook keybind.
3. Assign and implement the death/reload lifecycle boundary.
4. Execute E02–E14 live matrices on the supported Build 42 line, preserving each criterion's limitations.
5. Live-validate the reusable harness's hardware-rendered path.
6. Build the deterministic package pipeline, publish an internal prerelease artifact and smoke-test it on another device.

## Management conclusion

No completed code is left undocumented or uncommitted after this maintenance pass. That does not mean all v0.1 code exists: the project has a sound foundation and clear evidence, but the playable integration/UI and release pipeline remain the next milestone.
