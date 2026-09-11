#!/usr/bin/env bash
# Core loop check: a whole generated case, found and inspected the way a
# player does it, then what must happen after it completes.
#
#   tools/autotest/checks/core_loop.sh [--hidden]
#
# Covers (docs/management/TEST_CATALOGUE.md): CG-01, CG-06, AS-01, NB-03,
# MM-01 (no pen: pending), the retirement regressions NB-30 and the marker
# worker (no error when the case completes), MM-02 (a pen afterwards still
# marks the retired case), and AS-02 with the 24 h gap removed for pacing.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "core-loop: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

# Wait until every document of the first case is placed.
deadline=$(( $(date +%s) + 180 ))
while :; do
    summary="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$summary")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE "[0-9]+:(pending|placing)" <<<"$summary" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $summary"
    sleep 3
done
say "case placed: $summary"

rows=()
for i in $(seq 1 "$n"); do
    found="$(ev "return CFLoop.find($i)")"
    [ "$(cut -f1 <<<"$found")" = true ] || { fail "document $i not found where the runtime says: $(cut -f2 <<<"$found")"; continue; }
    name="$(cut -f2 <<<"$found")"; holder="$(cut -f3 <<<"$found")"; room="$(cut -f4 <<<"$found")"; floor="$(cut -f5 <<<"$found")"
    if [[ "$holder" == vehicle* ]]; then
        ev 'return CFLoop.enterVehicle()' >/dev/null
        wait_true 30 'CFLoop.inVehicle()' || fail "document $i ($name, $holder): could not get into the vehicle"
    else
        ev "return CFLoop.goTo($i)" >/dev/null
    fi
    opened=no
    for _ in 1 2 3 4 5 6 7 8; do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && { opened=yes; break; }; sleep 1; done
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { fail "document $i ($name) never reached the inventory"; continue; }
    menu="$(ev 'return CFLoop.inspect()')"
    [ "$(cut -f1 <<<"$menu")" = true ] || { fail "document $i ($name): $(cut -f2 <<<"$menu")"; continue; }
    wait_true 10 'CFLoop.inspected()' || fail "document $i ($name) not marked inspected"
    ev "return CFLoop.remember($i)" >/dev/null
    [[ "$holder" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
    rows+=("  $i. $name, in $holder, room $room, floor $floor (container icon clicked: $opened)")
    [ "$opened" = yes ] || fail "document $i ($name): the loot panel never showed its $holder"
    say "document $i: $name"
done

sleep 5
known="$(ev 'return CFLoop.known()' | cut -f1)"
[ "$known" = "$n" ] || fail "notebook knows $known of $n documents"
completed=no; run_log | grep -q "Case complete" && completed=yes
[ "$completed" = yes ] || fail "the case never reported completion"
before_pen="$(ev 'return CFLoop.markers()')"
[ "$(cut -f2 <<<"$before_pen")" = "$n" ] || fail "without a pen, expected $n pending marks: $before_pen"

# A pen after the case retired: the marks must still catch up.
ev 'return CFLoop.givePen()' >/dev/null; sleep 4
after_pen="$(ev 'return CFLoop.markers()')"
[ "$(cut -f1 <<<"$after_pen")" = "$n" ] || fail "with a pen after completion, expected $n written marks: $after_pen"
ev 'return CFLoop.showMap()' >/dev/null; sleep 3
"$PZ" shot "$RUNS/$id-map.png" >/dev/null 2>&1
ev 'return CFLoop.hideMap()' >/dev/null
run_log | grep -qE "Map overlay stopped|Worker stopped" && fail "a marker component stopped: $(run_log | grep -oE '(Map overlay|Worker) stopped: .*' | head -1)"

# The next case, with the 24 h gap removed for test pacing.
ev 'return CFLoop.noGap()' >/dev/null
wait_true 150 'CFLoop.caseCount()>=2' && next_case=yes || { next_case=no; fail "no second case within 150 s with the gap removed"; }
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-core-loop.txt"
{
    echo "Linux core loop check $id: $verdict"
    source_line
    echo "first case: $n documents, all found and inspected through the right-click menu:"
    printf '%s\n' "${rows[@]}"
    echo "notebook entries: $known; case completion reported: $completed"
    echo "map marks without a pen (written/pending/missing): $(tr '\t' '/' <<<"$before_pen")"
    echo "map marks after a pen, case already retired: $(tr '\t' '/' <<<"$after_pen")"
    echo "second case appeared (gap removed): $next_case"
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "screenshot: dev/eval/linux/runs/$id-map.png (not committed)"
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
