# Development Support

Development-only probes, disposable experiments, inspection helpers, and live-game debugging support belong here.

Anything under `dev/` should be clearly separable from the player-facing mod package. Use this area for Build 42 API probes and architecture proof experiments before promoting behavior into production code.

Current planned composition probes:

- `t11-adapter-integration/` prepares the one-item live composition gate required before full v0.1 adapter assembly.
- `t12-ui-runtime/` prepares the live ISUI feasibility gate required before production notebook implementation.

Neither probe is production code, and neither may be marked proven from static inspection alone.
