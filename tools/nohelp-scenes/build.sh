#!/usr/bin/env bash
# Build mod-nohelp/42/media/java/NoHelpScenes.jar (E4, DR-20260929-NOHELP-GAP-PLAN).
#   tools/nohelp-scenes/build.sh [projectzomboid.jar] [ZombieBuddy.jar]
# javac 17+, --release 17 (ZombieBuddy 2.3 is Java 17; the game runs Java 25).
# The game jar is only read by gen_patches.py; compiling needs ZombieBuddy.jar
# and the LuaMethod stub (stubs/, never packed).
set -euo pipefail
cd "$(dirname "$0")"
PZ=${1:-$HOME/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid/projectzomboid.jar}
ZB=${2:-$HOME/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid/ZombieBuddy.jar}
OUT=../../mod-nohelp/42/media/java/NoHelpScenes.jar
python3 gen_patches.py "$PZ" src/conspiracyfiles/nohelp/ScenePatches.java
rm -rf .build && mkdir -p .build/stubs .build/classes "$(dirname "$OUT")"
javac --release 17 -d .build/stubs $(find stubs -name '*.java')
javac --release 17 -cp "$ZB:.build/stubs" -d .build/classes $(find src -name '*.java')
# Fixed timestamps: the same sources give the same jar.
find .build/classes -exec touch -t 202609290000 {} +
(cd .build/classes && rm -f ../out.jar && zip -qX -r ../out.jar conspiracyfiles)
cp .build/out.jar "$OUT"
sha256sum "$OUT"
# The listener's own test, against fake story objects.
javac -cp "$OUT:.build/stubs" -d .build/test test/SceneListenerTest.java
java -cp ".build/test:$OUT:.build/stubs" SceneListenerTest
