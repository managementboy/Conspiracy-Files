#!/usr/bin/env bash
set -euo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/relocation_evidence.sh"

parsed="$(printf '%s\n' \
    '[CF-G2-RELOCATE] movedA: guard refused' \
    '[CF-G2-RELOCATE] relocated movedA to 10,20,floor 0' \
    '[CF-G2-RELOCATE] relocated movedA to 11,21,floor 0' \
    '[CF-G2-RELOCATE] relocated movedB to 12,22,floor 0' \
    | relocation_evidence_moved_ids)"
[ "$parsed" = $'movedA\nmovedB' ] || { echo "canonical move-id parsing failed: $parsed" >&2; exit 1; }

expect() {
    local expected="$1" name="$2" actual
    if relocation_evidence_complete; then actual=0; else actual=$?; fi
    [ "$actual" = "$expected" ] || { echo "$name: expected $expected, got $actual" >&2; exit 1; }
}

# A valid comparison for an unchanged clue cannot stand in for the moved clue.
relocation_evidence_reset
relocation_evidence_baseline movedA; relocation_evidence_baseline unchangedB
relocation_evidence_moved movedA
relocation_evidence_comparison before unchangedB 'verdict=none'
relocation_evidence_comparison after unchangedB 'verdict=none'
expect 2 'unreadable moved clue'

relocation_evidence_reset
relocation_evidence_baseline movedA; relocation_evidence_moved movedA
relocation_evidence_comparison before movedA 'verdict=none'
relocation_evidence_comparison after movedA 'verdict=none'
expect 0 'full moved coverage'

relocation_evidence_reset
relocation_evidence_baseline movedA
expect 2 'refusal-only run'

relocation_evidence_reset
relocation_evidence_baseline movedA; relocation_evidence_moved movedA
relocation_evidence_comparison before movedA 'verdict=none'
expect 2 'missing after-reload comparison'

relocation_evidence_reset
relocation_evidence_baseline movedA; relocation_evidence_baseline movedB
relocation_evidence_moved movedA; relocation_evidence_moved movedB
relocation_evidence_comparison before movedA 'verdict=none'
relocation_evidence_comparison after movedA 'verdict=none'
expect 2 'second moved clue unreadable'

relocation_evidence_reset
relocation_evidence_moved movedA
relocation_evidence_comparison before movedA 'verdict=none'
relocation_evidence_comparison after movedA 'verdict=none'
expect 2 'move not captured in baseline'

relocation_evidence_reset
relocation_evidence_baseline movedA; relocation_evidence_moved movedA
relocation_evidence_comparison before movedA $'movedA\tverdict=read-error\nerror mentions verdict=none'
relocation_evidence_comparison after movedA 'verdict=none-such'
expect 2 'error text is not a comparison'

echo 'relocation evidence regression: PASS'
