#!/usr/bin/env bash
# Clues are found by searching (P4-R132, stage 1: search and recognise).
#
#   tools/autotest/checks/clue_search.sh
#
# In a fresh world, with the mod's own ClueSearch loaded normally:
#   (a) the "Clues" Search Focus exists, is translated, is offered by the
#       Investigate Area window, and cannot spawn anything (no loot, no rolls);
#   (b) with Search Mode on near a placed clue, an icon of our own class sits on
#       its container's square;
#   (c) standing next to it, the game's spotting spots it within a bounded time
#       and the runtime recognises it; its question mark then remains while
#       Investigate Area is on, and turning the tool off and on recreates it
#       (timed with no focus, and with "Clues" on a second clue when there is
#       one);
#   (d) no errors inside the mod;
#   (e) the game's own forage icons are counted with no focus and with "Clues":
#       none is a Clues icon, and the focus does not multiply them;
#   (f) THE MAP MARK: with a pen in the inventory, a spotted clue noted WHERE IT
#       LIES is marked on the world map at the clue's own square and building -
#       not where the survivor stood - and the record's MAP NOTE line says so;
#       then the same for a clue picked up first, which is the path that always
#       worked (owner, 2026-09-18: "I have a pen and found a clue. are we not
#       writing them to the map anymore?").
# Real display only. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "clue-search: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
SPOT_LIMIT=120

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || abort "no case started"
ev -f "$REPO/tools/autotest/checks/clue_search.lua" >/dev/null || abort "could not load the check's Lua"

# (a) The focus.
f="$(ev 'return CFClue.focus()')"
IFS=$'\t' read -r defined text offered zones items picked rolls create focusmax registered <<<"$f"
note "focus: defined=$defined text='$text' offered=$offered registered=$registered; loot zones=$zones items=$items picked=$picked rolls=$rolls chanceToCreateIcon=$create focusChanceMax=$focusmax"
[ "$defined" = true ] || fail "no Clues category in forageSystem.catDefs"
[ "$text" = Clues ] || fail "IGUI_SearchMode_Categories_Clues does not resolve: $text"
[ "$offered" = true ] || fail "the Investigate Area window does not offer Clues"
[ "$items" = 0 ] && [ "$picked" = 0 ] && [ "$rolls" = 0 ] || fail "the Clues category could spawn something: items=$items picked=$picked rolls=$rolls"

# Every clue placed.
deadline=$(( $(date +%s) + 240 ))
while :; do
    c="$(ev 'return CFClue.clues()')"
    n="$(cut -f1 <<<"$c")"; pending="$(cut -f3 <<<"$c")"
    is_number "$n" && [ "$n" -gt 0 ] && [ "$pending" = 0 ] && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "clues never all placed: $c"
    sleep 2
done
note "clues: $(cut -f4 <<<"$c")"

note "game running: paused=$(ev 'return CFClue.running()' | tr '\t' ' ')"
# (e) The game's own icons with no focus, then with Clues, outdoors near the start.
IFS=$'\t' read -r sx sy sz <<<"$(ev 'return CFClue.where()')"
o="$(ev 'return CFClue.outdoors()')"
[ "$(cut -f1 <<<"$o")" = true ] || fail "no outdoor square for the forage count: $(cut -f2 <<<"$o")"
note "forage count taken outdoors at $(cut -f2 <<<"$o")"
sleep 3
measure() { # measure FOCUS
    ev "return CFClue.setFocus('$1')" >/dev/null
    ev 'return CFClue.searchOn()' >/dev/null
    for _ in $(seq 20); do sleep 1; ev 'return CFClue.searchOn()' >/dev/null; done
    ev 'return CFClue.forage()'
    ev 'return CFClue.searchOff()' >/dev/null
    sleep 2
}
IFS=$'\t' read -r none_total none_clues none_active none_world none_stash none_ours none_cats <<<"$(measure None)"
IFS=$'\t' read -r foc_total foc_clues foc_active foc_world foc_stash foc_ours foc_cats <<<"$(measure Clues)"
note "forage icons, no focus: total=$none_total active=$none_active world=$none_world stash=$none_stash clue icons=$none_ours clues-category=$none_clues [$none_cats]"
note "forage icons, Clues focus: total=$foc_total active=$foc_active world=$foc_world stash=$foc_stash clue icons=$foc_ours clues-category=$foc_clues [$foc_cats]"
is_number "$none_total" && is_number "$foc_total" || fail "forage counts unreadable: '$none_total' '$foc_total'"
[ "${none_total:-0}" -gt 0 ] 2>/dev/null || fail "no forage icons at all with no focus: the comparison proves nothing"
[ "${none_clues:-x}" = 0 ] && [ "${foc_clues:-x}" = 0 ] || fail "a forage icon of the Clues category appeared: $none_clues / $foc_clues"
if is_number "$none_total" && is_number "$foc_total"; then
    [ "$foc_total" -le $(( none_total * 3 / 2 + 10 )) ] || fail "the Clues focus multiplied forage icons: $none_total -> $foc_total"
fi

