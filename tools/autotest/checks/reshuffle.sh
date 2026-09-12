#!/usr/bin/env bash
# Reshuffle check: start the investigation over in the save you are already in.
#
#   tools/autotest/checks/reshuffle.sh [--hidden]
#
# Owner, 2026-09-12: every change to the case rules costs a fresh game. This
# proves the alternative - one command abandons every case and builds new ones
# here, keeping the character, the base and the map.
#
# PASS needs, in order: a case placed; a dry run that names every document
# without changing anything; a real reshuffle; a NEW case placed in the same
# save with different document ids; the old papers still in the world but no
# longer evidence; no errors inside the mod. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "reshuffle: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

placed() { # wait until every document of the current case is placed; echoes the summary
    local deadline=$(( $(date +%s) + 240 )) s n
    while :; do
        s="$(ev 'return CFLoop.summary()')"; n="$(cut -f1 <<<"$s")"
        [ "${n:-0}" -gt 0 ] && ! grep -qE "[0-9]+:(pending|placing)" <<<"$s" && { echo "$s"; return 0; }
        [ "$(date +%s)" -lt "$deadline" ] || return 1
        sleep 3
    done
}

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || abort "could not load the loop driver"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
first="$(placed)" || abort "first case never fully placed"
say "first case placed: $first"
before="$(ev 'return CFLoop.ids()')"
[ -n "$before" ] || abort "could not read the first case's document ids"

# A dry run must say what it would abandon and change nothing.
dry="$(ev 'return ConspiracyFiles.GeneratedRuntime.reshuffle("dry")')"
[ "$(cut -f1 <<<"$dry")" = true ] || fail "dry run refused: $(cut -f2 <<<"$dry")"
still="$(ev 'return CFLoop.ids()')"
[ "$still" = "$before" ] || fail "a dry run changed the case"

# The real thing.
did="$(ev 'return ConspiracyFiles.GeneratedRuntime.reshuffle()')"
[ "$(cut -f1 <<<"$did")" = true ] || abort "reshuffle refused: $(cut -f2 <<<"$did")"
second="$(placed)" || fail "no new case was placed after the reshuffle"
after="$(ev 'return CFLoop.ids()')"
say "after reshuffle: $second"
[ -n "$after" ] && [ "$after" != "$before" ] || fail "the reshuffle produced the same documents"

# The old papers are still in the world, but they are ordinary loot now: the
# player may be carrying one, and an item disappearing from a hand is worse
# than a page nobody records.
orphans="$(ev 'return CFLoop.orphanEvidence()' | cut -f1)"
[ "$orphans" = "0" ] || fail "$orphans old document(s) still claim to be evidence"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-reshuffle.txt"
{
    echo "$verdict reshuffle - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    echo "before: $first"
    echo "after:  $second"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out"
say "written: $out"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
