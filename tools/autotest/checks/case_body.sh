#!/usr/bin/env bash
# Case body check (P4-R101): the case's named person, killed, leaves one body
# marked searched and holding exactly one ID card - hers - and none of the
# game's own cards rolled from her name. In play the game put the case name on
# two of its own women's ID cards (owner, Windows, 2026-09-14).
#
#   tools/autotest/checks/case_body.sh [--hidden]
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "case-body: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.CasePerson~=nil' || abort "the mod never answered"
ev -f "$REPO/tools/autotest/checks/case_body.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
wait_true 120 'CFBody.find()' || abort "no bound case person loaded: $(ev 'return CFBody.find()')"

name="$(ev 'return CFBody.caseName()' | f 1)"
found="$(ev 'return CFBody.find()')"
say "case person: $name; the bound zombie carries '$(f 2 <<<"$found")' at $(f 3 <<<"$found")"
[ "$(f 2 <<<"$found")" = "$name" ] || fail "the bound zombie does not carry the case person's name: $found"

ev 'return CFBody.kill()' >/dev/null
sleep 6
# The mod reads the flag back as it sets it and logs the value. A reading taken
# later proves nothing - the game marks any body searched once the loot panel
# shows it - and a listener added from this check was never called for the
# event (20260914T220104: 0 events seen while the mod's own handler logged).
spawn_line="$(run_log | grep -oE "case person's body \([^)]*\): searched=(true|false)" | tail -1)"
at_spawn="$(grep -oE 'searched=(true|false)' <<<"$spawn_line" | cut -d= -f2)"
say "her body, searched as the mod left it when it appeared: ${at_spawn:-no log line}"
[ "$at_spawn" = true ] || fail "the body is not marked searched when it appears (the mod's own reading: ${at_spawn:-none}), so the game will roll its own cards in her name"
body="$(ev 'return CFBody.body()')"
say "body: found=$(f 1 <<<"$body") searched=$(f 2 <<<"$body") idcards=$(f 3 <<<"$body") ours=$(f 4 <<<"$body") [$(f 5 <<<"$body")] items=$(f 6 <<<"$body")"
[ "$(f 1 <<<"$body")" = true ] || fail "no marked body where the case person died: $body"
# Read again after walking up to it: by now the game may have marked it itself,
# so this is a report, and the at-spawn reading above is the assertion.
[ "$(f 3 <<<"$body")" = 1 ] || fail "the body holds $(f 3 <<<"$body") ID cards, not exactly one: $body"
[ "$(f 4 <<<"$body")" = 1 ] || fail "the card on the body is not the case's own: $body"
[ "$(f 5 <<<"$body")" = "ID Card: $name" ] || fail "the card on the body reads '$(f 5 <<<"$body")', not 'ID Card: $name'"

# Her card becomes a lead once the body is opened, as a player opens it. Asked
# as a plain true/false: CN-01 took the printed word "nil" for a row.
# The loot panel lists a body only once it has caught up with the move, so ask
# again rather than once: a single retry passed one run and failed the next
# two (20260914T203013, 20260914T220704: "her body is not in the loot panel").
opened="false"
for _ in 1 2 3 4 5 6; do
    opened="$(ev 'return CFBody.openBody()')"
    [ "$(cut -f1 <<<"$opened")" = true ] && break
    sleep 2
done
[ "$(f 1 <<<"$opened")" = true ] || fail "could not open her body in the loot panel: $opened"
lead="false"
for _ in 1 2 3 4 5 6 7 8 9 10; do
    lead="$(ev "return CFBody.lead([[$name]])")"
    [ "$(f 1 <<<"$lead")" = true ] && break
    sleep 1
done
say "lead: $(tr '\t' ' ' <<<"$lead")"
[ "$(f 1 <<<"$lead")" = true ] || fail "her ID card on the body did not become a notebook lead: $lead"

# The comparison: an ordinary body is unsearched until shown, and showing it
# rolls its loot. That is the roll her body is marked searched against.
plain="$(ev 'return CFBody.spawnPlain()')"
[ "$(f 1 <<<"$plain")" = true ] || fail "could not make an ordinary body to compare: $plain"
sleep 6
pb="$(ev 'return CFBody.plainBody()')"
plain_rolled=no; wait_true 10 'CFBody.plainSearched()' && plain_rolled=yes
say "comparison body: found=$(f 1 <<<"$pb") searched before it was shown=$(f 2 <<<"$pb") searched once shown=$plain_rolled"
[ "$(f 1 <<<"$pb")" = true ] || fail "no ordinary body to compare: $pb"
[ "$(f 2 <<<"$pb")" = false ] || fail "an ordinary body was already searched before it was shown ($(f 2 <<<"$pb")), so the comparison proves nothing"
[ "$plain_rolled" = yes ] || fail "showing an ordinary body did not roll its loot, so marking hers searched is not what protects it"

# Name and body (P4-R103): the game's own isFemale decides.
sx="$(ev 'return CFBody.sexPick()')"
say "sex matching: woman's name -> female=$(f 2 <<<"$sx") matched=$(f 3 <<<"$sx"); man's name -> male=$(f 4 <<<"$sx") matched=$(f 5 <<<"$sx")"
[ "$(f 2 <<<"$sx")" = true ] && [ "$(f 3 <<<"$sx")" = true ] || fail "the case person picker chose a zombie that is not female for a woman's name: $sx"
[ "$(f 4 <<<"$sx")" = true ] && [ "$(f 5 <<<"$sx")" = true ] || fail "the case person picker chose a zombie that is not male for a man's name: $sx"

line="$(run_log | grep -oE "case person's body \([^)]*\): [^\"]*" | tail -1)"
say "log: ${line:-nothing logged}"
[ -n "$line" ] || fail "the body handler logged nothing"
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $(head -1 <<<"$errors")"
end_world

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-case-body.txt"
{
    echo "Linux case body check $id: $verdict"
    source_line
    echo "case person: $name"
    echo "bound zombie: $(tr '\t' ' ' <<<"$found")"
    echo "body: $(tr '\t' ' ' <<<"$body")"
    echo "log: ${line:-none}"
    echo "notebook lead: $(tr '\t' ' ' <<<"$lead")"
    echo "her body searched at spawn: $at_spawn"
    echo "comparison body: searched before it was shown: $(f 2 <<<"$pb"), searched once shown: $plain_rolled"
    echo "sex matching: $(tr '\t' ' ' <<<"$sx")"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
