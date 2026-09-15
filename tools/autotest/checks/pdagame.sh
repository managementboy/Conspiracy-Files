#!/usr/bin/env bash
# The PDA played, in a real Project Zomboid, across a real save and restart.
#
#   tools/autotest/checks/pdagame.sh [--hidden]
#
# GENUINE IN-GAME TEST, not a mocked environment. It boots a world, finds the
# organiser the survivor was issued, and drives the device through the same
# entry points a player's hands reach:
#
#   * opening it by putting it in the MAIN HAND, because that is the switch -
#     not by calling OrganiserScreen.open(), which would be testing our own
#     function rather than the feature;
#   * every program opened by TAPPING ITS ICON on the launcher;
#   * the six controls, each proved by an observable effect, including the two
#     unassigned keys proved to do nothing;
#   * a note and a to-do written, the sizes changed, then SAVE, QUIT and
#     RELOAD through the main menu's Continue, and everything checked again;
#   * the stores deliberately corrupted, and the device required to open and
#     draw every program anyway;
#   * the organiser removed from the inventory with the screen up, and
#     reissued afterwards.
#
# What it does NOT cover, and why: there is no multiplayer path to test. This
# mod sends no commands and transmits no table anywhere; every feature refuses
# to run as a client or a server (test/multiplayer_guards.lua holds twenty of
# them to that). Ownership sync, dedicated-server behaviour and simultaneous
# players are not applicable rather than untested.
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "pdagame: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }
load_probe() { ev -f "$HERE/pdagame.lua" >/dev/null; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
world="$(cat "$REPO/dev/eval/linux/world")"
export CF_EVAL_TIMEOUT=120
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.OrganiserScreen~=nil' || abort "the mod never loaded"
load_probe || abort "could not load the probe"
# Not compared across the restart below: the game truncates console.txt when
# it starts, so the only honest question is whether the mod logged any errors
# in the session that is running now.

# --- obtaining it ----------------------------------------------------------
iss="$(ev 'return CFGAME.issued()')"
[ "$(f 1 <<<"$iss")" = true ] || fail "no organiser was issued: $(f 2 <<<"$iss")"
say "issued: $(f 2 <<<"$iss") marked=$(f 3 <<<"$iss") favourite=$(f 4 <<<"$iss") readable=$(f 5 <<<"$iss")"
[ "$(f 3 <<<"$iss")" = true ] || fail "the issued organiser carries no mark, so it will be issued again"

# --- the hand is the switch ------------------------------------------------
out="$(ev 'return CFGAME.takeOut()')"
[ "$(f 2 <<<"$out")" = true ] || fail "putting the organiser in the main hand did not open Knox.OS"
say "in hand: open=$(f 2 <<<"$out") on=$(f 3 <<<"$out")"
away="$(ev 'return CFGAME.putAway()')"
[ "$(f 2 <<<"$away")" = true ] || fail "taking the organiser out of the hand did not close Knox.OS"
# And again, because once is not a lifecycle.
ev 'return CFGAME.takeOut()' >/dev/null
reopen="$(ev 'return CFGAME.takeOut()')"
[ "$(f 2 <<<"$reopen")" = true ] || fail "the device would not reopen after being put away"

# Either hand (owner, Windows, 2026-09-14); a two-handed weapon puts it away.
ev 'return CFGAME.putAway()' >/dev/null
off="$(ev 'return CFGAME.offHand()')"
say "left hand: open=$(f 2 <<<"$off") a two-handed weapon closed it=$(f 3 <<<"$off")"
[ "$(f 4 <<<"$off")" = true ] || fail "the check could not give the survivor a two-handed weapon: $off"
[ "$(f 2 <<<"$off")" = true ] || fail "the organiser in the left hand did not open Knox.OS: $off"
[ "$(f 3 <<<"$off")" = true ] || fail "a two-handed weapon did not put the organiser away: $off"
ev 'return CFGAME.takeOut()' >/dev/null

# --- every screen, by tapping its icon -------------------------------------
tour="$(ev 'return CFGAME.tour()')"
[ "$(f 1 <<<"$tour")" = true ] && say "toured $(f 2 <<<"$tour") programs: $(f 3 <<<"$tour")" \
    || fail "screen tour: $(f 2 <<<"$tour")"

# --- the controls ----------------------------------------------------------
ctl="$(ev 'return CFGAME.controls()')"
[ "$(f 1 <<<"$ctl")" = true ] && say "controls: $(f 2 <<<"$ctl")" || fail "controls: $(f 2 <<<"$ctl")"

# Live in the program: a new find shows without leaving it, DATES gives the
# clock's hour, and an entry opens its record (owner, Windows, 2026-09-14).
live="$(ev 'return CFGAME.liveRecords()')"
say "live records: recorded=$(f 1 <<<"$live") refreshed=$(f 3 <<<"$live") entry='$(f 4 <<<"$live")' tapped=$(f 6 <<<"$live") opened=$(f 7 <<<"$live") back=$(f 8 <<<"$live")"
[ "$(f 1 <<<"$live")" = true ] || fail "the check could not record a discovery: $live"
[ "$(f 3 <<<"$live")" = true ] || fail "a new discovery did not refresh the open program's list: $live"
[ "$(f 5 <<<"$live")" = true ] || fail "DATES did not show the clock's hour for a discovery made now: $live"
[ "$(f 6 <<<"$live")" = true ] || fail "the day view drew no tappable entry for the discovery: $live"
[ "$(f 7 <<<"$live")" = true ] || fail "tapping a DATES entry did not open its record: $live"
[ "$(f 8 <<<"$live")" = true ] || fail "BACK from a record opened in DATES did not return to the day: $live"
[ "$(f 9 <<<"$live")" = true ] || fail "the day view's week did not hold the open day: $live"
case "$(f 10 <<<"$live")" in ''|nil|false) fail "tapping another day in the week did not open that day: $live";; esac

