#!/usr/bin/env bash
# What the PDA costs to draw, measured in a real game on real hardware.
#
#   tools/autotest/checks/pdaperf.sh [--hidden]
#
# NOT a pass/fail check of gameplay: a MEASUREMENT, with budgets loose enough
# that only a real regression trips them. It exists because "reduce per-frame
# work" is not a claim anyone should make without numbers, and because the
# numbers were meaningless until the renderer bug was fixed (every earlier
# measurement on this project was taken on llvmpipe - see renderer_line).
#
# Every drawing primitive the device uses is ALREADY a GPU-backed quad that
# PZ's own renderer batches engine-side. So what this counts is the thing that
# is actually variable: how many times per frame Lua crosses into Java.
set -uo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/../lib.sh"
start_args=(); [ "${1:-}" = "--hidden" ] && start_args+=(--hidden)
say() { echo "pdaperf: $*" >&2; }
abort() { say "$*"; "$PZ" stop; exit 2; }
fails=(); fail() { fails+=("$*"); say "FAIL: $*"; }
f() { cut -f"$1"; }

claim_game || exit 2
"$PZ" start "${start_args[@]}" || abort "the game did not reach a playable world"
export CF_EVAL_TIMEOUT=90
wait_true 120 'ConspiracyFiles~=nil and ConspiracyFiles.OrganiserScreen~=nil' || abort "the mod never loaded"
ev 'ConspiracyFiles.OrganiserScreen.open()' >/dev/null
wait_true 30 'ConspiracyFiles.OrganiserScreen.window~=nil' || abort "the device never opened"
ev -f "$HERE/pdaperf.lua" >/dev/null || abort "could not load the profiler"

shape="$(ev 'return CFPDA.shape()')"
say "device: scale=$(f 2 <<<"$shape")x font=$(f 3 <<<"$shape") glyphs=$(f 4 <<<"$shape")x lcd=$(f 5 <<<"$shape") rows=$(f 6 <<<"$shape")"

declare -A CALLS
for what in launcher list record; do
    shown="$(ev "return CFPDA.show(\"$what\")")"
    [ "$(f 1 <<<"$shown")" = true ] || { say "skipped $what: $(f 2 <<<"$shown")"; continue; }
    one="$(ev "return CFPDA.frame(\"$what\")")"
    [ "$(f 1 <<<"$one")" = true ] || { fail "$what frame: $(f 2 <<<"$one")"; continue; }
    n="$(f 3 <<<"$one")"; CALLS[$what]="$n"
    say "$what: $n draw calls/frame  [$(f 4 <<<"$one")]"
    t="$(ev 'return CFPDA.time(120)')"
    if [ "$(f 1 <<<"$t")" = true ]; then
        say "$what: $(f 4 <<<"$t") ms/frame over $(f 2 <<<"$t") frames"
        echo "$what $(f 4 <<<"$t")" >> "$RUNS/$(session)-pdaperf-times.txt"
    else
        fail "$what timing: $(f 2 <<<"$t")"
    fi
done

# A budget, not a target. The device is a full-screen UI panel drawn from
# rectangles by design (the case is 119 primitives from its manifest), so the
# count is inherently in the hundreds; what must not happen is it reaching the
# thousands, which is where a per-character text path on a full record screen
# would put it.
for what in "${!CALLS[@]}"; do
    n="${CALLS[$what]}"
    if is_number "$n"; then
        [ "$n" -lt 2000 ] || fail "$what issues $n draw calls per frame, over the 2000 budget"
    else
        fail "$what reported a non-numeric draw-call count: '$n'"
    fi
done

# Attribute the frame time before anyone optimises the wrong term.
for what in launcher list; do
    ev "return CFPDA.show(\"$what\")" >/dev/null
    sp="$(ev 'return CFPDA.split(120)')"
    [ "$(f 1 <<<"$sp")" = true ] && say "$what split (ms/frame): $(f 2 <<<"$sp")" \
        || fail "$what split: $(f 2 <<<"$sp")"
    echo "$what split $(f 2 <<<"$sp")" >> "$RUNS/$(session)-pdaperf-times.txt"
done

