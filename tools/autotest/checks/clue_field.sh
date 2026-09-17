#!/usr/bin/env bash
# Clues are found by searching (P4-R132): the four things the unit tests could
# not answer and stages 1-3 left open (docs/design/SEARCH_TO_FIND.md, "Differs
# from the design"). In one world, with the mod loaded normally:
#
#   (a) a clue in a CAR, with the car then moved: its search icon must follow
#       the car to its new square, and the clue must still be spottable there
#       (stage 2 made the icon follow; only a unit test had seen it). No case in
#       three worlds had a car near the buildings it chose, so the check parks
#       vans in a fresh neighbourhood and asks for a case there;
#   (b) recognition across a SAVE AND RELOAD: a clue looked over, then quit with
#       --save and reloaded with --continue, is still recognised, still shows as
#       Evidence, and can still be inspected;
#   (c) INTERRUPTION: walking, and aiming, part-way through "Look it over" and
#       Inspect must cancel them and leave the clue unrecognised / unnoted
#       (stopOnWalk / stopOnAim, proven in the unit tests only). The survivor
#       walks and aims from the real keyboard and mouse ("pz.sh hold"), because
#       that is where the game reads them;
#   (d) DARKNESS: a clue in an unlit room must not be spottable FROM A FEW TILES
#       BACK, and then the check reports plainly what the light rule does - with
#       a lit torch in hand, and standing on the unlit square itself, which the
#       game treats quite differently. Those two are findings, not pass/fail:
#       they are an open design question.
#
# Real display only (spotting and light are the game's own). About 25 minutes.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "clue-field: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

# The stages this check reuses: clue_actions (the menu, the queue, the
# timings), core_loop and campaign (CFCamp.moveOn / settled / gap, which is how
# a later case is asked for at all since P4-R125), then its own.
load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/campaign.lua" >/dev/null \
        && ev -f "$CHECKS/clue_actions.lua" >/dev/null && ev -f "$CHECKS/clue_field.lua" >/dev/null
}
placed() { # wait until every clue of the case is placed
    local deadline=$(( $(date +%s) + 240 )) c
    while :; do
        c="$(ev 'return CFField.clues()')"
        [ "$(f 1 <<<"$c")" -gt 0 ] 2>/dev/null && [ "$(f 2 <<<"$c")" = 0 ] && { echo "$c"; return 0; }
        [ "$(date +%s)" -lt "$deadline" ] || { echo "$c"; return 1; }
        sleep 2
    done
}
# Hold a key down in the game while the shell keeps reading the action queue:
# the point is to catch the action going away, so the hold runs beside the
# polling. 9>&- keeps the machine lock out of it (lib.sh, claim_game).
hold_bg() { "$PZ" hold "$1" "$2" >/dev/null 2>&1 9>&- & }

