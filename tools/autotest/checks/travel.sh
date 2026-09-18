#!/usr/bin/env bash
# Travel check: one journey across the whole map, Irvington to Muldraugh, with
# the cases asked at every leg whether they still work.
#
#   tools/autotest/checks/travel.sh
#
# Owner, 2026-09-18: "do a test run from Irvington to muldraugh. Either by foot
# or driving. See if the cases work by traveling."
#
# Every other check plays in one neighbourhood. This one answers the question a
# settled check cannot: the reach a case is filtered by is anchored on where the
# survivor has BEEN (P4-R67, Reach.radius - 250 tiles under 96 hours survived),
# a refused case waits for them to move (P4-R125), a case may arrive in
# instalments with a typed refusal and a promised hour (P4-R133), and an address
# is written with its town only when read from another one (P4-R129 / AD-10).
# Nine thousand tiles is where all four meet.
#
# The journey: a fresh world with the survivor in Irvington (~2100,14293), then
# legs of at most CF_TRAVEL_LEG (400) tiles through Rosewood (~8230,11640) to
# Muldraugh's numbering corridor (~10650,9750) - about 9,700 tiles and
# twenty-five legs. Legs are teleports, as campaign.sh's moveOn is; at every
# town stop the survivor WALKS with the game's own walk action, because
# movement is what releases a refused case and what the wordless cue hangs on,
# and a journey made only of teleports would exercise neither.
#
# One line per leg records: the position and the town, cases (total / live /
# finished), every live case's clue statuses, whether any site or placed clue
# is outside the reach of the trail, the refusal code / count / rung / promised
# hour from automaticStatus(), the save size, and the mod's error count so far.
#
# And it proves the cases WORK rather than merely exist. A clue is found the
# player's way twice - Search Mode with the Clues focus, "Look it over" if the
# spotting timer runs out, then Inspect through the real menu - once in
# Irvington before setting off and once at the town reached mid-journey, where a
# NEW case is asked for and its clues checked to be placed within the reach of
# where the survivor has been. Each record's address is then read where it was
# written (which must NOT name the town) and again from Muldraugh (which must).
#
# FAILS: an error inside the mod; a case whose clue is placed outside the reach
# of the trail; a promise passing with no case (no-containers, no-reach,
# cooldown) for four legs running or at a town stop; a record whose address
# names the wrong town or never reaches the record at all; a save over 500 kB.
#
# What the harness turns down, and says so in its evidence: the gap between
# cases (CFCamp.gap(false)), because a journey of forty real minutes is about
# fifteen in-game hours and the shipped gap is twenty-four - without it no
# second case could arrive however far the survivor walked. Nothing else is
# changed; every branch that then runs is the shipped one.
#
# Real display, no --hidden: about forty minutes. Exit 0 pass, 1 fail, 2 could
# not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "travel: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }
CHECKS="$REPO/tools/autotest/checks"
LEG="${CF_TRAVEL_LEG:-400}"
SPOT_LIMIT="${CF_TRAVEL_SPOT:-150}"
# name:x,y - the start, the town on the way, and the destination. Every
# coordinate is the middle of a numbered building in the shipped address book,
# so the survivor arrives among houses rather than in a field - and, at the
# start, INSIDE one: the very first case of a save is refused with "waiting
# until player is inside a building" (GeneratedRuntime.start's firstHouse),
# and a survivor who spawns on the street gets no case at all until they step
# indoors. That refusal carries no code, so automaticStatus() reads why=nil.
WAYPOINTS=("Irvington:2228,14200" "Rosewood:8228,11601" "Muldraugh:10617,9764")

