#!/usr/bin/env bash
# Query a play session's log instead of reading it.
#
#   tools/log.sh                    the last 40 Conspiracy-Files lines
#   tools/log.sh placed             every line for one event
#   tools/log.sh -c 3               every line for one case
#   tools/log.sh -e                 errors and warnings only
#   tools/log.sh -s                 one-line-per-event summary of the session
#   tools/log.sh -f console.txt     a specific file
#
# Why this exists: the log already reaches this machine (tools/fetch_logs.sh),
# so following a play session should be a QUERY, not the owner pasting five
# hundred lines into a conversation. One prefix and one field format
# (ConspiracyFiles/Log.lua) is what makes that possible.
set -euo pipefail
FILE="${PZ_LOG:-$HOME/pz-logs/console.txt}"
mode=tail; want=""
while [ $# -gt 0 ]; do
    case "$1" in
        -f) FILE="$2"; shift 2;;
        -c) mode=case; want="$2"; shift 2;;
        -e) mode=errors; shift;;
        -s) mode=summary; shift;;
        -*) echo "unknown option $1" >&2; exit 2;;
        *) mode=event; want="$1"; shift;;
    esac
done
[ -f "$FILE" ] || { echo "no log at $FILE (run tools/fetch_logs.sh, or set PZ_LOG)" >&2; exit 2; }
cf() { grep -F '[CF]' "$FILE" || true; }
case "$mode" in
    tail)    cf | tail -40;;
    event)   cf | grep -F "ev=$want" || echo "no lines for ev=$want";;
    case)    cf | grep -F "case=$want" || echo "no lines for case=$want";;
    errors)  cf | grep -E 'lvl=(e|w)' || echo "no errors or warnings";;
    summary) cf | grep -oE 'ev=[a-z]+' | sort | uniq -c | sort -rn;;
esac
