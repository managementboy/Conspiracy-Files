#!/usr/bin/env bash
# Campaign check: several generated cases played end to end in one save, the
# way a player's week goes, with saves and reloads between them.
#
#   tools/autotest/checks/campaign.sh [--hidden]
#
# Every other check proves one thing on one case. This one plays on and judges
# what only shows across cases and over time:
#   case 1  every clue found, taken and inspected; the case retires; its evidence
#           turn Evidence / Old; the relay memo's date notes; the second thought
#           "What do I make of it?" said once; FILES gains its row. Its questions
#           are answered on the organiser: the other reading, the second person,
#           the records.
#   reload  save, quit, continue: the answers, the record order, the Old
#           evidence comes back, and the save has not grown.
#   case 2  built from those answers: placed within reach and on sites no case
#           used; the second person returns without a second body; the case
#           leans on the duty log; the answers are marked used and can no longer
#           be changed. Played through and NOT answered.
#   case 3  built from nothing (case 1's answers used, case 2's empty): no
#           steer, no "shaped" line. Two clues found, then saved and reloaded.
#   limit   more cases arrive until four are unfinished, the most the save
#           allows; the timer keeps trying; then case 3 is finished and a new
#           case must still come (the preparation flag must not stick).
# Between cases the survivor MOVES ON, as a player does: CFCamp.moveOn goes to
# an unused building a few hundred tiles away and the check waits for the world
# there to load before asking for the next case. Without that no second case
# ever comes - a refused case waits for the survivor to move (P4-R125) - and
# five runs in a row failed on exactly that.
# Throughout: the record reads case by case, finished evidence stays Old and live
# ones Evidence, NAMES grows, map marks catch up with a pen, the save size is
# recorded per stage, the per-frame cost is sampled, and the mod logs no errors
# in any session. Takes about half an hour. Not in suite.sh.
# Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "campaign: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); stages=(); saves=(); errors_seen=""
CHECKS="$REPO/tools/autotest/checks"
points=(IdentityObserver.afterRender IdentityObserver.tick ClueMarkers.update ClueMarkers.draw
        AutomaticInvestigations.onTick CaseFile.onTick LocalPersonIntegration.tick)

