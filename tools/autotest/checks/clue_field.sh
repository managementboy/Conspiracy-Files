#!/usr/bin/env bash
# Clues are found by searching (P4-R132): the four things the unit tests could
# not answer and stages 1-3 left open (docs/design/SEARCH_TO_FIND.md, "Differs
# from the design"). In one world, with the mod loaded normally:
#
#   (a) a clue in a CAR, with the car then moved: its search icon must follow
#       the car to its new square, and the clue must still be spottable there
#       (stage 2 made the icon follow; only a unit test had seen it);
#   (b) recognition across a SAVE AND RELOAD: a clue looked over, then quit with
#       --save and reloaded with --continue, is still recognised, still shows as
#       Evidence, and can still be inspected;
#   (c) INTERRUPTION: walking, and aiming, part-way through "Look it over" and
#       Inspect must cancel them and leave the clue unrecognised / unnoted
#       (stopOnWalk / stopOnAim, proven in the unit tests only). The survivor
#       walks and aims from the real keyboard and mouse ("pz.sh hold"), because
#       that is where the game reads them;
#   (d) DARKNESS: a clue in an unlit room must not be spottable, and then, with
#       a lit torch in the survivor's hand, the check reports plainly whether
#       spotting becomes possible - an open design question, not a pass/fail.
#
# Real display only (spotting and light are the game's own). About 12 minutes.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "clue-field: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
f() { cut -f"$1"; }
CHECKS="$REPO/tools/autotest/checks"

load_lua() { ev -f "$CHECKS/clue_actions.lua" >/dev/null && ev -f "$CHECKS/clue_field.lua" >/dev/null; }
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

claim_game || exit 2

# --- a world with a clue in a car ------------------------------------------
# Cases put clues in cars often but not always, so a world without one is
# started again rather than reported as proof of nothing.
worlds=0; car=""
while :; do
    worlds=$((worlds + 1))
    start_cold || abort "the game did not reach a playable world"
    id="$(session)"
    wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || abort "no case started"
    load_lua || abort "could not load the check's Lua"
    clues="$(placed)" || abort "clues never all placed: $clues"
    note "world $worlds: $(f 1 <<<"$clues") clues placed, $(f 3 <<<"$clues") of them in a car"
    car="$(ev "return CFField.pick('car', 1)")"
    [ "$(f 1 <<<"$car")" = true ] && break
    [ "$worlds" -ge "${CF_CAR_WORLDS:-3}" ] && { note "no case in $worlds worlds put a clue in a car; the car stage was not exercised"; car=""; break; }
    say "world $worlds has no clue in a car ($(f 2 <<<"$car")); starting another"
done
note "mod version $(ev 'return CFField.version()' | tr '\t' ' '); clues: $(f 4 <<<"$clues")"
note "game running: paused/speed=$(ev 'return CFAct.running()' | tr '\t' ' ')"

# --- (a) the clue in the car ------------------------------------------------
if [ -n "$car" ]; then
    note "car clue: $(f 2 <<<"$car") at $(f 3 <<<"$car"), part $(f 5 <<<"$car")"
    ev "return CFField.teleport($(f 3 <<<"$car"))" >/dev/null
    wait_true 30 'CFField.loaded()' >/dev/null || fail "the car clue's square never loaded"
    found="$(ev 'return CFField.carFind()')"
    if [ "$(f 1 <<<"$found")" != true ]; then
        fail "the car holding the clue could not be found: $(f 2 <<<"$found")"
    else
        note "the car: $(f 2 <<<"$found") at $(f 3 <<<"$found"), clue in its $(f 4 <<<"$found") as \"$(f 5 <<<"$found")\""
        ev 'return CFField.standByCar()' >/dev/null
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
            # And the clue is still findable there: the game's own spotting.
            spot_start=$(date +%s); spotted=no
            for _ in $(seq 180); do
                ev 'return CFField.searchOn()' >/dev/null
                [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
                sleep 0.5
            done
            secs=$(( $(date +%s) - spot_start ))
            if [ "$spotted" = yes ]; then
                note "the clue in the moved car was spotted and recognised ${secs}s after searching beside its new square"
            else
                fail "the clue in the moved car could not be spotted in ${secs}s (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '); light $(ev 'return CFField.light()' | cut -f2- | tr '\t' ' '))"
            fi
        fi
    fi
    ev 'return CFField.searchOff()' >/dev/null
fi

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
        [ "$gone" = yes ] || fail "$label: $option was still running after two seconds of $key"
        return 0
    }
    interrupt "Look it over" w "walking through Look it over" CFLookItOver
    sleep 2
    st="$(ev 'return CFField.state()')"
    [ "$(f 5 <<<"$st")" = false ] || fail "the clue was recognised even though Look it over was interrupted by walking"
    note "after walking through Look it over: recognised=$(f 5 <<<"$st"), last look ran (ok, ms)=$(ev "return CFAct.ran('look')" | tr '\t' ' ')"
    interrupt "Look it over" mouse3 "aiming through Look it over" CFLookItOver
    sleep 2
    st="$(ev 'return CFField.state()')"
    [ "$(f 5 <<<"$st")" = false ] || fail "the clue was recognised even though Look it over was interrupted by aiming"
    note "after aiming through Look it over: recognised=$(f 5 <<<"$st")"
    # Now let it finish, so Inspect can be interrupted in its turn.
    ev "return CFAct.choose('Look it over')" >/dev/null
    wait_true 25 'CFAct.recognised()' >/dev/null || fail "Look it over never completed when left alone"
    note "left alone, Look it over recognised the clue: item now $(ev 'return CFAct.item_()' | tr '\t' ' ')"
    interrupt "Inspect Investigation Evidence" w "walking through Inspect" CFInspectEvidence
    sleep 2
    st="$(ev 'return CFField.state()')"
    [ "$(f 6 <<<"$st")" = false ] || fail "the clue was noted even though Inspect was interrupted by walking"
    n="$(ev "return CFField.noted([[$docA]])")"
    [ "$(f 1 <<<"$n")" = false ] || fail "an interrupted Inspect still wrote $docA into the record"
    note "after walking through Inspect: noted=$(f 6 <<<"$st"), in the record=$(f 1 <<<"$n")"
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
darkclue=""
for k in 1 2 3 4 5 6; do
    p="$(ev "return CFField.pick('box', $k)")"
    [ "$(f 1 <<<"$p")" = true ] || break
    ev "return CFField.teleport($(f 3 <<<"$p"))" >/dev/null
    wait_true 20 'CFField.loaded()' >/dev/null || continue
    r="$(ev 'return CFField.inRoom()')"
    [ "$(f 1 <<<"$r")" = true ] || { say "clue $k is $(f 2 <<<"$r"); looking for one indoors"; continue; }
    darkclue="$(f 2 <<<"$p")"; room="$(f 2 <<<"$r")"; break
