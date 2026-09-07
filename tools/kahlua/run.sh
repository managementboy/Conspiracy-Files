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
PZ_DEFAULT="/c/Program Files (x86)/Steam/steamapps/common/ProjectZomboid"
PZ="${PZ_HOME:-$PZ_DEFAULT}"
JDK="${JAVA_HOME:-/c/Program Files/Zulu/zulu-25}"

[ -f "$PZ/projectzomboid.jar" ] || { echo "projectzomboid.jar not found under $PZ (set PZ_HOME)" >&2; exit 2; }
[ -x "$JDK/bin/java" ] || { echo "java not found under $JDK (set JAVA_HOME)" >&2; exit 2; }
[ $# -ge 1 ] || { echo "usage: $0 <script.lua> [more.lua ...]" >&2; exit 2; }

if [ ! -f "$REPO/stdlib.lua" ]; then
    cp "$PZ/stdlib.lua" "$REPO/stdlib.lua"
fi

if [ ! -f "$REPO/tools/kahlua/RunLua.class" ] \
   || [ "$REPO/tools/kahlua/RunLua.java" -nt "$REPO/tools/kahlua/RunLua.class" ]; then
    "$JDK/bin/javac" -cp "$(cygpath -w "$PZ/projectzomboid.jar")" \
        -d "$REPO/tools/kahlua" "$REPO/tools/kahlua/RunLua.java"
fi

CP="$(cygpath -w "$PZ/projectzomboid.jar");$(cygpath -w "$REPO/tools/kahlua")"

# --parse-all: compile every shipped mod file with the engine's own compiler.
# PUC Lua accepting a file says nothing about whether Kahlua will parse it.
if [ "${1:-}" = "--parse-all" ]; then
    cd "$REPO"
    exec "$JDK/bin/java" -cp "$CP" RunLua --parse $(find mod/common -name '*.lua' | sort)
fi
failures=0
for script in "$@"; do
    printf '%-46s ' "$(basename "$script")"
    # Java is a Windows process: hand it a Windows path, and keep it relative to
    # the repo so scripts can use their usual relative package.path and dofile.
    if (cd "$REPO" && "$JDK/bin/java" -cp "$CP" RunLua "$(cygpath -w "$(cd "$(dirname "$script")" && pwd)/$(basename "$script")")") > /tmp/kahlua.out 2>&1; then
        echo "ok"
    else
        failures=$((failures + 1))
        echo "KAHLUA FAIL"
        sed 's/^/    /' /tmp/kahlua.out | head -12
    fi
done
[ "$failures" -eq 0 ] || exit 1
