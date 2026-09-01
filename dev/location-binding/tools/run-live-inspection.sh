#!/usr/bin/env bash
set -Eeuo pipefail

# Dead Air P2/R2 live binding runner.
# This runner is intentionally machine/task scoped. It never touches the installed
# game tree or any save other than the named disposable clone.

REPO_ROOT=/home/yogax380/Projects/Conspiracy-Files
PZ_USER_ROOT=/home/yogax380/Zomboid
PZ_LAUNCHER=/home/yogax380/.steam/steam/steamapps/common/ProjectZomboid/projectzomboid.sh
SOURCE_SAVE="$PZ_USER_ROOT/Saves/Sandbox/2026-09-01_13-58-50"
DISPOSABLE_SAVE="$PZ_USER_ROOT/Saves/Sandbox/CF_location_binding"
INSTALLED_PROBE="$PZ_USER_ROOT/mods/ConspiracyFiles_LocationBinding_Probe"
PROBE_SOURCE="$REPO_ROOT/dev/location-binding"
EXPECTED_DEFAULT="$PROBE_SOURCE/setup/default.txt"
EXPECTED_LATEST="$PROBE_SOURCE/setup/latestSave.ini"
RESUME_RUN="$REPO_ROOT/tmp/location-binding-linux-20260901/resumed-run"
DISPLAY_NAME=:2
TARGET_SITE=${1:-P2}

case "$TARGET_SITE" in
    P2) TARGET_WX=1651; TARGET_WY=386; TARGET_X=13208.5; TARGET_Y=3088.5 ;;
    R2) TARGET_WX=1695; TARGET_WY=199; TARGET_X=13564.5; TARGET_Y=1596.5 ;;
    *) printf '[location-binding-runner] ERROR: target site must be P2 or R2, got: %s\n' "$TARGET_SITE" >&2; exit 1 ;;
esac

RUN_DIR=
CONTROL_BACKUP=
CONTROL_HASHES=
ARCHIVE_DIR=
PZ_PID=
PZ_LAUNCH_PID=
XEPHYR_PID=
STARTED_XEPHYR=false
RESTORE_REQUIRED=false
MATRIX_STATUS=INCOMPLETE

log() { printf '[location-binding-runner] %s\n' "$*"; }
die() { log "ERROR: $*"; exit 1; }

control_files_match_probe() {
    cmp -s "$PZ_USER_ROOT/latestSave.ini" "$EXPECTED_LATEST" &&
        cmp -s "$PZ_USER_ROOT/mods/default.txt" "$EXPECTED_DEFAULT" &&
        cmp -s "$DISPOSABLE_SAVE/mods.txt" "$EXPECTED_DEFAULT"
}

stop_pid() {
    local scoped_pid=${1:-}
    [ -n "$scoped_pid" ] || return 0
    kill -0 "$scoped_pid" 2>/dev/null || return 0
    kill -TERM "$scoped_pid" 2>/dev/null || true
    local attempt
    for attempt in 1 2 3 4 5 6 7 8 9 10; do
        kill -0 "$scoped_pid" 2>/dev/null || return 0
        sleep 1
    done
    log "process $scoped_pid did not stop after SIGTERM"
    return 1
}

capture_display() {
    local output_path=$1
    DISPLAY="$DISPLAY_NAME" gst-launch-1.0 -q -e \
        ximagesrc display-name="$DISPLAY_NAME" use-damage=false num-buffers=1 ! \
        videoconvert ! pngenc snapshot=true ! filesink location="$output_path"
}

restore_controls() {
    [ "$RESTORE_REQUIRED" = true ] || return 0
    [ -d "$CONTROL_BACKUP" ] || return 1
    cp "$CONTROL_BACKUP/latestSave.ini" "$PZ_USER_ROOT/latestSave.ini"
    cp "$CONTROL_BACKUP/default.txt" "$PZ_USER_ROOT/mods/default.txt"
    cp "$CONTROL_BACKUP/options.ini" "$PZ_USER_ROOT/options.ini"
    cp "$CONTROL_BACKUP/debuglog.ini" "$PZ_USER_ROOT/debuglog.ini"
    sha256sum -c "$CONTROL_HASHES"
    RESTORE_REQUIRED=false
}

