# B1 offline investigation flow

`dev/next-phase/InvestigationFlow.lua` is a plain-Lua, candidate-only coordinator for up to the existing campaign retention limits. Its canonical-shaped root is `{schema=1, ledger, cases, known}`. Every retained ledger record must have exactly one generated case and known-document list; the case locations must exactly match the recorded two-site order.

`begin` validates the current root, removes every retained site from the supplied catalog before `FirstClue.select`, and calls `Generator.generateSelected` with the selected introductory site first. The plan retains the selected ordering, synthetic opt-in, and the anchor/radius/hours creation facts.

`commit` does not write ModData, place items, or grant knowledge. It requires an explicit plain peer-root table, rejects its reserved `flow` key, stages the campaign ledger against the complete case/known peer shape, validates the complete `{flow=candidate,...peers}` aggregate with `Validator.validateCombined` under 500 KB, then calls the injected synchronous adapter revalidation. Callback errors, false results, unloaded targets, stale verification, malformed input, and size failure all return no candidate. Readiness is checked again after the callback.

`discover` and `restore` also require explicit peer roots and perform the same aggregate validation, including idempotent discovery returns. `discover` is a bounded idempotent document event. `restore` validates copied state, projects each case through `Generator.project`, then creates the learned-only `MultiCaseNotebook` view; cases with no known documents produce no notebook group. Restored case bounds must remain inside their immutable ledger anchor and radius.

This is offline orchestration only. Runtime adapters still own physical placement, canonical replacement, item writes, and knowledge grants; no Build 42 behavior is claimed.
