#!/usr/bin/env bash
# Reload check: a save round trip keeps everything, three times over.
#
#   tools/autotest/checks/reload.sh [--hidden]
#
# Fresh world; find and inspect two of the first case's documents; snapshot
# the notebook order, the case's placements, the schedule and the save-budget
# total; save, quit, reload through the main menu's Continue; compare; repeat
# for three reloads. Catalogue PS-07 (round trip keeps order, text, size),
# PS-08 (no growth over three reloads), CG-02 (no reroll), AS-04 (clock kept).
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "reload: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
load_lua() {
    ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null && ev -f "$REPO/tools/autotest/checks/reload.lua" >/dev/null
}
snapshot() { # prints four lines: notebook, placement, schedule, bytes
    ev 'return CFReload.notebook()'; ev 'return CFReload.placement()'
    ev 'return CFReload.schedule()'; ev 'return CFReload.bytes()'
}

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
first="$(session)"; world="$(cat "$REPO/dev/eval/linux/world")"
load_lua || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done

# Progress worth keeping: two documents found and inspected.
for i in 1 2; do
    f="$(ev "return CFLoop.find($i)")"; h="$(cut -f3 <<<"$f")"
    if [[ "$h" == vehicle* ]]; then ev 'return CFLoop.enterVehicle()' >/dev/null; wait_true 30 'CFLoop.inVehicle()' >/dev/null
    else ev "return CFLoop.goTo($i)" >/dev/null; fi
    for _ in 1 2 3 4 5 6; do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 1; done
    ev 'return CFLoop.take()' >/dev/null; wait_true 20 'CFLoop.carried()' >/dev/null
    [ "$(ev 'return CFLoop.inspect()' | cut -f1)" = true ] || fail "could not inspect document $i before the first save"
    [[ "$h" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
done
sleep 3
before="$(snapshot)"
say "before: $(head -1 <<<"$before" | cut -c1-120)"
errors_seen=""

sizes=("$(sed -n 4p <<<"$before" | cut -f1)")
for round in 1 2 3; do
    errors_seen+="$(mod_errors)"
    "$PZ" stop --save >/dev/null 2>&1
    "$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "reload $round did not reach the world"
    load_lua || abort "could not reload the check's Lua after reload $round"
    wait_true 60 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || fail "reload $round: the case did not resume"
    sleep 5
    after="$(snapshot)"
    [ "$(sed -n 1p <<<"$after")" = "$(sed -n 1p <<<"$before")" ] || fail "reload $round: notebook changed: $(sed -n 1p <<<"$after" | cut -c1-200)"
    [ "$(sed -n 2p <<<"$after")" = "$(sed -n 2p <<<"$before")" ] || fail "reload $round: placements changed (reroll?): $(sed -n 2p <<<"$after" | cut -c1-200)"
    [ "$(sed -n 3p <<<"$after" | cut -f1-2)" = "$(sed -n 3p <<<"$before" | cut -f1-2)" ] || fail "reload $round: schedule changed: $(sed -n 3p <<<"$after")"
    sizes+=("$(sed -n 4p <<<"$after" | cut -f1)")
    say "reload $round: budget total ${sizes[-1]} bytes"
done
[ "${sizes[-1]}" -le "${sizes[0]}" ] || fail "budget total grew over three reloads: ${sizes[*]}"
errors_seen+="$(mod_errors)"
"$PZ" shot "$RUNS/$first-reload.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
[ -z "$errors_seen" ] || { verdict=FAIL; fails+=("errors inside the mod"); }
report="$EVIDENCE/$first-reload.txt"
{
    echo "Linux reload check $first: $verdict"
    source_line
    echo "world: $world; three save/quit/continue round trips after two documents were inspected"
    echo "notebook before: $(sed -n 1p <<<"$before" | tr '\t' ' ')"
    echo "placements before: $(sed -n 2p <<<"$before" | tr '\t' ' ')"
    echo "schedule before (count, last created hour, scheduled): $(sed -n 3p <<<"$before" | tr '\t' ' ')"
    echo "save-budget total per round (bytes): ${sizes[*]}"
    echo "errors inside the mod: $(grep -c . <<<"$errors_seen")"
    [ -z "$errors_seen" ] || sed 's/^/  /' <<<"$errors_seen" | head -10
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
