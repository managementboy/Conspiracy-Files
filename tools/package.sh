#!/usr/bin/env bash
# Build a distributable copy of the mod for a tester.
#
#   tools/package.sh              -> dist/ConspiracyFiles-<version>.zip
#   tools/package.sh --install    -> also install it into this machine's mods folder
#   CF_MOD=ofinterest tools/package.sh -> the same for "Conspiracy Files: Of Interest"
#   CF_MOD=nohelp tools/package.sh -> the same for "Conspiracy Files: No Help"
#                                     (mod-nohelp/ -> dist/ConspiracyFilesNoHelp-<version>.zip)
#
# The archive contains a single ConspiracyFiles/ folder in exactly the layout
# Project Zomboid expects, so a tester unzips it into their Zomboid/mods folder
# and is done. No build step: the mod is Lua.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"

# Which mod: Dead Air (mod/, the default) or No Help (mod-nohelp/). NAME is the
# folder under mods/, PREFIX the require() namespace the check below resolves.
case "${CF_MOD:-deadair}" in
    deadair)
        SRC="$REPO/mod"; NAME=ConspiracyFiles; PREFIX=ConspiracyFiles
        version="$(grep -o 'ConspiracyFiles.VERSION = "[^"]*"' "$REPO/mod/common/media/lua/shared/ConspiracyFiles/Version.lua" | head -1 | sed 's/.*= "//;s/"//')"
        [ -n "$version" ] || { echo "could not read ConspiracyFiles.VERSION from Version.lua" >&2; exit 1; }
        ;;
    nohelp)
        # No Help has no Version.lua. Its mod.info modversion plus the commit
        # tells two uploads apart in the in-game mod list.
        SRC="$REPO/mod-nohelp"; NAME=ConspiracyFilesNoHelp; PREFIX=NHShared
        version="$(sed -n 's/^modversion=//p' "$SRC/42/mod.info" | tr -d '\r' | head -1)"
        [ -n "$version" ] || { echo "could not read modversion from mod-nohelp/42/mod.info" >&2; exit 1; }
        version="$version+$(git -C "$REPO" rev-parse --short HEAD 2>/dev/null || echo nogit)"
        ;;
    ofinterest)
        SRC="$REPO/mod-ofinterest"; NAME=ConspiracyFilesOfInterest; PREFIX=OIShared
        version="$(sed -n 's/^modversion=//p' "$SRC/42/mod.info" | tr -d '\r' | head -1)"
        [ -n "$version" ] || { echo "could not read modversion from mod-ofinterest/42/mod.info" >&2; exit 1; }
        version="$version+$(git -C "$REPO" rev-parse --short HEAD 2>/dev/null || echo nogit)"
        ;;
    *) echo "CF_MOD must be deadair, nohelp or ofinterest" >&2; exit 2 ;;
esac

staging="$(mktemp -d)"; trap 'rm -rf "$staging"' EXIT
out="$REPO/dist"; mkdir -p "$out"
archive="$out/$NAME-$version.zip"

# Ship exactly what the game loads: the version folder holding mod.info, and
# the shared media tree. Nothing from dev/, test/, docs/ or tools/.
mkdir -p "$staging/$NAME"
cp -r "$SRC/42" "$staging/$NAME/42"

# Stamp the build into mod.info so the in-game mod list names the build it is
# actually about to load. A static "0.1.0-dev" there cost three restarts on
# 2026-09-08 chasing whether Steam had delivered an update: the only way to
# tell was to load a save and read the old evidence window's title bar. The version stays
# single-sourced in Version.lua; this is a copy made at package time, which is
# why the repo's mod.info keeps a placeholder.
info="$staging/$NAME/42/mod.info"
sed -i "s/^modversion=.*/modversion=$version/" "$info"
grep -q "^modversion=$version$" "$info" || {
    echo "failed to stamp modversion into mod.info" >&2; exit 1; }
cp -r "$SRC/common" "$staging/$NAME/common"

# A package that cannot generate a case is worse than no package. Every
# require() in the shipped tree must resolve inside the shipped tree - this is
# the check that would have caught T3Nearby existing only on one machine.
# Two things this scanner has to get right, both learned the hard way:
#
#   * COMMENTS ARE NOT CODE. A comment in init.lua explaining that
#     requiring the package by name resolves to that file contained the call
#     it was describing, and this check dutifully tried to resolve it and
#     refused to package the mod (2026-09-13). Comment lines are stripped
#     first now.
#   * A PACKAGE RESOLVES TO ITS init.lua. Lua's own convention: requiring
#     "ConspiracyFiles" finds ConspiracyFiles/init.lua, which is exactly how
#     the two domain specs load the whole domain. The check only looked for
#     <module>.lua, so the package form could never have resolved.
missing=0
while read -r module; do
    [ -n "$module" ] || continue
    [ -f "$staging/$NAME/common/media/lua/shared/$module.lua" ] && continue
    [ -f "$staging/$NAME/common/media/lua/client/$module.lua" ] && continue
    [ -f "$staging/$NAME/common/media/lua/shared/$module/init.lua" ] && continue
    [ -f "$staging/$NAME/common/media/lua/client/$module/init.lua" ] && continue
    echo "MISSING from package: $module" >&2; missing=$((missing + 1))
done < <(find "$staging/$NAME" -name '*.lua' -print0 \
         | xargs -0 -r sed -E 's/--.*$//' \
         | grep -oE "require\\(\"($PREFIX[^\"]*)\"\\)" \
         | sed -E 's/require\("//; s/"\)//' | sort -u)
[ "$missing" -eq 0 ] || { echo "refusing to package: $missing unresolved require(s)" >&2; exit 1; }
[ -f "$staging/$NAME/42/mod.info" ] || { echo "refusing to package: no mod.info" >&2; exit 1; }

rm -f "$archive"
if command -v zip >/dev/null 2>&1; then
    ( cd "$staging" && zip -qr "$archive" "$NAME" )
else
    python -c "import shutil,sys; shutil.make_archive(sys.argv[1][:-4],'zip',sys.argv[2])" "$archive" "$staging"
fi

files="$(find "$staging/$NAME" -name '*.lua' | wc -l | tr -d ' ')"
echo "packaged $archive"
echo "  version   $version"
echo "  lua files $files"
if command -v sha256sum >/dev/null 2>&1; then
    echo "  sha256    $(sha256sum "$archive" | cut -d' ' -f1)"
fi

if [ "${1:-}" = "--install" ]; then
    [ -n "${CF_INSTALL:-}" ] || { echo "CF_INSTALL not resolved; set ZOMBOID_HOME" >&2; exit 1; }
    install="$CF_INSTALL"
    [ "$NAME" = ConspiracyFiles ] || install="$(dirname "$CF_INSTALL")/$NAME"
    rm -rf "$install"
    mkdir -p "$(dirname "$install")"
    cp -r "$staging/$NAME" "$install"
    echo "installed to $install"
fi

# --stage <dir>: leave the verified tree at <dir> instead of installing it, so
# the Workshop publisher gets the same require-checked payload the zip and the
# local install get. The check above is the whole point; do not stage around it.
if [ "${1:-}" = "--stage" ]; then
    dest="${2:-}"
    [ -n "$dest" ] || { echo "--stage needs a destination directory" >&2; exit 1; }
    rm -rf "$dest"
    mkdir -p "$(dirname "$dest")"
    cp -r "$staging/$NAME" "$dest"
    echo "staged to $dest"
fi
