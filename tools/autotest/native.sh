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
# The gameplay gates from the writing-rebuild handoff, each exercised and
# recorded on its own (task 6, 2026-09-22). Short enough to run together.
GATES=(checks/opening_in_play.sh checks/pair_in_play.sh checks/marker_lifecycle.sh
       checks/map_placement.sh checks/organiser.sh checks/knox.sh)
PZ="$HOME/.steam/steam/steamapps/common/ProjectZomboid"

if [ "${1:-}" = "--list" ]; then
    echo "suite.sh   20 checks, about 35 min      tools/autotest/suite.sh"
    echo "campaign   about 90 min                 tools/autotest/checks/campaign.sh"
    echo "travel     about 25 min                 tools/autotest/checks/travel.sh"
    echo "instalments about 25 min                tools/autotest/checks/instalments.sh"
    echo "promise    about 10 min                 tools/autotest/checks/promise.sh"
    echo "--gates    the six gameplay gates         tools/autotest/native.sh --gates"
    echo "  opening_in_play, pair_in_play, marker_lifecycle, map_placement, organiser, knox"
    echo "all of the above require Project Zomboid"
    exit 0
fi

[ -d "$PZ" ] || { echo "NATIVE NOT EXERCISED: Project Zomboid is not installed at $PZ"; exit 3; }

if [ "${1:-}" = "--gates" ]; then
    shift; pass=0; total=0; results=()
    for c in "${GATES[@]}"; do
        total=$((total + 1))
        # CAPTURE THE STATUS BEFORE ANYTHING ELSE RUNS. `$?` inside the else
        # branch is the status of the LAST command, and $(basename ...) runs
        # first - so a failed gate was reported as "FAIL ... (exit 0)", which
        # is self-contradictory and was (2026-09-22).
        "tools/autotest/$c" "$@"; rc=$?
        name="$(basename "$c" .sh)"
        if [ "$rc" -eq 0 ]; then pass=$((pass + 1)); results+=("$name: PASS")
        elif [ "$rc" -eq 1 ]; then results+=("$name: FAIL (exit 1)")
        else results+=("$name: COULD NOT RUN (exit $rc)"); fi
    done
    printf '%s\n' "${results[@]}"
    echo "gameplay gates: $pass of $total passed"
    [ "$pass" -eq "$total" ]
    exit
fi

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