# (b)+(c) Spot a clue: n=1 with no focus, n=2 with Clues.
spot() { # spot N FOCUS
    local n="$1" focus="$2" p icon t0 t1 r items
    p="$(ev "return CFClue.pick($n)")"
    [ "$(cut -f1 <<<"$p")" = true ] || { note "clue $n: none to pick ($(cut -f2 <<<"$p"))"; return 3; }
    say "clue $n: $(cut -f2 <<<"$p") at $(cut -f3 <<<"$p"), focus $focus"
    ev 'return CFClue.searchOff()' >/dev/null
    ev 'return CFClue.approach()' >/dev/null
    wait_true 20 'CFClue.loaded()' >/dev/null || { fail "clue $n: its square never loaded"; return 1; }
    items="$(ev 'return CFClue.items()')"
    note "clue $n before: $(cut -f2 <<<"$items")"
    local k stood=no
    for k in 1 2 3 4; do
        [ "$(ev "return CFClue.stand($k)" | cut -f1)" = true ] || break
        sleep 2
        [ "$(ev 'return CFClue.settled()' | cut -f1)" = true ] && { stood=yes; break; }
    done
    [ "$stood" = yes ] || note "clue $n: could not stand on an open side of it; spotting from where the game put the survivor"
    local lit; lit="$(ev 'return CFClue.lit()')"
    if [ "$(cut -f1 <<<"$lit")" != true ]; then
        note "clue $n: too dark there for the game's spotting (light $(cut -f2 <<<"$lit"), cutoff 0.50); trying another"
        return 2
    fi
    ev "return CFClue.setFocus('$focus')" >/dev/null
    t0="$(date +%s.%N)"
    ev 'return CFClue.searchOn()' >/dev/null
    # (b) the icon, on the container square, our class.
    icon=""
    for _ in $(seq 20); do
        icon="$(ev 'return CFClue.icon()')"
        [ "$(cut -f1 <<<"$icon")" = true ] && break
        ev 'return CFClue.searchOn()' >/dev/null; sleep 0.5
    done
    [ "$(cut -f1 <<<"$icon")" = true ] || { fail "clue $n: no clue icon with Search Mode on ($(cut -f2- <<<"$icon"))"; return 1; }
    [ "$(cut -f2 <<<"$icon")" = true ] || fail "clue $n: the icon is not our class"
    [ "$(cut -f3 <<<"$icon")" = true ] || fail "clue $n: the icon is not on the container square"
    # (c) spotted and recognised, bounded.
    local deadline=$(( $(date +%s) + SPOT_LIMIT )) seen=no
    while [ "$(date +%s)" -lt "$deadline" ]; do
        r="$(ev 'return CFClue.recognised()')"
        [ "$(cut -f1 <<<"$r")" = true ] && { seen=yes; break; }
        ev 'return CFClue.searchOn()' >/dev/null
        icon="$(ev 'return CFClue.icon()')"
        sleep 0.5
    done
    t1="$(date +%s.%N)"
    local secs; secs="$(awk -v a="$t0" -v b="$t1" 'BEGIN{printf "%.1f", b-a}')"
    if [ "$seen" = yes ]; then
        note "clue $n ($focus): spotted and recognised after ${secs} s (limit ${SPOT_LIMIT} s)"
        # Regression: recognition used to start an eight-second timer which
        # permanently removed the locator. Keep the mode on past that boundary,
        # then switch it off and on: an unresolved clue must remain searchable.
        sleep 10
        icon="$(ev 'return CFClue.icon()')"
        note "clue $n icon 10 s after spotting: $(tr '\t' ' ' <<<"$icon")"
        [ "$(cut -f1 <<<"$icon")" = true ] || fail "clue $n: its unresolved icon vanished while Investigate Area stayed on"
        ev 'return CFClue.searchOff()' >/dev/null
        sleep 1
        icon="$(ev 'return CFClue.icon()')"
        [ "$(cut -f1 <<<"$icon")" = false ] || fail "clue $n: its icon stayed up with Investigate Area off"
        ev 'return CFClue.searchOn()' >/dev/null
        for _ in $(seq 20); do
            icon="$(ev 'return CFClue.icon()')"
            [ "$(cut -f1 <<<"$icon")" = true ] && break
            sleep 0.25
        done
        note "clue $n icon after re-search: $(tr '\t' ' ' <<<"$icon")"
        [ "$(cut -f1 <<<"$icon")" = true ] || fail "clue $n: re-enabling Investigate Area did not restore its unresolved icon"
        items="$(ev 'return CFClue.items()')"
        note "clue $n after: $(cut -f2 <<<"$items")"
    else
        fail "clue $n ($focus): not spotted within ${SPOT_LIMIT} s; last icon state: $(tr '\t' ' ' <<<"$icon"); $(tr '\t' ' ' <<<"$r")"
    fi
    ev 'return CFClue.searchOff()' >/dev/null
    return 0
}
ev 'return CFClue.running()' >/dev/null
spot_lit() { # spot_lit FOCUS: the first clue lit enough to be spotted
    local n rc
    for n in 1 2 3 4 5 6 7 8; do
        spot "$n" "$1"; rc=$?
        [ "$rc" = 2 ] && continue
        [ "$rc" = 3 ] && break
        return 0
    done
    fail "no clue lit enough to spot with focus $1"
}
spot_lit None

