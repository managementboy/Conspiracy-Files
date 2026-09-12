#!/usr/bin/env bash
# Run a check repeatedly on fresh worlds and tally the results, to reach the
# scenarios a single random case rarely produces (cars, basements, upper
# floors, piles, keys).
#   tools/autotest/soak.sh N [check]     default check: checks/core_loop.sh
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
n="${1:-5}"; check="${2:-$REPO/tools/autotest/checks/core_loop.sh}"
pass=0; fail=0; broke=0; reports=()
for i in $(seq 1 "$n"); do
    "$PZ" stop >/dev/null 2>&1
    out="$("$check" 2>/dev/null)"; rc=$?
    r="$(grep -m1 -oE "^Linux .* check [0-9T]+: (PASS|FAIL)" <<<"$out")"
    case $rc in 0) pass=$((pass+1)) ;; 1) fail=$((fail+1)) ;; *) broke=$((broke+1)) ;; esac
    echo "run $i/$n: ${r:-could not run (exit $rc)}"
    reports+=("$out")
done
echo "soak: $pass pass, $fail fail, $broke could not run"
printf '%s\n' "${reports[@]}" | grep -E "^(FINDING|FAIL):" | sort | uniq -c | sort -rn | head -20
printf '%s\n' "${reports[@]}" | grep -oE ", in [^,]+, room [^,]+, floor -?[0-9]+" | sed 's/^, in //' | sort | uniq -c | sort -rn | head -30
[ "$fail" -eq 0 ] && [ "$broke" -eq 0 ]
