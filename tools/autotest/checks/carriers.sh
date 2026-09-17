#!/usr/bin/env bash
# Clues on carriers (P4-R134, docs/design/CLUES_ON_THE_MOVE.md) in the real
# game, and the guess that design shipped with.
#
#   tools/autotest/checks/carriers.sh
#
#   (a) THE MAILBOX. Storage.MAILBOX is the string "mailbox" and
#       Storage.UNVERIFIED says nobody had asked Build 42 what it calls that
#       container. The check prints what the engine really reports for every
#       container around the survivor, and every one whose type or sprite says
#       "mail" - enough to confirm the guess or correct it. A finding, not a
#       failure: the answer is what is wanted.
#   (b) THE CARRIER GUARDS, on real bodies. A body the world put there is
#       usable; the same body with its loot window open is refused; once the
#       survivor has looked inside it, it is refused as searched; and a body
#       already carrying a clue, or already the case's person, is refused. Unit
#       tests hold the rules; this asks them about a real corpse.
#   (c) A CLUE ON A CARRIER, when the world gives the filler one: found by
#       Search Mode from beside the body, and taken out of the body by looting
#       it. A carrier is only used for a clue the generator had to defer
#       (P4-R133) at a site with no free container, so the check arranges what
#       it can - a fresh neighbourhood, bodies parked in it, a case asked for -
#       and says plainly when the world did not produce one.
#
# Real display only. About 10 minutes. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "carriers: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/campaign.lua" >/dev/null \
        && ev -f "$CHECKS/clue_actions.lua" >/dev/null && ev -f "$CHECKS/clue_field.lua" >/dev/null \
        && ev -f "$CHECKS/carriers.lua" >/dev/null
}

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || abort "no case started"
load_lua || abort "could not load the check's Lua"
note "game running: paused/speed=$(ev 'return CFAct.running()' | tr '\t' ' ')"

# --- (a) what the engine calls the containers, mailboxes included ------------
t="$(ev 'return CFCarry.containerTypes(40)')"
note "Storage.MAILBOX is \"$(f 1 <<<"$t")\"; a container of that type within 40 tiles: $(f 2 <<<"$t")"
note "ANSWER (mailbox): containers whose type or sprite says mail: $(f 3 <<<"$t" | cut -c1-300)"
note "every container type on $(f 4 <<<"$t") loaded squares: $(f 5 <<<"$t" | cut -c1-400)"
# Wider: mailboxes stand on lawns and at gates, and the survivor starts inside
# a house, so 40 tiles can be all wall and furniture.
t2="$(ev 'return CFCarry.containerTypes(60)')"
note "widened to 60 tiles: mail-ish containers: $(f 3 <<<"$t2" | cut -c1-300)"
[ -n "$(f 3 <<<"$t2")" ] || note "ANSWER (mailbox): nothing within 60 tiles of the survivor reported a mail container at all, so \"mailbox\" is still unconfirmed"

# --- (b) the carrier guards on a real body ----------------------------------
made="$(ev 'return CFCarry.spawnBodies(4)')"
note "bodies and walkers parked beside the survivor by the harness: $made (the mod never spawns one)"
sleep 3
s="$(ev 'return CFCarry.scan(12)')"
note "usable carriers within 12 tiles, through the mod's own scan: $(f 1 <<<"$s") ($(f 2 <<<"$s"))"
if [ "$(f 1 <<<"$s")" -lt 1 ] 2>/dev/null; then
    fail "the mod's carrier scan found no usable carrier with $made bodies beside the survivor"
else
    p="$(ev 'return CFCarry.pick(1)')"
    note "carrier chosen: $(f 2 <<<"$p") at $(f 3 <<<"$p")"
    st="$(ev 'return CFCarry.state()')"
    note "before anything: usable=$(f 2 <<<"$st"), refusal=$(f 3 <<<"$st"), searched=$(f 4 <<<"$st"), loot open=$(f 5 <<<"$st"), marked=$(f 6 <<<"$st"), case person=$(f 7 <<<"$st")"
    [ "$(f 2 <<<"$st")" = true ] || fail "a fresh body the world put there is refused as a carrier: $(f 3 <<<"$st")"
    # The survivor looks inside it: the loot window guard, then the searched guard.
    ev 'return CFCarry.standBy()' >/dev/null
    o="$(ev 'return CFCarry.openBody()')"
    if [ "$(f 1 <<<"$o")" != true ]; then
        note "the body's container did not appear in the loot panel ($(f 2 <<<"$o")); the open-window guard was not tested"
    else
        sleep 2
        st="$(ev 'return CFCarry.state()')"
        note "with its loot window open (container $(f 2 <<<"$o")): usable=$(f 2 <<<"$st"), refusal=$(f 3 <<<"$st"), loot open=$(f 5 <<<"$st")"
        if [ "$(f 5 <<<"$st")" = true ]; then
            [ "$(f 2 <<<"$st")" = false ] || fail "a body whose loot window the survivor has open is still offered as a carrier"
        else
            note "the game did not report the body's container as open in the loot panel, so that guard was not tested"
        fi
    fi
    m="$(ev 'return CFCarry.markSearched()')"
    note "after looking inside: the game had already marked it searched=$(f 2 <<<"$m"), searched now=$(f 3 <<<"$m")"
    sleep 1
    st="$(ev 'return CFCarry.state()')"
    note "once searched: usable=$(f 2 <<<"$st"), refusal=$(f 3 <<<"$st"), searched=$(f 4 <<<"$st")"
    [ "$(f 2 <<<"$st")" = false ] || fail "a body the survivor has already searched is still offered as a carrier"
    [ "$(f 3 <<<"$st")" = "already searched" ] || [ "$(f 3 <<<"$st")" = "loot window open" ] \
        || fail "the refusal for a searched body reads \"$(f 3 <<<"$st")\""
