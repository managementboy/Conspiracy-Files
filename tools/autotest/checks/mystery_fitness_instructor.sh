#!/usr/bin/env bash
# THE FITNESS TEN, REDESIGNED - PROVEN LIVE, NOT RETIRED.
#
#   tools/autotest/checks/mystery_fitness_instructor.sh
#
# docs/design/EVERY_MYSTERY_ITS_OWN_2026-09-25.md §5 step 6 and the
# owner's own answer, DR-20260925-MYSTERY-BOUNDARIES q6: "Include them all
# in the redesign." One mystery, not ten variants of one shape: a door
# GATE that reads a real IsoDoor's own lock state, a vehicle-trunk
# placement channel neither earlier mystery exercised, and CLOSE=all
# completing only once every declared finding - the door included - is
# known.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "mystery-fitness-instructor: $*" >&2; }
fails=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
id="$(session)"
ev -f "$REPO/tools/autotest/checks/mystery_fitness_instructor.lua" >/dev/null || { say "fixtures did not load"; exit 2; }

# 1. ATTACH: a valid, linted mystery attaches to the save.
attach="$(ev 'return CFMyst.attach()')"
rows+=("attach: $(tr '\t' ' ' <<<"$attach")")
say "${rows[-1]}"
[ "$(f 1 <<<"$attach")" = true ] || { say "the mystery would not attach: $attach"; exit 2; }

status0="$(ev 'return CFMyst.status()')"
rows+=("status before anything is known: $status0")
say "${rows[-1]}"
[ "$status0" = carried ] || fail "an unattempted close=all mystery must report carried, not $status0"

# 2. A real van, in range of Session.VEHICLE_RADIUS - the autotest spawn's
#    own nearest vehicle sits well outside a driveway's radius, and the
#    runtime is right to refuse claiming one that far as "nearby" (see
#    mystery_fitness_instructor.lua's own note). Same precedent
#    checks/vehicle_reach.lua already set.
spawnvehicle="$(ev 'return CFMyst.spawnVehicle()')"
rows+=("spawned van: $(tr '\t' ' ' <<<"$spawnvehicle")")
say "${rows[-1]}"
[ "$(f 1 <<<"$spawnvehicle")" = true ] || { say "no van could be spawned near the survivor: $spawnvehicle"; exit 2; }

# 3. PLACE: the onMe key straight into the survivor's inventory, the site
#    findings into real containers, the vehicle finding into the van's own
#    trunk, and one real door tagged for the GATE - four channels, one call.
place="$(ev 'return CFMyst.place()')"
rows+=("place: $(tr '\t' ' ' <<<"$place")")
say "${rows[-1]}"
[ "$(f 1 <<<"$place")" = true ] && [ "$(f 2 <<<"$place")" -ge 1 ] 2>/dev/null \
    || fail "nothing was placed near the survivor: $place"

# 4. RECOGNISE: picking up every marked item, ground and trunk alike.
collected="$(ev 'return CFMyst.collect()')"
rows+=("collected: $collected marked item(s)")
say "${rows[-1]}"
ev 'return CFMyst.poll()' >/dev/null
record1="$(ev 'return CFMyst.record()')"
rows+=("record after collecting: $record1")
say "${rows[-1]}"
grep -qi "no memory of taking it" <<<"$record1" || fail "the onMe key's own reveal never reached the record: $record1"

status1="$(ev 'return CFMyst.status()')"
rows+=("status after collecting, before the door: $status1")
say "${rows[-1]}"
[ "$status1" = carried ] || fail "must still be carried before the door GATE fires, not $status1"

# 5. THE GATE: a real door, actually unlocked - not a threshold.
unlock="$(ev 'return CFMyst.unlockTaggedDoor("doorConfirmed")')"
rows+=("door unlocked: $unlock")
say "${rows[-1]}"
[ "$unlock" = true ] || fail "no tagged door could be unlocked: $unlock"
ev 'return CFMyst.poll()' >/dev/null

status2="$(ev 'return CFMyst.status()')"
rows+=("status once every declared finding, the door included, is known: $status2")
say "${rows[-1]}"
[ "$status2" = completed ] || fail "close=all must complete once every key including the door is known, got $status2"

record2="$(ev 'return CFMyst.record()')"
rows+=("record after the gate: $record2")
say "${rows[-1]}"
grep -qi "no longer a question" <<<"$record2" || fail "the door's own reveal never reached the record: $record2"
grep -qi "nothing here says which" <<<"$record2" || fail "the final, still-undecided reveal never reached the record: $record2"

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
end_world

verdict=PASS
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-mystery-fitness-instructor.txt"
{
    echo "Linux mystery (fitness instructor, welfare visit - the Fitness ten redesigned) $id: $verdict"
    source_line
    printf '  %s\n' "${rows[@]}"
    echo
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
}
cf_main "$@"
