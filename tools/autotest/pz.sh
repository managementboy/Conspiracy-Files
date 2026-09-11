#!/usr/bin/env bash
# Drive a real Project Zomboid game on this Linux machine, unattended.
#
#   tools/autotest/pz.sh start [--hidden] [--console] [--mortal] [--at X,Y,Z]  fresh world
#   tools/autotest/pz.sh eval 'return getPlayer():getX()'   (or: eval -f file.lua)
#   tools/autotest/pz.sh shot out.png        screenshot of the game window
#   tools/autotest/pz.sh log [N]             last N mod log lines of this run
#   tools/autotest/pz.sh status
#   tools/autotest/pz.sh stop                quit the game (force after 60s)
#
# Owner decision 2026-09-11: Claude may auto-test on this machine, and these
# runs count as evidence. Attended Windows sessions keep their own acceptance
# role. See docs/management/LINUX_AUTOTEST.md.
#
# How it fits together: `start` writes a short-lived session file, links the
# CFAutoTest helper mod, and launches the game with -debug -nosteam. The helper
# starts a new world through the game's debug-scenario launcher. The one thing
# Lua cannot do is dismiss "click to start" after loading, so this script
# clicks the game window once. From then on everything is Lua: `eval` reuses
# tools/cf_eval.sh, pointed at this machine's own Zomboid folder.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
GAME="${PZ_GAME:-$HOME/.steam/steam/steamapps/common/ProjectZomboid}"
ZOMBOID="${PZ_ZOMBOID:-$HOME/Zomboid}"
LOCAL="$REPO/dev/eval/linux"
SESSION_FILE="$ZOMBOID/Lua/cf_autotest_session.txt"
CONSOLE="$ZOMBOID/console.txt"
export CF_EVAL_DIR="$LOCAL" CF_EVAL_LOG_DIR="$LOCAL/log"
HIDDEN_DISPLAY=":99"
# A run started with --hidden records its display, so later shot/stop/click
# commands reach the same (invisible) screen.
[ -f "$LOCAL/display" ] && export DISPLAY="$(cat "$LOCAL/display")"

say() { echo "pz: $*" >&2; }

# Virtual screen for --hidden: software OpenGL (llvmpipe), nothing on the
# owner's monitor. Left running between runs; it costs almost nothing idle.
ensure_hidden_display() {
    if ! xdpyinfo -display "$HIDDEN_DISPLAY" >/dev/null 2>&1; then
        setsid nohup Xvfb "$HIDDEN_DISPLAY" -screen 0 1280x720x24 -nolisten tcp >/dev/null 2>&1 &
        for _ in $(seq 20); do xdpyinfo -display "$HIDDEN_DISPLAY" >/dev/null 2>&1 && break; sleep 0.5; done
    fi
    xdpyinfo -display "$HIDDEN_DISPLAY" >/dev/null 2>&1 || { say "could not start Xvfb on $HIDDEN_DISPLAY"; exit 1; }
}
pid() { pgrep -f '[P]rojectZomboid64' | head -1 || true; }
# Log lines written after this run's launch marker.
since_launch() {
    local s; s="$(cat "$LOCAL/session" 2>/dev/null || echo none)"
    awk -v m="[CF-AUTOTEST] launching session=$s" 'index($0, m) { f = 1 } f' "$CONSOLE" 2>/dev/null
}

link() { # link <target> <name>: create or confirm, never overwrite a real folder
    if [ -L "$2" ]; then [ "$(readlink "$2")" = "$1" ] || ln -sfn "$1" "$2"
    elif [ -e "$2" ]; then say "$2 exists and is not a link; leaving it alone"; exit 1
    else ln -s "$1" "$2"; fi
}

setup() {
    mkdir -p "$LOCAL/inbox" "$LOCAL/log" "$ZOMBOID/Lua" "$ZOMBOID/mods"
    link "$REPO/mod" "$ZOMBOID/mods/ConspiracyFiles"
    link "$REPO/tools/autotest/CFAutoTest" "$ZOMBOID/mods/CFAutoTest"
    link "$LOCAL/inbox/cf_inbox.lua" "$ZOMBOID/Lua/cf_inbox.lua"
    link "$CONSOLE" "$LOCAL/log/live-local.txt"
    # New worlds take their mod list from default.txt.
    local d="$ZOMBOID/mods/default.txt"
    for m in ConspiracyFiles CFAutoTest; do
        grep -qE "mod = $m," "$d" || sed -i "/^mods$/,/^}/ s/^{$/{\n    mod = $m,/" "$d"
    done
}

window() { local p; p="$(pid)"; [ -n "$p" ] && xdotool search --pid "$p" 2>/dev/null | tail -1 || true; }

# One click in the game window, pointer put back afterwards. The game polls
# whether the button is down once per frame, so an instant click is missed:
# hold it for a moment.
click_window() {
    local w X Y; w="$(window)"; [ -n "$w" ] || return 0
    eval "$(xdotool getmouselocation --shell)"
    xdotool windowactivate --sync "$w" 2>/dev/null || true
    xdotool mousemove --window "$w" 640 360 mousedown 1 2>/dev/null || true
    sleep 0.3
    xdotool mouseup 1 2>/dev/null || true
    xdotool mousemove "$X" "$Y" 2>/dev/null || true
}

