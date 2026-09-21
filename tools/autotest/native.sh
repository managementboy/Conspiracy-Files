#!/usr/bin/env bash
# The NATIVE acceptance tier. THIS TIER NEEDS PROJECT ZOMBOID. It boots a real
# game, drives it through the eval channel and reads the console log back;
# nothing here can run on a machine without the game installed, and nothing
# here can run on hosted CI.
#
#   tools/autotest/native.sh --list       what exists and what it costs
#   tools/autotest/native.sh              tools/autotest/suite.sh's 20 checks
#   tools/autotest/native.sh --long       the long gates that are not in suite.sh
#
# Why --long is separate: campaign, travel, instalments and promise each take
# between ten minutes and an hour and a half, so suite.sh does not carry them
# and nobody runs them by accident. They are still acceptance gates.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
LONG=(checks/campaign.sh checks/travel.sh checks/instalments.sh checks/promise.sh)
PZ="$HOME/.steam/steam/steamapps/common/ProjectZomboid"

if [ "${1:-}" = "--list" ]; then
    echo "suite.sh   20 checks, about 35 min      tools/autotest/suite.sh"
    echo "campaign   about 90 min                 tools/autotest/checks/campaign.sh"
    echo "travel     about 25 min                 tools/autotest/checks/travel.sh"
    echo "instalments about 25 min                tools/autotest/checks/instalments.sh"
    echo "promise    about 10 min                 tools/autotest/checks/promise.sh"
    echo "all of the above require Project Zomboid"
    exit 0
fi

[ -d "$PZ" ] || { echo "NATIVE NOT EXERCISED: Project Zomboid is not installed at $PZ"; exit 3; }

if [ "${1:-}" = "--long" ]; then
    shift; pass=0; total=0
    for c in "${LONG[@]}"; do
        total=$((total + 1))
        if "tools/autotest/$c" "$@"; then pass=$((pass + 1)); echo "$(basename "$c" .sh): PASS"
        else echo "$(basename "$c" .sh): FAIL"; fi
    done
    echo "native long gates: $pass of $total passed"
    [ "$pass" -eq "$total" ]
else
    exec tools/autotest/suite.sh "$@"
fi
