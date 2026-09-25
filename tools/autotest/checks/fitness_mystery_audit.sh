#!/usr/bin/env bash
# The Fitness Instructor's first mystery, audited in a real game against three
# questions: is it bound to the hidden central conspiracy, is it built from real
# objects that exist in the world, and does the story rest on those objects by
# name. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
cf_main() {
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "audit: $*" >&2; }
fails=(); notrun=(); rows=()
fail() { fails+=("$*"); say "FAIL: $*"; }
skip() { notrun+=("$*"); say "NOT EXERCISED: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
cf_pin_source
start_world || { say "world did not start"; exit 2; }
id="$(session)"
for fx in core_loop profession_openings fitness_world_opening fitness_mystery_audit; do
    ev -f "$REPO/tools/autotest/checks/$fx.lua" >/dev/null || { say "$fx did not load"; exit 2; }
done
# ANY OCCUPATION. Written for the Fitness Instructor; since 2026-09-25 every
# occupation has an opening family (DR-20260925-OCCUPATION-OPENINGS), and the
# three questions are the same for each. CF_PROFESSION=electrician picks one.
profession="${CF_PROFESSION:-fitnessinstructor}"
became="$(ev "return CFProf.become([[$profession]])")"
[ "$(f 1 <<<"$became")" = true ] || { say "could not become a $profession"; exit 2; }

budget="${CF_FIRST_CASE_WAIT:-2400}"; deadline=$(( $(date +%s) + budget )); ready=0
while [ "$(date +%s)" -lt "$deadline" ]; do
    [ "$(ev 'return CFFit.opening()' | f 1)" != "no-case" ] && { ready=1; break; }
    sleep 10
done
[ "$ready" = 1 ] || skip "the first case never arrived: $(ev 'return CFFit.why()')"

if [ "$ready" = 1 ]; then
    # 1. CONSPIRACY
    c="$(ev 'return CFAudit.conspiracy()')"
    pair="$(f 1 <<<"$c")"; registered="$(f 2 <<<"$c")"; valid="$(f 3 <<<"$c")"; winner="$(f 4 <<<"$c")"
    theories="$(f 5 <<<"$c")"; axis="$(f 6 <<<"$c")"; isAxis="$(f 7 <<<"$c")"; bridge="$(f 8 <<<"$c")"
    pinned="$(f 9 <<<"$c")"; unresolvedIsCentral="$(f 10 <<<"$c")"
    rows+=("conspiracy: pair=$pair registered=$registered valid=$valid winnerField=$winner theories=$theories")
    rows+=("conspiracy: axis=$axis isAxis=$isAxis bridge=$bridge profession=$pinned unresolvedIsCentralQuestion=$unresolvedIsCentral")
    say "${rows[-2]}"; say "${rows[-1]}"
    [ "$registered" = true ] || fail "the case carries a pair the registry does not know: $pair"
    [ "$valid" = true ] || fail "the case's central pair does not validate"
    [ "$winner" = none ] || fail "the central pair carries a verdict field: $winner"
    [ "$theories" = 2 ] || fail "the pair offers $theories readings, not two"
    [ "$isAxis" = true ] || fail "the first mystery declares no valid axis ($axis): not bound to the conspiracy"
    [ "$bridge" = yes ] || fail "no bridge sentence resolves for axis $axis under $pair"
    [ "$unresolvedIsCentral" = true ] || fail "the opening's unresolved question is not the central question"

    # 2. REAL OBJECTS
    o="$(ev 'return CFAudit.objects()')"
    objectDocs=0; placedObjects=0; inWorldObjects=0; deferredObjects=0; paperDocs=0
    while IFS=: read -r n kind cap status items members wear intent; do
        [ -n "$n" ] || continue
        rows+=("document $n: kind=$kind capacity=$cap status=$status itemsInWorld=$items members=$members wear=$wear intent=$intent")
        say "${rows[-1]}"
        if [ "$cap" = object ]; then
            objectDocs=$((objectDocs+1))
            case "$status" in
                placed) placedObjects=$((placedObjects+1))
                        if [ "$items" -gt 0 ] 2>/dev/null; then inWorldObjects=$((inWorldObjects+1))
                        elif [ "$items" = "-1" ]; then :  # square unloaded: unknown
                        else fail "document $n ($kind) is recorded placed but 0 items exist at its target"; fi ;;
                deferred|indexed|pending) deferredObjects=$((deferredObjects+1)) ;;
            esac
        else paperDocs=$((paperDocs+1)); fi
    done < <(tr '\t' '\n' <<<"$o")
    rows+=("objects: $objectDocs object documents, $paperDocs paper; placed=$placedObjects inWorld=$inWorldObjects waiting=$deferredObjects")
    say "${rows[-1]}"

    # An indexed object waits for its square to load. Do what the appointment
    # card tells the player to do - go to the second address - then measure
    # again, so Q2 is answered for the objects a walking player would meet.
    while IFS=: read -r n kind cap status items members wear intent; do
        [ -n "$n" ] && [ "$cap" = object ] && { [ "$status" = indexed ] || [ "$status" = deferred ]; } || continue
        moved="$(ev "return CFAudit.visit($n)")"
        rows+=("walked to document $n ($kind): site $(tr '\t' ',' <<<"$moved")")
        say "${rows[-1]}"
        # The filler runs every 120 ticks and scans a square per step; give it
        # up to two minutes of standing there, as a player reading the card would.
        st2=""; it2=0; waited=0
        while [ "$waited" -lt 120 ]; do
            sleep 10; waited=$((waited+10))
            after="$(ev 'return CFAudit.objects()' | tr '\t' '\n' | grep "^$n:" )"
            st2="$(cut -d: -f4 <<<"$after")"; it2="$(cut -d: -f5 <<<"$after")"
            [ "$st2" = placed ] && [ "${it2:-0}" -gt 0 ] 2>/dev/null && break
        done
        rows+=("after ${waited}s at the site: document $n status=$st2 itemsInWorld=$it2")
        say "${rows[-1]}"
        if [ "$st2" = placed ] && [ "${it2:-0}" -gt 0 ] 2>/dev/null; then
            inWorldObjects=$((inWorldObjects+1)); deferredObjects=$((deferredObjects-1))
        elif [ "$st2" = placed ]; then
            fail "document $n ($kind) became placed on arrival but 0 items exist"
        else
            skip "document $n ($kind) still $st2 after standing at its square: $(ev 'return CFAudit.why([[placement]])')"
        fi
    done < <(tr '\t' '\n' <<<"$o")
    rows+=("objects after walking: inWorld=$inWorldObjects waiting=$deferredObjects")
    [ "$objectDocs" -ge 1 ] || fail "the first mystery uses no real objects at all"
    [ "$objectDocs" -gt "$paperDocs" ] || rows+=("note: more paper than objects ($paperDocs vs $objectDocs) - the vision says the world carries the story")
    [ "$deferredObjects" -eq 0 ] || skip "$deferredObjects object(s) still waiting for placement; last reason: $(ev 'return CFAudit.why([[placement]])')"

    # 3. VALUE
    v="$(ev 'return CFAudit.value()')"
    readings="$(grep -oE 'readings=[0-9]+' <<<"$v" | cut -d= -f2)"
    while IFS=: read -r n kind restsOn named distinct; do
        [ -n "$n" ] || continue
        case "$n" in readings*) continue ;; esac
        rows+=("value: object $n ($kind) is the subject of $restsOn comparison(s), named in $named, distinctFromPaper=$distinct")
        say "${rows[-1]}"
        [ "${restsOn:-0}" -ge 1 ] || fail "object $n ($kind) is placed but no comparison rests on it: it adds nothing to the story"
        [ "${named:-0}" -ge 1 ] || fail "object $n ($kind) is compared but never named: the player reads a line about paper"
        [ "$distinct" = true ] || fail "object $n ($kind) repeats a paper document's observation: paper in disguise"
    done < <(tr '\t' '\n' <<<"$v")
    rows+=("value: the case offers $readings rival readings")
    [ "${readings:-0}" = 2 ] || fail "the case offers $readings readings, not two"
fi

errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" stop >/dev/null 2>&1
verdict=PASS
[ "$ready" = 1 ] || verdict="COULD NOT RUN"
[ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-$profession-mystery-audit.txt"
{
    echo "Linux $profession first-mystery audit $id: $verdict"
    source_line
    printf '  %s\n' "${rows[@]}"
    echo
    for x in "${notrun[@]}"; do echo "NOT EXERCISED: $x"; done
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
case "$verdict" in PASS) exit 0 ;; FAIL) exit 1 ;; *) exit 2 ;; esac
}
cf_main "$@"