# --- (a) the clue in the car ------------------------------------------------
# Called once a case has put a clue in a car (see the bottom of the check).
car_stage() {
    note "car clue: $(f 2 <<<"$car") at $(f 3 <<<"$car"), part $(f 5 <<<"$car")"
    ev "return CFField.teleport($(f 3 <<<"$car"))" >/dev/null
    wait_true 30 'CFField.loaded()' >/dev/null || fail "the car clue's square never loaded"
    found="$(ev 'return CFField.carFind()')"
    if [ "$(f 1 <<<"$found")" != true ]; then
        fail "the car holding the clue could not be found: $(f 2 <<<"$found")"
    else
        note "the car: $(f 2 <<<"$found") at $(f 3 <<<"$found"), clue in its $(f 4 <<<"$found") as \"$(f 5 <<<"$found")\""
        note "beside the parked car: $(ev 'return CFField.standByCar()' | cut -f2- | tr '\t' ' ') tiles from its square"
        ev 'return CFField.searchOn()' >/dev/null
        icon_before=""
        for _ in $(seq 40); do
            i="$(ev 'return CFField.icon()')"
            [ "$(f 1 <<<"$i")" = true ] && { icon_before="$i"; break; }
            ev 'return CFField.searchOn()' >/dev/null; sleep 0.5
        done
        [ -n "$icon_before" ] || fail "no search icon on the parked car's clue"
        note "icon before the car moved: square $(f 2 <<<"$icon_before"), our class $(f 3 <<<"$icon_before"), seen $(f 4 <<<"$icon_before"), timer $(f 5 <<<"$icon_before")"
        moved="$(ev 'return CFField.carMove(10)')"
        if [ "$(f 1 <<<"$moved")" != true ]; then
            fail "the car could not be moved: $(f 2 <<<"$moved")"
        else
            note "car moved from $(f 2 <<<"$moved") to $(f 3 <<<"$moved") [$(f 4 <<<"$moved")]"
            [ "$(f 2 <<<"$moved")" != "$(f 3 <<<"$moved")" ] || fail "the car did not actually move"
            still="$(ev 'return CFField.stillInCar()')"
            [ "$(f 1 <<<"$still")" = true ] || fail "the clue is no longer in the car after the move: $(f 2 <<<"$still")"
            ev 'return CFField.standByCar()' >/dev/null
            sleep 2
            live="$(ev 'return CFField.live()')"
            note "the mod places the clue at $(f 2 <<<"$live") after the move (the car is at $(f 3 <<<"$moved"))"
            icon_after=""
            for _ in $(seq 60); do
                ev 'return CFField.searchOn()' >/dev/null
                i="$(ev 'return CFField.icon()')"
                [ "$(f 1 <<<"$i")" = true ] && [ "$(f 2 <<<"$i" | cut -d, -f1-2)" = "$(f 3 <<<"$moved")" ] && { icon_after="$i"; break; }
                sleep 0.5
            done
            if [ -n "$icon_after" ]; then
                note "icon after the car moved: square $(f 2 <<<"$icon_after") (the car's), seen $(f 4 <<<"$icon_after"), timer $(f 5 <<<"$icon_after"), $(f 6 <<<"$icon_after") tiles away"
            else
                fail "the search icon did not follow the car: it is at $(ev 'return CFField.icon()' | f 2), the car at $(f 3 <<<"$moved")"
            fi
            # And the clue is still findable there: the game's own spotting,
            # first with no Search Focus and then with "Clues" - which reaches
            # 4.5 tiles instead of 3, and a car's body decides how close anyone
            # can stand (20260917T215847 stood 3.54 tiles off and never spotted
            # it). Both numbers are reported; a FAIL only if neither works.
            stood="$(ev 'return CFField.standByCar()')"
            note "standing as close to the car as its body allows: $(f 2 <<<"$stood"), $(f 3 <<<"$stood") tiles from its square"
            try_spot() { # try_spot SECONDS LABEL
                local end=$(( $(date +%s) + $1 )) start=$(date +%s)
                while [ "$(date +%s)" -lt "$end" ]; do
                    ev 'return CFField.searchOn()' >/dev/null
                    [ "$(ev 'return CFField.recognised()')" = true ] && { SPOT_SECS=$(( $(date +%s) - start )); return 0; }
                    sleep 0.5
                done
                SPOT_SECS=$(( $(date +%s) - start )); return 1
            }
            ev "return CFField.setFocus('')" >/dev/null
            if try_spot 60 "no focus"; then
                note "the clue in the moved car was spotted with NO search focus, ${SPOT_SECS}s, at $(f 3 <<<"$stood") tiles"
            else
                note "with no search focus: not spotted in ${SPOT_SECS}s at $(f 3 <<<"$stood") tiles (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '))"
                focus="$(ev "return CFField.setFocus('Clues')")"
                note "Search Focus set to Clues: $(f 2 <<<"$focus")"
                if try_spot 120 "Clues"; then
                    note "ANSWER (car): the clue in the moved car needed the Clues focus - spotted ${SPOT_SECS}s after choosing it, at $(f 3 <<<"$stood") tiles from the car's square"
                else
                    fail "the clue in the moved car could not be spotted at $(f 3 <<<"$stood") tiles even with the Clues focus, in ${SPOT_SECS}s (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '); light $(ev 'return CFField.light()' | cut -f2- | tr '\t' ' '))"
                fi
            fi
        fi
    fi
    ev 'return CFField.searchOff()' >/dev/null
}

