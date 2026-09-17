#!/usr/bin/env bash
# Drive a real Project Zomboid game on this Linux machine, unattended.
#
#   tools/autotest/pz.sh start [--hidden] [--console] [--mortal] [--at X,Y,Z]  fresh world
#   tools/autotest/pz.sh eval 'return getPlayer():getX()'   (or: eval -f file.lua)
#   tools/autotest/pz.sh shot out.png        screenshot of the game window
#   tools/autotest/pz.sh hold KEY SECS      hold a key (or mouse1..3) down in the game
#   tools/autotest/pz.sh log [N]             last N mod log lines of this run
#   tools/autotest/pz.sh status
#   tools/autotest/pz.sh fresh [ARGS]        new world in the running game (back to menu, mods reload)
#   tools/autotest/pz.sh start --continue [WORLD]  reload the last run's save (or WORLD)
#   tools/autotest/pz.sh stop [--save]       quit the game (force after 60s); --save saves first
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
# The real screen, captured BEFORE the stashed display can overwrite it.
# Without this the stash was a one-way door: a --hidden run leaves :99 in the
# file, the next run without --hidden reads it here, and the non-hidden branch
# below then finds DISPLAY already set and keeps it. So a run that never asked
# to be hidden got the virtual screen - and with it software OpenGL - silently
# and permanently (2026-09-13). That is why knox.sh had been amber and every
# perf number was measured on llvmpipe while an Iris Xe sat idle.
REAL_DISPLAY="${DISPLAY:-:0}"
# A run started with --hidden records its display, so later shot/stop/click
# commands reach the same (invisible) screen.
[ -f "$LOCAL/display" ] && export DISPLAY="$(cat "$LOCAL/display")"

say() { echo "pz: $*" >&2; }

