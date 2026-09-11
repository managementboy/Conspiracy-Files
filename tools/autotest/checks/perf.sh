#!/usr/bin/env bash
# Performance check (catalogue PF-02, PF-03, gate E12): what the mod costs per
# frame during busy play, against the project's 2 ms/frame budget.
#
#   tools/autotest/checks/perf.sh [--hidden]
#
# Times the mod's per-frame handlers (CFPerf wraps them) through three busy
# minutes: bodies open in the loot panel (identity observer), documents found
# and inspected, the world map open (markers drawn), and the next case being
# prepared (the nearby scan). Adds the runtime scheduler's own peak and the
# scan's own frames-over-budget line. FAIL means a per-frame problem: a handler
# averaging over 0.5 ms, or at 2 ms or more in over 5% of its calls. Single
# stalls (a write after a discovery) are listed as FINDING lines.
# This laptop is slower than the owner's machine; compare there before acting.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "perf: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
points=(IdentityObserver.afterRender IdentityObserver.tick ClueMarkers.update ClueMarkers.draw
        AutomaticInvestigations.onTick CaseFile.onTick EvidencePickupHint.remindTick
        LocalPersonIntegration.tick DevEval.tick)

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop wallet_id perf; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"; done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done
for p in "${points[@]}"; do
    r="$(ev "return CFPerf.wrap('$p')")"; [ "$(cut -f1 <<<"$r")" = true ] || say "not timed: $p ($(cut -f2 <<<"$r"))"
done
ev 'return CFLoop.givePen()' >/dev/null

# Busy play.
ev 'return CFWallet.spawnBodies(6)' >/dev/null; sleep 3; ev 'return CFWallet.openBodies()' >/dev/null; sleep 20
for i in 1 2; do inspect_doc "$i" >/dev/null || say "document $i: could not inspect"; done
ev 'return CFLoop.showMap(1)' >/dev/null; sleep 20; ev 'return CFLoop.hideMap()' >/dev/null
ev 'return CFLoop.noGap()' >/dev/null
wait_true 150 'CFLoop.caseCount()>=2' >/dev/null || say "no second case during the window"
sleep 20

report_line="$(ev 'return CFPerf.report()')"
sched="$(ev 'local m=ConspiracyFiles.GeneratedRuntime.metrics(); return m and m.peakMs or "none"' | cut -f1)"
scan="$(run_log | grep -oE "callbacksOver2Ms='[0-9]+' frames='[0-9]+'.*peakMs='[0-9]+'" | tail -1)"
ev 'return CFPerf.unwrapAll()' >/dev/null
errors="$(mod_errors)"
"$PZ" stop >/dev/null 2>&1

rows=(); findings=()
while IFS= read -r row; do
    [ -n "$row" ] || continue
    rows+=("  $row")
    calls="$(grep -oE 'calls=[0-9]+' <<<"$row" | cut -d= -f2)"; over="$(grep -oE 'over2ms=[0-9]+' <<<"$row" | cut -d= -f2)"
    avg="$(grep -oE 'avg=[0-9.]+' <<<"$row" | cut -d= -f2)"
    [ "${calls:-0}" -gt 0 ] || continue
    # DevEval runs the test's own commands (spawning zombies, placing items):
    # reported, not judged.
    [[ "$row" == DevEval.* ]] && continue
    awk -v o="$over" -v c="$calls" 'BEGIN { exit !(o * 100 > c * 5) }' && fail "$(cut -d' ' -f1 <<<"$row"): at 2 ms or more in $over of $calls calls"
    max="$(grep -oE 'max=[0-9]+' <<<"$row" | cut -d= -f2)"
    [ "${over:-0}" -gt 0 ] && findings+=("$(cut -d' ' -f1 <<<"$row"): $over single stall(s), worst ${max} ms")
    awk -v a="$avg" 'BEGIN { exit !(a > 0.5) }' && fail "$(cut -d' ' -f1 <<<"$row"): averages ${avg} ms per call"
done < <(tr '|' '\n' <<<"$report_line" | sed 's/^ *//')
[ -z "$errors" ] || fail "errors inside the mod"

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-perf.txt"
{
    echo "Linux performance check $id: $verdict"
    source_line
    echo "machine: $(nproc) threads, $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^ //'); display ${DISPLAY:-?}"
    echo "per-frame handlers during three minutes of busy play (ms clock, aggregated):"
    printf '%s\n' "${rows[@]}"
    echo "runtime scheduler peak: ${sched} ms"
    echo "nearby scan for the second case: ${scan:-no scan line}"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