load_lua() {
    ev -f "$CHECKS/core_loop.lua" >/dev/null && ev -f "$CHECKS/reload.lua" >/dev/null \
        && ev -f "$CHECKS/perf.lua" >/dev/null && ev -f "$CHECKS/campaign.lua" >/dev/null
}
field() { if [ $# -ge 2 ]; then cut -f"$1" <<<"$2"; else cut -f"$1"; fi; }   # field N TEXT, or ... | field N
wrap_perf() { for p in "${points[@]}"; do ev "return CFPerf.wrap('$p')" >/dev/null; done; }
perf_note() { findings+=("frame cost during $1: $(ev 'return CFPerf.report()' | tr '\t' ' ' | cut -c1-400)"); }
bytes() { ev 'return CFReload.bytes()' | cut -f1; }
said() { run_log | grep -c "said '$1'" || true; }
logged() { run_log | grep -c "$1" || true; }
# The second thought waits in the voice queue behind "That's all of it", so it
# is counted once it has had time to be said, then checked for exactly one.
# A reload must not grow the save by more than the few words the last-seen scan
# may rewrite; the per-root sizes before and after say which root changed.
reload_growth() { # reload_growth LABEL BYTES_BEFORE PARTS_BEFORE
    local now parts; now="$(bytes)"; parts="$(ev 'return CFReload.bytes()' | cut -f2)"
    findings+=("$1 save size: $2 -> $now bytes; before [$3]; after [$parts]")
    [ "$now" -le $(( $2 + 2000 )) ] 2>/dev/null || fail "$1: the save grew by more than 2 kB on a reload ($2 -> $now)"
}
thought_once() { # thought_once LABEL COUNT_BEFORE
    local n=0
    for _ in $(seq 60); do n=$(( $(said 'What do I make of it?') - $2 )); [ "$n" -ge 1 ] && break; sleep 1; done
    sleep 3; n=$(( $(said 'What do I make of it?') - $2 ))
    [ "$n" = 1 ] || fail "$1: the second thought \"What do I make of it?\" was said $n times, not once"
}
cases() { ev 'return CFCamp.cases()'; }
# THE GENERATOR'S PROMISE (P4-R133 step 6). A refusal carries a code, a count,
# an in-game due time and a rung, so "no case came" is no longer a finding to
# shrug at: past the promised hour it is a failure, and the message says what
# was refused, how often and how far the ladder had climbed. Only the codes
# that mean the world could not supply a case bite; for cap, active-limit and
# disabled the due time is a formality.
promise() { ev 'return CFCamp.promise()'; }
promise_words() { # promise_words TEXT
    printf 'why=%s n=%s due=%s rung=%s/%s now=%s overdue=%s(%sh) preparing=%s active=%s cases=%s' \
        "$(field 1 "$1")" "$(field 2 "$1")" "$(field 3 "$1")" "$(field 4 "$1")" "$(field 5 "$1")" \
        "$(field 6 "$1")" "$(field 7 "$1")" "$(field 8 "$1")" "$(field 9 "$1")" "$(field 10 "$1")" "$(field 11 "$1")"
}
promise_broken() { # promise_broken LABEL: fail when the promised hour has passed
    local p why; p="$(promise)"; why="$(field 1 "$p")"
    case "$why" in
        no-containers|no-reach|cooldown) ;;
        *) findings+=("$1: nothing was promised worth failing on ($(promise_words "$p"))"); return 1 ;;
    esac
    if [ "$(field 7 "$p")" = true ]; then
        fail "$1: the generator promised a case by $(field 3 "$p") and none came ($(promise_words "$p")); assignments $(ev 'return CFCamp.assignments()')"
        return 0
    fi
    findings+=("$1: no case yet, but the promise still stands ($(promise_words "$p"))")
    return 1
}
ladder_climbed() { # ladder_climbed LABEL: the rung must keep up with the count
    local l; l="$(ev 'return CFCamp.ladder()')"
    [ "$(field 1 "$l")" = true ] \
        || fail "$1: $(field 4 "$l") refusals of one code earn rung $(field 3 "$l") but the generator stands on $(field 2 "$l") (every $(field 5 "$l") refusals, up to $(field 6 "$l"))"
}
# Every ev=defer line of every session of the run, kept across the reloads that
# truncate console.txt, so the evidence can print a refusal histogram.
defers=""
# INSTALMENTS AND EXPIRY IN THE LOG (P4-R133). `ev=placed why=instalment` is
# the filler giving a waiting clue a container once the survivor gave it
# somewhere to put one; `ev=stale why=expired` is a clue that waited three
# in-game days and was dropped, and `why=carrier-gone` its P4-R134 twin. All
# three are kept across the reloads that truncate console.txt, because the
# evidence has to be able to say plainly whether a run of this length saw them.
instalments=""
keep_defers() { defers+="$(run_log | grep -o 'ev=defer why=[^ ]* n=[0-9]* due=[0-9:]* rung=[0-9]*' || true)
"
    instalments+="$(run_log | grep -E 'ev=placed .*why=instalment|ev=stale .*why=(expired|carrier-gone)' \
        | grep -oE 'ev=(placed|stale) .*' | cut -c1-150 || true)
"; }
histogram() { # code -> count -> highest n seen -> rung reached
    awk '{ split($0, f, " ");
           why = ""; n = 0; rung = 0
           for (i in f) { if (f[i] ~ /^why=/) why = substr(f[i], 5)
                          if (f[i] ~ /^n=/) n = substr(f[i], 3) + 0
                          if (f[i] ~ /^rung=/) rung = substr(f[i], 6) + 0 }
           if (why == "") next
           lines[why]++
           if (n > worst[why]) worst[why] = n
           if (rung > top[why]) top[why] = rung }
         END { for (w in lines) printf "%s: %d lines, longest run of %d, rung %d\n", w, lines[w], worst[w], top[w] }' <<<"$1"
}
stage() { # stage LABEL: one row of the stage table, and the checks every stage makes
    local s q c o b
    s="$(ev 'return CFCamp.surfaces()')"; q="$(cases)"
    c="$(ev 'return CFCamp.categories()')"; o="$(ev 'return CFCamp.order()')"; b="$(bytes)"
    stages+=("$(printf '%-22s cases %s (%s finished) | record %s | FILES questions %s | NAMES %s | PLACES %s | Old %s/%s wrong | Evidence %s/%s wrong | order %s | save %s B' \
        "$1" "$(field 1 "$q")" "$(field 2 "$q")" "$(field 5 "$s")" "$(field 1 "$s")" "$(field 3 "$s")" "$(field 4 "$s")" \
        "$(field 1 "$c")" "$(field 2 "$c")" "$(field 3 "$c")" "$(field 4 "$c")" "$(field 2 "$o")" "$b")")
    saves+=("$1 $b")
    say "${stages[-1]}"
    [ "$(field 1 "$o")" = true ] || fail "$1: the record does not read case by case: $(field 2 "$o")"
    [ "$(field 4 "$c")" = 0 ] || fail "$1: $(field 4 "$c") carried items of a live case are not Evidence"
    [ "$b" -le 500000 ] 2>/dev/null || fail "$1: the save measured $b bytes, over the 500 kB budget"
    QROWS="$(field 1 "$s")"; NAMES_NOW="$(field 3 "$s")"; PLACES_NOW="$(field 4 "$s")"
    findings+=("$1: assignments $(ev 'return CFCamp.assignments()'); $(promise_words "$(promise)")")
    ladder_climbed "$1"
}
old_settled() { # every carried piece of a finished case is Old (the scan marks them within ~10 s)
    local c
    for _ in $(seq 20); do
        c="$(ev 'return CFCamp.categories()')"
        [ "$(field 1 "$c")" -gt 0 ] 2>/dev/null && [ "$(field 2 "$c")" = 0 ] && return 0
        sleep 2
    done
    fail "$1: finished evidence not all Evidence / Old ($(tr '\t' ' ' <<<"$c"): ok, wrong, live ok, live wrong)"
}
play_case() { # play_case CASEID [LIMIT]: find, take and inspect its next clues
    # Since P4-R133 a case may go live with only the clues that fit, the rest
    # waiting as deferred assignments that the filler places once the survivor
    # gives it somewhere to put them. So this plays what is placed, moves on
    # when something is still waiting, and only gives up when the clues never
    # arrive - which is the assertion the design asks for: clues reaching
    # `placed`, not merely a case existing.
    local cid="$1" limit="${2:-99}" r n waiting dropped out tries=0 moves=0
    local deadline=$(( $(date +%s) + 900 ))
    CASE_LEFT=0; PLAYED=0
    while :; do
        r="$(ev "return CFCamp.useCase([[$cid]])")"
        n="$(field 1 "$r")"; waiting="$(field 3 "$r")"; dropped="$(field 4 "$r")"
        if [ "${n:-0}" -gt 0 ] 2>/dev/null; then
            CASE_LEFT=$(( PLAYED + n ))
            while [ "$PLAYED" -lt "$limit" ] && [ "$tries" -lt "$((PLAYED + n))" ]; do
                tries=$((tries + 1))
                [ "$(field 1 "$(ev "return CFCamp.useCase([[$cid]])")")" -gt 0 ] 2>/dev/null || break
                local where; where="$(ev 'return CFCamp.describeFirst()' | tr '\t' ' ')"
                if out="$(inspect_doc 1)"; then
                    PLAYED=$((PLAYED + 1)); say "case ${cid#generated:}: clue $PLAYED of $CASE_LEFT: $out"
                else
                    # A clue can be mid-relocation (the mod moves an unfound one
                    # once the survivor is far away), and the harness has just
                    # teleported hundreds of tiles: one retry before giving up,
                    # because a skipped clue means the case can never finish and
                    # every later assertion follows it down.
                    say "case ${cid#generated:}: $out; $where - one more try"
                    sleep 15
                    if out="$(inspect_doc 1)"; then
                        PLAYED=$((PLAYED + 1)); say "case ${cid#generated:}: clue $PLAYED of $CASE_LEFT (second try): $out"
                    else
                        # FAULT 5's cheapest diagnostic (CASE_PACING, "Known
                        # unexplained"): the stored target, World.resolve's
                        # verdict, how far the item really is from its recorded
                        # square, the last sighting and the relocations count.
                        # Taken BEFORE skipFirst, which drops the clue from the
                        # list the diagnostic reads.
                        fail "case ${cid#generated:}: $out; $where | FAULT5: $(ev 'return CFCamp.faultFive()' | tr '\t' ' ') (skipped $(ev 'return CFCamp.skipFirst()'))"
                    fi
                fi
            done
            [ "$PLAYED" -lt "$limit" ] || return 0
            r="$(ev "return CFCamp.useCase([[$cid]])")"
            n="$(field 1 "$r")"; waiting="$(field 3 "$r")"; dropped="$(field 4 "$r")"
        fi
        [ "${waiting:-0}" -gt 0 ] 2>/dev/null || return 0
        # Something is still waiting for a container. A player walks on; so do we.
        if [ "$(date +%s)" -ge "$deadline" ]; then
            fail "case ${cid#generated:}: $waiting clue(s) never reached a container in fifteen minutes (statuses $(field 5 "$r"); assignments $(ev 'return CFCamp.assignments()'); $(promise_words "$(promise)"))"
            return 1
        fi
        moves=$((moves + 1))
        # The filler needs the WAITING CLUE'S OWN SITE loaded, not a fresh
        # neighbourhood: it scans that site's bounds for a free container and
        # Storage only sees loaded squares. So the survivor goes back to the
        # site the clue belongs to, which is what a player does when a case
        # still has something at the warehouse.
        at="$(ev "return CFCamp.goToWaitingSite([[$cid]])")"
        if [ "$(field 1 "$at")" = true ]; then
            findings+=("case ${cid#generated:}: $waiting clue(s) still waiting after $PLAYED played, $dropped dropped (statuses $(field 5 "$r")); loaded $(field 2 "$at")'s own site $(field 3 "$at") at $(field 4 "$at") and stepped back to $(field 6 "$at"), move $moves")
            say "${findings[-1]}"
            wait_true 60 'CFCamp.settled()' >/dev/null || true
        else
            findings+=("case ${cid#generated:}: $waiting waiting, but its site could not be reached ($(field 2 "$at")); moving on instead, move $moves")
            move_on "case ${cid#generated:}, waiting clue, move $moves" || sleep 30
        fi
        # Give the filler its own time: it places one clue per attempt.
        local until_t=$(( $(date +%s) + 120 ))
        while [ "$(date +%s)" -lt "$until_t" ]; do
            r="$(ev "return CFCamp.useCase([[$cid]])")"
            [ "$(field 1 "$r")" -gt 0 ] 2>/dev/null && break
            [ "$(field 3 "$r")" = 0 ] && break
            sleep 5
        done
    done
}
wait_finished() { for _ in $(seq 60); do [ "$(field 2 "$(cases)")" -ge "$1" ] 2>/dev/null && return 0; sleep 1; done; return 1; }
wait_case_count() { # wait_case_count COUNT SECONDS
    local end=$(( $(date +%s) + $2 ))
    while [ "$(date +%s)" -lt "$end" ]; do
        [ "$(field 1 "$(cases)")" -ge "$1" ] 2>/dev/null && return 0
        sleep 3
    done
    return 1
}
placed_well() { # placed_well LABEL CASEID X Y HOURS
    local p; p="$(ev "return CFCamp.placement([[$2]], $3, $4, $5)")"
    findings+=("$1 placement: $(field 3 "$p")")
    [ "$(field 1 "$p")" = true ] || fail "$1: a site is outside the reach of where the survivor stood ($(field 3 "$p"))"
    [ "$(field 2 "$p")" = true ] || fail "$1: a site an earlier case already used was used again ($(field 3 "$p"))"
}
# BETWEEN CASES THE SURVIVOR MOVES ON (P4-R125). A refused case is not tried
# again until the survivor has moved about 50 tiles or half an in-game hour has
# passed, and this check used to stand where the last case left it: the mod
# logged "insufficient distinct loaded storage nearby" 17 times and no second
# case ever came (20260917T160453 and the four runs before it). So now the
# check walks to a new neighbourhood the way a player does - CFCamp.moveOn
# teleports into an unused building a few hundred tiles off - waits for the
# world there to load, and only then waits for the case. `here` is re-read
# after the move, because the case is prepared from where the survivor stands,
# which is what placed_well then measures the reach against.
move_on() { # move_on LABEL
    local m s
    m="$(ev 'return CFCamp.moveOn()')"
    [ "$(field 1 "$m")" = true ] || { findings+=("$1: nowhere fresh to move to: $(field 2 "$m")"); return 1; }
    if ! wait_true 120 'CFCamp.settled()'; then
        findings+=("$1: the world at $(field 2 "$m") did not load enough to place a case ($(ev 'return CFCamp.settled()' | tr '\t' ' '))")
        return 1
    fi
    s="$(ev 'return CFCamp.settled()')"
    here="$(ev 'return CFCamp.here()')"
    findings+=("$1: moved on $(field 4 "$m") tiles to $(field 2 "$m") ($(field 3 "$m")); $(field 3 "$s") containers loaded within 8 tiles")
    say "${findings[-1]}"
    return 0
}
# 45 s and 210 s were calibrated on a machine that renders in hardware. This
# one renders in software at about 7 frames a second, and every bounded job in
# the mod is paced per frame: preparing a case costs roughly fifty thousand
# scheduler steps, and a 2 ms frame budget buys about nine of them a frame.
# That is ~5,500 frames, or thirteen minutes here against eighty seconds at
# 60 fps. The run of 20260921T111236 watched case 2 arrive AFTER the check had
# already recorded it missing. Waiting longer costs nothing when no case comes.
CF_CASE_WAIT_FIRST="${CF_CASE_WAIT_FIRST:-90}"
CF_CASE_WAIT_MOVE="${CF_CASE_WAIT_MOVE:-420}"
next_case() { # next_case LABEL WANT [MOVES]: wait for case number WANT, moving on between tries
    local label="$1" want="$2" moves="${3:-4}" i
    ev 'return CFCamp.gap(false)' >/dev/null
    for i in $(seq "$moves"); do
        wait_case_count "$want" "$CF_CASE_WAIT_FIRST" && return 0
        move_on "$label, move $i" || continue
        wait_case_count "$want" "$CF_CASE_WAIT_MOVE" && { findings+=("$label: the case came after $i move(s) to a fresh neighbourhood"); return 0; }
        say "$label: no case after $CF_CASE_WAIT_MOVE s following move $i ($(promise_words "$(promise)"))"
        ladder_climbed "$label, move $i"
    done
    # Out of moves: the generator's own promise decides whether that is a
    # failure or a wait that has not run out yet (P4-R133).
    promise_broken "$label" || findings+=("$label: no case after $moves moves; assignments $(ev 'return CFCamp.assignments()')")
    return 1
}
reload_world() { # reload_world LABEL: save, quit, continue, reload the Lua
    errors_seen+="$(mod_errors)"
    keep_defers
    "$PZ" stop --save >/dev/null 2>&1
    "$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "$1: the saved game did not load"
    load_lua || abort "$1: could not load the check's Lua after the reload"
    wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || fail "$1: the campaign did not resume"
    sleep 8
    wrap_perf
}

