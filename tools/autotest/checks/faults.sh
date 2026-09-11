#!/usr/bin/env bash
# Fault containment check (catalogue FC-01, gate E13): an adapter that fails
# must not crash the game, corrupt the saved case, or spam the log every frame.
#
#   tools/autotest/checks/faults.sh [--hidden]
#
# For each fault point: make that function throw, play the action that reaches
# it for 15 s, count what the mod logged, put the function back. Then the case
# must still validate and the next document must still inspect (recovery).
# Spam = one mod log line more than 30 times in a window, or more than 30
# caught errors (over 2 a second). In -debug the engine prints a full stack
# trace for every caught error; those lines are not the mod's own logging.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "faults: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
# Each point with the play that reaches it.
points=(DiscoveryLog.record SaveBudget.check GeneratedRuntime.inspect ClueMarkers.update ClueMarkers.draw
        WorldAccess.resolve WorldAccess.count AddressMap.labelForBuilding IdentityObservations.add)
action_for() {
    case "$1" in
        DiscoveryLog.record|SaveBudget.check|GeneratedRuntime.inspect|ClueMarkers.update) echo inspect ;;
        ClueMarkers.draw) echo map ;;
        WorldAccess.resolve|WorldAccess.count) echo near ;;
        AddressMap.labelForBuilding) echo notebook ;;
        IdentityObservations.add) echo bodies ;;
    esac
}

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop faults wallet_id; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"; done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done
# A second case, so there are documents enough for every point.
ev 'return CFLoop.noGap()' >/dev/null
wait_true 180 'CFLoop.caseCount()>=2' >/dev/null || say "only one case; some points may run idle"
ev 'CFLoop.docs(); return true' >/dev/null
ev 'ConspiracyFiles.AutomaticInvestigations.config.minGapHours=24; return true' >/dev/null
docs="$(ev 'return #CFLoop.docs()' | cut -f1)"; next=1
ev 'return CFLoop.givePen()' >/dev/null

rows=()
for point in "${points[@]}"; do
    mark="$(wc -l < "$CONSOLE")"
    ok="$(ev "return CFFault.inject('$point')")"
    [ "$(cut -f1 <<<"$ok")" = true ] || { fail "$point: could not inject ($(cut -f2 <<<"$ok"))"; continue; }
    case "$(action_for "$point")" in
        bodies) ev 'return CFWallet.spawnBodies(4)' >/dev/null; sleep 3; ev 'return CFWallet.openBodies()' >/dev/null
                action="opened 4 fresh bodies" ;;
        map)    ev 'return CFLoop.showMap(1)' >/dev/null; sleep 5; ev 'return CFLoop.hideMap()' >/dev/null
                action="opened the world map" ;;
        near)   if [ "$next" -le "$docs" ]; then ev "return CFLoop.approach($next)" >/dev/null; ev "CFLoop.find($next); return CFLoop.goTo($next)" >/dev/null
                    action="stood by unfound document $next"; else action="idle (no documents left)"; fi ;;
        notebook) ev 'ConspiracyFiles.NotebookUI.open("journal"); return true' >/dev/null; sleep 3
                  ev 'ConspiracyFiles.NotebookUI.open("evidence"); return true' >/dev/null; action="opened the notebook" ;;
        inspect) if [ "$next" -le "$docs" ]; then
                    r="$(inspect_doc "$next")" && action="inspected document $next ($r)" || action="document $next: $r"
                    next=$((next + 1))
                 else action="idle (no documents left)"; fi ;;
    esac
    sleep 15
    window="$(tail -n +"$((mark + 1))" "$CONSOLE")"
    modlines="$(grep -E '\[CF\]' <<<"$window" | sed 's/^.*> //; s/f:[0-9]*//')"
    errs="$(grep -cE '^ERROR.*Exception thrown' <<<"$window")"
    total="$(grep -c . <<<"$modlines")"
    top="$(sort <<<"$modlines" | uniq -c | sort -rn | head -1 | sed 's/^ *//')"
    topn="$(cut -d' ' -f1 <<<"$top")"
    alive="$(ev 'return true' | cut -f1)"
    ev "return CFFault.restore('$point')" >/dev/null
    valid="$(ev 'return CFFault.stateValid()')"
    rows+=("  $point: $action; $total mod log lines and $errs caught errors in 15 s; most repeated line x${topn:-0}; game answering: ${alive:-no}; case valid: $(cut -f1 <<<"$valid")")
    say "$point: $total lines, $errs errors, top x${topn:-0}"
    [ "${alive:-}" = true ] || fail "$point: the game stopped answering"
    [ "$(cut -f1 <<<"$valid")" = true ] || fail "$point: the saved case no longer validates: $(cut -f2 <<<"$valid")"
    [ "${topn:-0}" -le 30 ] || fail "$point: log spam, one message x$topn in 15 s: $(cut -d' ' -f2- <<<"$top" | cut -c1-160)"
    [ "${errs:-0}" -le 30 ] || fail "$point: $errs caught errors in 15 s (a retry every frame?)"
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
