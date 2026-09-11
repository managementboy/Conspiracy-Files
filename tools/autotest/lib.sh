# Shared by the tools/autotest check scripts. Source it; do not run it.
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PZ="$REPO/tools/autotest/pz.sh"
CONSOLE="${PZ_ZOMBOID:-$HOME/Zomboid}/console.txt"
RUNS="$REPO/dev/eval/linux/runs"
EVIDENCE="$REPO/docs/management/evidence/linux-autotest"
mkdir -p "$RUNS" "$EVIDENCE"

session() { cat "$REPO/dev/eval/linux/session"; }
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
        sleep 2
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

source_line() {
    echo "source: $(git -C "$REPO" rev-parse --short HEAD)$(git -C "$REPO" diff --quiet HEAD -- mod 2>/dev/null || echo ' + uncommitted mod changes')"
}

# Find document N of the placed case, take it and inspect it the player's way
# (checks/core_loop.lua must be loaded). Prints the document's name; fails
# with a reason. Cars go through the vehicle menu.
inspect_doc() {
    local i="$1" f h
    ev "return CFLoop.approach($i)" >/dev/null; sleep 2
    f="$(ev "return CFLoop.find($i)")"
    [ "$(cut -f1 <<<"$f")" = true ] || { echo "document $i not found: $(cut -f2 <<<"$f")"; return 1; }
    h="$(cut -f3 <<<"$f")"
    if [[ "$h" == vehicle* ]]; then ev 'return CFLoop.enterVehicle()' >/dev/null; wait_true 30 'CFLoop.inVehicle()' >/dev/null
    else ev "return CFLoop.goTo($i)" >/dev/null; fi
    for _ in 1 2 3 4 5 6; do [ "$(ev 'return CFLoop.openContainer()' | cut -f1)" = true ] && break; sleep 1; done
    ev 'return CFLoop.take()' >/dev/null
    wait_true 20 'CFLoop.carried()' || { echo "document $i never reached the inventory"; return 1; }
    [ "$(ev 'return CFLoop.inspect()' | cut -f1)" = true ] || { echo "document $i could not be inspected"; return 1; }
    [[ "$h" == vehicle* ]] && { ev 'return CFLoop.exitVehicle()' >/dev/null; sleep 3; }
    cut -f2 <<<"$f"
}
