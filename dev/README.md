# Development Support

Development-only probes, disposable experiments, inspection helpers, and live-game debugging support belong here.

Anything under `dev/` should be clearly separable from the player-facing mod package. Use this area for Build 42 API probes and architecture proof experiments before promoting behavior into production code.

Current planned composition probes:

- `t11-adapter-integration/` prepares the one-item live composition gate required before full v0.1 adapter assembly.

Neither probe is production code, and neither may be marked proven from static inspection alone.

## Archived spikes (2026-10-02)

The research spikes `t1-moddata-persistence`, `t2-map-enumeration-cost`,
`t3-location-categorisation`, `t4-exact-once-placement`,
`t5-physical-item-identity`, `t7-runtime-item-text`, `t8-location-arrival`,
`t9-network-egress` and `t10-cooperative-inspect` were removed from the tree.
Their conclusions live in `docs/research/T*.md`. The T10 live-run security stop
is kept as `docs/research/T10_SECURITY_STOP.md`. Restore any of them from git tag
`spikes-t1-t11-2026-10-02`:

    git checkout spikes-t1-t11-2026-10-02 -- dev/<folder>