claim_game || exit 2

# --- the world --------------------------------------------------------------
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || abort "no case started"
load_lua || abort "could not load the check's Lua"
clues="$(placed)" || abort "clues never all placed: $clues"
note "mod version $(ev 'return CFField.version()' | tr '\t' ' '); $(f 1 <<<"$clues") clues placed, $(f 3 <<<"$clues") of them in a car"
note "clues: $(f 4 <<<"$clues")"
note "game running: paused/speed=$(ev 'return CFAct.running()' | tr '\t' ' ')"

# --- (c) interruption -------------------------------------------------------
# A clue in furniture, carried, and then interrupted part-way through each
# action. Progress is read from the queue, so "it was really running" and "it
# is gone" are both measured rather than assumed.
pick=""
for k in 1 2 3 4 5; do
    p="$(ev "return CFField.pick('box', $k)")"
    [ "$(f 1 <<<"$p")" = true ] || break
    ev "return CFField.teleport($(f 3 <<<"$p"))" >/dev/null
    wait_true 20 'CFField.loaded()' >/dev/null || continue
    ev 'return CFField.adopt()' >/dev/null
    g="$(ev 'return CFAct.find()')"
    [ "$(f 1 <<<"$g")" = true ] || { say "clue $k is not in its container ($(f 2 <<<"$g")); trying another"; continue; }
    ev 'return CFField.adopt()' >/dev/null
    ev 'return CFAct.take()' >/dev/null
    wait_true 20 'CFAct.carried()' >/dev/null || { say "clue $k never reached the inventory; trying another"; continue; }
    pick="$k"; docA="$(f 2 <<<"$p")"; break
done
if [ -z "$pick" ]; then
    fail "no clue in furniture could be carried, so interruption was not tested"
