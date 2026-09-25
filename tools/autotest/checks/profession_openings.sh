#!/usr/bin/env bash
# PROFESSION OPENING FAMILIES, PLAYED FROM FRESH SAVES.
#
#   tools/autotest/checks/profession_openings.sh            every family, 6 saves each
#   tools/autotest/checks/profession_openings.sh fitnessinstructor 10
#
# Asks three things a generator test cannot:
#   1. the runtime ROUTES the profession to its own family;
#   2. the first assignment title VARIES between fresh saves;
#   3. the opening clue is ON THE PLAYER immediately, in the inventory -
#      not merely recorded as delivered.
#
# Written for every profession, not for the first one. The families come from
# Premises, so a newly authored one is covered without editing this file; the
# harness spawns an `unemployed` survivor, so each save sets the profession on
# the descriptor - the same field the mod reads - before the case is built.
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "prof: $*" >&2; }
fails=(); notrun=(); rows=(); total_reached=0; total_worlds=0
fail() { fails+=("$*"); say "FAIL: $*"; }
skip() { notrun+=("$*"); say "NOT EXERCISED: $*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }

want="${1:-}"; saves="${2:-6}"
claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
first="$(session)"
load_fixtures() {
    ev -f "$REPO/tools/autotest/checks/core_loop.lua" >/dev/null || return 1
    ev -f "$REPO/tools/autotest/checks/profession_openings.lua" >/dev/null || return 1
}
load_fixtures || { say "fixtures did not load"; exit 2; }

families="$(ev 'return CFProf.families()')"
say "opening families the mod advertises: ${families:-none}"
[ -n "$families" ] || { say "no profession has an opening family"; exit 2; }

for fam in $families; do
    profession="${fam%%:*}"; rest="${fam#*:}"; premise="${rest%%:*}"; variants="${rest##*:}"
    [ -z "$want" ] || [ "$want" = "$profession" ] || continue
    say "=== $profession ($premise, $variants variants), $saves fresh saves ==="
    declare -A seen_title=(); declare -A seen_variant=(); reached=0
    for n in $(seq "$saves"); do
        # A NEW WORLD IN THE RUNNING GAME. start_world calls `pz.sh start`,
        # which refuses while a game is up - "game already running (pid ...)"
        # - so every save after the first was skipped. `fresh` is what asks
        # the running game for a new world, and is what campaign.sh uses.
        # Every save after the RUN's first, not each family's first: with one
        # save per family, the second family read the first family's case
        # (20260925T193704, twenty-four families "playing" the Fitness start).
        if [ "$total_worlds" -gt 0 ]; then
            "$PZ" fresh >/dev/null 2>&1 || { skip "$profession: could not draw a fresh world for save $n"; break; }
            load_fixtures || { skip "$profession: fixtures did not load in save $n"; break; }
        fi
        total_worlds=$((total_worlds + 1))
        became="$(ev "return CFProf.become([[$profession]])")"
        if [ "$(field 1 "$became")" != true ]; then
            skip "$profession: the survivor could not be made one ($(field 2 "$became"))"
            break
        fi
        [ "$(field 2 "$became")" = "$profession" ] \
            || fail "$profession: the descriptor reports $(field 2 "$became") after being set"
        # LET THE WORLD'S OWN FIRST CASE BE THE ONE, rather than replacing it.
        #
        # The profession is read in prepare(), AFTER the nearby scan finishes -
        # not at world load. So setting it in the seconds after the world is
        # ready, while the scan is still running, makes the automatic first
        # case a profession one, and no wipe is needed at all.
        #
        # The previous shape wiped the store and called Trial.start itself.
        # That cost two case generations a save and the replacement never
        # finished preparing in ten minutes, six times over - zero evidence
        # from an hour of running. It also left the check driving a path the
        # player never takes; this one is exactly what happens in a new game.
        #
        # If the profession is set too late the case comes out generic, and
        # the assertion below on the recorded profession says so rather than
        # passing quietly.
        # THE FIRST CASE NEEDS A WHOLE-MAP SCAN, AND THE WINDOW IS UNFOCUSED.
        #
        # Measured 2026-09-22: the scan advances at roughly 0.6 to 1.6 frames a
        # second with the game unfocused, and it walks 9,978 buildings - so a
        # first case takes 25 minutes or more here, not the seven the campaign
        # gate sees while it is driving the game with real actions. Ten minutes
        # was nowhere near enough and produced zero evidence across two runs
        # and ten saves.
        #
        # So: wait on the scan's own cursor rather than a clock, give up only
        # when it stops advancing, and let CF_FIRST_CASE_WAIT raise the ceiling
        # on a slower machine. campaign.sh uses the same variable.
        # The memory this save's start will be chosen from, read before the
        # first case is built. Held to below.
        local memory; memory="$(ev "return CFProf.memory('$profession')")"
        local budget="${CF_FIRST_CASE_WAIT:-2100}"
        local deadline=$(( $(date +%s) + budget ))
        local lastscan="" flatscan=0
        r=""; while [ "$(date +%s)" -lt "$deadline" ]; do
            r="$(ev "return CFProf.result()")"
            [ "$(field 1 "$r")" = ready ] && break
            # The scan's cursor is the honest progress measure; a flat cursor
            # for two minutes means it has stopped, whatever the clock says.
            local scan
            # The reason matters. T3Nearby.progress() distinguishes "no scan
            # has run" from "complete" from an error, and the old probe threw
            # all three away as "none", so a scan that had not begun read the
            # same as a wedged one. fitness_world_opening.sh quit after 5% of
            # its budget on exactly that, 2026-09-23.
            scan="$(ev 'local T=ConspiracyFiles.T3Nearby;if not (T and T.progress) then return "no-module" end;local p,why=T.progress();if p then return "scan:"..tostring(p.phase)..":"..tostring(p.index)..":"..tostring(p.scanned) end;return "nojob:"..tostring(why)')"
            if [ "$scan" = "$lastscan" ]; then flatscan=$((flatscan + 1)); else flatscan=0; lastscan="$scan"; fi
            # Only a live job can stall; with no job there is nothing advancing.
            case "$scan" in
                scan:*)
                    if [ "$flatscan" -ge 24 ]; then
                        say "$profession save $n: the nearby scan stopped advancing at $scan"
                        break
                    fi ;;
                *)
                    [ "$flatscan" -ge 24 ] \
                        && say "$profession save $n: no scan job for $((flatscan * 5))s: $scan" ;;
            esac
            sleep 5
        done
        if [ "$(field 1 "$r")" != ready ]; then
            skip "$profession save $n: the first case never finished preparing"
            continue
        fi
        reached=$((reached + 1)); total_reached=$((total_reached + 1))
        variant="$(field 2 "$r")"; gotprof="$(field 3 "$r")"; gotprem="$(field 4 "$r")"
        title="$(field 5 "$r")"; onplayer="$(field 6 "$r")"; status="$(field 7 "$r")"; where="$(field 8 "$r")"
        rows+=("$profession save $n: variant=$variant title=\"$title\" onPlayer=$onplayer status=$status ($where); memory before: $memory")
        say "${rows[-1]}"
        # THE RANDOMISER REMEMBERS (OpeningMemory). The start chosen must be one
        # of the least-played on this install according to the memory read
        # before the case was built - never a start played more often than
        # another that was still available.
        if [ "$variant" != nil ] && [ "$memory" != no-store ]; then
            local least=999999 v c count_of=0
            for v in $(seq "$variants"); do
                c="$(tr ',' '\n' <<<"$memory" | grep "^$v:" | cut -d: -f2)"; c="${c:-0}"
                [ "$c" -lt "$least" ] 2>/dev/null && least="$c"
                [ "$v" = "$variant" ] && count_of="$c"
            done
            [ "$count_of" -eq "$least" ] 2>/dev/null \
                || fail "$profession save $n: chose start $variant (played $count_of times here) while a start played only $least times was available; memory was $memory"
        fi
        seen_title["$title"]=1; seen_variant["$variant"]=1
        [ "$gotprof" = "$profession" ] \
            || fail "$profession save $n: the case records profession=$gotprof"
        [ "$gotprem" = "$premise" ] \
            || fail "$profession save $n: the case records premise=$gotprem, not $premise"
        [ "$variant" != nil ] && [ "$variant" -ge 1 ] 2>/dev/null && [ "$variant" -le "$variants" ] 2>/dev/null \
            || fail "$profession save $n: variant $variant is outside 1..$variants"
        [ "$onplayer" = true ] \
            || fail "$profession save $n: the opening clue is not on the player ($where, assignment $status)"
    done
    if [ "$reached" -lt 2 ]; then
        skip "$profession: only $reached save(s) produced a case, so variation could not be judged"
    else
        rows+=("$profession: ${#seen_title[@]} distinct title(s) and ${#seen_variant[@]} distinct variant(s) across $reached saves")
        say "${rows[-1]}"
        # THE POINT OF THE CHECK. One title across several fresh saves means
        # the ten starts exist but the player always meets the same one.
        [ "${#seen_title[@]}" -gt 1 ] \
            || fail "$profession: all $reached fresh saves opened with the same assignment \"${!seen_title[*]}\"; the starts are not varying"
    fi
done

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1
# A RUN THAT PRODUCED NO CASE IS NOT A PASS. The first run of this check
# reached zero saves and printed PASS - the same green-by-silence this project
# has now fixed in two other checks, reproduced in a third.
verdict=PASS
[ "$total_reached" -eq 0 ] 2>/dev/null && verdict="COULD NOT RUN"
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-profession-openings.txt"
{
    echo "Linux profession opening families: $verdict"
    source_line
    echo "families advertised: $families"
    echo "saves per family: $saves"
    echo
    printf '  %s\n' "${rows[@]}"
    echo
    for f in "${notrun[@]}"; do echo "NOT EXERCISED: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
case "$verdict" in
    PASS) exit 0 ;;
    FAIL) exit 1 ;;
    *) exit 2 ;;
esac
}
cf_main "$@"