# ---------------------------------------------------------------------------
claim_game || exit 2
# P4-R126: the relay memo's date note is only tested when case 1 has a document
# dated inside the memo's week, which about a third of cases do. Fresh worlds
# are started until one has it - at most THREE (P4-R126 said eight). Eight is
# too dear: the run of 20260917T160453 spent seven worlds, about twenty
# minutes, before it could start playing, and a world costs a game launch, an
# address index and a first case. Past three the run carries on in the world it
# has and the date note becomes a finding ("not exercised") rather than a
# restart; over five runs the note is still exercised most nights.
worlds=0
CF_MEMO_WORLDS="${CF_MEMO_WORLDS:-3}"
while :; do
    worlds=$((worlds + 1))
    start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
    load_lua || abort "could not load the check's Lua"
    wait_true 90 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' || abort "no case started"
    # 120 s was calibrated when preparation was quick. Measured 2026-09-21 on
    # this laptop: the first case takes about 430 s to appear, because a hidden
    # software-rendered run manages roughly 6.5 frames a second and every
    # bounded job in the mod is paced per frame. The metadata scan alone walks
    # 9,978 buildings in 678 frames - about 11 s at 60 fps, 105 s here.
    # Waiting 12 minutes costs nothing when no case comes; refusing to wait
    # cost the whole history-and-storage gate.
    wait_case_count 1 "${CF_FIRST_CASE_WAIT:-720}" || abort "no first case"
    case1="$(ev 'return CFCamp.newestLive()' | field 1)"
    week="$(ev "return CFCamp.memoWeek([[$case1]])")"
    if [ "$(field 1 "$week")" = true ] && [ "$(field 2 "$week")" -gt 0 ] 2>/dev/null; then break; fi
    if [ "$worlds" -ge "$CF_MEMO_WORLDS" ]; then findings+=("no case 1 in $worlds fresh worlds had a document in the relay memo's week; carrying on in this world"); break; fi
    say "world $worlds: case 1 has no document in the memo's week; starting a fresh world"
    "$PZ" stop >/dev/null 2>&1
