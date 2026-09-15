#!/usr/bin/env bash
# Resolve the machine-specific paths every other tool needs.
#
# Source this; do not run it. Everything can be overridden by environment
# variable, so a machine that puts things somewhere unusual needs no edits:
#
#   PZ_HOME      the Project Zomboid installation
#   ZOMBOID_HOME the per-user Zomboid folder (saves, mods, console.txt)
#   CF_INSTALL   the deployed mod folder
#   JAVA_HOME    a JDK 25+ (needed only for the Kahlua runner)
#   LUA51        a Lua 5.1 interpreter
#
# Nothing here is fatal on its own. A caller that needs a missing path says so
# itself, so a machine without the game can still run the Lua test suite.

cf_first_dir() { for candidate in "$@"; do [ -d "$candidate" ] && { printf '%s\n' "$candidate"; return 0; }; done; return 1; }
cf_first_exe() { for candidate in "$@"; do [ -x "$candidate" ] && { printf '%s\n' "$candidate"; return 0; }; done; return 1; }

: "${PZ_HOME:=$(cf_first_dir \
    "/c/Program Files (x86)/Steam/steamapps/common/ProjectZomboid" \
    "$HOME/.steam/steam/steamapps/common/ProjectZomboid" \
    "$HOME/.local/share/Steam/steamapps/common/ProjectZomboid" \
    "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/ProjectZomboid" \
    "/usr/share/steam/steamapps/common/ProjectZomboid" || true)}"

: "${ZOMBOID_HOME:=$(cf_first_dir \
    "/c/Users/${USER:-}/Zomboid" \
    "/c/Users/elkin.fricke/Zomboid" \
    "$HOME/Zomboid" \
    "$HOME/.local/share/Zomboid" || true)}"

: "${CF_INSTALL:=${ZOMBOID_HOME:+$ZOMBOID_HOME/mods/ConspiracyFiles}}"

# The Linux Steam layout nests the jar and stdlib.lua one level below the app
# directory; the Windows layout puts them at its root. Consumers want the
# directory that actually holds the jar, so descend when that is the case.
if [ -n "${PZ_HOME:-}" ] \
   && [ ! -f "$PZ_HOME/projectzomboid.jar" ] \
   && [ -f "$PZ_HOME/projectzomboid/projectzomboid.jar" ]; then
    PZ_HOME="$PZ_HOME/projectzomboid"
fi

# A JDK, not a JRE: the Kahlua runner has to compile a small Java file, and the
# game's bundled runtime ships no compiler.
# /opt/jdk-25 is where install-jdk25-for-pz.sh puts it.
: "${JAVA_HOME:=$(cf_first_dir \
    "/c/Program Files/Zulu/zulu-25" \
    "/opt/jdk-25" \
    "/usr/lib/jvm/zulu-25" \
    "/usr/lib/jvm/java-25-openjdk-amd64" \
    "/usr/lib/jvm/temurin-25-jdk-amd64" \
    "/usr/lib/jvm/default-java" || true)}"

: "${LUA51:=$(command -v lua5.1 2>/dev/null || cf_first_exe \
    "/c/Users/elkin.fricke/AppData/Local/Temp/codex-lua51/lua5.1.exe" \
    "/usr/bin/lua5.1" || command -v lua 2>/dev/null || true)}"

# A Windows-shaped JAVA_HOME (C:\...) inherited from the OS environment is not
# a usable bash path. Convert it where cygpath exists, and drop a trailing
# slash so "$JAVA_HOME/bin/java" does not become a double slash.
if [ -n "$JAVA_HOME" ] && printf %s "$JAVA_HOME" | grep -q "\\\\"; then
    if command -v cygpath >/dev/null 2>&1; then JAVA_HOME="$(cygpath -u "$JAVA_HOME")"; fi
fi
JAVA_HOME="${JAVA_HOME%/}"

export PZ_HOME ZOMBOID_HOME CF_INSTALL JAVA_HOME LUA51

cf_require() {
    local name="$1" value="$2" hint="$3"
    if [ -z "$value" ]; then
        echo "$name is not set and could not be found. Set it, e.g. $name=$hint" >&2
        return 1
    fi
}
