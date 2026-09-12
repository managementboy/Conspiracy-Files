#!/usr/bin/env bash
# What the ~12 ms stall after a discovery is actually made of (WP5 in
# docs/design/READING_SURFACES.md, catalogue PF-02 / gate E12).
#
#   tools/autotest/checks/writecost.sh [--hidden]
#
# The weekend run measured the whole write at about 12 ms on this laptop and
# stopped there, which is not enough to choose a fix: spreading writes over
# several frames is a large change and only worth it if the cost is spread.
# This times the parts separately over a whole case found the way a player
# finds it, so the answer is a number per part, not an opinion:
#
#   DiscoveryLog.record      the whole write, as the player feels it
#   DiscoveryLedger.record   copy every event, validate the staged copy
#   DiscoveryLedger.validate the closed-world check over the ledger
#   SaveBudget.check         the size estimate before the save write
#   ClueMarkers.after        the map mark written at the pickup
#   ClueMarkers.update       the marker worker's own per-tick share
#
# Reports, never fails on a threshold: this is a measurement, and the machine
# it runs on is slower than the owner's. Exit 0 measured, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "writecost: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }

points=(DiscoveryLog.record DiscoveryLedger.record DiscoveryLedger.validate
        SaveBudget.check ClueMarkers.after ClueMarkers.update)

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop perf; do
    ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"

deadline=$(( $(date +%s) + 180 ))
while :; do
    summary="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$summary")"
    [ "${n:-0}" -gt 0 ] && ! grep -qE "[0-9]+:(pending|placing)" <<<"$summary" && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $summary"
    sleep 3
done
say "case placed: $summary"

# Timed from before the first discovery, so the first write - the expensive one,
# on a cold cache - is inside the sample rather than warming it up.
for p in "${points[@]}"; do
    r="$(ev "return CFPerf.wrap('$p')")"
    [ "$(cut -f1 <<<"$r")" = true ] || say "not timed: $p ($(cut -f2 <<<"$r"))"
done
# A pen, so map marks are written at the discovery rather than queued: the
# queued path would hide exactly the cost being measured.
ev 'return CFLoop.givePen()' >/dev/null

for i in $(seq 1 "$n"); do
    ev "return CFLoop.approach($i)" >/dev/null; sleep 2
    found="$(ev "return CFLoop.find($i)")"
    [ "$(cut -f1 <<<"$found")" = true ] || { say "document $i not where the runtime says; skipped"; continue; }
    holder="$(cut -f3 <<<"$found")"
    if [[ "$holder" == vehicle* ]]; then
        ev 'return CFLoop.enterVehicle()' >/dev/null; wait_true 30 'CFLoop.inVehicle()' || say "could not enter the car"
    else
        ev "return CFLoop.goTo($i)" >/dev/null
    fi
    for _ in 1 2 3 4 5 6 7 8; do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 1; done
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { say "document $i never reached the inventory"; continue; }
    ev 'return CFLoop.inspect()' >/dev/null
    wait_true 10 'CFLoop.inspected()' || say "document $i not marked inspected"
    [[ "$holder" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
    say "document $i inspected"
done

sleep 5
report="$(ev 'return CFPerf.report()' | tr '|' '\n')"
errors="$(mod_errors)"
"$PZ" stop

out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-writecost.txt"
{
    echo "write cost, by part - $(date -Is)"
    echo "build: $(grep -o 'DEV-[^\"]*' "$REPO/mod/common/media/lua/shared/ConspiracyFiles/Version.lua" | head -1)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    echo "session: $id   documents: $n"
    echo
    echo "$report"
    echo
    echo "Read it as: max is the single stall the player feels; avg over calls is"
    echo "what it costs across a session. If DiscoveryLedger.validate carries most"
    echo "of DiscoveryLog.record's max, the fix is to check only the new entry"
    echo "while playing and keep the full check for load (WP5). If the cost is"
    echo "spread evenly across the parts, only then is a deferred write queue"
    echo "worth its risk."
    [ -n "$errors" ] && { echo; echo "errors inside the mod:"; echo "$errors"; }
} > "$out"
say "written: $out"
cat "$out"
exit 0
