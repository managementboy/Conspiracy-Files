#!/usr/bin/env bash
# Publish the mod to the Steam Workshop, unlisted by default.
#
#   tools/publish_workshop.sh --dry-run          build and show what would upload
#   tools/publish_workshop.sh                    upload at the stored visibility
#   tools/publish_workshop.sh --visibility 0     ... and make it public
#
# Two machines, one account: this machine develops and publishes, the other
# subscribes and plays. Steam pushes the update to the play machine; nothing is
# copied by hand and the two can never silently diverge.
#
# THERE IS NO MOD SIGNING IN PROJECT ZOMBOID. If you came here looking for a
# signing step, there isn't one and nothing is missing: a PZ mod is mod.info
# plus a media tree. Steam signs nothing about the item either.
#
# CREDENTIALS ARE NOT HANDLED HERE. Log in once, yourself, interactively:
#
#     steamcmd +login managementboy
#
# steamcmd caches that session, so this script can then run non-interactively
# with only the username. It never asks for, stores or passes a password, and
# you should never put one in a script or an environment variable.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
. "$REPO/tools/env.sh"

APPID=108600
# The account that owns this Workshop item. A username is not a secret; the
# password is, and nothing here ever touches one. Override with STEAM_USER=...
STEAM_USER_DEFAULT=managementboy
: "${STEAM_USER:=$STEAM_USER_DEFAULT}"
ITEM_DIR="$REPO/tools/workshop"
ID_FILE="$ITEM_DIR/published_file_id"
PREVIEW="$ITEM_DIR/preview.png"
BUILD="$REPO/dist/workshop"
CONTENT="$BUILD/content"
VDF="$BUILD/item.vdf"

# 0 public, 1 friends-only, 2 private, 3 unlisted.
# Unlisted is the default on purpose: it does not appear in search, but anyone
# with the link - including you, on the other machine - can subscribe. Private
# is stricter but is unreliable for actually downloading a subscription.
visibility="${CF_WORKSHOP_VISIBILITY:-3}"
dry_run=0
changenote="${CF_CHANGENOTE:-}"

while [ $# -gt 0 ]; do
    case "$1" in
        --dry-run)    dry_run=1; shift ;;
        --visibility) visibility="${2:-}"; shift 2 ;;
        --changenote) changenote="${2:-}"; shift 2 ;;
        *) echo "unknown argument: $1" >&2; exit 2 ;;
    esac
done

case "$visibility" in
    0|1|2|3) ;;
    *) echo "--visibility must be 0 public, 1 friends, 2 private or 3 unlisted" >&2; exit 2 ;;
esac

