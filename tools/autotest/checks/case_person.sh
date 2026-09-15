#!/usr/bin/env bash
# Case person check (catalogue CN-01): the case's named person walks nearby as
# a zombie with an ID card in that name, keeps it through a save and reload,
# and the card on the body becomes a notebook lead.
#
#   tools/autotest/checks/case_person.sh [--hidden]
#
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "case-person: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
load_lua() { for f in core_loop wallet_id case_person; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || return 1; done; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"; world="$(cat "$REPO/dev/eval/linux/world")"
load_lua || abort "could not load the check's Lua"
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
sleep 20
bound="$(run_log | grep -oE 'bound [^"]* to a body near[^"]*|case person not bound: [^"]*|someone already met[^"]*' | tail -1)"
case_name="$(ev 'return CFPerson.caseName()' | cut -f1)"
say "case person: $case_name; log: ${bound:-nothing logged}"
[[ "$bound" == bound* ]] || fail "the case person was not given a body: ${bound:-no log line}"

found="$(ev 'return CFPerson.find()')"
if [ "$(cut -f1 <<<"$found")" = true ]; then
    zname="$(cut -f2 <<<"$found")"; card="$(cut -f3 <<<"$found")"
    [ "$zname" = "$case_name" ] || fail "the zombie is named '$zname', the case says '$case_name'"
    [ "$card" = "ID Card: $case_name" ] || fail "the zombie's card reads '$card'"
else
    fail "no bound zombie in the loaded area: $(cut -f2 <<<"$found")"
fi

# Through a save and reload: is the zombie still that person?
"$PZ" stop --save >/dev/null 2>&1
"$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "the reload did not reach the world"
load_lua || abort "could not reload the check's Lua"
sleep 15
after="$(ev 'return CFPerson.find()')"
if [ "$(cut -f1 <<<"$after")" = true ]; then
    persisted="yes: $(cut -f2 <<<"$after") with '$(cut -f3 <<<"$after")'"
else
    persisted="no: $(cut -f2 <<<"$after")"
    fail "after a reload the case person is gone (zombie name, card or mark not saved)"
fi

# The body: its card is a lead in the notebook.
lead="not tried"
if [ "$(cut -f1 <<<"$after")" = true ]; then
    ev 'return CFPerson.goTo()' >/dev/null; sleep 2
    ev 'return CFPerson.kill()' >/dev/null; sleep 4
    ev 'return CFPerson.openBody()' >/dev/null; sleep 5
    # An explicit true/false first. CFWallet.row returns a bare nil when there is
    # no row, which the eval channel prints as the text "nil" - and "nil" is not
    # empty, so this used to pass with no card recorded at all (audit
    # 2026-09-15; 20260914T201413 recorded PASS with "nil").
    row="$(ev "local s=CFWallet.row([[ID Card: $case_name]]); return s~=nil, tostring(s)")"
    if [ "$(cut -f1 <<<"$row")" = true ]; then lead="$(cut -f2 <<<"$row")"
    else lead="none"; fail "the case person's ID card on the body was not recorded in the notebook"; fi
fi
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod"
"$PZ" shot "$RUNS/$id-case-person.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-case-person.txt"
{
    echo "Linux case person check $id: $verdict"
    source_line
    echo "case person: $case_name"
    echo "binding: ${bound:-no log line}"
    echo "zombie before reload: $(tr '\t' ' ' <<<"$found")"
    echo "after save and reload: $persisted"
    echo "card on the body in the notebook: $lead"
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
