# Relocation diagnostic: review fixes

Scope: diagnostic and test changes based on `6eadb84`. No mod changes or live
game run. The original placement mismatch remains unproven.

- Proximity reporting preserves successful `false` results and distinguishes
  exceptions. The Lua fixture tests false, true and throwing calls for both
  reported proximity checks. Destination proximity remains an explicitly
  labelled estimate at the site's bounds corner.
- The fixture now performs a valid relocation and asserts the changed target
  and incremented relocation count. The unconditional `or true` was removed.
- The shell reads successful move IDs from the complete log window beginning
  before the clock advance. The displayed log tail does not limit evidence.
- Every moved ID must belong to the captured baseline and have a valid
  comparison before and after reload. An unchanged clue cannot substitute for
  an unreadable moved clue. Missing coverage returns exit 2; a discrepancy
  still returns exit 1. Verdict parsing accepts exact fields on the first line,
  not text inside a diagnostic error.
- The shell regression is included in `tools/autotest/unit.sh`.

## Verification

Executed the relocation and placement fixtures with Lua 5.1 through Python's
Lupa runtime. Both passed. Reinstating the old proximity expression in memory
made the new false-result assertion fail as expected.

Executed `bash tools/autotest/checks/relocation_evidence_test.sh`: passed. It
covers full moved-clue coverage, refusals only, an unreadable moved clue with
an unchanged clue checked instead, a missing reload comparison, a second
unreadable moved clue, a move outside the baseline, and misleading verdict
text inside errors. Shell syntax and `git diff --check` also checked.

The full Linux suite and the live relocation experiment were not run here.
`graphify update .` was attempted but failed with Windows access denied; this
checkout has no tracked graph output to update.

## Next

Run `tools/autotest/checks/relocation.sh` on Linux after updating to this
revision. Preserve the original captures and report moved IDs, comparison
coverage in both phases, refusal reasons, and the exit status. This tests the
relocation hypothesis; it does not assume that hypothesis is true.
