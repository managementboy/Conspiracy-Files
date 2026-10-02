#!/usr/bin/env bash
# Four No Help features seen with real game state (no log greps of code).
#
#   tools/autotest/checks/nohelp_features.sh
#
#   (a) CUE   the "you are close" cue: quiet 8+ tiles away; fires within 3 tiles of a placed clue in view
#             (log "cue said" with bubble=true, a shipped line spoken in the halo, screenshot kept); after a
#             FAILED roll it rolls again while the survivor stays near. Control: with the re-roll interval
#             broken the second roll never comes, so the assertion can fail.
#   (b) SEAT  a clue in a container of the car the survivor SITS in is recognised (how=search) when the real
#             loot panel opens it; not from outside, not for another car's container. Control: with
#             findSeated stubbed out the same click recognises nothing.
#   (c) KEY   debug Shift+L, a REAL key press on the game window, logs ev=clue_where naming the clue stood
#             beside; plain L logs nothing; with the debug gate shut Shift+L logs nothing.
#   (d) QUIET the "observer unsupported" line: with the gate shut (a played game's normal state) and a loot
#             panel rendering for 12 s there are 0 such lines; with IdentityObserver.verbose on there are
#             some (control: proves the counter can see the line at all).
# The harness puts one real clue item into a glove box for (b): the runtime placed the clue, only its
# container changes. Real display only (never --hidden). Counts and ids only; no clue text is printed.
# Report: docs/management/evidence/linux-autotest/<session>-nohelp-features.txt.
# Exit 0 every feature proven, 1 something failed, 2 could not run. Features that could not be exercised
# are listed as NOT-EXERCISED in the report and make the exit code 2 only if nothing else failed.
set -uo pipefail
export PZ_NOHELP_ONLY=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "nohelp-features: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=(); note() { notes+=("$*"); say "$*"; }
verdicts=(); verdict() { verdicts+=("$1: $2 - $3"); say "$1: $2 - $3"; }
cnt() { local n; n="$(run_log | grep -c -- "$1")"; echo "${n:-0}"; }
H="$REPO/tools/autotest/checks/nohelp_features.lua"

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
ev -f "$H" >/dev/null || abort "could not load the check's Lua"

# Clues placed in furniture: wait for at least three (cue, re-roll, control).
deadline=$(( $(date +%s) + 300 ))
while :; do
    c="$(ev 'return CFNH.clues()')"; n="$(cut -f2 <<<"$c")"
    is_number "$n" && [ "$n" -ge 3 ] && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "fewer than 3 clues placed after 300 s: $(tr '\t' ' ' <<<"$c")"
    sleep 3
done
note "clues (total, placed, waiting, in cars): $(tr '\t' ' ' <<<"$c")"
ev 'return CFNH.cueChance(0)' >/dev/null    # while choosing spots, standing near a clue must not use up a cue

# Find a clue we can stand beside, with an open side, lit and in view for the cue. Prints k, side x, side y, z.
SEEN_K=""
find_seeable() { # find_seeable FROM_K -> sets PICK (id, xyz, place), SX, SY, SZ, K_FOUND
    local k p side seen
    for k in $(seq "$1" 12); do
        p="$(ev "return CFNH.pick($k)")"; [ "$(cut -f1 <<<"$p")" = true ] || return 1
        ev "return CFNH.teleport($(cut -f3 <<<"$p"))" >/dev/null
        wait_true 25 'CFNH.loaded()' >/dev/null || continue
        for j in 1 2 3 4; do
            side="$(ev "return CFNH.side($j)")"; [ "$(cut -f1 <<<"$side")" = true ] || break
            SX="$(cut -f2 <<<"$side")"; SY="$(cut -f3 <<<"$side")"; SZ="$(cut -f3 <<<"$p" | cut -d, -f3)"
            ev "return CFNH.teleport($SX,$SY,$SZ)" >/dev/null; sleep 1; ev 'return CFNH.faceClue()' >/dev/null; sleep 1
            seen="$(ev 'return CFNH.seenFrom()')"
            if [ "$(cut -f1 <<<"$seen")" = true ]; then PICK="$p"; K_FOUND="$k"; return 0; fi
        done
    done
    return 1
}
go_far() { local f; f="$(ev 'return CFNH.farSquare()')"; [ "$(cut -f1 <<<"$f")" = true ] || return 1
    ev "return CFNH.teleport($(cut -f2 <<<"$f"),$(cut -f3 <<<"$f"),$SZ)" >/dev/null; }
