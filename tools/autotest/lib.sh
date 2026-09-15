# Shared by the tools/autotest check scripts. Source it; do not run it.
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PZ="$REPO/tools/autotest/pz.sh"
CONSOLE="${PZ_ZOMBOID:-$HOME/Zomboid}/console.txt"
RUNS="$REPO/dev/eval/linux/runs"
EVIDENCE="$REPO/docs/management/evidence/linux-autotest"
mkdir -p "$RUNS" "$EVIDENCE"

session() { cat "$REPO/dev/eval/linux/session"; }
# ONE RUN AT A TIME, enforced rather than remembered.
#
# There is one game machine and two Claude sessions, and a check that starts
# while another is still playing either refuses ("game already running") or,
# worse, talks to a game the other run then stops - which cost four false
# failures on 2026-09-12 before anyone noticed the pattern. So every check
# claims the machine first and waits its turn; the lock is released when the
# script exits, however it exits, because the shell closes the descriptor.
#
# claim_game [SECONDS]  wait up to SECONDS (default 20 minutes) for the machine.
CF_LOCK="${PZ_ZOMBOID:-$HOME/Zomboid}/.cf-autotest.lock"
claim_game() {
    local wait_for="${1:-1200}"
    exec 9>"$CF_LOCK" || { echo "cannot write the lock at $CF_LOCK" >&2; return 1; }
    if ! flock -w "$wait_for" 9; then
        # Say WHO is holding it. This used to time out after twenty minutes
        # having printed nothing but "another run has held the game", which is
        # indistinguishable from a legitimately busy machine - and on
        # 2026-09-13 the holder was the GAME ITSELF, which had inherited this
        # very descriptor at launch and kept the lock after outliving its
        # check. Every later check queued behind a process nobody suspected.
        # pz.sh closes fd 9 on launch now; this names the holder if anything
        # else ever manages the same trick.
        echo "another run has held the game for over ${wait_for}s; not starting" >&2
        if command -v fuser >/dev/null 2>&1; then
            echo "the lock at $CF_LOCK is held by:" >&2
            fuser -v "$CF_LOCK" >&2 2>&1 || true
        fi
        return 1
    fi
    # The lock is ours. A game still running now is a leftover from a run that
    # died without stopping it, so clear it rather than refusing to work -
    # unless the suite is keeping one game for all its checks (CF_KEEP_GAME, set
    # by suite.sh), where a running game that still answers is the point. One
    # that does not answer is cleared as before.
    if ! not_running; then
        if [ -n "${CF_KEEP_GAME:-}" ] && CF_EVAL_TIMEOUT=10 "$PZ" eval 'return true' >/dev/null 2>&1; then
            return 0
        fi
        echo "a leftover game is still running; stopping it" >&2
        "$PZ" stop >/dev/null 2>&1
        local deadline=$(( $(date +%s) + 90 ))
        until not_running; do
            [ "$(date +%s)" -lt "$deadline" ] || { echo "could not stop the leftover game" >&2; return 1; }
            sleep 3
        done
    fi
    return 0
}

# Starting and ending a check's world (owner, 2026-09-15: "to start a fresh
# game you dont have to start the whole game"). Run on its own, a check starts
# the game and stops it, as before. Inside suite.sh (CF_KEEP_GAME) it asks the
# running game for a new world, and leaves the game running for the next check.
start_world() {
    if [ -n "${CF_KEEP_GAME:-}" ]; then "$PZ" fresh "$@"; else "$PZ" start "$@"; fi
}
end_world() {
    [ -n "${CF_KEEP_GAME:-}" ] && return 0
    "$PZ" stop >/dev/null 2>&1
}
# For checks that need a real launch of their own: a save, quit and reload
# (reload, pdagame), or numbers comparable with earlier runs (perf, pdaperf).
start_cold() {
    not_running || "$PZ" stop >/dev/null 2>&1
    "$PZ" start "$@"
}

not_running() { grep -q "not running" <<<"$("$PZ" status)"; }

# Log of the current run only.
run_log() { awk -v m="[CF-AUTOTEST] launching session=$(session)" 'index($0, m) { f = 1 } f' "$CONSOLE"; }

# One eval; prints the values after "ok " (tab-separated), fails on error/timeout.
ev() {
    local out; out="$("$PZ" eval "$@" 2>/dev/null)" || return 1
    sed -n 's/^ok //p' <<<"$out"
}

# Poll a Lua expression until its first value is "true" or the timeout passes.
wait_true() { # wait_true SECONDS 'lua expression'
    local deadline=$(( $(date +%s) + $1 ))
    while [ "$(date +%s)" -lt "$deadline" ]; do
        [ "$(ev "return $2" | cut -f1)" = true ] && return 0
        sleep 0.5
    done
    return 1
}

