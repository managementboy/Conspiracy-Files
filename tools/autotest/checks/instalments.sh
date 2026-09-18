#!/usr/bin/env bash
# Instalments, carriers and the mailbox in the real game (P4-R133, P4-R134;
# docs/design/CASE_PACING.md, docs/design/CLUES_ON_THE_MOVE.md).
#
#   tools/autotest/checks/instalments.sh [--hidden] [--no-expiry]
#
# Four things the mod grew last night that no run had yet seen happen:
#
#   (a) THE MAILBOX. "postbox" is the engine's own word and is in the
#       allow-list. This asks the harder question a running game can answer:
#       is a postbox anywhere the nearby scan can SEE it? A site is a room
#       rectangle inside a building and the scan only looks at squares inside
#       one, while a mailbox stands at the gate. The check reports every
#       postbox around the survivor with whether its square is in a room and
#       inside a case's footprint, then tries to make a case whose only
#       allowed container kind is the postbox, and - if one comes - takes a
#       clue out of a mailbox by searching for it.
#   (b) A CLUE PLACED LATER (`ev=placed why=instalment`). A case goes live with
#       the clues that fit; the filler gives the rest a container as the
#       survivor moves. The harness narrows what the mod may see so a case
#       really does go live with clues waiting, then loads the waiting clue's
#       own site and stands back.
#   (c) A CLUE ON A CARRIER, on a body AND on a zombie: the record must read
#       "On a body at ..." and "On a zombie near ...", never "In a none", and
#       the clue must be SPOTTABLE in Search Mode where it now is.
#   (d) EXPIRY (`ev=stale why=expired`). A clue that finds no home in three
#       in-game days is dropped and the case completes on the clues it got.
#       Seventy-two in-game hours is forty minutes of real time even at the
#       fastest speed, so the constant is lowered for this stage and the run
#       says so; the path is the shipped one.
#
# What the harness turns down, and restores: Storage.KINDS (in place),
# Session.VEHICLE_RADIUS, Session.DEFER_EXPIRE_HOURS. See instalments.lua.
# Real display, about twenty-five minutes. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); expiry=yes
for a in "$@"; do case "$a" in --hidden) start_args+=(--hidden) ;; --no-expiry) expiry=no ;; esac; done
say() { echo "instalments: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }
CHECKS="$REPO/tools/autotest/checks"
cases_now() { ev 'return CFCamp.cases()' | field 1; }
logged() { run_log | grep -c "$1" || true; }

# Wait for a case to arrive, moving on between tries the way a player does
# (P4-R125: a refused case waits for the survivor to move).
get_case() { # get_case LABEL TRIES SECONDS
    local want=$(( $(cases_now) + 1 )) i
    for i in $(seq "$2"); do
        local m; m="$(ev 'return CFCamp.moveOn()')"
        if [ "$(field 1 "$m")" != true ]; then note "$1: nowhere fresh to move to ($(field 2 "$m"))"; return 1; fi
        wait_true 120 'CFCamp.settled()' >/dev/null || true
        say "$1: moved $(field 4 "$m") tiles to $(field 2 "$m"), waiting up to $3 s for case $want"
        local deadline=$(( $(date +%s) + $3 ))
        while [ "$(date +%s)" -lt "$deadline" ]; do
            [ "$(cases_now)" -ge "$want" ] 2>/dev/null && { note "$1: case $want came after $i move(s), with only $(ev 'return CFInst.kinds()') allowed"; return 0; }
            sleep 5
        done
        note "$1: no case after move $i ($(ev 'return CFCamp.promise()' | cut -f1-4 | tr '\t' ' '))"
    done
    return 1
}
# Spot the clue CFField holds by searching for it, standing where the mod says
# it is now (a body stays put, a zombie does not).
spot_it() { # spot_it LABEL SECONDS
    local b; b="$(ev 'return CFInst.standBeside()')"
    [ "$(field 1 "$b")" = true ] || { note "$1: could not stand beside it ($(field 2 "$b"))"; return 1; }
    note "$1: standing at $(field 2 "$b"), the clue at $(field 3 "$b")"
    local start; start=$(date +%s)
    local deadline=$(( start + $2 ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        ev 'return CFInst.standBeside()' >/dev/null
        ev 'return CFField.searchOn()' >/dev/null
        [ "$(ev 'return CFField.recognised()')" = true ] && { note "$1: spotted by Search Mode in $(( $(date +%s) - start ))s"; return 0; }
        sleep 1
    done
    note "$1: not spotted in $(( $(date +%s) - start ))s (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '); light $(ev 'return CFField.light()' | cut -f2- | tr '\t' ' '))"
    return 1
}

claim_game || exit 2
start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop reload campaign clue_actions clue_field carriers pacing instalments; do
    ev -f "$CHECKS/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
wait_true 180 'select(1, CFCamp.cases())>=1' || abort "no first case"
note "log level set to $(ev 'return ConspiracyFiles.logLevel("d")' | field 1) for this run, so the filler's own ev=skip refusals reach the console"
note "the survivor is kept alive while zombies are parked beside them: $(ev 'return CFInst.safe()')"
note "container kinds the mod may see, as shipped: $(ev 'return CFInst.kinds()')"

# --- (a) the mailbox ---------------------------------------------------------
pb="$(ev 'return CFInst.postboxes(60)')"
note "postboxes within 60 tiles of the survivor: $(field 1 "$pb") containers, $(field 2 "$pb") of them on a square the game calls a room, $(field 3 "$pb") inside one of the $(field 5 "$pb") live site footprints (first: $(field 4 "$pb"))"
st="$(ev 'return CFInst.siteTypes()')"
note "container kinds the mod offered the live sites: $(field 2 "$st") - postbox among them on $(field 1 "$st") site(s)"
if [ "$(field 1 "$pb")" -gt 0 ] 2>/dev/null && [ "$(field 2 "$pb")" = 0 ]; then
    note "ANSWER (mailbox): every postbox found stands on a square the game does not call a room. Storage.scan and the filler's boundsScan only ever look at squares INSIDE a site's room rectangle, so a mailbox at the gate cannot be offered as a container however the allow-list reads. A design question for the owner, not a harness fault."
fi
ev 'return CFCamp.gap(false)' >/dev/null
ev 'return CFInst.noCars(true)' >/dev/null
note "container kinds narrowed to: $(ev 'return CFInst.narrow("postbox")'); cars kept out of the mobile slot (VEHICLE_RADIUS=$(ev 'return CFInst.noCars(true)'))"
if get_case "the mailbox case" 2 150; then
    mb="$(ev 'return CFInst.pickTypeClue("postbox")')"
    note "live sites now: $(ev 'return CFInst.siteTypes()' | field 2)"
    if [ "$(field 1 "$mb")" = true ]; then
        note "a clue in a mailbox: $(field 2 "$mb") at $(field 4 "$mb"), the record reads \"$(field 3 "$mb")\""
        grep -q "In a mailbox" <<<"$(field 3 "$mb")" || fail "a clue in a postbox reads \"$(field 3 "$mb")\", not \"In a mailbox\""
        spot_it "the clue in a mailbox" 90 || fail "a clue in a mailbox could not be spotted by searching beside it"
    else
        note "ANSWER (mailbox): a case was created with postbox the only allowed kind, but no clue of it is in a postbox ($(field 2 "$mb")); targets: $(ev 'return CFInst.targets()' | field 4 | cut -c1-300)"
    fi
else
    note "ANSWER (mailbox): with postbox the only container kind the mod may see, no case could be created at all in two fresh neighbourhoods - which is what the room-rectangle finding above predicts: the scan never sees a mailbox."
fi

# --- (b) and (c) a clue placed later, on a body ------------------------------
# One or two kinds allowed is a ransacked neighbourhood: a case goes live with
# the clues that fit and the rest wait, which is the state the filler and the
# carrier exist for.
note "container kinds narrowed to: $(ev 'return CFInst.narrow("counter")')"
carrier_done=""
for kind in corpse zombie; do
    if ! get_case "the $kind case" 3 180; then
        note "no case could be created for the $kind stage with $(ev 'return CFInst.kinds()') allowed; widening to counter+shelves"
        ev 'return CFInst.narrow("counter,shelves")' >/dev/null
        get_case "the $kind case, wider" 2 180 || { note "the $kind stage never got a case"; continue; }
    fi
    t="$(ev 'return CFInst.targets()')"
    note "$kind stage, the cases as they stand: $(field 1 "$t") placed, $(field 2 "$t") on a carrier, $(field 3 "$t") waiting"
    w="$(ev 'return CFInst.waitingSite()')"
    if [ "$(field 1 "$w")" != true ]; then
        note "$kind stage: every clue found a container even with only $(ev 'return CFInst.kinds()') allowed ($(field 2 "$w")), so nothing was waiting for a carrier"
        continue
    fi
    x="$(field 4 "$w")"; y="$(field 5 "$w")"; z="$(field 6 "$w")"
    note "$kind stage: $(field 2 "$w") waits for the site $(field 3 "$w") at $x,$y (kinds there: $(field 8 "$w"), waiting since hour $(field 7 "$w"))"
    # Load that site, park carriers of this kind in it, then stand back beyond
    # the filler's twenty-tile proximity guard.
    ev "return CFField.teleport($x, $y, $z)" >/dev/null
    wait_true 90 'CFCamp.settled()' >/dev/null || true
    made="$(ev "return CFInst.park([[$kind]], 5, $x, $y, $z)")"
    note "$kind stage: parked $(field 1 "$made") zombie(s) at the site, $(field 2 "$made") of them killed where they stood"
    sleep 4
    note "$kind stage: the mod's own carrier scan at the site sees $(ev "return CFInst.carriersNear($x, $y, $z, 14)" | tr '\t' ' ')"
    back="$(ev "return CFInst.stepAway(25, $x, $y, $z)")"
    note "$kind stage: the survivor stands at $(field 2 "$back"), $(field 3 "$back") tiles off, so the filler is allowed to place ($(ev "return CFInst.loadedAt($x, $y, $z, 6)" | tr '\t' ' ') squares/containers/bodies loaded)"
    got=no
    deadline=$(( $(date +%s) + 300 ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        c="$(ev "return CFInst.pickCarrierClue([[$kind]])")"
        [ "$(field 1 "$c")" = true ] && { got=yes; break; }
        sleep 5
    done
    if [ "$got" != yes ]; then
        note "$kind stage: no clue landed on a $kind in five minutes ($(field 2 "$c")); targets $(ev 'return CFInst.targets()' | field 4 | cut -c1-300)"
        note "$kind stage: the filler's own refusals, latest: $(run_log | grep -o 'ev=skip why=[^ ]*' | tail -3 | tr '\n' ' ')"
        continue
    fi
    note "a clue on a $kind: $(field 2 "$c") at $(field 5 "$c"), the record reads \"$(field 4 "$c")\""
    case "$kind" in
        corpse) grep -q "^On a body at\|^On a body close by" <<<"$(field 4 "$c")" \
            || fail "a clue on a body reads \"$(field 4 "$c")\", not \"On a body at <address>\"" ;;
        zombie) grep -q "^On a zombie near\|^On a zombie close by" <<<"$(field 4 "$c")" \
            || fail "a clue on a zombie reads \"$(field 4 "$c")\", not \"On a zombie near <address>\"" ;;
    esac
    grep -q "In a none" <<<"$(field 4 "$c")" && fail "the record still says \"In a none\" for a clue on a $kind"
    spot_it "the clue on a $kind" 120 || fail "a clue on a $kind could not be spotted in Search Mode beside it"
    carrier_done+=" $kind"
    note "$kind stage: ev=placed why=instalment lines so far: $(logged 'ev=placed .*why=instalment')"
done
inst="$(logged 'ev=placed .*why=instalment')"
if [ "$inst" -ge 1 ] 2>/dev/null; then
    note "ANSWER (instalments): $inst clue(s) were placed later as instalments; e.g. $(run_log | grep -o 'ev=placed .*why=instalment' | head -1 | cut -c1-160)"
else
    fail "no ev=placed why=instalment line in the whole run, with clues left waiting on purpose"
fi
note "carriers proven in this run:${carrier_done:- none}"

# --- (d) expiry --------------------------------------------------------------
if [ "$expiry" = yes ]; then
    note "expiry: DEFER_EXPIRE_HOURS lowered from $(ev 'return CFInst.expire(72)') to $(ev 'return CFInst.expire(1)') in-game hour(s) - seventy-two is forty minutes of real time even at the fastest speed; the path that drops the clue is the shipped one"
    w="$(ev 'return CFInst.waitingSite()')"
    if [ "$(field 1 "$w")" != true ]; then
        ev 'return CFInst.narrow("locker")' >/dev/null
        get_case "the expiry case" 2 180 || true
        w="$(ev 'return CFInst.waitingSite()')"
    fi
    if [ "$(field 1 "$w")" != true ]; then
        note "ANSWER (expiry): nothing was waiting for a container by the end, so no clue could expire in this run"
    else
        note "expiry: $(field 2 "$w") waits for $(field 3 "$w") at $(field 4 "$w"),$(field 5 "$w")"
        # Far enough that the site is unloaded: the filler sees only loaded
        # squares, so nothing can be placed and the clock runs out.
        m="$(ev 'return CFCamp.moveOn(600)')"
        note "expiry: the survivor moves $(field 4 "$m") tiles away to $(field 2 "$m") so the waiting clue's site unloads"
        ev 'return CFPace.speed(4)' >/dev/null
        start_h="$(ev 'return CFPace.hours()' | field 1)"
        deadline=$(( $(date +%s) + 600 ))
        while [ "$(date +%s)" -lt "$deadline" ]; do
            [ "$(logged 'ev=stale .*why=expired')" -ge 1 ] 2>/dev/null && break
            sleep 10
        done
        ev 'return CFPace.speed(1)' >/dev/null
        n="$(logged 'ev=stale .*why=expired')"
        if [ "$n" -ge 1 ] 2>/dev/null; then
            note "ANSWER (expiry): $n clue(s) expired between in-game hour $start_h and $(ev 'return CFPace.hours()' | field 1); e.g. $(run_log | grep -o 'ev=stale .*why=expired.*' | head -1 | cut -c1-160)"
            note "expiry: the case afterwards: $(ev 'return CFCamp.cases()' | tr '\t' ' '); assignments $(ev 'return CFCamp.assignments()')"
        else
            fail "no ev=stale why=expired line after ten minutes at the fastest speed with the expiry hour set to 1 (in-game hour $start_h -> $(ev 'return CFPace.hours()' | field 1); assignments $(ev 'return CFCamp.assignments()'))"
        fi
    fi
else
    note "ANSWER (expiry): not asked for in this run (--no-expiry)"
fi
note "knobs restored: kinds=$(ev 'return CFInst.widen()' | tr '\t' ' ')"

engine="$(mod_errors | grep -cE "CellLoader|missing tile" || true)"; is_number "$engine" || engine=0
ours="$(mod_errors | grep -vE "CellLoader|missing tile" || true)"
thrown="$(grep -c . <<<"$ours")"; is_number "$thrown" || thrown=0
[ "$engine" = 0 ] || note "$engine error(s) from the game's own cell loader (missing base-game tiles), not from the mod"
[ "$thrown" = 0 ] || fail "$thrown errors inside the mod: $(head -3 <<<"$ours")"

"$PZ" shot "$RUNS/$id-instalments.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-instalments.txt"
{
    echo "Linux instalments check $id: $verdict"
    source_line
    echo "instalments and drops in the log:"
    run_log | grep -oE 'ev=(placed|stale) .*why=(instalment|expired|carrier-gone).*' | cut -c1-150 | sed 's/^/  /' || echo "  none"
    echo "the filler's refusals, by code:"
    run_log | grep -o 'ev=skip why=[^ ]*' | sort | uniq -c | sed 's/^/  /' || echo "  none"
    echo "errors inside the mod: $thrown"
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