else
    note "interruption clue: $docA (found as \"$(f 2 <<<"$g")\")"
    ev 'return CFField.adopt()' >/dev/null
    interrupt() { # interrupt OPTION KEY LABEL: choose, hold the key, watch the queue
        local option="$1" key="$2" label="$3" c q ran seen_running=no seen_moving=no progress=0 gone=no
        c="$(ev "return CFAct.choose('$option')")"
        [ "$(f 1 <<<"$c")" = true ] || { fail "$label: $option could not be chosen: $(f 2 <<<"$c")"; return 1; }
        sleep 0.8
        q="$(ev 'return CFField.state()')"
        [ "$(f 1 <<<"$q")" = "$4" ] && { seen_running=yes; progress="$(f 2 <<<"$q")"; }
        hold_bg "$key" 2
        for _ in $(seq 20); do
            q="$(ev 'return CFField.state()')"
            [ "$(f 3 <<<"$q")" = true ] && seen_moving=yes
            [ "$(f 4 <<<"$q")" = true ] && seen_moving=yes
            [ "$(f 1 <<<"$q")" = "$4" ] || { gone=yes; break; }
            sleep 0.2
        done
        note "$label: action seen running=$seen_running at progress $progress; the game reported walking/aiming=$seen_moving; the action left the queue=$gone; queue now $(ev 'return CFField.state()' | tr '\t' ' ')"
        [ "$seen_running" = yes ] || note "$label: the action was already over before the key went down; nothing was interrupted"
        # A FAIL only when the survivor really did move or aim and the action
        # carried on: if the key never reached the game the harness has proved
        # nothing, and saying so is not a verdict on the mod.
        INTERRUPTED=no
        if [ "$seen_moving" = yes ]; then
            if [ "$gone" = yes ]; then INTERRUPTED=yes
            else fail "$label: $option was still running while the survivor $key"; fi
        elif [ "$gone" = yes ]; then
            INTERRUPTED=yes
            note "$label: the action stopped, but the game never reported moving or aiming, so what stopped it is not certain"
        else
            note "$label: the survivor never moved or aimed ($key did not reach the game), so interruption was not tested"
        fi
        return 0
    }
    # The follow-up assertion only bites when the action really was stopped:
    # a key that never reached the game leaves the action to finish, which is
    # right, and says nothing about the mod.
    interrupt "Look it over" w "walking through Look it over" CFLookItOver
    sleep 2
    st="$(ev 'return CFField.state()')"
    note "after walking through Look it over: recognised=$(f 5 <<<"$st"), last look ran (ok, ms)=$(ev "return CFAct.ran('look')" | tr '\t' ' ')"
    [ "$INTERRUPTED" = no ] || [ "$(f 5 <<<"$st")" = false ] \
        || fail "the clue was recognised even though Look it over was cut short by walking"
    interrupt "Look it over" mouse3 "aiming through Look it over" CFLookItOver
    sleep 2
    st="$(ev 'return CFField.state()')"
    note "after aiming through Look it over: recognised=$(f 5 <<<"$st")"
    [ "$INTERRUPTED" = no ] || [ "$(f 5 <<<"$st")" = false ] \
        || fail "the clue was recognised even though Look it over was cut short by aiming"
    # Now let it finish, so Inspect can be interrupted in its turn.
    ev "return CFAct.choose('Look it over')" >/dev/null
    wait_true 25 'CFAct.recognised()' >/dev/null || fail "Look it over never completed when left alone"
    note "left alone, Look it over recognised the clue: item now $(ev 'return CFAct.item_()' | tr '\t' ' ')"
    interrupt "Inspect Investigation Evidence" w "walking through Inspect" CFInspectEvidence
    sleep 2
    st="$(ev 'return CFField.state()')"
    n="$(ev "return CFField.noted([[$docA]])")"
    note "after walking through Inspect: noted=$(f 6 <<<"$st"), in the record=$(f 1 <<<"$n")"
    if [ "$INTERRUPTED" = yes ]; then
        [ "$(f 6 <<<"$st")" = false ] || fail "the clue was noted even though Inspect was cut short by walking"
        [ "$(f 1 <<<"$n")" = false ] || fail "an Inspect cut short still wrote $docA into the record"
    fi
    ev "return CFAct.choose('Inspect Investigation Evidence')" >/dev/null
    wait_true 25 'CFAct.inspected()' >/dev/null || fail "Inspect never completed when left alone"
    note "left alone, Inspect noted it: $(ev "return CFField.noted([[$docA]])" | tr '\t' ' ')"
fi

# --- (b) recognition across a save and a reload -----------------------------
docB=""
for k in 1 2 3 4 5; do
    p="$(ev "return CFField.pick('box', $k)")"
    [ "$(f 1 <<<"$p")" = true ] || break
    ev "return CFField.teleport($(f 3 <<<"$p"))" >/dev/null
    wait_true 20 'CFField.loaded()' >/dev/null || continue
    ev 'return CFField.adopt()' >/dev/null
    g="$(ev 'return CFAct.find()')"
    [ "$(f 1 <<<"$g")" = true ] || continue
    ev 'return CFField.adopt()' >/dev/null
    ev 'return CFAct.take()' >/dev/null
    wait_true 20 'CFAct.carried()' >/dev/null || continue
    docB="$(f 2 <<<"$p")"; plainB="$(f 2 <<<"$g")"; break
done
if [ -z "$docB" ]; then
    fail "no second clue could be carried, so the reload was not tested"
