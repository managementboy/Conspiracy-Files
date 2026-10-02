#!/usr/bin/env bash
# Do the mod's ground readers (door / indoor floor / open ground) agree with the real world?
#
#   tools/autotest/checks/ground_truth.sh [BUILDINGS]      default 8 buildings near Muldraugh
#
# Real display only (never --hidden). In a fresh world the survivor is teleported to real buildings near
# Muldraugh, the mod's own readers are asked about squares whose truth is read independently from the world's
# objects, and every answer is compared. The headless tests (tools/realengine) prove the CALLS are valid; this
# is the only check that proves the ANSWERS. Writes the comparison to dev/answers/ground_truth_<game>.tsv.
# Exit 0 every answer agreed, 1 some answer was wrong, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "ground-truth: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
count="${1:-8}"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
file="cf_ground_truth_$(session).txt"
ev -f "$REPO/tools/autotest/checks/ground_truth.lua" >/dev/null || abort "could not load the check's Lua"
r="$(ev "return CFTruth.start($count, [[$file]])")"
[ "$(cut -f1 <<<"$r")" = true ] || abort "could not start: $(cut -f2 <<<"$r")"
say "checking $(cut -f2 <<<"$r") buildings"
deadline=$(( $(date +%s) + 900 )); last=""
while :; do
    s="$(ev 'return CFTruth.step()')" || abort "a step failed: $s"
    [ "$(cut -f1 <<<"$s")" = true ] && break
    [ "$(cut -f5 <<<"$s")" = "$last" ] || { last="$(cut -f5 <<<"$s")"; say "$last"; }
    [ "$(date +%s)" -lt "$deadline" ] || abort "did not finish in 15 minutes: $s"
    sleep 0.5
done
checked="$(cut -f3 <<<"$s")"; wrong="$(cut -f4 <<<"$s")"
src="${PZ_ZOMBOID:-$HOME/Zomboid}/Lua/$file"
[ -s "$src" ] || abort "no result file at $src"
mkdir -p "$REPO/dev/answers"; cp "$src" "$REPO/dev/answers/ground_truth_$(sed -n 's/^# game //p' "$src").tsv"
say "$checked answers compared, $wrong wrong"
errs="$(mod_errors | wc -l)"; [ "$errs" = 0 ] || say "note: $errs error(s) inside the mod during the run"
"$PZ" stop >/dev/null 2>&1
if [ "$wrong" = 0 ] && [ "$checked" -gt 0 ]; then say "PASS"; exit 0; fi
say "FAIL"; exit 1