done
if [ -z "$darkclue" ]; then
    note "no unrecognised clue indoors was left, so the darkness stage was not exercised"
else
    note "darkness clue: $darkclue in room \"$room\""
    ev 'return CFField.night(1.0)' >/dev/null
    sleep 8
    dark="$(ev 'return CFField.light()')"
    note "at 01:00 in \"$room\": light penalty $(f 2 <<<"$dark"), the game calls it too dark=$(f 3 <<<"$dark"), the mod's sight test $(f 4 <<<"$dark")/$(f 5 <<<"$dark"), darkMulti $(f 6 <<<"$dark"), cutoff $(f 7 <<<"$dark")"
    if [ "$(f 3 <<<"$dark")" != true ]; then
        note "the room did not go dark enough for the game's own cutoff, so darkness was not really tested"
    else
        ev 'return CFField.searchOn()' >/dev/null
        spotted=no; start=$(date +%s)
        for _ in $(seq 120); do
            ev 'return CFField.searchOn()' >/dev/null
            [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
            sleep 0.5
        done
        darksecs=$(( $(date +%s) - start ))
        if [ "$spotted" = yes ]; then
            fail "a clue in a room the game calls too dark was spotted anyway, after ${darksecs}s"
        else
            note "in the dark: not spotted in ${darksecs}s of searching beside it (icon $(ev 'return CFField.icon()' | cut -f2- | tr '\t' ' '))"
        fi
        # Now a lit torch in hand, which is the question worth an answer.
        t="$(ev 'return CFField.torch(true)')"
        note "torch: $(f 2 <<<"$t"), lit=$(f 3 <<<"$t"), in a hand=$(f 4 <<<"$t"), light strength $(f 5 <<<"$t")"
        sleep 6
        lit="$(ev 'return CFField.light()')"
        note "with the torch lit: light penalty $(f 2 <<<"$lit") (was $(f 2 <<<"$dark")), too dark=$(f 3 <<<"$lit"), sight test $(f 4 <<<"$lit")/$(f 5 <<<"$lit"), darkMulti $(f 6 <<<"$lit")"
        spotted=no; start=$(date +%s)
        for _ in $(seq 180); do
            ev 'return CFField.searchOn()' >/dev/null
            [ "$(ev 'return CFField.recognised()')" = true ] && { spotted=yes; break; }
            sleep 0.5
        done
        torchsecs=$(( $(date +%s) - start ))
        if [ "$spotted" = yes ]; then
            note "ANSWER: a lit torch makes the clue spottable - recognised ${torchsecs}s after the torch went on in a room that refused before"
        else
            note "ANSWER: a lit torch does NOT make the clue spottable - still nothing after ${torchsecs}s (penalty $(f 2 <<<"$lit"), too dark=$(f 3 <<<"$lit")); in the dark the way in is Look it over"
        fi
        ev 'return CFField.searchOff()' >/dev/null
    fi
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
    echo "worlds started for a clue in a car: $worlds"
    for x in "${findings[@]}"; do echo "FINDING: $x"; done
    echo "errors inside the mod (this session): $((errors + thrown))"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