else
    ev "return CFAct.choose('Look it over')" >/dev/null
    wait_true 25 'CFAct.recognised()' >/dev/null || fail "$docB: Look it over did not recognise it before the save"
    before="$(ev 'return CFAct.item_()')"
    note "before the save: $docB was \"$plainB\", now $(tr '\t' ' ' <<<"$before") (name, category, recognised, noted)"
    world="$(cat "$REPO/dev/eval/linux/world")"
    errors_before="$(mod_errors)"
    "$PZ" stop --save >/dev/null 2>&1
    "$PZ" start --continue "$world" >/dev/null 2>&1 || abort "the saved game did not load"
    load_lua || abort "could not load the check's Lua after the reload"
    wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || fail "the case did not resume after the reload"
    sleep 5
    after="$(ev "return CFField.refind([[$docB]])")"
    if [ "$(f 1 <<<"$after")" != true ]; then
        fail "after the reload the clue could not be found on the survivor: $(f 2 <<<"$after")"
    else
        note "after the reload: name \"$(f 2 <<<"$after")\", category $(f 3 <<<"$after"), recognised $(f 4 <<<"$after"), noted $(f 5 <<<"$after"), recognised by id $(f 6 <<<"$after")"
        [ "$(f 4 <<<"$after")" = true ] || fail "recognition did not survive the reload ($docB)"
        [ "$(f 6 <<<"$after")" = true ] || fail "the record does not call $docB recognised after the reload"
        [ "$(f 3 <<<"$after")" = Evidence ] || fail "after the reload the clue is categorised $(f 3 <<<"$after"), not Evidence"
        [ "$(f 2 <<<"$after")" != "$plainB" ] || fail "after the reload the clue is back to its plain name \"$plainB\""
        ev 'return CFField.adopt()' >/dev/null
        m="$(ev 'return CFAct.menu()')"
        note "menu after the reload: $(f 2 <<<"$m")"
        [ "$(f 2 <<<"$m")" = "Inspect Investigation Evidence" ] || fail "after the reload the recognised clue does not offer Inspect: $(f 2 <<<"$m")"
        ev "return CFAct.choose('Inspect Investigation Evidence')" >/dev/null
        if wait_true 25 'CFAct.inspected()' >/dev/null; then
            note "inspected after the reload: $(ev "return CFField.noted([[$docB]])" | tr '\t' ' '); ran (ok, ms) $(ev "return CFAct.ran('inspect')" | tr '\t' ' ')"
        else
            fail "after the reload the clue could not be inspected"
        fi
    fi
fi

# --- (d) darkness, and a torch ----------------------------------------------
# THE GAME'S OWN LIGHT RULE, which is what makes this worth asking: in a square
# darker than forageSystem.lightPenaltyCutoff the game refuses to see an icon
# from a distance (ISBaseIcon.doVisionCheck caps the view at darkVisionRadius,
# 1.5 tiles) but returns "seen" straight away for a survivor standing ON the
# square (isOnSquare is tested before the light). So darkness is tested from a
# few tiles back, and the on-the-square case is reported for what it is.
darkclue=""
for k in 1 2 3 4 5 6; do
    p="$(ev "return CFField.pick('box', $k)")"
    [ "$(f 1 <<<"$p")" = true ] || break
    ev "return CFField.teleport($(f 3 <<<"$p"))" >/dev/null
    wait_true 20 'CFField.loaded()' >/dev/null || continue
    r="$(ev 'return CFField.inRoom()')"
    [ "$(f 1 <<<"$r")" = true ] || { say "clue $k is $(f 2 <<<"$r"); looking for one indoors"; continue; }
    darkclue="$(f 2 <<<"$p")"; room="$(f 2 <<<"$r")"; darkk="$k"; break
done
if [ -z "$darkclue" ]; then
    note "no unrecognised clue indoors was left, so the darkness stage was not exercised"