# Virtual screen for --hidden: software OpenGL (llvmpipe), nothing on the
# owner's monitor. Left running between runs; it costs almost nothing idle.
#
# 9>&- matters. claim_game holds the game lock as file descriptor 9, and Xvfb
# outlives the run that started it, so without this it INHERITS that descriptor
# and keeps the lock for as long as it lives. The next claim_game then blocks
# until its 1200s timeout and the check dies having printed nothing - which is
# exactly what happened on 2026-09-13, and would have deadlocked every check
# in suite.sh after the first.
ensure_hidden_display() {
    if ! xdpyinfo -display "$HIDDEN_DISPLAY" >/dev/null 2>&1; then
        setsid nohup Xvfb "$HIDDEN_DISPLAY" -screen 0 1280x720x24 -nolisten tcp >/dev/null 2>&1 9>&- &
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

# A mod folder is COPIED, not linked. Lua loads happily through a symlink, but
# item scripts do not: the game rebuilt the path of every file under a linked
# mod as mods/<absolute path again> and gave up with FileNotFoundException, so
# media/scripts/*.txt silently never loaded and the organiser did not exist
# (organiser check, 2026-09-12). Copying costs a second per run and removes the
# whole class. --delete so a file removed in the repo disappears from the game.
sync_mod() { # sync_mod <source> <name>
    local dest="$ZOMBOID/mods/$2"
    if [ -L "$dest" ]; then rm -f "$dest"; fi
    mkdir -p "$dest"
    rsync -a --delete "$1/" "$dest/"
}

setup() {
    mkdir -p "$LOCAL/inbox" "$LOCAL/log" "$ZOMBOID/Lua" "$ZOMBOID/mods"
    sync_mod "$REPO/mod" ConspiracyFiles
    sync_mod "$REPO/tools/autotest/CFAutoTest" CFAutoTest
    link "$LOCAL/inbox/cf_inbox.lua" "$ZOMBOID/Lua/cf_inbox.lua"
    link "$CONSOLE" "$LOCAL/log/live-local.txt"
    # The Fieldnote hardware used to be a separate mod so the owner could look
    # at it before it replaced anything. It is part of ConspiracyFiles now, but
    # boot_test.sh had installed and enabled it here, and a leftover copy draws
    # a SECOND, blank device beside the real one - which every check happily
    # passed while the screenshot showed two PDAs (2026-09-13). A mod this
    # harness installed is a mod this harness has to be able to uninstall.
    rm -rf "$ZOMBOID/mods/FieldnoteTest"
    # New worlds take their mod list from default.txt.
    local d="$ZOMBOID/mods/default.txt"
    sed -i '/^ *mod = FieldnoteTest,$/d' "$d"
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

# The session file the helper mod reads on the main menu, and the id every log
# line of this run is found by. Prints the id. Shared by start and fresh.
write_session() { # write_session MORTAL CONTINUE_WORLD AT
    local mortal="$1" cont="$2" at="$3" id
    id="$(date +%Y%m%dT%H%M%S)"
    echo "$id" > "$LOCAL/session"
    {
        echo "session=$id"
        echo "expires=$(( $(date +%s) + 600 ))"
        [ -z "$mortal" ] || echo "mortal=1"
        [ -z "$cont" ] || { echo "mode=continue"; echo "world=$cont"; }
        if [ -n "$at" ]; then IFS=, read -r x y z <<<"$at"; echo "x=$x"; echo "y=$y"; echo "z=${z:-0}"; fi
    } > "$SESSION_FILE"
    echo "$id"
}

# Wait for this session's world to be playable: the helper mod's launch marker,
# "game loading took", the click past "click to start", then DevEval's ready
# line. Everything is found after THIS session's marker, so a game that has run
# earlier worlds (fresh) cannot be mistaken for ready. Shared by start and fresh.
wait_ready() { # wait_ready CONSOLE_FLAG
    local console="$1" deadline=$(( $(date +%s) + 300 )) stage=launch last_click=0 seen=""
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
                    # Check for a command every 200 ms instead of every second: each step
                    # of a check waits on this (owner, 2026-09-15). Set here, not in the mod,
                    # so the shipped build is unchanged.
                    CF_EVAL_TIMEOUT=15 "$REPO/tools/cf_eval.sh" 'ConspiracyFiles.DevEval.POLL_MS=200; return true' >/dev/null 2>&1 || say "could not speed up command polling"
                    # Remember the world, so `start --continue` can reload it.
                    CF_EVAL_TIMEOUT=15 "$REPO/tools/cf_eval.sh" 'return getWorld():getWorld()' 2>/dev/null | sed -n 's/^ok //p' > "$LOCAL/world"
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

# A new world in the game that is already running (owner, 2026-09-15: "to start
# a fresh game you dont have to start the whole game"). Going back to the main
# menu reloads every mod's Lua (owner, the same day), so the helper mod launches
# the new world from the menu just as after a cold start, and DevEval comes up
# fresh in it. Starts the game instead when none is running, when it does not
# answer, or when it runs on a different display than the one asked for.
# `--continue` needs a real save and reload, so fresh refuses it.
cmd_fresh() {
    local at="" hidden="" console="" mortal="" args=("$@")
    while [ $# -gt 0 ]; do
        case "$1" in
            --at) at="${2:?--at X,Y,Z}"; shift 2 ;;
            --hidden) hidden=1; shift ;;
            --console) console=1; shift ;;
            --mortal) mortal=1; shift ;;
            --continue) say "fresh cannot continue a save; use start --continue"; exit 2 ;;
            *) say "unknown option $1"; exit 2 ;;
        esac
    done
    local p running_hidden=""
    p="$(pid)"
    [ -f "$LOCAL/display" ] && running_hidden=1
    if [ -z "$p" ]; then cmd_start "${args[@]}"; return; fi
    if [ "$running_hidden" != "$hidden" ] || ! CF_EVAL_TIMEOUT=10 "$REPO/tools/cf_eval.sh" 'return true' >/dev/null 2>&1; then
        say "the running game cannot be reused; starting it again"
        cmd_stop
        cmd_start "${args[@]}"
        return
    fi
    setup
    local last id
    last="$(cat "$LOCAL/session" 2>/dev/null || true)"
    id="$(write_session "$mortal" "" "$at")"
    # Every run is found in the log by its session id, and the log is no longer
    # wiped between worlds: two ids in the same second would find the old world.
    if [ "$id" = "$last" ]; then sleep 1; id="$(write_session "$mortal" "" "$at")"; fi
    say "new world in the running game, session $id"
    CF_EVAL_TIMEOUT=5 "$REPO/tools/cf_eval.sh" 'getCore():exitToMenu(); return true' >/dev/null 2>&1 || true
    wait_ready "$console"
}

