#!/usr/bin/env bash
# Check landmark coordinates against the INSTALLED map.
#
#   tools/verify_landmarks.sh docs/design/landmarks.md
#   tools/verify_landmarks.sh -            (read the table from stdin)
#
# Accepts any text containing rows with a bracketed pair, e.g.
#   | 30 | **Muldraugh Police Station** | Muldraugh | [10725, 9870] | High | ...
# and reports which coordinates land on a map cell that actually exists.
#
# Why this exists: a landmark atlas looks authoritative and is usually
# transcribed or generated rather than measured. A sample of 39 rows checked on
# 2026-09-08 had 9 pointing at cells that do not exist - all of Louisville, and
# Riverside's waterfront - because the map's northern arm starts at cellX 45
# (x >= 13500) and everything south of that begins at cellY 18 (y >= 5400).
# Placing a clue at a coordinate with no cell means a case that can never be
# completed, and the player would have no way to know why.
#
# A cell existing is necessary, not sufficient: it proves the tile is inside
# the world, not that a race track is there. Only the game can tell you that,
# by going and looking.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"

CELLS="$PZ_HOME/media/maps/Muldraugh, KY"
[ -d "$CELLS" ] || { echo "map cells not found under $PZ_HOME (set PZ_HOME)" >&2; exit 2; }

src="${1:-}"
[ -n "$src" ] || { echo "usage: $0 <file with a landmark table> | -" >&2; exit 2; }
[ "$src" = "-" ] && src=/dev/stdin

# Cell size is 300 tiles. A cell is present when its .lotheader is.
total=0; good=0
missing=""
while IFS= read -r line; do
    coords="$(printf '%s' "$line" | grep -oE '\[[0-9]+, *[0-9]+\]' | head -1 || true)"
    [ -n "$coords" ] || continue
    x="$(printf '%s' "$coords" | sed 's/\[\([0-9]*\),.*/\1/')"
    y="$(printf '%s' "$coords" | sed 's/.*, *\([0-9]*\)\]/\1/')"
    label="$(printf '%s' "$line" | grep -oE '\*\*[^*]+\*\*' | head -1 | tr -d '*' || true)"
    [ -n "$label" ] || label="$(printf '%s' "$line" | cut -c1-40)"
    total=$((total + 1))
    cx=$((x / 300)); cy=$((y / 300))
    if [ -f "$CELLS/${cx}_${cy}.lotheader" ]; then
        good=$((good + 1))
    else
        missing="${missing}  [${x}, ${y}] -> cell ${cx}_${cy} does not exist   ${label}
"
    fi
done < "$src"

[ "$total" -gt 0 ] || { echo "no bracketed coordinates found; expected rows containing [X, Y]" >&2; exit 2; }

if [ -n "$missing" ]; then
    echo "OFF-MAP COORDINATES:"
    printf '%s' "$missing"
    echo
fi
bad=$((total - good))
echo "$good of $total coordinates land on a real map cell; $bad do not."
if [ "$bad" -gt 0 ]; then
    echo
    echo "An off-map coordinate cannot hold a clue. A case anchored there would"
    echo "defer forever, and the player would never learn why."
    exit 1
fi
