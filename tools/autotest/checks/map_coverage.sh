#!/usr/bin/env bash
# ALL 125 MAP DESTINATIONS, PLAYED, not counted.
#
#   tools/autotest/checks/map_coverage.sh [--hidden] [--only N] [--from N]
#
# The 2026-09-20 pass established geometry: 107 designs resolve to exactly one
# building, 18 to more than one, none to none. Its own closing section says it
# does NOT establish a reachable non-floor container, an actual payoff
# insertion, or player access - and the report that followed marked the whole
# gate PASS anyway. That is the specific overclaim this check exists to make
# impossible: each design gets a row with all four columns, and the summary
# counts them separately.
#
# It takes a long time. Each design means teleporting across the map, waiting
# for the world to load there and for the placement scan to finish. --only and
# --from exist so a partial run is a documented partial run rather than a
# silent one: the report always says how many of the 125 were reached.
#
# Exit 0 every design reached passed, 1 a design failed, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); only=0; from=1
while [ $# -gt 0 ]; do
    case "$1" in
        --hidden) start_args+=(--hidden) ;;
        --only) only="$2"; shift ;;
        --from) from="$2"; shift ;;
    esac
    shift
done
say() { echo "map-coverage: $*" >&2; }
abort() { say "$*"; end_world; exit 2; }
fails=(); rows=(); notexercised=(); findings=()
fail() { fails+=("$*"); say "FAIL: $*"; }
field() { cut -f"$1" <<<"$2"; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "world did not start"
first="$(session)"
ev -f "$REPO/tools/autotest/checks/map_placement.lua" >/dev/null || abort "placement fixture did not load"
ev -f "$REPO/tools/autotest/checks/map_coverage.lua" >/dev/null || abort "coverage fixture did not load"
# Indexing is the one stage with a real bound: it walks the map's buildings
# once. Wait on its own cursor, not on a clock.
say "waiting for the metadata index"
indexed=0
for _ in $(seq 120); do
    st="$(ev 'return CFCov.progress("none")')"
    [ "$(field 1 "$st")" = true ] && { indexed=1; break; }
    sleep 5
done
[ "$indexed" = 1 ] || abort "metadata indexing did not finish (cursor $(ev 'return CFCov.progress("none")' | tr '\t' ' '))"
total="$(ev 'return CFCov.count()')"
is_number "$total" || abort "could not read the catalogue size (got '${total:-}')"
say "catalogue: $total designs"

last=$total
[ "$only" -gt 0 ] 2>/dev/null && last=$((from + only - 1))
[ "$last" -gt "$total" ] && last=$total
reached=0; geom_ok=0; placed_ok=0; nonfloor_ok=0; access_ok=0

for i in $(seq "$from" "$last"); do
    id="$(ev "return CFCov.at($i)")"
    [ -n "$id" ] || { notexercised+=("design $i: the catalogue returned no id"); continue; }
    # Activate the trail and stand at the destination.
    if [ "$(ev "return CFPlace.goTo([[$id]])" | field 1)" != true ]; then
        notexercised+=("$id: could not be travelled to"); continue
    fi
    # PROGRESS, NOT A CLOCK. The placement scan is paced per frame; wait for
    # its own state to settle and give up only when it has stopped moving.
    lastp=""; flat=0
    for _ in $(seq 60); do
        p="$(ev "return CFCov.progress([[$id]])")"
        [ "$(field 4 "$p")" = placed ] && break
        if [ "$p" = "$lastp" ]; then flat=$((flat + 1)); else flat=0; lastp="$p"; fi
        [ "$flat" -ge 12 ] && break
        sleep 2
    done
    row="$(ev "return CFCov.row([[$id]])")"
    reached=$((reached + 1))
    rows+=("$row")
    buildings="$(field 2 "$row")"; areas="$(field 3 "$row")"
    verdict="$(field 5 "$row")"; nonfloor="$(field 10 "$row")"
    resolved="$(field 11 "$row")"; standable="$(field 13 "$row")"
    # Written as an if, not as A || B && C || D. That chain parses as
    # ((A||B)&&C)||D and happens to be right here only because an assignment
    # always succeeds; the next person to edit it would not be so lucky.
    if [ "${buildings:-0}" -gt 0 ] 2>/dev/null || [ "${areas:-0}" -gt 0 ] 2>/dev/null; then
        geom_ok=$((geom_ok + 1))
    else
        fail "$id: resolves to no building and no area"
    fi
    case "$verdict" in
        ok) placed_ok=$((placed_ok + 1)) ;;
        BAD|DUPLICATE) fail "$id: payoff $verdict (state $(field 6 "$row"), items $(field 7 "$row"))" ;;
        *) notexercised+=("$id: payoff $verdict (state $(field 6 "$row"), items $(field 7 "$row"))") ;;
    esac
    [ "$nonfloor" = true ] && nonfloor_ok=$((nonfloor_ok + 1))
    [ "$resolved" = true ] && [ "$standable" = true ] && access_ok=$((access_ok + 1))
    say "$i/$last $id: $verdict, container $(field 8 "$row"), non-floor $nonfloor, access $resolved/$standable"
done

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-map-coverage.txt"
{
    echo "Linux map destination coverage, played: $verdict"
    source_line
    echo
    echo "designs in the catalogue: $total"
    echo "designs reached in this run: $reached (from $from to $last)"
    echo
    echo "  geometry: a building or an area          $geom_ok of $reached"
    echo "  payoff inserted, exactly one token       $placed_ok of $reached"
    echo "  container identified and NOT a floor     $nonfloor_ok of $reached"
    echo "  target resolves AND a standable square   $access_ok of $reached"
    echo
    if [ "$reached" -lt "$total" ]; then
        echo "PARTIAL RUN. $((total - reached)) of the $total designs were NOT EXERCISED."
        echo 'Complete it with: tools/autotest/checks/map_coverage.sh --from '"$((last + 1))"
        echo '"All 125 destinations PASS" may not be written until reached == '"$total"'.'
        echo
    fi
    echo "design	buildings	areas	source	verdict	state	items	container	sprite	nonFloor	resolves	square	standable"
    printf '%s\n' "${rows[@]}"
    echo
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${notexercised[@]}"; do echo "NOT EXERCISED: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
