#!/usr/bin/env bash
# Fresh-world native placement and recovery gate. Exit 0 PASS, 1 FAIL,
# 2 INCONCLUSIVE. No unconsumed fault or absent positive placement can pass.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "map-placement: $*" >&2; }
abort() { say "$*"; end_world; exit 2; }
fails=(); inconclusive=(); rows=(); after=()
fail() { fails+=("$*"); say "FAIL: $*"; }
claim_game || exit 2
start_world "${start_args[@]}" || abort "world did not start"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/map_placement.lua" >/dev/null || abort "fixture did not load"
wait_true 600 'ConspiracyFiles.MapMediaRuntime.status().indexed==true' || abort "indexing did not finish"
designs="$(ev 'return CFPlace.usable(5)')"
IFS=',' read -r d1 d2 d3 d4 d5 <<<"$designs"
check_verdict() {
    local design="$1" phase="$2" result verdict state count
    result="$(ev "return CFPlace.verdict([[$design]])")"
    IFS=$'\t' read -r verdict state count <<<"$result"
    rows+=("$phase|$design|$verdict|recorded ${state:-?}|items ${count:-?}")
    case "$verdict" in
        ok) ;;
        BAD|DUPLICATE) fail "$phase $design: $verdict, recorded $state, items $count" ;;
        *) inconclusive+=("$phase $design: ${verdict:-no response}, recorded ${state:-?}, items ${count:-?}") ;;
    esac
}
run_point() {
    local design="$1" point="$2" interrupted
    [ -n "$design" ] || { inconclusive+=("$point: no unused destination available"); return; }
    ev 'return CFPlace.reset()' >/dev/null || { inconclusive+=("$point: reset failed"); return; }
    wait_true 600 'ConspiracyFiles.MapMediaRuntime.status().indexed==true' || { inconclusive+=("$point: indexing incomplete"); return; }
    [ "$(ev "return CFPlace.arm([[$point]],[[$design]])")" = true ] || { inconclusive+=("$point: arm failed"); return; }
    ev "return CFPlace.goTo([[$design]])" >/dev/null
    if [ "$point" != none ]; then
        if wait_true 240 "CFPlace.fired([[$design]],[[$point]])"; then
            interrupted="$(ev 'return CFPlace.faultState()')"
            rows+=("$point|$design|interrupted with recorded $interrupted")
            case "$point:$interrupted" in
                beforeInsert:none|afterInsert:intent|beforeCommit:intent|afterCommit:placed) ;;
                *) fail "$point $design: unexpected interruption state $interrupted" ;;
            esac
        else
            inconclusive+=("$point $design: scoped interruption never observed")
        fi
    fi
    # Clear even a fault that never fired before moving to a different case.
    ev 'return CFPlace.clear()' >/dev/null
    if ! wait_true 240 "CFPlace.placed([[$design]])"; then
        inconclusive+=("$point $design: no positive placement/reconciliation")
    fi
    check_verdict "$design" "$point"
}
run_point "${d1:-}" none
run_point "${d2:-}" beforeInsert
run_point "${d3:-}" afterInsert
run_point "${d4:-}" beforeCommit
run_point "${d5:-}" afterCommit
"$PZ" stop --save >/dev/null 2>&1 || abort "save failed"
world="$(cat "$REPO/dev/eval/linux/world")"
"$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "reload failed"
ev -f "$REPO/tools/autotest/checks/map_placement.lua" >/dev/null || abort "fixture reload failed"
wait_true 600 'ConspiracyFiles.MapMediaRuntime.status().indexed==true' || abort "reload indexing incomplete"
for d in "${d1:-}" "${d2:-}" "${d3:-}" "${d4:-}" "${d5:-}"; do
    [ -n "$d" ] || continue
    ev "return CFPlace.targetVisit([[$d]])" >/dev/null
    if ! wait_true 120 "CFPlace.observable([[$d]])"; then
        inconclusive+=("reload $d: persisted target not observable")
    fi
    check_verdict "$d" reload
done
errors="$(mod_errors)"
[ -z "$errors" ] || fail "unexpected mod errors: $errors"
end_world
verdict=PASS; code=0
if [ ${#inconclusive[@]} -gt 0 ]; then verdict=INCONCLUSIVE; code=2; fi
if [ ${#fails[@]} -gt 0 ]; then verdict=FAIL; code=1; fi
report="$EVIDENCE/$id-map-placement.txt"
{
    echo "Linux map placement gate $id: $verdict"
    source_line
    for r in "${rows[@]}"; do echo "  $r"; done
    for i in "${inconclusive[@]}"; do echo "INCONCLUSIVE: $i"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
exit "$code"