cmd_start() {
    local at="" hidden="" console="" mortal="" p
    while [ $# -gt 0 ]; do
        case "$1" in
            --at) at="${2:?--at X,Y,Z}"; shift 2 ;;
            --hidden) hidden=1; shift ;;
            --console) console=1; shift ;;
            --mortal) mortal=1; shift ;;
            *) say "unknown option $1"; exit 2 ;;
        esac
    done
    p="$(pid)"; [ -z "$p" ] || { say "game already running (pid $p); run stop first"; exit 1; }
    setup
    if [ -n "$hidden" ]; then
        ensure_hidden_display
        export DISPLAY="$HIDDEN_DISPLAY"
        echo "$DISPLAY" > "$LOCAL/display"
    else
        rm -f "$LOCAL/display"
        export DISPLAY="${DISPLAY:-:0}"
    fi
    local id; id="$(date +%Y%m%dT%H%M%S)"
    echo "$id" > "$LOCAL/session"
    {
        echo "session=$id"
        echo "expires=$(( $(date +%s) + 600 ))"
        [ -z "$mortal" ] || echo "mortal=1"
        if [ -n "$at" ]; then IFS=, read -r x y z <<<"$at"; echo "x=$x"; echo "y=$y"; echo "z=${z:-0}"; fi
    } > "$SESSION_FILE"
    say "launching session $id"
    # setsid -f: the launcher must not keep this script's stdout open, or
    # anything reading our output (a pipe, a test runner) never sees EOF.
    (cd "$GAME" && exec setsid -f ./projectzomboid.sh -debug -nosteam </dev/null >/dev/null 2>&1)

    local deadline=$(( $(date +%s) + 300 )) stage=launch last_click=0 seen=""
    while [ "$(date +%s)" -lt "$deadline" ]; do
        if [ -n "$(pid)" ]; then seen=1
        elif [ -n "$seen" ]; then say "game exited during start"; rm -f "$SESSION_FILE"; exit 1; fi
        local out; out="$(since_launch)"
        case "$stage" in
            launch) [ -n "$out" ] && { stage=loading; say "new world is loading"; } ;;
            loading) grep -q "game loading took" <<<"$out" && { stage=click; say "$(grep -o 'game loading took.*' <<<"$out" | tail -1)"; } ;;
            click)
                if grep -qF "[CF-EVAL] ready" <<<"$out"; then
                    rm -f "$SESSION_FILE"
                    [ -n "$console" ] || CF_EVAL_TIMEOUT=15 "$REPO/tools/cf_eval.sh" 'return CFAutoTest.hideConsole()' >/dev/null 2>&1 || say "could not hide the Lua console"
                    grep -E '\[CF-SELFCHECK\]|version=|\[CF\] v=' <<<"$out" | sed 's/^.*> //' | head -3 >&2 || true
                    say "ready; use: tools/autotest/pz.sh eval 'return getPlayer():getX()'"
                    return 0
                fi
                if [ $(( $(date +%s) - last_click )) -ge 4 ]; then click_window; last_click=$(date +%s); fi ;;
        esac
        sleep 1
    done
    say "start timed out at stage '$stage'; see: tools/autotest/pz.sh shot /tmp/pz.png"
    rm -f "$SESSION_FILE"
    exit 2
}

cmd_stop() {
    local p; p="$(pid)"
    rm -f "$SESSION_FILE"
    [ -n "$p" ] || { say "not running"; return 0; }
    CF_EVAL_TIMEOUT=10 "$REPO/tools/cf_eval.sh" 'getCore():quitToDesktop()' >/dev/null 2>&1 || true
    for _ in $(seq 60); do [ -n "$(pid)" ] || { say "stopped"; return 0; }; sleep 1; done
    say "did not quit within 60s; terminating"
    kill -TERM "$p" 2>/dev/null || true
    for _ in $(seq 20); do [ -n "$(pid)" ] || { say "stopped"; return 0; }; sleep 1; done
    say "still running; killing"
    kill -KILL "$p" 2>/dev/null || true
}

cmd_shot() {
    local out="${1:-$LOCAL/shot.png}" w; w="$(window)"
    [ -n "$w" ] || { say "no game window"; exit 1; }
    import -window "$w" "$out" && echo "$out"
}

case "${1:-}" in
    start) shift; cmd_start "$@" ;;
    eval) shift; exec "$REPO/tools/cf_eval.sh" "$@" ;;
    stop) cmd_stop ;;
    shot) shift; cmd_shot "$@" ;;
    log) since_launch | grep -E '\[CF' | sed 's/^.*> //' | tail -n "${2:-30}" ;;
    status) p="$(pid)"; if [ -n "$p" ]; then echo "game: running pid $p"; else echo "game: not running"; fi; echo "session: $(cat "$LOCAL/session" 2>/dev/null || echo none)" ;;
    *) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 2 ;;
esac
