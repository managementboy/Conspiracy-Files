#!/usr/bin/env bash
# Every Linux check in a row, one line each, then the summary.
#   tools/autotest/suite.sh [--hidden]
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
checks=(boot_check.sh checks/wallet_id.sh checks/core_loop.sh checks/reload.sh checks/death.sh checks/faults.sh checks/perf.sh checks/knox.sh checks/hardware.sh checks/reshuffle.sh)
pass=0; total=0
for c in "${checks[@]}"; do
    # Each check claims the machine itself now (claim_game), so the suite does
    # not need to stop anything between them.
    total=$((total + 1))
    out="$("$REPO/tools/autotest/$c" "$@" 2>/dev/null)"; rc=$?
    line="$(grep -m1 -oE "^Linux .*: (PASS|FAIL).*" <<<"$out")"
    [ $rc -eq 0 ] && pass=$((pass + 1))
    echo "$(basename "$c" .sh): ${line:-could not run (exit $rc)}"
    grep -E "^(FAIL|FINDING):" <<<"$out" | sed 's/^/    /'
done
echo "suite: $pass of $total passed"
[ "$pass" -eq "$total" ]