# Errors inside the mod: an ERROR block (the ERROR line and the trace under it)
# that names the mod, reported with its exception message. The game follows
# each Lua error with a second "dumping Lua stack trace" ERROR line; that is
# the same error, not a new one.
mod_errors() {
    run_log | awk '
        function flush() { if (head != "" && mod) print head (msg != "" ? "  |  " msg : ""); head = "" }
        /^ERROR/ && /dumping Lua stack trace/ { next }
        /^ERROR/ { flush(); head = $0; mod = /MOD:Conspiracy-Files/; msg = ""; next }
        head != "" && msg == "" && /Exception: / { msg = $0; sub(/^[ \t]*[^ ]*Exception: /, "", msg) }
        head != "" && /MOD:Conspiracy-Files/ { mod = 1 }
        END { flush() }' | sed 's/^ERROR: *//'
}

# WHAT DREW IT. Every check ran on llvmpipe for a day without any result
    # saying so, and three known problems - knox.sh flaking, meaningless perf
    # numbers, an address index taking minutes - were all that one fact
    # (owner, 2026-09-13: "are you running the game in software or hardware
    # acceleration"). A result you cannot read the renderer off is a result you
    # cannot interpret, so it goes in the evidence beside the commit.
renderer_line() {
    local card
    card="$(grep -ohm1 'GraphicsCard: .*' "${CONSOLE:-$HOME/Zomboid/console.txt}" 2>/dev/null | sed 's/GraphicsCard: //')"
    case "$card" in
        *llvmpipe*|*softpipe*|*swrast*) echo "renderer: ${card% } (SOFTWARE) on display ${DISPLAY:-?}" ;;
        "")                             echo "renderer: unknown on display ${DISPLAY:-?}" ;;
        *)                              echo "renderer: ${card% } on display ${DISPLAY:-?}" ;;
    esac
}

# How many error lines the MOD has logged to the current console, as a bare
# integer. Every caller of this got it wrong the same way:
#
#   n="$(grep -c 'lvl=e' "$CONSOLE" 2>/dev/null || echo 0)"
#
# grep -c prints "0" AND exits 1 when it matches nothing, so the || fallback
# fires as well and n becomes "0\n0" - which then kills the next $(( )) with an
# arithmetic syntax error and takes the whole check down after its last
# assertion had already passed (2026-09-13).
#
# It also only makes sense on ONE console: the game truncates console.txt when
# it starts, so a count taken before a save-and-reload cannot be compared with
# one taken after.
mod_error_count() {
    local file="${1:-$CONSOLE}"
    local n
    n="$( { grep -c 'lvl=e' "$file" 2>/dev/null || true; } | head -1 )"
    case "$n" in
        ''|*[!0-9]*) echo 0 ;;
        *) echo "$n" ;;
    esac
}

# Is this a bare non-negative integer? `[ "$n" -lt 2000 ]` and $(( )) both
# blow up on an empty or non-numeric value, and a check that dies inside its
# own assertion prints nothing useful - see mod_error_count above for the
# version of this that cost a whole run.
is_number() { case "${1:-}" in ''|*[!0-9]*) return 1 ;; *) return 0 ;; esac; }

source_line() {
    echo "source: $(git -C "$REPO" rev-parse --short HEAD)$(git -C "$REPO" diff --quiet HEAD -- mod 2>/dev/null || echo ' + uncommitted mod changes')"
    renderer_line
}

# Find document N of the placed case, take it and inspect it the player's way
# (checks/core_loop.lua must be loaded). Prints the document's name; fails
# with a reason. Cars go through the vehicle menu.
inspect_doc() {
    local i="$1" f h
    ev "return CFLoop.approach($i)" >/dev/null; wait_true 10 "CFLoop.loaded($i)" >/dev/null
    f="$(ev "return CFLoop.find($i)")"
    [ "$(cut -f1 <<<"$f")" = true ] || { echo "document $i not found: $(cut -f2 <<<"$f")"; return 1; }
    h="$(cut -f3 <<<"$f")"
    # Outside first, as core_loop.sh does: a truck bed is never shown to someone inside the vehicle.
    if [[ "$h" == vehicle* ]]; then
        { [ "$(ev 'return CFLoop.reachPart()' | cut -f1)" = true ] && { wait_true 12 'CFLoop.partAccess()' >/dev/null \
            || { ev 'return CFLoop.forceOpen()' >/dev/null; wait_true 8 'CFLoop.partAccess()' >/dev/null; }; }; } \
            || { ev 'return CFLoop.enterVehicle()' >/dev/null; wait_true 30 'CFLoop.inVehicle()' >/dev/null; }
    else ev "return CFLoop.goTo($i)" >/dev/null; fi
    for _ in $(seq 12); do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 0.5; done
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { echo "document $i never reached the inventory"; return 1; }
    [ "$(ev 'return CFLoop.inspect()' | cut -f1)" = true ] || { echo "document $i could not be inspected"; return 1; }
    [[ "$h" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
    cut -f2 <<<"$f"
}
