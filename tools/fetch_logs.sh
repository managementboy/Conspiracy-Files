#!/usr/bin/env bash
# Pull the play machine's Project Zomboid logs onto the development machine.
#
#   tools/fetch_logs.sh              our lines plus every WARN/ERROR (the fast path)
#   tools/fetch_logs.sh --full       the whole console.txt, engine chatter included
#   tools/fetch_logs.sh --all        also the timestamped Logs/ folder
#   tools/fetch_logs.sh --list       show what is on the play machine, fetch nothing
#   tools/fetch_logs.sh --incoming   summarise a log the play machine pushed here
#   tools/fetch_logs.sh --live       watch a session streaming in right now
#
# Development and play are on different machines, so the log has to come here
# before it can be read. scp rather than rsync: the play machine is Windows and
# will not have rsync, but OpenSSH ships with it.
#
# One-time setup on the WINDOWS play machine, in an admin PowerShell:
#
#     Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
#     Start-Service sshd
#     Set-Service -Name sshd -StartupType Automatic
#
# Then set the host here, once, in your shell profile or on each call:
#
#     export CF_PLAY_HOST=elkin.fricke@192.168.1.42
#
# Nothing here handles a password. Use an SSH key so this runs unattended:
#     ssh-keygen -t ed25519            (if you have no key yet)
#     ssh-copy-id "$CF_PLAY_HOST"      (or paste the .pub into the file below)
# Windows puts an ADMIN user's keys in C:\ProgramData\ssh\administrators_authorized_keys,
# NOT in the user's .ssh\authorized_keys. A key in the wrong file is the usual
# reason Windows still asks for a password.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Where the Zomboid folder lives on the play machine. Forward slashes work in
# scp remote paths and avoid backslash quoting through two shells.
: "${CF_PLAY_ZOMBOID:=C:/Users/elkin.fricke/Zomboid}"
DEST="$REPO/dev/playtest-logs"

want_all=0
# Default to the filtered fetch: on a long session the engine's own chatter is
# most of the file and none of it is ours. --full when you want all of it.
want_full=0
list_only=0
summarise_only=""
incoming=0
live=0
while [ $# -gt 0 ]; do
    case "$1" in
        --all)  want_all=1; shift ;;
        --full) want_full=1; shift ;;
        --list) list_only=1; shift ;;
        --summarise) summarise_only="${2:-}"; shift 2 ;;
        --incoming)  incoming=1; shift ;;
        --live)      live=1; shift ;;
        *) echo "unknown argument: $1" >&2; exit 2 ;;
    esac
done

# The self-check explains everything downstream, so surface it first and by
# name. A module that did not load has shipped three times; do not make anyone
# go looking for that line.
summarise() {
    local log="$1"
    local selfcheck
    selfcheck="$(grep -F '[CF-SELFCHECK]' "$log" | tail -1 || true)"
    if [ -z "$selfcheck" ]; then
        echo "NO [CF-SELFCHECK] LINE. The mod did not reach game start."
        echo "Check the mod is enabled, and that the game was launched with -debug."
    elif printf '%s' "$selfcheck" | grep -q 'NOT LOADED'; then
        echo "SELF-CHECK FAILED: $selfcheck"
        echo "Everything below is suspect until that is fixed."
    else
        echo "$selfcheck"
    fi
    echo

    printf '%-16s %s\n' "tag" "lines"
    local tag n
    for tag in CF-G2 CF-LEDGER CF-VOICE CF-G2-HINT CF-PERSON CF-IDENTITY CF-ID; do
        n="$(grep -cF "[$tag]" "$log" || true)"
        [ "$n" = "0" ] || printf '%-16s %s\n' "$tag" "$n"
    done

    # A bare grep for "error" is useless here: FMOD alone prints dozens of
    # "result: No errors." lines, which is how a clean 2026-09-08 log first
    # looked like it had 50 problems. Match real markers, drop the negations,
    # and separate ours from the engine's own routine complaints.
    local engine ours
    engine="$(grep -E '^(ERROR|WARN)|Exception|stack traceback' "$log" \
        | grep -vciE 'no errors' || true)"
    ours="$(grep -E '^(ERROR|WARN)|Exception|stack traceback' "$log" \
        | grep -viE 'no errors' | grep -ciE 'conspiracy|\[CF-' || true)"

    echo
    if [ "$ours" != "0" ]; then
        echo "$ours error lines mention Conspiracy-Files. These are ours:"
        grep -E '^(ERROR|WARN)|Exception|stack traceback' "$log" \
            | grep -viE 'no errors' | grep -iE 'conspiracy|\[CF-' | head -5 | cut -c1-160 | sed 's/^/  /'
    elif [ "$engine" != "0" ]; then
        echo "$engine engine error/warning lines, none mentioning Conspiracy-Files."
        echo "Vanilla PZ logs these routinely; check them only if something looks wrong."
    else
        echo "no error or warning lines."
    fi
}

if [ -n "$summarise_only" ]; then
    [ -f "$summarise_only" ] || { echo "no such log: $summarise_only" >&2; exit 2; }
    summarise "$summarise_only"
    exit 0
fi

