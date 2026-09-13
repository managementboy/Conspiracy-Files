#!/usr/bin/env bash
# The PDA over a long session, in a real game: does anything accumulate, and
# does it survive being used badly?
#
#   tools/autotest/checks/pdalife.sh [--hidden]
#
# THIS IS A GENUINE IN-GAME TEST. Every question it asks is about state held by
# the game's own registries - the UI manager's element list, the Events tables,
# ModData - so none of it can be answered by a mocked Lua environment. A mock
# would be asserting that our own stubs behave, which is worth nothing here.
#
# PASS needs: hundreds of open/close cycles leaving no window, no growth in the
# UI manager and no new event handlers; every program opened and backed out of
# repeatedly without error; every size combination drawing; the device
# surviving deliberate abuse (controls while asleep and mid-boot, taps past
# every edge, impossible row indices, note churn, double close); and no new
# errors in the log.
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "pdalife: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

CYCLES="${CF_PDA_CYCLES:-200}"
CHURN="${CF_PDA_CHURN:-40}"

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
export CF_EVAL_TIMEOUT=180
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.OrganiserScreen~=nil' || abort "the mod never loaded"
ev -f "$HERE/pdalife.lua" >/dev/null || abort "could not load the probe"

# Errors logged by the mod before any of this, so only NEW ones count.
before_errors="$(mod_error_count)"

handlers0="$(ev 'return CFLIFE.handlerCounts()')"
say "handlers at rest: $(f 2 <<<"$handlers0")  ($(f 3 <<<"$handlers0"))"
stores0="$(ev 'return CFLIFE.stores()')"
say "stores at rest: $(f 2 <<<"$stores0")"

# --- hundreds of open/close cycles -----------------------------------------
cyc="$(ev "return CFLIFE.cycle($CYCLES)")"
if [ "$(f 1 <<<"$cyc")" = true ]; then
    say "cycled $(f 2 <<<"$cyc") times: errors=$(f 3 <<<"$cyc"), $(f 4 <<<"$cyc"), $(f 5 <<<"$cyc"), closed=$(f 6 <<<"$cyc")"
    say "memory: $(f 7 <<<"$cyc")"
    # REPORTED, NOT ASSERTED, and the control says why. collectgarbage here
    # cannot force a full JVM collection and every UI panel is a Java object,
    # so growth cannot tell "still referenced" from "not yet swept". The leak
    # assertions above are the reachability ones - the UI manager's count and
    # the window being nil - which is what a leak actually looks like.
    ctl="$(ev 'return CFLIFE.heapControl(200)')"
    say "memory control (no device work, same call): $(f 2 <<<"$ctl")"
    [ "$(f 3 <<<"$cyc")" = 0 ] || fail "open/close raised $(f 3 <<<"$cyc") errors over $CYCLES cycles"
    [ "$(f 6 <<<"$cyc")" = true ] || fail "the device is still open after its last close"
    # UI manager growth: the same window closed and reopened must not leave
    # elements behind.
    growth="$(f 4 <<<"$cyc")"
    from="${growth#ui }"; to="${from#*->}"; from="${from%%->*}"
    if [ "$from" != nil ] && [ "$to" != nil ]; then
        [ "$to" -le "$((from + 2))" ] || fail "UI manager grew from $from to $to over $CYCLES cycles (elements leaking)"
    else
        say "note: UI manager size not readable on this build; leak check skipped"
    fi
    # Event handlers must be identical before and after: nothing re-registers.
    hb="$(f 5 <<<"$cyc" | sed 's/.*before\[\(.*\)\] after\[.*/\1/')"
    ha="$(f 5 <<<"$cyc" | sed 's/.*after\[\(.*\)\]$/\1/')"
    [ "$hb" = "$ha" ] || fail "event handlers changed over $CYCLES cycles: [$hb] -> [$ha]"
else
    fail "cycling: $(f 2 <<<"$cyc")"
fi

