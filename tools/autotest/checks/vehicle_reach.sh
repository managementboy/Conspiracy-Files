#!/usr/bin/env bash
# Vehicle reach check: a paper in a van's truck bed and in its glove box is
# reached from OUTSIDE the van, shows in the loot panel and can be taken.
#
# The game never shows a truck bed to someone sitting inside the vehicle, and a
# glove box needs the passenger door (Vehicles.lua ContainerAccess). The core
# loop used to get in first and failed on a truck bed (20260914T173417) and a
# glove box (20260911T155401). Its fix reaches the part's own area; cases put
# clues in cars at random, so this spawns a van to make sure it is exercised.
#
#   tools/autotest/checks/vehicle_reach.sh [--hidden]
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "vehicle-reach: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.GeneratedRuntime~=nil' || abort "the mod never answered"
ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || abort "could not load core_loop.lua"
ev -f "$REPO/tools/autotest/checks/vehicle_reach.lua" >/dev/null || abort "could not load the check's Lua"

van="$(ev 'return CFVan.spawn()')"
[ "$(f 1 <<<"$van")" = true ] || abort "no van: $van"
say "van: $(tr '\t' ' ' <<<"$van")"
sleep 3

rows=()
for part in TruckBed GloveBox; do
    placed="$(ev "return CFVan.place('$part')")"
    [ "$(f 1 <<<"$placed")" = true ] || { fail "$part: $(f 2 <<<"$placed")"; continue; }
    sleep 2
    shut=""
    if [ "$part" = TruckBed ]; then
        # Only if it is open (owner, 2026-09-14): beside it with the door shut, refused.
        shut="$(ev 'return CFVan.accessWhileShut()')"; sleep 1
        shut="$(ev 'return CFVan.accessWhileShut()')"
        [ "$(f 1 <<<"$shut")" = true ] || fail "could not stand at the TruckBed: $shut"
        [ "$(f 2 <<<"$shut")" = false ] || fail "the TruckBed opened from outside with its trunk door still shut"
    fi
    reach="$(ev 'return CFLoop.reachPart()')"
    outside=no
    forced=no
    if [ "$(f 1 <<<"$reach")" = true ]; then
        if wait_true 12 'CFLoop.partAccess()'; then outside=yes
        else
            ev 'return CFLoop.forceOpen()' >/dev/null; forced=yes
            wait_true 8 'CFLoop.partAccess()' && outside=yes
        fi
    fi
    seated=no
    if [ "$outside" = no ]; then
        ev 'return CFLoop.enterVehicle()' >/dev/null; wait_true 30 'CFVan.inVehicle()' && seated=yes
    fi
    opened=no
    for _ in $(seq 16); do [ "$(ev 'return CFLoop.openContainer()' | f 1)" = true ] && { opened=yes; break; }; sleep 0.5; done
    ev 'return CFLoop.take()' >/dev/null
    taken=no; wait_true 20 'CFLoop.carried()' && taken=yes
    ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 2
    say "$part: from outside=$outside from a seat=$seated icon=$opened taken=$taken ($(f 3 <<<"$reach"))"
    rows+=("$part: allowed while shut=$(f 2 <<<"$shut"), door opened outright=$forced, reached from outside=$outside, from a seat=$seated, loot-panel icon=$opened, taken=$taken ($(f 3 <<<"$reach"))")
    # A truck bed from outside; a glove box only from a front seat (owner, 2026-09-14).
    if [ "$part" = TruckBed ]; then
        [ "$outside" = yes ] || fail "the TruckBed could not be reached from outside the van"
    else
        [ "$seated" = yes ] || fail "the GloveBox could not be reached from the front seat"
    fi
    [ "$opened" = yes ] || fail "the loot panel never showed the $part"
    [ "$taken" = yes ] || fail "the paper in the $part never reached the inventory"
done

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $(head -1 <<<"$errors")"
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-vehicle-reach.txt"
{
    echo "Linux vehicle reach check $id: $verdict"
    source_line
    echo "van: $(tr '\t' ' ' <<<"$van")"
    printf '%s\n' "${rows[@]}"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