version="$(grep -o 'UI.VERSION="[^"]*"' "$REPO/mod/common/media/lua/client/ConspiracyFiles/Notebook.lua" | head -1 | sed 's/.*="//;s/"//')"
[ -n "$version" ] || { echo "could not read UI.VERSION from Notebook.lua" >&2; exit 1; }
[ -n "$changenote" ] || changenote="$version"

# Build through package.sh so the Workshop payload is the same require-checked
# tree as the zip and the local install. A Workshop item that cannot generate a
# case is worse than no Workshop item.
rm -rf "$BUILD"
mkdir -p "$CONTENT/mods"
"$REPO/tools/package.sh" --stage "$CONTENT/mods/ConspiracyFiles" >/dev/null

# Steam strips nothing and adds nothing: whatever is in contentfolder becomes
# the item root, and the game expects to find mods/<id>/ there. This mirrors the
# layout an installed Workshop item actually has on disk.
[ -f "$CONTENT/mods/ConspiracyFiles/42/mod.info" ] || {
    echo "staged tree has no 42/mod.info; refusing to upload" >&2; exit 1; }

published_id="0"
[ -f "$ID_FILE" ] && published_id="$(tr -d ' \n\r' < "$ID_FILE")"
[ -n "$published_id" ] || published_id="0"

description="$(cat "$ITEM_DIR/description.txt" 2>/dev/null || echo "Conspiracy-Files: Dead Air")"

# steamcmd wants a VDF, and a VDF string is single-line: a literal newline ends
# it and Steam then fails with "got } in key". The description is several
# paragraphs, so newlines must become the two-character escape \n, not be
# passed through. Quotes and backslashes need escaping for the same reason.
vdf_escape() {
    printf '%s' "$1" \
        | sed 's/\\/\\\\/g; s/"/\\"/g' \
        | awk 'BEGIN { ORS = "" } NR > 1 { print "\\n" } { print }'
}

{
    echo '"workshopitem"'
    echo '{'
    echo "    \"appid\"           \"$APPID\""
    echo "    \"publishedfileid\" \"$published_id\""
    echo "    \"contentfolder\"   \"$CONTENT\""
    [ -f "$PREVIEW" ] && echo "    \"previewfile\"     \"$PREVIEW\""
    echo "    \"visibility\"      \"$visibility\""
    echo "    \"title\"           \"Conspiracy-Files: Dead Air\""
    echo "    \"description\"     \"$(vdf_escape "$description")\""
    echo "    \"changenote\"      \"$(vdf_escape "$changenote")\""
    echo '}'
} > "$VDF"

# A value that still contains a raw newline splits its line and Steam rejects
# the whole file with an unhelpful "got } in key". Catch it here: every key is
# exactly one line, so the total is the three structural lines plus the keys.
expected_lines=$(( 3 + 7 ))
[ -f "$PREVIEW" ] && expected_lines=$(( expected_lines + 1 ))
actual_lines="$(wc -l < "$VDF" | tr -d ' ')"
[ "$actual_lines" -eq "$expected_lines" ] || {
    echo "generated VDF is malformed: expected $expected_lines lines, got $actual_lines." >&2
    echo "A value contains an unescaped newline. See $VDF" >&2
    exit 1; }

lua_files="$(find "$CONTENT" -name '*.lua' | wc -l | tr -d ' ')"
vis_name=$(case "$visibility" in 0) echo public;; 1) echo friends-only;; 2) echo private;; 3) echo unlisted;; esac)

echo "workshop payload"
echo "  version     $version"
echo "  lua files   $lua_files"
echo "  visibility  $vis_name ($visibility)"
echo "  account     $STEAM_USER"
echo "  item        $([ "$published_id" = "0" ] && echo 'NEW - will be created' || echo "$published_id")"
echo "  changenote  $changenote"
[ -f "$PREVIEW" ] || echo "  preview     none (Workshop page will have no image)"
echo "  vdf         $VDF"

if [ "$dry_run" -eq 1 ]; then
    echo
    echo "dry run: nothing uploaded."
    exit 0
fi

command -v steamcmd >/dev/null 2>&1 || {
    echo "steamcmd not found. Install it, then log in once interactively:" >&2
    echo "  sudo apt install steamcmd && steamcmd +login $STEAM_USER" >&2
    exit 2; }

[ "$STEAM_USER" = "$STEAM_USER_DEFAULT" ] \
    || echo "publishing as $STEAM_USER, not the usual $STEAM_USER_DEFAULT"

echo
echo "uploading as $STEAM_USER ..."
# Steam reports a failed build on stdout and still exits 0 in some versions, so
# check the output rather than trusting the exit status alone.
out="$(steamcmd +login "$STEAM_USER" +workshop_build_item "$VDF" +quit 2>&1)" || true
printf '%s\n' "$out" | tail -20

if printf '%s' "$out" | grep -qi 'Success.*workshop'; then
    new_id="$(printf '%s' "$out" | grep -oE 'PublishFileID [0-9]+' | grep -oE '[0-9]+' | head -1)"
    if [ -n "$new_id" ] && [ "$new_id" != "$published_id" ]; then
        mkdir -p "$ITEM_DIR"
        printf '%s\n' "$new_id" > "$ID_FILE"
        echo
        echo "new Workshop item $new_id - recorded in $ID_FILE."
        echo "COMMIT THAT FILE, or the next publish creates a second item."
    fi
    echo
    echo "published. Subscribe on the play machine:"
    echo "  https://steamcommunity.com/sharedfiles/filedetails/?id=${new_id:-$published_id}"
else
    echo
    echo "upload did not report success. Nothing was recorded." >&2
    echo "If it asked for a login, run: steamcmd +login $STEAM_USER" >&2
    exit 1
fi
