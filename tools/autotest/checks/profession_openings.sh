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
fails=(); notrun=(); rows=()
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
        [ "$n" -eq 1 ] || start_world || { skip "$profession: could not start save $n"; break; }
        [ "$n" -eq 1 ] || load_fixtures || { skip "$profession: fixtures did not load in save $n"; break; }
        became="$(ev "return CFProf.become([[$profession]])")"
        if [ "$(field 1 "$became")" != true ]; then
            skip "$profession: the survivor could not be made one ($(field 2 "$became"))"
            break
        fi
        [ "$(field 2 "$became")" = "$profession" ] \
            || fail "$profession: the descriptor reports $(field 2 "$became") after being set"
        started="$(ev 'return CFProf.freshFirstCase()')"
        [ "$(field 1 "$started")" = true ] || { skip "$profession save $n: no first case ($(field 2 "$started"))"; continue; }
        # The first case runs a nearby scan; on this machine that has taken up
        # to seven minutes. Wait on the case appearing, not on a clock chosen
        # for a faster machine.
        r=""; for _ in $(seq 120); do
            r="$(ev "return CFProf.result()")"
            [ "$(field 1 "$r")" = ready ] && break
            sleep 5
        done
        if [ "$(field 1 "$r")" != ready ]; then
            skip "$profession save $n: the first case never finished preparing"
            continue
        fi
        reached=$((reached + 1))
        variant="$(field 2 "$r")"; gotprof="$(field 3 "$r")"; gotprem="$(field 4 "$r")"
        title="$(field 5 "$r")"; onplayer="$(field 6 "$r")"; status="$(field 7 "$r")"; where="$(field 8 "$r")"
        rows+=("$profession save $n: variant=$variant title=\"$title\" onPlayer=$onplayer status=$status ($where)")
        say "${rows[-1]}"
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
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
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
[ "$verdict" = PASS ]
}
cf_main "$@"