done
findings+=("fresh worlds started for a case 1 with a document in the memo's week: $worlds (memo=$(field 1 "$week"), dated documents=$(field 2 "$week"))")
first="$(session)"; world="$(cat "$REPO/dev/eval/linux/world")"
wrap_perf
ev 'return CFLoop.givePen()' >/dev/null

# --- case 1 -----------------------------------------------------------------
say "case 1: $case1"
stage "start"
names_start="$NAMES_NOW"
thought0="$(said 'What do I make of it?')"
play_case "$case1"
[ "$PLAYED" = "$CASE_LEFT" ] || fail "case 1: only $PLAYED of $CASE_LEFT clues could be played"
wait_finished 1 || fail "case 1 did not finish after its clues were inspected"
thought_once "case 1" "$thought0"
notes="$(ev 'return CFLoop.dateNotes()')"
findings+=("case 1 relay memo: found=$(field 1 "$notes"), dated in its week=$(field 2 "$notes"), carrying the date note=$(field 3 "$notes")")
[ "$(field 1 "$notes")" = true ] || fail "case 1: the relay memo is not among the evidence found"
[ "$(field 2 "$notes")" = "$(field 3 "$notes")" ] || fail "case 1: $(field 2 "$notes") records dated in the memo's week, but $(field 3 "$notes") carry the date note"
if [ "$(field 2 "$notes")" -gt 0 ] 2>/dev/null; then
    findings+=("the date note was exercised: $(field 3 "$notes") of $(field 2 "$notes") records dated in the memo's week carry it")
