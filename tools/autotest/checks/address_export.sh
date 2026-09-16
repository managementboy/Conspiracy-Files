#!/usr/bin/env bash
# AD-10 step A (P4-R129): export every building on the map from the real game.
#
#   tools/autotest/checks/address_export.sh [NAME]
#
# Starts a fresh world on the real display (never --hidden: software OpenGL
# slows everything), writes every building through checks/address_export.lua
# one batch per eval, and copies the result to dev/addresses/NAME.tsv (default:
# the session id). Run it twice and compare the two files to check building ids
# are the same in every world.
# Exit 0 exported, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "address_export: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
name="${1:-$(session)}"
file="cf_buildings_$name.txt"
ev -f "$REPO/tools/autotest/checks/address_export.lua" >/dev/null || abort "could not load the export Lua"
r="$(ev "return CFAddr.start([[$file]])")"
[ "$(cut -f1 <<<"$r")" = true ] || abort "export did not start: $(cut -f2 <<<"$r")"
say "exporting $(cut -f2 <<<"$r") buildings"
deadline=$(( $(date +%s) + 1800 )); last=-1; stalled=0
while :; do
    s="$(ev 'return CFAddr.step(200)')" || abort "a step failed: $s"
    done_="$(cut -f1 <<<"$s")"; n="$(cut -f2 <<<"$s")"
    [ "$done_" = true ] && break
    is_number "$n" || abort "a step returned no count: $s"
    if [ "$n" = "$last" ]; then stalled=$((stalled + 1)); [ "$stalled" -lt 5 ] || abort "no progress at $n: $s"; else stalled=0; fi
    last="$n"
    [ "$(date +%s)" -lt "$deadline" ] || abort "export did not finish in 30 minutes: $s"
    [ $((n % 2000)) -lt 200 ] && say "$n written"
done
src="${PZ_ZOMBOID:-$HOME/Zomboid}/Lua/$file"
[ -s "$src" ] || abort "no export file at $src"
mkdir -p "$REPO/dev/addresses"
cp "$src" "$REPO/dev/addresses/$name.tsv"
say "written: dev/addresses/$name.tsv ($(grep -vc '^#' "$src") buildings)"
"$PZ" stop >/dev/null 2>&1
exit 0
