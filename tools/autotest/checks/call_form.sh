#!/usr/bin/env bash
# Engine call form, measured in the real game (audit 2026-09-15).
#
#   tools/autotest/checks/call_form.sh [--hidden]
#
# Compares CasePerson.lua's keyed helper, o[k](o,...), with plain colon calls
# for AddItem and a container's searched flag on the same object. PASS means
# both forms did the same thing; DIFFER means the helper does not behave like a
# colon call on this build and the call sites must be rewritten. The result
# decides whether AGENTS.md's engine call rule is narrowed or enforced.
# Exit 0 both forms agree, 1 they differ, 2 could not run.
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "call-form: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }

claim_game || exit 2
start_world "${start_args[@]}" || abort "the game did not reach a playable world"
export CF_EVAL_TIMEOUT=60
wait_true 120 'getPlayer()~=nil and getPlayer():getInventory()~=nil' || abort "no player"
ev -f "$HERE/call_form.lua" >/dev/null || abort "could not load the probe"
res="$(ev 'return CFCall.run()')"
say "$(tr '\t' ' ' <<<"$res")"
id="$(session)"
end_world

verdict=PASS; [ "$(cut -f1 <<<"$res")" = true ] || verdict=DIFFER
out="$EVIDENCE/$(date +%Y%m%dT%H%M%S)-call-form.txt"
{
    echo "$verdict call-form - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "result: $(cut -f2 <<<"$res")"
} > "$out.part"; mv "$out.part" "$out"
say "written: $out"
cat "$out"
[ "$verdict" = PASS ]