else
    findings+=("the date note was not exercised: case 1 had no document in the memo's week")
fi
old_settled "case 1 finished"
stage "case 1 finished"
[ "$QROWS" = 1 ] || fail "case 1 finished: FILES shows $QROWS question rows, not 1"

asked="$(ev "return CFCamp.answersOf([[$case1]])")"
[ "$(field 1 "$asked")" = true ] || fail "case 1 finished without questions"
answered="$(ev "return CFCamp.answer([[$case1]], 2, 2, 2)")"
[ "$(field 1 "$answered")" = true ] || fail "case 1: could not answer on the organiser: $(field 2 "$answered")"
answers="$(ev "return CFCamp.answersOf([[$case1]])")"
[ "$(field 2 "$answers")/$(field 3 "$answers")/$(field 4 "$answers")" = "two/person2/records" ] \
    || fail "case 1: the organiser saved $(field 2 "$answers")/$(field 3 "$answers")/$(field 4 "$answers"), not two/person2/records"
person2="$(field 7 "$answers")"
findings+=("case 1 note on the organiser: $(field 2 "$answered")")
record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
perf_note "case 1"

# --- reload 1 ---------------------------------------------------------------
reload_world "reload 1"
[ "$(ev "return CFCamp.answersOf([[$case1]])")" = "$answers" ] || fail "reload 1: the answers changed: $(ev "return CFCamp.answersOf([[$case1]])" | tr '\t' ' ')"
[ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 1: the record changed"
old_settled "after reload 1"
stage "after reload 1"
reload_growth "reload 1" "$bytes_before" "$parts_before"

# --- case 2: built from the answers ------------------------------------------
here="$(ev 'return CFCamp.here()')"
next_case "case 2" 2 || fail "no second case, after moving on to four fresh neighbourhoods"
case2="$(ev 'return CFCamp.newestLive()' | field 1)"
ev 'return CFCamp.gap(true)' >/dev/null   # no further case while this one is played
say "case 2: $case2"
placed_well "case 2" "$case2" "$(field 1 "$here")" "$(field 2 "$here")" "$(field 3 "$here")"
steer2="$(ev "return CFCamp.steerOf([[$case2]])")"
[ "$(field 1 "$steer2")" = "$case1" ] || fail "case 2 was not built from case 1's answers (steer from: $(field 1 "$steer2"))"
[ "$(field 2 "$steer2")/$(field 3 "$steer2")" = "two/records" ] || fail "case 2's steer is $(field 2 "$steer2")/$(field 3 "$steer2"), not two/records"
[ "$(field 5 "$steer2")" = "$person2" ] || fail "case 2's first person is $(field 5 "$steer2"), not the returning $person2"
[ "$(field 6 "$steer2")" = true ] || fail "case 2: the returning person could be given a second body"
grep -q "Duty log / " <<<"$(field 7 "$steer2")" || fail "case 2 does not include the duty log the other reading leans on"
[ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 2: the steered case was not logged exactly once"
findings+=("case 2 clues: $(field 7 "$steer2")")
[ "$(ev "return CFCamp.answersOf([[$case1]])" | field 5)" = "$case2" ] || fail "case 1's answers are not marked used by case 2"
[ "$(ev "return CFCamp.tryChange([[$case1]])" | field 1)" = false ] || fail "case 1's answers could still be changed after shaping case 2"
thought0="$(said 'What do I make of it?')"
play_case "$case2"
[ "$PLAYED" = "$CASE_LEFT" ] || fail "case 2: only $PLAYED of $CASE_LEFT clues could be played"
wait_finished 2 || fail "case 2 did not finish"
thought_once "case 2" "$thought0"
here="$(ev 'return CFCamp.here()')"
old_settled "case 2 finished"
stage "case 2 finished"
[ "$QROWS" = 2 ] || fail "case 2 finished: FILES shows $QROWS question rows, not 2"
perf_note "case 2"

# --- case 3: built from nothing ---------------------------------------------
next_case "case 3" 3 || fail "no third case, after moving on to four fresh neighbourhoods"
case3="$(ev 'return CFCamp.newestLive()' | field 1)"
ev 'return CFCamp.gap(true)' >/dev/null
say "case 3: $case3"
placed_well "case 3" "$case3" "$(field 1 "$here")" "$(field 2 "$here")" "$(field 3 "$here")"
[ "$(ev "return CFCamp.steerOf([[$case3]])" | field 1)" = unsteered ] || fail "case 3 should be unsteered (case 1's answers used, case 2's empty)"
[ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 3 was logged as shaped by answers"
play_case "$case3" 2
[ "$PLAYED" = 2 ] || fail "case 3: only $PLAYED of 2 clues could be played"
stage "case 3, two clues"
record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
perf_note "case 3"

# --- reload 2 ---------------------------------------------------------------
reload_world "reload 2"
[ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 2: the record changed"
s3="$(ev "return CFCamp.steerOf([[$case3]])" | field 1)"   # "none" once case 3 has finished (a two-clue case can)
[ "$s3" = unsteered ] || [ "$s3" = none ] || fail "reload 2: case 3 gained a steer ($s3)"
[ "$(ev "return CFCamp.answersOf([[$case1]])" | field 5)" = "$case2" ] || fail "reload 2: case 1's answers lost their used mark"
old_settled "after reload 2"
stage "after reload 2"
reload_growth "reload 2" "$bytes_before" "$parts_before"
[ "$NAMES_NOW" -gt "$names_start" ] 2>/dev/null || fail "NAMES never grew across three cases ($names_start -> $NAMES_NOW)"
marks="$(ev 'return CFLoop.markers()')"
findings+=("map marks after reload 2 (written/pending/missing): $(tr '\t' '/' <<<"$marks")")
[ "$(field 2 "$marks")" = 0 ] || fail "reload 2: $(field 2 "$marks") map marks still pending with a pen in the pocket"

# --- the active limit ----------------------------------------------------------
ev 'return CFCamp.gap(false)' >/dev/null
q="$(cases)"; target=$(( $(field 2 "$q") + 4 ))
# A new case takes minutes to prepare (a nearby scan) and needs a neighbourhood
# no case has used, so each one is asked for the same way: move on, then wait.
limit_deadline=$(( $(date +%s) + 1200 ))
until [ "$(field 1 "$(cases)")" -ge "$target" ] 2>/dev/null; do
    [ "$(date +%s)" -lt "$limit_deadline" ] || { findings+=("twenty minutes was not enough to fill the four unfinished cases: $(cases | tr '\t' ' ')"); break; }
    next_case "the limit" $(( $(field 1 "$(cases)") + 1 )) 2 \
        || { findings+=("cases stopped coming short of four unfinished: $(cases | tr '\t' ' ')"); break; }
done
[ "$(field 1 "$(cases)")" -ge "$target" ] 2>/dev/null \
    || findings+=("the fourth unfinished case did not arrive: $(cases | tr '\t' ' ')")
q="$(cases)"; live=$(( $(field 1 "$q") - $(field 2 "$q") ))
stage "at the limit"
[ "$live" -le 4 ] || fail "$live unfinished cases at once; the save allows four"
# Move on first, so what refuses a fifth case is the limit itself and not the
# wait for a survivor who has not moved (P4-R125).
move_on "at the limit" || true
sleep 90
prep="$(ev 'return CFCamp.preparing()')"
[ "$live" -lt 4 ] || [ "$(field 1 "$(cases)")" = "$(field 1 "$q")" ] || fail "a case was created while four were unfinished"
findings+=("after 90 s with $live unfinished: preparing=$(field 1 "$prep"), cases $(cases | tr '\t' ' ')")
finished_before="$(field 2 "$(cases)")"; count_before="$(field 1 "$(cases)")"
oldest="$(ev 'return CFCamp.oldestLive()' | field 1)"
play_case "$oldest"
wait_finished $((finished_before + 1)) || fail "the oldest unfinished case ${oldest#generated:} did not finish"
if next_case "after the limit" $((count_before + 1)) 3; then
    findings+=("a new case came after a case was finished at the limit: $(cases | tr '\t' ' ')")
else
    fail "after a case was finished at the limit, no new case came over three fresh neighbourhoods (preparing=$(ev 'return CFCamp.preparing()' | field 1))"
fi
stage "after the limit"
perf_note "the limit"

# --- the archive (P4-R111) and AD-10 town names -----------------------------
# By now four or five cases have finished, which is what the archive is about:
# the four most recent keep their rows, anything older is a stub, and a clue in
# the world whose case is a stub must still read Evidence / Old and still offer
# the greyed "already noted" option rather than an empty menu.
# The archive only stubs the FIFTH finished case (the four most recent stay
# whole), and the run has finished three or four by now, so two more cases are
# played out here - which is also the only way to see a case keep coming past
# the point where one is archived.
tried=""
for extra in 1 2 3; do
    finished="$(field 2 "$(cases)")"
    [ "$finished" -ge 5 ] 2>/dev/null && break
    next=""
    for cid in $(ev 'return CFCamp.liveIds()' | field 1); do
        case " $tried " in *" $cid "*) ;; *) next="$cid"; break ;; esac
    done
    [ -n "$next" ] || { findings+=("archive: no unfinished case left to play for the fifth finish"); break; }
    tried+=" $next"
    say "archive: playing ${next#generated:} to reach five finished cases"
    play_case "$next"
    wait_finished $((finished + 1)) || findings+=("archive: case ${next#generated:} did not finish")
done
arch="$(ev 'return CFCamp.archive()')"
findings+=("archive: $(field 1 "$arch") finished cases full, $(field 2 "$arch") stubbed, $(field 3 "$arch") rows kept in all, $(field 4 "$arch") stubs still offering questions; $(field 5 "$arch")")
# The Old mark is put on by the periodic last-seen scan, so a case that
# finished a moment ago has clues that are still Evidence: wait for the scan the
# way every other stage does, or the read is a race (5 of 28 in 20260918T023400,
# all 28 correct by the next stage).
old_settled "the archive"
old="$(ev 'return CFCamp.oldEvidence()')"
findings+=("a finished case's clues carried: $(field 1 "$old") checked, $(field 2 "$old") show Evidence / Old, $(field 3 "$old") offer the greyed already-noted option, $(field 4 "$old") offer no such option ($(field 5 "$old"))")
[ "$(field 1 "$old")" = 0 ] || [ "$(field 2 "$old")" = "$(field 1 "$old")" ] \
    || fail "$(( $(field 1 "$old") - $(field 2 "$old") )) of $(field 1 "$old") finished clues do not read Evidence / Old"
[ "$(field 1 "$old")" = 0 ] || [ "$(field 4 "$old")" = 0 ] \
    || fail "$(field 4 "$old") finished clues offer no already-noted option at all ($(field 5 "$old"))"
# KNOX's boot count, the stub's questions, and a save with stubs in it. The
# archive drops a finished case's ROWS; everything the survivor made of it and
# every discovery it contributed must survive that, and so must a reload.
boot="$(ev 'return CFCamp.bootRecords()')"
findings+=("KNOX boot line \"$(field 4 "$boot")\": the ledger holds $(field 2 "$boot") discoveries, $(field 3 "$boot") of them from stubbed cases")
[ "$(field 1 "$boot")" = "$(field 2 "$boot")" ] \
    || fail "KNOX boots \"Records ....... $(field 1 "$boot")\" while the ledger holds $(field 2 "$boot") discoveries"
stubq="$(ev 'return CFCamp.stubQuestions()')"
findings+=("stubbed cases: $(field 1 "$stubq") stubs, $(field 2 "$stubq") still offering questions, $(field 3 "$stubq") carrying saved answers, $(field 4 "$stubq") of those marked used by a later case ($(field 5 "$stubq"))")
if [ "$(field 1 "$stubq")" -gt 0 ] 2>/dev/null; then
    [ "$(field 2 "$stubq")" = "$(field 1 "$stubq")" ] \
        || fail "$(( $(field 1 "$stubq") - $(field 2 "$stubq") )) of $(field 1 "$stubq") stubbed cases no longer offer their questions"
    [ "$(field 3 "$boot")" -gt 0 ] 2>/dev/null \
        || findings+=("the stubbed case contributed no discovery to the ledger, so the boot count could not be tested against one")
else
    findings+=("no case was stubbed in this run, so the stub half of P4-R111 was not exercised in the game")
fi
record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
reload_world "reload 3, with stubs present"
[ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 3: the record changed with a stubbed case in the save"
arch2="$(ev 'return CFCamp.archive()')"
findings+=("archive after the reload: $(field 1 "$arch2") full, $(field 2 "$arch2") stubbed, $(field 3 "$arch2") rows; $(field 5 "$arch2")")
[ "$(field 2 "$arch2")" = "$(field 2 "$arch")" ] \
    || fail "reload 3: the archive changed across the reload ($(field 2 "$arch") stubs before, $(field 2 "$arch2") after)"
refusals="$(run_log | grep -iE "refus|rejected|budget" | grep -v "ev=defer" | head -5 || true)"
findings+=("refusals in the log of the session loaded with stubs present: $(grep -c . <<<"$refusals")")
[ -z "$(tr -d '[:space:]' <<<"$refusals")" ] || fail "the session loaded with stubs present logged a refusal: $(head -2 <<<"$refusals" | cut -c1-200)"
old_settled "after reload 3"
stage "after reload 3, stubs present"
reload_growth "reload 3" "$bytes_before" "$parts_before"
# AD-10 town names (P4-R129) need TWO places to mean anything: a record about a
# place in the survivor's own town is written without the town, and the same
# record read from another town carries it. Every case of this run was within
# 300 tiles, so the survivor is walked a long way off and the records read again.
town_words() { # town_words TEXT
    printf 'standing in %s: of %s records the LIVE label names a town on %s and not on %s; the stored FOUND lines (history, frozen by design) name one on %s and not on %s; e.g. %s' \
        "$(field 1 "$1")" "$(field 5 "$1")" "$(field 2 "$1")" "$(field 3 "$1")" \
        "$(field 6 "$1")" "$(field 7 "$1")" "$(field 4 "$1")"
}
towns="$(ev 'return CFCamp.townNames()')"
findings+=("AD-10 town names, $(town_words "$towns")")
probe="$(ev 'return CFCamp.qualifyProbe()')"
findings+=("AD-10 address book, standing in $(field 1 "$probe"): of $(field 5 "$probe") buildings the cases used, $(field 2 "$probe") would be written with their town and $(field 3 "$probe") without; $(field 4 "$probe")")
far="$(ev 'return CFCamp.moveToTown()')"
if [ "$(field 1 "$far")" = true ]; then
    findings+=("AD-10: walked from $(field 2 "$far") to $(field 3 "$far") at $(field 4 "$far"), $(field 5 "$far") tiles")
    wait_true 120 'CFCamp.settled()' >/dev/null || true
    # The live label of a finished case's evidence is rewritten by the last-seen
    # scan, which runs every ten seconds and writes at most once a minute per
    # document - so give it two minutes rather than five seconds.
    wait_true 150 'select(2, CFCamp.townNames())>0' >/dev/null || true
    towns2="$(ev 'return CFCamp.townNames()')"
    findings+=("AD-10 town names, $(town_words "$towns2")")
    probe2="$(ev 'return CFCamp.qualifyProbe()')"
    findings+=("AD-10 address book, standing in $(field 1 "$probe2"): of $(field 5 "$probe2") buildings the cases used, $(field 2 "$probe2") would be written with their town and $(field 3 "$probe2") without; $(field 4 "$probe2")")
    if [ "$(field 1 "$towns2")" != "$(field 1 "$towns")" ] && [ "$(field 1 "$towns2")" != nil ]; then
        # THE ASSERTION IS ON THE ADDRESS BOOK, not on a finished case's record
        # rows: retirement drops the case envelope AddressMap.describe needs, so
        # a finished row's only address is the frozen FOUND line (history, by
        # design). What AD-10 fixed is that a remembered address keeps its two
        # halves and is qualified on the way out, and that is what this asks.
        [ "$(field 2 "$probe2")" -gt 0 ] 2>/dev/null \
            || fail "read from $(field 1 "$towns2"), not one of the $(field 5 "$probe2") buildings the cases used would be written with its town ($(field 4 "$probe2"))"
        [ "$(field 2 "$towns2")" -gt 0 ] 2>/dev/null \
            || findings+=("no record row names a town from $(field 1 "$towns2"): of $(field 5 "$towns2") rows, $(field 2 "$towns2") carry a live address with a town and the $(field 6 "$towns2")+$(field 7 "$towns2") stored FOUND lines are frozen history - a design question, not a fault (a finished case has no live address at all)")
    else
        findings+=("the long move stayed in $(field 1 "$towns2"), so the other-town half of AD-10 was not exercised")
    fi
else
    findings+=("nowhere to move 1500 tiles to ($(field 2 "$far")), so the other-town half of AD-10 was not exercised")
fi

errors_seen+="$(mod_errors)"
keep_defers
at_the_end="$(cases | tr '\t' ' ')"   # while the game is still answering
[ -z "$errors_seen" ] || fail "errors inside the mod"
"$PZ" shot "$RUNS/$first-campaign.png" >/dev/null 2>&1
"$PZ" stop >/dev/null 2>&1

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
report="$EVIDENCE/$first-campaign.txt"
{
    echo "Linux campaign check $first: $verdict"
    source_line
    echo "cases: 1 $case1, 2 ${case2:-none}, 3 ${case3:-none}; at the end ${at_the_end:-not read}"
    echo "stages:"
    printf '  %s\n' "${stages[@]}"
    echo "case 1 answers on the organiser: $(tr '\t' ' ' <<<"$answers")"
    echo "case 2 steer: $(cut -f1-6 <<<"${steer2:-}" | tr '\t' ' ')"
    echo "refusals (P4-R133), all sessions:"
    if [ -n "$(tr -d '[:space:]' <<<"$defers")" ]; then histogram "$defers" | sed 's/^/  /'; else echo "  none"; fi
    echo "instalments placed and clues dropped (P4-R133, P4-R134), all sessions:"
    if [ -n "$(tr -d '[:space:]' <<<"$instalments")" ]; then grep -c . <<<"$instalments" | sed 's/^/  lines: /'; sort -u <<<"$instalments" | grep . | sed 's/^/  /'; else echo "  none in this run"; fi
    echo "errors inside the mod, all sessions: $(grep -c . <<<"$errors_seen")"
    [ -z "$errors_seen" ] || sed 's/^/  /' <<<"$errors_seen" | head -10
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
    echo "screenshot: dev/eval/linux/runs/$first-campaign.png (not committed)"
} > "$report.part"; mv "$report.part" "$report"
cat "$report"
[ "$verdict" = PASS ]