legs=(); leg_no=0; overdue_run=0; reach_failed=""; budget_failed=""; promise_failed=""
cases_total() { ev 'return CFCamp.cases()' | field 1; }
wait_case_count() { # wait_case_count COUNT SECONDS
    local end=$(( $(date +%s) + $2 ))
    while [ "$(date +%s)" -lt "$end" ]; do
        [ "$(cases_total)" -ge "$1" ] 2>/dev/null && return 0
        sleep 4
    done
    return 1
}
promise_words() {
    local p; p="$(ev 'return CFCamp.promise()')"
    printf 'why=%s n=%s due=%s rung=%s/%s now=%s overdue=%s preparing=%s active=%s' \
        "$(field 1 "$p")" "$(field 2 "$p")" "$(field 3 "$p")" "$(field 4 "$p")" "$(field 5 "$p")" \
        "$(field 6 "$p")" "$(field 7 "$p")" "$(field 9 "$p")" "$(field 10 "$p")"
}
# Only the codes that mean the world could not supply a case are worth failing
# on; for cap, active-limit, gap and disabled the promised hour is a formality.
promise_bites() { case "$1" in no-containers|no-reach|cooldown) return 0 ;; *) return 1 ;; esac; }

# ONE LEG, ONE LINE (the owner's list, in the order asked for).
record_leg() { # record_leg LABEL
    leg_no=$(( leg_no + 1 ))
    ev 'return CFTrav.visit()' >/dev/null
    local l e; l="$(ev 'return CFTrav.leg()')"; e="$(mod_error_count)"
    legs+=("$(printf 'leg %2d %-24s %s,%s in %s | %sh survived, clock %s | cases %s (%s live, %s finished) | clues placed %s deferred %s dropped %s [%s] | outside reach: %s/%s sites, %s/%s clues (worst %s tiles) | refusal %s n=%s rung %s due %s overdue=%s | save %s B | %s squares, %s containers | trail %s anchors %s tiles | mod errors %s' \
        "$leg_no" "$1" "$(field 1 "$l")" "$(field 2 "$l")" \
        "$(field 29 "$l")$([ "$(field 29 "$l")" = "$(field 3 "$l")" ] || echo " (the mod still says $(field 3 "$l"))")" \
        "$(field 4 "$l")" "$(field 5 "$l")" \
        "$(field 6 "$l")" "$(field 7 "$l")" "$(field 8 "$l")" \
        "$(field 9 "$l")" "$(field 10 "$l")" "$(field 11 "$l")" "$(field 12 "$l")" \
        "$(field 14 "$l")" "$(field 13 "$l")" "$(field 16 "$l")" "$(field 15 "$l")" "$(field 17 "$l")" \
        "$(field 19 "$l")" "$(field 20 "$l")" "$(field 21 "$l")" "$(field 22 "$l")" "$(field 23 "$l")" \
        "$(field 24 "$l")" "$(field 25 "$l")" "$(field 26 "$l")" "$(field 27 "$l")" "$(field 28 "$l")" "$e")")
    say "${legs[-1]}"
    # THE REACH. A site or a placed clue outside the reach of every anchor the
    # journey recorded is the one thing P4-R67 forbids outright.
    if [ "$(field 14 "$l")" != 0 ] || [ "$(field 16 "$l")" != 0 ]; then
        if [ -z "$reach_failed" ]; then
            reach_failed=1
            fail "leg $leg_no ($1): $(field 14 "$l") of $(field 13 "$l") sites and $(field 16 "$l") of $(field 15 "$l") placed clues are outside the reach of anywhere the survivor has been - $(field 18 "$l")"
        fi
    fi
    if [ -z "$budget_failed" ] && ! [ "$(field 24 "$l")" -le 500000 ] 2>/dev/null; then
        budget_failed=1
        fail "leg $leg_no ($1): the save measured $(field 24 "$l") bytes, over the 500 kB budget"
    fi
    # THE PROMISE (P4-R133). One overdue reading mid-woods is a wait, not a
    # broken promise; four legs of it with no case is the failure the design
    # asked the checks to stop forgiving.
    if [ "$(field 23 "$l")" = true ] && promise_bites "$(field 19 "$l")"; then
        overdue_run=$(( overdue_run + 1 ))
        [ "$overdue_run" = 1 ] && note "leg $leg_no: the generator's promise has passed ($(promise_words))"
        if [ "$overdue_run" -ge 4 ] && [ -z "$promise_failed" ]; then
            promise_failed=1
            fail "the generator promised a case by $(field 22 "$l") with why=$(field 19 "$l") and none came over four legs ($(promise_words); assignments $(ev 'return CFCamp.assignments()'))"
        fi
    else
        overdue_run=0
    fi
}