archive_disposable() {
    [ -n "$ARCHIVE_DIR" ] || return 0
    mkdir -p "$ARCHIVE_DIR"
    if [ -f "$PZ_USER_ROOT/console.txt" ]; then
        cp "$PZ_USER_ROOT/console.txt" "$ARCHIVE_DIR/console.txt"
        rg '\[CF-LOC\]' "$PZ_USER_ROOT/console.txt" > "$ARCHIVE_DIR/cf-loc-filtered.txt" || true
    fi
    if [ -d "$DISPOSABLE_SAVE" ]; then
        mv "$DISPOSABLE_SAVE" "$ARCHIVE_DIR/save-CF_location_binding"
    fi
    if [ -d "$INSTALLED_PROBE" ]; then
        mv "$INSTALLED_PROBE" "$ARCHIVE_DIR/mod-ConspiracyFiles_LocationBinding_Probe"
    fi
}

cleanup() {
    local exit_status=$?
    trap - EXIT INT TERM
    set +e
    if [ -z "$PZ_PID" ]; then
        PZ_PID=$(pgrep -f '^./ProjectZomboid64 -debug -nosteam$' | head -n 1)
    fi
    stop_pid "$PZ_PID"
    stop_pid "$PZ_LAUNCH_PID"
    archive_disposable
    restore_controls
    stop_pid "$XEPHYR_PID"
    if pgrep -f '^./ProjectZomboid64 -debug -nosteam$' >/dev/null; then
        log 'ERROR: Project Zomboid remains running after cleanup'
        exit_status=1
    fi
    log "cleanup complete; matrix=$MATRIX_STATUS; archive=${ARCHIVE_DIR:-none}"
    exit "$exit_status"
}
trap cleanup EXIT INT TERM

cd "$REPO_ROOT"
[ -x "$PZ_LAUNCHER" ] || die "launcher missing: $PZ_LAUNCHER"
[ -d "$SOURCE_SAVE" ] || die "approved disposable source save missing: $SOURCE_SAVE"
[ -f "$EXPECTED_DEFAULT" ] || die 'probe mod-list template missing'
[ -f "$EXPECTED_LATEST" ] || die 'probe latest-save template missing'
lua5.1 -e 'assert(loadfile("dev/location-binding/common/media/lua/shared/ConspiracyFilesLocationBindingProbe.lua"))'

CURRENT_PZ=$(pgrep -f '^./ProjectZomboid64 -debug -nosteam$' | head -n 1 || true)
if [ -n "$CURRENT_PZ" ]; then
    [ -d "$DISPOSABLE_SAVE" ] || die 'running PZ process exists without the disposable save'
    [ -d "$INSTALLED_PROBE" ] || die 'running PZ process exists without the installed probe'
    control_files_match_probe || die 'running PZ process is not using the exact probe controls'
    [ -d "$RESUME_RUN/control-before" ] || die 'resumed control backup is missing'
    [ -f "$RESUME_RUN/control-before.sha256" ] || die 'resumed control hashes are missing'
    RUN_DIR=$RESUME_RUN
    CONTROL_BACKUP="$RUN_DIR/control-before"
    CONTROL_HASHES="$RUN_DIR/control-before.sha256"
    PZ_PID=$CURRENT_PZ
    RESTORE_REQUIRED=true
    log "adopting verified disposable PZ process $PZ_PID"
