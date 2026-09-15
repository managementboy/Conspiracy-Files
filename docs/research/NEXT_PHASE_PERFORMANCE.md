# Next-phase performance instrumentation (offline)

`dev/next-phase/PerfStats.lua` aggregates injected duration values by a bounded set of subsystem labels. It stores no per-tick samples: each label retains only `count`, `totalMs`, `peakMs`, and `overBudget`. New labels are rejected after the configured capacity, preventing an accidental growth path from dynamic names. Constructor bounds keep capacity practical: 1–64 labels and 1–128 characters per label; returned snapshots are copies.

The later runtime adapters should use stable categories: `metadata` for map/catalog work, `identity` for physical-token scans, `pen_checks` for reachability/marker eligibility, `rendering` for UI or marker drawing, and `save_validation` for staged canonical-save checks. The intended native runtime target remains at most 2 ms per frame outside initialization. A duration equal to 2 ms is within target; a larger duration increments `overBudget`.

`tools/benchmark_next_phase.lua` drives the existing cooperative `Scheduler` with an injected clock and repeated synthetic durations. It also prints a separate `os.clock` reference loop explicitly marked **OFFLINE**. Neither result is a Project Zomboid frame-time measurement or native acceptance result. Native profiling must still verify actual hooks, save size, map loading, rendering, and frame pacing in Build 42.
