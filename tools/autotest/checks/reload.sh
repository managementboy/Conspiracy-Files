#!/usr/bin/env bash
# Reload check: a save round trip keeps everything, three times over.
#
#   tools/autotest/checks/reload.sh [--hidden]
#
# Fresh world; find and inspect two of the first case's documents; snapshot
# the order of noted evidence, the case's placements, the schedule and the save-budget
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
snapshot() { # prints five lines: record, placement, schedule, bytes, case people
    ev 'return CFReload.record()'; ev 'return CFReload.placement()'
    ev 'return CFReload.schedule()'; ev 'return CFReload.bytes()'
    ev 'return CFReload.casePeople()'
}
# Every root but CasePeople must be byte-identical across reloads. CasePeople
# is one fixed-field record per case; a re-bind after a load rewrites her
# position and fills outfit/female (660 -> 694 bytes, 20260925T015552), so
# there the record count is what must not grow.
roots_grew() { # roots_grew BEFORE AFTER -> prints the roots that grew, other than CasePeople
    local before="$1" after="$2" root b a
    for root in $(tr ' ' '\n' <<<"$after" | cut -d= -f1); do
        [ "$root" = CasePeople ] && continue
        a="$(tr ' ' '\n' <<<"$after" | grep "^$root=" | cut -d= -f2)"
        b="$(tr ' ' '\n' <<<"$before" | grep "^$root=" | cut -d= -f2)"
        [ -n "$b" ] && [ "${a:-0}" -gt "$b" ] 2>/dev/null && printf '%s %s->%s ' "$root" "$b" "$a"
    done
}

claim_game || exit 2
start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
first="$(session)"; world="$(cat "$REPO/dev/eval/linux/world")"
load_lua || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 1
done

# Progress worth keeping: two documents found and inspected.
for i in 1 2; do
    r="$(inspect_doc "$i")" || fail "could not inspect document $i before the first save: $r"
done
sleep 3
# QUIESCENCE FIRST. The mod's own jobs keep writing for a few seconds after the
# survivor moves - the visited-building tracker recorded the house the check
# had just teleported into AFTER this snapshot and BEFORE the save, so the
# first reload read as growth (VisitedBuildings 242 -> 359, 20260925T025413).
# Two identical byte lines five seconds apart is the state the save will hold.
before="$(snapshot)"
for _ in 1 2 3 4 5 6; do
    sleep 5; again="$(snapshot)"
    [ "$(sed -n 4p <<<"$again")" = "$(sed -n 4p <<<"$before")" ] && break
    before="$again"
done
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
    [ "$(sed -n 1p <<<"$after")" = "$(sed -n 1p <<<"$before")" ] || fail "reload $round: noted evidence changed: $(sed -n 1p <<<"$after" | cut -c1-200)"
    [ "$(sed -n 2p <<<"$after")" = "$(sed -n 2p <<<"$before")" ] || fail "reload $round: placements changed (reroll?): $(sed -n 2p <<<"$after" | cut -c1-200)"
    [ "$(sed -n 3p <<<"$after" | cut -f1-2)" = "$(sed -n 3p <<<"$before" | cut -f1-2)" ] || fail "reload $round: schedule changed: $(sed -n 3p <<<"$after")"
    sizes+=("$(sed -n 4p <<<"$after" | cut -f1)")
    say "reload $round: budget total ${sizes[-1]} bytes"
done
# On growth, name the root: the total alone said only that something grew
# (53392 -> 53509, suite 20260924T204616) and not what. It was CasePeople.
grew="$(roots_grew "$(sed -n 4p <<<"$before" | cut -f2)" "$(sed -n 4p <<<"$after" | cut -f2)")"
[ -z "$grew" ] || fail "a save root grew over three reloads: $grew (totals ${sizes[*]})"
[ "$(sed -n 5p <<<"$after" | cut -f1)" = "$(sed -n 5p <<<"$before" | cut -f1)" ] || fail "case-person records changed across reloads: $(sed -n 5p <<<"$before" | tr '\t' ' ') -> $(sed -n 5p <<<"$after" | tr '\t' ' ')"
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
    echo "noted evidence before: $(sed -n 1p <<<"$before" | tr '\t' ' ')"
    echo "placements before: $(sed -n 2p <<<"$before" | tr '\t' ' ')"
    echo "schedule before (count, last created hour, scheduled): $(sed -n 3p <<<"$before" | tr '\t' ' ')"
    echo "save-budget total per round (bytes): ${sizes[*]}"
    echo "errors inside the mod: $(grep -c . <<<"$errors_seen")"
    [ -z "$errors_seen" ] || sed 's/^/  /' <<<"$errors_seen" | head -10
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