# --- (f) THE MAP MARK for a clue found by searching -------------------------
# Owner, 2026-09-18, with the world map open: "I have a pen and found a clue.
# are we not writing them to the map anymore?" A clue recognised by searching
# and noted WHERE IT LIES is never picked up, and the marker module learned a
# finding location only from a pickup - so the pen had nothing to write. Both
# halves are asked here: noted in place, and noted after being picked up.
mark_stage() { # mark_stage in-place|carried
    local how="$1" it m note_line n=0
    [ "$(ev 'return CFClue.recognised()' | cut -f1)" = true ] || { note "marks ($how): the clue was not recognised; nothing to note"; return 3; }
    it="$(ev 'return CFClue.item()')"
    [ "$(cut -f1 <<<"$it")" = true ] || { fail "marks ($how): no item for the spotted clue: $(cut -f2 <<<"$it")"; return 1; }
    note "marks ($how): '$(cut -f2 <<<"$it")' at $(cut -f3 <<<"$it"), pen in the inventory=$(ev 'return CFClue.pen()' | cut -f1)"
    if [ "$how" = carried ]; then
        ev 'return CFClue.take()' >/dev/null
        wait_true 25 'CFClue.carried()' || { fail "marks (carried): the clue never reached the inventory"; return 1; }
        m="$(ev 'return CFClue.noteCarried()')"
    else
        m="$(ev 'return CFClue.noteInPlace()')"
    fi
    [ "$(cut -f1 <<<"$m")" = true ] || { fail "marks ($how): the note was refused: $(cut -f2 <<<"$m")"; return 1; }
    wait_true 30 'CFClue.noted()' || { fail "marks ($how): the clue was never noted"; return 1; }
    # Noting resolves the locator. It must not come back on the next search.
    ev 'return CFClue.searchOn()' >/dev/null
    sleep 1
    local resolved_icon; resolved_icon="$(ev 'return CFClue.icon()')"
    [ "$(cut -f1 <<<"$resolved_icon")" = false ] \
        || fail "marks ($how): the inspected clue's icon came back: $(tr '\t' ' ' <<<"$resolved_icon")"
    ev 'return CFClue.searchOff()' >/dev/null
    # The marker worker writes on its own tick, once a second.
    for n in $(seq 20); do
        m="$(ev 'return CFClue.mark()')"
        [ "$(cut -f5 <<<"$m")" = true ] && break
        sleep 1
    done
    IFS=$'\t' read -r found at stood line written ink same house clue_house away <<<"$m"
    note "marks ($how): record=$found at $at, survivor at $stood, clue's square $(cut -f3 <<<"$it"); written=$written ink=$ink; on the clue's own square=$same; building of the mark=$house, of the clue=$clue_house"
    note "marks ($how): MAP NOTE line reads '$line'"
    [ "$found" = true ] || { fail "marks ($how): no finding location was recorded at all ($at)"; return 1; }
    [ "$same" = true ] || fail "marks ($how): the mark is at $at, but the clue is at $(cut -f3 <<<"$it")"
    [ "$house" = "$clue_house" ] || fail "marks ($how): the mark is in building $house, the clue in $clue_house"
    [ "$away" = true ] || fail "marks ($how): the mark is on the square the survivor was standing on ($stood)"
    [ "$written" = true ] || fail "marks ($how): with a pen in the inventory the mark was never written ($line)"
    note_line="$(ev 'return CFClue.mapNote()')"
    [ "$(cut -f1 <<<"$note_line")" = true ] || fail "marks ($how): the record has no MAP NOTE line: $(cut -f2 <<<"$note_line")"
    [ "$(cut -f2 <<<"$note_line")" = "Finding location marked on your world map." ] \
        || fail "marks ($how): the record's MAP NOTE line reads '$(cut -f2 <<<"$note_line")'"
    note "marks ($how): written/pending/missing = $(ev 'return CFClue.marks()' | tr '\t' '/')"
    return 0
}
mark_stage in-place

spot_lit Clues
mark_stage carried
ev 'return CFClue.teleport('"$sx,$sy,$sz"')' >/dev/null

note "counters (icons added, dropped, spots, recognitions, search mode re-enabled): $(ev 'return CFClue.counters()' | tr '\t' ' ')"

# (d) errors.
errors="$(mod_error_count)"; is_number "$errors" || errors=0
thrown="$(mod_errors | wc -l | tr -d ' ')"; is_number "$thrown" || thrown=0
[ $((errors + thrown)) = 0 ] || fail "$((errors + thrown)) errors inside the mod: $(mod_errors | head -3)"
"$PZ" shot "$RUNS/$id-clue-search.png" >/dev/null 2>&1

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-clue-search.txt"
{
    echo "Linux clue search check $id: $result"
    source_line
    for f in "${findings[@]}"; do echo "FINDING: $f"; done
    echo "errors inside the mod: $((errors + thrown))"
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
