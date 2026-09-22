#!/usr/bin/env bash
# Stop a running check, properly.
#
#   tools/autotest/stop.sh campaign
#   tools/autotest/stop.sh --all
#
# `kill PID` is not enough. A check spends most of its life inside a child -
# `sleep`, or an `ev` waiting on the game - and bash defers a trap until the
# foreground child returns, so the run appears to ignore the signal for as
# long as that child lasts. Checks are launched with setsid, so each is its
# own process-group leader: signalling the GROUP reaches the children too.
#
# It also stops the game and releases the machine lock, because a killed check
# that leaves the game up keeps fd 9 and the next check then waits twenty
# minutes for a lock nobody will release (2026-09-22).
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
. tools/autotest/lib.sh

stop_one() {
    local name="$1" pid
    cf_run_alive "$name" || { echo "$name: not running"; return 1; }
    pid="$(cut -d' ' -f1 "$CF_RUNDIR/$name.pid")"
    echo "$name: stopping pid $pid (process group)"
    kill -TERM "-$pid" 2>/dev/null || kill -TERM "$pid" 2>/dev/null
    for _ in $(seq 20); do [ -d "/proc/$pid" ] || break; sleep 0.5; done
    if [ -d "/proc/$pid" ]; then
        echo "$name: did not stop on TERM, sending KILL"
        kill -KILL "-$pid" 2>/dev/null || kill -KILL "$pid" 2>/dev/null
        sleep 1
    fi
    rm -f "$CF_RUNDIR/$name.pid"
    echo "$name: stopped"
}

if [ "${1:-}" = "--all" ]; then
    for f in "$CF_RUNDIR"/*.pid; do [ -e "$f" ] || continue; stop_one "$(basename "$f" .pid)"; done
elif [ $# -ge 1 ]; then
    stop_one "$1"
else
    echo "usage: $0 NAME | --all" >&2; exit 2
fi
# The game outlives a killed check and keeps the machine lock with it.
tools/autotest/pz.sh stop >/dev/null 2>&1 || true
echo "game stopped, machine lock released"
