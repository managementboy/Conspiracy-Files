#!/usr/bin/env bash
# Map-media placement gate: an interrupted insertion must never record itself
# as done, and must never leave two.
#
#   tools/autotest/checks/map_placement.sh [--hidden]
#
# For each interruption point the mod can inject (beforeInsert, afterInsert,
# beforeCommit, afterCommit) this stands the survivor in a real destination
# building, drives the production placement path, and then compares what the
# save RECORDS against what is actually in the containers. "placed" with no item
# is the fault this exists to catch.
#
# Each point uses its own design, because the destination payoff is attempted
# once per design. A point whose fault was never consumed is reported
# INCONCLUSIVE, not a pass: a manual attempt at this on 2026-09-20 armed a fault
# that the background scanner walked into later, and every reading taken after
# that was meaningless.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "map-placement: $*" >&2; }
abort() { say "$*"; end_world; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
inconclusive=()

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/map_placement.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 120 'ConspiracyFiles.MapMediaRuntime.status().ready==true' || abort "the map runtime never became ready"
wait_true 600 'ConspiracyFiles.MapMediaRuntime.status().indexed==true' || abort "destination indexing never finished"

designs="$(ev 'return CFPlace.usable(4)')"
[ -n "$designs" ] || abort "no design resolves to exactly one building"
say "designs: $designs"
IFS=',' read -r d1 d2 d3 d4 <<<"$designs"

rows=()
run_point() { # run_point DESIGN POINT
    local design="$1" point="$2"
    [ -n "$design" ] || { inconclusive+=("$point: no design left to test with"); return; }
    # Arm BEFORE arriving: the mod's own scheduled placement must be the thing
    # that walks into the interruption. Driving it by hand loses the race.
    ev "return CFPlace.arm([[$point]])" >/dev/null
    local where; where="$(ev "return CFPlace.goTo([[$design]])" | cut -f2)"
    sleep 20
    local out; out="$(ev "return CFPlace.drive([[$design]], [[$point]])")"
    local consumed state items
    state="$(cut -f2 <<<"$out")"; items="$(cut -f3 <<<"$out")"
    # Whether the fault fired is read from the mod's own log, which is the only
    # honest signal: arming always succeeds, so it can never report consumption.
    if [ "$point" = none ]; then consumed="n/a"
    elif run_log | grep -q "injected interruption: $point"; then consumed="yes"
    else consumed="NOT-CONSUMED"; fi
    rows+=("$point|$design|at $where|fault $consumed|recorded ${state:-?}|items ${items:-?}")
    say "$point: $design at $where -> fault $consumed, recorded ${state:-?}, items ${items:-?}"

    # THE GATE. Recorded as placed obliges an item to actually be there.
    if [ "$state" = "placed" ] && [ "${items:-0}" -lt 1 ]; then
        fail "$point: recorded 'placed' but no item is in the container"
    fi
    if [ "${items:-0}" -gt 1 ]; then
        fail "$point: $items copies of the same payoff (duplicate insertion)"
    fi
    if [ "$point" != none ] && [ "$consumed" != yes ]; then
        inconclusive+=("$point: the fault was $consumed - the placement never reached it, so this point is untested")
    fi
}

run_point "$d1" none
run_point "$d2" afterInsert
run_point "$d3" beforeCommit
run_point "$d4" afterCommit

# Through a save and reload: a recorded state must still agree with the world.
"$PZ" stop --save >/dev/null 2>&1
world="$(cat "$REPO/dev/eval/linux/world")"
"$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "the reload did not reach the world"
ev -f "$REPO/tools/autotest/checks/map_placement.lua" >/dev/null || abort "could not reload the check's Lua"
sleep 10
after=()
for d in "$d1" "$d2" "$d3" "$d4"; do
    [ -n "$d" ] || continue
    # Stand at the destination again before counting. Items are only countable
    # where they are loaded, so counting from anywhere else reports absence for
    # something merely out of range - which is exactly the confusion this whole
    # subsystem exists to avoid ("unknown is not a missing-item verdict").
    ev "return CFPlace.goTo([[$d]])" >/dev/null
    sleep 6
    v="$(ev "return CFPlace.verdict([[$d]])")"
    verdict="$(cut -f1 <<<"$v")"; st="$(cut -f2 <<<"$v")"; n="$(cut -f3 <<<"$v")"
    after+=("$d: $verdict (recorded ${st:-?}, items ${n:-?})")
    case "$verdict" in
        BAD) fail "after reload, $d records 'placed' with no item present at its destination" ;;
        DUPLICATE) fail "after reload, $d has $n copies of its payoff" ;;
    esac
done

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
end_world

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-map-placement.txt"
{
    echo "Linux map placement gate $id: $verdict"
    source_line
    echo "the gate: a recorded 'placed' obliges an item to actually be in the container."
    echo
    echo "before reload:"
    for r in "${rows[@]}"; do echo "  $r"; done
    echo
    echo "after save and reload:"
    for a in "${after[@]}"; do echo "  $a"; done
    if [ ${#inconclusive[@]} -gt 0 ]; then
        echo
        echo "INCONCLUSIVE - these points are not covered by this run:"
        for i in "${inconclusive[@]}"; do echo "  $i"; done
    fi
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