# --- placement across screen sizes ----------------------------------------
for res in "1920 1080" "3200 1894" "2560 1440" "1280 720"; do
    set -- $res
    pl="$(ev "return CFGAME.placement($1,$2)")"
    [ "$(f 4 <<<"$pl")" = true ] || fail "at ${1}x${2} the device would sit off the left edge"
    [ "$(f 5 <<<"$pl")" = true ] || fail "at ${1}x${2} the device is taller than the screen ($(f 3 <<<"$pl"))"
    say "at ${1}x${2}: scale $(f 2 <<<"$pl")x, $(f 3 <<<"$pl")"
done

# --- write something of the survivor's own, and set the sizes --------------
wr="$(ev 'return CFGAME.write("overnight")')"
say "wrote: note=$(f 2 <<<"$wr") todo=$(f 3 <<<"$wr") $(f 4 <<<"$wr")"
ev 'return CFGAME.setSizes(2,3)' >/dev/null
sz_before="$(ev 'return CFGAME.sizes()')"
state_before="$(ev 'return CFGAME.countState()' | f 2)"
say "before save: scale=$(f 2 <<<"$sz_before") font=$(f 3 <<<"$sz_before") $state_before"

# --- save, quit, restart, and check it all came back ----------------------
"$PZ" stop --save >/dev/null 2>&1
"$PZ" start --continue "$world" "${start_args[@]}" >/dev/null 2>&1 || abort "the save would not reload"
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.OrganiserScreen~=nil' || abort "the mod never loaded after restart"
load_probe || abort "could not reload the probe"
ev 'return CFGAME.takeOut()' >/dev/null
state_after="$(ev 'return CFGAME.countState()' | f 2)"
sz_after="$(ev 'return CFGAME.sizes()')"
say "after restart: scale=$(f 2 <<<"$sz_after") font=$(f 3 <<<"$sz_after") $state_after"
[ "$state_after" = "$state_before" ] || fail "the survivor's notes and to-dos changed across a restart: $state_before -> $state_after"
[ "$(f 2 <<<"$sz_after")" = "$(f 2 <<<"$sz_before")" ] || fail "the machine size did not survive a restart: $(f 2 <<<"$sz_before") -> $(f 2 <<<"$sz_after")"
[ "$(f 3 <<<"$sz_after")" = "$(f 3 <<<"$sz_before")" ] || fail "the text size did not survive a restart: $(f 3 <<<"$sz_before") -> $(f 3 <<<"$sz_after")"
reopened="$(ev 'return CFGAME.takeOut()')"
[ "$(f 2 <<<"$reopened")" = true ] || fail "the device would not open after a restart"
tour2="$(ev 'return CFGAME.tour()')"
[ "$(f 1 <<<"$tour2")" = true ] || fail "after a restart the screen tour failed: $(f 2 <<<"$tour2")"