# And a screen with real content on it: a fresh world has no discoveries, so
# everything above was measured nearly empty - the cheap case.
filled="$(ev 'return CFPDA.fill(40)')"
say "filled NOTES with $(f 2 <<<"$filled") rows"
shown="$(ev 'return CFPDA.showNotes()')"
if [ "$(f 1 <<<"$shown")" = true ]; then
    say "NOTES now has $(f 3 <<<"$shown") rows"
    one="$(ev 'return CFPDA.frame("notes")')"
    t="$(ev 'return CFPDA.time(120)')"
    sp="$(ev 'return CFPDA.split(120)')"
    say "notes-list: $(f 3 <<<"$one") draw calls/frame  [$(f 4 <<<"$one")]"
    say "notes-list: $(f 4 <<<"$t") ms/frame"
    say "notes-list split (ms/frame): $(f 2 <<<"$sp")"
    echo "notes-list $(f 4 <<<"$t")" >> "$RUNS/$(session)-pdaperf-times.txt"
    echo "notes-list calls $(f 3 <<<"$one")" >> "$RUNS/$(session)-pdaperf-times.txt"
    echo "notes-list split $(f 2 <<<"$sp")" >> "$RUNS/$(session)-pdaperf-times.txt"
    n="$(f 3 <<<"$one")"
    is_number "$n" && { [ "$n" -lt 2000 ] || fail "a full notes list issues $n draw calls per frame"; } \
        || fail "the notes list reported a non-numeric draw-call count: '$n'"
    # And a record opened from it, which is the text-heaviest screen there is.
    rec="$(ev 'return CFPDA.show("record")')"
    if [ "$(f 1 <<<"$rec")" = true ]; then
        one="$(ev 'return CFPDA.frame("record")')"
        t="$(ev 'return CFPDA.time(120)')"
        say "record: $(f 3 <<<"$one") draw calls/frame, $(f 4 <<<"$t") ms/frame  [$(f 4 <<<"$one")]"
        echo "record $(f 4 <<<"$t")" >> "$RUNS/$(session)-pdaperf-times.txt"
        echo "record calls $(f 3 <<<"$one")" >> "$RUNS/$(session)-pdaperf-times.txt"
        n="$(f 3 <<<"$one")"
        is_number "$n" && { [ "$n" -lt 2000 ] || fail "a record issues $n draw calls per frame"; } \
            || fail "the record reported a non-numeric draw-call count: '$n'"
    else
        say "record still not openable: $(f 2 <<<"$rec")"
    fi
fi

ticks="$(ev 'return CFPDA.ticks(600)')"
[ "$(f 1 <<<"$ticks")" = true ] && say "per-tick handlers over $(f 2 <<<"$ticks") calls: $(f 3 <<<"$ticks")" \
    || fail "tick timing: $(f 2 <<<"$ticks")"

errors="$(ev 'return CFPDA.frame("after-all")' | f 1)"
[ "$errors" = true ] || fail "the device stopped drawing after measurement"

"$PZ" shot "$RUNS/$(session)-pdaperf.png" >/dev/null 2>&1
"$PZ" stop

id="$(session)"
verdict=PASS; [ ${#fails[@]} -eq 0 ] || verdict=FAIL
out="$EVIDENCE/$(date +%Y%m%dT%H%M%S)-pdaperf.txt"
{
    echo "$verdict pdaperf - $(date -Is)"
    echo "commit: $(git -C "$REPO" rev-parse --short HEAD)"
    renderer_line
    echo "session: $id"
    echo "device:  $(f 2 <<<"$shape")x scale, font $(f 3 <<<"$shape"), glyphs $(f 4 <<<"$shape")x, lcd $(f 5 <<<"$shape")"
    for what in launcher list record; do
        [ -n "${CALLS[$what]:-}" ] && echo "$what: ${CALLS[$what]} draw calls/frame"
    done
    [ -f "$RUNS/$id-pdaperf-times.txt" ] && sed 's/^/ms per frame: /' "$RUNS/$id-pdaperf-times.txt"
    echo "ticks:   $(f 3 <<<"$ticks")"
    for x in "${fails[@]}"; do echo "FAIL: $x"; done
} > "$out.part" && mv "$out.part" "$out"
say "written: $out"
echo "Linux PDA performance check $id: $verdict"
cat "$out"
[ ${#fails[@]} -eq 0 ]
