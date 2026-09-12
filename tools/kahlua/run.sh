#!/usr/bin/env bash
# Run a Lua file through the interpreter Project Zomboid actually uses.
#
#   tools/kahlua/run.sh test/discovery_ledger.lua
#
# PUC Lua 5.1 is not the engine. Kahlua is an incomplete Lua 5.1, so a script
# that passes under lua5.1.exe can still fail in game. This runs it for real.
#
# Kahlua's J2SEPlatform loads "stdlib.lua" relative to the working directory,
# and that file ships with the game rather than this repo. We copy the game's
# copy into the repo root on first use and gitignore it: it is game content, so
# it is deliberately not committed here.
set -euo pipefail
export MSYS2_ARG_CONV_EXCL="*"

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
. "$REPO/tools/env.sh"
PZ="$PZ_HOME"
JDK="$JAVA_HOME"

[ -f "$PZ/projectzomboid.jar" ] || { echo "projectzomboid.jar not found under $PZ (set PZ_HOME)" >&2; exit 2; }
[ -x "$JDK/bin/java" ] || { echo "java not found under $JDK (set JAVA_HOME)" >&2; exit 2; }
[ -x "$JDK/bin/javac" ] || { echo "$JDK is a JRE, not a JDK: no compiler. Set JAVA_HOME to a JDK 25+." >&2; exit 2; }
[ $# -ge 1 ] || { echo "usage: $0 <script.lua> [more.lua ...]" >&2; exit 2; }

# The jar is class-file major 69. An older JDK fails with a wall of "cannot find
# symbol" instead of saying so; name it here rather than let that happen.
jdk_major="$("$JDK/bin/javac" -version 2>&1 | sed -n 's/^javac \([0-9]*\).*/\1/p')"
if [ -n "$jdk_major" ] && [ "$jdk_major" -lt 25 ]; then
    echo "JAVA_HOME is JDK $jdk_major; the game jar needs JDK 25 or newer. Set JAVA_HOME." >&2
    exit 2
fi

# Java is a Windows process under MSYS/Cygwin and needs Windows-shaped paths and
# a ';' classpath separator; everywhere else the path is already correct and the
# separator is ':'.
if command -v cygpath >/dev/null 2>&1; then
    cf_jpath() { cygpath -w "$1"; }
    CPSEP=';'
else
    cf_jpath() { printf '%s\n' "$1"; }
    CPSEP=':'
fi

if [ ! -f "$REPO/stdlib.lua" ]; then
    cp "$PZ/stdlib.lua" "$REPO/stdlib.lua"
fi

if [ ! -f "$REPO/tools/kahlua/RunLua.class" ] \
   || [ "$REPO/tools/kahlua/RunLua.java" -nt "$REPO/tools/kahlua/RunLua.class" ]; then
    "$JDK/bin/javac" -cp "$(cf_jpath "$PZ/projectzomboid.jar")" \
        -d "$REPO/tools/kahlua" "$REPO/tools/kahlua/RunLua.java"
fi

CP="$(cf_jpath "$PZ/projectzomboid.jar")$CPSEP$(cf_jpath "$REPO/tools/kahlua")"

# --parse-all: compile every shipped mod file with the engine's own compiler.
# PUC Lua accepting a file says nothing about whether Kahlua will parse it.
if [ "${1:-}" = "--parse-all" ]; then
    cd "$REPO"
    exec "$JDK/bin/java" -cp "$CP" RunLua --parse $(find mod/common -name '*.lua' | sort)
fi
failures=0
for script in "$@"; do
    printf '%-46s ' "$(basename "$script")"
    # Hand Java a path shaped for its own OS, and keep the run relative to the
    # repo so scripts can use their usual relative package.path and dofile.
    if (cd "$REPO" && "$JDK/bin/java" -cp "$CP" RunLua "$(cf_jpath "$(cd "$(dirname "$script")" && pwd)/$(basename "$script")")") > /tmp/kahlua.out 2>&1; then
        echo "ok"
    else
        failures=$((failures + 1))
        echo "KAHLUA FAIL"
        sed 's/^/    /' /tmp/kahlua.out | head -12
    fi
done
[ "$failures" -eq 0 ] || exit 1