# --- inventory: remove it while it is open, then get another --------------
rm_="$(ev 'return CFGAME.removeItem()')"
[ "$(f 2 <<<"$rm_")" = true ] || say "note: the device was not open before removal"
[ "$(f 3 <<<"$rm_")" = true ] || fail "removing the organiser from the inventory left Knox.OS on screen"
[ "$(f 4 <<<"$rm_")" = true ] || fail "the organiser was not actually removed"
say "removed while open: screen closed=$(f 3 <<<"$rm_")"
re="$(ev 'return CFGAME.reissue()')"
[ "$(f 1 <<<"$re")" = true ] || fail "a replacement organiser was not issued: $(f 2 <<<"$re")"

# --- item transfer: stash it in a bag -------------------------------------
st="$(ev 'return CFGAME.stashAndReissue()')"
if [ "$(f 1 <<<"$st")" = true ]; then
    say "stashed in $(f 5 <<<"$st"): still found=$(f 2 <<<"$st"), organisers $(f 3 <<<"$st")->$(f 4 <<<"$st")"
    [ "$(f 2 <<<"$st")" = true ] || fail "an organiser inside a bag is not found, so another will be issued on every reload"
    [ "$(f 3 <<<"$st")" = "$(f 4 <<<"$st")" ] || fail "issuing again while the organiser was in a bag added a duplicate: $(f 3 <<<"$st") -> $(f 4 <<<"$st")"
else
    say "note: could not test stashing ($(f 2 <<<"$st"))"
fi

# --- corrupted stores ------------------------------------------------------
ev 'return CFGAME.corrupt()' >/dev/null
ev 'ConspiracyFiles.OrganiserScreen.close()' >/dev/null
cor="$(ev 'return CFGAME.survivesCorruption()')"
[ "$(f 1 <<<"$cor")" = true ] && say "corrupted stores: $(f 2 <<<"$cor")" \
    || fail "corrupted stores broke the device: $(f 2 <<<"$cor")"

# --- and the log -----------------------------------------------------------
new_errors="$(mod_error_count)"
say "log: $new_errors mod error lines in this session"
[ "$new_errors" -eq 0 ] || fail "the mod logged $new_errors error lines during play"

"$PZ" shot "$RUNS/$(session)-pdagame.png" >/dev/null 2>&1
"$PZ" stop

id="$(session)"
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
outf="$EVIDENCE/$(date +%Y%m%dT%H%M%S)-pdagame.txt"
{
    echo "$verdict pdagame - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "issued:    $(f 2 <<<"$iss") marked=$(f 3 <<<"$iss") readable=$(f 5 <<<"$iss")"
    echo "hand:      opens in hand=$(f 2 <<<"$out"), closes when put away=$(f 2 <<<"$away")"
    echo "screens:   $(f 2 <<<"$tour") programs toured by tapping icons: $(f 3 <<<"$tour")"
    echo "controls:  $(f 2 <<<"$ctl")"
    echo "restart:   $state_before -> $state_after; sizes $(f 2 <<<"$sz_before")/$(f 3 <<<"$sz_before") -> $(f 2 <<<"$sz_after")/$(f 3 <<<"$sz_after")"
    echo "inventory: removed while open -> closed=$(f 3 <<<"$rm_"); reissued=$(f 2 <<<"$re")"
    echo "transfer:  stashed in a bag -> still found=$(f 2 <<<"$st"), organisers $(f 3 <<<"$st")->$(f 4 <<<"$st")"
    echo "corrupted: $(f 2 <<<"$cor")"
    echo "log:       $new_errors new mod error lines"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$outf.part"; mv "$outf.part" "$outf"
say "written: $outf"
echo "Linux PDA gameplay check $id: $verdict"
cat "$outf"
[ ${#fails[@]} -eq 0 ]
