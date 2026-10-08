#!/usr/bin/env bash
# Sign mod-ofinterest/42/media/java/OfInterestScenes.jar for ZombieBuddy (ZBS):
# writes OfInterestScenes.jar.zbs next to it. Run after every build.sh.
#   tools/ofinterest-scenes/sign.sh [private key] [SteamID64]
# The private key stays OUTSIDE the repository (default ~/.signing/). The
# public key must be on the author's Steam profile summary as
# JavaModZBS:<64 hex> (sign.sh prints it), or ZombieBuddy cannot verify.
# Signed payload (ZombieBuddy ZBSVerifier): "ZBS:<SteamID64>:<jar sha256 hex>".
set -euo pipefail
cd "$(dirname "$0")"
KEY=${1:-$HOME/.signing/nohelp-ed25519.pem}
SID=${2:-76561198083988095}
JAR=../../mod-ofinterest/42/media/java/OfInterestScenes.jar
SHA=$(sha256sum "$JAR" | cut -d' ' -f1)
MSG=$(mktemp); SIG=$(mktemp); trap 'rm -f "$MSG" "$SIG"' EXIT
printf 'ZBS:%s:%s' "$SID" "$SHA" > "$MSG"
openssl pkeyutl -sign -inkey "$KEY" -rawin -in "$MSG" -out "$SIG"
printf 'ZBS\nSteamID64:%s\nSignature:%s\n' "$SID" "$(xxd -p -c 256 "$SIG")" > "$JAR.zbs"
echo "signed $JAR ($SHA)"
echo "Steam profile summary must contain: JavaModZBS:$(openssl pkey -in "$KEY" -pubout -outform DER | tail -c 32 | xxd -p -c 64)"