else
    note "darkness clue: $darkclue in room \"$room\""
    ev 'return CFField.night(1.0)' >/dev/null
    sleep 8
    back="$(ev 'return CFField.stepBack(3)')"
    if [ "$(f 1 <<<"$back")" != true ]; then
        note "nowhere to stand back to in the same room ($(f 2 <<<"$back")); the darkness stage needs one"
    fi
    note "standing back from it: $(f 2 <<<"$back"), $(f 3 <<<"$back") tiles away, room \"$(f 4 <<<"$back")\""
    dark="$(ev 'return CFField.light()')"
    note "at 01:00 in \"$room\": light penalty $(f 2 <<<"$dark"), the game calls it too dark=$(f 3 <<<"$dark"), the mod's sight test $(f 4 <<<"$dark")/$(f 5 <<<"$dark"), darkMulti $(f 6 <<<"$dark"), cutoff $(f 7 <<<"$dark")"
    if [ "$(f 3 <<<"$dark")" != true ]; then
        note "the room did not go dark enough for the game's own cutoff, so darkness was not really tested"
    else
        spotted=no; start=$(date +%s)
        for _ in $(seq 90); do
            ev 'return CFField.searchOn()' >/dev/null
            [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
            sleep 0.5
        done
        darksecs=$(( $(date +%s) - start ))
        if [ "$spotted" = yes ]; then
            fail "a clue $(f 3 <<<"$back") tiles away in a room the game calls too dark was spotted anyway, after ${darksecs}s"
        else
            note "in the dark, $(f 3 <<<"$back") tiles away: not spotted in ${darksecs}s of searching (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '))"
        fi
        # The question worth an answer: the same spot, the same distance, with a
        # lit torch in the survivor's hand. The game's own rule is worth knowing
        # while reading the numbers: forageSystem.getLightLevelPenalty raises a
        # square's light to the torch's strength only for the square the
        # survivor is STANDING on; anything further away depends on the engine
        # lighting it, which is what this measures.
        t="$(ev 'return CFField.torch(true)')"
        note "torch: $(f 2 <<<"$t"), lit=$(f 3 <<<"$t"), in a hand=$(f 4 <<<"$t"), light strength $(f 5 <<<"$t")"
        sleep 6
        ev 'return CFField.stepBack(3)' >/dev/null
        lit="$(ev 'return CFField.light()')"
        note "with the torch lit, same distance: light penalty $(f 2 <<<"$lit") (was $(f 2 <<<"$dark")), too dark=$(f 3 <<<"$lit"), sight test $(f 4 <<<"$lit")/$(f 5 <<<"$lit"), darkMulti $(f 6 <<<"$lit")"
        spotted=no; start=$(date +%s)
        for _ in $(seq 180); do
            ev 'return CFField.searchOn()' >/dev/null
            [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
            sleep 0.5
        done
        torchsecs=$(( $(date +%s) - start ))
        if [ "$spotted" = yes ]; then
            note "ANSWER (light): a lit torch makes a clue in an unlit room spottable from where it was not - recognised ${torchsecs}s after the torch, at $(f 3 <<<"$back") tiles"
        else
            note "ANSWER (light): a lit torch does NOT make it spottable - still nothing after ${torchsecs}s at $(f 3 <<<"$back") tiles (penalty $(f 2 <<<"$lit"), too dark=$(f 3 <<<"$lit")); in the dark the way in is Look it over"
        fi
        # And the game's other half of the rule, on a clue nothing has touched:
        # standing ON an unlit square, does the game spot it?
        ev 'return CFField.torch(false)' >/dev/null
        onsq=""
        for k in $((darkk + 1)) $((darkk + 2)) $((darkk + 3)); do
            p="$(ev "return CFField.pick('box', $k)")"
            [ "$(f 1 <<<"$p")" = true ] || break
            ev "return CFField.teleport($(f 3 <<<"$p"))" >/dev/null
            wait_true 20 'CFField.loaded()' >/dev/null || continue
            [ "$(ev 'return CFField.inRoom()' | f 1)" = true ] || continue
            onsq="$(f 2 <<<"$p")"; break
        done
        if [ -z "$onsq" ]; then
            note "no second indoor clue was left to try the on-the-square rule"
        else
            ev 'return CFField.standOn()' >/dev/null
            sleep 2
            osl="$(ev 'return CFField.light()')"
            spotted=no; start=$(date +%s)
            for _ in $(seq 90); do
                ev 'return CFField.searchOn()' >/dev/null
                [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
                sleep 0.5
            done
            secs=$(( $(date +%s) - start ))
            if [ "$spotted" = yes ]; then
                note "ANSWER (light): standing ON the unlit square (penalty $(f 2 <<<"$osl"), too dark=$(f 3 <<<"$osl")) the game DOES spot it - ${secs}s - which is its own isOnSquare rule, not our doing"
            else
                note "ANSWER (light): standing ON the unlit square it was still not spotted in ${secs}s (penalty $(f 2 <<<"$osl"))"
            fi
        fi
        ev 'return CFField.searchOff()' >/dev/null
    fi
fi

# --- (a) arrange a clue in a car, then run the car stage --------------------
# No case in three worlds had a car near the buildings it chose
# (20260917T214331), so the harness parks vans in a fresh neighbourhood and
# asks for a case there, the way the campaign check asks for one (P4-R125: a
# case waits for the survivor to move on). Up to CF_CAR_TRIES cases.
ev 'return CFField.night(12.0)' >/dev/null      # daylight again, for spotting outdoors
ev 'return CFCamp.gap(false)' >/dev/null
car=""
for try in $(seq "${CF_CAR_TRIES:-3}"); do
    m="$(ev 'return CFCamp.moveOn()')"
    [ "$(f 1 <<<"$m")" = true ] || { note "car try $try: nowhere fresh to move to: $(f 2 <<<"$m")"; break; }
    wait_true 120 'CFCamp.settled()' >/dev/null || { note "car try $try: the world at $(f 2 <<<"$m") did not load"; continue; }
    parked="$(ev 'return CFField.parkCars(4)')"
    note "car try $try: moved on $(f 4 <<<"$m") tiles to $(f 2 <<<"$m"), parked $(f 1 <<<"$parked") vans at $(f 2 <<<"$parked")"
    want=$(( $(ev 'return CFCamp.cases()' | f 1) + 1 ))
    came=no
    for _ in $(seq 60); do
        [ "$(ev 'return CFCamp.cases()' | f 1)" -ge "$want" ] 2>/dev/null && { came=yes; break; }
        sleep 4
    done
    [ "$came" = yes ] || { note "car try $try: no new case within four minutes (preparing=$(ev 'return CFCamp.preparing()' | tr '\t' ' '))"; continue; }
    sleep 5
    c="$(ev 'return CFField.clues()')"
    note "car try $try: the new case placed $(f 1 <<<"$c") clues, $(f 3 <<<"$c") in a car"
    car="$(ev "return CFField.pick('car', 1)")"
    [ "$(f 1 <<<"$car")" = true ] && break
    car=""
done
if [ -n "$car" ]; then
    car_stage
else
    note "no case put a clue in a car even with vans parked beside it, so the car stage was not exercised"
fi

# --- errors -----------------------------------------------------------------
errors="$(mod_error_count)"; is_number "$errors" || errors=0
thrown="$(mod_errors | wc -l | tr -d ' ')"; is_number "$thrown" || thrown=0
[ $((errors + thrown)) = 0 ] || fail "$((errors + thrown)) errors inside the mod after the reload: $(mod_errors | head -3)"
[ -z "${errors_before:-}" ] || fail "errors inside the mod before the reload: $(head -3 <<<"$errors_before")"
"$PZ" shot "$RUNS/$id-clue-field.png" >/dev/null 2>&1

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-clue-field.txt"
{
    echo "Linux clue field check $id: $result"
    source_line
    for x in "${findings[@]}"; do echo "FINDING: $x"; done
    echo "errors inside the mod (this session): $((errors + thrown))"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