# --- rapid screen changes ---------------------------------------------------
ch="$(ev "return CFLIFE.churn($CHURN)")"
if [ "$(f 1 <<<"$ch")" = true ]; then
    say "churn $(f 2 <<<"$ch") rounds: $(f 3 <<<"$ch") screens visited, $(f 4 <<<"$ch") errors, back at launcher=$(f 6 <<<"$ch")"
    [ "$(f 4 <<<"$ch")" = 0 ] || fail "screen churn raised $(f 4 <<<"$ch") errors"
    [ "$(f 5 <<<"$ch")" = true ] || fail "a record was left open after backing out"
else
    fail "churn: $(f 2 <<<"$ch")"
fi

# --- every size combination -------------------------------------------------
sz="$(ev 'return CFLIFE.sizes()')"
[ "$(f 1 <<<"$sz")" = true ] && say "sizes: $(f 2 <<<"$sz") of 9 device/font combinations drew" \
    || fail "sizes: $(f 2 <<<"$sz")"
[ "$(f 2 <<<"$sz")" = 9 ] || fail "not every size combination drew: $(f 2 <<<"$sz")/9"

# --- deliberate abuse -------------------------------------------------------
ab="$(ev 'return CFLIFE.abuse()')"
[ "$(f 1 <<<"$ab")" = true ] && say "abuse: $(f 2 <<<"$ab")" || fail "abuse: $(f 2 <<<"$ab")"

# --- and it still works afterwards -----------------------------------------
ev 'ConspiracyFiles.OrganiserScreen.open()' >/dev/null
still="$(ev 'local w=ConspiracyFiles.OrganiserScreen.window; if not w then return false,"gone" end; local ok,e=pcall(function() w:prerender() end); return ok,tostring(e)')"
[ "$(f 1 <<<"$still")" = true ] || fail "the device no longer draws after all of that: $(f 2 <<<"$still")"

handlers1="$(ev 'return CFLIFE.handlerCounts()')"
stores1="$(ev 'return CFLIFE.stores()')"
say "handlers after: $(f 2 <<<"$handlers1")"
say "stores after:   $(f 2 <<<"$stores1")"
[ "$(f 2 <<<"$handlers0")" = "$(f 2 <<<"$handlers1")" ] || fail "handler counts differ end to end: [$(f 2 <<<"$handlers0")] -> [$(f 2 <<<"$handlers1")]"

after_errors="$(mod_error_count)"
new_errors=$((after_errors - before_errors))
[ "$new_errors" -le 0 ] || fail "$new_errors new error lines logged by the mod during this run"
mod_errors="$( { grep -c 'ERROR.*ConspiracyFiles\|Exception.*ConspiracyFiles' "$CONSOLE" 2>/dev/null || true; } | head -1 )"
mod_errors="${mod_errors:-0}"
say "log: $new_errors new mod error lines, $mod_errors engine exceptions naming the mod"

"$PZ" shot "$RUNS/$(session)-pdalife.png" >/dev/null 2>&1
"$PZ" stop

id="$(session)"
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$EVIDENCE/$(date +%Y%m%dT%H%M%S)-pdalife.txt"
{
    echo "$verdict pdalife - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "cycles:   $CYCLES open/close - errors=$(f 3 <<<"$cyc"), $(f 4 <<<"$cyc"), closed=$(f 6 <<<"$cyc")"
    echo "handlers: [$(f 2 <<<"$handlers0")] -> [$(f 2 <<<"$handlers1")]"
    echo "memory:   $(f 7 <<<"$cyc") [reported, not asserted: see pdalife.lua]"
    echo "control:  $(f 2 <<<"$ctl") with no device work, same call"
    echo "churn:    $CHURN rounds, $(f 3 <<<"$ch") screens, $(f 4 <<<"$ch") errors"
    echo "sizes:    $(f 2 <<<"$sz")/9 device-and-font combinations drew"
    echo "abuse:    $(f 2 <<<"$ab")"
    echo "stores:   $(f 2 <<<"$stores0")  ->  $(f 2 <<<"$stores1")"
    echo "log:      $new_errors new mod error lines"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$out"
say "written: $out"
echo "Linux PDA lifecycle check $id: $verdict"
cat "$out"
[ ${#fails[@]} -eq 0 ]
