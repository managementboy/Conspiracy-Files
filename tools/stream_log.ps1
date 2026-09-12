# Stream this machine's Project Zomboid log to the development machine live.
#
#   .\stream_log.ps1
#
# Leave it running in its own window while you play. Whatever the game writes
# arrives on the development machine within a few seconds, so a question can be
# answered mid-session instead of after quitting. Ctrl+C stops it.
#
# Each send is a complete copy of the log, so it can be started at any point -
# before or after the game, before or after loading a save - and nothing is
# missed, including the [CF-SELFCHECK] line written at game start.
#
# Uses only the OpenSSH client, which Windows ships enabled. No elevation, and
# no OpenSSH server on this machine.
#
#   .\stream_log.ps1 -Eval
#
# Also fetches the development machine's live Lua command (tools/cf_eval.sh)
# into Zomboid\Lua\cf_inbox.lua on every loop, where the game's debug-only
# DevEval module runs it. Off by default. Never use -Eval in an attended
# acceptance session: those must run with no injected helpers.

param(
    [string]$DevHost = "elkin@192.168.51.226",
    [string]$DevPath = "/home/elkin/Conspiracy-Files/dev/playtest-logs/incoming",
    [string]$Zomboid = "$env:USERPROFILE\Zomboid",
    [switch]$Eval,
    [string]$EvalInbox = "/home/elkin/Conspiracy-Files/dev/eval/inbox/cf_inbox.lua"
)

# $env:USERPROFILE is whichever account this shell runs as. Running from an
# elevated shell on another account (la_fricke rather than elkin.fricke) points
# it at a profile that has never played. So: use it when it actually holds a
# console.txt, otherwise pick whichever profile on this machine has the newest
# one, and say which was chosen rather than failing quietly.
function Resolve-ZomboidFolder {
    param([string]$Preferred)

    if (Test-Path (Join-Path $Preferred "console.txt")) { return $Preferred }

    # Dropped into the Zomboid folder itself, which is the tidiest place for it:
    # the log is right there, it is always the correct profile, and it does not
    # vanish when Downloads is cleared out.
    if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "console.txt"))) {
        Write-Host "using this script's own folder: $PSScriptRoot" -ForegroundColor Yellow
        return $PSScriptRoot
    }

    $candidates = Get-ChildItem "C:\Users" -Directory -ErrorAction SilentlyContinue |
        ForEach-Object { Join-Path $_.FullName "Zomboid" } |
        Where-Object { Test-Path (Join-Path $_ "console.txt") } |
        Sort-Object { (Get-Item (Join-Path $_ "console.txt")).LastWriteTime } -Descending

    if ($candidates) {
        Write-Host "No console.txt under $Preferred; using $($candidates[0])" -ForegroundColor Yellow
        return $candidates[0]
    }
    return $Preferred
}

$Zomboid = Resolve-ZomboidFolder $Zomboid

$console = Join-Path $Zomboid "console.txt"
if (-not (Test-Path $console)) {
    Write-Host "No console.txt at $console" -ForegroundColor Red
    Write-Host "Start Project Zomboid first, then run this."
    exit 1
}

$age = [int]((Get-Date) - (Get-Item $console).LastWriteTime).TotalMinutes
if ($age -gt 5) {
    Write-Host "console.txt was last written $age minute(s) ago." -ForegroundColor Yellow
    Write-Host "That suggests the game is not running yet. Start it first, or you" -ForegroundColor Yellow
    Write-Host "will stream a stale file and miss this session's start." -ForegroundColor Yellow
    Write-Host ""
}