else
    [ ! -e "$DISPOSABLE_SAVE" ] || die "refusing to overwrite existing $DISPOSABLE_SAVE"
    [ ! -e "$INSTALLED_PROBE" ] || die "refusing to overwrite existing $INSTALLED_PROBE"
    RUN_DIR="$REPO_ROOT/tmp/location-binding-live-$TARGET_SITE-$(date +%Y%m%d-%H%M%S)"
    CONTROL_BACKUP="$RUN_DIR/control-before"
    CONTROL_HASHES="$RUN_DIR/control-before.sha256"
    mkdir -p "$CONTROL_BACKUP" "$RUN_DIR/screenshots"
    cp -a "$PZ_USER_ROOT/latestSave.ini" "$PZ_USER_ROOT/mods/default.txt" \
        "$PZ_USER_ROOT/options.ini" "$PZ_USER_ROOT/debuglog.ini" "$CONTROL_BACKUP/"
    sha256sum "$PZ_USER_ROOT/latestSave.ini" "$PZ_USER_ROOT/mods/default.txt" \
        "$PZ_USER_ROOT/options.ini" "$PZ_USER_ROOT/debuglog.ini" > "$CONTROL_HASHES"
    RESTORE_REQUIRED=true
    cp -a "$SOURCE_SAVE" "$DISPOSABLE_SAVE"
    python3 -c 'import sqlite3,struct,sys; p=sys.argv[1]; wx,wy=int(sys.argv[2]),int(sys.argv[3]); x,y=float(sys.argv[4]),float(sys.argv[5]); c=sqlite3.connect(p); data=bytearray(c.execute("select data from localPlayers where id=1").fetchone()[0]); struct.pack_into(">f",data,10,x); struct.pack_into(">f",data,14,y); struct.pack_into(">f",data,18,0.0); c.execute("update localPlayers set wx=?,wy=?,x=?,y=?,z=?,data=? where id=1",(wx,wy,x,y,0.0,bytes(data))); c.commit(); row=c.execute("select wx,wy,x,y,z,data from localPlayers where id=1").fetchone(); c.close(); assert row[:5]==(wx,wy,x,y,0.0),row[:5]; assert struct.unpack_from(">fff",row[5],10)==(x,y,0.0),struct.unpack_from(">fff",row[5],10)' "$DISPOSABLE_SAVE/players.db" "$TARGET_WX" "$TARGET_WY" "$TARGET_X" "$TARGET_Y"
    mkdir -p "$INSTALLED_PROBE/common/media/lua/client"
    cp -a "$PROBE_SOURCE/42" "$INSTALLED_PROBE/"
    cp "$PROBE_SOURCE/common/media/lua/shared/ConspiracyFilesLocationBindingProbe.lua" \
        "$INSTALLED_PROBE/common/media/lua/client/"
    cp "$EXPECTED_DEFAULT" "$DISPOSABLE_SAVE/mods.txt"
    cp "$EXPECTED_DEFAULT" "$PZ_USER_ROOT/mods/default.txt"
    cp "$EXPECTED_LATEST" "$PZ_USER_ROOT/latestSave.ini"
    sed -i 's/^showSurvivalGuide=true$/showSurvivalGuide=false/' "$PZ_USER_ROOT/options.ini"
    sed -i 's/^focusloss=true$/focusloss=false/' "$PZ_USER_ROOT/options.ini"
    rg -q '^showSurvivalGuide=false$' "$PZ_USER_ROOT/options.ini" || die 'failed to disable the auto-pausing Survival Guide'
    rg -q '^focusloss=false$' "$PZ_USER_ROOT/options.ini" || die 'failed to disable isolated-window focus-loss pause'
fi

mkdir -p "$RUN_DIR/screenshots" "$RUN_DIR/archive"
ARCHIVE_DIR="$RUN_DIR/archive/live-$(date +%Y%m%d-%H%M%S)"

CURRENT_XEPHYR=$(pgrep -f '^Xephyr :2 ' | head -n 1 || true)
if [ -n "$CURRENT_XEPHYR" ]; then
    XEPHYR_PID=$CURRENT_XEPHYR
    log "using existing isolated display process $XEPHYR_PID"
else
    Xephyr "$DISPLAY_NAME" -screen 1920x1080 -br -noreset -nolisten tcp > "$RUN_DIR/xephyr.log" 2>&1 &
    XEPHYR_PID=$!
    STARTED_XEPHYR=true
    for attempt in 1 2 3 4 5 6 7 8 9 10; do
        DISPLAY="$DISPLAY_NAME" xdpyinfo >/dev/null 2>&1 && break
        sleep 1
    done
    DISPLAY="$DISPLAY_NAME" xdpyinfo >/dev/null 2>&1 || die 'isolated display did not start'
fi

DISPLAY="$DISPLAY_NAME" glxinfo -B > "$RUN_DIR/glxinfo.txt"
rg -q 'OpenGL version string: 4\.' "$RUN_DIR/glxinfo.txt" || die 'isolated OpenGL 4.x context unavailable'

if [ -z "$PZ_PID" ]; then
    if [ -f "$PZ_USER_ROOT/console.txt" ]; then
        cp "$PZ_USER_ROOT/console.txt" "$RUN_DIR/console-before.txt"
        truncate -s 0 "$PZ_USER_ROOT/console.txt"
    fi
    DISPLAY="$DISPLAY_NAME" LIBGL_ALWAYS_SOFTWARE=1 "$PZ_LAUNCHER" -debug -nosteam > "$RUN_DIR/launcher.stdout" 2> "$RUN_DIR/launcher.stderr" &
    PZ_LAUNCH_PID=$!
    for attempt in $(seq 1 30); do
        PZ_PID=$(pgrep -f '^./ProjectZomboid64 -debug -nosteam$' | head -n 1 || true)
        [ -n "$PZ_PID" ] && break
        sleep 1
    done
    [ -n "$PZ_PID" ] || die 'Project Zomboid process did not start'
fi

