# Performance and State Budgets

Provisional budgets until spikes measure real Build 42 behaviour.

- **Normal runtime:** target ≤2 ms/frame of Conspiracy-Files work outside explicit initialization screens.
- **Work scheduling:** expensive work is queued and processed in bounded batches; no full-registry or all-evidence scans per frame.
- **Canonical save state:** target ≤500 KB/save. Persist only story locations used by the save, not the entire discovered map registry, unless T1/T2 prove otherwise.
- **Graph (v2):** provisional 250 simultaneously rendered nodes; filter/aggregate beyond that.
- **Archive relevance:** re-score only records sharing entity/metadata keys affected by a new domain event.

T1 and T2 may revise these numbers.