walk_a_bit() { # walk_a_bit LABEL: the game's own walk action, a few tiles
    local w; w="$(ev 'return CFTrav.walkTo(6)')"
    if [ "$(field 1 "$w")" != true ]; then note "$1: nowhere to walk ($(field 2 "$w"))"; return 1; fi
    wait_true 30 'CFTrav.walked()' >/dev/null || true
    note "$1: walked from $(field 3 "$w") towards $(field 2 "$w"), arrived at $(ev 'return CFTrav.walked()' | field 2)"
}

# Ask for a case where the survivor is standing, moving about the town between
# tries the way a player does (P4-R125).
ask_case() { # ask_case LABEL TRIES
    local label="$1" tries="${2:-3}" want i m
    want=$(( $(cases_total) + 1 ))
    for i in $(seq "$tries"); do
        wait_case_count "$want" 120 && { note "$label: case $want arrived after $(( i - 1 )) local move(s)"; return 0; }
        note "$label: no case two minutes after arriving ($(promise_words))"
        m="$(ev 'return CFCamp.moveOn(80)')"
        if [ "$(field 1 "$m")" != true ]; then note "$label: nowhere fresh nearby to move to ($(field 2 "$m"))"; break; fi
        wait_true 120 'CFCamp.settled()' >/dev/null || true
        walk_a_bit "$label, local move $i"
        record_leg "$label local move $i"
        note "$label: moved $(field 4 "$m") tiles to $(field 2 "$m") ($(field 3 "$m")), now in $(ev 'return CFTrav.pos()' | field 6)"
    done
    wait_case_count "$want" 120 && return 0
    return 1
}

