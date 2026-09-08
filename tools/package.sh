#!/usr/bin/env bash
# Build a distributable copy of the mod for a tester.
#
#   tools/package.sh              -> dist/ConspiracyFiles-<version>.zip
#   tools/package.sh --install    -> also install it into this machine's mods folder
#
# The archive contains a single ConspiracyFiles/ folder in exactly the layout
# Project Zomboid expects, so a tester unzips it into their Zomboid/mods folder
# and is done. No build step: the mod is Lua.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"

version="$(grep -o 'ConspiracyFiles.VERSION = "[^"]*"' "$REPO/mod/common/media/lua/shared/ConspiracyFiles/Version.lua" | head -1 | sed 's/.*= "//;s/"//')"
[ -n "$version" ] || { echo "could not read ConspiracyFiles.VERSION from Version.lua" >&2; exit 1; }

staging="$(mktemp -d)"; trap 'rm -rf "$staging"' EXIT
out="$REPO/dist"; mkdir -p "$out"
archive="$out/ConspiracyFiles-$version.zip"

# Ship exactly what the game loads: the version folder holding mod.info, and
# the shared media tree. Nothing from dev/, test/, docs/ or tools/.
mkdir -p "$staging/ConspiracyFiles"
cp -r "$REPO/mod/42" "$staging/ConspiracyFiles/42"
cp -r "$REPO/mod/common" "$staging/ConspiracyFiles/common"

# A package that cannot generate a case is worse than no package. Every
# require() in the shipped tree must resolve inside the shipped tree - this is
# the check that would have caught T3Nearby existing only on one machine.
missing=0
while read -r module; do
    [ -f "$staging/ConspiracyFiles/common/media/lua/shared/$module.lua" ] && continue
    [ -f "$staging/ConspiracyFiles/common/media/lua/client/$module.lua" ] && continue
    echo "MISSING from package: $module" >&2; missing=$((missing + 1))
done < <(grep -rhoE 'require\("(ConspiracyFiles[^"]*)"\)' "$staging/ConspiracyFiles" --include=*.lua \
         | sed -E 's/require\("//; s/"\)//' | sort -u)
[ "$missing" -eq 0 ] || { echo "refusing to package: $missing unresolved require(s)" >&2; exit 1; }
[ -f "$staging/ConspiracyFiles/42/mod.info" ] || { echo "refusing to package: no mod.info" >&2; exit 1; }

rm -f "$archive"
if command -v zip >/dev/null 2>&1; then
    ( cd "$staging" && zip -qr "$archive" ConspiracyFiles )
else
    python -c "import shutil,sys; shutil.make_archive(sys.argv[1][:-4],'zip',sys.argv[2])" "$archive" "$staging"
fi

files="$(find "$staging/ConspiracyFiles" -name '*.lua' | wc -l | tr -d ' ')"
echo "packaged $archive"
echo "  version   $version"
echo "  lua files $files"
if command -v sha256sum >/dev/null 2>&1; then
    echo "  sha256    $(sha256sum "$archive" | cut -d' ' -f1)"
fi

if [ "${1:-}" = "--install" ]; then
    [ -n "${CF_INSTALL:-}" ] || { echo "CF_INSTALL not resolved; set ZOMBOID_HOME" >&2; exit 1; }
    rm -rf "$CF_INSTALL"
    mkdir -p "$(dirname "$CF_INSTALL")"
    cp -r "$staging/ConspiracyFiles" "$CF_INSTALL"
    echo "installed to $CF_INSTALL"
fi

# --stage <dir>: leave the verified tree at <dir> instead of installing it, so
# the Workshop publisher gets the same require-checked payload the zip and the
# local install get. The check above is the whole point; do not stage around it.
if [ "${1:-}" = "--stage" ]; then
    dest="${2:-}"
    [ -n "$dest" ] || { echo "--stage needs a destination directory" >&2; exit 1; }
    rm -rf "$dest"
    mkdir -p "$(dirname "$dest")"
    cp -r "$staging/ConspiracyFiles" "$dest"
    echo "staged to $dest"
fi
