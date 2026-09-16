#!/usr/bin/env bash
# AD-10 step A (P4-R129): export every building on the map from the real game.
#
#   tools/autotest/checks/address_export.sh [NAME]
#
# Starts a fresh world on the real display (never --hidden: software OpenGL
# slows everything), runs checks/address_export.lua, and copies the result to
# dev/addresses/NAME.tsv (default: the session id). Run it twice and compare the
# two files to check building ids are the same in every world.
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
deadline=$(( $(date +%s) + 1800 ))
until s="$(ev 'return CFAddr.status()')"; [ "$(cut -f1 <<<"$s")" = true ]; do
    [ "$(cut -f4 <<<"$s")" = nil ] || abort "export failed: $(cut -f4 <<<"$s")"
    [ "$(date +%s)" -lt "$deadline" ] || abort "export did not finish in 30 minutes: $s"
    sleep 5
done
src="${PZ_ZOMBOID:-$HOME/Zomboid}/Lua/$file"
[ -s "$src" ] || abort "no export file at $src"
mkdir -p "$REPO/dev/addresses"
cp "$src" "$REPO/dev/addresses/$name.tsv"
say "written: dev/addresses/$name.tsv ($(grep -vc '^#' "$src") buildings)"
"$PZ" stop >/dev/null 2>&1
exit 0