# --live: a session is streaming in right now. Show whether it is actually
# still arriving, then the newest Conspiracy-Files lines. Growth matters: a
# stream that died looks identical to a quiet game until you measure it.
if [ "$live" -eq 1 ]; then
    newest="$(ls -1t "$DEST/incoming"/*.txt 2>/dev/null | head -1 || true)"
    [ -n "$newest" ] || { echo "nothing streaming into $DEST/incoming." >&2; exit 1; }
    before="$(wc -c < "$newest")"
    sleep 3
    after="$(wc -c < "$newest")"
    echo "$newest"
    if [ "$after" -gt "$before" ]; then
        echo "  LIVE - grew $(( after - before )) bytes in 3s, $(wc -l < "$newest" | tr -d ' ') lines total"
    else
        echo "  not growing. $(wc -l < "$newest" | tr -d ' ') lines, last written $(date -r "$newest" '+%H:%M:%S')."
        echo "  The game may be paused or closed, or the stream stopped."
    fi
    echo
    summarise "$newest"
    echo
    echo "last Conspiracy-Files lines:"
    grep -F '[CF-' "$newest" | tail -12 | cut -c1-170 | sed 's/^/  /'
    exit 0
fi

# --incoming: the play machine pushed the log here instead of us pulling it.
# A company-managed Windows box may be unable to install the OpenSSH *server*
# from Windows Update, while the *client* ships enabled by default - so pushing
# works where pulling cannot. Summarise the newest thing that arrived.
if [ "$incoming" -eq 1 ]; then
    newest="$(ls -1t "$DEST/incoming"/*.txt 2>/dev/null | head -1 || true)"
    [ -n "$newest" ] || {
        echo "nothing in $DEST/incoming." >&2
        echo "On the play machine, push one with:" >&2
        echo "  scp \$env:USERPROFILE\\Zomboid\\console.txt USER@HOST:$DEST/incoming/console.txt" >&2
        exit 1; }
    echo "$newest"
    echo "  arrived $(date -r "$newest" '+%Y-%m-%d %H:%M:%S'), $(wc -l < "$newest" | tr -d ' ') lines"
    echo
    summarise "$newest"
    exit 0
fi

[ -n "${CF_PLAY_HOST:-}" ] || {
    echo "CF_PLAY_HOST is not set. Point it at the play machine, e.g." >&2
    echo "  export CF_PLAY_HOST=elkin.fricke@192.168.1.42" >&2
    exit 2; }

ssh_opts="-o ConnectTimeout=8 -o BatchMode=yes"

# BatchMode means a missing key fails immediately instead of hanging on a
# password prompt that nothing here can answer.
ssh $ssh_opts "$CF_PLAY_HOST" "exit" 2>/dev/null || {
    echo "cannot reach $CF_PLAY_HOST without a password." >&2
    echo "Check the host is up and sshd is running, and that your key is installed." >&2
    echo "On Windows an admin user's key goes in:" >&2
    echo "  C:\\ProgramData\\ssh\\administrators_authorized_keys" >&2
    exit 1; }

if [ "$list_only" -eq 1 ]; then
    echo "on $CF_PLAY_HOST in $CF_PLAY_ZOMBOID:"
    ssh $ssh_opts "$CF_PLAY_HOST" "dir \"${CF_PLAY_ZOMBOID//\//\\}\\console.txt\" \"${CF_PLAY_ZOMBOID//\//\\}\\Logs\"" 2>&1 | sed 's/^/  /'
    exit 0
fi

stamp="$(date +%Y-%m-%d_%H-%M-%S)"
out="$DEST/$stamp"
mkdir -p "$out"

echo "fetching from $CF_PLAY_HOST ..."
if [ "$want_full" -eq 1 ]; then
    scp $ssh_opts -q "$CF_PLAY_HOST:$CF_PLAY_ZOMBOID/console.txt" "$out/console.txt" || {
        echo "could not copy console.txt from $CF_PLAY_ZOMBOID." >&2
        echo "If the Zomboid folder is elsewhere, set CF_PLAY_ZOMBOID." >&2
        rmdir "$out" 2>/dev/null || true
        exit 1; }
else
    # Filter on the PLAY machine, so a long session copies kilobytes instead of
    # megabytes. Measured on a short launch: 400 of 487 lines were the engine
    # repeating "BLANK OVERLAY TEXTURE" once per floor sprite - 82% of the file,
    # none of it ours.
    #
    # WARN and ERROR come too, deliberately. The engine's own failures are how
    # a mod crash gets explained, and dropping them to save bytes would be
    # saving the wrong thing. `findstr` ships with Windows; multiple /C: are OR.
    ssh $ssh_opts "$CF_PLAY_HOST" \
        "findstr /C:\"[CF]\" /C:\"ERROR\" /C:\"WARN\" \"${CF_PLAY_ZOMBOID//\//\\}\\console.txt\"" \
        > "$out/console.txt" 2>/dev/null || true
    if [ ! -s "$out/console.txt" ]; then
        echo "no matching lines fetched; falling back to the whole file." >&2
        scp $ssh_opts -q "$CF_PLAY_HOST:$CF_PLAY_ZOMBOID/console.txt" "$out/console.txt" || {
            echo "could not copy console.txt from $CF_PLAY_ZOMBOID." >&2
            rmdir "$out" 2>/dev/null || true
            exit 1; }
    fi
fi

if [ "$want_all" -eq 1 ]; then
    scp $ssh_opts -qr "$CF_PLAY_HOST:$CF_PLAY_ZOMBOID/Logs" "$out/Logs" 2>/dev/null \
        || echo "  (no Logs folder copied)"
fi

ln -sfn "$stamp" "$DEST/latest"

lines="$(wc -l < "$out/console.txt" | tr -d ' ')"
if [ "$want_full" -eq 1 ]; then
    echo "  $out/console.txt  ($lines lines, whole file)"
else
    echo "  $out/console.txt  ($lines lines: ours, plus every WARN and ERROR)"
    echo "  (tools/fetch_logs.sh --full for the engine chatter as well)"
fi
echo "  $DEST/latest -> $stamp"
echo

summarise "$out/console.txt"
