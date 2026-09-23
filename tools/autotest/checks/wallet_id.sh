#!/usr/bin/env bash
# Wallet ID check: does an ID card inside a body's wallet become an
# identity lead in the record, the way the owner's playtests expect?
#
#   tools/autotest/checks/wallet_id.sh [--hidden]
#
# Fresh world, indoors so the first case starts. Kills zombies beside the
# player and uses whatever wallets and IDs the game itself put on them, then
# plays the steps a player takes: click the body, carry the wallet off, take it
# in hand, click its icon. PASS needs the wallet ID recorded as a lead from a
# container taken off a corpse, and no errors inside the mod. A loose ID on a
# body, when the game supplies one, is checked on the way and reported too.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=()
[ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "wallet-id: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$REPO/tools/autotest/checks/wallet_id.lua" >/dev/null || abort "could not load the check's Lua"
wait_true 90 'CFWallet.caseActive()' || abort "no case started, so the identity observer stays off"
say "case active"

# The game decides what bodies carry; roll until one has a wallet with an ID.
for round in 1 2 3 4 5; do
    ev 'return CFWallet.spawnBodies(6)' >/dev/null; sleep 3
    ev 'return CFWallet.openBodies()' >/dev/null; sleep 2
    fixtures="$(ev 'return CFWallet.findFixtures()')"
    loose="$(cut -f1 <<<"$fixtures")"; wallet="$(cut -f2 <<<"$fixtures")"
    say "round $round: loose ID '$loose', wallet ID '$wallet'"
    [ "$wallet" != none ] && [ -n "$wallet" ] && break
done
[ "$wallet" != none ] && [ -n "$wallet" ] || abort "30 bodies and no wallet with an ID; nothing to test"

loose_result="not exercised: no body carried a loose ID"
if [ "$loose" != none ]; then
    ev 'return CFWallet.showLooseBody()' >/dev/null
    # Wait for the row to be DRAWN, not for a guessed number of seconds.
    # selectContainer does not repopulate the pane in the same frame, so the
    # old sleep asserted against whatever container happened to be showing.
    wait_true 20 "CFWallet.onScreen([[$loose]])" \
        || say "note: '$loose' never appeared in a visible pane"
    sleep 3
    row="$(ev "return CFWallet.row([[$loose]])")"
    if grep -q "corpse" <<<"$(cut -f1 <<<"$row")"; then loose_result="PASS: '$loose' recorded as $(cut -f1 <<<"$row")"
    else loose_result="FAIL: '$loose' was on screen and not recorded"; fi
fi
say "loose ID: $loose_result"

ev 'return CFWallet.takeWallet()' >/dev/null
wait_true 30 'CFWallet.walletCarried()' || abort "the wallet transfer never finished"
# WAIT for the provenance stamp instead of reading it the instant the transfer
# lands. The stamp is written by LocalPersonIntegration's queued observation,
# which runs on a 30-tick cycle, so reading it immediately is a race - and it
# lost on 2026-09-13: the suite reported "recorded, but without its corpse
# provenance" with stamp nil, and the identical check passed on a re-run.
# Nothing is weakened by waiting: if the stamp never arrives, the corpse
# provenance assertion below still fails, and now for the real reason.
wait_true 30 'tostring(select(2,CFWallet.walletCarried()))~="nil"' \
    || say "note: no corpse provenance stamp appeared within 30s"
stamp="$(ev 'return CFWallet.walletCarried()' | cut -f2)"
ev 'return CFWallet.holdWallet()' >/dev/null
wait_true 20 'CFWallet.openWallet()' || abort "no icon for the held wallet"
wait_true 20 "CFWallet.onScreen([[$wallet]])" \
    || say "note: '$wallet' never appeared in a visible pane"
sleep 3
row="$(ev "return CFWallet.row([[$wallet]])")"
summary="$(cut -f1 <<<"$row")"; detail="$(cut -f2- <<<"$row")"
"$PZ" shot "$RUNS/$id-wallet.png" >/dev/null 2>&1

# Gate 2 expected result 10: a save and a reload preserve the facts and the
# provenance without changing wording or creating duplicates. Compared as the
# player reads it - every row's title, summary and full text, in order - so a
# dropped provenance token, a reworded line and a duplicated row each show up
# as a difference rather than all three hiding behind a count.
reload_result="not exercised: the reload leg did not run"
before=""; after=""
before="$(ev 'return CFWallet.digest()')"
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
"$PZ" stop --save >/dev/null 2>&1
if "$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 \
    && ev -f "$REPO/tools/autotest/checks/wallet_id.lua" >/dev/null; then
    wait_true 60 'ConspiracyFiles~=nil and ConspiracyFiles.IdentityObserver~=nil' \
        || say "note: the observer did not answer after the reload"
    after="$(ev 'return CFWallet.digest()')"
    if [ "$before" = "$after" ]; then
        reload_result="PASS: $(cut -f1 <<<"$after") survived the reload unchanged"
    else
        reload_result="FAIL: the recorded rows changed across a save and reload"
    fi
else
    reload_result="not exercised: the saved game did not reload"
fi
say "save/reload: $reload_result"

errors="$(mod_errors)"
end_world

verdict=PASS; why=""
[ -n "$summary" ] || { verdict=FAIL; why="the wallet ID was on screen and never recorded"; }
[ -z "$summary" ] || grep -q "taken off a corpse" <<<"$detail" || { verdict=FAIL; why="recorded, but without its corpse provenance"; }
[ -z "$errors" ] || { verdict=FAIL; why="${why:+$why; }errors inside the mod"; }
case "$loose_result" in FAIL*) verdict=FAIL; why="${why:+$why; }loose ID not recorded" ;; esac
case "$reload_result" in FAIL*) verdict=FAIL; why="${why:+$why; }rows changed across a save and reload" ;; esac

report="$EVIDENCE/$id-wallet-id.txt"
{
    echo "Linux wallet ID check $id: $verdict${why:+ ($why)}"
    source_line
    echo "wallet ID: '$wallet'; wallet stamp after carrying it off: $stamp"
    echo "record summary: ${summary:-none}"
    [ -z "$detail" ] || { echo "record text:"; sed 's/ \\n /\n/g' <<<"$detail" | sed 's/^/  /'; }
    echo "loose ID on a body: $loose_result"
    echo "save and reload: $reload_result"
    [ "$before" = "$after" ] || { echo "  before: $(tr '\t' '\n' <<<"$before" | sed 's/^/    /')"; \
                                  echo "  after:  $(tr '\t' '\n' <<<"$after"  | sed 's/^/    /')"; }
    echo "errors inside the mod: $(grep -c . <<<"$errors")"
    [ -z "$errors" ] || sed 's/^/  /' <<<"$errors" | head -10
    echo "screenshot: dev/eval/linux/runs/$id-wallet.png (not committed)"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
