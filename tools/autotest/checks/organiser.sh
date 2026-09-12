#!/usr/bin/env bash
# The pocket organiser: a real carried device to read the investigation on.
#
#   tools/autotest/checks/organiser.sh [--hidden]
#
# PASS needs: one issued at spawn, marked favourite, with power; reading it
# opens the investigation; a flat battery refuses instead of opening; the
# Papers are still carried, so losing the device never costs the case
# (P4-R80); and it is still there, still ours, after a save and reload.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "organiser: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
ev -f "$REPO/tools/autotest/checks/organiser.lua" >/dev/null || abort "could not load the check's Lua"

state="$(ev 'return CFOrg.state()')"
[ "$(cut -f1 <<<"$state")" = true ] || abort "no organiser at spawn: $(cut -f2 <<<"$state")"
type="$(cut -f2 <<<"$state")"; power="$(cut -f3 <<<"$state")"; fav="$(cut -f4 <<<"$state")"
say "issued: $type power=$power favourite=$fav"
[ "$type" = "ConspiracyFiles.Organiser" ] || fail "wrong item type: $type"
[ "$fav" = true ] || fail "the organiser is not marked favourite"
[ "$power" != "nil" ] && [ "$power" != "0.0" ] || fail "issued with no power: $power"

r="$(ev 'return CFOrg.read()')"
[ "$(cut -f1 <<<"$r")" = true ] || fail "reading refused: $(cut -f2 <<<"$r")"
[ "$(ev 'return CFOrg.uiOpen()' | cut -f1)" = true ] || fail "reading did not open the investigation"
"$PZ" shot "$RUNS/$(session)-organiser.png" >/dev/null 2>&1
ev 'return CFOrg.closeUI()' >/dev/null

# A flat battery must refuse, not open a screen that is not lit.
ev 'return CFOrg.drain()' >/dev/null
flat="$(ev 'return CFOrg.read()')"
[ "$(cut -f1 <<<"$flat")" = false ] || fail "a flat organiser still opened the investigation"
[ "$(cut -f2 <<<"$flat")" = "flat battery" ] || say "refusal reason: $(cut -f2 <<<"$flat")"
[ "$(ev 'return CFOrg.papersHeld()' | cut -f1)" = true ] || fail "no Papers carried: nothing to read when the device is dead"
ev 'return CFOrg.charge()' >/dev/null

# Save, reload, and it is still ours: the mark lives on the item, not in a flag.
"$PZ" stop --save >/dev/null 2>&1 || abort "could not save and stop"
"$PZ" start --continue "${start_args[@]}" || abort "the save did not reload"
ev -f "$REPO/tools/autotest/checks/organiser.lua" >/dev/null || abort "could not reload the check's Lua"
again="$(ev 'return CFOrg.state()')"
[ "$(cut -f1 <<<"$again")" = true ] || fail "the organiser did not survive the reload: $(cut -f2 <<<"$again")"
[ "$(cut -f2 <<<"$again")" = "ConspiracyFiles.Organiser" ] || fail "after reload, wrong item: $(cut -f2 <<<"$again")"
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-organiser.txt"
{
    echo "$verdict organiser - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    echo "issued: $state"
    echo "after reload: $again"
    for f in "${fails[@]:-}"; do [ -n "$f" ] && echo "FAIL: $f"; done
} > "$out"
say "written: $out"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