for attempt in $(seq 1 300); do
    rg -q '\[CF-LOC\].*kind=AUTO_CONTINUE' "$PZ_USER_ROOT/console.txt" 2>/dev/null &&
        rg -q 'game loading took' "$PZ_USER_ROOT/console.txt" 2>/dev/null && break
    kill -0 "$PZ_PID" 2>/dev/null || die 'Project Zomboid exited before the loading gate'
    sleep 1
done
rg -q 'game loading took' "$PZ_USER_ROOT/console.txt" || die 'loading gate timeout'

PZ_WINDOW_ID=
for attempt in $(seq 1 30); do
    PZ_WINDOW_ID=$(DISPLAY="$DISPLAY_NAME" xwininfo -root -tree | awk '/"Project Zomboid"/ {print $1; exit}')
    [ -n "$PZ_WINDOW_ID" ] && break
    kill -0 "$PZ_PID" 2>/dev/null || die 'Project Zomboid exited before creating its isolated window'
    sleep 1
done
[ -n "$PZ_WINDOW_ID" ] || die 'Project Zomboid window not found on isolated display'
capture_display "$RUN_DIR/screenshots/loading-gate.png"
DISPLAY="$DISPLAY_NAME" python3 -c 'import ctypes,ctypes.util,sys,time; x=ctypes.CDLL(ctypes.util.find_library("X11")); t=ctypes.CDLL(ctypes.util.find_library("Xtst")); x.XOpenDisplay.restype=ctypes.c_void_p; d=x.XOpenDisplay(None); assert d; w=int(sys.argv[1],0); x.XMoveResizeWindow(d,w,0,0,1920,1080); x.XMapRaised(d,w); x.XSetInputFocus(d,w,1,0); t.XTestFakeMotionEvent(d,-1,960,540,0); x.XFlush(d); time.sleep(0.5); t.XTestFakeButtonEvent(d,1,True,0); x.XFlush(d); time.sleep(1.5); t.XTestFakeButtonEvent(d,1,False,0); x.XFlush(d); time.sleep(0.2); x.XCloseDisplay(d)' "$PZ_WINDOW_ID"
capture_display "$RUN_DIR/screenshots/gate-released.png"

for attempt in $(seq 1 300); do
    rg -q '\[CF-LOC\].*kind=ENVIRONMENT' "$PZ_USER_ROOT/console.txt" && break
    kill -0 "$PZ_PID" 2>/dev/null || die 'Project Zomboid exited before probe OnGameStart'
    if [ "$attempt" = 60 ]; then
        capture_display "$RUN_DIR/screenshots/world-entry-$attempt.png"
    elif [ "$attempt" = 180 ]; then
        capture_display "$RUN_DIR/screenshots/world-entry-$attempt.png"
    fi
    sleep 1
done
rg -q '\[CF-LOC\].*kind=ENVIRONMENT' "$PZ_USER_ROOT/console.txt" || die 'probe did not begin its environment scan after OnGameStart'
capture_display "$RUN_DIR/screenshots/world-entered.png"

P2_CAPTURED=false
R2_CAPTURED=false
for attempt in $(seq 1 480); do
    if [ "$P2_CAPTURED" = false ] && rg -q '\[CF-LOC\].*kind=SCREENSHOT_READY.*site=P2' "$PZ_USER_ROOT/console.txt"; then
        capture_display "$RUN_DIR/screenshots/P2-ready.png"
        P2_CAPTURED=true
    fi
    if [ "$R2_CAPTURED" = false ] && rg -q '\[CF-LOC\].*kind=SCREENSHOT_READY.*site=R2' "$PZ_USER_ROOT/console.txt"; then
        capture_display "$RUN_DIR/screenshots/R2-ready.png"
        R2_CAPTURED=true
    fi
    if rg -q '\[CF-LOC\].*kind=MATRIX_RESULT' "$PZ_USER_ROOT/console.txt"; then break; fi
    kill -0 "$PZ_PID" 2>/dev/null || die 'Project Zomboid exited before matrix result'
    sleep 1
done

rg '\[CF-LOC\]' "$PZ_USER_ROOT/console.txt" > "$RUN_DIR/cf-loc-filtered.txt"
if rg -q '\[CF-LOC\].*kind=MATRIX_RESULT.*status=PASS' "$RUN_DIR/cf-loc-filtered.txt"; then
    MATRIX_STATUS=PASS
else
    MATRIX_STATUS=FAIL
    die 'location binding matrix did not pass'
fi

for attempt in $(seq 1 30); do
    kill -0 "$PZ_PID" 2>/dev/null || break
    sleep 1
done
log "live matrix PASS; site=$TARGET_SITE; evidence=$RUN_DIR/cf-loc-filtered.txt"
