#!/usr/bin/env bash
# Death check (catalogue E10): discoveries survive the survivor's death, the
# next survivor gets their own notebook, and evidence taken back off the body
# is the same evidence, not a new discovery.
#
#   tools/autotest/checks/death.sh [--hidden]
#
# Fresh world; inspect two documents and carry them; die; respawn through the
# post-death panel and character creation; compare the notebook; walk back to
# the body and take one document. PS-10 and PS-12. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "death: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }

not_running || { say "game already running; tools/autotest/pz.sh stop first"; exit 2; }
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop reload death; do ev -f "$REPO/tools/autotest/checks/$f.lua" >/dev/null || abort "could not load $f.lua"; done
wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
deadline=$(( $(date +%s) + 180 ))
until s="$(ev 'return CFLoop.summary()')"; [ "$(cut -f1 <<<"$s")" -gt 1 ] 2>/dev/null && ! grep -qE ":(pending|placing)" <<<"$s"; do
    [ "$(date +%s)" -lt "$deadline" ] || abort "documents never all placed: $s"; sleep 3
done
for i in 1 2; do
    r="$(inspect_doc "$i")" || fail "could not inspect document $i: $r"
done
sleep 3
before="$(ev 'return CFReload.notebook()')"; first="$(ev 'return CFDeath.forename()')"
carried="$(ev 'return CFDeath.carried()')"
say "before death: $first carries $(cut -f1 <<<"$carried") case documents; notebook $(cut -f1 <<<"$before")"

ev 'return CFDeath.die()' >/dev/null
wait_true 30 'CFDeath.dead()' || abort "the survivor did not die"
sleep 8
after_death="$(ev 'return CFReload.notebook()')"
[ "$after_death" = "$before" ] || fail "notebook changed at death: $after_death"

ev 'return CFDeath.respawn()' >/dev/null || fail "no post-death panel to respawn from"
steps=()
for _ in $(seq 1 12); do
    sleep 3
    [ "$(ev 'return CFDeath.alive()' | cut -f1)" = true ] && break
    steps+=("$(ev 'return CFDeath.acceptCreation()')")
done
wait_true 60 'CFDeath.alive()' || abort "no new survivor after respawn (steps: ${steps[*]})"
sleep 10
second="$(ev 'return CFDeath.forename()')"
after="$(ev 'return CFReload.notebook()')"
[ "$after" = "$before" ] || fail "notebook differs for the new survivor: $after"
[ "$second" != "$first" ] || say "note: the new survivor has the same forename ($second)"
title="$(run_log | grep -oE "papers issued: [^\"]*" | tail -1)"
# The new survivor gets papers of their own (found missing 2026-09-11).
[[ "$title" == "papers issued: ${second}'s Papers" ]] || fail "the new survivor ($second) was not issued papers: ${title:-none}"

# PS-12: the new survivor takes a document back off the old body.
ev 'return CFDeath.goToBody()' >/dev/null; sleep 3
body="$(ev 'return CFDeath.bodyItem()')"
if [ "$(cut -f1 <<<"$body")" = true ]; then
    ev 'return CFDeath.takeFromBody()' >/dev/null
    wait_true 20 'CFDeath.recovered()' || fail "could not take the document off the body"
    sleep 4
    [ "$(ev 'return CFDeath.stillInspected()' | cut -f1)" = true ] || fail "the recovered document is no longer known as inspected"
    recovered="$(ev 'return CFReload.notebook()')"
    [ "$recovered" = "$before" ] || fail "taking the document back changed the notebook: $recovered"
else
    fail "PS-12: $(cut -f2 <<<"$body")"
fi
errors="$(mod_errors)"
"$PZ" shot "$RUNS/$id-death.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
[ -z "$errors" ] || { verdict=FAIL; fails+=("errors inside the mod"); }
report="$EVIDENCE/$id-death.txt"
{
    echo "Linux death check $id: $verdict"
    source_line
    echo "first survivor: $first, carrying $(cut -f1 <<<"$carried") case documents at death"
    echo "notebook before death: $(tr '\t' ' ' <<<"$before")"
    echo "new survivor: $second; papers: ${title:-no papers issued line}"
    echo "notebook for the new survivor: $(tr '\t' ' ' <<<"$after")"
    echo "document taken back off the body: $(cut -f2 <<<"$body")"
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report"
cat "$report"
[ "$verdict" = PASS ]
