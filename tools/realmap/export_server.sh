#!/usr/bin/env bash
# Export every building of the REAL map from the game's own dedicated server: no window, no player,
# about a minute (the in-game export, tools/autotest/checks/address_export.sh, takes ~30 minutes).
#   tools/realmap/export_server.sh OUT.tsv
# Uses a throw-away cache folder under /tmp, so ~/Zomboid (your saves and settings) is never touched.
# Exit: 0 exported | 2 could not run | 20 no game here (never a pass)
cd "$(dirname "${BASH_SOURCE[0]}")/../.." || exit 2
REPO="$PWD"; . tools/env.sh
out="${1:?usage: export_server.sh OUT.tsv}"
if [ -z "${PZ_HOME:-}" ] || [ ! -f "$PZ_HOME/projectzomboid.jar" ]; then echo "realmap: NOT EXERCISED - no game here. This is not a pass."; exit 20; fi
cache="$(mktemp -d /tmp/cf_realmap.XXXXXX)"
trap 'rm -rf "$cache"' EXIT
mod="$cache/mods/RealMapExport"
mkdir -p "$mod/common/media/lua/server" "$mod/42" "$cache/Server"
printf 'name=RealMapExport\nid=RealMapExport\ndescription=throwaway: exports the real map buildings\n' | tee "$mod/mod.info" > "$mod/42/mod.info"
cat tools/autotest/checks/address_export.lua tools/realmap/servermod/driver.lua > "$mod/common/media/lua/server/export.lua"
printf 'Mods=RealMapExport\nMap=Muldraugh, KY\nOpen=true\nPublic=false\n' > "$cache/Server/realmap.ini"
log="$cache/server.log"
cd "$PZ_HOME" || exit 2
LD_LIBRARY_PATH="$PZ_HOME/natives:$PZ_HOME/jre64/lib/amd64" "$PZ_HOME/jre64/bin/java" -cp "./:./projectzomboid.jar" \
    -Djava.awt.headless=true --enable-native-access=ALL-UNNAMED --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED \
    -Xms2048m -Xmx2048m -Dzomboid.steam=0 -Djava.library.path=./:./natives/ -XX:-OmitStackTraceInFastThrow \
    zombie/network/GameServer -cachedir="$cache" -servername realmap -adminpassword realmap -nosteam > "$log" 2>&1 &
pid=$!
ok=0
for _ in $(seq 1 100); do
    if grep -q "CFREALMAP DONE" "$log" 2>/dev/null; then ok=1; break; fi
    if grep -q "CFREALMAP FAIL" "$log" 2>/dev/null; then break; fi
    kill -0 "$pid" 2>/dev/null || break
    sleep 3
done
kill "$pid" 2>/dev/null; wait "$pid" 2>/dev/null
if [ "$ok" != 1 ] || [ ! -s "$cache/Lua/cf_buildings_server.txt" ]; then
    echo "realmap: the server did not produce an export:"; grep -E "CFREALMAP|Exception" "$log" | head -5; exit 2
fi
cp "$cache/Lua/cf_buildings_server.txt" "$out"
echo "realmap: exported $(grep -vc '^#' "$out") buildings to $out"
