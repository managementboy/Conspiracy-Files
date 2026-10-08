#!/usr/bin/env bash
# No Help boot check: does the game open with ZombieBuddy, the signed scene
# listener jar and No Help, in a new world AND after a save and reload?
#
#   tools/autotest/checks/nohelp_boot.sh [--soak SECONDS]
#
# PASS needs, in both the new world and the reloaded save:
#   - ZombieBuddy verified the jar's signature and put it on the classpath,
#     and applied its story advices (at least 140) with none failing;
#   - the listener answers NHSceneListener() with no failed or dropped lines,
#     and No Help logged its scene-listener-live line;
#   - the state dump runs and carries the listener's counts (no zbMissing);
#   - no error in the log inside either Conspiracy Files mod;
#   - the reload keeps the world's seed and its confirmed scenes.
# Report: docs/management/evidence/linux-autotest/<session>-nohelp-boot.txt.
# Exit 0 pass, 1 fail, 2 could not run. Counts only (the owner plays blind).
set -uo pipefail
export PZ_NOHELP_ONLY=1
. "$(dirname "${BASH_SOURCE[0]}")/../lib.sh"
soak=60
while [ $# -gt 0 ]; do
    case "$1" in --soak) soak="${2:?}"; shift 2 ;; *) echo "usage: $0 [--soak SECONDS]" >&2; exit 2 ;; esac
done
say() { echo "nohelp-boot: $*" >&2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
notes=()

# One phase: the Java side from console.txt (rewritten at each launch), the
# Lua side through DevEval. Sets SEED and SCENES for the reload comparison
# (run in this shell, not a subshell, so its fails and notes are kept).
phase() { # phase LABEL
    local label="$1" log
    log="$(cat "$CONSOLE")"
    grep -q "ZBS verification valid for .*NoHelpScenes.jar" <<<"$log" || fail "$label: ZombieBuddy did not verify the jar's signature"
    grep -q "added to classpath: .*NoHelpScenes.jar" <<<"$log" || fail "$label: the jar was not loaded"
    local applied bad
    applied="$(grep -c "Applied advice to zombie.randomizedWorld" <<<"$log")"
    bad="$(grep -c "Failed to apply advice to zombie.randomizedWorld" <<<"$log")"
    [ "$applied" -ge 140 ] || fail "$label: only $applied story advices applied"
    [ "$bad" -eq 0 ] || fail "$label: $bad story advices failed"
    wait_true 60 'NHShared.VanillaSceneRuntime.listenerStatus()~=nil' || fail "$label: the listener does not answer"
    local st; st="$(ev 'local s=NHShared.VanillaSceneRuntime.listenerStatus(); return s.version,s.seen,s.dropped,s.failed,s.queued,s.err or ""')"
    IFS=$'\t' read -r v seen dropped failed queued err <<<"$st"
    [ "${failed:-1}" = 0 ] && [ "${dropped:-1}" = 0 ] || fail "$label: listener failed=$failed dropped=$dropped ${err:-}"
    notes+=("$label: ZombieBuddy advices $applied; listener v$v seen=$seen queued=$queued failed=$failed dropped=$dropped")
    say "soaking ${soak}s"; sleep "$soak"
    grep -q "why=scene-listener-live" "$CONSOLE" || fail "$label: no scene-listener-live line"
    ev 'NHShared.StateDump.run(); return true' >/dev/null || fail "$label: state dump call failed"
    sleep 2
    local dump; dump="$(grep "ev=dump" "$CONSOLE" | tail -1)"
    grep -q "zbSeen=" <<<"$dump" || fail "$label: state dump has no listener counts: ${dump:-none}"
    grep -q "zbMissing=" <<<"$dump" && fail "$label: state dump says the listener is missing"
    grep -q "why=failed" <<<"$dump" && fail "$label: state dump failed"
    notes+=("$label dump: $(sed 's/^.*ev=dump //' <<<"$dump")")
    local errs; errs="$(mod_errors)"
    [ -z "$errs" ] || fail "$label: errors inside the mods: $(head -3 <<<"$errs" | tr '\n' ' ')"
    read -r SEED SCENES <<<"$(ev 'local w=ModData.get("NHShared.Generated.G2"); local r=w.campaign.canonical; local n=0; for _,s in pairs(r.scenes or {}) do if s.kind then n=n+1 end end; return NHShared.GeneratedRuntime.worldSeed(), n' | tr '\t' ' ')"
}

claim_game || exit 2
start_cold || { say "the game did not reach a playable world"; "$PZ" stop; exit 2; }
id="$(session)"
world="$(cat "$REPO/dev/eval/linux/world" 2>/dev/null)"
phase "new world"; seed1="${SEED:-}"; scenes1="${SCENES:-0}"
"$PZ" stop --save >/dev/null 2>&1 || fail "save and quit failed"
sleep 3
"$PZ" start --continue "$world" >/dev/null 2>&1 || fail "the save did not reload"
phase "reloaded save"; seed2="${SEED:-}"; scenes2="${SCENES:-0}"
[ -n "$seed1" ] && [ "$seed1" = "$seed2" ] || fail "the world seed changed across the reload ($seed1 -> $seed2)"
[ "${scenes2:-0}" -ge "${scenes1:-0}" ] || fail "confirmed scenes lost across the reload ($scenes1 -> $scenes2)"
notes+=("reload: seed kept, confirmed scenes $scenes1 -> $scenes2")

result=PASS; [ ${#fails[@]} -eq 0 ] || result=FAIL
out="$REPO/docs/management/evidence/linux-autotest/$id-nohelp-boot.txt"
mkdir -p "$(dirname "$out")"
{
    echo "Linux No Help boot check $id: $result"
    source_line
    renderer_line
    for n in "${notes[@]}"; do echo "$n"; done
    for f in "${fails[@]}"; do echo "FAIL: $f"; done
} > "$out.part"
mv "$out.part" "$out"
say "written: $out"
cat "$out"
"$PZ" stop >/dev/null 2>&1
[ "$result" = PASS ]
