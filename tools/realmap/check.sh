#!/usr/bin/env bash
# Is the map-derived data we ship still true on the installed game? No window, no player, ~2 minutes.
#   tools/realmap/check.sh
# 1. asks the game's own server, in two separate new worlds, for every building on the real map
# 2. compares both with the reference export the shipped data was built from (dev/addresses/world1.tsv)
# 3. says which shipped data files refer to buildings the update changed, or that differ from world to world
# Exit: 0 shipped data unaffected | 1 something shipped refers to such a building | 2 could not run | 20 no game here
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
a="$(mktemp /tmp/cf_world_a.XXXXXX)"; b="$(mktemp /tmp/cf_world_b.XXXXXX)"; trap 'rm -f "$a" "$b"' EXIT
tools/realmap/export_server.sh "$a"; code=$?; [ "$code" = 0 ] || exit "$code"
tools/realmap/export_server.sh "$b"; code=$?; [ "$code" = 0 ] || exit "$code"
python3 tools/realmap/compare_export.py dev/addresses/world1.tsv "$a" | tail -1
python3 tools/realmap/compare_export.py "$a" "$b" | tail -1 | sed 's/real map vs reference export/world A vs world B/'
python3 tools/realmap/impact.py dev/addresses/world1.tsv "$a" "$b"
