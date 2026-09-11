#!/usr/bin/env bash
# Pacing check: the 24 in-game hour gap between cases (AS-02) and the 72 hour
# relocation of a clue nobody found (CP-07), with time run fast.
#
#   tools/autotest/checks/pacing.sh [--hidden] [--hours N]   (default 80)
#
# Fresh world, first case placed, nothing found. The player stands 40 tiles
# away (relocation waits while the player is near) and the game runs at the
# fastest speed. PASS: no second case before 24 h after the first, one soon
# after; by the end, clues left unfound for 72 h have relocated or say why
# they could not. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); target=80
while [ $# -gt 0 ]; do case "$1" in --hidden) start_args+=(--hidden); shift ;; --hours) target="$2"; shift 2 ;; *) shift ;; esac; done
say() { echo "pacing: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop reload pacing; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"; done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done
placed_before="$(ev 'return CFReload.placement()' | cut -f2)"
created="$(ev 'return CFPace.cases()' | cut -f2)"
away="$(ev 'return CFPace.stepAway()')"
[ "$(cut -f1 <<<"$away")" = true ] || abort "could not stand away from the case: $(cut -f2 <<<"$away")"
ev 'return CFPace.speed(4)' >/dev/null
say "first case created at hour $created; running time fast to hour $target"

second_at=""; last_count=1; started=$(date +%s)
while :; do
    sleep 10
    now="$(ev 'return CFPace.hours()' | cut -f1)"; count="$(ev 'return CFPace.cases()' | cut -f1)"
    [ -n "$now" ] || { fail "the game stopped answering"; break; }
    if [ -z "$second_at" ] && [ "${count:-1}" -ge 2 ]; then second_at="$now"; say "second case at hour $now"; fi
    # Keep the player away and time fast; a new case can pull attention nowhere.
    awk -v n="$now" -v t="$target" 'BEGIN { exit !(n >= t) }' && break
    [ $(( $(date +%s) - started )) -lt 3000 ] || { fail "time did not reach hour $target within 50 minutes (at $now)"; break; }
done
ev 'return CFPace.speed(1)' >/dev/null
placed_after="$(ev 'return CFReload.placement()' | cut -f2)"
reloc="$(run_log | grep -E 'RELOCATE|relocat' | sed 's/^.*> //' | cut -c1-200 | tail -8)"
errors="$(mod_errors)"
"$PZ" shot "$RUNS/$id-pacing.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

# AS-02: never before the gap, and not long after it.
if [ -z "$second_at" ]; then fail "no second case by hour $now (first at $created)"
else
    awk -v s="$second_at" -v c="$created" 'BEGIN { exit !(s >= c + 24) }' || fail "second case at hour $second_at, before the 24 h gap after $created"
    awk -v s="$second_at" -v c="$created" 'BEGIN { exit !(s <= c + 30) }' || fail "second case only at hour $second_at, over 6 h after the gap ended"
fi
# CP-07: after 72 h unfound, something must have happened, and said so.
moved="no"; [ "$placed_before" != "$placed_after" ] && moved="yes"
[ "$moved" = yes ] || [ -n "$reloc" ] || fail "after 72+ h nothing relocated and nothing was logged about relocation"
[ -z "$errors" ] || fail "errors inside the mod"

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-pacing.txt"
{
    echo "Linux pacing check $id: $verdict"
    source_line
    echo "first case created at hour $created; time run fast to hour ${now:-?} with the player 40 tiles away"
    echo "second case appeared at hour: ${second_at:-never}"
    echo "placements changed over the run: $moved"
    echo "  before: $placed_before"
    echo "  after:  $placed_after"
    echo "relocation log:"; [ -n "$reloc" ] && sed 's/^/  /' <<<"$reloc" || echo "  (none)"
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
