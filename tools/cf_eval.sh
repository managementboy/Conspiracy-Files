#!/usr/bin/env bash
# Run Lua inside the live debug single-player game on the play machine.
#
#   tools/cf_eval.sh 'return getPlayer():getX()'
#   tools/cf_eval.sh -f snippet.lua
#
# Needs the play machine running tools/stream_log.ps1 -Eval and the game in
# debug single-player. The code is wrapped in a function, so use `return` to
# get a value back. Prints the result and exits 0, or prints the error and
# exits 1. Exits 2 on a timeout, printing the log lines that followed the
# command's start, because a compile error's stack trace is there.
#
# Round trip: this writes dev/eval/inbox/cf_inbox.lua; stream_log.ps1 -Eval
# copies it into the play machine's Zomboid/Lua folder; the game's DevEval
# module runs it once and prints [CF-EVAL <id>] lines; stream_log.ps1 copies
# console.txt back to dev/playtest-logs/incoming/, where this script reads them.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EVAL_DIR="${CF_EVAL_DIR:-$REPO/dev/eval}"
LOG_DIR="${CF_EVAL_LOG_DIR:-$REPO/dev/playtest-logs/incoming}"
TIMEOUT="${CF_EVAL_TIMEOUT:-30}"

usage() { echo "usage: $0 'lua code' | $0 -f file.lua" >&2; exit 2; }
case "${1:-}" in
    -f) [ -n "${2:-}" ] && [ -f "$2" ] || usage; code="$(cat "$2")" ;;
    ""|-h|--help) usage ;;
    *) code="$1" ;;
esac

mkdir -p "$EVAL_DIR/inbox"
n=$(( $(cat "$EVAL_DIR/counter" 2>/dev/null || echo 0) + 1 ))
echo "$n" > "$EVAL_DIR/counter"
id="$(date +%Y%m%dT%H%M%S)-$n"
tag="[CF-EVAL $id]"

newest_log() { ls -t "$LOG_DIR"/live-*.txt 2>/dev/null | head -1 || true; }
log="$(newest_log)"
if [ -z "$log" ]; then
    echo "warning: no live log in $LOG_DIR yet; is stream_log.ps1 -Eval running?" >&2
elif [ $(( $(date +%s) - $(stat -L -c %Y "$log") )) -gt 60 ]; then
    echo "warning: newest live log $(basename "$log") has not changed for over a minute" >&2
fi

# Code goes on its own lines so a trailing comment cannot swallow the `end`.
# Written beside the target and renamed, so scp never copies a half file.
tmp="$(mktemp "$EVAL_DIR/inbox/.cf_inbox.XXXXXX")"
{
    echo "-- cf-eval id=$id"
    echo "ConspiracyFiles.DevEval.report(\"$id\", pcall(function()"
    printf '%s\n' "$code"
    echo "end))"
} > "$tmp"
chmod 644 "$tmp"
mv -f "$tmp" "$EVAL_DIR/inbox/cf_inbox.lua"
echo "sent $id; waiting up to ${TIMEOUT}s" >&2

# Tagged lines for this id, tag removed, CR from the Windows log dropped.
tagged() { awk -v t="$tag " '{ sub(/\r$/, "") } (i = index($0, t)) { print substr($0, i + length(t)) }' "$1"; }

deadline=$(( $(date +%s) + TIMEOUT ))
while [ "$(date +%s)" -lt "$deadline" ]; do
    log="$(newest_log)"
    if [ -n "$log" ] && grep -qF "$tag end" "$log"; then
        out="$(tagged "$log" | grep -vx -e start -e end)"
        printf '%s\n' "$out"
        case "$out" in error\ *) exit 1 ;; esac
        exit 0
    fi
    sleep 0.5
done

log="$(newest_log)"
if [ -n "$log" ] && grep -qF "$tag start" "$log"; then
    echo "timed out: $id started but never finished. Log lines after its start:" >&2
    awk -v t="$tag start" '{ sub(/\r$/, "") } found && n++ < 40 { print } index($0, t) { found = 1 }' "$log" >&2
else
    echo "timed out: $id never started. Check the game is in debug single-player," >&2
    echo "stream_log.ps1 runs with -Eval, and ${log:-no live log} is still growing." >&2
fi
exit 2
