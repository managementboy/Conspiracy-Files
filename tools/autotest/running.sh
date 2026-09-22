#!/usr/bin/env bash
# Which autotest checks are actually running. Ask this, never `pgrep -f`.
#
#   tools/autotest/running.sh            list them, exit 0 if any
#   tools/autotest/running.sh campaign   exit 0 only if that one is running
#
# It reads the PID files checks write on startup and verifies each process is
# alive and still that script, so it cannot match the asker, a diagnostic
# command that mentions the name, or a recycled PID. Use it in a wait loop:
#
#   until ! tools/autotest/running.sh campaign; do sleep 30; done
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
if [ $# -ge 1 ]; then cf_run_alive "$1"; exit $?; fi
any=1
for f in "$CF_RUNDIR"/*.pid; do
    [ -e "$f" ] || continue
    name="$(basename "$f" .pid)"
    if cf_run_alive "$name"; then echo "$name (pid $(cut -d" " -f1 "$f"))"; any=0; fi
done
[ "$any" = 0 ] || echo "no autotest check is running"
exit "$any"
