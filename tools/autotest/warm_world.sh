#!/usr/bin/env bash
# Build a world whose address index is already finished, and keep it.
#
#   tools/autotest/warm_world.sh [--hidden]
#
# Why this exists: the address book is a one-off sweep of ~10,000 Muldraugh
# buildings, deliberately throttled to a millisecond of work per tick so it
# never hitches the frame rate. A player pays for it ONCE, in the background,
# on the first load of a new save - AddressMap.start restores a finished book
# from ModData on every load after that.
#
# The harness was paying it on every single run, because every check started a
# brand new world. That is what made the case-dependent checks a coin flip: the
# case cannot place documents until the book is ready, and whether it got there
# inside a fixed timer depended on nothing but how busy the machine was
# (knox.sh aborted on "documents never placed" roughly every other run,
# 2026-09-13).
#
# So: build the index once, save the world, and let the checks reload it with
# `pz.sh start --continue`. The world name is recorded in dev/eval/linux/world
# by pz.sh itself.
# Exit 0 when a warm world is saved, 2 if it could not be built.
set -uo pipefail
. "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "warm: $*" >&2; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || { say "the game did not reach a playable world"; "$PZ" stop; exit 2; }
export CF_EVAL_TIMEOUT=90
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.AddressMap~=nil' || {
    say "the mod never answered"; "$PZ" stop; exit 2; }

# The sweep is slow by design, so wait on the book itself rather than a clock.
say "building the address index; this is the cost we are paying once"
deadline=$(( $(date +%s) + ${CF_WARM_TIMEOUT:-1800} ))
last=""
while :; do
    ready="$(ev 'return ConspiracyFiles.AddressMap.ready()' | cut -f1)"
    [ "$ready" = true ] && break
    now="$(ev 'return ConspiracyFiles.AddressMap.status and ConspiracyFiles.AddressMap.status() or "?"' | cut -f1)"
    [ "$now" != "$last" ] && { say "$now"; last="$now"; }
    [ "$(date +%s)" -lt "$deadline" ] || { say "the index never finished"; "$PZ" stop; exit 2; }
    sleep 10
done
say "address index ready"

"$PZ" stop --save >/dev/null 2>&1 || { say "could not save the warm world"; exit 2; }
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
[ -n "$world" ] || { say "the game saved but recorded no world name"; exit 2; }
echo "$world" > "$REPO/dev/eval/linux/warm-world"
say "warm world saved: $world"
echo "$world"