cmd_start() {
    local at="" hidden="" console="" mortal="" cont="" p
    while [ $# -gt 0 ]; do
        case "$1" in
            --at) at="${2:?--at X,Y,Z}"; shift 2 ;;
            --hidden) hidden=1; shift ;;
            --console) console=1; shift ;;
            --mortal) mortal=1; shift ;;
            --continue)
                if [ $# -ge 2 ] && [[ "$2" != --* ]]; then cont="$2"; shift
                else cont="$(cat "$LOCAL/world" 2>/dev/null)"; fi
                [ -n "$cont" ] || { say "no world to continue: none recorded yet"; exit 2; }
                shift ;;
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
        export DISPLAY="$REAL_DISPLAY"
    fi
    local id; id="$(write_session "$mortal" "$cont" "$at")"
    say "launching session $id"
    # setsid -f: the launcher must not keep this script's stdout open, or
    # anything reading our output (a pipe, a test runner) never sees EOF.
    # 9>&- for the same reason Xvfb needs it above, and this one is worse.
    # claim_game holds the machine lock as file descriptor 9; the game
    # inherited it, so the GAME held the lock for as long as it lived. A game
    # that outlives its check - one that ignores the quit and has to be
    # terminated, which happens - then blocks every later check at
    # `flock -w 1200 9` until the timeout, and a suite of them falls over one
    # after another having printed nothing.
    #
    # Found 2026-09-13 by fuser on the lock file: the holders were the launcher,
    # the game, this script's own bash, and a flock that had been waiting
    # thirteen minutes. The Xvfb case was fixed months earlier and the comment
    # above it describes this exact failure; the game launch was simply missed.
    (cd "$GAME" && exec setsid -f ./projectzomboid.sh -debug -nosteam </dev/null >/dev/null 2>&1 9>&-)

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
                    # Check for a command every 200 ms instead of every second: each step
                    # of a check waits on this (owner, 2026-09-15). Set here, not in the mod,
                    # so the shipped build is unchanged.
                    CF_EVAL_TIMEOUT=15 "$REPO/tools/cf_eval.sh" 'ConspiracyFiles.DevEval.POLL_MS=200; return true' >/dev/null 2>&1 || say "could not speed up command polling"
                    # Remember the world, so `start --continue` can reload it.
                    CF_EVAL_TIMEOUT=15 "$REPO/tools/cf_eval.sh" 'return getWorld():getWorld()' 2>/dev/null | sed -n 's/^ok //p' > "$LOCAL/world"
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
    # --save: write the save explicitly and wait for it before quitting, so a
    # reload test never depends on what quitting happens to do.
    if [ "${1:-}" = "--save" ]; then
        CF_EVAL_TIMEOUT=30 "$REPO/tools/cf_eval.sh" 'saveGame(); return true' >/dev/null 2>&1 || say "save command did not answer"
        sleep 5
    fi
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

# Hold a key, or a mouse button ("mouse1".."mouse3"), down in the game window
# for SECONDS - the survivor's own hand. Lua cannot do this: walking and aiming
# are read from the real keyboard and mouse in Java, and they are what
# interrupts a timed action (stopOnWalk / stopOnRun / stopOnAim). Real events
# after activating the window, for the same reason click_window moves the real
# pointer: the game ignores synthetic per-window events.
cmd_hold() { # cmd_hold KEY SECONDS
    local k="${1:?key}" s="${2:-1}" w X Y; w="$(window)"
    [ -n "$w" ] || { say "no game window"; return 1; }
    eval "$(xdotool getmouselocation --shell)"
    xdotool windowactivate --sync "$w" 2>/dev/null || true
    case "$k" in
        mouse[123]) xdotool mousemove --window "$w" 640 360 mousedown "${k#mouse}" 2>/dev/null || true ;;
        *)          xdotool keydown "$k" 2>/dev/null || true ;;
    esac
    sleep "$s"
    case "$k" in
        mouse[123]) xdotool mouseup "${k#mouse}" 2>/dev/null || true; xdotool mousemove "$X" "$Y" 2>/dev/null || true ;;
        *)          xdotool keyup "$k" 2>/dev/null || true ;;
    esac
    echo "held $k for ${s}s"
}

case "${1:-}" in
    start) shift; cmd_start "$@" ;;
    fresh) shift; cmd_fresh "$@" ;;
    eval) shift; exec "$REPO/tools/cf_eval.sh" "$@" ;;
    stop) shift; cmd_stop "$@" ;;
    shot) shift; cmd_shot "$@" ;;
    hold) shift; cmd_hold "$@" ;;
    log) since_launch | grep -E '\[CF' | sed 's/^.*> //' | tail -n "${2:-30}" ;;
    status) p="$(pid)"; if [ -n "$p" ]; then echo "game: running pid $p"; else echo "game: not running"; fi; echo "session: $(cat "$LOCAL/session" 2>/dev/null || echo none)" ;;
    *) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 2 ;;
esac