fi

# --- (c) a clue on a carrier, if the world gives the filler one --------------
c="$(ev 'return CFCarry.clues()')"
note "clues of the live cases: $(f 1 <<<"$c") placed rows, $(f 2 <<<"$c") on a carrier ($(f 3 <<<"$c" | cut -c1-260))"
ev 'return CFCamp.gap(false)' >/dev/null
tries=0
while [ "$(ev 'return CFCarry.clues()' | f 2)" = 0 ] && [ "$tries" -lt "${CF_CARRIER_TRIES:-3}" ]; do
    tries=$((tries + 1))
    m="$(ev 'return CFCamp.moveOn()')"
    [ "$(f 1 <<<"$m")" = true ] || { note "carrier try $tries: nowhere fresh to move to: $(f 2 <<<"$m")"; break; }
    wait_true 120 'CFCamp.settled()' >/dev/null || true
    made="$(ev 'return CFCarry.spawnBodies(6)')"
    want=$(( $(ev 'return CFCamp.cases()' | f 1) + 1 ))
    note "carrier try $tries: moved $(f 4 <<<"$m") tiles to $(f 2 <<<"$m"), parked $made bodies, waiting for case $want"
    for _ in $(seq 50); do
        [ "$(ev 'return CFCamp.cases()' | f 1)" -ge "$want" ] 2>/dev/null && break
        sleep 5
    done
    sleep 10
    note "carrier try $tries: clues now $(ev 'return CFCarry.clues()' | f 3 | cut -c1-260)"
done
pick="$(ev 'return CFCarry.pickClue()')"
if [ "$(f 1 <<<"$pick")" != true ]; then
    note "no clue landed on a carrier in $tries tries ($(f 2 <<<"$pick")); a carrier is only used for a clue the generator had to defer at a site with no free container, so this is a matter of which neighbourhood the case chose"
else
    note "carrier clue: $(f 2 <<<"$pick") on a $(f 4 <<<"$pick") at $(f 3 <<<"$pick"), mark $(f 5 <<<"$pick")"
    cc="$(ev 'return CFCarry.clueCarrier()')"
    if [ "$(f 1 <<<"$cc")" != true ]; then
        fail "the mod could not find its own carrier mark: $(f 2 <<<"$cc")"
    else
        note "the mark resolves: the clue is in its inventory=$(f 2 <<<"$cc") (\"$(f 3 <<<"$cc")\", container $(f 4 <<<"$cc"), at $(f 5 <<<"$cc"))"
        [ "$(f 2 <<<"$cc")" = true ] || fail "the carrier's inventory does not hold the clue"
        # Found by searching, from beside the body.
        ev 'return CFField.searchOn()' >/dev/null
        spotted=no; start=$(date +%s)
        for _ in $(seq 120); do
            ev 'return CFField.searchOn()' >/dev/null
            [ "$(ev 'return CFCarry.recognised()')" = true ] && { spotted=yes; break; }
            sleep 0.5
        done
        secs=$(( $(date +%s) - start ))
        if [ "$spotted" = yes ]; then
            note "ANSWER (carrier): the clue on the $(f 4 <<<"$pick") was spotted by Search Mode in ${secs}s, standing beside it"
        else
            note "ANSWER (carrier): not spotted in ${secs}s beside the $(f 4 <<<"$pick") (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '); light $(ev 'return CFField.light()' | cut -f2- | tr '\t' ' '))"
            fail "a clue on a carrier could not be spotted by searching beside it in ${secs}s"
        fi
        # And taken by looting the body, which is the other way in.
        ev 'return CFCarry.takeClue()' >/dev/null
        if wait_true 20 'CFCarry.carried()=="true"' >/dev/null; then
            note "looting the $(f 4 <<<"$pick") took the clue: carried=$(ev 'return CFCarry.carried()')"
        else
            fail "the clue could not be taken out of the $(f 4 <<<"$pick") by looting it"
        fi
    fi
fi

errors="$(mod_error_count)"; is_number "$errors" || errors=0
thrown="$(mod_errors | wc -l | tr -d ' ')"; is_number "$thrown" || thrown=0
[ $((errors + thrown)) = 0 ] || fail "$((errors + thrown)) errors inside the mod: $(mod_errors | head -3)"
"$PZ" shot "$RUNS/$id-carriers.png" >/dev/null 2>&1

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-carriers.txt"
{
    echo "Linux carriers check $id: $result"
    source_line
    for x in "${findings[@]}"; do echo "FINDING: $x"; done
    echo "errors inside the mod: $((errors + thrown))"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
