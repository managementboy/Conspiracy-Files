#!/usr/bin/env bash
# Run Lua through the game's REAL engine (real classes, headless).
#   tools/realengine/run.sh                 canaries, then real-engine tests
#   tools/realengine/run.sh canary          only the canaries (prove the harness can fail)
#   tools/realengine/run.sh tests           only the real-engine tests
# Exit: 0 all good | 1 a test or canary was wrong | 20 no game here (never a pass)
#       21 the game is a different build than the lock | 22 fewer real tests ran than the lock demands
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
REPO="$PWD"
. tools/env.sh
RE_DIR="$REPO/tools/realengine"
mode="${1:-all}"

if [ -z "${PZ_HOME:-}" ] || [ ! -f "$PZ_HOME/projectzomboid.jar" ] || [ ! -x "${JAVA_HOME:-/nonexistent}/bin/javac" ]; then
    echo "real-engine: NOT EXERCISED - no game and JDK 25 here. This is not a pass."
    exit 20
fi
jdk_major="$("$JAVA_HOME/bin/javac" -version 2>&1 | sed -n 's/^javac \([0-9]*\).*/\1/p')"
[ "${jdk_major:-0}" -ge 25 ] || { echo "real-engine: JDK $jdk_major found, the game needs 25+ (set JAVA_HOME)" >&2; exit 20; }
[ -f stdlib.lua ] || cp "$PZ_HOME/stdlib.lua" stdlib.lua   # game content, gitignored
JAR="$PZ_HOME/projectzomboid.jar"
if [ ! -f "$RE_DIR/RealEngine.class" ] || [ "$RE_DIR/RealEngine.java" -nt "$RE_DIR/RealEngine.class" ]; then
    "$JAVA_HOME/bin/javac" -cp "$JAR" -d "$RE_DIR" "$RE_DIR/RealEngine.java" || exit 2
fi
CP="$JAR:$RE_DIR"
ROOTS="mod/common/media/lua/client mod/common/media/lua/shared mod-nohelp/common/media/lua/client mod-nohelp/common/media/lua/shared"

# One JVM per file: the engine's set-up is process-wide, so one test can never leak into the next.
run_one() { # file -> prints the harness lines; sets RE_RESULT RE_TOUCHED RE_MS
    local out
    out="$(timeout 300 "$JAVA_HOME/bin/java" -Djava.awt.headless=true --enable-native-access=ALL-UNNAMED \
        -Dre.dir="$RE_DIR" -cp "$CP" RealEngine "$1" $ROOTS 2>&1)"
    RE_RESULT="$(grep -m1 '^RE:RESULT=' <<<"$out" | sed 's/^RE:RESULT=//')"
    RE_TOUCHED="$(grep -m1 '^RE:TOUCHED=' <<<"$out" | sed 's/^RE:TOUCHED=//')"
    RE_MS="$(grep -m1 '^RE:BOOT_MS=' <<<"$out" | sed 's/^RE:BOOT_MS=//')"
    [ -n "$RE_RESULT" ] || RE_RESULT="FAIL harness produced no result: $(tail -3 <<<"$out" | tr '\n' ' ')"
    RE_OUT="$out"
}

bad=0; real=0; skipped=0
if [ "$mode" = all ] || [ "$mode" = canary ]; then
    ncanary=0
    for f in "$RE_DIR"/canary/*.lua; do
        [ -f "$f" ] || continue
        ncanary=$((ncanary + 1)); run_one "$f"
        expect="$(sed -n 's/^-- EXPECT_FAIL: *//p' "$f" | head -1)"
        if [ -n "$expect" ]; then
            if [[ "$RE_RESULT" == FAIL* ]] && [[ "$RE_RESULT" == *"$expect"* ]]; then
                echo "canary ok   $(basename "$f")  (rejected as it must be: ${RE_RESULT:0:90})"
            else
                echo "canary BAD  $(basename "$f")  must fail naming '$expect', got: ${RE_RESULT:0:140}"; bad=$((bad + 1))
            fi
        else
            if [ "$RE_RESULT" = PASS ]; then echo "canary ok   $(basename "$f")  (correct calls work)"
            else echo "canary BAD  $(basename "$f")  must pass, got: ${RE_RESULT:0:140}"; bad=$((bad + 1)); fi
        fi
    done
    if [ "$ncanary" -eq 0 ]; then echo "canary BAD  no canary files found: the harness cannot be trusted"; bad=$((bad + 1)); fi
    # Negative control: the old fake-based check of the same removed call must still be green,
    # which is exactly why the fakes could not have caught it.
    if [ -f test/real_engine_negative_control.lua ]; then
        if lua5.1 test/real_engine_negative_control.lua >/dev/null 2>&1; then
            echo "negative control: the hand-made fake ACCEPTS getDoor(true); the real engine REJECTS it"
        else echo "negative control BAD: the fake-based check failed"; bad=$((bad + 1)); fi
    fi
fi
if [ "$mode" = all ] || [ "$mode" = tests ]; then
    for f in "$RE_DIR"/tests/*.lua; do
        [ -f "$f" ] || continue
        run_one "$f"
        if [ "$RE_RESULT" = PASS ]; then
            if [ "${RE_TOUCHED:-0}" -gt 0 ]; then real=$((real + 1)); echo "real  ok   $(basename "$f")  (touched $RE_TOUCHED real objects)"
            else skipped=$((skipped + 1)); echo "real  BAD  $(basename "$f")  passed but never touched a real game object - it proves nothing here"; bad=$((bad + 1)); fi
        else echo "real  FAIL $(basename "$f")  ${RE_RESULT:0:300}"; bad=$((bad + 1)); fi
    done
fi
echo "real-engine: $real real test(s) passed, $bad problem(s)"
[ "$bad" -eq 0 ]
