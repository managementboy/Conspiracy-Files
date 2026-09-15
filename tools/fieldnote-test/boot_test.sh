#!/usr/bin/env bash
# The organiser's case in a real game: the Fieldnote hardware contract, proved
# on the organiser window the player actually uses.
#
#   tools/fieldnote-test/boot_test.sh [--hidden]
#
# Runs on the LINUX dev machine through the same harness as every other check
# (tools/autotest/pz.sh): claims the game, starts a fresh world, opens the
# organiser and drives it through the eval channel.
#
# Until 2026-09-15 this opened a stand-alone Fieldnote window left over from
# the test mod, so it proved a window no player ever saw. That window is gone.
#
# PASS needs: the organiser opens and draws its case with and without wear; at
# every machine size every key resolves at both ends of its half-open box and
# not one pixel past, and a press there lands on that key; every legend letter
# has a picture at every machine size; the rocker divider row is inactive; a
# key's face takes its pressed colour while held and restores after; a click
# dispatches exactly once; a release off the key - on the glass or on another
# key - dispatches nothing; no hardware primitive enters the LCD; labels clear
# their icons; and no errors inside the mod. A screenshot lands beside the run
# data. Exit 0 pass, 1 fail, 2 could not run.
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/../autotest/lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "fieldnote: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
export CF_EVAL_TIMEOUT=90
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.OrganiserScreen~=nil and Fieldnote~=nil and Fieldnote.Panel~=nil' \
    || abort "the organiser never loaded"
ev -f "$HERE/probe.lua" >/dev/null || abort "could not load the probe"
opened="$(ev 'return CFFN.open()')"
[ "$(f 1 <<<"$opened")" = true ] || abort "the organiser would not open: $opened"

state="$(ev 'return CFFN.state()')"
[ "$(f 1 <<<"$state")" = true ] || abort "no organiser: $state"
say "loaded: version=$(f 2 <<<"$state") machine sizes=$(f 3 <<<"$state") window=$(f 4 <<<"$state") device=$(f 5 <<<"$state")"
"$PZ" shot "$RUNS/$(session)-fieldnote.png" >/dev/null 2>&1

r="$(ev 'return CFFN.render()')"
[ "$(f 1 <<<"$r")" = true ] || fail "render threw: $(f 2 <<<"$r")"
on="$(ev 'return CFFN.primitiveCount(true)' | f 2)"; off="$(ev 'return CFFN.primitiveCount(false)' | f 2)"
[ "${on:-0}" -gt "${off:-0}" ] || fail "wear toggle changes nothing: with=$on without=$off"
say "primitives: with wear=$on without=$off"

h="$(ev 'return CFFN.hitboxes()')"
[ "$(f 1 <<<"$h")" = true ] || fail "hitboxes: $(f 2 <<<"$h")"
say "hitboxes: $(f 2 <<<"$h")"

lg="$(ev 'return CFFN.legends()')"
[ "$(f 1 <<<"$lg")" = true ] || fail "legends: $(f 2 <<<"$lg")"
say "legends: $(f 2 <<<"$lg")"

g="$(ev 'return CFFN.rockerGap()')"
[ "$(f 2 <<<"$g")" = rocker_up ] || fail "y=576 is not rocker_up: $g"
[ "$(f 3 <<<"$g")" = nil ] || fail "y=577 should be inactive: $g"
[ "$(f 4 <<<"$g")" = rocker_down ] || fail "y=578 is not rocker_down: $g"
say "rocker: y576=$(f 2 <<<"$g") y577=$(f 3 <<<"$g") y578=$(f 4 <<<"$g")"

for ctl in C09 C10 C11 C12 rocker_up rocker_down; do
    p="$(ev "return CFFN.pressColour('$ctl')")"
    [ "$(f 1 <<<"$p")" = true ] || { fail "press colour $ctl: $(f 2 <<<"$p")"; continue; }
    normal="$(f 3 <<<"$p")"; held="$(f 4 <<<"$p")"; back="$(f 5 <<<"$p")"
    [ "$(f 6 <<<"$p")" = "$ctl" ] || fail "$ctl pressed, but the organiser reported $(f 6 <<<"$p") held"
    [ "$(f 7 <<<"$p")" = nil ] || fail "$ctl still held after the press time: $(f 7 <<<"$p")"
    [ "$held" != "$normal" ] || fail "$ctl ($(f 2 <<<"$p")) did not change colour when held"
    [ "$back" = "$normal" ] || fail "$ctl did not restore on release: $normal -> $back"
done
say "press colours: change while held, restore after, all six controls"

c="$(ev 'return CFFN.click("C09")')"
[ "$(f 2 <<<"$c")" = C09 ] || fail "C09 not down during the click: $c"
[ "$(f 3 <<<"$c")" = 1 ] || fail "C09 click dispatched $(f 3 <<<"$c") times, not once"
say "click: $(f 4 <<<"$c")"
dd="$(ev 'return CFFN.dragOff("C10", "C12")')"
[ "$(f 1 <<<"$dd")" = true ] || fail "drag off: $(f 2 <<<"$dd")"
[ "$(f 2 <<<"$dd")" = 0 ] || fail "a drag off C10 still dispatched when released on the glass"
[ "$(f 3 <<<"$dd")" = 0 ] || fail "a drag off C10 still dispatched when released on C12"
[ "$(f 4 <<<"$dd")" = nil ] || fail "C10 stayed down after a drag off: $dd"
say "drag off the key: dispatches nothing on the glass or on another key"

lb="$(ev 'return CFFN.labels()')"
[ "$(f 1 <<<"$lb")" = true ] || fail "labels overlap their icons: $(f 2 <<<"$lb")"
say "labels: $(f 2 <<<"$lb")"

l="$(ev 'return CFFN.lcd()')"
[ "$(f 3 <<<"$l")" = 0 ] || fail "hardware enters the LCD: $(f 4 <<<"$l")"
say "lcd: $(f 2 <<<"$l"), $(f 3 <<<"$l") hardware intrusions"

ev 'return CFFN.restore()' >/dev/null
errors="$(mod_errors)"
[ -z "$errors" ] || fail "errors inside the mod: $errors"
id="$(session)"
"$PZ" stop

verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$(date +%Y%m%dT%H%M%S)-fieldnote.txt"
{
    echo "$verdict fieldnote - $(date -Is)"
    source_line
    renderer_line
    echo "session: $id"
    echo "loaded:   $state"
    echo "hitboxes: $h"
    echo "legends:  $lg"
    echo "lcd:      $l"
    echo "labels:   $lb"
    for x in "${fails[@]:-}"; do [ -n "$x" ] && echo "FAIL: $x"; done
} > "$out.part" && mv "$out.part" "$out"
say "written: $out"
echo "Linux fieldnote check $id: $verdict"
cat "$out"
[ "$verdict" = PASS ] && exit 0 || exit 1
