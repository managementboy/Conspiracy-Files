#!/usr/bin/env bash
# Is a fresh CORPSE a carrier at all (P4-R134, docs/design/CLUES_ON_THE_MOVE.md)?
#
#   tools/autotest/checks/body_carrier.sh [--hidden]
#
# The design's headline example is "a note in a dead man's jacket at your own
# fence", and the table says a fresh corpse holds a clue in the body's own
# inventory. Three real runs have now found only ZOMBIES usable:
#
#   20260918T001512 and 20260918T002532: "usable carriers within 12 tiles,
#   through the mod's own scan: 2 (zombie@10841,10149 zombie@10843,10149)" -
#   with two corpses lying on the squares beside them, parked by the same call.
#   20260918T032829: the mod's own carrier scan saw 0 usable with five bodies
#   loaded at the site, and every one of 486 filler refusals read
#   `ev=skip why=no-containers`.
#
# So this asks the engine directly: bodies and walkers are parked beside the
# survivor, and for each one the check prints what every inventory accessor
# returns, what class the object is, and what Carriers.refusal says.
#
# Answered 2026-09-18: a body's inventory is `getContainer()`, which is nil for
# `getInventory()`; that read is the whole of the fault. Two things must now
# hold, and this check is the cheap one that holds them:
#
#   (a) AT LEAST ONE FRESH CORPSE IS USABLE, through the mod's own scan, with
#       the walkers beside it offered as nothing at all (P4-R136: a walking
#       zombie is not a carrier).
#   (b) A CLUE REALLY LANDS ON ONE and the record says where it is in the
#       survivor's words: "On a body at <address>", never "In a none". The
#       world is made short of cupboards the way instalments.sh does it - one
#       container kind allowed - so a clue is left waiting and the filler
#       reaches for a body at that clue's own site.
#   (c) AND IT CAN BE SPOTTED BY SEARCHING (P4-R132), which is the whole point
#       of P4-R136: the game turns Search Mode off beside a walking zombie, and
#       a body is no threat. This is the one stage instalments.sh cannot be
#       relied on for - its corpse stage only gets a body when the ladder
#       leaves a clue waiting - and a body is what this check always has.
#
# About eight minutes. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "body_carrier: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }
CHECKS="$REPO/tools/autotest/checks"

claim_game || exit 2
start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop campaign clue_actions clue_field carriers instalments; do
    ev -f "$CHECKS/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
note "the survivor is kept alive while zombies stand beside them: $(ev 'return CFInst.safe()')"
here="$(ev 'return CFCamp.here()')"
x="$(field 1 "$here")"; y="$(field 2 "$here")"

# Four corpses and two walkers, parked by the harness. The mod never spawns one.
made="$(ev "return CFInst.park([[corpse]], 4, $x + 3, $y + 3, 0)")"
note "corpses parked: $(field 1 "$made") zombies created, $(field 2 "$made") killed where they stood"
walkers="$(ev "return CFInst.park([[zombie]], 2, $x + 6, $y + 3, 0)")"
note "walkers parked: $(field 1 "$walkers")"
sleep 5

p="$(ev "return CFInst.bodyProbe($x, $y, 0, 10)")"
note "within 10 tiles: $(field 1 "$p") dead bodies on squares, $(field 2 "$p") entries in the cell's zombie list ($(field 3 "$p") of them dead), $(field 4 "$p") of all of them usable as a carrier"
note "the bodies, as the engine answers for them: $(field 5 "$p")"
note "the zombie list: $(field 6 "$p")"
s="$(ev "return CFInst.carriersNear($x, $y, 0, 10)")"
note "the mod's own carrier scan over the same ground: $(field 1 "$s") usable ($(field 2 "$s")) $(field 3 "$s")"

corpses_usable="$(grep -o "refusal=none, usable" <<<"$(field 5 "$p")" | grep -c . || true)"
is_number "$corpses_usable" || corpses_usable=0
note "corpses the mod would use: $corpses_usable of $(field 1 "$p")"
if [ "$(field 1 "$p")" = 0 ]; then
    abort "the harness could not park a single body, so nothing was asked"
