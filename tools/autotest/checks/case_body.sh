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
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
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
body="$(ev 'return CFBody.body()')"
say "body: found=$(f 1 <<<"$body") searched=$(f 2 <<<"$body") idcards=$(f 3 <<<"$body") ours=$(f 4 <<<"$body") [$(f 5 <<<"$body")] items=$(f 6 <<<"$body")"
[ "$(f 1 <<<"$body")" = true ] || fail "no marked body where the case person died: $body"
[ "$(f 2 <<<"$body")" = true ] || fail "the body is not marked searched, so the game will roll its own cards in her name: $body"
[ "$(f 3 <<<"$body")" = 1 ] || fail "the body holds $(f 3 <<<"$body") ID cards, not exactly one: $body"
[ "$(f 4 <<<"$body")" = 1 ] || fail "the card on the body is not the case's own: $body"
[ "$(f 5 <<<"$body")" = "ID Card: $name" ] || fail "the card on the body reads '$(f 5 <<<"$body")', not 'ID Card: $name'"

# Her card becomes a lead once the body is opened, as a player opens it. Asked
# as a plain true/false: CN-01 took the printed word "nil" for a row.
opened="$(ev 'return CFBody.openBody()')"
[ "$(f 1 <<<"$opened")" = true ] || fail "could not open her body in the loot panel: $opened"
lead="false"
for _ in 1 2 3 4 5 6 7 8 9 10; do
    lead="$(ev "return CFBody.lead([[$name]])")"
    [ "$(f 1 <<<"$lead")" = true ] && break
    sleep 1
done
say "lead: $(tr '\t' ' ' <<<"$lead")"
[ "$(f 1 <<<"$lead")" = true ] || fail "her ID card on the body did not become a notebook lead: $lead"

line="$(run_log | grep -oE "case person's body \([^)]*\): [^\"]*" | tail -1)"
say "log: ${line:-nothing logged}"
[ -n "$line" ] || fail "the body handler logged nothing"
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $(head -1 <<<"$errors")"
"$PZ" stop >/dev/null 2>&1

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
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