go_near() { ev "return CFNH.teleport($SX,$SY,$SZ)" >/dev/null; sleep 1; ev 'return CFNH.faceClue()' >/dev/null; }
# A key held for a moment: the game polls its keys once per frame, so an instant press is missed.
press() { # press KEY...  (e.g. press shift l)
    local k
    for k in "$@"; do xdotool keydown "$k"; sleep 0.2; done
    sleep 0.2
    for ((i=$#; i>=1; i--)); do xdotool keyup "${!i}"; sleep 0.1; done
}
said() { ev 'return CFNH.cueState()' | cut -f1; }
suppressed() { ev 'return CFNH.cueState()' | cut -f2; }

# ------------------------------------------------------------------ (a) the cue
CUE=NOT-EXERCISED; cue_why=""; a_fail0=${#fails[@]}
if find_seeable 1; then
    DOC="$(cut -f2 <<<"$PICK")"
    note "cue clue: number $K_FOUND, stood $(ev 'return CFNH.distance()') tile(s) from it, seen from there"
    ev 'return CFNH.noCooldown()' >/dev/null
    ev 'return CFNH.cueOnly(true)' >/dev/null

    # A1. far away, chance 1: nothing
    ev 'return CFNH.cueReset()' >/dev/null; ev 'return CFNH.cueForgetPlaces()' >/dev/null; ev 'return CFNH.cueChance(1)' >/dev/null
    if go_far; then
        sleep 1; s0="$(said)"; sleep 6; s1="$(said)"
        dist="$(ev 'return CFNH.distance()')"
        [ "$s1" = "$s0" ] || fail "cue: spoke while $dist tiles from the clue"
        note "cue far away: $dist tiles, said $s0 -> $s1 (must not change)"
    else note "cue far away: no far square, negative case skipped"; fi

    # A2. near, chance 1: fires, once, with bubble and halo words
    log0="$(cnt 'cue said')"; s0="$(said)"
    go_near
    ok=no; for _ in $(seq 24); do [ "$(said)" -gt "$s0" ] 2>/dev/null && { ok=yes; break; }; sleep 0.5; done
    sleep 1
    "$PZ" shot "$RUNS/$id-nohelp-cue.png" >/dev/null 2>&1 || true
    dist="$(ev 'return CFNH.distance()')"
    if [ "$ok" = yes ]; then
        st="$(ev 'return CFNH.cueState()')"
        [ "$(cut -f5 <<<"$st")" = "$DOC" ] || fail "cue: spoken for another clue than the one stood beside"
        line="$(run_log | grep 'cue said' | tail -1)"
        grep -q "bubble=true" <<<"$line" || fail "cue: log says the bubble was not shown: $(sed 's/ \/ .*doc=/ ... doc=/;s/said ".*" at/said ... at/' <<<"${line##*msg=}")"
        [ "$(cut -f6 <<<"$st")" = true ] || fail "cue: no spoken halo line recorded"
        s="$(ev 'return CFNH.spokenIsShipped()')"; [ "$(cut -f1 <<<"$s")" = true ] || fail "cue: spoken words are not a shipped line ($(cut -f2 <<<"$s"))"
        [ "$(( $(cnt 'cue said') - log0 ))" = 1 ] || fail "cue: expected one 'cue said' line, got $(( $(cnt 'cue said') - log0 ))"
        note "cue near: fired $dist tile(s) from the clue; log line bubble=true; spoken line shipped; screenshot $id-nohelp-cue.png"
        CUE_A=ok
    else
        fail "cue: nothing said within 12 s at $dist tile(s) from a clue in view (chance fixed at 1)"
    fi

    # A3. re-roll after a failed roll: new approach, chance 0 -> suppressed, then chance 1 while staying near
    go_far || true; sleep 1
    ev 'return CFNH.cueReset()' >/dev/null; ev 'return CFNH.cueForgetPlaces()' >/dev/null; ev 'return CFNH.cueChance(0)' >/dev/null
    s0="$(said)"; sup0="$(suppressed)"
    go_near; sleep 4
    sup1="$(suppressed)"; s1="$(said)"
    [ "$s1" = "$s0" ] || fail "re-roll: spoke with the chance at 0"
    [ "$sup1" -gt "$sup0" ] 2>/dev/null || fail "re-roll: the failed roll was never made (suppressed $sup0 -> $sup1)"
    ev 'return CFNH.cueChance(1)' >/dev/null     # the survivor has not moved
    ok=no; for _ in $(seq 30); do [ "$(said)" -gt "$s0" ] 2>/dev/null && { ok=yes; break; }; sleep 0.5; done
    if [ "$ok" = yes ]; then note "re-roll: failed roll (suppressed $sup0 -> $sup1), then the cue came with the survivor standing still";
    else fail "re-roll: no cue within 15 s after a failed roll, standing 3 tiles or nearer"; fi
    sleep 1

    # A4. control: re-roll interval broken (a failed roll is never tried again) -> the assertion must see no cue
    go_far || true; sleep 1
    ev 'return CFNH.rerollMs(1000000000)' >/dev/null
    ev 'return CFNH.cueReset()' >/dev/null; ev 'return CFNH.cueForgetPlaces()' >/dev/null; ev 'return CFNH.cueChance(0)' >/dev/null
    s0="$(said)"; go_near; sleep 4; ev 'return CFNH.cueChance(1)' >/dev/null
    ok=no; for _ in $(seq 24); do [ "$(said)" -gt "$s0" ] 2>/dev/null && { ok=yes; break; }; sleep 0.5; done
    ev 'return CFNH.rerollMs()' >/dev/null
    if [ "$ok" = no ]; then note "re-roll control: with the interval broken no cue came in 12 s (the re-roll assertion can fail)";
    else fail "re-roll control: a cue came although the re-roll interval was broken, so the re-roll test cannot tell"; fi

    ev 'return CFNH.cueOnly(false)' >/dev/null
    [ -n "${CUE_A:-}" ] && [ ${#fails[@]} -eq "$a_fail0" ] && CUE=PROVEN-IN-GAME || CUE=FAILED
else
    cue_why="no clue with an open side, lit and in view was found among the placed ones"
    note "cue: $cue_why"
fi
case "$CUE" in
    PROVEN-IN-GAME) verdict "(a) close cue" PROVEN-IN-GAME "silent far away, fires within 3 tiles with bubble and halo words, re-rolls after a failed roll; control with the re-roll broken sees none" ;;
    FAILED) verdict "(a) close cue" FAILED "see FAIL lines" ;;
    *) verdict "(a) close cue" NOT-EXERCISED "$cue_why" ;;
esac

# ------------------------------------------------------------------ (c) Shift+L (stood beside the cue clue)
KEYV=NOT-EXERCISED; key_why=""; c_fail0=${#fails[@]}
if [ -n "${PICK:-}" ]; then
    go_near; sleep 1
    xdo_ok=1
    w="$(xdotool search --pid "$(pgrep -f '[P]rojectZomboid64' | head -1)" 2>/dev/null | tail -1)"
    [ -n "$w" ] || { xdo_ok=0; key_why="no game window for the key press"; }
    if [ "$xdo_ok" = 1 ]; then
        xdotool windowactivate --sync "$w" 2>/dev/null || true; sleep 1
        k0="$(cnt 'ev=clue_where')"
        press l; sleep 2
        k1="$(cnt 'ev=clue_where')"
        press shift l; sleep 2
        k2="$(cnt 'ev=clue_where')"
        line="$(run_log | grep 'ev=clue_where' | tail -1)"
        if [ "$k2" -gt "$k1" ] 2>/dev/null; then
            [ "$k1" = "$k0" ] || fail "Shift+L: plain L logged a clue_where line"
            grep -q "doc=$DOC" <<<"$line" || fail "Shift+L: the line does not name the clue stood beside"
            d="$(sed -n 's/.* dist=\([0-9.]*\).*/\1/p' <<<"$line")"
            awk -v d="${d:-99}" 'BEGIN{exit !(d<=2.5)}' || fail "Shift+L: distance in the line is ${d:-none}, expected 2.5 or less"
            note "Shift+L: real key press logged ev=clue_where (dist ${d:-?}, names the clue stood beside); plain L logged nothing"
            # gate shut: not a debug game -> no line
            ev 'return CFNH.gateShut(8000)' >/dev/null; sleep 1
            press shift l; sleep 2
            k3="$(cnt 'ev=clue_where')"
            wait_true 15 'CFNH.gateOpen()' >/dev/null
            [ "$k3" = "$k2" ] || fail "Shift+L: logged a line while the debug gate was shut"
            note "Shift+L with the debug gate shut: lines $k2 -> $k3 (must not change)"
            [ ${#fails[@]} -eq "$c_fail0" ] && KEYV=PROVEN-IN-GAME || KEYV=FAILED
        else
            key_why="the key press did not reach the game (clue_where lines $k0/$k1/$k2); window $w"
            fail "Shift+L: $key_why"
            KEYV=FAILED
        fi
    fi
else
    key_why="no clue was stood beside (see cue)"
fi
case "$KEYV" in
    PROVEN-IN-GAME) verdict "(c) Shift+L" PROVEN-IN-GAME "a real key press logs ev=clue_where for the nearest clue; plain L and a closed debug gate log nothing" ;;
    FAILED) verdict "(c) Shift+L" FAILED "see FAIL lines" ;;
    *) verdict "(c) Shift+L" NOT-EXERCISED "$key_why" ;;
esac

# ------------------------------------------------------------------ (d) quiet 'observer unsupported'
ev 'return CFNH.openSomeLoot()' >/dev/null || note "observer: no container icon in the loot panel"
base="$(cnt 'observer unsupported')"
ev 'return CFNH.verbose(false)' >/dev/null
ev 'return CFNH.gateShut(14000)' >/dev/null; sleep 12
quiet="$(( $(cnt 'observer unsupported') - base ))"
wait_true 15 'CFNH.gateOpen()' >/dev/null
reached="$(cnt 'afterRender reached')"
ev 'return CFNH.verbose(true)' >/dev/null
ev 'return CFNH.gateShut(8000)' >/dev/null; sleep 6
loud="$(( $(cnt 'observer unsupported') - base - quiet ))"
wait_true 15 'CFNH.gateOpen()' >/dev/null
ev 'return CFNH.verbose(false)' >/dev/null
note "observer: afterRender reached lines $reached; unsupported lines with the gate shut 12 s, verbose off: $quiet; verbose on 6 s: $loud"
if [ "$loud" -gt 0 ] 2>/dev/null; then
    if [ "$quiet" = 0 ]; then verdict "(d) quiet observer line" PROVEN-IN-GAME "0 lines in 12 s with the gate shut and a loot pane rendering; $loud lines in 6 s with verbose on (control)"
    else fail "observer: $quiet 'observer unsupported' lines with verbose off"; verdict "(d) quiet observer line" FAILED "$quiet lines while quiet"; fi
else
    verdict "(d) quiet observer line" NOT-EXERCISED "the control (verbose on) produced no line either, so 0 means nothing; no pane reached the observer"
fi
sleep 1

# ------------------------------------------------------------------ (b) clue in the seated car's container
SEAT=NOT-EXERCISED; seat_why=""; seat_how=""
seat_fail0=${#fails[@]}
ev 'return CFNH.cueChance(0)' >/dev/null
# Set up car 1 with a clue in its glove box: the world's own clue in a car when it placed one, else a real clue
# item moved into a spawned car by the harness (only its container changes).
setup_car() {
    local r
    r="$(ev 'return CFNH.naturalGo()')"
    if [ "$(cut -f1 <<<"$r")" = true ]; then
        sleep 8
        r="$(ev 'return CFNH.naturalFind()')"
        [ "$(cut -f1 <<<"$r")" = true ] && { seat_how="the world's own clue in a car's container"; return 0; }
        note "seat: the world's car clue could not be used ($(cut -f2 <<<"$r")); using a spawned car"
    fi
    find_seeable 1 || { seat_why="no clue could be reached"; return 1; }
    ev 'return CFNH.spawn(1)' >/dev/null || { seat_why="no car could be spawned"; return 1; }
    r="$(ev 'return CFNH.moveClueToCar(1)')"
    [ "$(cut -f1 <<<"$r")" = true ] || { seat_why="could not move a clue into the glove box: $(cut -f2 <<<"$r")"; return 1; }
    seat_how="a real clue item moved by the harness into a spawned car (the world placed no clue in a car)"
    return 0
}
if setup_car; then
    # a second clue into a second car, for the "other car" case
    if find_seeable $(( ${K_FOUND:-0} + 1 )) && ev 'return CFNH.spawn(2)' >/dev/null \
       && [ "$(ev 'return CFNH.moveClueToCar(2)' | cut -f1)" = true ]; then have2=yes; else have2=no; note "seat: no second clue/car, the other-car case is skipped"; fi
    ev 'return CFNH.toDriverDoor(1)' >/dev/null; sleep 3
    n_out="$(ev 'return CFNH.findSeatedDirect(1)' | cut -f1)"
    [ "$n_out" = 0 ] || fail "seat: findSeated recognised $n_out clue(s) while the survivor was NOT in the car"
    [ "$(ev 'return CFNH.recognisedId(1)' | cut -f1)" = false ] || fail "seat: clue recognised before the survivor sat down"
    ev 'return CFNH.enter(1)' >/dev/null
    wait_true 25 'select(1, CFNH.seatedIn()) == true' >/dev/null || { ev 'return CFNH.toDriverDoor(1)' >/dev/null; ev 'return CFNH.enter(1)' >/dev/null; }
    if ! wait_true 40 'select(1, CFNH.seatedIn()) == true'; then
        ev 'return CFNH.enterForced(1)' >/dev/null; sleep 2
        wait_true 5 'select(1, CFNH.seatedIn()) == true' >/dev/null && { seat_how="$seat_how; seated by a direct vehicle:enter call (the walk-in action did not finish)"; note "seat: walk-in action did not seat the survivor in 65 s; seated by a direct vehicle:enter call"; }
    fi
    if wait_true 5 'select(1, CFNH.seatedIn()) == true'; then
        sleep 2
        if [ "$have2" = yes ]; then
            n_other="$(ev 'return CFNH.findSeatedDirect(2)' | cut -f1)"
            [ "$n_other" = 0 ] || fail "seat: findSeated recognised $n_other clue(s) in ANOTHER car's container"
            [ "$(ev 'return CFNH.recognisedId(2)' | cut -f1)" = false ] || fail "seat: a clue in another car was recognised"
            note "seat: other car's container while seated: $n_other recognised (must be 0)"
        fi
        # control: watch broken -> the real loot-panel click recognises nothing
        ev 'local W=NHShared.SearchedContainerWatch; CFNH.realFind=W.findSeated; W.findSeated=function() return 0 end; return true' >/dev/null
        o="$(ev 'return CFNH.openBox(1)')"
        if [ "$(cut -f1 <<<"$o")" = true ]; then
            sleep 2
            [ "$(ev 'return CFNH.recognisedId(1)' | cut -f1)" = false ] || fail "seat control: clue recognised although findSeated was stubbed out"
            ev 'NHShared.SearchedContainerWatch.findSeated=CFNH.realFind; return true' >/dev/null
            rec0="$(cnt 'ev=recognised')"
            ev 'return CFNH.openBox(1)' >/dev/null
            if wait_true 15 'CFNH.recognisedId(1)'; then
                line="$(run_log | grep 'ev=recognised' | tail -1)"
                grep -q "how=search" <<<"$line" || fail "seat: recognised, but not as how=search"
                [ "$(( $(cnt 'ev=recognised') - rec0 ))" -ge 1 ] || fail "seat: no ev=recognised line"
                note "seat: $seat_how; opened through the real loot panel while seated: recognised (how=search); from outside 0; control with findSeated stubbed: nothing"
                [ ${#fails[@]} -eq "$seat_fail0" ] && SEAT=PROVEN-IN-GAME
            else
                fail "seat: the clue in the seated car's glove box was not recognised after opening it in the loot panel"
            fi
        else
            seat_why="the loot panel did not offer the glove box while seated ($(cut -f2 <<<"$o"))"
            fail "seat: $seat_why"
        fi
    else
        seat_why="the survivor could not be seated in the car (ISVehicleMenu.onEnter)"
        note "seat: $seat_why"
    fi
    ev 'return CFNH.exit()' >/dev/null
else note "seat: $seat_why"; fi
case "$SEAT" in
    PROVEN-IN-GAME) verdict "(b) seated-car clue" PROVEN-IN-GAME "recognised via the real loot panel while seated; $seat_how" ;;
    *) if [ ${#fails[@]} -gt "$seat_fail0" ]; then verdict "(b) seated-car clue" FAILED "see FAIL lines"; else verdict "(b) seated-car clue" NOT-EXERCISED "$seat_why"; fi ;;
esac

# ------------------------------------------------------------------ the mod's errors in this run's log
errs="$(mod_errors)"; nerr="$(printf '%s' "$errs" | grep -c . || true)"
[ -z "$errs" ] || fail "errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
allerr="$(run_log | grep -c '^ERROR' || true)"
note "game ERROR lines in this run: ${allerr:-0}; of those inside the mods: ${nerr:-0}; mod lvl=e lines: $(mod_error_count)"

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
for v in "${verdicts[@]}"; do case "$v" in *NOT-EXERCISED*) [ "$result" = PASS ] && result=INCOMPLETE ;; esac; done
out="$EVIDENCE/$id-nohelp-features.txt"
{
    echo "Linux No Help features check $id: $result"
    source_line
    for v in "${verdicts[@]}"; do echo "$v"; done
    for n in "${notes[@]}"; do echo "note: $n"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
case "$result" in PASS) exit 0 ;; FAIL) exit 1 ;; *) exit 2 ;; esac