# FIND A CLUE THE PLAYER'S WAY. Search Mode with the Clues focus (P4-R132),
# standing on an open side of the container, then taken and inspected through
# the real right-click menu (lib.sh's inspect_doc, which looks it over first
# when the clue is not yet recognised).
play_clue() { # play_clue LABEL CASEID: a clue of THAT case, near where we stand
    local label="$1" cid="$2" p k n stood lit icon out seen=no
    CLUE_ID=""
    # A clue whose record can carry an address, first: AddressMap refuses a
    # whole case's addresses when one site is unnumbered, and describe only
    # writes a street where the document's own words name the place - so
    # without this preference the address stages can test nothing.
    # And never further than a town away: fetching a clue left behind doubled
    # the journey's distance in 20260918T225250.
    BOOKED=yes
    p="$(ev "return CFTrav.pickClue([[$cid]], 1, true, 1200)")"
    if [ "$(field 1 "$p")" != true ]; then
        BOOKED=no
        p="$(ev "return CFTrav.pickClue([[$cid]], 1, nil, 1200)")"
        [ "$(field 1 "$p")" = true ] || { note "$label: no placed clue of this case in a fixed container nearby ($(field 2 "$p"))"; return 1; }
        note "$label: this case can carry no address of its own (an unnumbered site, or no document whose words name a place), so the clue found here cannot test the town rule"
    fi
    # A ROOM TOO DARK IS NOT A FAULT, it is the game's own spotting rule
    # (P4-R132 / clue_field.sh), so a candidate the game will not let anyone
    # spot is stepped over before the search is timed.
    for n in 1 2 3 4; do
        p="$(ev "return CFTrav.pickClue([[$cid]], $n, $([ "$BOOKED" = yes ] && echo true || echo nil), 1200)")"
        [ "$(field 1 "$p")" = true ] || break
        CLUE_ID="$(field 2 "$p")"
        ev 'return CFClue.running()' >/dev/null
        ev 'return CFClue.searchOff()' >/dev/null
        ev 'return CFClue.approach()' >/dev/null
        wait_true 30 'CFClue.loaded()' >/dev/null || { note "$label: clue $n's square never loaded"; continue; }
        stood=no
        for k in 1 2 3 4; do
            [ "$(ev "return CFClue.stand($k)" | field 1)" = true ] || break
            sleep 2
            [ "$(ev 'return CFClue.settled()' | field 1)" = true ] && { stood=yes; break; }
        done
        lit="$(ev 'return CFClue.lit()')"
        note "$label: clue $CLUE_ID at $(field 3 "$p") of case $(field 4 "$p") ($(field 5 "$p") to choose from); light $(field 2 "$lit") against the game's 0.50 cutoff, lit enough=$(field 1 "$lit"), standing on an open side=$stood"
        [ "$(field 1 "$lit")" = true ] && break
        note "$label: too dark there for the game to let anything be spotted; trying the next clue"
    done
    [ -n "$CLUE_ID" ] || { note "$label: no clue could be approached"; return 1; }
    ev "return CFClue.setFocus('Clues')" >/dev/null
    local t0; t0="$(date +%s)"
    ev 'return CFClue.searchOn()' >/dev/null
    local deadline=$(( t0 + SPOT_LIMIT ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        [ "$(ev 'return CFTrav.clueRecognised()' | field 1)" = true ] && { seen=yes; break; }
        ev "return CFClue.stand(${k:-1})" >/dev/null
        ev 'return CFClue.searchOn()' >/dev/null
        icon="$(ev 'return CFClue.icon()')"
        sleep 1
    done
    if [ "$seen" = yes ]; then
        note "$label: spotted by the game's own Search Mode with the Clues focus after $(( $(date +%s) - t0 )) s, and recognised"
    else
        note "$label: not spotted in ${SPOT_LIMIT} s with the Clues focus (icon $(tr '\t' ' ' <<<"${icon:-none}")); \"Look it over\" will recognise it instead, which is the fallback a player has for something picked up unsearched"
    fi
    ev 'return CFClue.searchOff()' >/dev/null
    # Take it and inspect it through the real menu. inspect_doc looks a clue
    # over first when it is not yet recognised.
    if out="$(inspect_doc 1)"; then
        note "$label: taken and inspected the player's way; it reads \"$out\""
        SPOTTED="$seen"
        return 0
    fi
    fail "$label: the clue could not be inspected: $out"
    return 1
}

# The record's address for that clue, read from wherever the survivor is now
# (P4-R129 / AD-10): in its own town it must be written WITHOUT the town, and
# from anywhere else WITH it - and never with a different town's name.
check_address() { # check_address LABEL CLUEID
    local label="$1" id="$2" a
    # The mod's own idea of which town the survivor is in is what the record
    # qualifies against, and it is deliberately sticky: wait for it to agree
    # with the book before asking, or the assertion measures the lag.
    wait_true 60 'CFTrav.townAgrees()' >/dev/null \
        || note "$label: the mod still puts the survivor in $(ev 'return CFTrav.townAgrees()' | field 2) while the address book says $(ev 'return CFTrav.townAgrees()' | field 3)"
    a="$(ev "return CFTrav.address([[$id]])")"
    if [ "$(field 1 "$a")" != true ]; then
        fail "$label: the clue is noted but has no record row at all ($(field 2 "$a"))"
        return 1
    fi
    note "$label: standing in $(field 2 "$a"), the live half of the record writes $(field 3 "$a") of the case's addresses, $(field 4 "$a") of them as P4-R129 asks, $(field 5 "$a") naming the wrong town, $(field 6 "$a") missing the town they should carry | $(field 7 "$a") | the clue itself was found at $(field 10 "$a"), and the frozen line reads \"$(field 11 "$a")\" | AddressMap.describe $(field 9 "$a") | ...$(field 8 "$a")..."
    if [ "$(field 3 "$a")" = 0 ]; then
        if [ "$BOOKED" = yes ]; then
            fail "$label: the clue's own words name one of the case's places and the book numbers every site, yet the record carries no address at all (AddressMap.describe $(field 9 "$a"); $(field 7 "$a"))"
        else
            note "$label: the record carries no address to judge, and this clue was not one that could - $(field 7 "$a"); AddressMap.describe $(field 9 "$a"). The town rule was not exercised here"
            return 1
        fi
    fi
    [ "$(field 5 "$a")" = 0 ] \
        || fail "$label: $(field 5 "$a") address(es) in the record name the wrong town, read from $(field 2 "$a") ($(field 7 "$a"))"
    [ "$(field 6 "$a")" = 0 ] \
        || fail "$label: $(field 6 "$a") address(es) about another town are written without naming it, read from $(field 2 "$a") ($(field 7 "$a")) - P4-R129 / AD-10"
}

mid_case=""; mid_town="the town on the way"; CLUE_ID=""; SPOTTED=no; BOOKED=unknown
IRV_CLUE=""; MID_CLUE=""; IRV_BOOKED=unknown; MID_BOOKED=unknown
# ---------------------------------------------------------------------------
claim_game || exit 2
IFS=: read -r start_name start_at <<<"${WAYPOINTS[0]}"
start_cold --at "$start_at,0" || abort "the game did not reach a playable world"
id="$(session)"
for f in core_loop reload campaign clue_search pacing travel; do
    ev -f "$CHECKS/$f.lua" >/dev/null || abort "could not load $f.lua"
done
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "the generated runtime never started"
ev 'return CFLoop.givePen()' >/dev/null
ev 'return CFClue.running()' >/dev/null
note "the survivor starts at $(ev 'return CFTrav.pos()' | cut -f1-3 | tr '\t' ',') in $(ev 'return CFTrav.pos()' | field 6), asked for as $start_at"
save_start="$(ev 'return CFReload.bytes()' | field 1)"
# The gap between cases, turned off for the same reason campaign.sh and
# instalments.sh turn it off: forty real minutes is about fifteen in-game
# hours, and the shipped gap is twenty-four. Said out loud, as TESTING.md asks.
ev 'return CFCamp.gap(false)' >/dev/null
note "the 24-hour gap between cases turned off for this run (CFCamp.gap(false)); everything else is the shipped behaviour"

# --- (1) the first case, in Irvington ---------------------------------------
# The first case of a save needs the survivor INSIDE a building, and the
# refusal is untyped, so a street spawn is silent. The waypoint is a house;
# this steps into another one if the game put the survivor somewhere else.
if ! wait_case_count 1 180; then
    note "no first case in three minutes at $start_at (why=$(ev 'return CFCamp.promise()' | field 1)); stepping into a building, which is what the first case waits for"
    ev 'return CFCamp.moveOn(0)' >/dev/null
    wait_true 120 'CFCamp.settled()' >/dev/null || true
    wait_case_count 1 240 || abort "no first case in Irvington, indoors or out ($(promise_words))"
fi
case1="$(ev 'return CFTrav.newestLive()')"
case1_id="$(field 1 "$case1")"
note "the first case $case1_id was created where the survivor started: its sites are $(field 2 "$case1")"
record_leg "$start_name, the start"
if grep -q "Irvington" <<<"$(field 2 "$case1")"; then
    note "ANSWER (1): the first case is in Irvington, so a case can be made 12,000 tiles from Muldraugh"
else
    fail "the first case's sites are not in Irvington: $(field 2 "$case1")"
fi
# ONE CLUE FOUND BEFORE SETTING OFF, so the record carries something about
# Irvington that can be read again from Muldraugh at the end of the journey -
# which is the whole of P4-R129 / AD-10, and the only way to ask it of a place
# the survivor has really left.
if play_clue "Irvington, the first clue" "$case1_id"; then
    IRV_CLUE="$CLUE_ID"; IRV_BOOKED="$BOOKED"
    wait_true 60 'CFTrav.clueNoted()' >/dev/null || true
    note "Irvington: the clue reached the record as \"$(ev 'return CFTrav.clueNoted()' | field 2)\""
    [ "$(ev 'return CFTrav.clueNoted()' | field 1)" = true ] \
        || fail "Irvington: the clue was inspected but never reached the record"
    check_address "Irvington, the record read in its own town" "$IRV_CLUE"
    record_leg "Irvington, clue noted"
fi

# --- (2)+(3) the journey, in legs -------------------------------------------
IFS=, read -r cx cy <<<"$start_at"
for w in "${WAYPOINTS[@]:1}"; do
    IFS=: read -r name at <<<"$w"
    IFS=, read -r tx ty <<<"$at"
    dist="$(awk -v a="$cx" -v b="$cy" -v c="$tx" -v d="$ty" 'BEGIN{printf "%d", sqrt((c-a)^2+(d-b)^2)}')"
    steps=$(( (dist + LEG - 1) / LEG )); [ "$steps" -ge 1 ] || steps=1
    say "towards $name: $dist tiles in $steps legs of at most $LEG"
    for s in $(seq "$steps"); do
        nx=$(( cx + (tx - cx) * s / steps )); ny=$(( cy + (ty - cy) * s / steps ))
        ev "return CFTrav.go($nx, $ny, 0)" >/dev/null
        wait_true 60 'CFTrav.loaded(3)' >/dev/null \
            || note "leg towards $name at $nx,$ny: the world had not fully streamed in after a minute ($(ev 'return CFTrav.loaded(3)' | tr '\t' ' '))"
        record_leg "towards $name $s/$steps"
    done
    cx="$tx"; cy="$ty"
    # A town stop: let the world settle, walk, and ask the town for a case.
    wait_true 150 'CFCamp.settled()' >/dev/null \
        || note "$name: fewer than six containers within 8 tiles after two and a half minutes ($(ev 'return CFCamp.settled()' | tr '\t' ' '))"
    walk_a_bit "$name, on arrival"
    record_leg "$name, arrived"
    here="$(ev 'return CFTrav.pos()' | field 6)"
    note "$name: the survivor is standing in $here after $(ev 'return CFTrav.journey()' | field 2) tiles"
    if [ "$name" != Muldraugh ]; then
        # --- (4) a new case in a town the survivor reached ------------------
        before="$(cases_total)"
        if ask_case "$name, a new case" 3; then
            mid_case="$(ev 'return CFTrav.newestLive()')"
            mid_case_id="$(field 1 "$mid_case")"
            mid_town="$(ev 'return CFTrav.pos()' | field 6)"
            note "ANSWER (4a): a new case $mid_case_id arrived in $mid_town, $before case(s) before it; its sites are $(field 2 "$mid_case")"
            grep -q "Irvington" <<<"$(field 2 "$mid_case")" \
                && fail "$name: the new case's sites are still in Irvington: $(field 2 "$mid_case")"
            ev 'return CFCamp.gap(true)' >/dev/null   # no further case while this one is played
            hereat="$(ev 'return CFCamp.here()')"
            placed="$(ev "return CFCamp.placement([[$mid_case_id]], $(field 1 "$hereat"), $(field 2 "$hereat"), $(field 3 "$hereat"))")"
            note "$name: the new case's placement: $(field 3 "$placed")"
            [ "$(field 1 "$placed")" = true ] || fail "$name: a site of the new case is outside the reach of where the survivor stands ($(field 3 "$placed"))"
            [ "$(field 2 "$placed")" = true ] || fail "$name: the new case reused a site an earlier case already used ($(field 3 "$placed"))"
            record_leg "$name, new case"
            # --- (4b) find one of its clues the player's way ---------------
            if play_clue "$name, the clue" "$mid_case_id"; then
                MID_CLUE="$CLUE_ID"; MID_BOOKED="$BOOKED"
                wait_true 60 'CFTrav.clueNoted()' >/dev/null || true
                note "$name: the clue reached the record as \"$(ev 'return CFTrav.clueNoted()' | field 2)\""
                [ "$(ev 'return CFTrav.clueNoted()' | field 1)" = true ] \
                    || fail "$name: the clue was inspected but never reached the record"
                check_address "$name, the record read in its own town" "$MID_CLUE"
                note "ANSWER (4b): a clue of the new case was found with the game's own Search Mode ($([ "$SPOTTED" = yes ] && echo "spotted by searching" || echo "recognised by Look it over after the spotting timer ran out")), inspected, and reached the record"
            fi
            ev 'return CFCamp.gap(false)' >/dev/null
            record_leg "$name, clue noted"
        else
            fail "$name: no new case arrived in the town the survivor travelled to, over three local moves ($(promise_words))"
            promise_bites "$(ev 'return CFCamp.promise()' | field 1)" && [ "$(ev 'return CFCamp.promise()' | field 7)" = true ] \
                && fail "$name: the generator's promised hour passed with no case ($(promise_words))"
        fi
    fi
done

# --- (5) Muldraugh ----------------------------------------------------------
mul_placed() { # mul_placed CASEID: the destination case, measured against where the survivor stands
    local h p; h="$(ev 'return CFCamp.here()')"
    p="$(ev "return CFCamp.placement([[$1]], $(field 1 "$h"), $(field 2 "$h"), $(field 3 "$h"))")"
    note "Muldraugh: the case's placement from where the survivor now stands: $(field 3 "$p")"
    [ "$(field 1 "$p")" = true ] || fail "Muldraugh: a site of the case here is outside the reach of where the survivor stands ($(field 3 "$p"))"
    [ "$(field 2 "$p")" = true ] || fail "Muldraugh: the case here reused a site an earlier case already used ($(field 3 "$p"))"
}
mul="$(ev 'return CFTrav.caseIn([[Muldraugh]])')"
if [ "$(field 1 "$mul")" = true ]; then
    note "ANSWER (5): a live case has sites in Muldraugh: $(field 4 "$mul"); its sites are $(ev "return CFTrav.caseTowns([[$(field 2 "$mul")]])" | field 2)"
    mul_placed "$(field 2 "$mul")"
else
    if ask_case "Muldraugh, a case at the destination" 3; then
        mul="$(ev 'return CFTrav.caseIn([[Muldraugh]])')"
        if [ "$(field 1 "$mul")" = true ]; then
            note "ANSWER (5): a case arrived in Muldraugh after the survivor walked its streets: $(field 4 "$mul"); its sites are $(ev "return CFTrav.caseTowns([[$(field 2 "$mul")]])" | field 2)"
            mul_placed "$(field 2 "$mul")"
        else
            note "ANSWER (5): a case arrived at the destination but the address book does not put its sites in Muldraugh: $(ev 'return CFTrav.newestLive()' | field 2)"
        fi
    else
        p="$(ev 'return CFCamp.promise()')"
        if promise_bites "$(field 1 "$p")" && [ "$(field 7 "$p")" = true ]; then
            fail "Muldraugh: no case and the promised hour has passed ($(promise_words); assignments $(ev 'return CFCamp.assignments()'))"
        else
            note "ANSWER (5): no case in Muldraugh yet, but one is promised by $(field 3 "$p") ($(promise_words))"
        fi
    fi
fi
record_leg "Muldraugh, the destination"
# THE OTHER HALF OF AD-10: the same records, read from another town. The mod
# re-measures which town the survivor is in at most every five seconds and only
# once they have moved, so this waits for its answer to agree with the book.
wait_true 150 'CFTrav.townAgrees()' >/dev/null || true
sleep 5
for pair in "Irvington:${IRV_CLUE:-}" "$mid_town:${MID_CLUE:-}"; do
    who="${pair%%:*}"; which="${pair#*:}"
    [ -n "$which" ] || continue
    BOOKED="$([ "$who" = Irvington ] && echo "${IRV_BOOKED:-unknown}" || echo "${MID_BOOKED:-unknown}")"
    check_address "the record of the clue found in $who, read from $(ev 'return CFTrav.pos()' | field 6)" "$which"
done
# WHAT THE RECORD STILL SAYS about the evidence left 9,000 tiles behind. The
# scan can only see a few tiles around the survivor, so this is reported, not
# asserted: the design forbids the record from claiming a clue is lost
# (P4-R104), and what it does say is what a travelling player reads.
note "what the record knows of each live case's clues at the destination: $(ev 'return CFTrav.sightings()')"
# HOW MUCH OF THE MAP CARRIES AN ADDRESS AT ALL, because that is what decides
# whether a record can name a place - and one unnumbered site costs a case
# every address it has.
cov="$(ev 'return CFTrav.bookCoverage()')"
note "address book coverage: the shipped book numbers $(field 1 "$cov") of the $(field 2 "$cov") sites this run's cases used ($(field 3 "$cov")), and $(field 4 "$cov") of the $(field 5 "$cov") buildings on the map with two or more rooms"
ladder="$(ev 'return CFCamp.ladder()')"
[ "$(field 1 "$ladder")" = true ] \
    || fail "the ladder never climbed: $(field 4 "$ladder") refusals of one code earn rung $(field 3 "$ladder") and the generator stands on $(field 2 "$ladder")"

# --- the journey's own numbers ----------------------------------------------
journey="$(ev 'return CFTrav.journey()')"
save_end="$(ev 'return CFReload.bytes()' | field 1)"
q="$(ev 'return CFCamp.cases()')"
final_hours="$(ev 'return CFPace.hours()' | field 1)"
instalments="$(run_log | grep -cE 'ev=placed .*why=instalment' || true)"; is_number "$instalments" || instalments=0
dropped_log="$(run_log | grep -cE 'ev=stale .*why=(expired|carrier-gone)' || true)"; is_number "$dropped_log" || dropped_log=0
defers="$(run_log | grep -o 'ev=defer why=[^ ]* n=[0-9]* due=[0-9:]* rung=[0-9]*' || true)"
engine="$(mod_errors | grep -cE "CellLoader|missing tile" || true)"; is_number "$engine" || engine=0
ours="$(mod_errors | grep -vE "CellLoader|missing tile" || true)"
thrown="$(grep -c . <<<"$ours")"; is_number "$thrown" || thrown=0
[ "$engine" = 0 ] || note "$engine error(s) from the game's own cell loader (base-game tiles missing along the route), not from the mod"
[ "$thrown" = 0 ] || fail "$thrown error(s) inside the mod: $(head -3 <<<"$ours")"

"$PZ" shot "$RUNS/$id-travel.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$id-travel.txt"
{
    echo "Linux travel check $id: $verdict"
    source_line
    echo "the journey: $(field 3 "$journey") to $(field 4 "$journey"), $(field 2 "$journey") tiles over $leg_no legs of at most $LEG, $(field 1 "$journey") anchors on the trail"
    echo "in-game: $(field 5 "$journey") hours survived, world clock hour $final_hours"
    echo "cases at the end: $(tr '\t' ' ' <<<"$q")"
    echo "instalments placed later: $instalments; clues dropped: $dropped_log"
    echo "save size: $save_start B before the first case, $save_end B at the end (budget 500000)"
    echo "legs:"
    printf '  %s\n' "${legs[@]}"
    echo "refusals (P4-R133), by code:"
    if [ -n "$(tr -d '[:space:]' <<<"$defers")" ]; then
        grep -o 'why=[^ ]*' <<<"$defers" | sort | uniq -c | sed 's/^/  /'
    else echo "  none"; fi
    echo "errors inside the mod: $thrown (plus $engine from the game's own cell loader)"
    [ "$thrown" = 0 ] || sed 's/^/  /' <<<"$ours" | head -10
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "screenshot: dev/eval/linux/runs/$id-travel.png (not committed)"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
