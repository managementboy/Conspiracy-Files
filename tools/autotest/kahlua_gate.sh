#!/usr/bin/env bash
# THE ENGINE COMPILE GATE. Required before a release; impossible on hosted CI.
#
#   tools/autotest/kahlua_gate.sh
#
# Kahlua is the incomplete Lua 5.1 Project Zomboid actually runs. It compiles
# against projectzomboid.jar, which is licensed game content and cannot be put
# on a GitHub runner - so this gate runs on a machine with the game installed
# and nowhere else. PUC Lua accepting a file proves nothing about it: that is
# what 255d992 cost, and it is why CI's shipped job prints NOT EXERCISED for
# this check rather than a green tick.
#
# Exit 0 every shipped file compiles, 1 one did not, 2 the gate could not run.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
. tools/env.sh
if [ -z "${PZ_HOME:-}" ] || [ ! -f "$PZ_HOME/projectzomboid.jar" ]; then
    echo "KAHLUA GATE NOT EXERCISED: no projectzomboid.jar (set PZ_HOME)"
    exit 2
fi
out="$(tools/kahlua/run.sh --parse-all 2>&1)"; rc=$?
line="$(tail -1 <<<"$out")"
echo "$line"
if [ $rc -ne 0 ] || ! grep -q ", 0 failed" <<<"$line"; then
    sed 's/^/  /' <<<"$out" | tail -20
    echo "KAHLUA GATE: FAIL"
    exit 1
fi
echo "KAHLUA GATE: PASS ($PZ_HOME)"
