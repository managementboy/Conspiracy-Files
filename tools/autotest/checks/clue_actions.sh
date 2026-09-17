#!/usr/bin/env bash
# Clues are found by searching (P4-R132, stage 2): the wordless cue, "Look it
# over" and Inspect as timed actions.
#
#   tools/autotest/checks/clue_actions.sh
#
# In a fresh world, with the mod loaded normally:
#   (c) walking up to an unrecognised clue in a lit spot, in view, the survivor
#       gives the wordless cue once (the first of the save teaches), and coming
#       back to the same place gives nothing;
#   (a) the clue, carried, offers "Look it over" and nothing else from the mod;
#       choosing it runs a timed action (queue busy, progress bar) and only when
#       it completes is the clue recognised, with its title and Evidence;
#   (b) Inspect is then offered and runs as a timed action (queue busy while
#       the clue is not yet noted), completes, and the clue is noted; noting it
#       writes nothing over the head (no "Noted" voice line, the discovery hook
#       logs that nothing was said);
#   (d) no errors inside the mod.
# The cue's chance is fixed at 1 for the walk (Rules.debugChance): the check
# proves where and how often it fires, the unit test proves the odds.
# Real display only. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
say() { echo "clue-actions: $*" >&2; }
abort() { say "$*"; "$PZ" stop >/dev/null 2>&1; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
findings=(); note() { findings+=("$*"); say "$*"; }
FIRST="Hm? I should have a proper look around here."

claim_game || exit 2
start_cold || abort "the game did not reach a playable world"
id="$(session)"
wait_true 120 'ConspiracyFiles.GeneratedRuntime.metrics()~=nil' >/dev/null || abort "no case started"
ev -f "$REPO/tools/autotest/checks/clue_actions.lua" >/dev/null || abort "could not load the check's Lua"
note "mod version $(ev 'return CFAct.version()'); action times (look, inspect): $(ev 'return CFAct.actionTimes()' | tr '\t' ' ')"

deadline=$(( $(date +%s) + 240 ))
while :; do
    c="$(ev 'return CFAct.clues()')"
    n="$(cut -f1 <<<"$c")"; pending="$(cut -f3 <<<"$c")"
    is_number "$n" && [ "$n" -gt 0 ] && [ "$pending" = 0 ] && break
    [ "$(date +%s)" -lt "$deadline" ] || abort "clues never all placed: $c"
    sleep 2
done
note "clues: $(cut -f4 <<<"$c")"
note "game running: paused/speed=$(ev 'return CFAct.running()' | tr '\t' ' ')"
IFS=$'\t' read -r sx sy sz <<<"$(ev 'return CFAct.where()')"
before="$(ev 'return CFAct.cueState()')"
note "cue before the walk (said, suppressed, first given, places, last line, last doc): $(tr '\t' ' ' <<<"$before")"
said0="$(cut -f1 <<<"$before")"; first0="$(cut -f3 <<<"$before")"

# (c) The cue: walk up to a lit clue in view. While choosing one the chance is
# 0, so standing beside a clue to test its light cannot use up the cue.
ev 'return CFAct.cueChance(0)' >/dev/null
picked=""
for k in 1 2 3 4 5 6 7 8; do
    p="$(ev "return CFAct.pick($k)")"
    [ "$(cut -f1 <<<"$p")" = true ] || break
    ev 'return CFAct.cueReset()' >/dev/null
    ev "return CFAct.teleport($(cut -f3 <<<"$p"))" >/dev/null
    wait_true 20 'CFAct.loaded()' >/dev/null || continue
    seen=""
    for j in 1 2 3 4; do
        side="$(ev "return CFAct.side($j)")"
        [ "$(cut -f1 <<<"$side")" = true ] || break
        ev 'return CFAct.teleport('"$(cut -f2 <<<"$side")"','"$(cut -f3 <<<"$p" | cut -d, -f3)"')' >/dev/null
        sleep 1; ev 'return CFAct.faceClue()' >/dev/null; sleep 1
        seen="$(ev 'return CFAct.seenFrom()')"
        [ "$(cut -f1 <<<"$seen")" = true ] && break
    done
    if [ "$(cut -f1 <<<"$seen")" != true ]; then note "clue $k ($(cut -f2 <<<"$p")): not seeable for the cue from any open side (${seen:-no open side}); trying another"; continue; fi
    s="$(ev 'return CFAct.walkStart()')"
    [ "$(cut -f1 <<<"$s")" = true ] || { note "clue $k: no start square for a walk"; continue; }
    picked="$k"; break
done
[ -n "$picked" ] || abort "no clue lit and in view to walk up to"
say "walking to clue $picked ($(cut -f2 <<<"$p") at $(cut -f3 <<<"$p"), place $(cut -f4 <<<"$p")) from $(cut -f2 <<<"$s")"
sleep 2
ev 'return CFAct.cueReset()' >/dev/null
ev 'return CFAct.cueChance(1)' >/dev/null
# Only the clue walked to is weighed: a walk past another clue of the case would
# (rightly) give its cue and start the cooldown.
ev 'return CFAct.cueOnly(true)' >/dev/null
mid="$(ev 'return CFAct.cueState()')"; saidA="$(cut -f1 <<<"$mid")"
[ "$saidA" = "$said0" ] || note "a cue was said while choosing the clue: $(tr '\t' ' ' <<<"$mid")"
ev 'return CFAct.walk()' >/dev/null
walked=no
for _ in $(seq 60); do
    [ "$(ev 'return CFAct.arrived()' | cut -f1)" = true ] && { walked=yes; break; }
    sleep 0.5
done
if [ "$walked" = no ]; then
    note "the walk did not arrive (at $(ev 'return CFAct.arrived()' | cut -f2)); teleporting to the side instead"
    ev 'return CFAct.teleport('"$(cut -f2 <<<"$side")"','"$(cut -f3 <<<"$p" | cut -d, -f3)"')' >/dev/null
fi
cue=no
for _ in $(seq 20); do
    st="$(ev 'return CFAct.cueState()')"
    [ "$(cut -f1 <<<"$st")" -gt "$saidA" ] 2>/dev/null && { cue=yes; break; }
    sleep 0.5
done
note "after the walk (walked=$walked): $(tr '\t' ' ' <<<"$st")"
if [ "$cue" = yes ]; then
    line="$(cut -f5 <<<"$st")"; doc="$(cut -f6 <<<"$st")"
    [ "$doc" = "$(cut -f2 <<<"$p")" ] || fail "the cue was for $doc, not the clue walked to"
    if [ "$first0" = false ] && [ "$said0" = 0 ]; then
        [ "$line" = "$FIRST" ] || fail "the first cue of the save should teach, said: $line"
    else
        note "a cue was already given before the walk; this one said: $line"
        firstlog="$(run_log | grep 'cue said' | head -1 | sed 's/.*msg=//')"
        note "the first cue of this save: $firstlog"
        grep -qF "$FIRST" <<<"$firstlog" || fail "the first cue of the save did not teach: $firstlog"
    fi
else
    fail "no cue walking up to a lit clue in view"
fi
# Same place again: leave, clear the session memory and cooldown, come back.
ev "return CFAct.walkStart()" >/dev/null; sleep 2
ev 'return CFAct.cueReset()' >/dev/null
ev 'return CFAct.teleport('"$(cut -f2 <<<"$side")"','"$(cut -f3 <<<"$p" | cut -d, -f3)"')' >/dev/null
sleep 4
again="$(ev 'return CFAct.cueState()')"
note "back at the same place: $(tr '\t' ' ' <<<"$again")"
[ "$(cut -f1 <<<"$again")" = "$(cut -f1 <<<"$st")" ] || fail "a second cue at the same place"
[ "$(cut -f2 <<<"$again")" -gt "$(cut -f2 <<<"$st")" ] 2>/dev/null || fail "the second approach was not weighed (no suppression logged)"
cuelog="$(run_log | grep -c 'cue said' || true)"
note "cue lines in the log: said=$cuelog; last suppression: $(run_log | grep 'cue suppressed' | tail -1 | sed 's/.*msg=//')"
ev 'return CFAct.cueChance(nil)' >/dev/null
ev 'return CFAct.cueOnly(false)' >/dev/null

# (a) Look it over on the same clue, carried.
f="$(ev 'return CFAct.find()')"
[ "$(cut -f1 <<<"$f")" = true ] || abort "the clue is not in its container: $(cut -f2 <<<"$f")"
note "before: $(cut -f2- <<<"$f" | tr '\t' ' ')"
ev 'return CFAct.take()' >/dev/null
wait_true 20 'CFAct.carried()' >/dev/null || abort "the clue never reached the inventory"
m="$(ev 'return CFAct.menu()')"
note "menu on the carried unrecognised clue: $(cut -f2 <<<"$m")"
[ "$(cut -f2 <<<"$m")" = "Look it over" ] || fail "the carried unrecognised clue should offer only Look it over: $(cut -f2 <<<"$m")"
c="$(ev "return CFAct.choose('Look it over')")"
[ "$(cut -f1 <<<"$c")" = true ] || fail "Look it over could not be chosen: $(cut -f2 <<<"$c")"
busy=0 early=no maxdelta=0 bar=""
for _ in $(seq 80); do
    q="$(ev 'return CFAct.queue()')"
    r="$(cut -f5 <<<"$q")"
    [ "$(cut -f1 <<<"$q")" = CFLookItOver ] && { busy=$((busy+1)); bar="$(cut -f4 <<<"$q")"; [ "$r" = true ] && early=yes; maxdelta="$(cut -f2 <<<"$q")"; }
    [ "$r" = true ] && [ "$(cut -f1 <<<"$q")" != CFLookItOver ] && break
    sleep 0.2
done
lookms="$(ev 'return CFAct.since()')"
after="$(ev 'return CFAct.item_()')"
note "look it over: queue busy on $busy polls (last progress $maxdelta, progress bar forced=$bar), action ran (ok, ms) $(ev "return CFAct.ran('look')" | tr '\t' ' '), seen recognised ${lookms} ms after choosing; item now: $(tr '\t' ' ' <<<"$after")"
[ "$busy" -gt 0 ] || fail "Look it over never showed in the action queue"
[ "$early" = no ] || fail "recognised while the action was still running"
[ "$(cut -f3 <<<"$after")" = true ] || fail "not recognised after Look it over"
[ "$(cut -f2 <<<"$after")" = Evidence ] || fail "not categorised Evidence after Look it over: $(cut -f2 <<<"$after")"
[ "$(cut -f1 <<<"$after")" != "$(cut -f2 <<<"$f")" ] || fail "the item kept its plain name after Look it over"

# (b) Inspect as a timed action.
m="$(ev 'return CFAct.menu()')"
note "menu on the recognised clue: $(cut -f2 <<<"$m")"
[ "$(cut -f2 <<<"$m")" = "Inspect Investigation Evidence" ] || fail "the recognised carried clue should offer Inspect (not greyed) and no Look it over: $(cut -f2 <<<"$m")"
mark="$(run_log | wc -l)"
c="$(ev "return CFAct.choose('Inspect Investigation Evidence')")"
[ "$(cut -f1 <<<"$c")" = true ] || fail "Inspect could not be chosen: $(cut -f2 <<<"$c")"
busy=0 early=no
for _ in $(seq 80); do
    q="$(ev 'return CFAct.queue()')"
    i="$(cut -f6 <<<"$q")"
    [ "$(cut -f1 <<<"$q")" = CFInspectEvidence ] && { busy=$((busy+1)); [ "$i" = true ] && early=yes; }
    [ "$i" = true ] && [ "$(cut -f1 <<<"$q")" != CFInspectEvidence ] && break
    sleep 0.2
done
inspms="$(ev 'return CFAct.since()')"
note "inspect: queue busy on $busy polls, action ran (ok, ms) $(ev "return CFAct.ran('inspect')" | tr '\t' ' '), seen noted ${inspms} ms after choosing; item now: $(ev 'return CFAct.item_()' | tr '\t' ' ')"
[ "$busy" -gt 0 ] || fail "Inspect never showed in the action queue"
[ "$early" = no ] || fail "noted while the action was still running"
[ "$(ev 'return CFAct.inspected()')" = true ] || fail "not noted after Inspect"
sleep 2
window="$(run_log | tail -n +"$((mark + 1))")"
noted="$(grep -c 'Noted' <<<"$window" || true)"
hook="$(grep -c 'discovery evidence .*nothing said' <<<"$window" || true)"
said="$(grep 'ev=voice' <<<"$window" | grep -c 'msg="said' || true)"
note "voice while noting: 'Noted' lines=$noted, discovery hook said nothing=$hook, other voice lines said=$said ($(grep 'ev=voice' <<<"$window" | grep 'msg="said' | sed 's/.*msg=//' | head -3 | tr '\n' ';'))"
[ "$noted" = 0 ] || fail "a Noted line was shown while noting"
[ "$hook" -ge 1 ] 2>/dev/null || fail "the discovery hook did not log that nothing was said"
ev "return CFAct.teleport($sx,$sy,$sz)" >/dev/null

# (d) errors.
errors="$(mod_error_count)"; is_number "$errors" || errors=0
thrown="$(mod_errors | wc -l | tr -d ' ')"; is_number "$thrown" || thrown=0
[ $((errors + thrown)) = 0 ] || fail "$((errors + thrown)) errors inside the mod: $(mod_errors | head -3)"
"$PZ" shot "$RUNS/$id-clue-actions.png" >/dev/null 2>&1

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$EVIDENCE/$id-clue-actions.txt"
{
    echo "Linux clue actions check $id: $result"
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
