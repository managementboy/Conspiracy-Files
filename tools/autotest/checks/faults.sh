#!/usr/bin/env bash
# Fault containment check (catalogue FC-01, gate E13): an adapter that fails
# must not crash the game, corrupt the saved case, or spam the log every frame.
#
#   tools/autotest/checks/faults.sh [--hidden]
#
# For each fault point: make that function throw, play the action that reaches
# it for 15 s, count what the mod logged, put the function back. Then the case
# must still validate and the next document must still inspect (recovery).
# Spam = one message more than 30 times in a window (over 2 a second).
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "faults: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
points=(WorldAccess.resolve WorldAccess.count AddressMap.labelForBuilding DiscoveryLog.record
        SaveBudget.check GeneratedRuntime.inspect ClueMarkers.update IdentityObservations.add)

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop faults wallet_id; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"; done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done
docs="$(cut -f1 <<<"$s")"; next=1
ev 'return CFLoop.givePen()' >/dev/null

rows=()
for point in "${points[@]}"; do
    mark="$(wc -l < "$CONSOLE")"
    ok="$(ev "return CFFault.inject('$point')")"
    [ "$(cut -f1 <<<"$ok")" = true ] || { fail "$point: could not inject ($(cut -f2 <<<"$ok"))"; continue; }
    if [ "$point" = IdentityObservations.add ]; then
        ev 'return CFWallet.spawnBodies(4)' >/dev/null; sleep 3; ev 'return CFWallet.openBodies()' >/dev/null
        action="opened 4 fresh bodies"
    elif [ "$next" -le "$docs" ]; then
        r="$(inspect_doc "$next")" && action="inspected document $next ($r)" || action="document $next: $r"
        next=$((next + 1))
    else
        action="idle (no documents left)"
    fi
    sleep 15
    window="$(tail -n +"$((mark + 1))" "$CONSOLE")"
    modlines="$(grep -E '\[CF\]|MOD:Conspiracy-Files' <<<"$window" | grep -v 'CF-EVAL' | sed 's/^.*> //; s/f:[0-9]*//')"
    total="$(grep -c . <<<"$modlines")"
    top="$(sort <<<"$modlines" | uniq -c | sort -rn | head -1 | sed 's/^ *//')"
    topn="$(cut -d' ' -f1 <<<"$top")"
    alive="$(ev 'return true' | cut -f1)"
    ev "return CFFault.restore('$point')" >/dev/null
    valid="$(ev 'return CFFault.stateValid()')"
    rows+=("  $point: $action; $total mod lines in 15 s; most repeated x${topn:-0}; game answering: ${alive:-no}; case valid: $(cut -f1 <<<"$valid")")
    say "$point: $total lines, top x${topn:-0}"
    [ "${alive:-}" = true ] || fail "$point: the game stopped answering"
    [ "$(cut -f1 <<<"$valid")" = true ] || fail "$point: the saved case no longer validates: $(cut -f2 <<<"$valid")"
    [ "${topn:-0}" -le 30 ] || fail "$point: log spam, one message x$topn in 15 s: $(cut -d' ' -f2- <<<"$top" | cut -c1-160)"
done

# Recovery: with every function restored, the next document still inspects.
if [ "$next" -le "$docs" ]; then
    r="$(inspect_doc "$next")" && recovery="document $next inspected ($r)" || { recovery="$r"; fail "no recovery after the faults: $r"; }
else recovery="no document left to try"; fi
"$PZ" shot "$RUNS/$id-faults.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-faults.txt"
{
    echo "Linux fault containment check $id: $verdict"
    source_line
    echo "each function made to throw for 15 s of play, then restored:"
    printf '%s\n' "${rows[@]}"
    echo "recovery afterwards: $recovery"
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
