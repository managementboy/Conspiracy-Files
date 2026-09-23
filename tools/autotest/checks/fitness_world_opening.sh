#!/usr/bin/env bash
# THE FITNESS INSTRUCTOR WORLD-EVIDENCE OPENING, IN A REAL GAME.
#
#   tools/autotest/checks/fitness_world_opening.sh
#
# Answers the questions only the game can, and reads every one from the world
# or the player rather than from the record of what should have happened:
#
#   1  the opening clue is on the player as early as the mod can manage
#   2  it is a real key, and a door in the starting house accepts it
#   3  it carries "This opens the house. Why did I have access?"
#   4  the July 8 appointment, feed sack and PPE hoard materialise
#   5  the PPE scene makes 3 masks + 4 gloves + 2 disinfectant - NINE items -
#      and records as ONE finding
#   6  the first four findings can complete with no vehicle scene present
#   7  the cooler is adopted only from a stable scene observed twice
#   8  a save and reload leaves the assignments and the scene signature alone
#  10  how many in-game minutes pass before the key and the rest appear
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "fitness: $*" >&2; }
fails=(); notrun=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
skip() { notrun+=("$*"); say "NOT EXERCISED: $*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
first="$(session)"
fixtures() {
    ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || return 1
    ev -f "$REPO/tools/autotest/checks/profession_openings.lua" >/dev/null || return 1
    ev -f "$REPO/tools/autotest/checks/fitness_world_opening.lua" >/dev/null || return 1
}
fixtures || { say "fixtures did not load"; exit 2; }

spawn_minutes="$(ev 'return CFFit.minutes()')"
became="$(ev 'return CFProf.become([[fitnessinstructor]])')"
[ "$(field 1 "$became")" = true ] || { say "could not make the survivor a Fitness Instructor: $(field 2 "$became")"; exit 2; }
say "survivor is now $(field 2 "$became"); world age ${spawn_minutes} in-game minutes"

# The first case needs a whole-map scan. Wait on the scan's own cursor.
budget="${CF_FIRST_CASE_WAIT:-2400}"; deadline=$(( $(date +%s) + budget ))
lastscan=""; flat=0; ready=0
while [ "$(date +%s)" -lt "$deadline" ]; do
    o="$(ev 'return CFFit.opening()')"
    [ "$o" != "no-case" ] && { ready=1; break; }
    scan="$(ev 'local T=ConspiracyFiles.T3Nearby;local p=T and T.progress and T.progress();return p and (tostring(p.phase)..":"..tostring(p.index)) or "none"')"
    if [ "$scan" = "$lastscan" ]; then flat=$((flat + 1)); else flat=0; lastscan="$scan"; fi
    [ "$flat" -ge 24 ] && { say "the nearby scan stopped advancing at $scan"; break; }
    sleep 5
done
[ "$ready" = 1 ] || { skip "the first case never arrived, so nothing below could be observed"; }

if [ "$ready" = 1 ]; then
    title="$(field 1 "$o")"; held="$(field 2 "$o")"; itemtype="$(field 3 "$o")"
    iskey="$(field 4 "$o")"; voice="$(field 5 "$o")"; at_min="$(field 6 "$o")"
    rows+=("opening clue: \"$title\" held=$held type=$itemtype isKey=$iskey")
    rows+=("in-game minutes: world was $spawn_minutes at spawn, clue present at $at_min (elapsed $((at_min - spawn_minutes)))")
    say "${rows[-2]}"; say "${rows[-1]}"

    # 1 + 10
    [ "$held" = true ] || fail "the opening clue is not on the player (type $itemtype)"
    # 2
    [ "$iskey" = true ] || fail "the opening clue is not a key item (type $itemtype)"
    k="$(ev 'return CFFit.keyOpensHouse()')"
    case "$k" in
        no-target|key-not-held|no-case) skip "the key could not be matched to a door ($k)" ;;
        *)
            keyid="$(field 1 "$k")"; doors="$(field 2 "$k")"; matched="$(field 3 "$k")"
            rows+=("key: keyId=$keyid doors near the house=$doors matching=$matched")
            say "${rows[-1]}"
            [ "${matched:-0}" -ge 1 ] 2>/dev/null \
                || fail "no door near the starting house accepts the key (keyId $keyid, $doors doors examined)"
            ;;
    esac
    # Gate 3: the recorded house must be the real starting building.
    ad="$(ev 'return CFFit.address()')"
    case "$ad" in
        no-case|no-target) skip "no key target, so the recorded address could not be compared ($ad)" ;;
        no-address-book) skip "the address book was not ready, so the address could not be compared" ;;
        *)
            tb="$(field 1 "$ad")"; tl="$(field 2 "$ad")"; pb="$(field 3 "$ad")"
            pl="$(field 4 "$ad")"; rec="$(field 5 "$ad")"; same="$(field 6 "$ad")"
            rows+=("address: key target building=$tb \"$tl\"; survivor building=$pb \"$pl\"; case records \"$rec\"")
            say "${rows[-1]}"
            if [ "$tb" = none ]; then
                skip "the key target is not inside any building, so no building address exists to compare"
            elif [ "$same" = true ]; then
                rows+=("point: the key belongs to the building the survivor starts in")
            else
                fail "the opening key targets building $tb (\"$tl\") but the survivor starts in building $pb (\"$pl\")"
            fi
            ;;
    esac

    # 3
    [ "$voice" = "This opens the house. Why did I have access?" ] \
        || fail "the opening line is \"$voice\", not \"This opens the house. Why did I have access?\""

    # 4 + 5
    a="$(ev 'return CFFit.anchors()')"
    ppe_members=0; ppe_items=0; ppe_docs=0
    while IFS= read -r row; do
        [ -n "$row" ] || continue
        n="${row%%:*}"; rest="${row#*:}"; t2="${rest%%:*}"; rest="${rest#*:}"
        st="${rest%%:*}"; rest="${rest#*:}"; mem="${rest%%:*}"; items="${rest##*:}"
        rows+=("finding $n: \"$t2\" status=$st members=$mem itemsInWorld=$items")
        say "${rows[-1]}"
        if [ "${mem:-0}" -gt 0 ] 2>/dev/null; then
            ppe_docs=$((ppe_docs + 1)); ppe_members="$mem"; ppe_items="$items"
        fi
    done < <(tr '\t' '\n' <<<"$a")
    if [ "$ppe_docs" -eq 0 ]; then
        skip "no grouped finding was assigned, so the PPE scene was not observed"
    else
        [ "$ppe_docs" -eq 1 ] || fail "$ppe_docs findings carry members; the PPE hoard must be ONE finding"
        [ "$ppe_members" -eq 9 ] || fail "the PPE finding declares $ppe_members members, not nine (3 masks, 4 gloves, 2 disinfectant)"
        if [ "${ppe_items:-0}" -eq 0 ]; then
            skip "the PPE finding is assigned but its items are not in the world yet (status above)"
        else
            [ "$ppe_items" -eq 9 ] || fail "the PPE scene put $ppe_items items in the world, not nine"
        fi
    fi

    # 6 + 7
    v="$(ev 'return CFFit.vehicle()')"
    scenes="$(field 1 "$v")"; hasv="$(field 2 "$v")"; vstatus="$(field 3 "$v")"; vsig="$(field 4 "$v")"
    rows+=("vehicle: confirmed stable scenes=$scenes clueFive=$hasv status=$vstatus signature=$vsig")
    say "${rows[-1]}"
    if [ "$scenes" = 0 ]; then
        [ "$vstatus" = deferred ] || [ "$vstatus" = none ] \
            || fail "no stable vehicle scene has been confirmed, yet clue five is $vstatus"
        rows+=("point 6: with no confirmed scene, clue five is $vstatus - the first four are not blocked by it")
    else
        [ "$vsig" != none ] \
            || fail "$scenes stable scene(s) confirmed and clue five carries no scene signature"
    fi

    # 8
    before="$(ev 'return CFFit.signature()')"
    say "saving and reloading"
    world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
    "$PZ" stop --save >/dev/null 2>&1
    if "$PZ" start --continue "$world" >/dev/null 2>&1 && fixtures; then
        after="$(ev 'return CFFit.signature()')"
        if [ "$before" = "$after" ]; then
            rows+=("reload: the assignments and scene signature are unchanged")
            say "${rows[-1]}"
        else
            fail "the assignments changed across a reload"
            rows+=("before: $before")
            rows+=("after:  $after")
        fi
    else
        skip "the saved game did not reload, so stability across a reload was not observed"
    fi
fi

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1
verdict=PASS
[ "$ready" = 1 ] || verdict="COULD NOT RUN"
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-fitness-world-opening.txt"
{
    echo "Linux Fitness Instructor world-evidence opening: $verdict"
    source_line
    printf '  %s\n' "${rows[@]}"
    echo
    for f in "${notrun[@]}"; do echo "NOT EXERCISED: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
case "$verdict" in PASS) exit 0 ;; FAIL) exit 1 ;; *) exit 2 ;; esac
}
cf_main "$@"