# Get-Content | ssh hands ssh a pipe as stdin, so it cannot prompt for a
# password: it waits forever for input that can never arrive, and the stream
# looks like it started while nothing is sent. Prove key auth works first,
# with a plain ssh that is allowed to fail fast.
Write-Host "checking key-based access to $DevHost ..."
ssh -o BatchMode=yes -o ConnectTimeout=8 $DevHost "exit" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Cannot reach $DevHost without a password." -ForegroundColor Red
    Write-Host "Streaming pipes the log into ssh, so ssh has no way to ask you for one."
    Write-Host "Set up a key once:"
    Write-Host ""
    Write-Host "  ssh-keygen -t ed25519"
    Write-Host "  type `$env:USERPROFILE\.ssh\id_ed25519.pub | ssh $DevHost `"mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys`""
    Write-Host ""
    Write-Host "Then run this again. (push_log.ps1 still works with a password.)"
    exit 1
}

$stamp  = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$remote = "$DevPath/live-$stamp.txt"

Write-Host "streaming $console"
Write-Host "        -> ${DevHost}:$remote"
Write-Host "Ctrl+C to stop." -ForegroundColor Green
Write-Host ""

if ($Eval) {
    $evalDir   = Join-Path $Zomboid "Lua"
    $evalLocal = Join-Path $evalDir "cf_inbox.lua"
    # Fetched beside the target and moved into place, so the game never reads
    # a half-copied file.
    $evalPart  = Join-Path $evalDir "cf_inbox.lua.part"
    $evalWarned = $false
    New-Item -ItemType Directory -Force -Path $evalDir | Out-Null
    Write-Host "EVAL IS ON: fetching ${DevHost}:$EvalInbox" -ForegroundColor Magenta
    Write-Host "        -> $evalLocal" -ForegroundColor Magenta
    Write-Host "Do not use -Eval in an attended acceptance session." -ForegroundColor Magenta
    Write-Host ""
}

# Copy the whole file every few seconds rather than piping a follower into ssh.
#
# The obvious approach - Get-Content -Wait | ssh "cat >> file" - does not work.
# PowerShell buffers output into a native command, and because -Wait means the
# pipeline never ends, that buffer is never flushed: ssh is handed nothing, the
# remote file is never even created, and the script cheerfully reports that it
# is streaming. Observed on 2026-09-08, twice.
#
# scp of the whole log is wasteful and completely reliable. The log is under a
# megabyte and this is a LAN, so a full copy every few seconds costs nothing
# that matters and has no partial-state failure mode.
$interval = 3
$lastSize = -1
while ($true) {
    try {
        $size = (Get-Item $console).Length
        if ($size -ne $lastSize) {
            scp -q $console "${DevHost}:$remote"
            if ($LASTEXITCODE -eq 0) {
                $kb = [int]($size / 1KB)
                Write-Host ("{0}  sent {1} KB" -f (Get-Date -Format "HH:mm:ss"), $kb)
                $lastSize = $size
            } else {
                Write-Host "scp failed; retrying" -ForegroundColor Yellow
            }
        }
    } catch {
        Write-Host "read failed: $($_.Exception.Message)" -ForegroundColor Yellow
    }
    # Eval never interrupts the log stream: a failure warns once per streak
    # (no command sent yet is the normal case) and the loop carries on.
    if ($Eval) {
        try {
            scp -q "${DevHost}:$EvalInbox" $evalPart 2>$null
            if ($LASTEXITCODE -eq 0) {
                if (-not (Test-Path $evalLocal) -or
                    (Get-FileHash $evalPart).Hash -ne (Get-FileHash $evalLocal).Hash) {
                    Move-Item -Force $evalPart $evalLocal
                    Write-Host ("{0}  eval command fetched" -f (Get-Date -Format "HH:mm:ss"))
                }
                $evalWarned = $false
            } elseif (-not $evalWarned) {
                Write-Host "eval: no command fetched (none sent yet?); log stream continues" -ForegroundColor Yellow
                $evalWarned = $true
            }
        } catch {
            if (-not $evalWarned) {
                Write-Host "eval: $($_.Exception.Message); log stream continues" -ForegroundColor Yellow
                $evalWarned = $true
            }
        }
    }
    Start-Sleep -Seconds $interval
}
