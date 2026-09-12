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

version="$(grep -o 'ConspiracyFiles.VERSION = "[^"]*"' "$REPO/mod/common/media/lua/shared/ConspiracyFiles/Version.lua" | head -1 | sed 's/.*= "//;s/"//')"
[ -n "$version" ] || { echo "could not read ConspiracyFiles.VERSION from Version.lua" >&2; exit 1; }
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

# steamcmd wants a VDF, and Valve's KeyValues parser reads these files with
# escape sequences OFF. A backslash is therefore an ordinary character and \"
# does NOT escape a quote: it is a backslash followed by a quote that ends the
# string early. Steam then swallows the rest of the file and reports "got } in
# key" against the closing brace, naming nothing useful.
#
# So a value cannot contain a double quote or a backslash at all. Replace them
# rather than escape them. A VDF string is also single-line, and \n is likewise
# not an escape, so paragraph breaks cannot survive here - the description is
# flattened to one line and its real formatting is set on the Workshop page.
vdf_escape() {
    printf '%s' "$1" \
        | tr '\\' '/' \
        | sed "s/\"/'/g" \
        | awk 'BEGIN { ORS = "" } NR > 1 { print " " } { print }'
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

# Steam's parse failure names the closing brace rather than the bad value, so
# check the file here instead. Every key line is exactly "key" "value" - four
# quote characters - and a stray quote or newline in a value breaks that count.
# This is the check that would have caught both upload failures on 2026-09-08.
expected_lines=$(( 3 + 7 ))
[ -f "$PREVIEW" ] && expected_lines=$(( expected_lines + 1 ))
actual_lines="$(wc -l < "$VDF" | tr -d ' ')"
[ "$actual_lines" -eq "$expected_lines" ] || {
    echo "generated VDF is malformed: expected $expected_lines lines, got $actual_lines." >&2
    echo "A value contains a newline. See $VDF" >&2
    exit 1; }

bad_line="$(awk 'NR > 2 && /^ / { n = gsub(/"/, "\""); if (n != 4) { print NR": "$0; exit } }' "$VDF")"
[ -z "$bad_line" ] || {
    echo "generated VDF has a key line without exactly 4 quotes:" >&2
    echo "  $bad_line" >&2
    echo "A value contains a double quote. Steam reads these files with escape" >&2
    echo "sequences off, so it cannot be escaped - remove it. See $VDF" >&2
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

# steamcmd prints a bare "Success." and immediately concatenates the next line
# onto it, so match that and the explicit ERROR! rather than any richer phrase.
# Getting this wrong is expensive: a successful upload whose ID is not recorded
# makes the NEXT publish create a second, unrelated Workshop item.
if printf '%s' "$out" | grep -q 'ERROR!'; then
    printf '%s\n' "$out" | grep 'ERROR!' >&2
    echo "upload failed. Nothing was recorded." >&2
    exit 1
elif printf '%s' "$out" | grep -q 'Success\.'; then
    new_id="$(printf '%s' "$out" | grep -oE 'PublishFileID [0-9]+' | grep -oE '[0-9]+' | head -1)"
    if [ -n "$new_id" ] && [ "$new_id" != "$published_id" ]; then
        mkdir -p "$ITEM_DIR"
        printf '%s\n' "$new_id" > "$ID_FILE"
        echo
        echo "new Workshop item $new_id - recorded in $ID_FILE."
        echo "COMMIT THAT FILE, or the next publish creates a second item."
    fi
    if [ "$published_id" = "0" ] && [ -z "$new_id" ]; then
        echo
        echo "UPLOAD SUCCEEDED BUT NO ITEM ID WAS FOUND IN THE OUTPUT." >&2
        echo "Find it at https://steamcommunity.com/id/me/myworkshopfiles/ and put" >&2
        echo "it in $ID_FILE before publishing again, or the next publish will" >&2
        echo "create a second item." >&2
        exit 1
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