fi
[ "$corpses_usable" -ge 1 ] 2>/dev/null \
    || fail "not one of $(field 1 "$p") fresh bodies is usable as a carrier, so a clue can never be left in a dead man's jacket ($(field 5 "$p"))"
grep -q "corpse@\|corpse=" <<<"$(field 2 "$s")" \
    || fail "the mod's own scan reports no corpse among its usable carriers ($(field 2 "$s") $(field 3 "$s"))"
# P4-R136: the two walkers standing beside those bodies must be offered as
# nothing. The scan does not read the cell's zombie list at all any more.
grep -q "zombie" <<<"$(field 2 "$s")" \
    && fail "a walking zombie was offered as a carrier ($(field 2 "$s") $(field 3 "$s")), and P4-R136 says only a corpse carries a clue"

# --- (b) A CLUE ON A BODY, and what the record calls it ---------------------
# The same arrangement instalments.sh uses, and for the same reason: a carrier
# is only ever reached for a clue that could not have a fixed container
# (P4-R134), and that state is rare in a fresh suburb unless the mod is allowed
# to see fewer kinds of cupboard - which is a harness knob on shipped code.
ev 'return CFCamp.gap(false)' >/dev/null
note "the gap between cases turned off, and cars kept out of the case's mobile slot (VEHICLE_RADIUS=$(ev 'return CFInst.noCars(true)'))"
note "log level set to $(ev 'return ConspiracyFiles.logLevel("d")' | field 1), so the filler's own ev=skip refusals reach the console"
waiting=no
for kinds in "desk" "shelves" "locker,filingcabinet"; do
    note "container kinds narrowed to $(ev "return CFInst.narrow([[$kinds]])")"
    want=$(( $(ev 'return CFCamp.cases()' | field 1) + 1 ))
    m="$(ev 'return CFCamp.moveOn()')"
    [ "$(field 1 "$m")" = true ] || { note "nowhere fresh to move to ($(field 2 "$m"))"; break; }
    say "moved $(field 4 "$m") tiles to $(field 2 "$m"), waiting for case $want"
    deadline=$(( $(date +%s) + 150 ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        [ "$(ev 'return CFCamp.cases()' | field 1)" -ge "$want" ] 2>/dev/null && break
        sleep 5
    done
    w="$(ev 'return CFInst.waitingSite()')"
    if [ "$(field 1 "$w")" = true ] && [ "$(field 9 "$w")" = true ]; then waiting=yes; break; fi
    note "with only $kinds allowed, no case left a clue waiting that a body could take ($(ev 'return CFInst.targets()' | field 3) waiting)"
done
if [ "$waiting" != yes ]; then
    note "no case in three tries left a clue waiting, so the filler never had to look for a body; the engine answer above is all this run proves"
else
    x="$(field 4 "$w")"; y="$(field 5 "$w")"; z="$(field 6 "$w")"
    note "$(field 2 "$w") waits for the site $(field 3 "$w") at $x,$y (kinds there: $(field 8 "$w"), the case's mobile slot free: $(field 9 "$w"))"
    ev "return CFField.teleport($x, $y, $z)" >/dev/null
    wait_true 90 'CFCamp.settled()' >/dev/null || true
    made="$(ev "return CFInst.park([[corpse]], 5, $x, $y, $z)")"
    note "parked $(field 1 "$made") zombie(s) at the site, $(field 2 "$made") of them killed where they stood"
    sleep 4
    note "the mod's own carrier scan at the site sees $(ev "return CFInst.carriersNear($x, $y, $z, 14)" | tr '\t' ' ')"
    back="$(ev "return CFInst.stepAway(25, $x, $y, $z)")"
    note "the survivor stands at $(field 2 "$back"), $(field 3 "$back") tiles off, so the filler is allowed to place ($(ev "return CFInst.loadedAt($x, $y, $z, 6)" | tr '\t' ' ') squares/containers/bodies loaded)"
    got=no
    deadline=$(( $(date +%s) + 300 ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        c="$(ev 'return CFInst.pickCarrierClue([[corpse]])')"
        [ "$(field 1 "$c")" = true ] && { got=yes; break; }
        sleep 5
    done
    if [ "$got" != yes ]; then
        fail "five minutes with five fresh bodies at the waiting clue's own site and no clue landed on one ($(field 2 "$c")); the filler's refusals: $(run_log | grep -o 'ev=skip why=[^ ]*' | sort | uniq -c | tr '\n' ' ')"
        note "what the mod could see at the site: $(ev "return CFInst.bodyProbe($x, $y, $z, 8)" | cut -f1-4 | tr '\t' ' ') bodies/zombie-list/dead-in-list/usable; $(ev "return CFInst.bodyProbe($x, $y, $z, 8)" | field 5 | cut -c1-300)"
    else
        # The record's words come from the periodic sighting scan, so they
        # exist a pass or two after the clue does.
        deadline=$(( $(date +%s) + 90 ))
        while [ "$(date +%s)" -lt "$deadline" ]; do
            c="$(ev 'return CFInst.pickCarrierClue([[corpse]])')"
            [ "$(field 4 "$c")" != nil ] && break
            sleep 3
        done
        note "a clue on a body: $(field 2 "$c") at $(field 5 "$c"), the record reads \"$(field 4 "$c")\""
        grep -q "^On a body at\|^On a body close by" <<<"$(field 4 "$c")" \
            || fail "a clue on a body reads \"$(field 4 "$c")\", not \"On a body at <address>\""
        grep -q "In a none" <<<"$(field 4 "$c")" \
            && fail "the record still says \"In a none\" for a clue on a body"
        cc="$(ev 'return CFCarry.clueCarrier()')"
        if [ "$(field 1 "$cc")" = true ]; then
            note "the clue read back out of the body the mod marked: in its inventory=$(field 2 "$cc") item=$(field 3 "$cc") container type=$(field 4 "$cc") carrier=$(field 5 "$cc")"
            [ "$(field 2 "$cc")" = true ] \
                || fail "the mod found the body it marked but the clue is not in its inventory ($(field 3 "$cc"))"
        else
            fail "the body carrying the clue could not be found again by its mark ($(field 2 "$cc"))"
        fi
        note "ev=placed why=instalment lines in this run: $(run_log | grep -c 'ev=placed .*why=instalment' || true)"

        # --- (c) spotted by searching, beside the body -----------------------
        # The survivor stands within four tiles of where the mod says the clue
        # is now and turns Search Mode on once a second, exactly as the clue
        # field check does. Beside a BODY, Search Mode stays on - which is the
        # difference P4-R136 was decided for (a clue on a walking zombie could
        # not be spotted at all: 20260918T045929).
        b="$(ev 'return CFInst.standBeside()')"
        if [ "$(field 1 "$b")" != true ]; then
            fail "could not put the survivor near the body ($(field 2 "$b"))"
        else
            note "standing at $(field 2 "$b"), the clue at $(field 3 "$b"), $(field 4 "$b") tile(s) away"
            spotted=no; start=$(date +%s); deadline=$(( start + 150 ))
            while [ "$(date +%s)" -lt "$deadline" ]; do
                ev 'return CFInst.standBeside()' >/dev/null
                ev 'return CFField.searchOn()' >/dev/null
                [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
                sleep 1
            done
            if [ "$spotted" = yes ]; then
                note "the clue on a body: spotted by Search Mode in $(( $(date +%s) - start ))s"
            else
                fail "a clue on a body could not be spotted in Search Mode in $(( $(date +%s) - start ))s beside it (Search Mode answered $(ev 'return CFField.searchOn()' | field 1); icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '); light $(ev 'return CFField.light()' | cut -f2- | tr '\t' ' '))"
            fi
        fi
    fi
fi
note "knobs restored: kinds=$(ev 'return CFInst.widen()' | tr '\t' ' ')"

engine="$(mod_errors | grep -cE "CellLoader|missing tile" || true)"; is_number "$engine" || engine=0
ours="$(mod_errors | grep -vE "CellLoader|missing tile" || true)"
thrown="$(grep -c . <<<"$ours")"; is_number "$thrown" || thrown=0
[ "$thrown" = 0 ] || fail "$thrown errors inside the mod: $(head -3 <<<"$ours")"

"$PZ" shot "$RUNS/$id-body-carrier.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-body-carrier.txt"
{
    echo "Linux body_carrier check $id: $verdict"
    source_line
    echo "errors inside the mod: $thrown"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
