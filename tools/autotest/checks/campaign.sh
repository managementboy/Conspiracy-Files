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
# THE WHOLE RUN IS ONE FUNCTION, AND THAT IS NOT A STYLE CHOICE.
#
# bash reads a script from disk INCREMENTALLY, so editing this file while a run
# is in progress shifts the byte offset under the running shell and it dies
# mid-run on a syntax error in text it never meant to execute. That destroyed a
# ninety-minute campaign run on 2026-09-21 and again on 2026-09-22, the second
# time after I had said I would not do it again.
#
# A function body is parsed in full the moment bash reads the definition, so
# once cf_main is defined the file on disk no longer matters. Resolve was tried
# twice; this works.
cf_main() {
    . "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
    start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
    say() { echo "campaign: $*" >&2; }
    abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
    # THREE KINDS OF BAD NEWS, and conflating them is how a campaign run gets
    # reported as a product failure when the fixture was wrong - which is exactly
    # what happened on 2026-09-21, twice in one report.
    #
    #   fail         THE MOD IS WRONG. A product requirement was observed to be
    #                broken. This and only this makes the gate FAIL.
    #   harness      THE CHECK IS WRONG, or could not observe what it needed to.
    #                The mod is not accused. Exit 2, "could not run".
    #   unexercised  A STAGE WAS NEVER REACHED, or cannot be reached under the
    #                current contract. Neither a pass nor a failure: it is the
    #                absence of evidence, and it is said out loud rather than
    #                folded into the verdict.
    fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
    harnesses=(); harness() { harnesses+=("$*"); say "HARNESS: $*"; }
    # Set when a clue is parked at `unknown`: the case cannot finish by the owner's
    # own decision, so the stages behind it are NOT EXERCISED rather than failed.
    WEDGED=0
    unexercised=(); unexercised() { unexercised+=("$*"); say "NOT EXERCISED: $*"; }
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
        # WALL CLOCK IS THE SAFETY BOUNDARY, NOT THE MEASUREMENT. The fifteen
        # minutes here used to BE the hang detector, which made the verdict a
        # property of this laptop's frame rate: every bounded job in the mod is
        # paced per frame, and hidden runs manage about 7 of them a second. A
        # healthy stage can miss the clock; a job wedged at step 0 with ticks=0
        # looks identical to a slow one right up until it fires.
        # So the stall is detected from CFCamp.progress()'s fingerprint - scheduler
        # steps, queued jobs, the nearby scan's phase/index/scanned/ticks/steps,
        # clue statuses, clues found, case count - and the clock only stops a run
        # that would otherwise never end.
        local deadline=$(( $(date +%s) + 2700 ))
        local last_progress="" flat=0
        CASE_LEFT=0; PLAYED=0
        while :; do
            r="$(ev "return CFCamp.useCase([[$cid]])")"
            n="$(field 1 "$r")"; waiting="$(field 3 "$r")"; dropped="$(field 4 "$r")"
            if [ "${n:-0}" -gt 0 ] 2>/dev/null; then
                # THE BOUND MUST BE FROZEN BEFORE THE LOOP. It used to be
                # "$((PLAYED + n))", recomputed on every iteration - and PLAYED
                # grows inside the loop, so each clue played raised the ceiling by
                # one and the bound receded forever. PLAYED could then overrun the
                # CASE_LEFT captured just above, and the stage reported nonsense
                # like "only 5 of 3 clues could be played" (20260921T111236).
                # That was the harness miscounting, not the mod failing to place.
                local offered=$(( PLAYED + n ))
                CASE_LEFT=$offered
                while [ "$PLAYED" -lt "$limit" ] && [ "$tries" -lt "$offered" ]; do
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
            # FIELD 1 IS WORK, FIELD 2 IS LIVENESS, AND ONLY WORK IS COMPARED.
            # The first version compared a fingerprint that included scheduler step
            # counts, which rise on every poll whatever happens: measured
            # 2026-09-21, the filler ran 70,019 -> 70,054 steps in eleven seconds
            # while `deferred=2 placed=4` had not moved for eight in-game hours.
            # Comparing that is exactly as blind as the wall clock it replaced.
            local sample now_progress now_liveness
            sample="$(ev 'return CFCamp.progress()')"
            now_progress="$(field 1 "$sample")"; now_liveness="$(field 2 "$sample")"
            if [ -z "$now_progress" ]; then
                harness "case ${cid#generated:}: CFCamp.progress() returned nothing, so no stall could be judged"
                return 1
            elif [ "$now_progress" = "$last_progress" ]; then
                flat=$((flat + 1))
            else
                flat=0; last_progress="$now_progress"
            fi
            # THE ESCAPE GETS TRIED BEFORE THE STALL IS DECLARED.
            #
            # Four was too few, and not because it was impatient: the survivor
            # returns to the waiting clue's OWN SITE for the first three moves,
            # and only from the fourth does the cap above send them to a fresh
            # neighbourhood - which is the design's own remedy for a clue with
            # nowhere to go. Declaring a stall at four meant failing the stage
            # on the very move the remedy began, so the remedy was never once
            # exercised (2026-09-22: "NO WORK WAS COMPLETED over 4 moves" fired
            # at exactly the handover).
            #
            # Eight gives the fresh neighbourhoods four moves of their own.
            # Each move is a teleport plus at least 120 s of waiting, so this
            # is still many minutes of the mod being given work and completing
            # none of it.
            if [ "$flat" -ge 8 ]; then
                fail "case ${cid#generated:}: $waiting clue(s) waiting and NO WORK WAS COMPLETED over $flat moves (the first 3 at the clue own site, the rest in FRESH neighbourhoods, so the design remedy was tried) - clue statuses, clues found, case count, preparing flag and the nearby scan's phase/cursor are all unchanged at [$now_progress], while the scheduler kept running [$now_liveness], so the mod is busy and getting nowhere (assignments $(ev 'return CFCamp.assignments()'); $(promise_words "$(promise)"))"
                return 1
            fi
            if [ "$(date +%s)" -ge "$deadline" ]; then
                unexercised "case ${cid#generated:}: $waiting clue(s) had not reached a container when the 45-minute safety boundary stopped the stage; work was still completing ([$now_progress], flat for $flat of the last moves), so this is a stage that ran out of time on this machine, not an observed product failure"
                return 1
            fi
            moves=$((moves + 1))
            # The filler needs the WAITING CLUE'S OWN SITE loaded, not a fresh
            # neighbourhood: it scans that site's bounds for a free container and
            # Storage only sees loaded squares. So the survivor goes back to the
            # site the clue belongs to, which is what a player does when a case
            # still has something at the warehouse.
            # A SITE THAT CANNOT SUPPLY WILL NOT START SUPPLYING. Returning to the
            # same site on every move is what the first version did, and a site
            # whose eligible containers are used up answers `no-containers` however
            # many times it is asked (20260921T133647). The design's own answers for
            # a clue with nowhere to go are a different neighbourhood, a carrier, or
            # expiry after three in-game days - so after three attempts at its own
            # site, the survivor moves on and lets those happen.
            if [ "$moves" -le 3 ]; then
                at="$(ev "return CFCamp.goToWaitingSite([[$cid]])")"
            else
                at="false	its own site was tried three times and answered no-containers"
            fi
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
    # ASK THE STORE WHICH CLUES ARE LEFT, rather than comparing two shell counters.
    # "only 5 of 3 clues could be played" (20260921T111236) was PLAYED overrunning a
    # ceiling that receded as the loop ran; freezing the ceiling fixed that arithmetic,
    # but a count still cannot say WHICH clue went missing and cannot tell a harness
    # miscount from a lost document. CFCamp.outstanding answers by document id.
    played_all() { # played_all LABEL CASEID
        local n rest; rest="$(ev "return CFCamp.outstanding([[$2]])")"
        n="$(field 1 "$rest")"
        findings+=("$1: $PLAYED clue(s) played of $CASE_LEFT offered; outstanding by id: ${n:-?} $(field 2 "$rest")")
        # A CLUE AT `unknown` IS NOT A PRODUCT FAILURE. An interrupted placement
        # parks a clue at "unknown" and the mod deliberately never replaces it
        # (GeneratedRuntime: "Interrupted placement is uncertain; no automatic
        # replacement"). The owner decided on 2026-09-22 that such a case stays
        # OPEN rather than completing with a gap, so the case genuinely cannot
        # finish and everything downstream of finishing cannot be reached.
        #
        # Reported once, as the condition it is. The run on 2026-09-21 turned this
        # single owner-sanctioned state into 27 product failures, which is how a
        # gate stops being readable.
        if grep -q "unknown" <<<"$(field 2 "$rest")"; then
            unexercised "$1: a clue is parked at \`unknown\` after an interrupted placement ($(field 2 "$rest")). The owner's decision of 2026-09-22 is that the case stays open, so it cannot finish and every stage that needs a finished case is out of reach in this world"
            WEDGED=1
            return 0
        fi
        if ! [ "${n:-1}" = 0 ]; then
            fail "$1: $n clue(s) of the case were never played: $(field 2 "$rest") (played $PLAYED, offered $CASE_LEFT)"
        elif [ "$PLAYED" != "$CASE_LEFT" ]; then
            harness "$1: every clue is accounted for by id, but the harness counted $PLAYED played against $CASE_LEFT offered - the counters disagree, the mod does not"
        fi
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
        # WHERE THE SURVIVOR WAS STANDING, in every placement finding. It was
        # invisible for the whole of the 2026-09-21 run, during which the harness
        # measured placement from the street without anybody being able to tell.
        findings+=("$1 placement (survivor in $(ev 'return CFCamp.indoors()')): $(field 3 "$p")")
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
        # A REJECTED WORLD NEEDS A NEW WORLD, NOT A NEW PROCESS.
        #
        # The first attempt is a genuine cold start: the build may have just
        # been installed, and only a launch is certain to load it. Every RETRY
        # after that is rejecting the world's contents, not the game, so
        # `pz.sh fresh` - back to the main menu, which reloads the mods, then
        # straight into a new world - does the same job without paying ~60 s
        # for a process launch. That is the same trade suite.sh made when it
        # went from 43 min 41 s to 35 min 8 s across its checks.
        #
        # The reload rounds below stay cold on purpose: a real save, quit and
        # continue IS what they test, and `fresh` would not be one.
        if [ "$worlds" -eq 1 ]; then
            start_cold "${start_args[@]}" || abort "the game did not reach a playable world"
        else
            "$PZ" fresh "${start_args[@]}" >/dev/null 2>&1 \
                || start_cold "${start_args[@]}" \
                || abort "the game did not reach a playable world"
        fi
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
        # No stop: the loop above asks the running game for a fresh world.
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
    played_all "case 1" "$case1"
    # A WORLD WHERE CASE 1 CANNOT FINISH CANNOT TEST THE CAMPAIGN. Everything from
    # here on - the closing questions, the answers, the steer, the archive, the
    # limit - needs a finished case 1. Grinding through them produced 27 downstream
    # failures and ninety minutes of evidence about one wedged clue (2026-09-21).
    # Stop here and say so; a fresh world is the answer, exactly as it is for a
    # case 1 with no document in the relay memo's week.
    if [ "$WEDGED" = 1 ]; then
        say "case 1 cannot finish in this world; stopping rather than failing every stage behind it"
        errors_seen+="$(mod_errors)"
        "$PZ" stop >/dev/null 2>&1
        report="$EVIDENCE/$first-campaign.txt"
        {
            echo "Linux campaign check $first: COULD NOT RUN"
            source_line
            echo "case 1: $case1"
            echo "outcome: ${#fails[@]} product failure(s), ${#harnesses[@]} harness failure(s), ${#unexercised[@]} stage(s) not exercised"
            echo "stopped after case 1: a clue parked at \`unknown\` after an interrupted"
            echo "placement. By the owner's decision of 2026-09-22 such a case stays OPEN,"
            echo "so it cannot finish and no stage behind it can be reached in this world."
            echo "Re-run to draw a fresh world."
            for f in "${findings[@]}"; do echo "FINDING: $f"; done
            for f in "${unexercised[@]}"; do echo "NOT EXERCISED: $f"; done
            for f in "${fails[@]}"; do echo "FAIL: $f"; done
            echo "errors inside the mod: $(grep -c . <<<"$errors_seen")"
        } > "$report.part"; mv "$report.part" "$report"
        cat "$report"
        exit 2
    fi
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
    # CASE 2 MUST CARRY CONTINUITY FROM CASE 1 - BY EITHER MECHANISM.
    #
    # DR-20260919-CONTINUITY: "continuity carries discovered evidence, not selected
    # opinions... The three closing questions are NOT restored as the steering
    # mechanism." A case built from a finding the survivor made carries `follows`,
    # and the closing-question answers wait for the case after. Demanding a STEER
    # specifically is the superseded P4-R113 rule, and it failed correct behaviour
    # twice: on 2026-09-22 the game logged "next case follows the finding recorded
    # in generated:1247366911:case" for the very case this called unsteered.
    #
    # What must hold is that case 2 continues from case 1 somehow, and that the
    # answers are eventually consumed - not that a particular mechanism won.
    cont2="$(ev "return CFCamp.continuityOf([[$case2]])")"
    kind2="$(field 1 "$cont2")"; from2="$(field 2 "$cont2")"
    findings+=("case 2 continuity: $kind2 from ${from2#generated:} - $(field 3 "$cont2")")
    case "$kind2" in
        follows|steer)
            [ "$from2" = "$case1" ] || fail "case 2 carries a $kind2 from ${from2#generated:}, not from case 1"
            ;;
        *)
            fail "case 2 carries no continuity from case 1 at all (neither a followed finding nor the answers): $(field 3 "$cont2")"
            ;;
    esac
    steer2="$(ev "return CFCamp.steerOf([[$case2]])")"
    if [ "$kind2" = steer ]; then
        # Only when the answers actually steered it are their contents meaningful.
        [ "$(field 2 "$steer2")/$(field 3 "$steer2")" = "two/records" ] || fail "case 2's steer is $(field 2 "$steer2")/$(field 3 "$steer2"), not two/records"
        [ "$(field 5 "$steer2")" = "$person2" ] || fail "case 2's first person is $(field 5 "$steer2"), not the returning $person2"
        [ "$(field 6 "$steer2")" = true ] || fail "case 2: the returning person could be given a second body"
    else
        unexercised "case 2 followed case 1's finding rather than its answers, which DR-20260919-CONTINUITY prefers, so the answer-steered shape (the returning person without a second body, the records contribution) was not exercised on case 2"
    fi
    # The contract is a COMPATIBLE CONTRIBUTION, not a particular document.
    # Story.build guarantees that a case steered toward a way carries at least one
    # optional source whose role is that way; which document that is, and what it
    # is called, belongs to whoever wrote the event. This used to demand a literal
    # "Duty log / " title and so failed the moment anybody rewrote the scenario.
    ways2="$(ev "return CFCamp.waysOf([[$case2]])")"
    if [ "$kind2" = steer ]; then
        grep -q "records" <<<"$ways2" || fail "case 2 offers no records contribution for the reading it leans on (ways: ${ways2:-none})"
    fi
    findings+=("case 2 ways offered: ${ways2:-none} (continuity: $kind2)")
    findings+=("case 2 ways offered: ${ways2:-none}")
    # One line, for whichever mechanism actually ran.
    if [ "$kind2" = steer ]; then
        [ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 2: the steered case was not logged exactly once"
    else
        [ "$(logged "next case follows the finding")" -ge 1 ] || fail "case 2 carries a followed finding but the mod never logged it"
    fi
    findings+=("case 2 clues: $(field 7 "$steer2")")
    # THE ANSWERS ARE CONSUMED BY WHICHEVER CASE USED THEM, and locked once used.
    # Asserting "used by case 2" assumes case 2 was the one that used them; when a
    # followed finding shaped case 2, the answers are still pending and must stay
    # CHANGEABLE - locking them then would lose the survivor's conclusions.
    used1="$(ev "return CFCamp.answersOf([[$case1]])" | field 5)"
    findings+=("case 1's answers after case 2: used by ${used1:-nothing}")
    if [ "$kind2" = steer ]; then
        [ "$used1" = "$case2" ] || fail "case 2 was built from case 1's answers but they are marked used by ${used1:-nothing}"
        [ "$(ev "return CFCamp.tryChange([[$case1]])" | field 1)" = false ] || fail "case 1's answers could still be changed after shaping case 2"
    else
        [ "$used1" = nil ] || [ -z "$used1" ] || fail "case 2 followed a finding, so case 1's answers were not used - yet they are marked used by ${used1}"
        unexercised "case 1's answers were still unused after case 2, so answer-locking was not exercised here"
    fi
    thought0="$(said 'What do I make of it?')"
    play_case "$case2"
    played_all "case 2" "$case2"
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
    # WHAT CASE 3 CARRIES DEPENDS ON WHAT CASE 2 TOOK.
    #   case 2 steered  -> case 1's answers are spent and case 2 left none, so
    #                      case 3 has nothing to continue from.
    #   case 2 followed -> case 1's answers are STILL pending, so case 3 is the
    #                      case they were deferred to, and receiving them is the
    #                      design working (DR-20260919-CONTINUITY), not a fault.
    # The old line demanded "unsteered" unconditionally and failed the mod for
    # obeying its own decision - twice.
    cont3="$(ev "return CFCamp.continuityOf([[$case3]])")"
    kind3="$(field 1 "$cont3")"; from3="$(field 2 "$cont3")"
    findings+=("case 3 continuity: $kind3 from ${from3#generated:} - $(field 3 "$cont3")")
    if [ "$kind2" = steer ]; then
        [ "$kind3" = none ] || fail "case 2 spent case 1's answers, so case 3 should carry no continuity, but it carries a $kind3 from ${from3#generated:}"
        [ "$(logged "Case shaped by the survivor's answers")" = 1 ] || fail "case 3 was logged as shaped by answers"
    else
        [ "$kind3" = steer ] || fail "case 2 followed a finding, so case 1's answers were deferred to case 3 - but case 3 carries $kind3"
        [ "$from3" = "$case1" ] || fail "case 3's steer comes from ${from3#generated:}, not from case 1 whose answers were deferred"
        findings+=("the deferred answers reached case 3, which is DR-20260919-CONTINUITY working: the followed finding took case 2 and the survivor's conclusions waited one case")
        [ "$(ev "return CFCamp.answersOf([[$case1]])" | field 5)" = "$case3" ] || fail "case 3 was built from case 1's answers but they are not marked used by it"
        [ "$(ev "return CFCamp.tryChange([[$case1]])" | field 1)" = false ] || fail "case 1's answers could still be changed after shaping case 3"
    fi
    play_case "$case3" 2
    [ "$PLAYED" = 2 ] || fail "case 3: $PLAYED of the 2 clues asked for were played (outstanding: $(ev "return CFCamp.outstanding([[$case3]])" | tr '\t' ' '))"
    stage "case 3, two clues"
    record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
    perf_note "case 3"

    # --- reload 2 ---------------------------------------------------------------
    reload_world "reload 2"
    [ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 2: the record changed"
    # AFTER THE RELOAD, CASE 3 CARRIES WHAT IT CARRIED BEFORE IT.
    # The old line demanded "unsteered" whatever had happened, and when case 2
    # followed a finding - which DR-20260919-CONTINUITY prefers - case 1's
    # answers are deferred to case 3, so a steer there is the design working.
    # Reported as a failure on 2026-09-22 against exactly that: "reload 2: case
    # 3 gained a steer (generated:1496913937:case)", which is case 1, which is
    # where the deferred answers were always going to land.
    cont3r="$(ev "return CFCamp.continuityOf([[$case3]])")"
    kind3r="$(field 1 "$cont3r")"; from3r="$(field 2 "$cont3r")"
    findings+=("reload 2: case 3 continuity is $kind3r from ${from3r#generated:}")
    if [ "$kind2" = steer ]; then
        [ "$kind3r" = none ] || fail "reload 2: case 2 spent case 1's answers, so case 3 should carry nothing, but carries a $kind3r from ${from3r#generated:}"
    else
        [ "$kind3r" = steer ] && [ "$from3r" = "$case1" ] \
            || fail "reload 2: case 3 should still carry case 1's deferred answers, but carries $kind3r from ${from3r#generated:}"
    fi
    # SAY WHAT IS ACTUALLY THERE. This read "lost their used mark", which is what
    # an empty field would mean - but the field is not empty when the steer lands
    # on the wrong case, it names that case. On 2026-09-21 it said "lost their used
    # mark" while the answers were plainly marked used by case 3, which reads as a
    # second, different defect and is not one.
    used_by="$(ev "return CFCamp.answersOf([[$case1]])" | field 5)"
    # AND THE ANSWERS ARE USED BY WHICHEVER CASE USED THEM. Demanding case 2
    # assumes case 2 was the one; when a followed finding took case 2, case 3
    # is the legitimate consumer and saying so is not a defect.
    expected_user="$case2"; [ "$kind2" = steer ] || expected_user="$case3"
    findings+=("reload 2: case 1's answers are used by ${used_by:-nothing}, expected ${expected_user#generated:} (case 2 continuity: $kind2)")
    if [ "$used_by" != "$expected_user" ]; then
        if [ -z "$used_by" ] || [ "$used_by" = nil ]; then
            fail "reload 2: case 1's answers lost their used mark entirely"
        else
            fail "reload 2: case 1's answers are marked used by ${used_by#generated:}, not by ${expected_user#generated:}"
        fi
    fi
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
    # STUBBING IS GONE. This stage used to exist to produce a fifth finished case
    # so the archive would turn the oldest into a rowless stub, and then check that
    # its clues still read Evidence / Old. The contract changed: test/case_archive
    # now asserts "all finished cases keep their rows" and "no archived case loses
    # its source rows" (stubs == 0). Nothing is ever stubbed.
    #
    # So the extra cases are no longer played to manufacture a stub - they cannot -
    # but for the property that outlived it: a case must keep coming after four
    # have finished, and every finished case's clues must still read Evidence / Old
    # and still offer the greyed "already noted" option rather than an empty menu.
    #
    # That matters for what this gate costs. Chasing a fifth finish is roughly
    # three extra playthroughs, and on the hidden Linux box a case is about
    # thirteen minutes.
    tried=""
    for extra in 1 2 3; do
        finished="$(field 2 "$(cases)")"
        [ "$finished" -ge "${CF_FINISHED_TARGET:-5}" ] 2>/dev/null && break
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
    # The current contract, asserted rather than merely reported: every finished
    # case keeps its rows. A stub appearing here is a regression, not a milestone.
    [ "$(field 2 "$arch")" = 0 ] || fail "$(field 2 "$arch") finished case(s) lost their source rows; the archive must keep every one"
    [ "$(field 3 "$arch")" -gt 0 ] 2>/dev/null || fail "the archive kept no source rows at all"
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
        findings+=("no case was stubbed, which is the contract: the archive retains every finished case's rows (test/case_archive asserts stubs == 0). The stub half of P4-R111 is NOT APPLICABLE, not unexercised - there is no longer a way to reach it, and a run that did reach it would have failed the assertion above")
    fi
    record="$(ev 'return CFReload.record()')"; bytes_before="$(bytes)"; parts_before="$(ev 'return CFReload.bytes()' | cut -f2)"
    reload_world "reload 3, the full archive in the save"
    [ "$(ev 'return CFReload.record()')" = "$record" ] || fail "reload 3: the record changed with the full archive in the save"
    arch2="$(ev 'return CFCamp.archive()')"
    findings+=("archive after the reload: $(field 1 "$arch2") full, $(field 2 "$arch2") stubbed, $(field 3 "$arch2") rows; $(field 5 "$arch2")")
    [ "$(field 2 "$arch2")" = "$(field 2 "$arch")" ] \
        || fail "reload 3: the archive changed across the reload ($(field 2 "$arch") stubs before, $(field 2 "$arch2") after)"
    refusals="$(run_log | grep -iE "refus|rejected|budget" | grep -v "ev=defer" | head -5 || true)"
    findings+=("refusals in the log of the session loaded with the full archive: $(grep -c . <<<"$refusals")")
    [ -z "$(tr -d '[:space:]' <<<"$refusals")" ] || fail "the session loaded with the full archive logged a refusal: $(head -2 <<<"$refusals" | cut -c1-200)"
    old_settled "after reload 3"
    stage "after reload 3, full archive"
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

    # The verdict answers one question only: DID THE MOD DO SOMETHING WRONG.
    # A harness defect is not a product failure and must not be reported as one; a
    # stage that was never reached is not a pass. All three are printed.
    verdict=PASS
    [ ${#harnesses[@]} -eq 0 ] || verdict="COULD NOT RUN"
    [ ${#fails[@]} -eq 0 ] || verdict=FAIL
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
        echo "outcome: ${#fails[@]} product failure(s), ${#harnesses[@]} harness failure(s), ${#unexercised[@]} stage(s) not exercised"
        for f in "${findings[@]}"; do echo "FINDING: $f"; done
        for f in "${unexercised[@]}"; do echo "NOT EXERCISED: $f"; done
        for f in "${harnesses[@]}"; do echo "HARNESS: $f"; done
        for f in "${fails[@]}"; do echo "FAIL: $f"; done
        echo "screenshot: dev/eval/linux/runs/$first-campaign.png (not committed)"
    } > "$report.part"; mv "$report.part" "$report"
    cat "$report"
    # 0 pass, 1 the mod failed, 2 the check could not run. A run that only ran out
    # of stages exits 0 with its NOT EXERCISED lines standing - the gate is not
    # passed by silence, and the report says which halves were never reached.
    [ "$verdict" = PASS ] && exit 0
    [ ${#fails[@]} -gt 0 ] && exit 1
    exit 2

}
cf_main "$@"