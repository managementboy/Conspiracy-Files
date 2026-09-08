# Stream this machine's Project Zomboid log to the development machine live.
#
#   .\stream_log.ps1
#
# Leave it running in its own window while you play. Every line the game writes
# arrives on the development machine within about a second, so a question can be
# answered mid-session instead of after quitting. Ctrl+C stops it.
#
# START THE GAME FIRST, THEN THIS. Project Zomboid truncates console.txt when it
# launches, and a follower attached across that truncation keeps reading the old
# handle and reports nothing. Launching first also means the whole file belongs
# to this session, including the [CF-SELFCHECK] line at game start - which is
# the single most important line and is written in the first seconds.
#
# Uses only the OpenSSH client, which Windows ships enabled. No elevation, and
# no OpenSSH server on this machine.

param(
    [string]$DevHost = "elkin@192.168.50.226",
    [string]$DevPath = "/home/elkin/Conspiracy-Files/dev/playtest-logs/incoming",
    [string]$Zomboid = "$env:USERPROFILE\Zomboid"
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

$stamp  = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$remote = "$DevPath/live-$stamp.txt"

Write-Host "streaming $console"
Write-Host "        -> ${DevHost}:$remote"
Write-Host "Ctrl+C to stop." -ForegroundColor Green
Write-Host ""

$first = $true
while ($true) {
    try {
        # First attempt sends the file so far and then follows, so the session
        # start is included. A reconnect sends only new lines, or the whole log
        # would be duplicated into the stream every time the link blips.
        if ($first) {
            Get-Content $console -Wait -Encoding UTF8 |
                ssh $DevHost "cat >> '$remote'"
        } else {
            Get-Content $console -Wait -Tail 0 -Encoding UTF8 |
                ssh $DevHost "cat >> '$remote'"
        }
    } catch {
        Write-Host "stream interrupted: $($_.Exception.Message)" -ForegroundColor Yellow
    }

    # Reaching here means ssh exited: the link dropped, or the game closed and
    # the file handle went away. Retry rather than dying, so a brief network
    # blip does not end the session's logging.
    $first = $false
    Write-Host "reconnecting in 3s ..." -ForegroundColor Yellow
    Start-Sleep -Seconds 3
}
